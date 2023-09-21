Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C86E7AAB13
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 09:59:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsPnP25kCz3fbZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 17:59:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs16y3WKVz3c9n
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 02:28:41 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75302175A;
	Thu, 21 Sep 2023 09:21:19 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09E233F59C;
	Thu, 21 Sep 2023 09:20:37 -0700 (PDT)
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
Subject: [PATCH v1 4/8] s390: hugetlb: Convert set_huge_pte_at() to take vma
Date: Thu, 21 Sep 2023 17:20:03 +0100
Message-Id: <20230921162007.1630149-5-ryan.roberts@arm.com>
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

This commit makes the required s390 modifications. Separate commits
update the other arches and core code, before the actual bug is fixed in
arm64.

No behavioral changes intended.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/s390/include/asm/hugetlb.h | 8 +++++---
 arch/s390/mm/hugetlbpage.c      | 8 +++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/s390/include/asm/hugetlb.h b/arch/s390/include/asm/hugetlb.h
index f07267875a19..da7f43b1871f 100644
--- a/arch/s390/include/asm/hugetlb.h
+++ b/arch/s390/include/asm/hugetlb.h
@@ -15,7 +15,9 @@
 #define hugetlb_free_pgd_range			free_pgd_range
 #define hugepages_supported()			(MACHINE_HAS_EDAT1)
 
-void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+void set_huge_pte_at(struct vm_area_struct *vma, unsigned long addr,
+		     pte_t *ptep, pte_t pte);
+void __set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 		     pte_t *ptep, pte_t pte);
 pte_t huge_ptep_get(pte_t *ptep);
 pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
@@ -65,7 +67,7 @@ static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	int changed = !pte_same(huge_ptep_get(ptep), pte);
 	if (changed) {
 		huge_ptep_get_and_clear(vma->vm_mm, addr, ptep);
-		set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
+		__set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
 	}
 	return changed;
 }
@@ -74,7 +76,7 @@ static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
 					   unsigned long addr, pte_t *ptep)
 {
 	pte_t pte = huge_ptep_get_and_clear(mm, addr, ptep);
-	set_huge_pte_at(mm, addr, ptep, pte_wrprotect(pte));
+	__set_huge_pte_at(mm, addr, ptep, pte_wrprotect(pte));
 }
 
 static inline pte_t mk_huge_pte(struct page *page, pgprot_t pgprot)
diff --git a/arch/s390/mm/hugetlbpage.c b/arch/s390/mm/hugetlbpage.c
index c718f2a0de94..d69e2dc6e508 100644
--- a/arch/s390/mm/hugetlbpage.c
+++ b/arch/s390/mm/hugetlbpage.c
@@ -142,7 +142,7 @@ static void clear_huge_pte_skeys(struct mm_struct *mm, unsigned long rste)
 		__storage_key_init_range(paddr, paddr + size - 1);
 }
 
-void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+void __set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 		     pte_t *ptep, pte_t pte)
 {
 	unsigned long rste;
@@ -163,6 +163,12 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 	set_pte(ptep, __pte(rste));
 }
 
+void set_huge_pte_at(struct vm_area_struct *vma, unsigned long addr,
+		     pte_t *ptep, pte_t pte)
+{
+	__set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
+}
+
 pte_t huge_ptep_get(pte_t *ptep)
 {
 	return __rste_to_pte(pte_val(*ptep));
-- 
2.25.1

