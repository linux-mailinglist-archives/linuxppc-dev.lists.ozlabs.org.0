Return-Path: <linuxppc-dev+bounces-7520-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F171A7F7E9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 10:32:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWzpk28q4z301Y;
	Tue,  8 Apr 2025 18:32:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744101150;
	cv=none; b=acnvQi67Cn6nzRla/DlZB6X3nVKraVPlevhRTnqHTmO3RPoLZdMExiWFIC4ikZKs3+nUXjuSvT9wuVQJzfPbKe+Y7EwuvJ+jgq7D1oMa/VzC1v/4u7PCfJSYRx5vKQtzKh3q1FvkUoan56XvukmkJi4JWlVQ+TVXzkSfKUBNgcqbLQihSptzYq8gRsx4/rCZsctQH1lrRLJCD37mAbRy50f9LcualUNgVMhTGPzO0RMk9GJpIxaDDlbEoVCBsX3FR6QBJ6MfWRp0pZC1mink/YrFRj/G/JD6N0uEgMcRIDUhY9fY7xtS5c9m/PbC4Bk3WWCNQUB3rsK9TlQKWD9/Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744101150; c=relaxed/relaxed;
	bh=QDE/YZIPCEEz/h330X/plomZy4BudCgqspAc85dgVok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=P7MLdAYZdtiTRISvvugO1U5lgF6Ccgb78p+InyD5bMF83hIUEWS8lZSZ3jsymCtq+uiSeP0c+UZQxeEyqAGlk8h0G4g2ZhvUUYgjsnxhmDORPFEIc1stH8iUVL5VwmDMXmrfPQfYgiq0CkEcFU3SoNhRbroOifpJeX7ZIGPcSF06F6FhFp1RXOOQO3jgycmLmtzA/l22U109DAAL9WFrPJ2kgxStm6lOdywhQOq2+spVcicMLO5IWm4SxPcyAL+sKpAYx4xjwTYY4xGWzbYk7Lt846lyqkwJfMqT1DQoxad0CpULooYbnbBz3uyFbT7m00nEz5EUhgUiT5T40Q/NxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GdD86dw9; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GdD86dw9; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GdD86dw9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GdD86dw9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWzpj311Nz2ygD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 18:32:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744101146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDE/YZIPCEEz/h330X/plomZy4BudCgqspAc85dgVok=;
	b=GdD86dw9g4MRPZHoMTffPII2+YZg06gMCFOKsQKjhc5hHHaeCKGFV/WGHYvmwR+fBTM+7U
	uiB1lsKRA4tfhc/yavvBdqZwmPXfjdSAr+eUp3FsGNtKBhVguOcgzn2XCZTNAxCveIpUUW
	w0XAdENwYN25WNBHztILfTQDU6xCLTY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744101146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDE/YZIPCEEz/h330X/plomZy4BudCgqspAc85dgVok=;
	b=GdD86dw9g4MRPZHoMTffPII2+YZg06gMCFOKsQKjhc5hHHaeCKGFV/WGHYvmwR+fBTM+7U
	uiB1lsKRA4tfhc/yavvBdqZwmPXfjdSAr+eUp3FsGNtKBhVguOcgzn2XCZTNAxCveIpUUW
	w0XAdENwYN25WNBHztILfTQDU6xCLTY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-mvWNAtFlOpKbK67_IYfPEg-1; Tue, 08 Apr 2025 04:32:23 -0400
X-MC-Unique: mvWNAtFlOpKbK67_IYfPEg-1
X-Mimecast-MFC-AGG-ID: mvWNAtFlOpKbK67_IYfPEg_1744101142
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d51bd9b45so36341535e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Apr 2025 01:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101142; x=1744705942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDE/YZIPCEEz/h330X/plomZy4BudCgqspAc85dgVok=;
        b=FQzVh2Fpi/YDhT4c5Z5i9yYspN0suH3hAmkUdmJcmu1Te51gorA1rR5I/s/EldQhBX
         Edb772RYRL5hgrr0OBqLwz04ZCNLFcfKAY4IVOm3TtcZcMuV1CN9hVrga4wkU9cnMGIj
         vgdOrV0u03Wb6EorF3Fm9Bc6LBVM+FxIvyGot/5PDvvwseqIychzzzrS/KvYVcwIDocR
         yuBy739UdKw6PgMfWT3q68fCRake1/P0bvBdJJKtxqDwPkbU7nCyLB3NHSSNgS2BWc0N
         TWqN4foqxHX+2NVU8cdr752CLES67YDrZMzR/xHGCu0G5v+k3/QOzBefi5b0/W+78gKo
         0PgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuATZHA8IqLqIxS+0DFopcm/Qvk6fCDqp3QLfx7hlFrAmmkk+Bl465h3VCunA6wfpDSerP5ZgJmMxoGLo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz28WQa/8m1B7U+hF6nzbDfh/r7jtAXA+7bQvFznZA+O2q17aA1
	QwI7gsRHUKLSlJ3F68KqJE/jcYWeG0ZNRh3kdL+290LVYOHUQMQfF1wjWj9DC9Gx05G1hikFhG/
	d4IpEm8jeadnzbSrOLlGAxLE/9sv2KhX38GxDxO/BV4V4zD16MR1EqvXYksfuu0E=
X-Gm-Gg: ASbGncvWyhxwPvYGU7WntSfFx79D9W0n374KqP4I1svv4XVMGnY/ydLuknpTDt/Dl9q
	N7ZXQAJu5ElRQD795WVy4eDWaOsvww3xjLsbxK45iaUTidcZJ0zrcNmNIhSJCgJsYS+aUSz5UEu
	zWkBGHIBHHx/AeKSUZtwQPJg9f17VEGUiskzyXAwWG0dEGd+wAL5PWdPY+WPwrXhNEHXS4W4hz6
	pk1dfByCU1EZDxVcBtF5Zt8ajF+wXgbRTetchfX7Hp4U443jQa1vnbn3AwwIXP47MJRy2Sa6KIY
	hGUcU7fHPKCK4fn0qpAZUkkN/koEo2yghv7af/lavC5Or5hjKsrlfrLoecUoQZwcBA==
X-Received: by 2002:a05:600c:1e13:b0:439:8c80:6af4 with SMTP id 5b1f17b1804b1-43ecf8d0b48mr141342845e9.19.1744101141992;
        Tue, 08 Apr 2025 01:32:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQhp1MgrEqOjc+4MW66KZXrp62NtlwXCuZ1w3QWz8IsRQIARyOk/4wlryzdly6gRSlx08ezQ==
X-Received: by 2002:a05:600c:1e13:b0:439:8c80:6af4 with SMTP id 5b1f17b1804b1-43ecf8d0b48mr141342355e9.19.1744101141383;
        Tue, 08 Apr 2025 01:32:21 -0700 (PDT)
Received: from stex1.redhat.com (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3009680dsm14051923f8f.7.2025.04.08.01.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:32:20 -0700 (PDT)
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
Subject: [PATCH v2 2/4] tpm: support devices with synchronous send()
Date: Tue,  8 Apr 2025 10:32:06 +0200
Message-ID: <20250408083208.43512-3-sgarzare@redhat.com>
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
X-Mimecast-MFC-PROC-ID: FqVx1wN5-DzYFyJ-BtUiCeqYKETfEKpmU-hFJfENK-A_1744101142
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Stefano Garzarella <sgarzare@redhat.com>

Some devices do not support interrupts and provide a single synchronous
operation to send the command and receive the response on the same buffer.

Currently, these types of drivers must use an internal buffer where they
temporarily store the response between .send() and recv() calls.

Introduce a new flag (TPM_CHIP_FLAG_SYNC) to support synchronous send().
If that flag is set by the driver, tpm_try_transmit() will use the send()
callback to send the command and receive the response on the same buffer
synchronously. In that case send() return the number of bytes of the
response on success, or -errno on failure.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/linux/tpm.h              |  1 +
 drivers/char/tpm/tpm-interface.c | 18 +++++++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/include/linux/tpm.h b/include/linux/tpm.h
index 2e38edd5838c..0e9746dc9d30 100644
--- a/include/linux/tpm.h
+++ b/include/linux/tpm.h
@@ -350,6 +350,7 @@ enum tpm_chip_flags {
 	TPM_CHIP_FLAG_SUSPENDED			= BIT(8),
 	TPM_CHIP_FLAG_HWRNG_DISABLED		= BIT(9),
 	TPM_CHIP_FLAG_DISABLE			= BIT(10),
+	TPM_CHIP_FLAG_SYNC			= BIT(11),
 };
 
 #define to_tpm_chip(d) container_of(d, struct tpm_chip, dev)
diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
index 3b6ddcdb4051..9fbe84b5a131 100644
--- a/drivers/char/tpm/tpm-interface.c
+++ b/drivers/char/tpm/tpm-interface.c
@@ -114,8 +114,17 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
 		return rc;
 	}
 
-	/* A sanity check. send() should just return zero on success e.g.
-	 * not the command length.
+	/* Synchronous devices return the response directly during the send()
+	 * call in the same buffer.
+	 */
+	if (chip->flags & TPM_CHIP_FLAG_SYNC) {
+		len = rc;
+		rc = 0;
+		goto out_send_sync;
+	}
+
+	/* A sanity check. send() of asynchronous devices should just return
+	 * zero on success e.g. not the command length.
 	 */
 	if (rc > 0) {
 		dev_warn(&chip->dev,
@@ -151,7 +160,10 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
 	if (len < 0) {
 		rc = len;
 		dev_err(&chip->dev, "tpm_transmit: tpm_recv: error %d\n", rc);
-	} else if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
+		return rc;
+	}
+out_send_sync:
+	if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
 		rc = -EFAULT;
 
 	return rc ? rc : len;
-- 
2.49.0


