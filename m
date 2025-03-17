Return-Path: <linuxppc-dev+bounces-7139-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C14A65300
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 15:22:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGccX4nx1z2yqd;
	Tue, 18 Mar 2025 01:22:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742221340;
	cv=none; b=nAFMR+JIZ5Umh1Aqe02FzoXdgV00mhHKUl2iyddusu6IfexqTdRje6/126WKQoRSnMu8vl962uj4mOI2L2yhenoBFsTR1FaCMS5AzFeNT9/q785jCGFEppBSJvOdmd7a9pb6WAF3opyhNNgYD2XP/lsLwGTus/zRcz8h/umC5wQo3ip29nf33cvsARwsv5tDzKJ0AyhJgfPpROJB20wgOuFzF0NGOnni4miUjKnqgvhLRKuJEdp7RJkVWII5cXJ6lUpyTy03015OMnxDw8sRXJzkfbxbhqTmXc7LlS2NJZp2M4ImnfS/Zf0uhQIFVYMhIBltcffO3MhieubtE9sZjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742221340; c=relaxed/relaxed;
	bh=/BkpJ0cTKq4ChrXalGvhAQpS6e0Bp2XA+877e60Q9Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lue5esNc77TtOOyjkG7DnKaobOy7jVjvgc+su6xUdEVmW0V2lOULdS+Tr2ZEtgytrsJstbqhDXBN2zIuX3tKJYyKqPYhI+LgzjcEEqvNCj78she3vJapkTfRocylz8vLUSl4Pb48mx10i2pgs6wwoABEPitZeytnh+8VSrm17U5m5CTtNeZNgVeJOBCLdZ1EkEUkHtFLK6cuNURNmzCyUdVKfrDbIZyrd4aHjptiVKqPyyH80T3CBIfd1CFRVwS4rAvAfPAdj9xB9aIAPfUA3yQ5Y+8GdFK5jig8ey6meCOdHwl0l1Di1TG+m0FrW8XVKdk2yK5r76FncXx/lGqr8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGccW6Y4Qz2ySB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 01:22:19 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 005532576;
	Mon, 17 Mar 2025 07:21:58 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC9AA3F63F;
	Mon, 17 Mar 2025 07:21:44 -0700 (PDT)
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
Subject: [PATCH 04/11] powerpc: mm: Call ctor/dtor for kernel PTEs
Date: Mon, 17 Mar 2025 14:16:53 +0000
Message-ID: <20250317141700.3701581-5-kevin.brodsky@arm.com>
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


