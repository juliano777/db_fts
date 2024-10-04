CREATE INDEX idx_texto_vetor ON tb_post USING GIN (texto_vetor);
