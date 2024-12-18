Return-Path: <linuxppc-dev+bounces-4311-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1C49F642B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:57:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrFH2j15z30h5;
	Wed, 18 Dec 2024 21:55:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519347;
	cv=none; b=c5OHZ2bGANaw5aZqU9SzJF5FyMk5t4pJ+b8lRKoMgYc3zKN/83E+dM/VYUQpzmk7VoEqFoY4tk9ZD7JBn8A8OgljpfPuTE29w5QmnUkTS2R1f0LiZ4GEWlNUQk+R21zSg0PK9MvcuWJGy6GFGY/jKLcXm+Nuhk5tLNFlYY2s7NTLA548eBCSIy7ZruixhIkaxzEy7Kb5wAdsNW0/Gxk+ZNXHjvkbeCUnoR2bxBTQjEtgWn8XcBVEqJ1gE3H7P9wZKp6IR2FarZuE65imail11gSnmBDYPr1DuOeeAM6GTuHvWCfB3J0bgNyJ7UYvySFwK7dyLE/BD1XGtuWtL6BgDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519347; c=relaxed/relaxed;
	bh=fFEI0l3n/kZFXV6t1wBhc7S1JB7OlR5FlGv2kO9Cxrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VAXn4edfhO9clVSEO2IpTX2mddGcc+l4GgXJn4EsyTCcRy4t92ZuuDrVobNcLpnN9HFd7nBVFIm8ZqmrRIE7E1Em5/3uQlhRqu2aiU8NY01KNgkQoP49YwOD1JeZ/f78zyWYBKK5hEasKXlPiCeBsvw2QoWVf0UNkiYw9kh30b1oQFgPBWNYeyKWxuehH2eOFMI87jZIy5fmWeJ6gFd5gneGtPviT7rPR+OVe4/Se9jmb/c8zGRhKpFk2glWWmXeHUSzjPrEZwYnhI31iXRLWr7VS9BPqNqh0r/T9kpd5tPHTxqvhRhQi0KTKoihr086w+x3liU4P5XA0j0CmmwRyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dsoM/pf/; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dsoM/pf/;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrFB4y51z30WQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519335;
	bh=fFEI0l3n/kZFXV6t1wBhc7S1JB7OlR5FlGv2kO9Cxrk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dsoM/pf/URRpT9ZZJJZn51IU79QWfY1MBH2N2BtYkeV+nvseTyhA0YppKnUrBtfJ0
	 mX3lfPSWcIviizfYPBQEtxTKMJRDrKjiB9m5qjYn8TPmtUSHCbWF/U5fsRot7yb+3i
	 RXB8I53OTea8F8+7quFRiQktxrz3z5vfo7NNDlWy6pt1lx39LJ3/xRHetfoBEuRUnl
	 GV4kDpgzKfJJrlW7DMNLADoslvWoD0PVmhpRxBkdlHH/lBhC1UUeiR8FEprWz+hyLA
	 gMl7FLeQMaZbBI624wMiYlpwgnWd/Z1U7L9P18h8mcutwpp21ULPVOy4+oVh4/Awru
	 dAvf+1ZvJQF/A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrF32QDgz4xfR;
	Wed, 18 Dec 2024 21:55:35 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>
Subject: [PATCH v2 19/25] powerpc: Remove UDBG_RTAS_CONSOLE
Date: Wed, 18 Dec 2024 21:55:07 +1100
Message-ID: <20241218105523.416573-19-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218105523.416573-1-mpe@ellerman.id.au>
References: <20241218105523.416573-1-mpe@ellerman.id.au>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The IBM Cell blade support was the last user of UDBG_RTAS_CONSOLE.

Although it's still possible to build it via
PPC_EARLY_DEBUG_UDBG_RTAS_CONSOLE, AFAIK it's not useful on any
other platfoms, because only Cell and JS20 era machines provided the
RTAS get/put-term-char functions.

If anyone is using it or needs it we can always resurrect it from git.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: Unchanged.

 arch/powerpc/Kconfig.debug     |  7 ----
 arch/powerpc/kernel/rtas.c     | 75 ----------------------------------
 arch/powerpc/kernel/udbg.c     |  3 --
 arch/powerpc/platforms/Kconfig |  4 --
 4 files changed, 89 deletions(-)

diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index 20d05605fa83..f15e5920080b 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -216,13 +216,6 @@ config PPC_EARLY_DEBUG_RTAS_PANEL
 	help
 	  Select this to enable early debugging via the RTAS panel.
 
-config PPC_EARLY_DEBUG_RTAS_CONSOLE
-	bool "RTAS Console"
-	depends on PPC_RTAS
-	select UDBG_RTAS_CONSOLE
-	help
-	  Select this to enable early debugging via the RTAS console.
-
 config PPC_EARLY_DEBUG_PAS_REALMODE
 	bool "PA Semi real mode"
 	depends on PPC_PASEMI
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index d31c9799cab2..d7a738f1858d 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -798,66 +798,6 @@ void __init udbg_init_rtas_panel(void)
 	udbg_putc = call_rtas_display_status_delay;
 }
 
-#ifdef CONFIG_UDBG_RTAS_CONSOLE
-
-/* If you think you're dying before early_init_dt_scan_rtas() does its
- * work, you can hard code the token values for your firmware here and
- * hardcode rtas.base/entry etc.
- */
-static unsigned int rtas_putchar_token = RTAS_UNKNOWN_SERVICE;
-static unsigned int rtas_getchar_token = RTAS_UNKNOWN_SERVICE;
-
-static void udbg_rtascon_putc(char c)
-{
-	int tries;
-
-	if (!rtas.base)
-		return;
-
-	/* Add CRs before LFs */
-	if (c == '\n')
-		udbg_rtascon_putc('\r');
-
-	/* if there is more than one character to be displayed, wait a bit */
-	for (tries = 0; tries < 16; tries++) {
-		if (rtas_call(rtas_putchar_token, 1, 1, NULL, c) == 0)
-			break;
-		udelay(1000);
-	}
-}
-
-static int udbg_rtascon_getc_poll(void)
-{
-	int c;
-
-	if (!rtas.base)
-		return -1;
-
-	if (rtas_call(rtas_getchar_token, 0, 2, &c))
-		return -1;
-
-	return c;
-}
-
-static int udbg_rtascon_getc(void)
-{
-	int c;
-
-	while ((c = udbg_rtascon_getc_poll()) == -1)
-		;
-
-	return c;
-}
-
-
-void __init udbg_init_rtas_console(void)
-{
-	udbg_putc = udbg_rtascon_putc;
-	udbg_getc = udbg_rtascon_getc;
-	udbg_getc_poll = udbg_rtascon_getc_poll;
-}
-#endif /* CONFIG_UDBG_RTAS_CONSOLE */
-
 void rtas_progress(char *s, unsigned short hex)
 {
 	struct device_node *root;
@@ -2135,21 +2075,6 @@ int __init early_init_dt_scan_rtas(unsigned long node,
 		rtas.size = *sizep;
 	}
 
-#ifdef CONFIG_UDBG_RTAS_CONSOLE
-	basep = of_get_flat_dt_prop(node, "put-term-char", NULL);
-	if (basep)
-		rtas_putchar_token = *basep;
-
-	basep = of_get_flat_dt_prop(node, "get-term-char", NULL);
-	if (basep)
-		rtas_getchar_token = *basep;
-
-	if (rtas_putchar_token != RTAS_UNKNOWN_SERVICE &&
-	    rtas_getchar_token != RTAS_UNKNOWN_SERVICE)
-		udbg_init_rtas_console();
-
-#endif
-
 	/* break now */
 	return 1;
 }
diff --git a/arch/powerpc/kernel/udbg.c b/arch/powerpc/kernel/udbg.c
index 0a72a537f879..862b22b2b616 100644
--- a/arch/powerpc/kernel/udbg.c
+++ b/arch/powerpc/kernel/udbg.c
@@ -36,9 +36,6 @@ void __init udbg_early_init(void)
 #elif defined(CONFIG_PPC_EARLY_DEBUG_RTAS_PANEL)
 	/* RTAS panel debug */
 	udbg_init_rtas_panel();
-#elif defined(CONFIG_PPC_EARLY_DEBUG_RTAS_CONSOLE)
-	/* RTAS console debug */
-	udbg_init_rtas_console();
 #elif defined(CONFIG_PPC_EARLY_DEBUG_PAS_REALMODE)
 	udbg_init_pas_realmode();
 #elif defined(CONFIG_PPC_EARLY_DEBUG_BOOTX)
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index b78c132d47ab..fea3766eac0f 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -70,10 +70,6 @@ config PPC_DT_CPU_FTRS
 	  firmware provides this binding.
 	  If you're not sure say Y.
 
-config UDBG_RTAS_CONSOLE
-	bool "RTAS based debug console"
-	depends on PPC_RTAS
-
 config PPC_SMP_MUXED_IPI
 	bool
 	help
-- 
2.47.1


