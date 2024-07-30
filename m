Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5C2940F5A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 12:31:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J/Njo24p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYBMz1zNyz3cYr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 20:31:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J/Njo24p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=alexs@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WY5LJ18njz3cZ9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 16:44:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F6ED61DB0;
	Tue, 30 Jul 2024 06:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20371C4AF09;
	Tue, 30 Jul 2024 06:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722321862;
	bh=G//eVJ9Nw8aOOKl2d7JUp/+QzzL5npEnufgRCiBDKNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J/Njo24pZ085kd/eT/gy5nmywtW77TTpW3xwRWYKhIkRHK+lzJdbLggDAN6TpyGvN
	 rW07M9G7E1rNbOiK/BYavaoAKy5hQTRctqPFFo3zD8RaDkoOT734VNnkfzYGuRTgPr
	 7lKhNURsW3JqfLiFVe6G4I5vB1kH5jyn1aLmIMd7FJoJlqMApaFJRvyhUsEwo7ZIpN
	 7RM5QFW8/cV4jRPKXNJ+uwP9fbxQTUYzoz9IEwP+GKQXDzHKvni3jbtRsnh4VwsG8Q
	 iDZw7zJUhoXwEXAb/FQFLoYiOb7hjhzSksX+Dz2XjNV5rBm5sV5pprZ9SrmxaTGPRh
	 KrVL8p90HnjKQ==
From: alexs@kernel.org
To: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Brian Cain <bcain@quicinc.com>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Bibo Mao <maobibo@loongson.cn>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Vishal Moola <vishal.moola@gmail.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Lance Yang <ioworker0@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Barry Song <baohua@kernel.org>,
	linux-s390@vger.kernel.org
Subject: [RFC PATCH 07/18] mm/thp: use ptdesc in copy_huge_pmd
Date: Tue, 30 Jul 2024 14:47:01 +0800
Message-ID: <20240730064712.3714387-8-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730064712.3714387-1-alexs@kernel.org>
References: <20240730064712.3714387-1-alexs@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 30 Jul 2024 20:25:54 +1000
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
Cc: Ryan Roberts <ryan.roberts@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Alex Shi <alexs@kernel.org>, David Hildenbrand <david@redhat.com>, Anup Patel <anup@brainfault.org>, Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Matthew Wilcox <willy@infradead.org>, Jisheng Zhang <jszhang@kernel.org>, Breno Leitao <leitao@debian.org>, Guo Ren <guoren@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alex Shi <alexs@kernel.org>

Since we have ptdesc struct now, better to use replace pgtable_t, aka
'struct page *'. It's alaos a preparation for return ptdesc pointer
in pte_alloc_one series function.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 mm/huge_memory.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index a331d4504d52..236e1582d97e 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1369,15 +1369,15 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	struct page *src_page;
 	struct folio *src_folio;
 	pmd_t pmd;
-	pgtable_t pgtable = NULL;
+	struct ptdesc *ptdesc = NULL;
 	int ret = -ENOMEM;
 
 	/* Skip if can be re-fill on fault */
 	if (!vma_is_anonymous(dst_vma))
 		return 0;
 
-	pgtable = pte_alloc_one(dst_mm);
-	if (unlikely(!pgtable))
+	ptdesc = page_ptdesc(pte_alloc_one(dst_mm));
+	if (unlikely(!ptdesc))
 		goto out;
 
 	dst_ptl = pmd_lock(dst_mm, dst_pmd);
@@ -1404,7 +1404,7 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		}
 		add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
 		mm_inc_nr_ptes(dst_mm);
-		pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
+		pgtable_trans_huge_deposit(dst_mm, dst_pmd, ptdesc_page(ptdesc));
 		if (!userfaultfd_wp(dst_vma))
 			pmd = pmd_swp_clear_uffd_wp(pmd);
 		set_pmd_at(dst_mm, addr, dst_pmd, pmd);
@@ -1414,7 +1414,7 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 #endif
 
 	if (unlikely(!pmd_trans_huge(pmd))) {
-		pte_free(dst_mm, pgtable);
+		pte_free(dst_mm, ptdesc_page(ptdesc));
 		goto out_unlock;
 	}
 	/*
@@ -1440,7 +1440,7 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	if (unlikely(folio_try_dup_anon_rmap_pmd(src_folio, src_page, src_vma))) {
 		/* Page maybe pinned: split and retry the fault on PTEs. */
 		folio_put(src_folio);
-		pte_free(dst_mm, pgtable);
+		pte_free(dst_mm, ptdesc_page(ptdesc));
 		spin_unlock(src_ptl);
 		spin_unlock(dst_ptl);
 		__split_huge_pmd(src_vma, src_pmd, addr, false, NULL);
@@ -1449,7 +1449,7 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
 out_zero_page:
 	mm_inc_nr_ptes(dst_mm);
-	pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
+	pgtable_trans_huge_deposit(dst_mm, dst_pmd, ptdesc_page(ptdesc));
 	pmdp_set_wrprotect(src_mm, addr, src_pmd);
 	if (!userfaultfd_wp(dst_vma))
 		pmd = pmd_clear_uffd_wp(pmd);
-- 
2.43.0

