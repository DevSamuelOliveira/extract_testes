require 'aws-sdk'

=begin

#Faz conexão com a s3 para criação, exlusão de buckets e upload de arquivos

s3 = Aws::S3::Resource.new(
    region: 'us-west-2',
    access_key_id: 'key',
    secret_access_key: 'key'
)

bucket = s3.bucket("extrair") #object que é refenciado com a variavel s3 e pega como parametro o nome que o bucket
publico sera criado. OBS: a bucket tem que ser criada assim para poder ser extraida depois. Ou tornala publica na aws
bucket.create #Aplica a criação

name = File.basename 'path absoluto' #pega o nome do arquivo
obj = s3.bucket('nome do bucket').object('nome do objeto(como ele vai ficar lá no s3') #cria uma conexão com o objeto para fazer upload
obj.upload_file('path completo(já pegado na variavel name)') #faz upload do arquivo

=end

client = Aws::Textract::Client.new({ #Faz uma conexão com a aws usando o Textract. Obs: só esta funcionando a região aplicada.
    region: 'us-west-2',
    access_key_id: 'key',
    secret_access_key: 'key'
})

client.start_document_text_detection({ #inicia uma detecção assincrona e retorna um objeto job_id
    document_location: { # required
      s3_object: {
        bucket: "extrair",
        name: "Curriculo_Samuel.pdf",
      }
    }
})
