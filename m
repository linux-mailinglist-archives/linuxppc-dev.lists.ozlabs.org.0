Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33688851E71
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 21:08:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=cj+Gm/K7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYbBQ0k8Wz3vkS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 07:08:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=cj+Gm/K7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYb5m6spWz3d2x
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 07:04:44 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d72f71f222so28160905ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 12:04:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707768282; x=1708373082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:dkim-signature:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=db2Uhnapp+w5dyUlo+M8v03nvRL1AyZA94jDVlSeXjQ=;
        b=Op+EVSLIjGr7vYkox7F4HXCXuRYVxcAmqBhOzsESNI37zD4s1OuvcirudHxynDYPGQ
         bOJ4J3rYqT5P006N/pW4Jm9KsUIfWULvRxIPlOyAS4cwkskVOHWU38CoigAJOPSq7hmi
         ipVNZNCklC/Dj++G8UayHDiT/y+cEbAekwNH8LoXmw+Qld+aPNLA4Ox3+b3leRdgrTma
         mN6SbwwOV2HV7MUujYJYTzIFLpxt1rjwuCBM3Zt398A8zBWJbomrkNzrswvuz0cDSzh3
         PNA/iaIQOVdXK622xMbA1udNhabJEsfmHSuXvWhhFB+F0323Ghm/pMypDXOxAr4/BAlL
         Rv7w==
X-Gm-Message-State: AOJu0Yx6JxaR2+c17SwDucRh76JdCiWbVr9JL+4/2UNCmjN4OEGmbKSQ
	eY/7+jfgBfFXRDehSWrJ2acbEsTX/Xngu3g1wdn8/xeOAmrJuYyV8t5h0yk6tiwMXQ==
X-Google-Smtp-Source: AGHT+IE8SVcMxOkLwBDIRmqSz/zr2jQon8D4r5B9AFrKXhLXIulNq2CR9/4ML5XN80KSjvnDri+oBw==
X-Received: by 2002:a17:902:f809:b0:1d9:427a:99b with SMTP id ix9-20020a170902f80900b001d9427a099bmr6869869plb.32.1707768282176;
        Mon, 12 Feb 2024 12:04:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWh06n6YhsaJA8HcOSOeEyE9tkWsBCUMlmMXjeAnxBL4mwLpDYhrSU2gThu1OCwH7Tau36MBJYZphBqkJchgGjcyncBBsXHIJruIwI8Ole3n3F9/VRVKVB2qTX2N58J23sA47waUHOedZm391zeUNE+j14/lsHLrrhmeE9snpx+RZDvn6UQTIuX9YkVt8JooBJawbmG+IUTM/zc6+4pJNgcrM+SSCcdyLXEva9I5s2NuwFIeFRTfdz/ML1VMMmAhCF2D7ZeKLIjeIFTmOQB
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id s2-20020a170902c64200b001d958de13c7sm759098pls.0.2024.02.12.12.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 12:04:41 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707768280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=db2Uhnapp+w5dyUlo+M8v03nvRL1AyZA94jDVlSeXjQ=;
	b=cj+Gm/K7r/ULgwd1zluQ8A+gbU2ta02TRefNIMEOMo0pSU1uNofUxpm4ooY+ye2Iy6fHzd
	XlX/D+Kz7L1VgVRzoTUFqmBOT9oZGmouYaiKKAAmhvU/bgC/+v9k1GhSrAfhWID44UVfxS
	EN55cY/ZxwvygA3SM9wJ7CbIju4vcYE3Qht4GWa/PssSB64Yx0ppDk4GHnl+5ZyLtKwQkh
	/zpDf674RgUBRT2n3i181r1hIzyKtkiaZBJwiYeemDB8RcsiRwTlgwkellA93FfVNmxYxg
	9Ap6d8BNw/d9/OeWUgoM6AEQH7xlb82Q+yOWADkwBn5SZqO0R1qT/+g3M6ciAg==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Mon, 12 Feb 2024 17:05:03 -0300
Subject: [PATCH v2 5/5] powerpc: ibmebus: make ibmebus_bus_type const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-bus_cleanup-powerpc2-v2-5-8441b3f77827@marliere.net>
References: <20240212-bus_cleanup-powerpc2-v2-0-8441b3f77827@marliere.net>
In-Reply-To: <20240212-bus_cleanup-powerpc2-v2-0-8441b3f77827@marliere.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2050; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=nVdAcq5qBuV+u2+BDT0vbbPtDSUMY5Jwqu+E2afCaAQ=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlynnv/phT/tgLAi3w01xX1x1lm+XkR/vq3YP08
 H7MNNK8uo6JAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZcp57wAKCRDJC4p8Y4ZY
 pqLmD/wIPQTXfZHkPBsZz+WbeisckhU1iPI9/FW4ze2PGk/olNSI56xfFPbRxqvEQpuVUjym3t3
 Rx7QRjXneci1tfF+gw7xi2JJIAeXHtECUF+sox6V2X4B9SW9i35gGWfQHAZMUgyuJew/UuFWkW9
 II8liY2MgGjEhVDudIf8uaiazWWzQiS5INaA6NtQdDgjKWRLO8bZ9jgOh41GSRbmJ6ce1RhCan4
 q+QChn0KQKd2xTCxGAC/5cffnhOTyqhDW98TLHou90NiFJR4lAGuI1vu87fOsJ7466CT95W82iv
 th6FiAUmNSErQkN4uHdr95oDgXsx/xQP73ccL+TRNiAZmy+opUIvaxZXyG29euJNIxdQnfmGZV/
 j3UnxUIzcx7pVierP7VmNtIb7I1ISXYyVRdtmBYepA6p57OdiSkpizqoM/6+Rts55swvYVIQ9bl
 VkwMmBHWio39eH0MKHv8HyDOY4uBsJbvPD5qrPZiv6ukIsbyaJpv8d+I6JgUSqhOzYJeMezFlah
 kLxLtsQhvIf/UgmB0FAfmkBLSse5FhFGk6/18o+fx0Ix+VNLD+JT48G99Fyv/MUdfSK82izeSiC
 cF/9SaUKQTYG93oeKu6+dHB0zGDihLVkUyZ5guQDxwJZez53nwi8VhxF7keoTqTuE3oA61bl35x
 YIjcK1OIQ3FScuA==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Ricardo B. Marliere" <ricardo@marliere.net>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit d492cc2573a0 ("driver core: device.h: make struct
bus_type a const *"), the driver core can properly handle constant
struct bus_type, move the ibmebus_bus_type variable to be a constant
structure as well, placing it into read-only memory which can not be
modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 arch/powerpc/include/asm/ibmebus.h       | 2 +-
 arch/powerpc/platforms/pseries/ibmebus.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/ibmebus.h b/arch/powerpc/include/asm/ibmebus.h
index 6f33253a364a..46fe406f461c 100644
--- a/arch/powerpc/include/asm/ibmebus.h
+++ b/arch/powerpc/include/asm/ibmebus.h
@@ -48,7 +48,7 @@
 
 struct platform_driver;
 
-extern struct bus_type ibmebus_bus_type;
+extern const struct bus_type ibmebus_bus_type;
 
 int ibmebus_register_driver(struct platform_driver *drv);
 void ibmebus_unregister_driver(struct platform_driver *drv);
diff --git a/arch/powerpc/platforms/pseries/ibmebus.c b/arch/powerpc/platforms/pseries/ibmebus.c
index 998e3aff2457..b401282727a4 100644
--- a/arch/powerpc/platforms/pseries/ibmebus.c
+++ b/arch/powerpc/platforms/pseries/ibmebus.c
@@ -55,7 +55,7 @@ static struct device ibmebus_bus_device = { /* fake "parent" device */
 	.init_name = "ibmebus",
 };
 
-struct bus_type ibmebus_bus_type;
+const struct bus_type ibmebus_bus_type;
 
 /* These devices will automatically be added to the bus during init */
 static const struct of_device_id ibmebus_matches[] __initconst = {
@@ -432,7 +432,7 @@ static int ibmebus_bus_modalias(const struct device *dev, struct kobj_uevent_env
 	return of_device_uevent_modalias(dev, env);
 }
 
-struct bus_type ibmebus_bus_type = {
+const struct bus_type ibmebus_bus_type = {
 	.name      = "ibmebus",
 	.uevent    = ibmebus_bus_modalias,
 	.bus_groups = ibmbus_bus_groups,

-- 
2.43.0

