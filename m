Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A06AC479E3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 08:12:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45S18724y6zDqbG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 16:12:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="rpy4PTPj"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45S16F2ZdczDqSP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 16:10:28 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45S1626f24z9v0hJ;
 Mon, 17 Jun 2019 08:10:18 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=rpy4PTPj; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id nogowJqC3dEQ; Mon, 17 Jun 2019 08:10:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45S1625LcNz9v0hH;
 Mon, 17 Jun 2019 08:10:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560751818; bh=AeYbBJqrnbuK3ysLYT0tk2Zm0b9RNj2pBXn6SnxJees=;
 h=From:Subject:To:Cc:Date:From;
 b=rpy4PTPj3AH4SgJlWEWl3pbR27f9xHrJT32oAwrxzTpdqccM0jpFeySxb6fPNnJSK
 VQhjOI8kZm5rW4ordwhodFbtjRN/DcBYeZPX2yRn9jBrx+62Jos/Z0YZ4xIChelES3
 SxDgR0ADnAlvKoBy5ld/EHtHyEMRXJJSi3L2iaPw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3BE168B77E;
 Mon, 17 Jun 2019 08:10:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hD4dG_ani6nB; Mon, 17 Jun 2019 08:10:23 +0200 (CEST)
Received: from PO15451.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E96238B75A;
 Mon, 17 Jun 2019 08:10:22 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 8A11966B22; Mon, 17 Jun 2019 06:10:22 +0000 (UTC)
Message-Id: <4291e0dd36aafff58bec429ac5355d10206c72d6.1560751738.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/32s: fix suspend/resume when IBATs 4-7 are used
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Andreas Schwab <schwab@linux-m68k.org>
Date: Mon, 17 Jun 2019 06:10:22 +0000 (UTC)
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

Previously, only IBAT1 and IBAT2 were used to map kernel linear mem.
Since commit 63b2bc619565 ("powerpc/mm/32s: Use BATs for
STRICT_KERNEL_RWX"), we may have all 8 BATs used for mapping
kernel text. But the suspend/restore functions only save/restore
BATs 0 to 3, and clears BATs 4 to 7.

Make suspend and restore functions respectively save and reload
the 8 BATs on CPUs having MMU_FTR_USE_HIGH_BATS feature.

Reported-by: Andreas Schwab <schwab@linux-m68k.org>
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/swsusp_32.S         | 108 +++++++++++++++++++++++++-------
 arch/powerpc/platforms/powermac/sleep.S | 104 +++++++++++++++++++++++-------
 2 files changed, 166 insertions(+), 46 deletions(-)

diff --git a/arch/powerpc/kernel/swsusp_32.S b/arch/powerpc/kernel/swsusp_32.S
index 7a919e9a3400..4d3068f24ff3 100644
--- a/arch/powerpc/kernel/swsusp_32.S
+++ b/arch/powerpc/kernel/swsusp_32.S
@@ -25,11 +25,19 @@
 #define SL_IBAT2	0x48
 #define SL_DBAT3	0x50
 #define SL_IBAT3	0x58
-#define SL_TB		0x60
-#define SL_R2		0x68
-#define SL_CR		0x6c
-#define SL_LR		0x70
-#define SL_R12		0x74	/* r12 to r31 */
+#define SL_DBAT4	0x60
+#define SL_IBAT4	0x68
+#define SL_DBAT5	0x70
+#define SL_IBAT5	0x78
+#define SL_DBAT6	0x80
+#define SL_IBAT6	0x88
+#define SL_DBAT7	0x90
+#define SL_IBAT7	0x98
+#define SL_TB		0xa0
+#define SL_R2		0xa8
+#define SL_CR		0xac
+#define SL_LR		0xb0
+#define SL_R12		0xb4	/* r12 to r31 */
 #define SL_SIZE		(SL_R12 + 80)
 
 	.section .data
@@ -97,6 +105,24 @@ _GLOBAL(swsusp_arch_suspend)
 	stw	r4,SL_DBAT3(r11)
 	mfdbatl	r4,3
 	stw	r4,SL_DBAT3+4(r11)
+BEGIN_MMU_FTR_SECTION
+	mfdbatu	r4,4
+	stw	r4,SL_DBAT4(r11)
+	mfdbatl	r4,4
+	stw	r4,SL_DBAT4+4(r11)
+	mfdbatu	r4,5
+	stw	r4,SL_DBAT5(r11)
+	mfdbatl	r4,5
+	stw	r4,SL_DBAT5+4(r11)
+	mfdbatu	r4,6
+	stw	r4,SL_DBAT6(r11)
+	mfdbatl	r4,6
+	stw	r4,SL_DBAT6+4(r11)
+	mfdbatu	r4,7
+	stw	r4,SL_DBAT7(r11)
+	mfdbatl	r4,7
+	stw	r4,SL_DBAT7+4(r11)
+END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 	mfibatu	r4,0
 	stw	r4,SL_IBAT0(r11)
 	mfibatl	r4,0
@@ -113,6 +139,24 @@ _GLOBAL(swsusp_arch_suspend)
 	stw	r4,SL_IBAT3(r11)
 	mfibatl	r4,3
 	stw	r4,SL_IBAT3+4(r11)
+BEGIN_MMU_FTR_SECTION
+	mfibatu	r4,4
+	stw	r4,SL_IBAT4(r11)
+	mfibatl	r4,4
+	stw	r4,SL_IBAT4+4(r11)
+	mfibatu	r4,5
+	stw	r4,SL_IBAT5(r11)
+	mfibatl	r4,5
+	stw	r4,SL_IBAT5+4(r11)
+	mfibatu	r4,6
+	stw	r4,SL_IBAT6(r11)
+	mfibatl	r4,6
+	stw	r4,SL_IBAT6+4(r11)
+	mfibatu	r4,7
+	stw	r4,SL_IBAT7(r11)
+	mfibatl	r4,7
+	stw	r4,SL_IBAT7+4(r11)
+END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 
 #if  0
 	/* Backup various CPU config stuffs */
@@ -263,6 +307,24 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	mtdbatu	3,r4
 	lwz	r4,SL_DBAT3+4(r11)
 	mtdbatl	3,r4
+BEGIN_MMU_FTR_SECTION
+	lwz	r4,SL_DBAT4(r11)
+	mtdbatu	4,r4
+	lwz	r4,SL_DBAT4+4(r11)
+	mtdbatl	4,r4
+	lwz	r4,SL_DBAT5(r11)
+	mtdbatu	5,r4
+	lwz	r4,SL_DBAT5+4(r11)
+	mtdbatl	5,r4
+	lwz	r4,SL_DBAT6(r11)
+	mtdbatu	6,r4
+	lwz	r4,SL_DBAT6+4(r11)
+	mtdbatl	6,r4
+	lwz	r4,SL_DBAT7(r11)
+	mtdbatu	7,r4
+	lwz	r4,SL_DBAT7+4(r11)
+	mtdbatl	7,r4
+END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 	lwz	r4,SL_IBAT0(r11)
 	mtibatu	0,r4
 	lwz	r4,SL_IBAT0+4(r11)
@@ -279,27 +341,25 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	mtibatu	3,r4
 	lwz	r4,SL_IBAT3+4(r11)
 	mtibatl	3,r4
-#endif
-
 BEGIN_MMU_FTR_SECTION
-	li	r4,0
-	mtspr	SPRN_DBAT4U,r4
-	mtspr	SPRN_DBAT4L,r4
-	mtspr	SPRN_DBAT5U,r4
-	mtspr	SPRN_DBAT5L,r4
-	mtspr	SPRN_DBAT6U,r4
-	mtspr	SPRN_DBAT6L,r4
-	mtspr	SPRN_DBAT7U,r4
-	mtspr	SPRN_DBAT7L,r4
-	mtspr	SPRN_IBAT4U,r4
-	mtspr	SPRN_IBAT4L,r4
-	mtspr	SPRN_IBAT5U,r4
-	mtspr	SPRN_IBAT5L,r4
-	mtspr	SPRN_IBAT6U,r4
-	mtspr	SPRN_IBAT6L,r4
-	mtspr	SPRN_IBAT7U,r4
-	mtspr	SPRN_IBAT7L,r4
+	lwz	r4,SL_IBAT4(r11)
+	mtibatu	4,r4
+	lwz	r4,SL_IBAT4+4(r11)
+	mtibatl	4,r4
+	lwz	r4,SL_IBAT5(r11)
+	mtibatu	5,r4
+	lwz	r4,SL_IBAT5+4(r11)
+	mtibatl	5,r4
+	lwz	r4,SL_IBAT6(r11)
+	mtibatu	6,r4
+	lwz	r4,SL_IBAT6+4(r11)
+	mtibatl	6,r4
+	lwz	r4,SL_IBAT7(r11)
+	mtibatu	7,r4
+	lwz	r4,SL_IBAT7+4(r11)
+	mtibatl	7,r4
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
+#endif
 
 	/* Flush all TLBs */
 	lis	r4,0x1000
diff --git a/arch/powerpc/platforms/powermac/sleep.S b/arch/powerpc/platforms/powermac/sleep.S
index 6bbcbec97712..2d7b035bee09 100644
--- a/arch/powerpc/platforms/powermac/sleep.S
+++ b/arch/powerpc/platforms/powermac/sleep.S
@@ -33,10 +33,18 @@
 #define SL_IBAT2	0x48
 #define SL_DBAT3	0x50
 #define SL_IBAT3	0x58
-#define SL_TB		0x60
-#define SL_R2		0x68
-#define SL_CR		0x6c
-#define SL_R12		0x70	/* r12 to r31 */
+#define SL_DBAT4	0x60
+#define SL_IBAT4	0x68
+#define SL_DBAT5	0x70
+#define SL_IBAT5	0x78
+#define SL_DBAT6	0x80
+#define SL_IBAT6	0x88
+#define SL_DBAT7	0x90
+#define SL_IBAT7	0x98
+#define SL_TB		0xa0
+#define SL_R2		0xa8
+#define SL_CR		0xac
+#define SL_R12		0xb0	/* r12 to r31 */
 #define SL_SIZE		(SL_R12 + 80)
 
 	.section .text
@@ -104,6 +112,24 @@ _GLOBAL(low_sleep_handler)
 	stw	r4,SL_DBAT3(r1)
 	mfdbatl	r4,3
 	stw	r4,SL_DBAT3+4(r1)
+BEGIN_MMU_FTR_SECTION
+	mfdbatu	r4,4
+	stw	r4,SL_DBAT4(r1)
+	mfdbatl	r4,4
+	stw	r4,SL_DBAT4+4(r1)
+	mfdbatu	r4,5
+	stw	r4,SL_DBAT5(r1)
+	mfdbatl	r4,5
+	stw	r4,SL_DBAT5+4(r1)
+	mfdbatu	r4,6
+	stw	r4,SL_DBAT6(r1)
+	mfdbatl	r4,6
+	stw	r4,SL_DBAT6+4(r1)
+	mfdbatu	r4,7
+	stw	r4,SL_DBAT7(r1)
+	mfdbatl	r4,7
+	stw	r4,SL_DBAT7+4(r1)
+END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 	mfibatu	r4,0
 	stw	r4,SL_IBAT0(r1)
 	mfibatl	r4,0
@@ -120,6 +146,24 @@ _GLOBAL(low_sleep_handler)
 	stw	r4,SL_IBAT3(r1)
 	mfibatl	r4,3
 	stw	r4,SL_IBAT3+4(r1)
+BEGIN_MMU_FTR_SECTION
+	mfibatu	r4,4
+	stw	r4,SL_IBAT4(r1)
+	mfibatl	r4,4
+	stw	r4,SL_IBAT4+4(r1)
+	mfibatu	r4,5
+	stw	r4,SL_IBAT5(r1)
+	mfibatl	r4,5
+	stw	r4,SL_IBAT5+4(r1)
+	mfibatu	r4,6
+	stw	r4,SL_IBAT6(r1)
+	mfibatl	r4,6
+	stw	r4,SL_IBAT6+4(r1)
+	mfibatu	r4,7
+	stw	r4,SL_IBAT7(r1)
+	mfibatl	r4,7
+	stw	r4,SL_IBAT7+4(r1)
+END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 
 	/* Backup various CPU config stuffs */
 	bl	__save_cpu_setup
@@ -303,6 +347,24 @@ grackle_wake_up:
 	mtdbatu	3,r4
 	lwz	r4,SL_DBAT3+4(r1)
 	mtdbatl	3,r4
+BEGIN_MMU_FTR_SECTION
+	lwz	r4,SL_DBAT4(r1)
+	mtdbatu	4,r4
+	lwz	r4,SL_DBAT4+4(r1)
+	mtdbatl	4,r4
+	lwz	r4,SL_DBAT5(r1)
+	mtdbatu	5,r4
+	lwz	r4,SL_DBAT5+4(r1)
+	mtdbatl	5,r4
+	lwz	r4,SL_DBAT6(r1)
+	mtdbatu	6,r4
+	lwz	r4,SL_DBAT6+4(r1)
+	mtdbatl	6,r4
+	lwz	r4,SL_DBAT7(r1)
+	mtdbatu	7,r4
+	lwz	r4,SL_DBAT7+4(r1)
+	mtdbatl	7,r4
+END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 	lwz	r4,SL_IBAT0(r1)
 	mtibatu	0,r4
 	lwz	r4,SL_IBAT0+4(r1)
@@ -319,25 +381,23 @@ grackle_wake_up:
 	mtibatu	3,r4
 	lwz	r4,SL_IBAT3+4(r1)
 	mtibatl	3,r4
-
 BEGIN_MMU_FTR_SECTION
-	li	r4,0
-	mtspr	SPRN_DBAT4U,r4
-	mtspr	SPRN_DBAT4L,r4
-	mtspr	SPRN_DBAT5U,r4
-	mtspr	SPRN_DBAT5L,r4
-	mtspr	SPRN_DBAT6U,r4
-	mtspr	SPRN_DBAT6L,r4
-	mtspr	SPRN_DBAT7U,r4
-	mtspr	SPRN_DBAT7L,r4
-	mtspr	SPRN_IBAT4U,r4
-	mtspr	SPRN_IBAT4L,r4
-	mtspr	SPRN_IBAT5U,r4
-	mtspr	SPRN_IBAT5L,r4
-	mtspr	SPRN_IBAT6U,r4
-	mtspr	SPRN_IBAT6L,r4
-	mtspr	SPRN_IBAT7U,r4
-	mtspr	SPRN_IBAT7L,r4
+	lwz	r4,SL_IBAT4(r1)
+	mtibatu	4,r4
+	lwz	r4,SL_IBAT4+4(r1)
+	mtibatl	4,r4
+	lwz	r4,SL_IBAT5(r1)
+	mtibatu	5,r4
+	lwz	r4,SL_IBAT5+4(r1)
+	mtibatl	5,r4
+	lwz	r4,SL_IBAT6(r1)
+	mtibatu	6,r4
+	lwz	r4,SL_IBAT6+4(r1)
+	mtibatl	6,r4
+	lwz	r4,SL_IBAT7(r1)
+	mtibatu	7,r4
+	lwz	r4,SL_IBAT7+4(r1)
+	mtibatl	7,r4
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 
 	/* Flush all TLBs */
-- 
2.13.3

