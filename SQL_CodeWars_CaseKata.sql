
SET @n = 3;
SET @x = 3;
SET @y = 1;

SELECT @n as 'id',
	CASE 
		WHEN 
			@n MOD @x = 0 
			AND 
            @n MOD @y = 0
        THEN True
        ELSE False
	END as 'res'
        