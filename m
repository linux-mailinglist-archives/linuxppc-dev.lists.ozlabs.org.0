Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2007186E6C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 16:22:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48h0Qc6d3rzDqT8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 02:22:00 +1100 (AEDT)
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
 header.s=mail header.b=SFIy/Nqf; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gwlg4ql8zDqLS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 23:36:31 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48gwlW5gMYz9v02s;
 Mon, 16 Mar 2020 13:36:23 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=SFIy/Nqf; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id VxmStml7C-Dp; Mon, 16 Mar 2020 13:36:23 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48gwlW4bm8z9v02f;
 Mon, 16 Mar 2020 13:36:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584362183; bh=kQOAXz2QmB3rvTsxjZmPyZO0fN9HYrA7ocsIE4cT7LU=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=SFIy/NqfVxkLDAAAolVwOtL6GvzxvUzdheAd72djjEUkVCL6PK1I9mowYvdSUfHOu
 IIeOc1uWCOwTdv2kWwpslhS+4er1XbSVgpJ3CF+cItkeXAJLpjULpNp/FQjZ11SwhP
 L+rr31RssVjbpZwVOokSAuJSESCj4AqimRSHdwfY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 99FDD8B7D0;
 Mon, 16 Mar 2020 13:36:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id P9We63cSrGZ9; Mon, 16 Mar 2020 13:36:28 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 726118B7CB;
 Mon, 16 Mar 2020 13:36:28 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6474565595; Mon, 16 Mar 2020 12:36:28 +0000 (UTC)
Message-Id: <55eb72c1e0c209280fd1585a12f1da424a1253ae.1584360344.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1584360343.git.christophe.leroy@c-s.fr>
References: <cover.1584360343.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 42/46] powerpc/8xx: Allow STRICT_KERNEL_RwX with pinned TLB
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 16 Mar 2020 12:36:28 +0000 (UTC)
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

Pinned TLB are 8M. Now that there is no strict boundary anymore
between text and RO data, it is possible to use 8M pinned executable
TLB that covers both text and RO data.

When PIN_TLB_DATA or PIN_TLB_TEXT is selected, enforce 8M RW data
alignment and allow STRICT_KERNEL_RWX.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/Kconfig               |  8 +++++---
 arch/powerpc/mm/nohash/8xx.c       | 32 ++++++++++++++++++++++++++++++
 arch/powerpc/platforms/8xx/Kconfig |  2 +-
 3 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 66d02667b43d..305c7b6a9229 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -775,9 +775,10 @@ config THREAD_SHIFT
 	  want. Only change this if you know what you are doing.
 
 config DATA_SHIFT_BOOL
-	bool "Set custom data alignment" if STRICT_KERNEL_RWX && \
-					    (PPC_BOOK3S_32 || PPC_8xx)
+	bool "Set custom data alignment"
 	depends on ADVANCED_OPTIONS
+	depends on STRICT_KERNEL_RWX
+	depends on PPC_BOOK3S_32 || (PPC_8xx && !PIN_TLB_DATA && !PIN_TLB_TEXT)
 	help
 	  This option allows you to set the kernel data alignment. When
 	  RAM is mapped by blocks, the alignment needs to fit the size and
@@ -799,7 +800,8 @@ config DATA_SHIFT
 
 	  On 8xx, large pages (512kb or 8M) are used to map kernel linear
 	  memory. Aligning to 8M reduces TLB misses as only 8M pages are used
-	  in that case.
+	  in that case. If PIN_TLB is selected, it must be aligned to 8M as
+	  8M pages will be pinned.
 
 config FORCE_MAX_ZONEORDER
 	int "Maximum zone order"
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index d670f3f82091..40815eba96f2 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -171,6 +171,20 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 	return top;
 }
 
+static void mmu_pin_text(unsigned long boundary)
+{
+	unsigned long addr = PAGE_OFFSET;
+	unsigned long twc = MD_SVALID | MD_PS8MEG;
+	unsigned long rpn = __pa(addr) | 0xf0 | _PAGE_RO |
+			    _PAGE_SPS | _PAGE_SH | _PAGE_PRESENT;
+	int i;
+
+	for (i = 28; i < 32 && __pa(addr) < boundary; i++, addr += SZ_8M, rpn += SZ_8M)
+		mpc8xx_update_tlb(0, i, addr | MI_EVALID, twc, rpn);
+	for (; i < 32; i++)
+		mpc8xx_update_tlb(0, i, 0, 0, 0);
+}
+
 void mmu_mark_initmem_nx(void)
 {
 	unsigned long etext8 = ALIGN(__pa(_etext), SZ_8M);
@@ -180,14 +194,32 @@ void mmu_mark_initmem_nx(void)
 
 	mmu_mapin_ram_chunk(0, boundary, PAGE_KERNEL_TEXT, false);
 	mmu_mapin_ram_chunk(boundary, einittext8, PAGE_KERNEL, false);
+
+	if (IS_ENABLED(CONFIG_PIN_TLB_TEXT))
+		mmu_pin_text(boundary);
 }
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
+static void mmu_pin_data(unsigned long sinittext)
+{
+	unsigned long addr = PAGE_OFFSET;
+	unsigned long twc = MD_SVALID | MD_PS8MEG;
+	unsigned long rpn = __pa(addr) | 0xf0 | _PAGE_RO |
+			    _PAGE_SPS | _PAGE_SH | _PAGE_PRESENT;
+	int i;
+	int max = IS_ENABLED(CONFIG_PIN_TLB_IMMR) ? 30 : 31;
+
+	for (i = 28; i <= max && __pa(addr) < sinittext; i++, addr += SZ_8M, rpn += SZ_8M)
+		mpc8xx_update_tlb(0, i, addr | MI_EVALID, twc, rpn);
+}
+
 void mmu_mark_rodata_ro(void)
 {
 	unsigned long sinittext = __pa(_sinittext);
 
 	mmu_mapin_ram_chunk(0, sinittext, PAGE_KERNEL_ROX, false);
+	if (IS_ENABLED(CONFIG_PIN_TLB_DATA))
+		mmu_pin_data(sinittext);
 }
 #endif
 
diff --git a/arch/powerpc/platforms/8xx/Kconfig b/arch/powerpc/platforms/8xx/Kconfig
index 04ea1a8a0bdc..05669f2fadce 100644
--- a/arch/powerpc/platforms/8xx/Kconfig
+++ b/arch/powerpc/platforms/8xx/Kconfig
@@ -167,7 +167,7 @@ menu "8xx advanced setup"
 
 config PIN_TLB
 	bool "Pinned Kernel TLBs"
-	depends on ADVANCED_OPTIONS && !DEBUG_PAGEALLOC && !STRICT_KERNEL_RWX
+	depends on ADVANCED_OPTIONS && !DEBUG_PAGEALLOC
 	help
 	  On the 8xx, we have 32 instruction TLBs and 32 data TLBs. In each
 	  table 4 TLBs can be pinned.
-- 
2.25.0

