Return-Path: <linuxppc-dev+bounces-8575-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73744AB6D23
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 15:47:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyF570QBGz2yyd;
	Wed, 14 May 2025 23:47:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747230427;
	cv=none; b=IemBNTIH+6q+xdNfe2qYb//MxiRP55lVcladMpz3cxlMCWUl/DULXrCYNjKGaLusfL7QDgjDLRtwBkC35g7Tf1IdvUQY8PbEmrdZXJrFbhUGpgPSlznotzcvSSKc+vwaHbGZIXS6kpT2wEKfir76epqNIpouSGyyD/jvLRTCtH9opjNVS4PkQ0cDlQzFvYvFEF/+4eT9wlWhfjz2dwm5Be6g+j6Dk3lvyKKFesTgkeoLAAo3/JSIc2ulB2+6HhLR4BC+B9hvv1dl9f+M+JwvkPOeNRQl1HX8tvJrbexqlylZBSZPUraEY4pBqxkwV6G7SO1B+zFllsj2ldvlASKgkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747230427; c=relaxed/relaxed;
	bh=3VsEn91YkrzZR4A/Mgdq4+jTVTrvyIrxkItYrsxgKtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Hi9yFYOWLTDPtjsf3fIBKBYk22DyegXadsNJyQlTuQ7vwCjRqZum8QN1Nf3t4JE3zhUzKQQ9oGBvGrFod+Wa7MpHj4TwLYhZa4xUiaTwylk2FCfS9RgQLRkshj3+fG1J8l4BED1sX9a6zu7FDg3dYOlAKTkzegDGSy90JqLmmDShR9uh6eN+obLn6hSnuhPqp9Dud7bdC9/+9A33VV8tFBhJL2stHCr/9sE14LQFw0sWUy5i/kZMUDgc3jIYXdDUG9+0vYv/8LxGolqLJDQtG3Wu4HGFPts/hzLxXVLAZG9Udzz/+Lm6oLgU++QHHgxQZdDLwWzCh5t1Byv4+J0mww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZGWlnG1V; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZGWlnG1V; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZGWlnG1V;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZGWlnG1V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyF561ZkXz2ywC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 23:47:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747230423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3VsEn91YkrzZR4A/Mgdq4+jTVTrvyIrxkItYrsxgKtg=;
	b=ZGWlnG1VmFUXk4qDVZBP6g3zvhzVup4kDs1+uP02d6dVwTeec8o10pj+640x1arLYGaF8X
	+C6qFDzIJlMZFEpV5qYN6XNPl/IG84VMWBzMEQRBk85ARuIM7nz4wPA2Wfp9LthE2eVYm2
	uRXyBWn9Z5n+DVTY9xQXFp6Ifx5u/+0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747230423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3VsEn91YkrzZR4A/Mgdq4+jTVTrvyIrxkItYrsxgKtg=;
	b=ZGWlnG1VmFUXk4qDVZBP6g3zvhzVup4kDs1+uP02d6dVwTeec8o10pj+640x1arLYGaF8X
	+C6qFDzIJlMZFEpV5qYN6XNPl/IG84VMWBzMEQRBk85ARuIM7nz4wPA2Wfp9LthE2eVYm2
	uRXyBWn9Z5n+DVTY9xQXFp6Ifx5u/+0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-A0g-qPvgMj-n-Bkps_nmNg-1; Wed, 14 May 2025 09:47:01 -0400
X-MC-Unique: A0g-qPvgMj-n-Bkps_nmNg-1
X-Mimecast-MFC-AGG-ID: A0g-qPvgMj-n-Bkps_nmNg_1747230420
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a1f9ddf04bso3256652f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 06:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747230420; x=1747835220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3VsEn91YkrzZR4A/Mgdq4+jTVTrvyIrxkItYrsxgKtg=;
        b=poakHKrsnzwenY6881humDQtZkyXuZX1da2dNSUwfqSPqSMMT/iz/Dl/CUnGl/Vtbr
         Zy/DlQ7VAXo9Gg3kp0NorbxR77i1S/ffFBZYFOFmms65wiheHNtlac2X2Nfndiac31vh
         +Z+47fiPTsA0YifyrD4VSsnIpXpi/0/vWJ0LQo5d3TnojBDz2oh92SPbLsTmNXcxouF/
         M4HrZHyDDh7FjQu2fHF5mkmnCXWF7pE2RP6ZNNOvDdyy9DRi2kdLhyCEVAztlchekogg
         SB2sNfozx+PxlTgep8UheSX3RaiBWD9dEpDbUXAHOvSMtFQCy6RuRkTqEtrx+V9myKX5
         61nw==
X-Gm-Message-State: AOJu0Yxwe9BjrJZbURDxf+qBx0Ho+42x4nw+5oLkRdP1iHu8Fb0Y7hKE
	InWsghM90kRO4u3FHzrtHQxuv+I3MsLOjdf7zSQVfjV51qKX5Z1oAYpAh+AsHkAxklsnCq0x2OS
	vel5dRR9i1rrZKpbjpbt1lyLhnPF+O8MoWNhr4t4LKzK/IqpPBpDKC7Upw5vgD5A=
X-Gm-Gg: ASbGncs3Ft7qUDTLnWG5zOO/li/MIqnSVRQdcWYSSr3xMgOPe1AnRNF1+cN4NCQHubm
	tsTd5rVoGeeC2e3UOZYu9ayRKyXz4/V8LXu7j+LfAfWfBMz9JpdmUdgxSIFU9Q6ehigTbqV4g6Z
	tbKqsEcO7aU7Z6gmKzb+oxagpl8CpF7kk+Lsv0jHAey+bkdMkmtgoqUl36PU6Gfw9E+nqQwWckJ
	l6UOyRwXYYG6tm49+OwvKm/LjwJXiXmuP/dpsyd6iBKYfp9wqViY3Kvxbm4wH146g1LN+G9bJRO
	DOZkMbUR4aEI9DQVOM0=
X-Received: by 2002:a5d:5984:0:b0:39c:1f0e:95af with SMTP id ffacd0b85a97d-3a349692f80mr3135010f8f.3.1747230420272;
        Wed, 14 May 2025 06:47:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoc6LO6mZQx8sKJqh9QUjXYKR9LRINtpfPETsiwGKeOEbzsErQvmB2khpdwpBUj9goJyxn6Q==
X-Received: by 2002:a5d:5984:0:b0:39c:1f0e:95af with SMTP id ffacd0b85a97d-3a349692f80mr3134960f8f.3.1747230419676;
        Wed, 14 May 2025 06:46:59 -0700 (PDT)
Received: from stex1.redhat.com ([193.207.148.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f396asm20150675f8f.59.2025.05.14.06.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 06:46:58 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-integrity@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v5 3/4] tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
Date: Wed, 14 May 2025 15:46:29 +0200
Message-ID: <20250514134630.137621-4-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514134630.137621-1-sgarzare@redhat.com>
References: <20250514134630.137621-1-sgarzare@redhat.com>
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
X-Mimecast-MFC-PROC-ID: SHwxZNIsiZ6VNs4LckFp1GhOrm-nCdYFax2d9943mz4_1747230420
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
v5:
- changed order and parameter names to match tpm_try_transmit() [Jarkko]
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
index dbad83bf798e..4e63c30aeaf1 100644
--- a/drivers/char/tpm/tpm_ftpm_tee.c
+++ b/drivers/char/tpm/tpm_ftpm_tee.c
@@ -31,47 +31,19 @@ static const uuid_t ftpm_ta_uuid =
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
+ * @buf:	the buffer to send and to store the response.
  * @bufsiz:	the size of the buffer.
- * @len:	the number of bytes to send.
+ * @cmd_len:	the number of bytes to send.
  *
  * Return:
- *	In case of success, returns 0.
+ *	In case of success, returns the number of bytes received.
  *	On failure, -errno
  */
 static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
-				size_t len)
+				size_t cmd_len)
 {
 	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
 	size_t resp_len;
@@ -82,16 +54,15 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
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
@@ -105,7 +76,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
 		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
 		.u.memref = {
 			.shm = shm,
-			.size = len,
+			.size = cmd_len,
 			.shm_offs = 0,
 		},
 	};
@@ -117,7 +88,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
 		return PTR_ERR(temp_buf);
 	}
 	memset(temp_buf, 0, (MAX_COMMAND_SIZE + MAX_RESPONSE_SIZE));
-	memcpy(temp_buf, buf, len);
+	memcpy(temp_buf, buf, cmd_len);
 
 	command_params[1] = (struct tee_param) {
 		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
@@ -158,17 +129,20 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
 			__func__, resp_len);
 		return -EIO;
 	}
+	if (resp_len > bufsiz) {
+		dev_err(&chip->dev,
+			"%s: resp_len=%zd exceeds bufsiz=%zd\n",
+			__func__, resp_len, bufsiz);
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


