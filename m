Return-Path: <linuxppc-dev+bounces-9587-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E76AE1B7F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jun 2025 15:09:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNyTz6VJzz30T3;
	Fri, 20 Jun 2025 23:08:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750424935;
	cv=none; b=K9pzPKE9wt8PtRn48bqYd5Yvm5+/IMHS48OPSxZabDzdAQZ9M0F4DknaaqlkzTFG6Au2+30JSEjqI9Bu0uHealSI5Wvwlc2goJycIqIkIOrlehxoygcGd0/qhDHGLmmzVrFDYNdcrWAGPzCg6VHsj6j4VNe9Ay8Yj47Moe+7nKX5KivqFQBnlknYgV/1p+rbmoVohuuc2DbPqmk8raXmP6Nas6KanLtRQIFuR9VglcpKmpaYoOB7PbL9umlitIKaha/HPmr1oClSyi1CA8lQCq2Z0CBcaDWoj2+ScTtj1TyGWyX4WMEd0A4g/TtIeWGmSrYy54H93osel93r6I4CiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750424935; c=relaxed/relaxed;
	bh=3VsEn91YkrzZR4A/Mgdq4+jTVTrvyIrxkItYrsxgKtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=AvVkh5UtlowPVpiJPBsNMSYdjw/p6jiiDN70UGZSQZH5ah3Mw53+tZZ1hToM4UUKcvIlugcuZ0Opxyuz18MID69E/BIzXEdByv3/z3ZrcXxVwI7iokWpUbAO0gFu0JuFS+BViBtR9FNV8Gs0XZeLRg5+YfciIMoBZuD3bPjJaqScfWd3kYDifNgv7/hFge7Qk05ugirRFlqklQdmCJuCEMRqL/bpXU04TzcUptolqKE483eOggyAe/zfvGefpBWItWlb5Yk79OyfNcuuHxw2hJFlUCPSZ6NN7qUXcnc2UJ+YlJ3Sx3jMkI9iw3BZF94bo3iuaxSfVoiWCugCgrT8bA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FvkW7g3j; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FvkW7g3j; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FvkW7g3j;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FvkW7g3j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNyTz0JFrz2y2B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 23:08:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750424932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3VsEn91YkrzZR4A/Mgdq4+jTVTrvyIrxkItYrsxgKtg=;
	b=FvkW7g3jpwEeVONdYDNDiS7H/6UDOYy+7jGKCsyP/fnTvyoeDPEGsEpmlGwoF49v7KFZyi
	JiBtoLlyIov6618IPQpHLIhyMNJYRc1t9lDO8ZaY2gc9kTyfigS5mLlYquzTPjFTn2nOKQ
	2ExsbOEMFxU97pMpe2sEwufGM5APoD0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750424932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3VsEn91YkrzZR4A/Mgdq4+jTVTrvyIrxkItYrsxgKtg=;
	b=FvkW7g3jpwEeVONdYDNDiS7H/6UDOYy+7jGKCsyP/fnTvyoeDPEGsEpmlGwoF49v7KFZyi
	JiBtoLlyIov6618IPQpHLIhyMNJYRc1t9lDO8ZaY2gc9kTyfigS5mLlYquzTPjFTn2nOKQ
	2ExsbOEMFxU97pMpe2sEwufGM5APoD0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-cAMuFE6TOsKp_cMWzV7Zhg-1; Fri, 20 Jun 2025 09:08:51 -0400
X-MC-Unique: cAMuFE6TOsKp_cMWzV7Zhg-1
X-Mimecast-MFC-AGG-ID: cAMuFE6TOsKp_cMWzV7Zhg_1750424930
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a58939191eso891457f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 06:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424930; x=1751029730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3VsEn91YkrzZR4A/Mgdq4+jTVTrvyIrxkItYrsxgKtg=;
        b=K53DveJwTRFpL1hNACwkb2Z3ky6TKdOAb3aslcfqQfHP5GmEqaa8WmwJ3oGdrXQkzw
         ks8EHhDr5K59GtmsiqcFTHzxzbIpKE/bZPUWL0mOFMN/Lc37HNELAYnTt3TOu3wj0Xf4
         hp6T8/t0lF8KwWxpJxBIe27xGRj5RwaF2tM0Wv6J3svD3yCpcb5v1bmR4j6HvbLdsuk/
         R+ZZJERbA4yJyE/0UPtFWaIVW+CMEUhj+Ew0uvxJUvG35uafyC1ks6dD3zysp8RB2+lm
         IjVKylJk95NV4tt8OS5kV3zSFsYgvz+0d8MC7/wLStqsSfW5muRcUpidQVwMjHRq8cwc
         RTbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt+pXegDTMLkD6zxMnJl0BLzPXJTmjIKKhr9yuDsD60faxotpIHLSupL+uZwJFzLpyiEKmN37kTCnvXsU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzw5cpyRxfBLJFK+uoCZMMyeNUFtMJsWIRrTl18pRTEcTaZUFa0
	8cdhtU4goW2uu9mG2qdG3Zl3tbJ/9XN8ZM8No2S1YTHWV0PS+xrICX++0MSEDv3vHgfWuLwv6iS
	GnsJfP4mi3yjVkbgekR39n1fdTSI7eRr8jsGUcUTrnZIOn0CJOAW+kNWv8LiaBW3fqI0=
X-Gm-Gg: ASbGncs8/g1nSn+HZlOiakNef/scef6HDd7DqU50fiSKezsr6Y3uGw3oSd8vkKtF/LA
	BLpUr8I4YbTnU6dvMWL+Rleq8+zJStMx4dOfpoLVT5oIuO5iaynR1kC1iUmK8RVPW9dvM2ykYI8
	leRYse5EogNRxhJY9VrnyvHeR8ic9hHK1ODxf+9mKIMExo0XsIf4R2IoRU3IGGZW5bR51pcfHuS
	7AY1Nw8ERZfljlEdMwsTe9ZxGHg/owmHTD8rOKJDjabjx5tJutMiHE4jeS4X1xHCXXMxze0GNoF
	gACaIMZnIGqzL5gyy5O8GuYIVhT+tWtA30A=
X-Received: by 2002:a05:6000:2484:b0:3a4:ddde:13e4 with SMTP id ffacd0b85a97d-3a6d12eb394mr2179376f8f.58.1750424929595;
        Fri, 20 Jun 2025 06:08:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6J1XzXAkrwIk+wJqXhYpgZ7P5H+/wRdPeseCTHYPIt8eTkRipb+nkvNVEX6eFh42F8eJ+sA==
X-Received: by 2002:a05:6000:2484:b0:3a4:ddde:13e4 with SMTP id ffacd0b85a97d-3a6d12eb394mr2179299f8f.58.1750424928851;
        Fri, 20 Jun 2025 06:08:48 -0700 (PDT)
Received: from localhost.localdomain ([193.207.146.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d11909f4sm2017336f8f.88.2025.06.20.06.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:08:48 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Naveen N Rao <naveen@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	linux-integrity@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v6 3/4] tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
Date: Fri, 20 Jun 2025 15:08:09 +0200
Message-ID: <20250620130810.99069-4-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130810.99069-1-sgarzare@redhat.com>
References: <20250620130810.99069-1-sgarzare@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 4doqvSHBScK5MNt4IRo0iYZmfd8hXWfC_L7Ui3-tDbE_1750424930
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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


