Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2CE940F31
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 12:27:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EMNS+x8H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYBHJ6QN2z3cCb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 20:27:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EMNS+x8H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=alexs@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WY5Jl2wy0z3cCb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 16:43:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 87D5DCE0E11;
	Tue, 30 Jul 2024 06:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7E2C4AF10;
	Tue, 30 Jul 2024 06:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722321779;
	bh=gTArplwlUTbTCuHNeuVct9T0SiQYRSRnIpLhqPQ+rcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EMNS+x8HI+8Q08E7NcZ4WD5BkiWh9xAxJgNUSeEC7wUsbadoC1FFu91tQMZE7Hy2S
	 IUmoRLjOcThG09j1Sqjri8IS5v5L/GqTmjdQarB0bmky4bNiqAj/NZnJ7JFHJeD8eM
	 xp4GUDXu8Pgl+WLlnMHA4AQrs4fRuuLAioV9xJyUj3Qfg+O5uVNHyjdnKujlXeeMze
	 y4pE/ENss3Y27SBqOaPJvTM3lQjwDoA5fmkCORb6Q7jSG49BTJJjCdSyOBxPURAgT7
	 N7ujc9Lmfynti/YNZ3I4QClP7CXUI+TSJh/h+u7SmrhYbHOtbMTzdHI4QxlG3cF9IU
	 WbYLxc+yhe31Q==
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
Subject: [RFC PATCH 01/18] mm/pgtable: use ptdesc in pte_free_now/pte_free_defer
Date: Tue, 30 Jul 2024 14:46:55 +0800
Message-ID: <20240730064712.3714387-2-alexs@kernel.org>
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

page table descriptor is splited from struct page, use it to replace struct
page in right place.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox  <willy@infradead.org>
Cc: David Hildenbrand <david@redhat.com>
---
 mm/pgtable-generic.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 13a7705df3f8..2ce714f1dd15 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -238,18 +238,17 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long address,
 #ifndef pte_free_defer
 static void pte_free_now(struct rcu_head *head)
 {
-	struct page *page;
+	struct ptdesc *ptdesc;
 
-	page = container_of(head, struct page, rcu_head);
-	pte_free(NULL /* mm not passed and not used */, (pgtable_t)page);
+	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
+	pte_free(NULL /* mm not passed and not used */, (pgtable_t)ptdesc);
 }
 
 void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
 {
-	struct page *page;
+	struct ptdesc *ptdesc = page_ptdesc(pgtable);
 
-	page = pgtable;
-	call_rcu(&page->rcu_head, pte_free_now);
+	call_rcu(&ptdesc->pt_rcu_head, pte_free_now);
 }
 #endif /* pte_free_defer */
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
@@ -330,7 +329,7 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
  * kmapped if necessary (when CONFIG_HIGHPTE), and locked against concurrent
  * modification by software, with a pointer to that spinlock in ptlp (in some
  * configs mm->page_table_lock, in SPLIT_PTLOCK configs a spinlock in table's
- * struct page).  pte_unmap_unlock(pte, ptl) to unlock and unmap afterwards.
+ * struct ptdesc).  pte_unmap_unlock(pte, ptl) to unlock and unmap afterwards.
  *
  * But it is unsuccessful, returning NULL with *ptlp unchanged, if there is no
  * page table at *pmd: if, for example, the page table has just been removed,
-- 
2.43.0

