Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C39243DA0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 18:42:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSC6X1shLzDqdl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 02:42:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSBzX6bJ3zDqdh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 02:36:40 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BSBzR4p8tz9vCy4;
 Thu, 13 Aug 2020 18:36:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 76yWkmfD8X0P; Thu, 13 Aug 2020 18:36:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BSBzR40KZz9vCyK;
 Thu, 13 Aug 2020 18:36:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 62F818B7A1;
 Thu, 13 Aug 2020 18:36:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fzQEa5J2MTns; Thu, 13 Aug 2020 18:36:37 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DF0E28B7A6;
 Thu, 13 Aug 2020 18:36:36 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B5BDA65C8D; Thu, 13 Aug 2020 16:36:36 +0000 (UTC)
Message-Id: <641adcd619be864335a4ce28487cee82b32ddd19.1597336548.git.christophe.leroy@csgroup.eu>
In-Reply-To: <11a330af231af22874c006302a945388846f8112.1597336548.git.christophe.leroy@csgroup.eu>
References: <11a330af231af22874c006302a945388846f8112.1597336548.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 5/9] powerpc: Remove PowerPC 601
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 13 Aug 2020 16:36:36 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Powerpc 601 is 25 years old.

It is not selected by any defconfig.

It requires a lot of special handling as it deviates from the
standard 6xx.

Retire it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/cputable.c         | 15 ---------------
 arch/powerpc/platforms/Kconfig.cputype | 11 ++---------
 2 files changed, 2 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index 3d406a9626e8..1338ed6e545b 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -592,21 +592,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 #endif	/* CONFIG_PPC_BOOK3S_64 */
 
 #ifdef CONFIG_PPC32
-#ifdef CONFIG_PPC_BOOK3S_601
-	{	/* 601 */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x00010000,
-		.cpu_name		= "601",
-		.cpu_features		= CPU_FTRS_PPC601,
-		.cpu_user_features	= COMMON_USER | PPC_FEATURE_601_INSTR |
-			PPC_FEATURE_UNIFIED_CACHE | PPC_FEATURE_NO_TB,
-		.mmu_features		= MMU_FTR_HPTE_TABLE,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_generic,
-		.platform		= "ppc601",
-	},
-#endif /* CONFIG_PPC_BOOK3S_601 */
 #ifdef CONFIG_PPC_BOOK3S_6xx
 	{	/* 603 */
 		.pvr_mask		= 0xffff0000,
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 87737ec86d39..2b39589a6a8a 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -20,7 +20,7 @@ choice
 	depends on PPC32
 	help
 	  There are five families of 32 bit PowerPC chips supported.
-	  The most common ones are the desktop and server CPUs (601, 603,
+	  The most common ones are the desktop and server CPUs (603,
 	  604, 740, 750, 74xx) CPUs from Freescale and IBM, with their
 	  embedded 512x/52xx/82xx/83xx/86xx counterparts.
 	  The other embedded parts, namely 4xx, 8xx, e200 (55xx) and e500
@@ -30,7 +30,7 @@ choice
 	  If unsure, select 52xx/6xx/7xx/74xx/82xx/83xx/86xx.
 
 config PPC_BOOK3S_6xx
-	bool "512x/52xx/6xx/7xx/74xx/82xx/83xx/86xx except 601"
+	bool "512x/52xx/6xx/7xx/74xx/82xx/83xx/86xx"
 	select PPC_BOOK3S_32
 	select PPC_FPU
 	select PPC_HAVE_PMU_SUPPORT
@@ -38,13 +38,6 @@ config PPC_BOOK3S_6xx
 	select PPC_HAVE_KUAP
 	select HAVE_ARCH_VMAP_STACK
 
-config PPC_BOOK3S_601
-	bool "PowerPC 601"
-	select PPC_BOOK3S_32
-	select PPC_FPU
-	select PPC_HAVE_KUAP
-	select HAVE_ARCH_VMAP_STACK
-
 config PPC_85xx
 	bool "Freescale 85xx"
 	select E500
-- 
2.25.0

