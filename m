Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 984257ADF35
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 20:45:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvWzR3N7hz3hwp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 04:45:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvWhx6lfTz3df1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 04:33:21 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RvWgX01mcz9v8C;
	Mon, 25 Sep 2023 20:32:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wslsfKA5EIsk; Mon, 25 Sep 2023 20:32:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RvWg53T0vz9vBd;
	Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 737018B763;
	Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id VHw58h4c86jD; Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.137])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 53FC58B798;
	Mon, 25 Sep 2023 20:31:44 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38PIVbju1499260
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 20:31:37 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38PIVbFV1499259;
	Mon, 25 Sep 2023 20:31:37 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 32/37] powerpc/40x: Introduce _PAGE_READ and remove _PAGE_USER
Date: Mon, 25 Sep 2023 20:31:46 +0200
Message-ID: <2a13e3ba8a5dec43143cc1f9a91ec71ea1529f3c.1695659959.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695659959.git.christophe.leroy@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695666676; l=6019; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=MN2oe20uSnIzKgymA7l/LmEF/36ItPPYBxmFAb1XhtU=; b=yM0hHYi7L4hAoN9pXLaIb+UzCUH12fNtxV/WrDWelkE802dES9SsFyVX8n9Mn1cWkno2zAgVX hA/tJ62+m23DFAixceSEhmwwtkwPJDAm9mlebXSEbuIpIGFnQuKWYn4
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

_PAGE_USER is used to select the zone. Today zone 0 is kernel
and zone 1 is user.

To implement _PAGE_NONE, _PAGE_USER is cleared, leading to no access
for user but kernel still has access to the page so it's possible for
a user application to write in that page by using a kernel function
as trampoline.

What is really wanted is to have user rights on pages below TASK_SIZE
and no user rights on pages above TASK_SIZE. Use zones for that.
There are 16 zones so lets use the 4 upper address bits to set the
zone and declare zone rights based on TASK_SIZE.

Then drop _PAGE_USER and reuse it as _PAGE_READ that will be checked
in Data TLB miss handler. That will properly handle PAGE_NONE for
both kernel and user.

In addition, it partially implements execute-only right. The
implementation won't be complete because once a TLB has been loaded
via the Instruction TLB miss handler, it will be possible to read
the page. But at least it can't be read unless it is executed first.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/pte-40x.h | 20 +++-----------------
 arch/powerpc/kernel/head_40x.S               |  7 ++++---
 arch/powerpc/mm/nohash/40x.c                 | 19 ++++++++++++-------
 3 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pte-40x.h b/arch/powerpc/include/asm/nohash/32/pte-40x.h
index e28ef0f5781e..d759cfd74754 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-40x.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-40x.h
@@ -42,26 +42,19 @@
 #define _PAGE_PRESENT	0x002	/* software: PTE contains a translation */
 #define	_PAGE_NO_CACHE	0x004	/* I: caching is inhibited */
 #define	_PAGE_WRITETHRU	0x008	/* W: caching is write-through */
-#define	_PAGE_USER	0x010	/* matches one of the zone permission bits */
+#define	_PAGE_READ	0x010	/* software: read permission */
 #define	_PAGE_SPECIAL	0x020	/* software: Special page */
 #define	_PAGE_DIRTY	0x080	/* software: dirty page */
-#define _PAGE_RW	0x100	/* hardware: WR, anded with dirty in exception */
+#define _PAGE_WRITE	0x100	/* hardware: WR, anded with dirty in exception */
 #define _PAGE_EXEC	0x200	/* hardware: EX permission */
 #define _PAGE_ACCESSED	0x400	/* software: R: page referenced */
 
-#define _PAGE_WRITE	_PAGE_RW
-
 /* No page size encoding in the linux PTE */
 #define _PAGE_PSIZE		0
 
 /* cache related flags non existing on 40x */
 #define _PAGE_COHERENT	0
 
-#define _PAGE_KERNEL_RO		0
-#define _PAGE_KERNEL_ROX	_PAGE_EXEC
-#define _PAGE_KERNEL_RW		(_PAGE_DIRTY | _PAGE_RW)
-#define _PAGE_KERNEL_RWX	(_PAGE_DIRTY | _PAGE_RW | _PAGE_EXEC)
-
 #define _PMD_PRESENT	0x400	/* PMD points to page of PTEs */
 #define _PMD_PRESENT_MASK	_PMD_PRESENT
 #define _PMD_BAD	0x802
@@ -74,14 +67,7 @@
 #define _PAGE_BASE_NC	(_PAGE_PRESENT | _PAGE_ACCESSED)
 #define _PAGE_BASE	(_PAGE_BASE_NC)
 
-/* Permission masks used to generate the __P and __S table */
-#define PAGE_NONE	__pgprot(_PAGE_BASE)
-#define PAGE_SHARED	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW)
-#define PAGE_SHARED_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW | _PAGE_EXEC)
-#define PAGE_COPY	__pgprot(_PAGE_BASE | _PAGE_USER)
-#define PAGE_COPY_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_EXEC)
-#define PAGE_READONLY	__pgprot(_PAGE_BASE | _PAGE_USER)
-#define PAGE_READONLY_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_EXEC)
+#include <asm/pgtable-masks.h>
 
 #endif /* __KERNEL__ */
 #endif /*  _ASM_POWERPC_NOHASH_32_PTE_40x_H */
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 9f92f5c5e6aa..9fc90410b385 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -312,7 +312,7 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 
 	rlwimi	r11, r10, 22, 20, 29	/* Compute PTE address */
 	lwz	r11, 0(r11)		/* Get Linux PTE */
-	li	r9, _PAGE_PRESENT | _PAGE_ACCESSED
+	li	r9, _PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_READ
 	andc.	r9, r9, r11		/* Check permission */
 	bne	5f
 
@@ -561,10 +561,11 @@ finish_tlb_load:
 	/*
 	 * Clear out the software-only bits in the PTE to generate the
 	 * TLB_DATA value.  These are the bottom 2 bits of the RPM, the
-	 * top 3 bits of the zone field, and M.
+	 * 4 bits of the zone field, and M.
 	 */
-	li	r9, 0x0ce2
+	li	r9, 0x0cf2
 	andc	r11, r11, r9
+	rlwimi	r11, r10, 8, 24, 27	/* Copy 4 upper address bit into zone */
 
 	/* load the next available TLB index. */
 	lwz	r9, tlb_4xx_index@l(0)
diff --git a/arch/powerpc/mm/nohash/40x.c b/arch/powerpc/mm/nohash/40x.c
index 3684d6e570fb..e835e80c09db 100644
--- a/arch/powerpc/mm/nohash/40x.c
+++ b/arch/powerpc/mm/nohash/40x.c
@@ -48,20 +48,25 @@
  */
 void __init MMU_init_hw(void)
 {
+	int i;
+	unsigned long zpr;
+
 	/*
 	 * The Zone Protection Register (ZPR) defines how protection will
-	 * be applied to every page which is a member of a given zone. At
-	 * present, we utilize only two of the 4xx's zones.
+	 * be applied to every page which is a member of a given zone.
 	 * The zone index bits (of ZSEL) in the PTE are used for software
-	 * indicators, except the LSB.  For user access, zone 1 is used,
-	 * for kernel access, zone 0 is used.  We set all but zone 1
-	 * to zero, allowing only kernel access as indicated in the PTE.
-	 * For zone 1, we set a 01 binary (a value of 10 will not work)
+	 * indicators. We use the 4 upper bits of virtual address to select
+	 * the zone. We set all zones above TASK_SIZE to zero, allowing
+	 * only kernel access as indicated in the PTE. For zones below
+	 * TASK_SIZE, we set a 01 binary (a value of 10 will not work)
 	 * to allow user access as indicated in the PTE.  This also allows
 	 * kernel access as indicated in the PTE.
 	 */
 
-        mtspr(SPRN_ZPR, 0x10000000);
+	for (i = 0, zpr = 0; i < TASK_SIZE >> 28; i++)
+		zpr |= 1 << (30 - i * 2);
+
+	mtspr(SPRN_ZPR, zpr);
 
 	flush_instruction_cache();
 
-- 
2.41.0

