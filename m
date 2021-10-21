Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD534359B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 06:05:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZYm1097Lz3djb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 15:05:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dmC/AbxA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dmC/AbxA; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZYXN4jzpz3brd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 14:55:00 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id q19so4721205pfl.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 20:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zu5KRphZeWP1V/tNwiBsxoWshA0nNYHtx7ymVNXLm7o=;
 b=dmC/AbxA2RPsu4uhQc5BzZyZv6CqRiP0bLEVGIdmM+xVyC3ndzC4VWK/RygoRV/k1U
 7gBL7EYfK4fOauQJzQEnE+oxYLG1JLdG1Siw3MZDHPaB21I1pJWnzJnItC2Oa+terO0S
 tJ4bF/r4r8PKy729EHETkRBVSDpTpi06hvL6aHHP7Y1/mtkfmcPymCUa/mWymRBz91xg
 XLQMVa2KSZG0nZDLU+hiZrlgRai8uXGW3u0igjEognxWuKboXgwHTLtT1Fo6E/qirECa
 Kty3iQe0cBU+3hcK29wGWDZZqNoKRa4v7XHNpp7YhmXNkiD8p8l5/AyL98ZEGIAyxjk0
 XXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zu5KRphZeWP1V/tNwiBsxoWshA0nNYHtx7ymVNXLm7o=;
 b=trrnH2DxCqzDEhCMtVPtEbzs9kgrMghNVK51jcmhs0+cTT4tVl0W49SDvM0OG7eazG
 o7cr286TSPWk0mZ4AGNJyqdwBr5a3I+013CyxzpZyPqQNDyhMjnfxy7Ew0c5NXs1Qm6a
 /ei4VWp6uyjCARcEZM6pb2rIoHti2a8hQzlkwBbjBFgOrR+E0boSwcxOs07Ss3RRwTg/
 RIbKQiGdzlRO1QbAGwOULZWLPbrswKn6FbjQuHodz3+TPMLCpdi84+pK4/CuYbkyVcij
 OfVsMp86Rva85aJT3Jo/+Z/PSXx8N8oeYuN0Dm6TvRu2t1oxRb9FtGO8lE2/cQADQmtE
 P4aw==
X-Gm-Message-State: AOAM532fd5aF5Po4fZ7XI8jcZGPJzmvgOEZPQ2msiSJXBywqGt7FKkpa
 +zrG1BDb/rME/vOD5AdeQBr7h8SYxRI=
X-Google-Smtp-Source: ABdhPJytw4f1EboqQHYY3BB4NZuChrvO/qPc3/+Sq6mGMNsUB727LVxmHHvZWoKwtOJv1+UlGNl7MA==
X-Received: by 2002:a63:b94b:: with SMTP id v11mr2562794pgo.145.1634788498135; 
 Wed, 20 Oct 2021 20:54:58 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id t9sm7369249pjm.36.2021.10.20.20.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:54:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 16/16] powerpc/microwatt: Don't select the hash MMU code
Date: Thu, 21 Oct 2021 13:54:17 +1000
Message-Id: <20211021035417.2157804-17-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211021035417.2157804-1-npiggin@gmail.com>
References: <20211021035417.2157804-1-npiggin@gmail.com>
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

Microwatt is radix-only, so it does not require hash MMU support.

This saves 20kB compressed dtbImage and 56kB vmlinux size.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/configs/microwatt_defconfig | 1 -
 arch/powerpc/platforms/microwatt/Kconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
index 6e62966730d3..7c8eb29d8afe 100644
--- a/arch/powerpc/configs/microwatt_defconfig
+++ b/arch/powerpc/configs/microwatt_defconfig
@@ -27,7 +27,6 @@ CONFIG_PPC_MICROWATT=y
 # CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
 CONFIG_CPU_FREQ=y
 CONFIG_HZ_100=y
-# CONFIG_PPC_MEM_KEYS is not set
 # CONFIG_SECCOMP is not set
 # CONFIG_MQ_IOSCHED_KYBER is not set
 # CONFIG_COREDUMP is not set
diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
index 823192e9d38a..5e320f49583a 100644
--- a/arch/powerpc/platforms/microwatt/Kconfig
+++ b/arch/powerpc/platforms/microwatt/Kconfig
@@ -5,7 +5,6 @@ config PPC_MICROWATT
 	select PPC_XICS
 	select PPC_ICS_NATIVE
 	select PPC_ICP_NATIVE
-	select PPC_HASH_MMU_NATIVE if PPC_64S_HASH_MMU
 	select PPC_UDBG_16550
 	select ARCH_RANDOM
 	help
-- 
2.23.0

