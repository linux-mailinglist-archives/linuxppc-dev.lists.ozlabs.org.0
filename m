Return-Path: <linuxppc-dev+bounces-7521-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B56DA7F7EB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 10:32:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWzpr4l7sz3064;
	Tue,  8 Apr 2025 18:32:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744101156;
	cv=none; b=cCZNJZf9knfYB9KV8KhOohwms+IH6mKg2CYyjzwEYSKeyglZNWurIyzDN6pX0NUSUS801fyvlfq7qZavmuuy7d2Xj0Uhd7WItFZqBgY1XLSsWiRlJBzbxiLRwxI3u3kHdA+fNC5E8LGjnidMyqmydKo4nZeHOvFbAB7Zt9GGfUIm2xM4Log+s0ZwEbUpdwzo/miasYwpYFw2kOhBkKaIEZqq+M7c587uH7QbERbn2Ip+ktJBRKUh8C5f/uHbHsNbdipzpyX8wRvyg7ecyw3TcC7AAxTwp1h4zmPDczhVBORSvNjD7rvc0M9TLqCCuvJvHMrUsXxCW5nbFeVwUGI9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744101156; c=relaxed/relaxed;
	bh=0jjogm03xe8uH9FEbFpCE/wwTjsk8lbbHkAYLp5l0W8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=ZaZfWJXpaJ8XtdceSrMmw4yYQxgKJ35r4d23WcKDexiyGl07AiLLrU10Wa2L1NF4t3F1mzeIahIgXDl+j7VAudU3syzMc9b2H+VF92fCRLgV5Kasng1vS/CvRNy1CBrGH2ss+a/5HBdx66q1jYz2M2HS9X7uAw5fdjCKMekbYZd0atgpxmRzyLoSwJBkwhVsVNYQxwJ/BN3+rq6ljgPAgdYfRV0vH+NzAthnJgePxVuFJHwa+AJvJ5x+QibOq625BaIPBxDBMBjAI0uRaK9LumwjNPa9ySTlzqLqzDFz7tMdLex/BDYgtEeZJWaZ/Degd/3ki9TbN45ieLeZl/5TQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d8WzkGlF; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NsGe27TW; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d8WzkGlF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NsGe27TW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWzpq4TYXz2ygD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 18:32:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744101151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0jjogm03xe8uH9FEbFpCE/wwTjsk8lbbHkAYLp5l0W8=;
	b=d8WzkGlFc38mUjKwacgEf6fGXNnmB6QbNWYlef/IBoI+/zCgepM2b6u9PrHug25LXyFSfC
	5us/RMAfmW17qB8BSg5H0F7Q2s+guRtHYzHm5eQgwJq/lvOVjdbzAA41LeYlh1N84rUKCU
	HzFBo/Eq7q/uemsYOz1dVfsteZXfGRk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744101152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0jjogm03xe8uH9FEbFpCE/wwTjsk8lbbHkAYLp5l0W8=;
	b=NsGe27TWhO8HRxWZ0xQLTY2nIC7Pt20yddD9ocUeoDGCYkT9zLobyy0kLh1EWjrd12rIRS
	vmvjF5iywA1E/L+0fqJFcubYQCqc3mt6XffLIHMtigliskLF2L7o8VZHCb93S0a0q1MkR0
	y+o8gNCsWYkeDvbUewnlv1OJA3eQ9k8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-2l84mtjpMDKU-Q2dockqYA-1; Tue, 08 Apr 2025 04:32:30 -0400
X-MC-Unique: 2l84mtjpMDKU-Q2dockqYA-1
X-Mimecast-MFC-AGG-ID: 2l84mtjpMDKU-Q2dockqYA_1744101147
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43947a0919aso37696895e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Apr 2025 01:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101146; x=1744705946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jjogm03xe8uH9FEbFpCE/wwTjsk8lbbHkAYLp5l0W8=;
        b=T3Z6Tyn/kENUBhS01kYjU0VPhlVUAbAdXld09xOQsZuDDKsFpe0mWVwgJC4xUEmLo/
         nvzDaEP7YpjWMACEOoHqUHKQ9zdemRHNU8pzvh3RYH0TZ9o4qrRdd3T8bUfvPHKtmQnP
         wsO9HVc2AcvEbh8lOaJdtWttMw1ENCjoBqiDFORplNVkBuAfobWrdeZIUHzNaxFhH7ir
         9reJ4gxRE7djfkETNzaHxIFHYd8kaMdtBqrhrzKBX1YJHAD72rkQh924KTdNgv2vDE2c
         J/dX30S/IlThEMfmJSgL1zz+mnv2tINn3PGQs4YQtoeJvyiHRVoOZJ0vgKyNDJFJeL7i
         AKRA==
X-Forwarded-Encrypted: i=1; AJvYcCXndYx2gKtnlZdUO355TqH5AjDedtCis2TGUBnaVIhqgRWvsPtzZi4FXjnpMr2IAxnSm3BliEmUiqFtvsE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx7cJOnNmzyqdn00GbTVgRe7VeculFG6n/nRda0sEmuETHbZcf4
	s+oU7Zu4Hy5KjyZCpxxccFuylptYhyL8iD1I1G77SihqYnydkhf7qfl3tcuLdlmABLTlHYXAoug
	BWB7m60GJHgjmRJDZ0A0k2LQdWwMJyPkIgy64LlVlwjNr7Aez7Vat/+IBid3rJta7vsboMxE=
X-Gm-Gg: ASbGncuFkgZuuPDKZEeDUT7tFX1GrbIEB6Udtf/2fTfnZ9bvjhl+BljDYTa3lMAiXsy
	hJzFs9pZSKgW1AwK53j3SWa3cN+DLIGh1IBgZalf4w5Nq7w2HtJp5pFwlrF1uhx3ERIeO9JYWCs
	nXmouzaqUx5f/kiwAb9ciJeGqVEzXZVd6SFKR1GWHRXD8Lnkd9cUaf1D4KT701rxuB9AMfdZdS3
	lsNHLz+DWyyAI593OXnlx8o/vf9OIBd3ojsR9xCRI++jEajWAH4dlOdo6mVZBw1HjPlZSxHD3vu
	SM+XCx4JYUEqjCAQmicZXv6q2xeqxSREn4hQKsbkqpa+2FjRbNRYTaLFbrtzuexXFw==
X-Received: by 2002:a05:600c:3489:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-43ecf9c77ecmr122637515e9.21.1744101146623;
        Tue, 08 Apr 2025 01:32:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO0mHtfU6tjdIaTwIU3mFKYSEAXTq1PTv+mq26VUWkOFRfaSqPIV+zWD9QaZteOnlwamweeA==
X-Received: by 2002:a05:600c:3489:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-43ecf9c77ecmr122637075e9.21.1744101146092;
        Tue, 08 Apr 2025 01:32:26 -0700 (PDT)
Received: from stex1.redhat.com (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d661sm14565216f8f.66.2025.04.08.01.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:32:25 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sumit Garg <sumit.garg@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-integrity@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v2 3/4] tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
Date: Tue,  8 Apr 2025 10:32:07 +0200
Message-ID: <20250408083208.43512-4-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408083208.43512-1-sgarzare@redhat.com>
References: <20250408083208.43512-1-sgarzare@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 8KWI9t4Zw1TExPdfRMGxmv7oNJSso7hLLs0nH26YfVA_1744101147
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
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
@Jens @Sumit can you test/review this patch again since we changed the
core a bit adding TPM_CHIP_FLAG_SYNC instead of send_recv() op?

Thanks,
Stefano

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


