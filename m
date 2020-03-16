Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F98186E79
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 16:26:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48h0WX5zcfzDqHG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 02:26:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=L+g80Htz; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gwlh5HbKzDqLL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 23:36:32 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48gwlX61P5z9v02t;
 Mon, 16 Mar 2020 13:36:24 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=L+g80Htz; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id DYhGDslqA7ab; Mon, 16 Mar 2020 13:36:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48gwlX4wS5z9v02f;
 Mon, 16 Mar 2020 13:36:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584362184; bh=REuVvmOuXOLfNa+mp9v1PVGylG1qMPWi4BVRMaCT6wY=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=L+g80Htz8hhStaNcJ/juc9gKm5GZ47ymwSYpcBcf1wd4IYxODOB8jgmI7ZVo1zYeC
 AYQ/U6lEdZVkb2BIHt8CBw1WVRpYZRKJxWgC4A4EHKKDS1sM2OW2Rj22douK/UeXW1
 XT0Bk0F7/AOn1j6iqTxV0sMcrJwazmSTgtaAWrTw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A31408B7D0;
 Mon, 16 Mar 2020 13:36:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id AkTQjgbylRrm; Mon, 16 Mar 2020 13:36:29 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 795398B7CB;
 Mon, 16 Mar 2020 13:36:29 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6C02C65595; Mon, 16 Mar 2020 12:36:29 +0000 (UTC)
Message-Id: <1f1727581058b2d47ca390aec05cf15c98ae651e.1584360344.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1584360343.git.christophe.leroy@c-s.fr>
References: <cover.1584360343.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 43/46] powerpc/8xx: Allow large TLBs with DEBUG_PAGEALLOC
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 16 Mar 2020 12:36:29 +0000 (UTC)
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

Text and RO data can still be mapped with hugepages and pinned TLB.

In order to map with hugepages, also enforce a 512kB data alignment
minimum. That's a trade-off between size of speed, taking into
account that DEBUG_PAGEALLOC is a debug option. Anyway the alignment
is still tunable.

We also allow tuning of alignment for book3s to limit the complexity
of the test in Kconfig that will anyway disappear in the following
patches once DEBUG_PAGEALLOC is handled together with BATs.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/Kconfig               | 11 +++++++----
 arch/powerpc/mm/init_32.c          |  5 ++++-
 arch/powerpc/mm/nohash/8xx.c       | 11 ++++++++---
 arch/powerpc/platforms/8xx/Kconfig |  2 +-
 4 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 305c7b6a9229..c086992573d3 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -777,8 +777,9 @@ config THREAD_SHIFT
 config DATA_SHIFT_BOOL
 	bool "Set custom data alignment"
 	depends on ADVANCED_OPTIONS
-	depends on STRICT_KERNEL_RWX
-	depends on PPC_BOOK3S_32 || (PPC_8xx && !PIN_TLB_DATA && !PIN_TLB_TEXT)
+	depends on STRICT_KERNEL_RWX || DEBUG_PAGEALLOC
+	depends on PPC_BOOK3S_32 || (PPC_8xx && !PIN_TLB_DATA && \
+				     (!PIN_TLB_TEXT || !STRICT_KERNEL_RWX))
 	help
 	  This option allows you to set the kernel data alignment. When
 	  RAM is mapped by blocks, the alignment needs to fit the size and
@@ -789,10 +790,12 @@ config DATA_SHIFT_BOOL
 config DATA_SHIFT
 	int "Data shift" if DATA_SHIFT_BOOL
 	default 24 if STRICT_KERNEL_RWX && PPC64
-	range 17 28 if STRICT_KERNEL_RWX && PPC_BOOK3S_32
-	range 19 23 if STRICT_KERNEL_RWX && PPC_8xx
+	range 17 28 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC) && PPC_BOOK3S_32
+	range 19 23 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC) && PPC_8xx
 	default 22 if STRICT_KERNEL_RWX && PPC_BOOK3S_32
 	default 23 if STRICT_KERNEL_RWX && PPC_8xx
+	default 23 if DEBUG_PAGEALLOC && PPC_8xx && PIN_TLB_DATA
+	default 19 if DEBUG_PAGEALLOC && PPC_8xx
 	default PPC_PAGE_SHIFT
 	help
 	  On Book3S 32 (603+), DBATs are used to map kernel text and rodata RO.
diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
index a6991ef8727d..8977a7c2543d 100644
--- a/arch/powerpc/mm/init_32.c
+++ b/arch/powerpc/mm/init_32.c
@@ -96,11 +96,14 @@ static void __init MMU_setup(void)
 	if (strstr(boot_command_line, "noltlbs")) {
 		__map_without_ltlbs = 1;
 	}
+	if (IS_ENABLED(CONFIG_PPC_8xx))
+		return;
+
 	if (debug_pagealloc_enabled()) {
 		__map_without_bats = 1;
 		__map_without_ltlbs = 1;
 	}
-	if (strict_kernel_rwx_enabled() && !IS_ENABLED(CONFIG_PPC_8xx))
+	if (strict_kernel_rwx_enabled())
 		__map_without_ltlbs = 1;
 }
 
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 40815eba96f2..a122ec4806d0 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -149,7 +149,8 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 {
 	unsigned long etext8 = ALIGN(__pa(_etext), SZ_8M);
 	unsigned long sinittext = __pa(_sinittext);
-	unsigned long boundary = strict_kernel_rwx_enabled() ? sinittext : etext8;
+	bool strict_boundary = strict_kernel_rwx_enabled() || debug_pagealloc_enabled();
+	unsigned long boundary = strict_boundary ? sinittext : etext8;
 	unsigned long einittext8 = ALIGN(__pa(_einittext), SZ_8M);
 
 	WARN_ON(top < einittext8);
@@ -160,8 +161,12 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 		return 0;
 
 	mmu_mapin_ram_chunk(0, boundary, PAGE_KERNEL_TEXT, true);
-	mmu_mapin_ram_chunk(boundary, einittext8, PAGE_KERNEL_TEXT, true);
-	mmu_mapin_ram_chunk(einittext8, top, PAGE_KERNEL, true);
+	if (debug_pagealloc_enabled()) {
+		top = boundary;
+	} else {
+		mmu_mapin_ram_chunk(boundary, einittext8, PAGE_KERNEL_TEXT, true);
+		mmu_mapin_ram_chunk(einittext8, top, PAGE_KERNEL, true);
+	}
 
 	if (top > SZ_32M)
 		memblock_set_current_limit(top);
diff --git a/arch/powerpc/platforms/8xx/Kconfig b/arch/powerpc/platforms/8xx/Kconfig
index 05669f2fadce..abb2b45b2789 100644
--- a/arch/powerpc/platforms/8xx/Kconfig
+++ b/arch/powerpc/platforms/8xx/Kconfig
@@ -167,7 +167,7 @@ menu "8xx advanced setup"
 
 config PIN_TLB
 	bool "Pinned Kernel TLBs"
-	depends on ADVANCED_OPTIONS && !DEBUG_PAGEALLOC
+	depends on ADVANCED_OPTIONS
 	help
 	  On the 8xx, we have 32 instruction TLBs and 32 data TLBs. In each
 	  table 4 TLBs can be pinned.
-- 
2.25.0

