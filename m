Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8F53F9CA4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 18:38:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx5521dygz3db5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 02:38:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=O/R49zTW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O/R49zTW; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx5085yFlz308w
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 02:34:32 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id fs6so4899588pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 09:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gc5u56Oc09q4exYlp/ObIY2KDidZ0lxkdobguxS+Ct4=;
 b=O/R49zTWexF660JzoITdJGj378jQCamQZyUEbShGLIxNh3LwNB3A4eVvXlj7Xn578W
 Taqhe+XtPJpCGHACMl0MnBQmeWCNuXQBw7NrdhA90drbUW/ZWv3VDo1ZVBPU/7baE9po
 fskqF4O0+s8d1cUAI3ddFVOu7jNv1RB3z7sIZCBG5y+MgbR30hWr4QNodYcz2R5gWPmk
 OYUDAdu+SjNF1E9TN7IC1GHjZOA7DY7kUFRHv4w2cUkztVz1Uv5KS4dOfdXpOTAir4P5
 zmQX1GSuDYbfuKqnFWqDB8w2pz95yTcJR4Bdd/cMGsH37OdOgMf86N+d+4J0kmJUc7JM
 4Oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gc5u56Oc09q4exYlp/ObIY2KDidZ0lxkdobguxS+Ct4=;
 b=snOLy19eHU6M6J0yniyWalHAHJPXWuraMTA6pGiE1SzR3FghUvM70hQc0qBaAj+nFX
 sGdlVBNV0HhIuptjKviHyaw7LE2mQ3CvwlHSLMy4JB6/6bEpVcfmrKb2qh8DibjKxbSv
 MH/HPUeVUH8ZwV+fc365hbImQYCdBqa15TvVvF3oZUsSzDbeGqK6SDeDec9Yop78Qfwr
 yWfLis3+tAwRHkTGQi0PJL5AihtIMXY8n2Yw160dzEDg6q6bkkbDL06bmP4rOQ7gxLIU
 /lM++GHThsqg7Ky7KHh7B1+uTKp8k79xzAr3Pd6wew0LKaq8xq/1mAtFHPdUWj7IfvNR
 eOGA==
X-Gm-Message-State: AOAM533nBT38vYX13CndellG/nL2HqPLpN8N88TpzqJpp1LAxN2jVdEn
 7TygoiuXlfKqnIHMAAiYpsJvpQIatEg=
X-Google-Smtp-Source: ABdhPJwTK03fNZkG72IOdFGKN6YcjdGibTLKMDX1KjBfsVt0D1t9vGy0HQMlmoHA1hEHbv2q3Jcd1w==
X-Received: by 2002:a17:90a:560a:: with SMTP id
 r10mr24596309pjf.86.1630082070420; 
 Fri, 27 Aug 2021 09:34:30 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (220-244-72-10.tpgi.com.au. [220.244.72.10])
 by smtp.gmail.com with ESMTPSA id u24sm7083852pfm.85.2021.08.27.09.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 09:34:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 6/6] powerpc/microwatt: Stop building the hash MMU code
Date: Sat, 28 Aug 2021 02:34:10 +1000
Message-Id: <20210827163410.1177154-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210827163410.1177154-1-npiggin@gmail.com>
References: <20210827163410.1177154-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Microwatt is radix-only, so stop selecting the hash MMU code.

This saves 20kB compressed dtbImage and 56kB vmlinux size.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/configs/microwatt_defconfig | 1 -
 arch/powerpc/platforms/Kconfig.cputype   | 1 +
 arch/powerpc/platforms/microwatt/Kconfig | 1 -
 3 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
index bf5f2e5905eb..6fbad42f9e3d 100644
--- a/arch/powerpc/configs/microwatt_defconfig
+++ b/arch/powerpc/configs/microwatt_defconfig
@@ -26,7 +26,6 @@ CONFIG_PPC_MICROWATT=y
 # CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
 CONFIG_CPU_FREQ=y
 CONFIG_HZ_100=y
-# CONFIG_PPC_MEM_KEYS is not set
 # CONFIG_SECCOMP is not set
 # CONFIG_MQ_IOSCHED_KYBER is not set
 # CONFIG_COREDUMP is not set
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 9b90fc501ed4..b9acd6c68c81 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -371,6 +371,7 @@ config SPE
 config PPC_64S_HASH_MMU
 	bool "Hash MMU Support"
 	depends on PPC_BOOK3S_64
+	depends on !PPC_MICROWATT
 	default y
 	select PPC_MM_SLICES
 	help
diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
index e0ff2cfc1ca0..4f0ce292a6ce 100644
--- a/arch/powerpc/platforms/microwatt/Kconfig
+++ b/arch/powerpc/platforms/microwatt/Kconfig
@@ -6,7 +6,6 @@ config PPC_MICROWATT
 	select PPC_XICS
 	select PPC_ICS_NATIVE
 	select PPC_ICP_NATIVE
-	select PPC_HASH_MMU_NATIVE if PPC_64S_HASH_MMU
 	select PPC_UDBG_16550
 	select ARCH_RANDOM
 	help
-- 
2.23.0

