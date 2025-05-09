Return-Path: <linuxppc-dev+bounces-8463-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC57DAB0DEA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 10:57:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zv2vW4HS3z3bjG;
	Fri,  9 May 2025 18:57:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746781063;
	cv=none; b=LpozARy1oRqqcJ4NKX7NzHzJ11iIA5zREoVvjd9R9PFwZ8kMXskOyL75f+nI9n22fMoWFb4kWQx/SxyZerKmyYgPBKqjdeFRAxz9iYwZy02XsotXizW4awxX/lCj5eTSJyRAkpqXS9EI4V6tLJffthaBsXPrF6QdGhKuXJSQfRzJ3aT03OM71ov6UWxEGg32zfh/KHuNTnfvZlNYG5HDshVauXIJKFvNCNGvR4I7ogWc+jnRY/ZcAjsgT4nMshZwBWtBUOgxsiAC1hV50W0amlakNRPyjpY6/GbQmz1cbX/DUNlNsyxYF/VPVbdctV23IcxdWYqf3Wib8jCp4w9y3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746781063; c=relaxed/relaxed;
	bh=qDWPbShizfOGB/EjWmdUWFa8dOmwyE7Lp4wOXMg3HCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=L/xDY+m9kcaaTNyfevWlEzPiNI5NLaHbA2ZCIRN6DYHZdAaMVmnueUKbCyD60rL2bMoq3XnihT0+NDR3Oh1I/Th47tIC7ryXW03PCF/XI8hke0Ta5XfQoyoGZV8xedW1uT5kpgI4MlttZgp0POBoUkWV8l34vH5KpbzbPJz2g8XLC8h9DseXe3cSkkF8CuRe95JMC3Fy0y815l5nhT/O/0GFkR0jW+VoA4CqAIx9rWD+d/0AAVtvpWMNBz8SdmlYdQ0Fdn5SA9QvQsFps3gfGlsYCr8eKgWpw5pbSTVeDaKMDCZ1giZ9UEcIuP5yR4GGxAXEZQyaKX/F4UjDDEa7Kg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bChmwnYr; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bChmwnYr; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bChmwnYr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bChmwnYr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zv2vV5GS8z2ySf
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 18:57:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746781059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDWPbShizfOGB/EjWmdUWFa8dOmwyE7Lp4wOXMg3HCo=;
	b=bChmwnYrbEK3fz5UXBRq7z0CEh80YmAoDNW0ULH0YOVUZe4SRA8/Fd7YWWI9ChqBsixEJ1
	B/yeouwPykUWZ12/wc/q3gWaypvzGvyNhyns++AWxo4SmsN8FpzJjW1Xg41L7u39KcgZsV
	fiaZKwqZ9vnJWu6eFLFWA28w/SOQRek=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746781059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDWPbShizfOGB/EjWmdUWFa8dOmwyE7Lp4wOXMg3HCo=;
	b=bChmwnYrbEK3fz5UXBRq7z0CEh80YmAoDNW0ULH0YOVUZe4SRA8/Fd7YWWI9ChqBsixEJ1
	B/yeouwPykUWZ12/wc/q3gWaypvzGvyNhyns++AWxo4SmsN8FpzJjW1Xg41L7u39KcgZsV
	fiaZKwqZ9vnJWu6eFLFWA28w/SOQRek=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-9y5MtUsVNKeq3iHOHJ5wmQ-1; Fri, 09 May 2025 04:57:37 -0400
X-MC-Unique: 9y5MtUsVNKeq3iHOHJ5wmQ-1
X-Mimecast-MFC-AGG-ID: 9y5MtUsVNKeq3iHOHJ5wmQ_1746781057
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-acf16746a74so200232166b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 May 2025 01:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781056; x=1747385856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDWPbShizfOGB/EjWmdUWFa8dOmwyE7Lp4wOXMg3HCo=;
        b=BucdqX8hW8dYVuIkayM2rK+EkuDqxIUyiNSqn2fOeMzb0gpBzTatgp/6YmIFhocpsB
         2ktOEavdbsw2jqb7GAZ5KeI7ynxt/AM6a443jRVnhsb9/5ZBVM0A/b79q3qsm69q+HjZ
         SnIOx0hqS1vXrepcF4qJWOefAQTOdI0VXd1gFHQbFvUgIsgufvHFo/WMtn4xbyd5ve35
         eAYl7DofdOrDNdEA0qx9tysKOCCYYWepWw2EMmbGN0AcUUjdKg995vXhAhHKLxViWzCv
         696Ih4CPhEPVQ8skpes00B425i7KsyMaPfCbgqmalJnBByZ5TnaldZs3UHEJNPaJ9GRq
         LNXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO5Ytxl51+lQLksKcZdcitcu3gNw9CGWkYlO2MweE1ZtUsWY/3ziJXiWr5aIAn54ypb8Nv/wtkpH7z2XA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxnWH/VAHp/jERyQxVtHkOcdGDKX7/vj/xQ/2eFDjDzeLprALvK
	y7fIKs1fBxJwEiJIy6a2DhLfd4f7E3zopa7oT9CmTI7H6jZVHYZ3+o1Gdu7AYVBX5RniWEqxqtn
	WsAguF9pLSvfpzBHY4xOKPjslSOpJDEDwFht3ax9W69g0yUobGuY6NtdNo+LUwtE=
X-Gm-Gg: ASbGncuSChmsbsq1lj8Zc+lbwOngWuy5KvBvpW4bE/zl8/NmOCR1GEC7pKs0/CH26A1
	UTh+9TH9dld7V3BX4EU+6j5Y/G/wLCWNAuA7AyFhEoXgAxgsJ/zQhy7u37po+wykygg/f733Bsn
	R/EP1zHLbIG3ib1oLwhBNFNrWABCqO4FQC2bDrUgNcXLqt2tl48q2Tb09lpHkQTDB22YKNtEYOv
	DMNexxtMtIbOoVivTHNvCCYpGJtjSBwkdbVE3o7vn4F9ZYIA9j58Wfh+HeUUMGK7sNJo4fQHmMr
	8/w1JUlPfqvvgGBOkPWmLiACsg==
X-Received: by 2002:a17:907:6d17:b0:ace:d442:e3a0 with SMTP id a640c23a62f3a-ad2192800admr253472566b.39.1746781056555;
        Fri, 09 May 2025 01:57:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWC2UI3h5FxOwhQZy5rykHQm7izno8puX6wcw4GMYOzhRsRbgt+ZXqQ0AfZuUWsqn/llgi1A==
X-Received: by 2002:a17:907:6d17:b0:ace:d442:e3a0 with SMTP id a640c23a62f3a-ad2192800admr253468866b.39.1746781055796;
        Fri, 09 May 2025 01:57:35 -0700 (PDT)
Received: from localhost.localdomain ([193.207.182.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd37dsm117478266b.124.2025.05.09.01.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:57:35 -0700 (PDT)
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
Subject: [PATCH v4 2/4] tpm: support devices with synchronous send()
Date: Fri,  9 May 2025 10:57:11 +0200
Message-ID: <20250509085713.76851-3-sgarzare@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 6uJvljcIZEoFngGZvwd2e3Bh6ESjLWTXFwumuSxWtEk_1746781057
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
index 7ac390ec89ce..681661c93869 100644
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
index 3b6ddcdb4051..3dc06836f932 100644
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


