CREATE INDEX idx_text_vector
	ON tb_post
	USING GIN (text_vector);
