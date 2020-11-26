Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBFE2C53F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 13:28:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChcVg5FkrzDqyX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 23:28:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=W1TFRVvd; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Chc7t6tLjzDrCt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 23:12:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
 Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To;
 bh=iHRAwfISjmDVO4YfqfbHVdJ2ZWVEpJxsSVYRxtpbcsQ=; b=W1TFRVvdOr3lqnjmu4Y3X0/O4K
 qyYaWMnTjj3afueuAAHp0gS8+bjPsQpM5E1cRwSPhxFOM9A7aRRXp3o/JnStAwU6vy0cCjiBykvRU
 XIUPUxUm0kXIjvuMDkam3L90Om+RBffrCXY7GSog/KMNwDJrXUqDE4A5uEWivj/m8Pt55wM+O6Ucn
 7IttdTgHVwb12drQItluBFvQoZCiqlxfscVXFv7LKvsuuX0L6/jWRDymIweOz7bphA9gBgIqMIFGK
 fzuo455MVRa9j9pCHxHKaNkANOgW+7Ls3HYw4Gwr9FKxPmgM+PZFQVBcfQnQna8YyJvchQM7+nFld
 sL82ZTCA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiG7b-0000OI-SD; Thu, 26 Nov 2020 12:11:36 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E009D3070F9;
 Thu, 26 Nov 2020 13:11:34 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id 05D712D167BEB; Thu, 26 Nov 2020 13:11:34 +0100 (CET)
Message-ID: <20201126121121.301768209@infradead.org>
User-Agent: quilt/0.66
Date: Thu, 26 Nov 2020 13:01:19 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kan.liang@linux.intel.com, mingo@kernel.org, acme@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@redhat.com,
 eranian@google.com
Subject: [PATCH v2 5/6] sparc64/mm: Implement pXX_leaf_size() support
References: <20201126120114.071913521@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arch@vger.kernel.org, ak@linux.intel.com, catalin.marinas@arm.com,
 peterz@infradead.org, linuxppc-dev@lists.ozlabs.org, willy@infradead.org,
 linux-kernel@vger.kernel.org, dave.hansen@intel.com, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com, sparclinux@vger.kernel.org, will@kernel.org,
 davem@davemloft.net, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sparc64 has non-pagetable aligned large page support; wire up the
pXX_leaf_size() functions to report the correct pagetable page size.

This enables PERF_SAMPLE_{DATA,CODE}_PAGE_SIZE to report accurate
pagetable leaf sizes.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/sparc/include/asm/pgtable_64.h |   13 +++++++++++++
 arch/sparc/mm/hugetlbpage.c         |   19 +++++++++++++------
 2 files changed, 26 insertions(+), 6 deletions(-)

--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -1121,6 +1121,19 @@ extern unsigned long cmdline_memory_size
 
 asmlinkage void do_sparc64_fault(struct pt_regs *regs);
 
+#ifdef CONFIG_HUGETLB_PAGE
+
+#define pud_leaf_size pud_leaf_size
+extern unsigned long pud_leaf_size(pud_t pud);
+
+#define pmd_leaf_size pmd_leaf_size
+extern unsigned long pmd_leaf_size(pmd_t pmd);
+
+#define pte_leaf_size pte_leaf_size
+extern unsigned long pte_leaf_size(pte_t pte);
+
+#endif /* CONFIG_HUGETLB_PAGE */
+
 #endif /* !(__ASSEMBLY__) */
 
 #endif /* !(_SPARC64_PGTABLE_H) */
--- a/arch/sparc/mm/hugetlbpage.c
+++ b/arch/sparc/mm/hugetlbpage.c
@@ -247,14 +247,17 @@ static unsigned int sun4u_huge_tte_to_sh
 	return shift;
 }
 
-static unsigned int huge_tte_to_shift(pte_t entry)
+static unsigned long tte_to_shift(pte_t entry)
 {
-	unsigned long shift;
-
 	if (tlb_type == hypervisor)
-		shift = sun4v_huge_tte_to_shift(entry);
-	else
-		shift = sun4u_huge_tte_to_shift(entry);
+		return sun4v_huge_tte_to_shift(entry);
+
+	return sun4u_huge_tte_to_shift(entry);
+}
+
+static unsigned int huge_tte_to_shift(pte_t entry)
+{
+	unsigned long shift = tte_to_shift(entry);
 
 	if (shift == PAGE_SHIFT)
 		WARN_ONCE(1, "tto_to_shift: invalid hugepage tte=0x%lx\n",
@@ -272,6 +275,10 @@ static unsigned long huge_tte_to_size(pt
 	return size;
 }
 
+unsigned long pud_leaf_size(pud_t pud) { return 1UL << tte_to_shift((pte_t)pud); }
+unsigned long pmd_leaf_size(pmd_t pmd) { return 1UL << tte_to_shift((pte_t)pmd); }
+unsigned long pte_leaf_size(pte_t pte) { return 1UL << tte_to_shift((pte_t)pte); }
+
 pte_t *huge_pte_alloc(struct mm_struct *mm,
 			unsigned long addr, unsigned long sz)
 {


