Return-Path: <linuxppc-dev+bounces-8464-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 754A0AB0DEC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 10:57:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zv2vd2ZDbz30V7;
	Fri,  9 May 2025 18:57:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746781069;
	cv=none; b=L3pHJMTItJSE9DWFtZCZ/TNB1OGQEkPdJZ50bBBU2okb0qT2TtBa+9LtONHv1/7pcxBDENE/l0PD2/8KjZE2ONP8kZ9TOze2jJU2UeviQ88ctSqMluvn3JC5guz8+edx8YBIkOsQreFbPHjcPU13wl0/SoU+MzT2IfIzZY0zUJZHgFIjDp3FJzHE6EjhWCig+zDjKR9xFRLy8LqcUYSqmH9qHz1EN7i+FZhIG6/SocUnxxSHQI9exyAd22udetmEUqXLrqLaHy30u196+/9A+tReA91rwp/t+IhOIso10YXvwpyLJwYb7e6z8CfHQJtuIJgtSJ5KNT8ypswhRHGAeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746781069; c=relaxed/relaxed;
	bh=W3ofDnttG+IcV97+q22PXfMYawWC2pHrgGwgSXYdvb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=g09ufMouL3JrslrJQ6aQCjz/dGsd1aVMSqaHEruCKFj5VUOhRstEUwnRtHfKc0Pla+Tait23G8w+PLJRYlNrj9t9+XVzaknTbbKeyoQlh/e9W2ABlAcfN3Z1eBzgTkGbKSOMqn83Jnnvxx13+4mHWBWS0yeCqiHsMiWBd0RtxtDHoxw3MI9mRHLZNyv/JR/KsMG/Fd8CglThE1rnszqA5BTo6BPx2M1upC6icLz/bdQVkNyNXMx02GER2KtrqQ6ek6TC7fwD5Mh2km+XqfBE2jXiClHuu+kMyZ+eD30TLQLpBqei4xAmRYJ0WGQCryXvMd+PsrQry75BMhX/0Dk2oQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AtXHhuVo; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AtXHhuVo; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AtXHhuVo;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AtXHhuVo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zv2vc3SHPz2ySf
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 18:57:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746781065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W3ofDnttG+IcV97+q22PXfMYawWC2pHrgGwgSXYdvb8=;
	b=AtXHhuVo8EC0a7DPxH03ngmW8Ivl2usvegWNbBzDlu3tUJ7g42e737qE9uank5eZ5xaFdr
	TuakrLkIz44DD4qTrE2OwTZkyArzfsjlrCz+2K5F7ZtTfkuHxi4cnFfB1AjAokOq+0i7Lx
	rbn01KYIZs9MV7KVQbTRc4d98b/Nthk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746781065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W3ofDnttG+IcV97+q22PXfMYawWC2pHrgGwgSXYdvb8=;
	b=AtXHhuVo8EC0a7DPxH03ngmW8Ivl2usvegWNbBzDlu3tUJ7g42e737qE9uank5eZ5xaFdr
	TuakrLkIz44DD4qTrE2OwTZkyArzfsjlrCz+2K5F7ZtTfkuHxi4cnFfB1AjAokOq+0i7Lx
	rbn01KYIZs9MV7KVQbTRc4d98b/Nthk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-1BNolX9FNfGo_bakGXpugA-1; Fri, 09 May 2025 04:57:44 -0400
X-MC-Unique: 1BNolX9FNfGo_bakGXpugA-1
X-Mimecast-MFC-AGG-ID: 1BNolX9FNfGo_bakGXpugA_1746781063
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac6a0443bafso130644766b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 May 2025 01:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781063; x=1747385863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W3ofDnttG+IcV97+q22PXfMYawWC2pHrgGwgSXYdvb8=;
        b=ko7vb6O6AqHPnVsOj8LRBcmlpzCdqaKcDhV9gMH2UM5pyC0YRFfEiom93UCIUCj2nn
         0KIJMzazCvEDo8Y5d9/87T4qGLjuqi0KRXATmJjUzVdzEpiqE7nNo0c9P3zz+5W/k9CC
         Hz/7DV9hetFaiX6npiprOJVFCHR8BxqFc9u2pNyQ9xbVhVuJCAN9qcwWOv87GEO+8CMa
         HoslFr6w3cS4geyjg4ev3Q/oOUdHfgWqh7WCn/rt5TQVwu1dqwKISEMrLg4IyKbH3J3T
         +7JHs99M38D07LOFHQpqFlmu+Z/Xx8zs8Du0Z7C3wyPNJWH0fKlO/btSZNZ51XP4w2GM
         DRJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUThZDNJL9IgbQ/EfP71lfSmqZ5zOdnJ2LSmqUsn0GtBHk1LKv2E7w+rGS1komUeyxgws5tCqRSRm8nsb0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywqrp7iZUcqp1JSrZYaGfUmZvFZyRjHHNSdXmSBSWMl4/ruRzAm
	Uw4zBktgY3pPLYvtXK6Q10z8IgOQ1NmPHH0DwVXvzrkgm/TpR8Pxjlf8OwuHaGjmwJxvn5j+80+
	Yx3PfLUDhiW6uS4DZ1RjAhxs24ZX95rof5b4K04yWfl0h29C8C4fnCz5iDVsdRR0=
X-Gm-Gg: ASbGncudwlA8Ha/UZ4Ryrq8PSD9XzTP20JKp6A3upIgLIcIsLh2l08/XHFe+R74gil/
	htXOyo7HbrZaCr2jFraAphk8ZzXHCotHGnn168LKC/otG52zPWi1Rm0YT7n59Uf1+AzhDkqdteM
	X44rr6HdkjBh7Zjl0TSVjB55rjqM0feSfkrkUbrUZlwRzHhlwWv/HIt7fsGxlDwkjRoDq9BtWpk
	3mw1nggnz+ziuakDN5rX/LNUsMyS+FRNnYC0z+am9dzpDpM3efOpTy+KzB5YUUei6gUZZb9u7Sw
	xlVDMOLpbntx6UhRoQW6OSXfHA==
X-Received: by 2002:a17:907:2d11:b0:acf:6bab:5c4f with SMTP id a640c23a62f3a-ad218f8e98fmr216765366b.23.1746781063063;
        Fri, 09 May 2025 01:57:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMGDwphiNHE/m9JZeYBlYKoN+B4ckHTHfGrZRId6SN32nOHj4ub3aTES86oLCxIEj3HJmHFA==
X-Received: by 2002:a17:907:2d11:b0:acf:6bab:5c4f with SMTP id a640c23a62f3a-ad218f8e98fmr216761866b.23.1746781062467;
        Fri, 09 May 2025 01:57:42 -0700 (PDT)
Received: from localhost.localdomain ([193.207.182.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c81bfsm120144666b.33.2025.05.09.01.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:57:41 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-integrity@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v4 3/4] tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
Date: Fri,  9 May 2025 10:57:12 +0200
Message-ID: <20250509085713.76851-4-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509085713.76851-1-sgarzare@redhat.com>
References: <20250509085713.76851-1-sgarzare@redhat.com>
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
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s5q5uPCIu_A7kQQBFp2TJW8RqagHG_Ctxhb9opPCH-E_1746781063
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Stefano Garzarella <sgarzare@redhat.com>

This driver does not support interrupts, and receiving the response is
synchronous with sending the command.

Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
->send() already fills the provided buffer with a response, and ->recv()
is not implemented.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v4:
- added Sumit's R-b
- reworked commit description [Jarkko]
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


