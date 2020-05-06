Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F57A1C795C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 20:26:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HQ5x2bcvzDqMX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 04:26:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HMxK730VzDqjV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 02:48:53 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49HMxF1S9Jz9v4kJ;
 Wed,  6 May 2020 18:48:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id RwdyRQJwc9H3; Wed,  6 May 2020 18:48:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49HMxF0NjDz9v4kH;
 Wed,  6 May 2020 18:48:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E43F18B7C5;
 Wed,  6 May 2020 18:48:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KL-DzazMXOhT; Wed,  6 May 2020 18:48:50 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 978988B777;
 Wed,  6 May 2020 18:48:50 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 6281265911; Wed,  6 May 2020 16:48:50 +0000 (UTC)
Message-Id: <d76a5baf4e895c4951fa00dd03a810b55f6030ea.1588783498.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1588783498.git.christophe.leroy@csgroup.eu>
References: <cover.1588783498.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 44/45] powerpc/32s: Allow mapping with BATs with
 DEBUG_PAGEALLOC
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed,  6 May 2020 16:48:50 +0000 (UTC)
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

DEBUG_PAGEALLOC only manages RW data.

Text and RO data can still be mapped with BATs.

In order to map with BATs, also enforce data alignment. Set
by default to 256M which is a good compromise for keeping
enough BATs for also KASAN and IMMR.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig           | 1 +
 arch/powerpc/mm/book3s32/mmu.c | 6 ++++++
 arch/powerpc/mm/init_32.c      | 5 ++---
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9d94e8b178d8..5c1fcfe9be74 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -796,6 +796,7 @@ config DATA_SHIFT
 	range 17 28 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC) && PPC_BOOK3S_32
 	range 19 23 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC) && PPC_8xx
 	default 22 if STRICT_KERNEL_RWX && PPC_BOOK3S_32
+	default 18 if DEBUG_PAGEALLOC && PPC_BOOK3S_32
 	default 23 if STRICT_KERNEL_RWX && PPC_8xx
 	default 23 if DEBUG_PAGEALLOC && PPC_8xx && PIN_TLB_DATA
 	default 19 if DEBUG_PAGEALLOC && PPC_8xx
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index a9b2cbc74797..a6dcc708eee3 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -170,6 +170,12 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 		pr_debug("RAM mapped without BATs\n");
 		return base;
 	}
+	if (debug_pagealloc_enabled()) {
+		if (base >= border)
+			return base;
+		if (top >= border)
+			top = border;
+	}
 
 	if (!strict_kernel_rwx_enabled() || base >= border || top <= border)
 		return __mmu_mapin_ram(base, top);
diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
index 8977a7c2543d..36c39bd37256 100644
--- a/arch/powerpc/mm/init_32.c
+++ b/arch/powerpc/mm/init_32.c
@@ -99,10 +99,9 @@ static void __init MMU_setup(void)
 	if (IS_ENABLED(CONFIG_PPC_8xx))
 		return;
 
-	if (debug_pagealloc_enabled()) {
-		__map_without_bats = 1;
+	if (debug_pagealloc_enabled())
 		__map_without_ltlbs = 1;
-	}
+
 	if (strict_kernel_rwx_enabled())
 		__map_without_ltlbs = 1;
 }
-- 
2.25.0

