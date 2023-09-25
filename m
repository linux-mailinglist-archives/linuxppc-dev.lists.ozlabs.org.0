Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AEA7ADF3F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 20:48:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvX2L5Y2gz3gWm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 04:48:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvWjK20XVz3cnV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 04:33:41 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RvWgd1N9Pz9vBQ;
	Mon, 25 Sep 2023 20:32:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_ig0qg1M75u; Mon, 25 Sep 2023 20:32:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RvWg543K3z9vBx;
	Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 875B18B763;
	Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0oZXEeFob9fs; Mon, 25 Sep 2023 20:31:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.137])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5CE7D8B7A7;
	Mon, 25 Sep 2023 20:31:44 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38PIVaA71499252
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 20:31:36 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38PIVa5v1499251;
	Mon, 25 Sep 2023 20:31:36 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 30/37] powerpc/e500: Introduce _PAGE_READ and remove _PAGE_USER
Date: Mon, 25 Sep 2023 20:31:44 +0200
Message-ID: <0849ab6bf7ae2af23f94b0457fa40d0ea3983fe4.1695659959.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695659959.git.christophe.leroy@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695666676; l=6056; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=+yAU856OIxw+JvcrrlMBmiWVWQ85xnwsaQE3DVUWpKI=; b=cCBZ8XFteq1dmzjy9TDdpTKvw0JXcU0cmvWXqTRbr6Ny5aAlko3Js1X2nH6btsfykt8POmlT8 Va4u5VQnPp5Cy0H2NqCYEzd3uVegjIWW1wmrRIhatejhMvHQia7Mtyt
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

e500 MMU has 6 page protection bits:
- R, W, X for supervisor
- R, W, X for user

It means that it can support X without R.

To do that, _PAGE_READ flag is needed.

With 32 bits PTE there is no bit available for it in PTE. On the
other hand the only real use of _PAGE_USER is to implement PAGE_NONE
by clearing _PAGE_USER. As _PAGE_NONE can also be implemented by
clearing _PAGE_READ, remove _PAGE_USER and add _PAGE_READ. Move
_PAGE_PRESENT into bit 30 so that _PAGE_READ can match SR bit.

With 64 bits PTE _PAGE_USER is already the combination of SR and UR
so all we need to do is to rename it _PAGE_READ.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/pte-85xx.h | 22 ++++---------------
 arch/powerpc/include/asm/nohash/pte-e500.h    | 20 ++++++++---------
 arch/powerpc/kernel/head_85xx.S               | 10 ++++-----
 3 files changed, 18 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pte-85xx.h b/arch/powerpc/include/asm/nohash/32/pte-85xx.h
index 462acf69e302..653a342d3b25 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-85xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-85xx.h
@@ -17,9 +17,9 @@
 */
 
 /* Definitions for FSL Book-E Cores */
-#define _PAGE_PRESENT	0x00001	/* S: PTE contains a translation */
-#define _PAGE_USER	0x00002	/* S: User page (maps to UR) */
-#define _PAGE_RW	0x00004	/* S: Write permission (SW) */
+#define _PAGE_READ	0x00001	/* H: Read permission (SR) */
+#define _PAGE_PRESENT	0x00002	/* S: PTE contains a translation */
+#define _PAGE_WRITE	0x00004	/* S: Write permission (SW) */
 #define _PAGE_DIRTY	0x00008	/* S: Page dirty */
 #define _PAGE_EXEC	0x00010	/* H: SX permission */
 #define _PAGE_ACCESSED	0x00020	/* S: Page referenced */
@@ -31,13 +31,6 @@
 #define _PAGE_WRITETHRU	0x00400	/* H: W bit */
 #define _PAGE_SPECIAL	0x00800 /* S: Special page */
 
-#define _PAGE_WRITE	_PAGE_RW
-
-#define _PAGE_KERNEL_RO		0
-#define _PAGE_KERNEL_ROX	_PAGE_EXEC
-#define _PAGE_KERNEL_RW		(_PAGE_DIRTY | _PAGE_RW)
-#define _PAGE_KERNEL_RWX	(_PAGE_DIRTY | _PAGE_RW | _PAGE_EXEC)
-
 /* No page size encoding in the linux PTE */
 #define _PAGE_PSIZE		0
 
@@ -63,14 +56,7 @@
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
 #endif /*  _ASM_POWERPC_NOHASH_32_PTE_FSL_85xx_H */
diff --git a/arch/powerpc/include/asm/nohash/pte-e500.h b/arch/powerpc/include/asm/nohash/pte-e500.h
index b775c7d465a4..31d2c3ea7df8 100644
--- a/arch/powerpc/include/asm/nohash/pte-e500.h
+++ b/arch/powerpc/include/asm/nohash/pte-e500.h
@@ -48,14 +48,19 @@
 
 /* "Higher level" linux bit combinations */
 #define _PAGE_EXEC		(_PAGE_BAP_SX | _PAGE_BAP_UX) /* .. and was cache cleaned */
-#define _PAGE_RW		(_PAGE_BAP_SW | _PAGE_BAP_UW) /* User write permission */
+#define _PAGE_READ		(_PAGE_BAP_SR | _PAGE_BAP_UR) /* User read permission */
+#define _PAGE_WRITE		(_PAGE_BAP_SW | _PAGE_BAP_UW) /* User write permission */
+
 #define _PAGE_KERNEL_RW		(_PAGE_BAP_SW | _PAGE_BAP_SR | _PAGE_DIRTY)
 #define _PAGE_KERNEL_RO		(_PAGE_BAP_SR)
 #define _PAGE_KERNEL_RWX	(_PAGE_BAP_SW | _PAGE_BAP_SR | _PAGE_DIRTY | _PAGE_BAP_SX)
 #define _PAGE_KERNEL_ROX	(_PAGE_BAP_SR | _PAGE_BAP_SX)
-#define _PAGE_USER		(_PAGE_BAP_UR | _PAGE_BAP_SR) /* Can be read */
 
-#define _PAGE_WRITE	_PAGE_RW
+#define _PAGE_NA	0
+#define _PAGE_RO	_PAGE_READ
+#define _PAGE_ROX	(_PAGE_READ | _PAGE_BAP_UX)
+#define _PAGE_RW	(_PAGE_READ | _PAGE_WRITE)
+#define _PAGE_RWX	(_PAGE_READ | _PAGE_WRITE | _PAGE_BAP_UX)
 
 #define _PAGE_SPECIAL	_PAGE_SW0
 
@@ -90,14 +95,7 @@
 #define _PAGE_BASE	(_PAGE_BASE_NC)
 #endif
 
-/* Permission masks used to generate the __P and __S table */
-#define PAGE_NONE	__pgprot(_PAGE_BASE)
-#define PAGE_SHARED	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW)
-#define PAGE_SHARED_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW | _PAGE_BAP_UX)
-#define PAGE_COPY	__pgprot(_PAGE_BASE | _PAGE_USER)
-#define PAGE_COPY_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_BAP_UX)
-#define PAGE_READONLY	__pgprot(_PAGE_BASE | _PAGE_USER)
-#define PAGE_READONLY_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_BAP_UX)
+#include <asm/pgtable-masks.h>
 
 #ifndef __ASSEMBLY__
 static inline pte_t pte_mkexec(pte_t pte)
diff --git a/arch/powerpc/kernel/head_85xx.S b/arch/powerpc/kernel/head_85xx.S
index 594756a62c8e..3739d5a281a7 100644
--- a/arch/powerpc/kernel/head_85xx.S
+++ b/arch/powerpc/kernel/head_85xx.S
@@ -485,10 +485,10 @@ END_BTB_FLUSH_SECTION
 	 */
 	mfspr	r12,SPRN_ESR
 #ifdef CONFIG_PTE_64BIT
-	li	r13,_PAGE_PRESENT
+	li	r13,_PAGE_PRESENT|_PAGE_BAP_SR
 	oris	r13,r13,_PAGE_ACCESSED@h
 #else
-	li	r13,_PAGE_PRESENT|_PAGE_ACCESSED
+	li	r13,_PAGE_PRESENT|_PAGE_READ|_PAGE_ACCESSED
 #endif
 	rlwimi	r13,r12,11,29,29
 
@@ -783,15 +783,15 @@ BEGIN_MMU_FTR_SECTION
 	mtspr	SPRN_MAS7, r10
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_BIG_PHYS)
 #else
-	li	r10, (_PAGE_EXEC | _PAGE_PRESENT)
+	li	r10, (_PAGE_EXEC | _PAGE_READ)
 	mr	r13, r11
 	rlwimi	r10, r11, 31, 29, 29	/* extract _PAGE_DIRTY into SW */
 	and	r12, r11, r10
-	andi.	r10, r11, _PAGE_USER	/* Test for _PAGE_USER */
+	mcrf	cr0, cr5		/* Test for user page */
 	slwi	r10, r12, 1
 	or	r10, r10, r12
 	rlwinm	r10, r10, 0, ~_PAGE_EXEC	/* Clear SX on user pages */
-	iseleq	r12, r12, r10
+	isellt	r12, r10, r12
 	rlwimi	r13, r12, 0, 20, 31	/* Get RPN from PTE, merge w/ perms */
 	mtspr	SPRN_MAS3, r13
 #endif
-- 
2.41.0

