Return-Path: <linuxppc-dev+bounces-3186-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 989C59C8B1E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 13:52:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0QT1jkjz30BG;
	Thu, 14 Nov 2024 23:51:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731588689;
	cv=none; b=iEpiHdN6Vf+AvzRfMx1Q14YAPuJF0dRT7dwX39g6kyn+vmq254vnZWyqW+EUxoYBauiY8vRoPDj4Hfvw/v5z+U2+4kynzZTnUbVNHQ2afJ0OgPasTBdqzZpy5/nnSH+2rjVd8ySZC7WKziReSFPkzPpiuzBaz/OqR0eTyn9ZtaX/8tr4XFAD6zBVRlwFbmUZMSFdNoZC9T02/zviMRJcpjQc/cDaMtg/TQPwHRjDzbX60s1J5rJ9MrwyXcvr03lMLOV3+mypdjNmRjapffKeQ2tfOirfgv85WtECxCc9ssrSu+jFeinUr12RMe8UBCrJTuSUsf3f/jDtWLhVfbLmig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731588689; c=relaxed/relaxed;
	bh=/xyoIRSJmInmDwoONzd0nO8B+3gcPMzdo/aHrDLApD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LlUBaIJ/bm95Furi7wE6sRILPOnegGw7VXyW/KgqdldNGD8w1ifiStOQP8PQ1pxqq9sxA69UY6WCA6iqrZ2VLV+wfXcTIpIqqdA4lU2H524ozayro6zrg9zjR+sa3w41pSAYLAnMaFDrt4VqgKT7d63DazUBO6fI+d+3B+1GT3zOmpWF1v4OaqAcXrMGOjkHq6E0Ob1wJVnDiY0lQgeoXm9WNGoxudZ9rwHt88Es7I7BMRBdwiqAlVwLw6eBphsDDTxIbj5ndgzMjXT2gN++5/SadbzyhmtfVj7OUHRbCIKQdajnmErDFkBLfh6EkOip9NVDql2vmqDxp760O7wjhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YHPOpTfN; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YHPOpTfN;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq0QQ2z2Bz3041
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 23:51:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731588683;
	bh=/xyoIRSJmInmDwoONzd0nO8B+3gcPMzdo/aHrDLApD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YHPOpTfNP4nKRfK9Nih6QLMj3M5I4vIxVjEbH/SBX90PK8Ktl9JiYkjaYxlcKQ67O
	 6qqmRuQFcPS6gHlVy1YZQtW49+U9JjWk81IUVo2cRj+svkEkAghTVLUaIVOZRv6fhk
	 bqrn876wcS9gi5ryRxeQbxtqbqmgj6BWv5IlcRWx/Fj2uc5Hu97fxYGXjAvWKckufa
	 DpcDjlDtcdEJ/s1BPE9ChsghoBAIaLGl8WG6u+0SaEeHfP0P+2NeVVNMuu8hKdcbea
	 ZrFjjUVJu7GxfAoFTUbsL3O0Fz6OIOThKPdwn6rlq1VxPGz2CXvort80oU2sAeeyq1
	 91zcY/YfMuUfA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xq0QM49bgz4xTx;
	Thu, 14 Nov 2024 23:51:23 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	<jk@ozlabs.org>,
	<arnd@arndb.de>,
	<geoff@infradead.org>
Subject: [RFC PATCH 14/20] powerpc: Remove UDBG_RTAS_CONSOLE
Date: Thu, 14 Nov 2024 23:51:03 +1100
Message-ID: <20241114125111.599093-14-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114125111.599093-1-mpe@ellerman.id.au>
References: <20241114125111.599093-1-mpe@ellerman.id.au>
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
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
2.47.0


