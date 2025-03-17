Return-Path: <linuxppc-dev+bounces-7142-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E993A6530B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 15:23:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGcct6t3cz2ySB;
	Tue, 18 Mar 2025 01:22:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742221358;
	cv=none; b=Gq+6uZQY965b1qgvUaS/kE3zVKoDQGQl1/QVbSVfvwp0IXoHG0dLllDw8HbId8xGlg3qYdsWoMCaWEdWzJOBCf8YWz0Ju6N/bkaLmy/Y/BFU3NcGYHgX8bJHbfaFb4Yf0ROnal8ys8A6ZecI6J3SlTCQVMdmPGYZ2Sgs0JnfKMqzN0OVA8IZvNTAbx1Ji+Dy/K5Syk1noOgVJJCc8Hu6VX85i7lJ1ncUEGrcrGL0aDpyA0+NGwdvEzgTKGCswXMMnF88RLxGF5JBG475tf1+iQ0rwU8c9PLvpAXBJdUoyS3GqGL0jhlNAVZZTADO6Cb5Ngh03ONVObT651bQVaCF1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742221358; c=relaxed/relaxed;
	bh=o+UbYltWTL9nsXjK30sfubrpExxRG1UfppgmpoTi2qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBw4r0btB/5+epr74OitdYfik89IhQxYdR90/KprI1vu79GXJ92vDxWgjHhTZ+KfVLxl0IRc8pzEA+SeCZC2H1MSNGLRoB4XWXl2bjNyO+DGklhH0lZNna8l0EuB12WonGtUFo9zQubO3uszZeTmzer44XH8lp+T+dlcbpopJdLc0wh93bTF3CtZB4pIoqfe3D9jljxOuAy2ZDSTLx9KjlJMlFom2FXHroeJuv9908u6n1PwpzgWnYpyaCuVX/QfXR5dI4O00kT/tbki6MY6b0BR6IrV1a6LInLQhRlVMjETxOUjJg7gIMg7orIDlSPybMH+bTCPJ0+gCsnAiQux5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGcct3QZDz2yr8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 01:22:38 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C87A25DC;
	Mon, 17 Mar 2025 07:22:02 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64BEE3F63F;
	Mon, 17 Mar 2025 07:21:49 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org
Subject: [PATCH 05/11] sparc64: mm: Call ctor/dtor for kernel PTEs
Date: Mon, 17 Mar 2025 14:16:54 +0000
Message-ID: <20250317141700.3701581-6-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250317141700.3701581-1-kevin.brodsky@arm.com>
References: <20250317141700.3701581-1-kevin.brodsky@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The generic implementation of pte_{alloc_one,free}_kernel now calls
the [cd]tor, without initialising the ptlock needlessly as
pagetable_pte_ctor() skips it for init_mm.

Align sparc64 with the generic implementation by ensuring
pagetable_pte_[cd]tor() are called for kernel PTEs. As a result
the kernel and user alloc/free functions have the same
implementation, and since pgtable_t is defined as pte_t *, we can
have both call a common helper.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/sparc/mm/init_64.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index cd60a0a8ca0e..0a1b2b1adad4 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2882,18 +2882,7 @@ void __flush_tlb_all(void)
 			     : : "r" (pstate));
 }
 
-pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
-{
-	struct page *page = alloc_page(GFP_KERNEL | __GFP_ZERO);
-	pte_t *pte = NULL;
-
-	if (page)
-		pte = (pte_t *) page_address(page);
-
-	return pte;
-}
-
-pgtable_t pte_alloc_one(struct mm_struct *mm)
+static pte_t *__pte_alloc_one(struct mm_struct *mm)
 {
 	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL | __GFP_ZERO, 0);
 
@@ -2906,9 +2895,14 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
 	return ptdesc_address(ptdesc);
 }
 
-void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
+pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 {
-	free_page((unsigned long)pte);
+	return __pte_alloc_one(mm);
+}
+
+pgtable_t pte_alloc_one(struct mm_struct *mm)
+{
+	return __pte_alloc_one(mm);
 }
 
 static void __pte_free(pgtable_t pte)
@@ -2919,6 +2913,11 @@ static void __pte_free(pgtable_t pte)
 	pagetable_free(ptdesc);
 }
 
+void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
+{
+	__pte_free(pte);
+}
+
 void pte_free(struct mm_struct *mm, pgtable_t pte)
 {
 	__pte_free(pte);
-- 
2.47.0


