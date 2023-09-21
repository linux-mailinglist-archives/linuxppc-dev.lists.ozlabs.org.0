Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 449AB7AAB2B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 10:00:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsPnx0x4dz3ffN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 18:00:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs16y3Wrcz3cBx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 02:28:41 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F07FB175D;
	Thu, 21 Sep 2023 09:21:23 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84F093F59C;
	Thu, 21 Sep 2023 09:20:42 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Peter Xu <peterx@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v1 5/8] sparc: hugetlb: Convert set_huge_pte_at() to take vma
Date: Thu, 21 Sep 2023 17:20:04 +0100
Message-Id: <20230921162007.1630149-6-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921162007.1630149-1-ryan.roberts@arm.com>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Sep 2023 17:56:48 +1000
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
Cc: linux-s390@vger.kernel.org, Ryan Roberts <ryan.roberts@arm.com>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to fix a bug, arm64 needs access to the vma inside it's
implementation of set_huge_pte_at(). Provide for this by converting the
mm parameter to be a vma. Any implementations that require the mm can
access it via vma->vm_mm.

This commit makes the required sparc modifications. Separate commits
update the other arches and core code, before the actual bug is fixed in
arm64.

No behavioral changes intended.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/sparc/include/asm/hugetlb.h | 8 +++++---
 arch/sparc/mm/hugetlbpage.c      | 8 +++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/sparc/include/asm/hugetlb.h b/arch/sparc/include/asm/hugetlb.h
index 0a26cca24232..14a71b735bb8 100644
--- a/arch/sparc/include/asm/hugetlb.h
+++ b/arch/sparc/include/asm/hugetlb.h
@@ -13,7 +13,9 @@ extern struct pud_huge_patch_entry __pud_huge_patch, __pud_huge_patch_end;
 #endif
 
 #define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
-void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+void set_huge_pte_at(struct vm_area_struct *vma, unsigned long addr,
+		     pte_t *ptep, pte_t pte);
+void __set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 		     pte_t *ptep, pte_t pte);
 
 #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
@@ -32,7 +34,7 @@ static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
 					   unsigned long addr, pte_t *ptep)
 {
 	pte_t old_pte = *ptep;
-	set_huge_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
+	__set_huge_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
 }
 
 #define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
@@ -42,7 +44,7 @@ static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 {
 	int changed = !pte_same(*ptep, pte);
 	if (changed) {
-		set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
+		__set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
 		flush_tlb_page(vma, addr);
 	}
 	return changed;
diff --git a/arch/sparc/mm/hugetlbpage.c b/arch/sparc/mm/hugetlbpage.c
index d7018823206c..05267b72103f 100644
--- a/arch/sparc/mm/hugetlbpage.c
+++ b/arch/sparc/mm/hugetlbpage.c
@@ -328,7 +328,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 	return pte_offset_huge(pmd, addr);
 }
 
-void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+void __set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 		     pte_t *ptep, pte_t entry)
 {
 	unsigned int nptes, orig_shift, shift;
@@ -364,6 +364,12 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 				    orig_shift);
 }
 
+void set_huge_pte_at(struct vm_area_struct *vma, unsigned long addr,
+		     pte_t *ptep, pte_t entry)
+{
+	__set_huge_pte_at(vma->vm_mm, addr, ptep, entry);
+}
+
 pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 			      pte_t *ptep)
 {
-- 
2.25.1

