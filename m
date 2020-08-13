Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 939DF243D8A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 18:39:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSC2D6TD8zDqSF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 02:39:00 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSBzX6YRmzDqdX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 02:36:38 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BSBzP3W2pz9vCy6;
 Thu, 13 Aug 2020 18:36:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Yz5B6KTKTx1G; Thu, 13 Aug 2020 18:36:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BSBzP2bTFz9vCy4;
 Thu, 13 Aug 2020 18:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 10C3E8B7A6;
 Thu, 13 Aug 2020 18:36:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7koiQi2nqm7Y; Thu, 13 Aug 2020 18:36:35 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CB9DC8B7A1;
 Thu, 13 Aug 2020 18:36:34 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A4F9865C8D; Thu, 13 Aug 2020 16:36:34 +0000 (UTC)
Message-Id: <4dde2b977228a86b40df1f6bc5cdcfe9a6631f84.1597336548.git.christophe.leroy@csgroup.eu>
In-Reply-To: <11a330af231af22874c006302a945388846f8112.1597336548.git.christophe.leroy@csgroup.eu>
References: <11a330af231af22874c006302a945388846f8112.1597336548.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 3/9] powerpc: Remove CONFIG_PPC601_SYNC_FIX
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 13 Aug 2020 16:36:34 +0000 (UTC)
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

This config option isn't in any defconfig.

The very first versions of Powerpc 601 have a bug which
requires additional sync before and/or after some instructions.

This was more than 25 years ago and time has come to retire
those buggy versions of the 601 from the kernel.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc_asm.h |  6 ------
 arch/powerpc/platforms/Kconfig     | 15 ---------------
 2 files changed, 21 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index b4cc6608131c..0b9dc814b81c 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -382,15 +382,9 @@ GLUE(.,name):
 #endif
 
 /* various errata or part fixups */
-#ifdef CONFIG_PPC601_SYNC_FIX
-#define SYNC		sync; isync
-#define SYNC_601	sync
-#define ISYNC_601	isync
-#else
 #define	SYNC
 #define SYNC_601
 #define ISYNC_601
-#endif
 
 #if defined(CONFIG_PPC_CELL) || defined(CONFIG_PPC_FSL_BOOK3E)
 #define MFTB(dest)			\
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index fb7515b4fa9c..f377a56ecc85 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -199,21 +199,6 @@ source "drivers/cpuidle/Kconfig"
 
 endmenu
 
-config PPC601_SYNC_FIX
-	bool "Workarounds for PPC601 bugs"
-	depends on PPC_BOOK3S_601 && PPC_PMAC
-	default y
-	help
-	  Some versions of the PPC601 (the first PowerPC chip) have bugs which
-	  mean that extra synchronization instructions are required near
-	  certain instructions, typically those that make major changes to the
-	  CPU state.  These extra instructions reduce performance slightly.
-	  If you say N here, these extra instructions will not be included,
-	  resulting in a kernel which will run faster but may not run at all
-	  on some systems with the PPC601 chip.
-
-	  If in doubt, say Y here.
-
 config TAU
 	bool "On-chip CPU temperature sensor support"
 	depends on PPC_BOOK3S_32
-- 
2.25.0

