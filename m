Return-Path: <linuxppc-dev+bounces-7522-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2571AA7F7EC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 10:32:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWzps33Mhz2ygD;
	Tue,  8 Apr 2025 18:32:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744101157;
	cv=none; b=PFdXE2T7OohSKHRJWqD+fsB9X9BS9SByJXt0/pCtNgAPEgVSWKYL+ZohYeju8xqILt+SxvG3CFuRVr8d4e4pt01i/1eG2EyMrr9Hvs93hNmtKRi3KKcDz1pRM9n+KZAnoYP9pxAWMk3UyTcGXD8lb3gbFUP8gBQmAkwM2umTIwVbFpUBjEdWjVw6VMmUH2T7VtabOnpcPuLqJO/LWOWfAennVtiqvJHuC3VeATDp32rDeEFI+hxBIECbC2hZidG20gQbQoaAfK0h/JQtm1I3BYfpl2dxLZkwXtO299o8R+XI+zwKv6NwWgX3jo/BveFIVI1pErEDMsxJfiPDFr60pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744101157; c=relaxed/relaxed;
	bh=+UWgpwscQp73PyDMRD5EZKbcQGdo2l2UKgmDSHNPifY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Ex4K5B5imAlUNBIadQE9fxssCw1wgYXQwUlAn8wJv85RGEfSqwno8nt8Npwl3lU7q1AGTWBXlctPADa1NdJ+5LLAP01BX+nxXeIZTcWuNQg7LWlBJuG91BQSEnTnfg6cm6pR+eFaqTVpaeh24NP49wHdyNND/FJBkbuGjmHUqKO3B9he2QCRfZEhzTMdzMBQHZ5BR2PBUQQdv8kkMbcECLATfOOX2qVv3BhQ5Yv3Et9iUdhPpz205RmOYbQhRQM3qCw5TDTKGCAUXfZqd/nYbNHS4/WdI33nSagnxVXSKa5Q5NkYwXAZH3o6CMahjoA1Bx+W2HQAkoRNNnYWnECnCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZvBP5lTj; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZvBP5lTj; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZvBP5lTj;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZvBP5lTj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWzpr5GB7z306S
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 18:32:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744101154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+UWgpwscQp73PyDMRD5EZKbcQGdo2l2UKgmDSHNPifY=;
	b=ZvBP5lTjeFYDNHd3tmO5LFbXW0VYJ2iB1C+HfvWY6L8quLinkLRxHXQafujIKdayDNGcBU
	oi+N1kqgncWrOxgq201+K1FTMgTIH5lpHGe8iCyIK9uAPjSwuYJKJ4zTm+hGTB5v6WF/7T
	vy48MYFIrVPmjPblPUJegyfWlje6c18=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744101154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+UWgpwscQp73PyDMRD5EZKbcQGdo2l2UKgmDSHNPifY=;
	b=ZvBP5lTjeFYDNHd3tmO5LFbXW0VYJ2iB1C+HfvWY6L8quLinkLRxHXQafujIKdayDNGcBU
	oi+N1kqgncWrOxgq201+K1FTMgTIH5lpHGe8iCyIK9uAPjSwuYJKJ4zTm+hGTB5v6WF/7T
	vy48MYFIrVPmjPblPUJegyfWlje6c18=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-Cmdi1MSwMC2frcXG8TRYfA-1; Tue, 08 Apr 2025 04:32:32 -0400
X-MC-Unique: Cmdi1MSwMC2frcXG8TRYfA-1
X-Mimecast-MFC-AGG-ID: Cmdi1MSwMC2frcXG8TRYfA_1744101151
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so16031835e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Apr 2025 01:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101151; x=1744705951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UWgpwscQp73PyDMRD5EZKbcQGdo2l2UKgmDSHNPifY=;
        b=WahcuUQNfpI7asrCjWq8to1VBW7Tb7tCVO+py9IuOC26vqfxygy1ZE2x3uGDy6wyG2
         vfCcOsWXhDi5FSuph4ZVkxfNY+nmJ9bj8/EPWZfqdgID3bDMEuHOWiZhE/UunMF57oB4
         NWC60czJuNSE1eW89qhYjfN5tWEx10/BEoBUQaJRHIoQqVweyWSOdmyBkASMSb3RdZpS
         MAG8sVwFIKM0Otuda27AD34pBt9QLowfgLCgVlRA9VE0WkY8HtKZjRLCZ2pt0+KDI+r/
         FzgKsAJQUS59iK03b+cHwW7reQ1e5yR1nI4U2q/xxn+UOQ0xFVoOHpZBP4zgm6yjjWuD
         ZcCw==
X-Forwarded-Encrypted: i=1; AJvYcCVJn+G4vuatcfZa3jukRqAPEumf7FXkdkegKXnVdvlTU/vA7J022utrIUFcVkm28MsSvOtClEt0LC2iLYU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzk6mG7xjZbIi3ZkK7/yNX0ecPhXf1EOVMPKgYXW/2GhkXxQmP0
	+X/nZmXku2jni+y0tyoSjiORcPIXQhQMaBSfl1j0Dvst8fLtoFnfptOzcsVbv528lk1hIbvDitK
	kPGK1VvdeIH4OBynax9CMo4FOhaG9tcOCJpVnUEC4Ub8ULg6Hq/CpqciTlEFrNpY=
X-Gm-Gg: ASbGncsHMws9xYsosQ0BSWvyjk7CniMkxbzHerxyBxLnRfBAz83Bd+z9IvJsV7MMBSC
	Gdt6SjsnRjNnhiFZhMqIKquajRBN1SDVYqzgFCdL3CosPxuhLQTLjodklfGvrpHPngE9VQFsGg8
	coWhqk/D+Brn9VdVqX9jyhryQrvBfip3WOnDrR6JBI/M/Cs3SKG+rRZHkTkfIntYQd/TdJDTbFI
	jqqioxh3XGuZsiHSK9A/VRLEWkG1dOw1KOESWVmaMhedz60dNWcQkDtix4ZLWLGOZbaXEhYgvgM
	NCBqqc7w4qQoYtipq/DaxVJYAznmDFNcepNTtjw+Td5gWa555R80RAejsfM7phcubg==
X-Received: by 2002:a05:600c:1384:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-43ecf85f216mr158235525e9.8.1744101151417;
        Tue, 08 Apr 2025 01:32:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz2ZKXaEi+HUCetPqQ0pAcpS8InkZmoD9d7JUgJGma+dknJFHnGD8z9oUR2s/51/65NGDLdw==
X-Received: by 2002:a05:600c:1384:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-43ecf85f216mr158235025e9.8.1744101150843;
        Tue, 08 Apr 2025 01:32:30 -0700 (PDT)
Received: from stex1.redhat.com (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b1352sm154886505e9.37.2025.04.08.01.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:32:30 -0700 (PDT)
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
Subject: [PATCH v2 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Date: Tue,  8 Apr 2025 10:32:08 +0200
Message-ID: <20250408083208.43512-5-sgarzare@redhat.com>
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
X-Mimecast-MFC-PROC-ID: JQM9HNtb2FCoE7bsYXeR2wdBtSPdVzvFOiF38Djv_8I_1744101151
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
don't need to implement recv() op.

Keep using the same pre-allocated buffer to avoid having to allocate
it for each command. We need the buffer to have the header required by
the SVSM protocol and the command contiguous in memory.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
index b8aa7eb567de..547d4c4f7a53 100644
--- a/drivers/char/tpm/tpm_svsm.c
+++ b/drivers/char/tpm/tpm_svsm.c
@@ -25,38 +25,32 @@ struct tpm_svsm_priv {
 	void *buffer;
 };
 
-static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len,
+static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
 			 size_t buf_size)
 {
 	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
 	int ret;
 
-	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
+	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, cmd_len);
 	if (ret)
 		return ret;
 
 	/*
 	 * The SVSM call uses the same buffer for the command and for the
-	 * response, so after this call, the buffer will contain the response
-	 * that can be used by .recv() op.
+	 * response, so after this call, the buffer will contain the response.
+	 *
+	 * Note: we have to use an internal buffer because the device in SVSM
+	 * expects the svsm_vtpm header + data to be physically contiguous.
 	 */
-	return snp_svsm_vtpm_send_command(priv->buffer);
-}
-
-static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
-{
-	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
+	ret = snp_svsm_vtpm_send_command(priv->buffer);
+	if (ret)
+		return ret;
 
-	/*
-	 * The internal buffer contains the response after we send the command
-	 * to SVSM.
-	 */
-	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
+	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, buf_size);
 }
 
 static struct tpm_class_ops tpm_chip_ops = {
 	.flags = TPM_OPS_AUTO_STARTUP,
-	.recv = tpm_svsm_recv,
 	.send = tpm_svsm_send,
 };
 
@@ -88,6 +82,7 @@ static int __init tpm_svsm_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&chip->dev, priv);
 
+	chip->flags |= TPM_CHIP_FLAG_SYNC;
 	err = tpm2_probe(chip);
 	if (err)
 		return err;
-- 
2.49.0


