Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8085E1F9857
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 15:23:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lsVM2rVvzDqYK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 23:23:55 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lrwY36ZbzDqLx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 22:58:02 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49lrwQ0wthz9v1fl;
 Mon, 15 Jun 2020 14:57:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id aXFx7kJdYhJB; Mon, 15 Jun 2020 14:57:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49lrwQ06Xvz9v1fM;
 Mon, 15 Jun 2020 14:57:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 77D768B796;
 Mon, 15 Jun 2020 14:57:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 25kJTR5Pyx86; Mon, 15 Jun 2020 14:57:58 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.104])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3308A8B75F;
 Mon, 15 Jun 2020 14:57:58 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 2DB5265B0E; Mon, 15 Jun 2020 12:57:58 +0000 (UTC)
Message-Id: <087fa12b6e920e32315136b998aa834f99242695.1592225558.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1592225557.git.christophe.leroy@csgroup.eu>
References: <cover.1592225557.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/3] mm: Allow arches to provide ptep_get()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Date: Mon, 15 Jun 2020 12:57:58 +0000 (UTC)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 2ab3a0a02905 ("READ_ONCE: Enforce atomicity for
{READ,WRITE}_ONCE() memory accesses"), it is not possible anymore
to use READ_ONCE() to access complex page table entries like
the one defined for powerpc 8xx with 16k size pages.

Define a ptep_get() helper that architectures can override instead
of performing a READ_ONCE() on the page table entry pointer.

Fixes: 2ab3a0a02905 ("READ_ONCE: Enforce atomicity for {READ,WRITE}_ONCE() memory accesses")
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 include/asm-generic/hugetlb.h | 2 +-
 include/linux/pgtable.h       | 7 +++++++
 mm/gup.c                      | 2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/hugetlb.h b/include/asm-generic/hugetlb.h
index 40f85decc2ee..8e1e6244a89d 100644
--- a/include/asm-generic/hugetlb.h
+++ b/include/asm-generic/hugetlb.h
@@ -122,7 +122,7 @@ static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 #ifndef __HAVE_ARCH_HUGE_PTEP_GET
 static inline pte_t huge_ptep_get(pte_t *ptep)
 {
-	return READ_ONCE(*ptep);
+	return ptep_get(ptep);
 }
 #endif
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 32b6c52d41b9..56c1e8eb7bb0 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -249,6 +249,13 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 }
 #endif
 
+#ifndef __HAVE_ARCH_PTEP_GET
+static inline pte_t ptep_get(pte_t *ptep)
+{
+	return READ_ONCE(*ptep);
+}
+#endif
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #ifndef __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR
 static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
diff --git a/mm/gup.c b/mm/gup.c
index 761df4944ef5..6f47697f8fb0 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2196,7 +2196,7 @@ static inline pte_t gup_get_pte(pte_t *ptep)
  */
 static inline pte_t gup_get_pte(pte_t *ptep)
 {
-	return READ_ONCE(*ptep);
+	return ptep_get(ptep);
 }
 #endif /* CONFIG_GUP_GET_PTE_LOW_HIGH */
 
-- 
2.25.0

