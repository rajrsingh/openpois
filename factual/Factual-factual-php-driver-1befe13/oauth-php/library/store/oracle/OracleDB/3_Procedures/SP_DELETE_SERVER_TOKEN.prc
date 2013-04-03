CREATE OR REPLACE PROCEDURE SP_DELETE_SERVER_TOKEN
(
P_CONSUMER_KEY      IN        VARCHAR2,
P_USER_ID           IN        NUMBER,
P_TOKEN             IN        VARCHAR2,
P_USER_IS_ADMIN     IN        NUMBER, --0:NO; 1:YES
P_RESULT            OUT       NUMBER
)
AS
 
 --  Delete a token we obtained from a server.

BEGIN
P_RESULT := 0;

IF P_USER_IS_ADMIN = 1 THEN
 
  DELETE FROM OAUTH_CONSUMER_TOKEN
  WHERE OCT_TOKEN	= P_TOKEN
  AND OCT_OCR_ID_REF IN (SELECT OCR_ID FROM OAUTH_CONSUMER_REGISTRY WHERE OCR_CONSUMER_KEY = P_CONSUMER_KEY); 
  
ELSIF P_USER_IS_ADMIN = 0 THEN
 
  DELETE FROM OAUTH_CONSUMER_TOKEN
  WHERE OCT_TOKEN	= P_TOKEN
  AND OCT_USA_ID_REF	= P_USER_ID
  AND OCT_OCR_ID_REF IN (SELECT OCR_ID FROM OAUTH_CONSUMER_REGISTRY WHERE OCR_CONSUMER_KEY = P_CONSUMER_KEY); 
  
END IF;
     
EXCEPTION
WHEN OTHERS THEN
-- CALL THE FUNCTION TO LOG ERRORS
ROLLBACK;
P_RESULT := 1; -- ERROR
END;
/
