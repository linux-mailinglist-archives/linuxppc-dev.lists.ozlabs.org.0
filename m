Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D0C9150E3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 16:52:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W79tK5GKTz79Zh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 00:52:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W79m66ctrz3fv2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 00:47:18 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4W79ky54WDz9vGb;
	Mon, 24 Jun 2024 16:46:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mk9hvJ7jNw11; Mon, 24 Jun 2024 16:46:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4W79km54ygz9vDw;
	Mon, 24 Jun 2024 16:46:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AA3738B766;
	Mon, 24 Jun 2024 16:46:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0HJ9iTrXikMs; Mon, 24 Jun 2024 16:46:08 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.33])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1B3EA8B768;
	Mon, 24 Jun 2024 16:46:08 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v6 17/23] powerpc/e500: Encode hugepage size in PTE bits
Date: Mon, 24 Jun 2024 16:45:43 +0200
Message-ID: <b242a6ecbc50aa7d307aae109dc789b05659ff8a.1719240269.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1719240269.git.christophe.leroy@csgroup.eu>
References: <cover.1719240269.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719240334; l=4066; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=ynQfm9JBiFGAxo+DROotbCi4y0+yhN5d6b0AA4yoL0Q=; b=CxYYYeIbkn7GeOK87hJi7hs7qLOX9NYJEYJJDGgsXJKBNizZ0mnHf3LNsjhOCxCVpDa1eetVq dFqDBBLS1thA+pNrGNBvOejyyb4LJBCtnoeevkVuLz7Cp8pholtqw0J
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use PTE page size bits to encode hugepage size with the following
format corresponding to the values expected in bits 52-55 in MAS1
register. Those bits are called TSIZE:
	0001 	4 Kbyte
	0010 	16 Kbyte
	0011 	64 Kbyte
	0100 	256 Kbyte
	0101 	1 Mbyte
	0110 	4 Mbyte
	0111 	16 Mbyte
	1000 	64 Mbyte
	1001 	256 Mbyte
	1010 	1 Gbyte
	1011 	4 Gbyte
	1100 	16 Gbyte
	1101	64 Gbyte
	1110	256 Gbyte
	1111	1 Tbyte

It corresponds to shift value minus 10 with lowest bit removed.

It is not the value expected in the PTE in that field, but only
e6500 performs HW based TLB loading and the e6500 reference manual
explicitely says that this field is ignored.

Also add pte_huge_size() which will be used later.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v5: Use PAGE SIZE field instead of U0-U3 because on some HW U2-U3 are used for something else.
---
 .../powerpc/include/asm/nohash/hugetlb-e500.h |  9 ++++++
 arch/powerpc/include/asm/nohash/pte-e500.h    | 28 +++++++++----------
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/hugetlb-e500.h b/arch/powerpc/include/asm/nohash/hugetlb-e500.h
index 8f04ad20e040..c6a0938e86fd 100644
--- a/arch/powerpc/include/asm/nohash/hugetlb-e500.h
+++ b/arch/powerpc/include/asm/nohash/hugetlb-e500.h
@@ -42,4 +42,13 @@ static inline int check_and_get_huge_psize(int shift)
 	return shift_to_mmu_psize(shift);
 }
 
+static inline pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
+{
+	unsigned int tsize = shift - _PAGE_PSIZE_SHIFT_OFFSET;
+	pte_basic_t val = (tsize << _PAGE_PSIZE_SHIFT) & _PAGE_PSIZE_MSK;
+
+	return __pte((pte_val(entry) & ~(pte_basic_t)_PAGE_PSIZE_MSK) | val);
+}
+#define arch_make_huge_pte arch_make_huge_pte
+
 #endif /* _ASM_POWERPC_NOHASH_HUGETLB_E500_H */
diff --git a/arch/powerpc/include/asm/nohash/pte-e500.h b/arch/powerpc/include/asm/nohash/pte-e500.h
index 975facc7e38e..6dac1c0a6937 100644
--- a/arch/powerpc/include/asm/nohash/pte-e500.h
+++ b/arch/powerpc/include/asm/nohash/pte-e500.h
@@ -19,20 +19,7 @@
 #define _PAGE_BAP_SX	0x000040
 #define _PAGE_BAP_UX	0x000080
 #define _PAGE_PSIZE_MSK	0x000f00
-#define _PAGE_PSIZE_4K	0x000200
-#define _PAGE_PSIZE_8K	0x000300
-#define _PAGE_PSIZE_16K	0x000400
-#define _PAGE_PSIZE_32K	0x000500
-#define _PAGE_PSIZE_64K	0x000600
-#define _PAGE_PSIZE_128K	0x000700
-#define _PAGE_PSIZE_256K	0x000800
-#define _PAGE_PSIZE_512K	0x000900
-#define _PAGE_PSIZE_1M	0x000a00
-#define _PAGE_PSIZE_2M	0x000b00
-#define _PAGE_PSIZE_4M	0x000c00
-#define _PAGE_PSIZE_8M	0x000d00
-#define _PAGE_PSIZE_16M	0x000e00
-#define _PAGE_PSIZE_32M	0x000f00
+#define _PAGE_TSIZE_4K	0x000100
 #define _PAGE_DIRTY	0x001000 /* C: page changed */
 #define _PAGE_SW0	0x002000
 #define _PAGE_U3	0x004000
@@ -46,6 +33,9 @@
 #define _PAGE_NO_CACHE	0x400000 /* I: cache inhibit */
 #define _PAGE_WRITETHRU	0x800000 /* W: cache write-through */
 
+#define _PAGE_PSIZE_SHIFT		7
+#define _PAGE_PSIZE_SHIFT_OFFSET	10
+
 /* "Higher level" linux bit combinations */
 #define _PAGE_EXEC		(_PAGE_BAP_SX | _PAGE_BAP_UX) /* .. and was cache cleaned */
 #define _PAGE_READ		(_PAGE_BAP_SR | _PAGE_BAP_UR) /* User read permission */
@@ -87,7 +77,7 @@
  * pages. We always set _PAGE_COHERENT when SMP is enabled or
  * the processor might need it for DMA coherency.
  */
-#define _PAGE_BASE_NC	(_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_PSIZE_4K)
+#define _PAGE_BASE_NC	(_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_TSIZE_4K)
 #if defined(CONFIG_SMP)
 #define _PAGE_BASE	(_PAGE_BASE_NC | _PAGE_COHERENT)
 #else
@@ -103,6 +93,14 @@ static inline pte_t pte_mkexec(pte_t pte)
 }
 #define pte_mkexec pte_mkexec
 
+static inline unsigned long pte_huge_size(pte_t pte)
+{
+	pte_basic_t val = pte_val(pte);
+
+	return 1UL << (((val & _PAGE_PSIZE_MSK) >> _PAGE_PSIZE_SHIFT) + _PAGE_PSIZE_SHIFT_OFFSET);
+}
+#define pte_huge_size pte_huge_size
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __KERNEL__ */
-- 
2.44.0

