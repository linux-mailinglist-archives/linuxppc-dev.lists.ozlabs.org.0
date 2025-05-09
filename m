Return-Path: <linuxppc-dev+bounces-8462-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3246AB0DE9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 10:57:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zv2vQ1Fs7z30Vl;
	Fri,  9 May 2025 18:57:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746781058;
	cv=none; b=RxrSl1f2Tm9Ugua7K9K4NAr991Kg0f0v4khB7T5Tpf0huyN1pQy0i89pSzNQSSsPEWb5OEj/zAF1ucZfNSyId/UyjW4T8iKlKhAxXbBjH222o5CA9nOR2VYbg2M9DX/+Js2PvC0X93s0sIxJ/NFd2VLJmhtwAzP2u5Q6Joiu6sCcTUy8kQv8pHlNMRCUx0abCHEU5D/hHNG3TCFbxFnHxACDKCP6uxyICIF4hpLwZsR48a2dHOcskdLD8Fv2zhSnv0n03JaA1rjnucJSS6qwJrSPEcyMKJOVSyr2UZXxoApxwoJSgmLMO2ZhCmlbLIjGaWdBEGcUhQpo4Bw7JSWBug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746781058; c=relaxed/relaxed;
	bh=1s3Je0ZFPe8U1bt0sD5VWH0wDBbOn/omwkgu7nK9eko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=hkvBVCWpJPlPEkJbC/OV23NUAUqG+hd9WENFt4A//f5f//XCt2uCJmy2N1Y92+HO1onD3rnQ6oFfcFhE3i//5L5Dc2N+fsf4yJ2B4HglFxj6Mp9lgHd7KDwNe4NRPl2koeqW+CHpb0Wy546c0bgUOtn0DsPcyg/5mf0SjUw37IKLR3w9kW0FnGHwzYU8HdM045fXmh+mJk4t5YqCllRJ3LPogsJmQ9uuWqhXGLuzU95uDryF3iZT90C3czBTXDw94ZcxF1KETQ6cNRvh0WRI4AmvRQ+NiWpkr4HRKy+1kLx6H3gCAXVFAjMBRVhQY8u2089kRjreWJUdVVWTuoIYbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RrMEIPgh; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RrMEIPgh; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RrMEIPgh;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RrMEIPgh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zv2vN4ZYJz2ySf
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 18:57:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746781053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1s3Je0ZFPe8U1bt0sD5VWH0wDBbOn/omwkgu7nK9eko=;
	b=RrMEIPghmTCVX09EZUQPubfVBjHKsmX4xW2ZTDieccwmE66Mf2194R1Wp50dxIb1cyWFxI
	pps6xxKiUSHkLwe/pLWJjXrjUofJODdghANiAkRC+bU8XTi574+IANtfzVIr5aTCcWBNK/
	rzRb9UWrVtCTMUQ4McQIw+UexKRm76U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746781053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1s3Je0ZFPe8U1bt0sD5VWH0wDBbOn/omwkgu7nK9eko=;
	b=RrMEIPghmTCVX09EZUQPubfVBjHKsmX4xW2ZTDieccwmE66Mf2194R1Wp50dxIb1cyWFxI
	pps6xxKiUSHkLwe/pLWJjXrjUofJODdghANiAkRC+bU8XTi574+IANtfzVIr5aTCcWBNK/
	rzRb9UWrVtCTMUQ4McQIw+UexKRm76U=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-pGl3BArIO0qfuR8P2hSmTA-1; Fri, 09 May 2025 04:57:31 -0400
X-MC-Unique: pGl3BArIO0qfuR8P2hSmTA-1
X-Mimecast-MFC-AGG-ID: pGl3BArIO0qfuR8P2hSmTA_1746781051
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ace99fe4282so224757866b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 May 2025 01:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781050; x=1747385850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1s3Je0ZFPe8U1bt0sD5VWH0wDBbOn/omwkgu7nK9eko=;
        b=s73bQq9DK09+3KacdYoK8b58TOr6aE2g/xfqtO7CDdYMI4zwhdxGoByKk+YvSTjvhB
         WBV/ER7/dURprAE5f5Fx0IrSXRSrge9bNRfZsQJVCNI+xknO0uc0L57jOlZDgX8Q/fn0
         pblmrvtQbzoyJmMfVuhl9ltzb6dA0dKVmyTtmJ+YP3IQvz38loGLNvsv0pfd+3GB9FnE
         kIFGrya2UG8xsS4QdG4Nof0CTd6XC9+BRr6CcMFiRAS60wGJ8Kfv/ydbj6oD2wocWRfg
         m/9IYhCmYSQZL5uuaJjmOee3CHyUdj7pTwVsolGaaCnSi5QjciTzz6jCjWhKJ82hFpfN
         q8jA==
X-Forwarded-Encrypted: i=1; AJvYcCXXoT4OsjdEWAY0r6mXqtBSPAs/OBcEYFNZX7HGy/V9+qrb5b8Ya/ioxtG7cC8LKDELrPDpTVJ/PoymYzo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyU8Bd2f2SZANcucQoZq8/sxLYoW0m9+yX7vWWfvbP/XuiFtglq
	VDAp5Vied84Bsmz9dkmsIGyABKpRxljkM1vW1K28Wi5QsMfn8OJDeZHBiWiYXsTY8Aw72hOaJTw
	yKWqkP3stc8wnxsarJJg/aCvQ06oVJDXAaAbB05sXZFAkkIxSTDwO/1FnY/Zci8Q=
X-Gm-Gg: ASbGncuy4qfW9k2277ybsAY7Mk7iLPdI2n/TijDioKT4Jqqh01bGSbv1TqN+V6pjdox
	1n2UUib8u/y4MqWSILf0EVCPSRveDxVSa03vhekVo87Elwbf3RO2YubfQMrJ5zo+IpIPvW27XHh
	5GhkZ+q6ZhplW3dLrKxSrMl353HKuCY0Kmz3WVr9L/XGg78R7C2ZXCBcOacMc8O26MuvSBTkRhw
	VqvOeqq+dEM4tu8odaRcax6gsKP3KAMePWMsQ1bo9QvpeO1Anvx4YQuf487sjCvI/yL/RWBujN5
	InXn07dnrVDK0CZMcU10l1/RZg==
X-Received: by 2002:a17:906:c111:b0:ac7:2fbb:ba5 with SMTP id a640c23a62f3a-ad1fca0b654mr675485566b.7.1746781050357;
        Fri, 09 May 2025 01:57:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHagLstxpWB5hayRxG0xJtF3NJ71NxcNJHJL8yuwox8dKV4UaoASRd63LLbW6wYVNLrCnSs7g==
X-Received: by 2002:a17:906:c111:b0:ac7:2fbb:ba5 with SMTP id a640c23a62f3a-ad1fca0b654mr675482266b.7.1746781049648;
        Fri, 09 May 2025 01:57:29 -0700 (PDT)
Received: from localhost.localdomain ([193.207.182.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2193495bdsm117976566b.70.2025.05.09.01.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:57:28 -0700 (PDT)
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
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v4 1/4] tpm: add buf_size parameter in the .send callback
Date: Fri,  9 May 2025 10:57:10 +0200
Message-ID: <20250509085713.76851-2-sgarzare@redhat.com>
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
X-Mimecast-MFC-PROC-ID: hUhcc6O0-kLiPZrmAHcXZbSXmJybfrG5WA4uYh3Xalo_1746781051
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Stefano Garzarella <sgarzare@redhat.com>

Add a new `buf_size` parameter to the `.send` callback in `tpm_class_ops`.
This parameter will allow drivers to differentiate between the actual
command length to send and the total buffer size. Currently `buf_now` is
not used, but it will be used to implement devices with synchronous send()
to send the command and receive the response on the same buffer.

Also rename the previous parameter `len` to `cmd_len` in the declaration
to make it clear that it contains the length in bytes of the command
stored in the buffer. The semantics don't change and it can be used as
before by drivers. This is an optimization since the drivers could get it
from the header, but let's avoid duplicating code.

While we are here, resolve a checkpatch warning:
  WARNING: Unnecessary space before function pointer arguments
  #66: FILE: include/linux/tpm.h:90:
  +	int (*send) (struct tpm_chip *chip, u8 *buf, size_t cmd_len,

Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v4:
- rework the commit description [Jarkko]
---
 include/linux/tpm.h                  | 3 ++-
 drivers/char/tpm/st33zp24/st33zp24.c | 2 +-
 drivers/char/tpm/tpm-interface.c     | 2 +-
 drivers/char/tpm/tpm_atmel.c         | 3 ++-
 drivers/char/tpm/tpm_crb.c           | 2 +-
 drivers/char/tpm/tpm_ftpm_tee.c      | 4 +++-
 drivers/char/tpm/tpm_i2c_atmel.c     | 3 ++-
 drivers/char/tpm/tpm_i2c_infineon.c  | 3 ++-
 drivers/char/tpm/tpm_i2c_nuvoton.c   | 3 ++-
 drivers/char/tpm/tpm_ibmvtpm.c       | 6 ++++--
 drivers/char/tpm/tpm_infineon.c      | 3 ++-
 drivers/char/tpm/tpm_nsc.c           | 3 ++-
 drivers/char/tpm/tpm_svsm.c          | 3 ++-
 drivers/char/tpm/tpm_tis_core.c      | 3 ++-
 drivers/char/tpm/tpm_tis_i2c_cr50.c  | 6 ++++--
 drivers/char/tpm/tpm_vtpm_proxy.c    | 4 +++-
 drivers/char/tpm/xen-tpmfront.c      | 3 ++-
 17 files changed, 37 insertions(+), 19 deletions(-)

diff --git a/include/linux/tpm.h b/include/linux/tpm.h
index 9ac9768cc8f7..7ac390ec89ce 100644
--- a/include/linux/tpm.h
+++ b/include/linux/tpm.h
@@ -87,7 +87,8 @@ struct tpm_class_ops {
 	const u8 req_complete_val;
 	bool (*req_canceled)(struct tpm_chip *chip, u8 status);
 	int (*recv) (struct tpm_chip *chip, u8 *buf, size_t len);
-	int (*send) (struct tpm_chip *chip, u8 *buf, size_t len);
+	int (*send)(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
+		    size_t buf_size);
 	void (*cancel) (struct tpm_chip *chip);
 	u8 (*status) (struct tpm_chip *chip);
 	void (*update_timeouts)(struct tpm_chip *chip,
diff --git a/drivers/char/tpm/st33zp24/st33zp24.c b/drivers/char/tpm/st33zp24/st33zp24.c
index c0771980bc2f..3de68bca1740 100644
--- a/drivers/char/tpm/st33zp24/st33zp24.c
+++ b/drivers/char/tpm/st33zp24/st33zp24.c
@@ -300,7 +300,7 @@ static irqreturn_t tpm_ioserirq_handler(int irq, void *dev_id)
  * send TPM commands through the I2C bus.
  */
 static int st33zp24_send(struct tpm_chip *chip, unsigned char *buf,
-			 size_t len)
+			 size_t len, size_t buf_size)
 {
 	struct st33zp24_dev *tpm_dev = dev_get_drvdata(&chip->dev);
 	u32 status, i, size, ordinal;
diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
index 8d7e4da6ed53..3b6ddcdb4051 100644
--- a/drivers/char/tpm/tpm-interface.c
+++ b/drivers/char/tpm/tpm-interface.c
@@ -106,7 +106,7 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
 		return -E2BIG;
 	}
 
-	rc = chip->ops->send(chip, buf, count);
+	rc = chip->ops->send(chip, buf, count, bufsiz);
 	if (rc < 0) {
 		if (rc != -EPIPE)
 			dev_err(&chip->dev,
diff --git a/drivers/char/tpm/tpm_atmel.c b/drivers/char/tpm/tpm_atmel.c
index 54a0360a3c95..5733168bfc26 100644
--- a/drivers/char/tpm/tpm_atmel.c
+++ b/drivers/char/tpm/tpm_atmel.c
@@ -148,7 +148,8 @@ static int tpm_atml_recv(struct tpm_chip *chip, u8 *buf, size_t count)
 	return size;
 }
 
-static int tpm_atml_send(struct tpm_chip *chip, u8 *buf, size_t count)
+static int tpm_atml_send(struct tpm_chip *chip, u8 *buf, size_t count,
+			 size_t buf_size)
 {
 	struct tpm_atmel_priv *priv = dev_get_drvdata(&chip->dev);
 	int i;
diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
index 876edf2705ab..38f765a44a97 100644
--- a/drivers/char/tpm/tpm_crb.c
+++ b/drivers/char/tpm/tpm_crb.c
@@ -426,7 +426,7 @@ static int tpm_crb_smc_start(struct device *dev, unsigned long func_id)
 }
 #endif
 
-static int crb_send(struct tpm_chip *chip, u8 *buf, size_t len)
+static int crb_send(struct tpm_chip *chip, u8 *buf, size_t len, size_t buf_size)
 {
 	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
 	int rc = 0;
diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_tee.c
index 53ba28ccd5d3..637cc8b6599e 100644
--- a/drivers/char/tpm/tpm_ftpm_tee.c
+++ b/drivers/char/tpm/tpm_ftpm_tee.c
@@ -64,12 +64,14 @@ static int ftpm_tee_tpm_op_recv(struct tpm_chip *chip, u8 *buf, size_t count)
  * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h
  * @buf:	the buffer to send.
  * @len:	the number of bytes to send.
+ * @buf_size:	the size of the buffer.
  *
  * Return:
  *	In case of success, returns 0.
  *	On failure, -errno
  */
-static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len)
+static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
+				size_t buf_size)
 {
 	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
 	size_t resp_len;
diff --git a/drivers/char/tpm/tpm_i2c_atmel.c b/drivers/char/tpm/tpm_i2c_atmel.c
index d1d27fdfe523..572f97cb9e89 100644
--- a/drivers/char/tpm/tpm_i2c_atmel.c
+++ b/drivers/char/tpm/tpm_i2c_atmel.c
@@ -37,7 +37,8 @@ struct priv_data {
 	u8 buffer[sizeof(struct tpm_header) + 25];
 };
 
-static int i2c_atmel_send(struct tpm_chip *chip, u8 *buf, size_t len)
+static int i2c_atmel_send(struct tpm_chip *chip, u8 *buf, size_t len,
+			  size_t buf_size)
 {
 	struct priv_data *priv = dev_get_drvdata(&chip->dev);
 	struct i2c_client *client = to_i2c_client(chip->dev.parent);
diff --git a/drivers/char/tpm/tpm_i2c_infineon.c b/drivers/char/tpm/tpm_i2c_infineon.c
index 81d8a78dc655..25d6ae3a4cc1 100644
--- a/drivers/char/tpm/tpm_i2c_infineon.c
+++ b/drivers/char/tpm/tpm_i2c_infineon.c
@@ -514,7 +514,8 @@ static int tpm_tis_i2c_recv(struct tpm_chip *chip, u8 *buf, size_t count)
 	return size;
 }
 
-static int tpm_tis_i2c_send(struct tpm_chip *chip, u8 *buf, size_t len)
+static int tpm_tis_i2c_send(struct tpm_chip *chip, u8 *buf, size_t len,
+			    size_t buf_size)
 {
 	int rc, status;
 	ssize_t burstcnt;
diff --git a/drivers/char/tpm/tpm_i2c_nuvoton.c b/drivers/char/tpm/tpm_i2c_nuvoton.c
index 3c3ee5f551db..169078ce6ac4 100644
--- a/drivers/char/tpm/tpm_i2c_nuvoton.c
+++ b/drivers/char/tpm/tpm_i2c_nuvoton.c
@@ -350,7 +350,8 @@ static int i2c_nuvoton_recv(struct tpm_chip *chip, u8 *buf, size_t count)
  * tpm.c can skip polling for the data to be available as the interrupt is
  * waited for here
  */
-static int i2c_nuvoton_send(struct tpm_chip *chip, u8 *buf, size_t len)
+static int i2c_nuvoton_send(struct tpm_chip *chip, u8 *buf, size_t len,
+			    size_t buf_size)
 {
 	struct priv_data *priv = dev_get_drvdata(&chip->dev);
 	struct device *dev = chip->dev.parent;
diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
index 76d048f63d55..660a7f9da1d8 100644
--- a/drivers/char/tpm/tpm_ibmvtpm.c
+++ b/drivers/char/tpm/tpm_ibmvtpm.c
@@ -191,13 +191,15 @@ static int tpm_ibmvtpm_resume(struct device *dev)
  * tpm_ibmvtpm_send() - Send a TPM command
  * @chip:	tpm chip struct
  * @buf:	buffer contains data to send
- * @count:	size of buffer
+ * @count:	length of the command
+ * @buf_size:   size of the buffer
  *
  * Return:
  *   0 on success,
  *   -errno on error
  */
-static int tpm_ibmvtpm_send(struct tpm_chip *chip, u8 *buf, size_t count)
+static int tpm_ibmvtpm_send(struct tpm_chip *chip, u8 *buf, size_t count,
+			    size_t buf_size)
 {
 	struct ibmvtpm_dev *ibmvtpm = dev_get_drvdata(&chip->dev);
 	bool retry = true;
diff --git a/drivers/char/tpm/tpm_infineon.c b/drivers/char/tpm/tpm_infineon.c
index 2d2ae37153ba..7896fdacd156 100644
--- a/drivers/char/tpm/tpm_infineon.c
+++ b/drivers/char/tpm/tpm_infineon.c
@@ -312,7 +312,8 @@ static int tpm_inf_recv(struct tpm_chip *chip, u8 * buf, size_t count)
 	return -EIO;
 }
 
-static int tpm_inf_send(struct tpm_chip *chip, u8 * buf, size_t count)
+static int tpm_inf_send(struct tpm_chip *chip, u8 *buf, size_t count,
+			size_t buf_size)
 {
 	int i;
 	int ret;
diff --git a/drivers/char/tpm/tpm_nsc.c b/drivers/char/tpm/tpm_nsc.c
index 0f62bbc940da..12aedef3c50e 100644
--- a/drivers/char/tpm/tpm_nsc.c
+++ b/drivers/char/tpm/tpm_nsc.c
@@ -178,7 +178,8 @@ static int tpm_nsc_recv(struct tpm_chip *chip, u8 * buf, size_t count)
 	return size;
 }
 
-static int tpm_nsc_send(struct tpm_chip *chip, u8 * buf, size_t count)
+static int tpm_nsc_send(struct tpm_chip *chip, u8 *buf, size_t count,
+			size_t buf_size)
 {
 	struct tpm_nsc_priv *priv = dev_get_drvdata(&chip->dev);
 	u8 data;
diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
index 4280edf427d6..d3ca5615b6f7 100644
--- a/drivers/char/tpm/tpm_svsm.c
+++ b/drivers/char/tpm/tpm_svsm.c
@@ -25,7 +25,8 @@ struct tpm_svsm_priv {
 	void *buffer;
 };
 
-static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len)
+static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len,
+			 size_t buf_size)
 {
 	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
 	int ret;
diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis_core.c
index ed0d3d8449b3..5641a73ce280 100644
--- a/drivers/char/tpm/tpm_tis_core.c
+++ b/drivers/char/tpm/tpm_tis_core.c
@@ -580,7 +580,8 @@ static int tpm_tis_send_main(struct tpm_chip *chip, const u8 *buf, size_t len)
 	return rc;
 }
 
-static int tpm_tis_send(struct tpm_chip *chip, u8 *buf, size_t len)
+static int tpm_tis_send(struct tpm_chip *chip, u8 *buf, size_t len,
+			size_t buf_size)
 {
 	int rc, irq;
 	struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
diff --git a/drivers/char/tpm/tpm_tis_i2c_cr50.c b/drivers/char/tpm/tpm_tis_i2c_cr50.c
index 3b55a7b05c46..1914b368472d 100644
--- a/drivers/char/tpm/tpm_tis_i2c_cr50.c
+++ b/drivers/char/tpm/tpm_tis_i2c_cr50.c
@@ -546,13 +546,15 @@ static int tpm_cr50_i2c_tis_recv(struct tpm_chip *chip, u8 *buf, size_t buf_len)
  * tpm_cr50_i2c_tis_send() - TPM transmission callback.
  * @chip:	A TPM chip.
  * @buf:	Buffer to send.
- * @len:	Buffer length.
+ * @len:	Command length.
+ * @buf_size:	Buffer size.
  *
  * Return:
  * - 0:		Success.
  * - -errno:	A POSIX error code.
  */
-static int tpm_cr50_i2c_tis_send(struct tpm_chip *chip, u8 *buf, size_t len)
+static int tpm_cr50_i2c_tis_send(struct tpm_chip *chip, u8 *buf, size_t len,
+				 size_t buf_size)
 {
 	size_t burstcnt, limit, sent = 0;
 	u8 tpm_go[4] = { TPM_STS_GO };
diff --git a/drivers/char/tpm/tpm_vtpm_proxy.c b/drivers/char/tpm/tpm_vtpm_proxy.c
index 8fe4a01eea12..beaa84428b49 100644
--- a/drivers/char/tpm/tpm_vtpm_proxy.c
+++ b/drivers/char/tpm/tpm_vtpm_proxy.c
@@ -322,11 +322,13 @@ static int vtpm_proxy_is_driver_command(struct tpm_chip *chip,
  * @chip: tpm chip to use
  * @buf: send buffer
  * @count: bytes to send
+ * @buf_size: size of the buffer
  *
  * Return:
  *      0 in case of success, negative error value otherwise.
  */
-static int vtpm_proxy_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t count)
+static int vtpm_proxy_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t count,
+				  size_t buf_size)
 {
 	struct proxy_dev *proxy_dev = dev_get_drvdata(&chip->dev);
 
diff --git a/drivers/char/tpm/xen-tpmfront.c b/drivers/char/tpm/xen-tpmfront.c
index 80cca3b83b22..66a4dbb4a4d8 100644
--- a/drivers/char/tpm/xen-tpmfront.c
+++ b/drivers/char/tpm/xen-tpmfront.c
@@ -131,7 +131,8 @@ static size_t shr_data_offset(struct vtpm_shared_page *shr)
 	return struct_size(shr, extra_pages, shr->nr_extra_pages);
 }
 
-static int vtpm_send(struct tpm_chip *chip, u8 *buf, size_t count)
+static int vtpm_send(struct tpm_chip *chip, u8 *buf, size_t count,
+		     size_t buf_size)
 {
 	struct tpm_private *priv = dev_get_drvdata(&chip->dev);
 	struct vtpm_shared_page *shr = priv->shr;
-- 
2.49.0


