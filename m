Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0588D01F4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 15:42:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VnxTz6zFdz8B0s
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 23:35:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VnxPj6fnlz87Vf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 May 2024 23:31:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4VnxNl50Ssz9tKP;
	Mon, 27 May 2024 15:30:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PTTff4CE0Yd7; Mon, 27 May 2024 15:30:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4VnxNl4Nvvz9tC6;
	Mon, 27 May 2024 15:30:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 91E898B773;
	Mon, 27 May 2024 15:30:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Zt8Ki81erwHc; Mon, 27 May 2024 15:30:47 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.49])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E4C38B764;
	Mon, 27 May 2024 15:30:46 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC PATCH v4 12/16] powerpc/e500: Encode hugepage size in PTE bits
Date: Mon, 27 May 2024 15:30:10 +0200
Message-ID: <10eae3c6815e3aba5f624af92321948e4684c95a.1716815901.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1716815901.git.christophe.leroy@csgroup.eu>
References: <cover.1716815901.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716816601; l=1805; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=uUFe3OogHVPo7wrS42BAn509SjAdI6hEiXUNXjCP0Kk=; b=YL5kCMuwuiOUJzgHNZiLsRNG4JGxpb9X2MJhw2pkjypC8qNj9tqf0pexIsNSaqtiXEuIkUx7j tzlHiAZj6RlB4nEJ2M7CYqgs3yfKNJWdU6O3BAWWYEbp+QuluiZGoYd
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use U0-U3 bits to encode hugepage size, more exactly page shift.

As we start using hugepages at shift 21 (2Mbytes), substract 20
so that it fits into 4 bits. That may change in the future if
we want to use smaller hugepages.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/hugetlb-e500.h | 6 ++++++
 arch/powerpc/include/asm/nohash/pte-e500.h     | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/arch/powerpc/include/asm/nohash/hugetlb-e500.h b/arch/powerpc/include/asm/nohash/hugetlb-e500.h
index 8f04ad20e040..d8e51a3f8557 100644
--- a/arch/powerpc/include/asm/nohash/hugetlb-e500.h
+++ b/arch/powerpc/include/asm/nohash/hugetlb-e500.h
@@ -42,4 +42,10 @@ static inline int check_and_get_huge_psize(int shift)
 	return shift_to_mmu_psize(shift);
 }
 
+static inline pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
+{
+	return __pte(pte_val(entry) | (_PAGE_U3 * (shift - 20)));
+}
+#define arch_make_huge_pte arch_make_huge_pte
+
 #endif /* _ASM_POWERPC_NOHASH_HUGETLB_E500_H */
diff --git a/arch/powerpc/include/asm/nohash/pte-e500.h b/arch/powerpc/include/asm/nohash/pte-e500.h
index 975facc7e38e..091e4bff1fba 100644
--- a/arch/powerpc/include/asm/nohash/pte-e500.h
+++ b/arch/powerpc/include/asm/nohash/pte-e500.h
@@ -46,6 +46,9 @@
 #define _PAGE_NO_CACHE	0x400000 /* I: cache inhibit */
 #define _PAGE_WRITETHRU	0x800000 /* W: cache write-through */
 
+#define _PAGE_HSIZE_MSK (_PAGE_U0 | _PAGE_U1 | _PAGE_U2 | _PAGE_U3)
+#define _PAGE_HSIZE_SHIFT	14
+
 /* "Higher level" linux bit combinations */
 #define _PAGE_EXEC		(_PAGE_BAP_SX | _PAGE_BAP_UX) /* .. and was cache cleaned */
 #define _PAGE_READ		(_PAGE_BAP_SR | _PAGE_BAP_UR) /* User read permission */
-- 
2.44.0

