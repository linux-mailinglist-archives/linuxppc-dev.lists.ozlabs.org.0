Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8015D9D3A3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 18:05:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HH0H4JWZzDqTF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 02:05:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="EFFeaWlA"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HGjL29TqzDqGF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 01:52:22 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46HGj94kMGz9v7Dr;
 Mon, 26 Aug 2019 17:52:13 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=EFFeaWlA; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hbfci2_MZ2j7; Mon, 26 Aug 2019 17:52:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46HGj93hxSz9v7Dl;
 Mon, 26 Aug 2019 17:52:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566834733; bh=419u7JZUdl++Tq1rp3LrJqPnuJzJorlA3fS0fWYAcCA=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=EFFeaWlAAa6+pgOX0Q8223DyVRvdGj+KTrd1OiQZuUs+Sl5bE1sun/BjtO/5fOW6v
 MAiBOuxd7V1GGIwEVOpP400L5iHREQ8TkLC0vGQFqPSoE4xMrOxLGDJ8rzdGnVbWNO
 dyUsHCvS/9BaLKj5QSUEVPfwcZ58F+9pnmdZo59E=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E6DB8B7F1;
 Mon, 26 Aug 2019 17:52:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MRUQRx2eZVIQ; Mon, 26 Aug 2019 17:52:18 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 89B638B7E1;
 Mon, 26 Aug 2019 17:52:17 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0EB95696D5; Mon, 26 Aug 2019 15:52:17 +0000 (UTC)
Message-Id: <909c26db9facd7fe454695b303f952e019dd9eda.1566834712.git.christophe.leroy@c-s.fr>
In-Reply-To: <d644eaf7dff8cc149260066802af230bdf34fded.1566834712.git.christophe.leroy@c-s.fr>
References: <d644eaf7dff8cc149260066802af230bdf34fded.1566834712.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 4/6] powerpc/32s: use CONFIG_PPC_BOOK3S_601 instead of reading
 PVR
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 26 Aug 2019 15:52:17 +0000 (UTC)
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

Use CONFIG_PPC_BOOK3S_601 instead of reading PVR to know if
it is a 601 or not.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_32.S | 49 +++++++++++++++++++------------------------
 arch/powerpc/kernel/misc_32.S |  6 ++----
 2 files changed, 24 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index 9e6f01abb31e..4a24f8f026c7 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -34,7 +34,16 @@
 
 #include "head_32.h"
 
-/* 601 only have IBAT; cr0.eq is set on 601 when using this macro */
+/* 601 only have IBAT */
+#ifdef CONFIG_PPC_BOOK3S_601
+#define LOAD_BAT(n, reg, RA, RB)	\
+	li	RA,0;			\
+	mtspr	SPRN_IBAT##n##U,RA;	\
+	lwz	RA,(n*16)+0(reg);	\
+	lwz	RB,(n*16)+4(reg);	\
+	mtspr	SPRN_IBAT##n##U,RA;	\
+	mtspr	SPRN_IBAT##n##L,RB
+#else
 #define LOAD_BAT(n, reg, RA, RB)	\
 	/* see the comment for clear_bats() -- Cort */ \
 	li	RA,0;			\
@@ -44,12 +53,11 @@
 	lwz	RB,(n*16)+4(reg);	\
 	mtspr	SPRN_IBAT##n##U,RA;	\
 	mtspr	SPRN_IBAT##n##L,RB;	\
-	beq	1f;			\
 	lwz	RA,(n*16)+8(reg);	\
 	lwz	RB,(n*16)+12(reg);	\
 	mtspr	SPRN_DBAT##n##U,RA;	\
-	mtspr	SPRN_DBAT##n##L,RB;	\
-1:
+	mtspr	SPRN_DBAT##n##L,RB
+#endif
 
 	__HEAD
 	.stabs	"arch/powerpc/kernel/",N_SO,0,0,0f
@@ -820,9 +828,6 @@ load_up_mmu:
 
 /* Load the BAT registers with the values set up by MMU_init.
    MMU_init takes care of whether we're on a 601 or not. */
-	mfpvr	r3
-	srwi	r3,r3,16
-	cmpwi	r3,1
 	lis	r3,BATS@ha
 	addi	r3,r3,BATS@l
 	tophys(r3,r3)
@@ -998,11 +1003,8 @@ EXPORT_SYMBOL(switch_mmu_context)
  */
 clear_bats:
 	li	r10,0
-	mfspr	r9,SPRN_PVR
-	rlwinm	r9,r9,16,16,31		/* r9 = 1 for 601, 4 for 604 */
-	cmpwi	r9, 1
-	beq	1f
 
+#ifndef CONFIG_PPC_BOOK3S_601
 	mtspr	SPRN_DBAT0U,r10
 	mtspr	SPRN_DBAT0L,r10
 	mtspr	SPRN_DBAT1U,r10
@@ -1011,7 +1013,7 @@ clear_bats:
 	mtspr	SPRN_DBAT2L,r10
 	mtspr	SPRN_DBAT3U,r10
 	mtspr	SPRN_DBAT3L,r10
-1:
+#endif
 	mtspr	SPRN_IBAT0U,r10
 	mtspr	SPRN_IBAT0L,r10
 	mtspr	SPRN_IBAT1U,r10
@@ -1106,10 +1108,7 @@ mmu_off:
  */
 initial_bats:
 	lis	r11,PAGE_OFFSET@h
-	mfspr	r9,SPRN_PVR
-	rlwinm	r9,r9,16,16,31		/* r9 = 1 for 601, 4 for 604 */
-	cmpwi	0,r9,1
-	bne	4f
+#ifdef CONFIG_PPC_BOOK3S_601
 	ori	r11,r11,4		/* set up BAT registers for 601 */
 	li	r8,0x7f			/* valid, block length = 8MB */
 	mtspr	SPRN_IBAT0U,r11		/* N.B. 601 has valid bit in */
@@ -1122,10 +1121,8 @@ initial_bats:
 	addis	r8,r8,0x800000@h
 	mtspr	SPRN_IBAT2U,r11
 	mtspr	SPRN_IBAT2L,r8
-	isync
-	blr
-
-4:	tophys(r8,r11)
+#else
+	tophys(r8,r11)
 #ifdef CONFIG_SMP
 	ori	r8,r8,0x12		/* R/W access, M=1 */
 #else
@@ -1137,10 +1134,10 @@ initial_bats:
 	mtspr	SPRN_DBAT0U,r11		/* bit in upper BAT register */
 	mtspr	SPRN_IBAT0L,r8
 	mtspr	SPRN_IBAT0U,r11
+#endif
 	isync
 	blr
 
-
 #ifdef CONFIG_BOOTX_TEXT
 setup_disp_bat:
 	/*
@@ -1155,15 +1152,13 @@ setup_disp_bat:
 	beqlr
 	lwz	r11,0(r8)
 	lwz	r8,4(r8)
-	mfspr	r9,SPRN_PVR
-	rlwinm	r9,r9,16,16,31		/* r9 = 1 for 601, 4 for 604 */
-	cmpwi	0,r9,1
-	beq	1f
+#ifndef CONFIG_PPC_BOOK3S_601
 	mtspr	SPRN_DBAT3L,r8
 	mtspr	SPRN_DBAT3U,r11
-	blr
-1:	mtspr	SPRN_IBAT3L,r8
+#else
+	mtspr	SPRN_IBAT3L,r8
 	mtspr	SPRN_IBAT3U,r11
+#endif
 	blr
 #endif /* CONFIG_BOOTX_TEXT */
 
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index 02d90e1ebf65..b917641cdaa6 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -303,11 +303,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_UNIFIED_ID_CACHE)
 	mfspr	r3,SPRN_L1CSR1
 	ori	r3,r3,L1CSR1_ICFI|L1CSR1_ICLFR
 	mtspr	SPRN_L1CSR1,r3
+#elif defined(CONFIG_PPC_BOOK3S_601)
+	blr			/* for 601, do nothing */
 #else
-	mfspr	r3,SPRN_PVR
-	rlwinm	r3,r3,16,16,31
-	cmpwi	0,r3,1
-	beqlr			/* for 601, do nothing */
 	/* 603/604 processor - use invalidate-all bit in HID0 */
 	mfspr	r3,SPRN_HID0
 	ori	r3,r3,HID0_ICFI
-- 
2.13.3

