Return-Path: <linuxppc-dev+bounces-10391-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E325B10549
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jul 2025 11:11:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnlcK5kVQz30T8;
	Thu, 24 Jul 2025 19:11:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f34"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753348289;
	cv=none; b=TCFIx4DchymyRQ1oZn5Xl2bglXXxYODhX4RGaH6UZSdj+HrYS10H5z0AvKnsJLS6xGMO4vhSM4gyIkAK2c+8BKsVXPpoWVt+V2PvXDlMLIJdbWYQsQsw0DuGMmGRhVFaGb6KlUhO6HD5SiKHfCjTD6En09OpdGIO808GgXioX8WHbwbS7oOPnpjUncubHFrNH6pTo5Ju3K++6y27uRMLX7ixEQdSrcf+ojdsicyM30S7skRrslEr92lUk9E6kyM8gAv4hJ4DWGd4eZbiXUaDV1zQDEQ6Uw42iRtoLsXhJ8gHkuWx+Y7S3JkiENJNlup94wgXSWw9fdcwgg2gxLfzHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753348289; c=relaxed/relaxed;
	bh=SUpZoTRQ8PHSSxzc5T9RmNDL3NO3Oqu60AwZYecA4DI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=djAjZTpzBdDmaycyM/EXIvDptByfYU5UheO3bb4m1wugIUnEaYiaXDrosrqTEVcuUYsIXpLIil2TKzQ6NxcXRUSi25IDLp3Rn1vXDqEg79sr8CCP1Cj7UhNA1KcyZEqNuY3i5qePcjJidfb1sAgZErhCfgpQcnsRgTn6pIgH92KA26n3B0vtcKrUQMBH6d4dtPyvm6LRZlKO6dtSGhlhiAikeZoKnSpIEeO09CcyvjyeSjnrgzXCybV7nmZjdoGRUak5sP/aEiTMo07qAOF94qMYyqYTiyA3vvukZQmh5sG9HCy/AN4hEoqD09eCt9NpYN0AhUxGVGE8w8l7EoVXdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R8l4JMsf; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f34; helo=mail-qv1-xf34.google.com; envelope-from=salah.triki@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R8l4JMsf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f34; helo=mail-qv1-xf34.google.com; envelope-from=salah.triki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnlcH6DVRz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jul 2025 19:11:26 +1000 (AEST)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6f8aa9e6ffdso6760386d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jul 2025 02:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753348283; x=1753953083; darn=lists.ozlabs.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SUpZoTRQ8PHSSxzc5T9RmNDL3NO3Oqu60AwZYecA4DI=;
        b=R8l4JMsfnSoZUJx8JSTy5WP1zwaSUu1SctlOw+AmyvUy1llsNBaRVT76om20zTyC3e
         HyzryqEIU3Cu88lSY+AcUz18yhjLT7qSQ66XMM3fRgR2Q0G/xqj1vf51GBBkUw+XnYii
         rl3UWo6AwEhR6LBbT7vsZS+Ls1e5G8cqWEZ5vEmbwtjUlRI2M4ifKa1pVnizFH4cE9Cz
         EZeDSSsU0/3jqv/jfMUi+4gpnw0oX5HzC8DFIwSGTDbqY75trtpM1m+rTGqz4sQidp99
         Sjzplwa0ihZLH07yukFzqzxhHHSa8xkqbKaUeIckl1+ufSDbVh12SOmwx0TyYMpuK77p
         6oyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753348283; x=1753953083;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SUpZoTRQ8PHSSxzc5T9RmNDL3NO3Oqu60AwZYecA4DI=;
        b=UoRsWXuMKD8kVDKM06Zv5HNOFea7Si3/aTfyDpJz6gtQabzHupWbRWk8pur0rlgaiF
         MXkB0Ar5pVYlE6TwrQPpXmFZ6HIIvBb6ssv0v8ZncQSbdQ50ESClEovdZlpdoFqb74b5
         mR0+H0KFdOXaWbWfCOxzIx3tEE3Pu87Ht5kGRAabS04IQBc3U/ZWsZdIi6WpI4NSIjxW
         JzkfQ6jOQI5xoqnlVvAjfmWLve6DxR9bfRl/Pe6iZXUdbk4twXSRUif9r/ImJINUpLVx
         qpKJUWOg79oDI13gNOUS8Srqc7G3kotIcHtmib6mUMTtQSaoH5jzKzt8PiBry4zSxvZA
         vkBg==
X-Forwarded-Encrypted: i=1; AJvYcCVL+pAK+nlT3vrIFbgEiJF+GRKczDA0Zlbrsd9cUHxhSf+tZCasY4ZiRA+J/HI6kqT0JyRrtoN0rshysDA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwTUqnG9CsD/e982deQOM7Du7UWZJyWZtF7oNbBSHV0Neqq1DTL
	UugrOY3ucpVAjf5BV1wOSeXoM7phAYuaC+gQMJiHPSN8Xc9iQz5AqfOa
X-Gm-Gg: ASbGncshy/U1aYd8MwMM/v6tk5fYGLCJtMpXZfH70n+52jdu278nPc22kxLJ0OXWaHw
	E7iQP7pdf+ixB+GBdThkgCiPYf2BxObLzy2WfZ+ZpVtoRLnp3muHfw5wBsRRUqjRVBZfKr216a0
	8POj7AYmp9x9gONYJGgJR0A5I7rcUYq1oC4x8bQH22WBThKHYpe1pVtmQ/xtYVQii/ctW/2jzaf
	5Woen6Fl126DQd3yhIZm6s1FJ6UMUo8iefrRYwXhK0zaEVsExIJ1giLHVk/BlEM3GTnIkEe0nUi
	MqfiT6+1nICECwo6j1wTxWPfFLiBS+JvNgx02beOZwtwc4PbP919td1uBBUXBraU7jQrj/b7Ref
	8Jgn4ILgIeeALObrUYg43
X-Google-Smtp-Source: AGHT+IHO4MmWhNszJAhYF7A2fvJwzKpVbb06gfKWDB8KDmO4dX7UTL8XS8aa/TNr1h4dn+AU9ra1tA==
X-Received: by 2002:a05:6214:1cc7:b0:701:9d0:1408 with SMTP id 6a1803df08f44-707005665ebmr81663376d6.20.1753348283342;
        Thu, 24 Jul 2025 02:11:23 -0700 (PDT)
Received: from pc ([165.51.88.28])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7070faec0aesm10781906d6.8.2025.07.24.02.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:11:22 -0700 (PDT)
Date: Thu, 24 Jul 2025 10:11:19 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: salah.triki@gmail.com
Subject: [PATCH] bus: fsl-mc: Check return value of platform_get_resource()
Message-ID: <aIH4t9Ekj8hn7EEk@pc>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

platform_get_resource() returns NULL in case of failure, so check its
return value and propagate the error in order to prevent NULL pointer
dereference.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 7671bd158545..980d427e857f 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -1105,6 +1105,10 @@ static int fsl_mc_bus_probe(struct platform_device *pdev)
 	 * Get physical address of MC portal for the root DPRC:
 	 */
 	plat_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	if (!plat_res)
+		return -ENODEV;
+
 	mc_portal_phys_addr = plat_res->start;
 	mc_portal_size = resource_size(plat_res);
 	mc_portal_base_phys_addr = mc_portal_phys_addr & ~0x3ffffff;
-- 
2.43.0


