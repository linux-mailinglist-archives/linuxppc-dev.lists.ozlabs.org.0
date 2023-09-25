Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D1B7ADF3D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 20:47:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvX182cRnz3j3F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 04:47:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvWj90xJ6z3dj5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 04:33:33 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RvWgb0f4tz9vB5;
	Mon, 25 Sep 2023 20:32:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z8pshZZK-3LD; Mon, 25 Sep 2023 20:32:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RvWg549JMz9vCC;
	Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8AF808B78D;
	Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id si3sGEFU4G8j; Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.137])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 53FA98B796;
	Mon, 25 Sep 2023 20:31:44 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38PIVa901499256
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 20:31:37 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38PIVaYq1499255;
	Mon, 25 Sep 2023 20:31:36 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 31/37] powerpc/44x: Introduce _PAGE_READ and remove _PAGE_USER
Date: Mon, 25 Sep 2023 20:31:45 +0200
Message-ID: <043e17987b260b99b45094138c6cb2e89e63d499.1695659959.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695659959.git.christophe.leroy@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695666676; l=6805; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=s3BNmCTyHq/3Leje/kEdJnaf/h+UARDFS74k4QUIx6k=; b=F+70dNnr2iuxXun14KGvdnmBBX+kp76oU3lq+4q45o0E9OteEMoCbM10qMvLVAjlk/ITXDd5R W8cZ3IhMwOkAp+0w490vk+UDZb05r7Awd0Uj0ysxtG4A1YUdZ3QzuW6
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

44x MMU has 6 page protection bits:
- R, W, X for supervisor
- R, W, X for user

It means that it can support X without R.

To do that, _PAGE_READ flag is needed but there is no bit available
for it in PTE. On the other hand the only real use of _PAGE_USER is
to implement PAGE_NONE by clearing _PAGE_USER.

As _PAGE_NONE can also be implemented by clearing _PAGE_READ,
remove _PAGE_USER and add _PAGE_READ. In order to insert bits in
one go during TLB miss, move _PAGE_ACCESSED and put _PAGE_READ
just after _PAGE_DIRTY so that _PAGE_DIRTY is copied into SW and
_PAGE_READ into SR at once.

With that change, 44x now also honors execute-only protection.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/pte-44x.h | 22 +++---------
 arch/powerpc/kernel/head_44x.S               | 36 ++++++++++----------
 2 files changed, 22 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pte-44x.h b/arch/powerpc/include/asm/nohash/32/pte-44x.h
index fc0c075006ea..851813725237 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-44x.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-44x.h
@@ -63,28 +63,21 @@
  */
 
 #define _PAGE_PRESENT	0x00000001		/* S: PTE valid */
-#define _PAGE_RW	0x00000002		/* S: Write permission */
+#define _PAGE_WRITE	0x00000002		/* S: Write permission */
 #define _PAGE_EXEC	0x00000004		/* H: Execute permission */
-#define _PAGE_ACCESSED	0x00000008		/* S: Page referenced */
+#define _PAGE_READ	0x00000008		/* S: Read permission */
 #define _PAGE_DIRTY	0x00000010		/* S: Page dirty */
 #define _PAGE_SPECIAL	0x00000020		/* S: Special page */
-#define _PAGE_USER	0x00000040		/* S: User page */
+#define _PAGE_ACCESSED	0x00000040		/* S: Page referenced */
 #define _PAGE_ENDIAN	0x00000080		/* H: E bit */
 #define _PAGE_GUARDED	0x00000100		/* H: G bit */
 #define _PAGE_COHERENT	0x00000200		/* H: M bit */
 #define _PAGE_NO_CACHE	0x00000400		/* H: I bit */
 #define _PAGE_WRITETHRU	0x00000800		/* H: W bit */
 
-#define _PAGE_WRITE	_PAGE_RW
-
 /* No page size encoding in the linux PTE */
 #define _PAGE_PSIZE		0
 
-#define _PAGE_KERNEL_RO		0
-#define _PAGE_KERNEL_ROX	_PAGE_EXEC
-#define _PAGE_KERNEL_RW		(_PAGE_DIRTY | _PAGE_RW)
-#define _PAGE_KERNEL_RWX	(_PAGE_DIRTY | _PAGE_RW | _PAGE_EXEC)
-
 /* TODO: Add large page lowmem mapping support */
 #define _PMD_PRESENT	0
 #define _PMD_PRESENT_MASK (PAGE_MASK)
@@ -107,14 +100,7 @@
 #define _PAGE_BASE	(_PAGE_BASE_NC)
 #endif
 
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
 #endif /*  _ASM_POWERPC_NOHASH_32_PTE_44x_H */
diff --git a/arch/powerpc/kernel/head_44x.S b/arch/powerpc/kernel/head_44x.S
index 858dabf84432..25642e802ed3 100644
--- a/arch/powerpc/kernel/head_44x.S
+++ b/arch/powerpc/kernel/head_44x.S
@@ -314,8 +314,8 @@ interrupt_base:
 	 * kernel page tables.
 	 */
 	lis	r11, PAGE_OFFSET@h
-	cmplw	r10, r11
-	blt+	3f
+	cmplw	cr7, r10, r11
+	blt+	cr7, 3f
 	lis	r11, swapper_pg_dir@h
 	ori	r11, r11, swapper_pg_dir@l
 
@@ -355,7 +355,7 @@ interrupt_base:
 	 *       place or can we save a couple of instructions here ?
 	 */
 	mfspr	r12,SPRN_ESR
-	li	r13,_PAGE_PRESENT|_PAGE_ACCESSED
+	li	r13,_PAGE_PRESENT|_PAGE_ACCESSED|_PAGE_READ
 	rlwimi	r13,r12,10,30,30
 
 	/* Load the PTE */
@@ -428,8 +428,8 @@ interrupt_base:
 	 * kernel page tables.
 	 */
 	lis	r11, PAGE_OFFSET@h
-	cmplw	r10, r11
-	blt+	3f
+	cmplw	cr7, r10, r11
+	blt+	cr7, 3f
 	lis	r11, swapper_pg_dir@h
 	ori	r11, r11, swapper_pg_dir@l
 
@@ -515,6 +515,7 @@ interrupt_base:
  * 	r11 - PTE high word value
  *	r12 - PTE low word value
  *	r13 - TLB index
+ *	cr7 - Result of comparison with PAGE_OFFSET
  *	MMUCR - loaded with proper value when we get here
  *	Upon exit, we reload everything and RFI.
  */
@@ -533,11 +534,10 @@ finish_tlb_load_44x:
 	tlbwe	r10,r13,PPC44x_TLB_PAGEID	/* Write PAGEID */
 
 	/* And WS 2 */
-	li	r10,0xf85			/* Mask to apply from PTE */
-	rlwimi	r10,r12,29,30,30		/* DIRTY -> SW position */
+	li	r10,0xf84			/* Mask to apply from PTE */
+	rlwimi	r10,r12,29,30,31		/* DIRTY,READ -> SW,SR position */
 	and	r11,r12,r10			/* Mask PTE bits to keep */
-	andi.	r10,r12,_PAGE_USER		/* User page ? */
-	beq	1f				/* nope, leave U bits empty */
+	bge	cr7,1f			/* User page ? no, leave U bits empty */
 	rlwimi	r11,r11,3,26,28			/* yes, copy S bits to U */
 	rlwinm	r11,r11,0,~PPC44x_TLB_SX	/* Clear SX if User page */
 1:	tlbwe	r11,r13,PPC44x_TLB_ATTRIB	/* Write ATTRIB */
@@ -568,8 +568,8 @@ finish_tlb_load_44x:
 	 * kernel page tables.
 	 */
 	lis	r11,PAGE_OFFSET@h
-	cmplw	cr0,r10,r11
-	blt+	3f
+	cmplw	cr7,r10,r11
+	blt+	cr7,3f
 	lis	r11,swapper_pg_dir@h
 	ori	r11,r11, swapper_pg_dir@l
 	li	r12,0			/* MMUCR = 0 */
@@ -599,7 +599,7 @@ finish_tlb_load_44x:
 	 *       place or can we save a couple of instructions here ?
 	 */
 	mfspr	r12,SPRN_ESR
-	li	r13,_PAGE_PRESENT|_PAGE_ACCESSED
+	li	r13,_PAGE_PRESENT|_PAGE_ACCESSED|_PAGE_READ
 	rlwimi	r13,r12,10,30,30
 
 	/* Load the PTE */
@@ -669,8 +669,8 @@ finish_tlb_load_44x:
 	 * kernel page tables.
 	 */
 	lis	r11,PAGE_OFFSET@h
-	cmplw	cr0,r10,r11
-	blt+	3f
+	cmplw	cr7,r10,r11
+	blt+	cr7,3f
 	lis	r11,swapper_pg_dir@h
 	ori	r11,r11, swapper_pg_dir@l
 	li	r12,0			/* MMUCR = 0 */
@@ -744,6 +744,7 @@ finish_tlb_load_44x:
  * 	r11 - PTE high word value
  *	r12 - PTE low word value
  *      r13 - free to use
+ *	cr7 - Result of comparison with PAGE_OFFSET
  *	MMUCR - loaded with proper value when we get here
  *	Upon exit, we reload everything and RFI.
  */
@@ -753,11 +754,10 @@ finish_tlb_load_47x:
 	tlbwe	r11,r13,1
 
 	/* And make up word 2 */
-	li	r10,0xf85			/* Mask to apply from PTE */
-	rlwimi	r10,r12,29,30,30		/* DIRTY -> SW position */
+	li	r10,0xf84			/* Mask to apply from PTE */
+	rlwimi	r10,r12,29,30,31		/* DIRTY,READ -> SW,SR position */
 	and	r11,r12,r10			/* Mask PTE bits to keep */
-	andi.	r10,r12,_PAGE_USER		/* User page ? */
-	beq	1f				/* nope, leave U bits empty */
+	bge	cr7,1f			/* User page ? no, leave U bits empty */
 	rlwimi	r11,r11,3,26,28			/* yes, copy S bits to U */
 	rlwinm	r11,r11,0,~PPC47x_TLB2_SX	/* Clear SX if User page */
 1:	tlbwe	r11,r13,2
-- 
2.41.0

