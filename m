Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBEA22C747
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 16:04:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCrXd5gczzDqCX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 00:04:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqWF4yLPzF0ff
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:17:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=MN+CqWXE; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BCqWD15FNz9sSt; Fri, 24 Jul 2020 23:17:44 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqWC53BJz9sTF; Fri, 24 Jul 2020 23:17:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595596663;
 bh=1xT4akmkxar1QUzvLMmQ5IHTXoSFo8ns1hlQAdKw5lo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MN+CqWXEF3bUJQwoiGIjyB1Pzn/hKu4njNN+tfq0rI9yf6Z6gKJuKLU8IkzZFvwVe
 Zl2WlY++fw2NXk5e0RyBO4qEumE0xeJxw/9Tlyt6H4qeYjymLGoOl5iqEFc7DGxFCJ
 luFNKlMCSeBu6iwH5n1TtCPc/BDkSLHsPl51cjAk+tf+BW3z4qN5ZvDPDEjG7Xz8oK
 2bP4rBa6IzXl62bVWWDei3vjscZ+Xk67wg8heudh6rTuJqoy5geUjM78CYXHK8TS0Z
 rP5+Js/zDomRByoyDXalbaFkibjrR25mcmGucbvJQ9wKQIRcuXU7nipGf4tGeoa6q5
 1ul0oceujZU4w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 7/9] powerpc/boot: Fix CONFIG_PPC_MPC52XX references
Date: Fri, 24 Jul 2020 23:17:26 +1000
Message-Id: <20200724131728.1643966-7-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200724131728.1643966-1-mpe@ellerman.id.au>
References: <20200724131728.1643966-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 866bfc75f40e ("powerpc: conditionally compile platform-specific
serial drivers") made some code depend on CONFIG_PPC_MPC52XX, which
doesn't exist.

Fix it to use CONFIG_PPC_MPC52xx.

Fixes: 866bfc75f40e ("powerpc: conditionally compile platform-specific serial drivers")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/boot/Makefile | 2 +-
 arch/powerpc/boot/serial.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 4d43cb59b4a4..44af71543380 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -117,7 +117,7 @@ src-wlib-y := string.S crt0.S stdio.c decompress.c main.c \
 		elf_util.c $(zlib-y) devtree.c stdlib.c \
 		oflib.c ofconsole.c cuboot.c
 
-src-wlib-$(CONFIG_PPC_MPC52XX) += mpc52xx-psc.c
+src-wlib-$(CONFIG_PPC_MPC52xx) += mpc52xx-psc.c
 src-wlib-$(CONFIG_PPC64_BOOT_WRAPPER) += opal-calls.S opal.c
 ifndef CONFIG_PPC64_BOOT_WRAPPER
 src-wlib-y += crtsavres.S
diff --git a/arch/powerpc/boot/serial.c b/arch/powerpc/boot/serial.c
index 0bfa7e87e546..9a19e5905485 100644
--- a/arch/powerpc/boot/serial.c
+++ b/arch/powerpc/boot/serial.c
@@ -128,7 +128,7 @@ int serial_console_init(void)
 	         dt_is_compatible(devp, "fsl,cpm2-smc-uart"))
 		rc = cpm_console_init(devp, &serial_cd);
 #endif
-#ifdef CONFIG_PPC_MPC52XX
+#ifdef CONFIG_PPC_MPC52xx
 	else if (dt_is_compatible(devp, "fsl,mpc5200-psc-uart"))
 		rc = mpc5200_psc_console_init(devp, &serial_cd);
 #endif
-- 
2.25.1

