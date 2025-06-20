Return-Path: <linuxppc-dev+bounces-9586-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70579AE1B7E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jun 2025 15:09:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNyTs07jKz30Nl;
	Fri, 20 Jun 2025 23:08:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750424928;
	cv=none; b=ThUdGJUJI/7J/yQ5pxRtfRdwa254aSvhBiECBmyKLzqCuSBC1PfZ2Acdq60mxZRqnjU2zYT+IHOgE/GMHQEdEiBG73ljSelMkXM+s5YibAEDk4wNOhR+7jj7mU2L3yOqkImGpU8aR+w0HF1VjvEqD2HxhBh4U4tiNLdLOcyTWeNHLCpgalKXh4N6xnub+7K6ezxw78Iz4o6GsUYYveYPtLlPegY32wQk4f7vyhjYNI7OhgTi4yDahOAL7YZUuprliAaZ0XsKfBx0ZdN2mdPPSFXzEtkJc/aehSXq3GuUMSykTgpxMsFm2FydDlmTEBRsQikq/G4+y1JOJGql0xL8qg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750424928; c=relaxed/relaxed;
	bh=mU6fRW0bf+EYAAFC1zO6IHYHxJSiouX7LXjrsfJfSvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=d1WsSCQC2GHkKShu4aX+hhB9NRlhUkS2BxwRsAbO3H+aGgnYQnyU8r/BD+92Fk6N4yjDkvxX1nZria1tWTFb9hs7F/Qd7MglGwcHGSaUo8yWslPcF3IQmt1XFj8rTLdohIo+Ck3x/xgecnm9V7g97zyL84c/4dOCeBJJMpnaUFKX+mZnoJ5f3pab0dBIhbmD80NZLXmg8IdhuBEnCEiD3NM5/gbQ/1JCRTGSqa9o8cuznm/nJ2C+ilgG/NfZhVjZ00Yas81gqCrXh3uBIKh3T3WAT6q+nbhNcFjYxrEhR5AVCdgo+jnEBm7Q9POKZVXWXWWJJSDWl7JzSw1iHndTBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dk30oO2r; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dk30oO2r; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dk30oO2r;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dk30oO2r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNyTr16c7z2y2B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 23:08:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750424925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mU6fRW0bf+EYAAFC1zO6IHYHxJSiouX7LXjrsfJfSvc=;
	b=dk30oO2rieCXJMkxfbLkWi+HiTG0SXpMqwJ3dcHG2eNtwkyVmLbeAdcjQyOY369EQ0noTu
	SGoUchhwD6GsEMbtWLDmJ8es+hXylCSxCs92MD2aPFX0EzunOsDtmtq8Pa1rDBIA9SMiOy
	585J3axf8p0jSTz6mzGbzfMqgD1wsOk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750424925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mU6fRW0bf+EYAAFC1zO6IHYHxJSiouX7LXjrsfJfSvc=;
	b=dk30oO2rieCXJMkxfbLkWi+HiTG0SXpMqwJ3dcHG2eNtwkyVmLbeAdcjQyOY369EQ0noTu
	SGoUchhwD6GsEMbtWLDmJ8es+hXylCSxCs92MD2aPFX0EzunOsDtmtq8Pa1rDBIA9SMiOy
	585J3axf8p0jSTz6mzGbzfMqgD1wsOk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-uaUYYEoNPgm0XxTsS0IRXg-1; Fri, 20 Jun 2025 09:08:42 -0400
X-MC-Unique: uaUYYEoNPgm0XxTsS0IRXg-1
X-Mimecast-MFC-AGG-ID: uaUYYEoNPgm0XxTsS0IRXg_1750424921
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a5281ba3a4so864969f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 06:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424921; x=1751029721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mU6fRW0bf+EYAAFC1zO6IHYHxJSiouX7LXjrsfJfSvc=;
        b=VxhApwwESoVVMVDe4r6c0YNuU9f86tErdrtdZJNaM8FAsn3RFZK8rwhifetBfLbnjW
         UBWhV5sHL8hx3EmbU/t7qlmZs7RtxNO0DX8QH+mjKa/HYxashMxjPl0+iIw9dgs8i+7Z
         Wd87wyEGP+GE38ypH/Dk86YhU9kc2EiJ9gREZkWZn3YiHaZvzmDbDnLiqEY8T0yYUQ/X
         4fQCxcUP13TgOh0BQQLRrfB9Z1Lnxc9WQ+1LfvIUxrMS7or7DwatWnjPsO5ubwWN6hel
         XAGznIOwgZVh65xvDBIg6aOGsDTLYKrXTSsj3tgxQeRMfHplvU5BcrfHkl7eyH8RPPMO
         ZrOg==
X-Forwarded-Encrypted: i=1; AJvYcCVFYlXBcfIJ2nmvLq+XpAKUrAxW6rgly1MiPidiLxdL4X5I1Uldhk4EzlY6+BBzUagrfCx/Ri9Ibd+Y3mo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyL25nPnqKOfBRlzygKEk6xv1CiZJi4zWEiREJcWgSDYjpqxx5e
	L/SkLBEKDdsJriul7s8ijKNd1D42DlDWWXJ6yG7/zKDLStw1SE+CszTkzW/lSroBaD05eQZ52L3
	kmk58aFbFU075CMfrXxffPd+1eTcnqzzYNiQ8pIYMs5/UZt6GvL6O4B4PsYRS6VNBzSU=
X-Gm-Gg: ASbGncsVDUznpUzjfXEcAq6dPxDTVPrw0otWsDJlUhA8/j1eyGSPsOsHGRyeMDQrqQz
	S1oQ+DeuCDO8MlEFORVVRycRBpL+K9imxgAkgrHs6E+MA1ebhp18GUaj3JpkmmeqGWyaikUWZ51
	YJ+SSacYi3cAPqk5Nkbo5pDASrU3qDbRS5h8n4FpomrDPU+4pbpIu+gCBhqmicLl/fQ7Tbh5aZq
	sfzCrX/884BNFyNZshxTSJ6dnZ+ZgXa0Mk9Q4WTD9GQMwvb5XMlog14b86I9wIE7NAxC5FOzxwQ
	/vwQkOUl9LRN1voaM4CTaZ53CBF6ZHfwtto=
X-Received: by 2002:a05:6000:2dc4:b0:3a4:c909:ce16 with SMTP id ffacd0b85a97d-3a6d12e8b9amr2295000f8f.49.1750424921107;
        Fri, 20 Jun 2025 06:08:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMsc23lsWWlIHXqE+KHJfC+ZldUu1vo9dW8yxZbj2jYFLBGKoFW23IJVfV5e9H69ci92Gx7w==
X-Received: by 2002:a05:6000:2dc4:b0:3a4:c909:ce16 with SMTP id ffacd0b85a97d-3a6d12e8b9amr2294941f8f.49.1750424920468;
        Fri, 20 Jun 2025 06:08:40 -0700 (PDT)
Received: from localhost.localdomain ([193.207.146.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1815dsm2006309f8f.28.2025.06.20.06.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:08:39 -0700 (PDT)
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
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v6 2/4] tpm: support devices with synchronous send()
Date: Fri, 20 Jun 2025 15:08:08 +0200
Message-ID: <20250620130810.99069-3-sgarzare@redhat.com>
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
X-Mimecast-MFC-PROC-ID: r-oSRroWWHfH5MUpw9fyzhiF6-JXvEOhU8IIuj3df40_1750424921
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
index cafe8c283e88..804fbbe3873d 100644
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


