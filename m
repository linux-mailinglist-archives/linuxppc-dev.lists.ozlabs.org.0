Return-Path: <linuxppc-dev+bounces-8574-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 254C6AB6D1F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 15:47:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyF5057xsz2ywR;
	Wed, 14 May 2025 23:47:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747230420;
	cv=none; b=aEFXJLErjMKVSRHvrLpZoAapCAoCgjVic/g3CjTL7Hjz1XyjsFY/5AflaKMAj5a0pHjyu6axfjTC5u+pH2vYO+v4uS47XYvelgMLa+zN7SOX92HfEpK3tjl7H2O5nnYwrVeH+uavsveS5sD23DrWWb75+evNaanUzy6nsaz40Mdr5ObugfqjJrBpZzYq9Bx64KQNTQPoPWCttXbexaV/vxPZteTuCPMMUmnb/8VeXUBGxjl7sqp21Y5ndfngFbHzyFS3emV+cfYAWBDeDdTEp6huyjEwrdPO/QxLDRmehhlxEexwJ7lkQuWfDEzNuKRQTDfGppGSwwQVMm77DE1wAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747230420; c=relaxed/relaxed;
	bh=HM3A1DQYgNN+uT3lHR2nzVPEIJjvspM419SembxT0i4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=TaRO3FPT3ejswiOllCxAzahbZwi8n6KJDwIaA/t/3zUfwNhbFgXC9BafOPk34pQfQiZcnw4AHrEE1Ht6bZyT3Z3DdqLxBiH+K4PoUTPQMI+MJw493dtRnhzIJfB2xU7VIri5kvwwVPI4ORGwm6/xKNLvkZMqyyllqwD+KVvA3YwZ5T4v48vPr6dIet1WK6zvKfGUeqik9LHw+uIYMSoCY+aQZeu9WIbVSj2EPDOODxRetJIcj7jUSY7j3aZd2/pAy5xkM+OqjnLqMiyCFqkkvbj/TgO7dr7+30fYI/Kh7BsPW31ppqt4oQiloA3rjzqMpE2mtS6hfaHaJ+YHxCNSEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dprYYhBs; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FvJETraJ; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dprYYhBs;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FvJETraJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyF4z67Q2z2ywC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 23:46:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747230416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HM3A1DQYgNN+uT3lHR2nzVPEIJjvspM419SembxT0i4=;
	b=dprYYhBsw2elqthQTQyDpryKyBdkWQXwl9qcMt7wwiV0ODukaTbPDCs8U82IpT5W0CCsbm
	cmBVQjRQaNgxp7gFdyWPBgimT8/iJ+uTitYjBq5yKv4B7Ry3vceAwHTESt+cZsivCmXnWT
	YBVPFqO99rG9NudVHh2wch3x27C2DeU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747230417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HM3A1DQYgNN+uT3lHR2nzVPEIJjvspM419SembxT0i4=;
	b=FvJETraJk3wzskVnT28WvRVkJQeqW5t8F4VyHaexH8bu4pleGfdvdlAZ5EKilbkARd9wiD
	cXPOwv0GtWZ815J7O7o45UO7r5rEemRBE2PYf6koe4aCMB0MZf80OX7ci68vLfbYNIEgsK
	X9NJUBYZP06z52KDIuFWPmzdLBXDU0s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-ZPqSkYlcO86wfGZqw37oSg-1; Wed, 14 May 2025 09:46:53 -0400
X-MC-Unique: ZPqSkYlcO86wfGZqw37oSg-1
X-Mimecast-MFC-AGG-ID: ZPqSkYlcO86wfGZqw37oSg_1747230412
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so34026005e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 06:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747230412; x=1747835212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HM3A1DQYgNN+uT3lHR2nzVPEIJjvspM419SembxT0i4=;
        b=UJkGzkFen3VxsGdeDm6OrTQRT9RTpQnY56eoc7pYmkuhpyt6Or94nkg3e3HNcvaFk8
         j0Brm3+jsMdUo4mHkNBMcWadPyv906j+UUqYbEV7ftsMfpv2QY4bssEmulbRgFzRV92o
         WDCVbVlYKEN4SSOHdZmJ/er4OMQkxPJpgJvgp9xzY89t1ab1Y31iln1apWhAgCo51JlX
         grXY9j4ue9ErxyLL4gulnmso7oUOaCIsRPIO2iyDycvcAFep6ECgg0siyLex01IUoIIh
         RomgdzVYDlzLVktCMPaTy2TgqvVZUWFX/Xp/UEZEkfB6WEwqX+tLmO3WJHdo1kLNDmu8
         t5fw==
X-Gm-Message-State: AOJu0YycNbTfV9Ypo8zyOPIs16OthjeSC2xfqeeo+8VQbt+SWyJcaD73
	TQLEgmdNBEIUZnmmJeYjNPl9oK/00iHEG3p7j4UY2wbtim07hpvlo/5lJzbVuIvtuoMWcWuNGnd
	wag5e+PXaX6StYKu6fnv67z9lLplzxM9OeqxYOrgl2+MQi4HZvqFV6c7JJFwo4p0=
X-Gm-Gg: ASbGncvPT26l8uL+6VPewdoWqCkiAB+RrfysIph2/0EarbNMAk9lMvaTNXh5e6DRQ+L
	ooKnPdUp/iMmE9RrPTccDOpRWnyj2SwMBovak1NJqtw3qElG64tq66sTg9LxRiUNpkQ77YVCCcW
	mGf6YzWph0tOkv8cIgGBhtsyfwG4cd2YlOt/KAN9AaBe5ft+/H45v6Hsdvg6tUsaoR0/rO8WTyn
	p6oiv2bBLGnTkKUku1EqouQJeXqB2iIQ0kGhgvHbrWsbAhFoTJP52tfyzglFhz5bLOBvXSrxCvY
	ijKcndDWuNH+tyFEkhc=
X-Received: by 2002:a05:6000:4285:b0:3a3:447c:c341 with SMTP id ffacd0b85a97d-3a3496c20bbmr3094564f8f.27.1747230412139;
        Wed, 14 May 2025 06:46:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH78JQgYCZi7PAI6RbgXsNStikuLBd+X8aPd5vCyBuwPC57MACif1PRt1AJ3M7lUf2aeHKigg==
X-Received: by 2002:a05:6000:4285:b0:3a3:447c:c341 with SMTP id ffacd0b85a97d-3a3496c20bbmr3094514f8f.27.1747230411506;
        Wed, 14 May 2025 06:46:51 -0700 (PDT)
Received: from stex1.redhat.com ([193.207.148.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2a07sm20175282f8f.50.2025.05.14.06.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 06:46:50 -0700 (PDT)
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
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v5 2/4] tpm: support devices with synchronous send()
Date: Wed, 14 May 2025 15:46:28 +0200
Message-ID: <20250514134630.137621-3-sgarzare@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 0RWbIALvuw8cqlNRaB6zR7AH0ylIVxl0hu5o2RXTBuQ_1747230412
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Stefano Garzarella <sgarzare@redhat.com>

Some devices do not support interrupts and provide a single synchronous
operation to send the command and receive the response on the same buffer.

Currently, these types of drivers must use an internal buffer where they
temporarily store the response between .send() and .recv() calls.

Introduce a new flag (TPM_CHIP_FLAG_SYNC) to support synchronous send().
If that flag is set by the driver, tpm_try_transmit() will use the send()
callback to send the command and receive the response on the same buffer
synchronously. In that case send() return the number of bytes of the
response on success, or -errno on failure.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v4:
- added Jarkko's R-b
v3:
- fixed comment style [Jarkko]
- renamend `out_send_sync` label to `out_sync` [Jarkko]
---
 include/linux/tpm.h              |  1 +
 drivers/char/tpm/tpm-interface.c | 20 +++++++++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/linux/tpm.h b/include/linux/tpm.h
index 10917087b70e..33f2aa1a75ea 100644
--- a/include/linux/tpm.h
+++ b/include/linux/tpm.h
@@ -351,6 +351,7 @@ enum tpm_chip_flags {
 	TPM_CHIP_FLAG_SUSPENDED			= BIT(8),
 	TPM_CHIP_FLAG_HWRNG_DISABLED		= BIT(9),
 	TPM_CHIP_FLAG_DISABLE			= BIT(10),
+	TPM_CHIP_FLAG_SYNC			= BIT(11),
 };
 
 #define to_tpm_chip(d) container_of(d, struct tpm_chip, dev)
diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
index 816b7c690bc9..512882ac0db1 100644
--- a/drivers/char/tpm/tpm-interface.c
+++ b/drivers/char/tpm/tpm-interface.c
@@ -114,8 +114,19 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
 		return rc;
 	}
 
-	/* A sanity check. send() should just return zero on success e.g.
-	 * not the command length.
+	/*
+	 * Synchronous devices return the response directly during the send()
+	 * call in the same buffer.
+	 */
+	if (chip->flags & TPM_CHIP_FLAG_SYNC) {
+		len = rc;
+		rc = 0;
+		goto out_sync;
+	}
+
+	/*
+	 * A sanity check. send() of asynchronous devices should just return
+	 * zero on success e.g. not the command length.
 	 */
 	if (rc > 0) {
 		dev_warn(&chip->dev,
@@ -151,7 +162,10 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
 	if (len < 0) {
 		rc = len;
 		dev_err(&chip->dev, "tpm_transmit: tpm_recv: error %d\n", rc);
-	} else if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
+		return rc;
+	}
+out_sync:
+	if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
 		rc = -EFAULT;
 
 	return rc ? rc : len;
-- 
2.49.0


