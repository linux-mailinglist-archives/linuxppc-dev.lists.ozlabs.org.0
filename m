Return-Path: <linuxppc-dev+bounces-7531-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BCCA7FA65
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 11:54:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZX1d63MGkz30DL;
	Tue,  8 Apr 2025 19:54:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744106058;
	cv=none; b=f0rJ0NDI88xHxEvKHzi5o9281cefsYmMC2JV5fNNVMcB4nzeCCY3cQz8xWmkgYWH4qeeIGopK2YmSRV+2cKTPguyVIKpvfNH2ylEC/3uU5Ps59WnUql/OsShJJQNbzZA/ixm5jWKXUzELtseQgPFrMj4YzPDHx/KJSw1YhkQOFpN8Mn0sn+uboAxtucSBjMvgh5oUVAwgP3UHwrzTSmS8VOcJDuNu7mwcKhW3M3eQWU2hBcbVKx+6cdSBPs1gj1oHshfG8g22D/5kPBZmdBebg9pRNiwm6FE+g7xstqOut3I1VaoGv06339eLC+It74O4Rouzxc7Cs19Nv1Gw6bJCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744106058; c=relaxed/relaxed;
	bh=/BkpJ0cTKq4ChrXalGvhAQpS6e0Bp2XA+877e60Q9Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L57XzWwqntv76UV4QxIJ4kWrrEY56wdJ07ibM5JUV6btpRw6lxyjs7rqIRWMLvvfmMTtmzhz2qtaSX90wPw/+Or94ZkLJw4l23uvzIehsQCKNsJfQa1aN/6WQf6mJMuJIpfKztgillwJxgi0oZtr05eieIHGNtgC9YQsZ9czHuJ5t1MmINR1ea2shfsAHWpzAnQogvImPqqVl7XQDCiPHMEOIqYE/QopJ8AqUQ4X+XUkeaNcQ2K0+dtaqXFLc3ouhPMCvmDElx81j9Tc7Nna3XeZaESJIq57N1aIoLjvsbT3yj616GntOCgdJ9ba2AinbYMR3NaproYN051k4+QvmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZX1d55XhWz30Sv
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 19:54:17 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCE4822FC;
	Tue,  8 Apr 2025 02:53:34 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D5873F6A8;
	Tue,  8 Apr 2025 02:53:29 -0700 (PDT)
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
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 05/12] powerpc: mm: Call ctor/dtor for kernel PTEs
Date: Tue,  8 Apr 2025 10:52:15 +0100
Message-ID: <20250408095222.860601-6-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250408095222.860601-1-kevin.brodsky@arm.com>
References: <20250408095222.860601-1-kevin.brodsky@arm.com>
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

On powerpc, all functions related to PTE allocation are implemented
by common helpers, which are passed a boolean to differentiate user
from kernel pgtables. This patch aligns the powerpc implementation
with the generic one by calling pagetable_pte_[cd]tor()
unconditionally in those helpers.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/powerpc/mm/pgtable-frag.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
index 387e9b1fe12c..77e55eac16e4 100644
--- a/arch/powerpc/mm/pgtable-frag.c
+++ b/arch/powerpc/mm/pgtable-frag.c
@@ -56,19 +56,17 @@ static pte_t *__alloc_for_ptecache(struct mm_struct *mm, int kernel)
 {
 	void *ret = NULL;
 	struct ptdesc *ptdesc;
+	gfp_t gfp = PGALLOC_GFP;
 
-	if (!kernel) {
-		ptdesc = pagetable_alloc(PGALLOC_GFP | __GFP_ACCOUNT, 0);
-		if (!ptdesc)
-			return NULL;
-		if (!pagetable_pte_ctor(mm, ptdesc)) {
-			pagetable_free(ptdesc);
-			return NULL;
-		}
-	} else {
-		ptdesc = pagetable_alloc(PGALLOC_GFP, 0);
-		if (!ptdesc)
-			return NULL;
+	if (!kernel)
+		gfp |= __GFP_ACCOUNT;
+
+	ptdesc = pagetable_alloc(gfp, 0);
+	if (!ptdesc)
+		return NULL;
+	if (!pagetable_pte_ctor(mm, ptdesc)) {
+		pagetable_free(ptdesc);
+		return NULL;
 	}
 
 	atomic_set(&ptdesc->pt_frag_refcount, 1);
@@ -124,12 +122,10 @@ void pte_fragment_free(unsigned long *table, int kernel)
 
 	BUG_ON(atomic_read(&ptdesc->pt_frag_refcount) <= 0);
 	if (atomic_dec_and_test(&ptdesc->pt_frag_refcount)) {
-		if (kernel)
-			pagetable_free(ptdesc);
-		else if (folio_test_clear_active(ptdesc_folio(ptdesc)))
-			call_rcu(&ptdesc->pt_rcu_head, pte_free_now);
-		else
+		if (kernel || !folio_test_clear_active(ptdesc_folio(ptdesc)))
 			pte_free_now(&ptdesc->pt_rcu_head);
+		else
+			call_rcu(&ptdesc->pt_rcu_head, pte_free_now);
 	}
 }
 
-- 
2.47.0


