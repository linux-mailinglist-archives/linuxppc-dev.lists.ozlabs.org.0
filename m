Return-Path: <linuxppc-dev+bounces-7653-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC76A885F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Apr 2025 16:57:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zbr4G6sN1z3bdD;
	Tue, 15 Apr 2025 00:57:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744642654;
	cv=none; b=UW1CNkOmqhqiETzrxqrVgHNRNbkga4/e9HkqJisEWLxWG7P9xeJ+Z3y1eNNuXdI+JEdaMqUAaTALNkaqDiGFm0fk3irf3ZB6yrPFEBdt+JqtNF/2NSGs61hafq3KG6YQ2+bj0rlEHebVhk8egOYNsgiq7ZRUFbLhPDZy25u4dASyMO9yHhc3JVubUvgSyNawr9p20GCiJe2eqHAo/kbhqrQQ/6Mn5Orfss/Httqm9R+nNWtMzByo00gNHYrJy1Z3lrjy48MX1wwrMM3HZygM9U/vDXidMfHmX56GQBuABWJld55bIHUsag4bw3q9qzk3ls+t80RBa8GUutYxWAKmjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744642654; c=relaxed/relaxed;
	bh=TEdsN0QQfHEZyuRksboskfejhwkQQL9RrSRK2ZgyfhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=FSS0LR4CQbNXeBVvQYmdCGXv6L9ImcNYDFIGVtLNwpcqcer1cjjTVnm2nN/Armj24JbEb2HuER45/WbSzJAkG2S44rnbMMnXUTSC50b+b9achJb+R5lUUZf2f2R7sZ4LZ9C8cyDlU7c6ZrMTVNHsBkU/qjhEqJO1zO2+IIzoFsnvgJu1RAiZ2PGgUjoahpdrq5WeO3ZGBxu2wcU0lXY3spwkIsIpkYZUwyE8TWDQ9sm8FwzxPFcHpph+NKO7db3tJetMnwoRBwQcHIYArvOk0kKW7+lPp7PLyTywDghmPlwtS5vSSNyFioVZR0Kjt3x0TApqqsaavRLYpBz9Fy5gqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CDgK2z2t; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CDgK2z2t; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CDgK2z2t;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CDgK2z2t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zbr4F6z9hz3bZs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Apr 2025 00:57:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744642651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TEdsN0QQfHEZyuRksboskfejhwkQQL9RrSRK2ZgyfhY=;
	b=CDgK2z2tjjnr5/X1lGnOegO7rXvO2p0+WX8ZRgdmA5j3BAcieBTp7ycdYlzVPyqq23KZbw
	3wG4KqDVYn2Or0/gW6VZV5ALy0eGO/I91dxVbrcJenKvABJTr8Ig9JwxCnfSrLMg8Odq+r
	UMp0bACXI4nYXqkItAcyJpdSbNh0EVw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744642651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TEdsN0QQfHEZyuRksboskfejhwkQQL9RrSRK2ZgyfhY=;
	b=CDgK2z2tjjnr5/X1lGnOegO7rXvO2p0+WX8ZRgdmA5j3BAcieBTp7ycdYlzVPyqq23KZbw
	3wG4KqDVYn2Or0/gW6VZV5ALy0eGO/I91dxVbrcJenKvABJTr8Ig9JwxCnfSrLMg8Odq+r
	UMp0bACXI4nYXqkItAcyJpdSbNh0EVw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-dONx3ARXNEmhHRkxTytGRg-1; Mon, 14 Apr 2025 10:57:28 -0400
X-MC-Unique: dONx3ARXNEmhHRkxTytGRg-1
X-Mimecast-MFC-AGG-ID: dONx3ARXNEmhHRkxTytGRg_1744642647
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912539665cso2786345f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Apr 2025 07:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642647; x=1745247447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEdsN0QQfHEZyuRksboskfejhwkQQL9RrSRK2ZgyfhY=;
        b=kxgbLc57y8yyovoNprT7eWnXPLhSbrp88wRZlZ5bZTSQ6G/2Os6uo4ZEusNZvIfv7e
         svuvu9c6jyua2csCLXEr/ha7jVU4x4QiORP4sK129jJ9UJI3p33vMYao7uvIkAL/OwAc
         avUol8E2qC98eAUC7ehcpKRdvBr8gMWgwy1Ny+GjIgNqCdoN7iGqqa4ZDLzBSlB8wjrx
         cVkr1plr6DmVJYEeA5uTMvZPW2DjXtBlMBzmktQ2hGW2P8hI16jiqwX0TouyCnbOXRgg
         ZrCpt9tTYsOSSNq0bLtyEUkPS7mXILo8krqxYeSFpeo7aWKn+Y1wkWedpjKzv2M243L4
         TwLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu/S6hf50hR/CfrYX9cdibQ5yP5k0tJ7XkifcgQkRid1Sd2n7GKEGip9Hd+44mpN5p8Kgp5H7CFOluChc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyZX2pV2KSiyN5t+Rk5JyjwftcGdyF/i2ihwfPhJKEv/kcCN4HH
	B11K6QAZmd6/4k2zWZOBW1Nni1CAm61MyQ5xwa9+uGT6es8bnv5WO980oh+OYibeX5erq9Nf896
	M4OP0oX4YycTqLtu3ctqiCTsxv0HB+C3ZeQyU1+K4KiQk00dfDh9Mf+KNssG7Y7I=
X-Gm-Gg: ASbGncsIPrZRnJ0erGJbzxLUobwi7Bq/o6p6jYyuXSRm1aEmrEk/jkXgzKBe3N4J+b1
	dpD92Cu2l65o6eZf2XtxkGzkAz+r/hP+9HUIYOjiZ5QOOrLZnSxaqasTaPw0aTNoyTGGSxFNcBn
	X378eJ7ITT2n1cQXqSk7MrQLGysDbp9pipnGZ+6rB2W1V3O7wPb4VqY3ZYr3eGwsnazYv/MO5sj
	VqT3A6/fOJcJXNjddDtHAqy/nXz1E9IvkIIFFqxiYgqAPwpbgzNbzFASF6I3Dokr9BZPHkRWS3/
	70Ypi/FeeD8xNDe0vjYZ4b9+
X-Received: by 2002:a05:600c:3c84:b0:439:91c7:895a with SMTP id 5b1f17b1804b1-43f2ea651bcmr156784695e9.7.1744642647227;
        Mon, 14 Apr 2025 07:57:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEApvHF30zJot3Tdd63G9ANE7NhVcm3CdypTeNAQ4xjY84TRnswJTqy6gQmM2qCnJiia7ICYg==
X-Received: by 2002:a05:600c:3c84:b0:439:91c7:895a with SMTP id 5b1f17b1804b1-43f2ea651bcmr156784335e9.7.1744642646611;
        Mon, 14 Apr 2025 07:57:26 -0700 (PDT)
Received: from localhost.localdomain ([193.207.151.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9797aasm11333393f8f.56.2025.04.14.07.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:57:24 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Peter Huewe <peterhuewe@gmx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sumit Garg <sumit.garg@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v3 3/4] tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
Date: Mon, 14 Apr 2025 16:56:52 +0200
Message-ID: <20250414145653.239081-4-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414145653.239081-1-sgarzare@redhat.com>
References: <20250414145653.239081-1-sgarzare@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FSANylnbFg59wf2wFIbqGc79iWaPFq8p6xFS5cuQlIM_1744642647
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Stefano Garzarella <sgarzare@redhat.com>

This driver does not support interrupts, and receiving the response is
synchronous with sending the command.

So we can set TPM_CHIP_FLAG_SYNC to support synchronous send() and
return responses in the same buffer used for commands. This way we
don't need the 4KB internal buffer used to cache the response before
.send() and .recv(). Also we don't need to implement recv() op.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v2:
- set TPM_CHIP_FLAG_SYNC and support it in the new send()
- removed Jens' T-b
v1:
- added Jens' T-b
---
 drivers/char/tpm/tpm_ftpm_tee.h |  4 ---
 drivers/char/tpm/tpm_ftpm_tee.c | 64 ++++++++++-----------------------
 2 files changed, 19 insertions(+), 49 deletions(-)

diff --git a/drivers/char/tpm/tpm_ftpm_tee.h b/drivers/char/tpm/tpm_ftpm_tee.h
index e39903b7ea07..8d5c3f0d2879 100644
--- a/drivers/char/tpm/tpm_ftpm_tee.h
+++ b/drivers/char/tpm/tpm_ftpm_tee.h
@@ -22,16 +22,12 @@
  * struct ftpm_tee_private - fTPM's private data
  * @chip:     struct tpm_chip instance registered with tpm framework.
  * @session:  fTPM TA session identifier.
- * @resp_len: cached response buffer length.
- * @resp_buf: cached response buffer.
  * @ctx:      TEE context handler.
  * @shm:      Memory pool shared with fTPM TA in TEE.
  */
 struct ftpm_tee_private {
 	struct tpm_chip *chip;
 	u32 session;
-	size_t resp_len;
-	u8 resp_buf[MAX_RESPONSE_SIZE];
 	struct tee_context *ctx;
 	struct tee_shm *shm;
 };
diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_tee.c
index 637cc8b6599e..b9adc040ca6d 100644
--- a/drivers/char/tpm/tpm_ftpm_tee.c
+++ b/drivers/char/tpm/tpm_ftpm_tee.c
@@ -31,46 +31,18 @@ static const uuid_t ftpm_ta_uuid =
 		  0x82, 0xCB, 0x34, 0x3F, 0xB7, 0xF3, 0x78, 0x96);
 
 /**
- * ftpm_tee_tpm_op_recv() - retrieve fTPM response.
- * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h.
- * @buf:	the buffer to store data.
- * @count:	the number of bytes to read.
- *
- * Return:
- *	In case of success the number of bytes received.
- *	On failure, -errno.
- */
-static int ftpm_tee_tpm_op_recv(struct tpm_chip *chip, u8 *buf, size_t count)
-{
-	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
-	size_t len;
-
-	len = pvt_data->resp_len;
-	if (count < len) {
-		dev_err(&chip->dev,
-			"%s: Invalid size in recv: count=%zd, resp_len=%zd\n",
-			__func__, count, len);
-		return -EIO;
-	}
-
-	memcpy(buf, pvt_data->resp_buf, len);
-	pvt_data->resp_len = 0;
-
-	return len;
-}
-
-/**
- * ftpm_tee_tpm_op_send() - send TPM commands through the TEE shared memory.
+ * ftpm_tee_tpm_op_send() - send TPM commands through the TEE shared memory
+ * and retrieve the response.
  * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h
- * @buf:	the buffer to send.
- * @len:	the number of bytes to send.
+ * @buf:	the buffer to send and to store the response.
+ * @cmd_len:	the number of bytes to send.
  * @buf_size:	the size of the buffer.
  *
  * Return:
- *	In case of success, returns 0.
+ *	In case of success, returns the number of bytes received.
  *	On failure, -errno
  */
-static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
+static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
 				size_t buf_size)
 {
 	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
@@ -82,16 +54,15 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
 	struct tee_param command_params[4];
 	struct tee_shm *shm = pvt_data->shm;
 
-	if (len > MAX_COMMAND_SIZE) {
+	if (cmd_len > MAX_COMMAND_SIZE) {
 		dev_err(&chip->dev,
 			"%s: len=%zd exceeds MAX_COMMAND_SIZE supported by fTPM TA\n",
-			__func__, len);
+			__func__, cmd_len);
 		return -EIO;
 	}
 
 	memset(&transceive_args, 0, sizeof(transceive_args));
 	memset(command_params, 0, sizeof(command_params));
-	pvt_data->resp_len = 0;
 
 	/* Invoke FTPM_OPTEE_TA_SUBMIT_COMMAND function of fTPM TA */
 	transceive_args = (struct tee_ioctl_invoke_arg) {
@@ -105,7 +76,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
 		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
 		.u.memref = {
 			.shm = shm,
-			.size = len,
+			.size = cmd_len,
 			.shm_offs = 0,
 		},
 	};
@@ -117,7 +88,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
 		return PTR_ERR(temp_buf);
 	}
 	memset(temp_buf, 0, (MAX_COMMAND_SIZE + MAX_RESPONSE_SIZE));
-	memcpy(temp_buf, buf, len);
+	memcpy(temp_buf, buf, cmd_len);
 
 	command_params[1] = (struct tee_param) {
 		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
@@ -158,17 +129,20 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
 			__func__, resp_len);
 		return -EIO;
 	}
+	if (resp_len > buf_size) {
+		dev_err(&chip->dev,
+			"%s: resp_len=%zd exceeds buf_size=%zd\n",
+			__func__, resp_len, buf_size);
+		return -EIO;
+	}
 
-	/* sanity checks look good, cache the response */
-	memcpy(pvt_data->resp_buf, temp_buf, resp_len);
-	pvt_data->resp_len = resp_len;
+	memcpy(buf, temp_buf, resp_len);
 
-	return 0;
+	return resp_len;
 }
 
 static const struct tpm_class_ops ftpm_tee_tpm_ops = {
 	.flags = TPM_OPS_AUTO_STARTUP,
-	.recv = ftpm_tee_tpm_op_recv,
 	.send = ftpm_tee_tpm_op_send,
 };
 
@@ -253,7 +227,7 @@ static int ftpm_tee_probe(struct device *dev)
 	}
 
 	pvt_data->chip = chip;
-	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2;
+	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2 | TPM_CHIP_FLAG_SYNC;
 
 	/* Create a character device for the fTPM */
 	rc = tpm_chip_register(pvt_data->chip);
-- 
2.49.0


