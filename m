Return-Path: <linuxppc-dev+bounces-7652-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B18CAA885F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Apr 2025 16:57:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zbr465PmCz3bcJ;
	Tue, 15 Apr 2025 00:57:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744642646;
	cv=none; b=DbaCBy7hVZ++QWoQG4wiWSpFmbRu8/1WEYUGbl4/u/uOdHCDvhVzLqXA/gb0NbUGRujnjG+aXqfe6lPpG+kFQ0Af9IePVFNg089w58LtVi9LNUj5uF04b60EfLfDyVZBEUeDE0weKXybRWkHJD8rE9z+r2EGyTWrt5F1zNJzp1QsBzAs0P5PDqKr342TLyqCmGjDOCGFx5zHejJuTjPK6LdIV1T98XYMxBZcCDNXX0tE3CwvRQgj1sgNtZA3thcLs7TGgKUibjqa+shipebMQPW7mHBuKxiKqfYogi3n0mLwCsA2EhsqRaAf00/Z+IzgPX+G08z7CfaJ6ICLETpbzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744642646; c=relaxed/relaxed;
	bh=8R/1ZeDKDjc3H414LGRfrF2tWtTtWCHG2fr+aJnFmy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=cm4yAAs8Rc+HOuw3+9iy8dp1IUwN9GK8W5ivA7H26pOqksE9GqJZ2navykyYAqga9Bk/pTD5ivodWPts/3cAI2CYRwEbg5baApXFlaaVAkhQDO7d98OQ8u2EQpR7T60/LUhfRG4oNfcbE512XZNslQWT6r4VyrwVrrnA8QUHUdgmxGeIzlebpYTKN4oH9OiGKdR/mlFAqZYQ9BD7CP9RUoeZ1ym9H65c9hFKS0RyycjTp+XNvKD7H5A3NM65yFG0C3ElhuhOhA3SfB9RU80EksgObxEy0hd6BrkEs6AJfIHS9iFUmEDyYDmBAU52XXM38PFWTB4LLqVpZxZOpIbGHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FMdHDRwb; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FMdHDRwb; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FMdHDRwb;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FMdHDRwb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zbr460MYgz2xlP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Apr 2025 00:57:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744642643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8R/1ZeDKDjc3H414LGRfrF2tWtTtWCHG2fr+aJnFmy8=;
	b=FMdHDRwbD5kIOf9GkdRPZ/JQJAyBNnsKCn+yzpA4hhqqmHCxX4FLuEJDdj+/oB7rTQbo2Q
	sJoWSdq9/j5DJVaf/futL7BxTa/AqpXZuPXbnluHeD0tsIm60TUncHssK7RR08ViRv4ofi
	PTjkB1XefnI0abkaw6LeOm+ZELkDJAY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744642643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8R/1ZeDKDjc3H414LGRfrF2tWtTtWCHG2fr+aJnFmy8=;
	b=FMdHDRwbD5kIOf9GkdRPZ/JQJAyBNnsKCn+yzpA4hhqqmHCxX4FLuEJDdj+/oB7rTQbo2Q
	sJoWSdq9/j5DJVaf/futL7BxTa/AqpXZuPXbnluHeD0tsIm60TUncHssK7RR08ViRv4ofi
	PTjkB1XefnI0abkaw6LeOm+ZELkDJAY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-c1G-5ujNMZO-Xl5FoMwNiw-1; Mon, 14 Apr 2025 10:57:21 -0400
X-MC-Unique: c1G-5ujNMZO-Xl5FoMwNiw-1
X-Mimecast-MFC-AGG-ID: c1G-5ujNMZO-Xl5FoMwNiw_1744642639
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39c30f26e31so2988624f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Apr 2025 07:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642639; x=1745247439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8R/1ZeDKDjc3H414LGRfrF2tWtTtWCHG2fr+aJnFmy8=;
        b=eJljSdx0tE+sQc/5zyJqsuW5lgBnTnvFdqetlnQ7x6RUT5SDxdsYXOQ5d1e8UTdAIa
         ubz9clR9lA0rNpQLxXZ6NErq8z8WJVswleByoerui8bsc2+WenfDjwJUzifpiDrvrJqK
         EQpW1kwK9H4wT81H9P7VY0vFec/ojLv5FwvS3vo029zUxYddjGmhSdMqBI3wdT2sTGVb
         HBopXDRVVAczGSH9GHluLEqLQlBBrmvev7sRwqc+iYcHhU9wEkzAs4+/78/4FYl9nPcq
         SxPH4uWzYU27jKQeufWkAvqqJkYToDxGUSLXHsBGHDKvKD12wvUM1YzprInH6XwvOMOX
         p0pA==
X-Forwarded-Encrypted: i=1; AJvYcCUnPgT4s3MME19LDwchPZH2XlymZOCKNHs6Dox4RnFzuHWMr3Vy+PyntdwROxXkTItWaMTMMPeXxU3YPNg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwlHdfX/3ptFrbH/79YfT+Tu8xYpw6z52UBb5aCnjOIeDPBvON6
	cJvsm9tzguSNAvbJxyQyVYX/Dl9FSzr20/EGa+ZfHQXDYleewrXLP66IIngYYV4ALqE05kMY3G8
	rp32Ex3c3TCtb89m1xHaedh6+UIS4Ms5TfWx8LDyWkH9vrMQ94Vj3YvZs0Sr4wuA=
X-Gm-Gg: ASbGncsXDQ1GEWy0N2feFN+ScHBPdLQMvfbTYLjI7YOhe2iOWkNPZUePG80pabrcRU4
	sPd6Hdy6fkmCnUt6kP/ltFa73iwHguRuphuppKFO1OLAol5h6cn/l8fuGSA7q4iuXq2JICIX3iJ
	1espbI44klNJIxp5BjR0eAQ8fQbWuX6qdB1ZtPLplrMZwwPS0n+/uIjb7J7D+4fdD1BPPCC89wV
	hqhH5gbIANrZuH9DHVlCZJnZPVLxowiKbeBlGuMSPX8XWndF/J2aRpOKmlA0f6/2DtieCWP5VGy
	lAAbeKJD5+HvcAzw9JRkOtAC
X-Received: by 2002:a05:6000:1787:b0:390:fc5a:91c8 with SMTP id ffacd0b85a97d-39eaaed2015mr9037537f8f.53.1744642639383;
        Mon, 14 Apr 2025 07:57:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHztG+erjxi0kPl4f2XqgvwdUxEBu7vsO7NjlFZ0D8kctkVzUnk4g2BZgxZgM+ahM52VN9G9g==
X-Received: by 2002:a05:6000:1787:b0:390:fc5a:91c8 with SMTP id ffacd0b85a97d-39eaaed2015mr9037507f8f.53.1744642638681;
        Mon, 14 Apr 2025 07:57:18 -0700 (PDT)
Received: from localhost.localdomain ([193.207.151.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cce3sm11395582f8f.74.2025.04.14.07.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:57:16 -0700 (PDT)
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
Subject: [PATCH v3 2/4] tpm: support devices with synchronous send()
Date: Mon, 14 Apr 2025 16:56:51 +0200
Message-ID: <20250414145653.239081-3-sgarzare@redhat.com>
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
X-Mimecast-MFC-PROC-ID: Q33WRG4W3fUTuBMb0hDkHfnjqtFmhoX5X8AgUbYFQ2o_1744642639
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
v3:
- fixed comment style [Jarkko]
- renamend `out_send_sync` label to `out_sync` [Jarkko]
---
 include/linux/tpm.h              |  1 +
 drivers/char/tpm/tpm-interface.c | 20 +++++++++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

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


