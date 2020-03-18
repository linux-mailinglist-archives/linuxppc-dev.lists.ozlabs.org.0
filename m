Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF0318A7CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 23:12:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jPRR2jygzDr6c
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 09:12:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.86; helo=userp2130.oracle.com;
 envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=aCjpfG1E; 
 dkim-atps=neutral
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jPKZ5440zDqxL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 09:07:29 +1100 (AEDT)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02ILwqsZ105111;
 Wed, 18 Mar 2020 22:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=2jUKc5AWshIbggpIaV0uhr89CLWRa57umVheK5ia+EQ=;
 b=aCjpfG1EeKBe9cvDOU86Ja2oNAqgJf0fuFQRgCPclczLITlyBtTkE4Uk7FynocmHnRBs
 tKb0mVsro0PIBBd2fw33XB6QS+WriqNFVFw1i8MNSXTCKQIL9uqwuTYxQLKKG+R7526F
 1ajqt8svvyjnGkvQMRUd+pneaiLQxjeVN4+4Fxe24Ov3cSjsFQnAjz8k9wv9gKWqfsyg
 4rNEp2+UcxZ1vmp/aW5ODLgLof+vZqVXLXqQ7hsF8XXiBqWK7i5EsaqWthmhBR/DVXD/
 U/pvgguvSBETzNLxd8yIvK7etPjWRBEDZDWhnBlpzvAkb3HBhFS00M9zgUuBRegUp9lG Kw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2yrpprd9kh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2020 22:06:50 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02ILwgXI142871;
 Wed, 18 Mar 2020 22:06:50 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2ys8rjkmaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2020 22:06:49 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02IM6m22003490;
 Wed, 18 Mar 2020 22:06:48 GMT
Received: from monkey.oracle.com (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 18 Mar 2020 15:06:47 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH 1/4] hugetlbfs: add arch_hugetlb_valid_size
Date: Wed, 18 Mar 2020 15:06:31 -0700
Message-Id: <20200318220634.32100-2-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200318220634.32100-1-mike.kravetz@oracle.com>
References: <20200318220634.32100-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9564
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 suspectscore=2
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003180094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9564
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 suspectscore=2 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003180094
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Longpeng <longpeng2@huawei.com>, Will Deacon <will@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The architecture independent routine hugetlb_default_setup sets up
the default huge pages size.  It has no way to verify if the passed
value is valid, so it accepts it and attempts to validate at a later
time.  This requires undocumented cooperation between the arch specific
and arch independent code.

For architectures that support more than one huge page size, provide
a routine arch_hugetlb_valid_size to validate a huge page size.
hugetlb_default_setup can use this to validate passed values.

arch_hugetlb_valid_size will also be used in a subsequent patch to
move processing of the "hugepagesz=" in arch specific code to a common
routine in arch independent code.

Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
---
 arch/arm64/include/asm/hugetlb.h   |  2 ++
 arch/arm64/mm/hugetlbpage.c        | 19 ++++++++++++++-----
 arch/powerpc/include/asm/hugetlb.h |  3 +++
 arch/powerpc/mm/hugetlbpage.c      | 20 +++++++++++++-------
 arch/riscv/include/asm/hugetlb.h   |  3 +++
 arch/riscv/mm/hugetlbpage.c        | 28 ++++++++++++++++++----------
 arch/s390/include/asm/hugetlb.h    |  3 +++
 arch/s390/mm/hugetlbpage.c         | 18 +++++++++++++-----
 arch/sparc/include/asm/hugetlb.h   |  3 +++
 arch/sparc/mm/init_64.c            | 23 ++++++++++++++++-------
 arch/x86/include/asm/hugetlb.h     |  3 +++
 arch/x86/mm/hugetlbpage.c          | 21 +++++++++++++++------
 include/linux/hugetlb.h            |  7 +++++++
 mm/hugetlb.c                       | 16 +++++++++++++---
 14 files changed, 126 insertions(+), 43 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index 2eb6c234d594..3248f35213ee 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -59,6 +59,8 @@ extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 extern void set_huge_swap_pte_at(struct mm_struct *mm, unsigned long addr,
 				 pte_t *ptep, pte_t pte, unsigned long sz);
 #define set_huge_swap_pte_at set_huge_swap_pte_at
+extern bool __init arch_hugetlb_valid_size(unsigned long long size);
+#define arch_hugetlb_valid_size arch_hugetlb_valid_size
 
 #include <asm-generic/hugetlb.h>
 
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index bbeb6a5a6ba6..da30127086d0 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -462,23 +462,32 @@ static int __init hugetlbpage_init(void)
 }
 arch_initcall(hugetlbpage_init);
 
-static __init int setup_hugepagesz(char *opt)
+bool __init arch_hugetlb_valid_size(unsigned long long size)
 {
-	unsigned long ps = memparse(opt, &opt);
-
-	switch (ps) {
+	switch (size) {
 #ifdef CONFIG_ARM64_4K_PAGES
 	case PUD_SIZE:
 #endif
 	case CONT_PMD_SIZE:
 	case PMD_SIZE:
 	case CONT_PTE_SIZE:
+		return true;
+	}
+
+	return false;
+}
+
+static __init int setup_hugepagesz(char *opt)
+{
+	unsigned long long ps = memparse(opt, &opt);
+
+	if arch_hugetlb_valid_size(ps)) {
 		add_huge_page_size(ps);
 		return 1;
 	}
 
 	hugetlb_bad_size();
-	pr_err("hugepagesz: Unsupported page size %lu K\n", ps >> 10);
+	pr_err("hugepagesz: Unsupported page size %llu K\n", ps >> 10);
 	return 0;
 }
 __setup("hugepagesz=", setup_hugepagesz);
diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index bd6504c28c2f..3b5939016955 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -64,6 +64,9 @@ static inline void arch_clear_hugepage_flags(struct page *page)
 {
 }
 
+#define arch_hugetlb_valid_size arch_hugetlb_valid_size
+extern bool __init arch_hugetlb_valid_size(unsigned long long size);
+
 #include <asm-generic/hugetlb.h>
 
 #else /* ! CONFIG_HUGETLB_PAGE */
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 33b3461d91e8..b78f660252f3 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -558,7 +558,7 @@ unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
 	return vma_kernel_pagesize(vma);
 }
 
-static int __init add_huge_page_size(unsigned long long size)
+bool __init arch_hugetlb_valid_size(unsigned long long size)
 {
 	int shift = __ffs(size);
 	int mmu_psize;
@@ -566,20 +566,26 @@ static int __init add_huge_page_size(unsigned long long size)
 	/* Check that it is a page size supported by the hardware and
 	 * that it fits within pagetable and slice limits. */
 	if (size <= PAGE_SIZE || !is_power_of_2(size))
-		return -EINVAL;
+		return false;
 
 	mmu_psize = check_and_get_huge_psize(shift);
 	if (mmu_psize < 0)
-		return -EINVAL;
+		return false;
 
 	BUG_ON(mmu_psize_defs[mmu_psize].shift != shift);
 
-	/* Return if huge page size has already been setup */
-	if (size_to_hstate(size))
-		return 0;
+	return true;
+}
 
-	hugetlb_add_hstate(shift - PAGE_SHIFT);
+static int __init add_huge_page_size(unsigned long long size)
+{
+	int shift = __ffs(size);
+
+	if (!arch_hugetlb_valid_size(size))
+		return -EINVAL;
 
+	if (!size_to_hstate(size))
+		hugetlb_add_hstate(shift - PAGE_SHIFT);
 	return 0;
 }
 
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index 728a5db66597..ebd6f5a35d26 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -5,6 +5,9 @@
 #include <asm-generic/hugetlb.h>
 #include <asm/page.h>
 
+extern bool __init arch_hugetlb_valid_size(unsigned long long size);
+#define arch_hugetlb_valid_size arch_hugetlb_valid_size
+
 static inline int is_hugepage_only_range(struct mm_struct *mm,
 					 unsigned long addr,
 					 unsigned long len) {
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index a6189ed36c5f..f1990882f16c 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -12,21 +12,29 @@ int pmd_huge(pmd_t pmd)
 	return pmd_leaf(pmd);
 }
 
+bool __init arch_hugetlb_valid_size(unsigned long long size)
+{
+	if (size == HPAGE_SIZE)
+		return true;
+	else if (IS_ENABLED(CONFIG_64BIT) && ps == PUD_SIZE)
+		retrurn true;
+	else
+		return false;
+}
+
 static __init int setup_hugepagesz(char *opt)
 {
-	unsigned long ps = memparse(opt, &opt);
+	unsigned long long ps = memparse(opt, &opt);
 
-	if (ps == HPAGE_SIZE) {
-		hugetlb_add_hstate(HPAGE_SHIFT - PAGE_SHIFT);
-	} else if (IS_ENABLED(CONFIG_64BIT) && ps == PUD_SIZE) {
-		hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
-	} else {
-		hugetlb_bad_size();
-		pr_err("hugepagesz: Unsupported page size %lu M\n", ps >> 20);
-		return 0;
+	if (arch_hugetlb_valid_size(ps)) {
+		hugetlb_add_hstate(ilog2(ps) - PAGE_SHIFT);
+		return 1;
 	}
 
-	return 1;
+	hugetlb_bad_size();
+	pr_err("hugepagesz: Unsupported page size %lu M\n", ps >> 20);
+	return 0;
+
 }
 __setup("hugepagesz=", setup_hugepagesz);
 
diff --git a/arch/s390/include/asm/hugetlb.h b/arch/s390/include/asm/hugetlb.h
index de8f0bf5f238..a3dd457d2167 100644
--- a/arch/s390/include/asm/hugetlb.h
+++ b/arch/s390/include/asm/hugetlb.h
@@ -15,6 +15,9 @@
 #define hugetlb_free_pgd_range			free_pgd_range
 #define hugepages_supported()			(MACHINE_HAS_EDAT1)
 
+extern bool __init arch_hugetlb_valid_size(unsigned long long size);
+#define arch_hugetlb_valid_size arch_hugetlb_valid_size
+
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 		     pte_t *ptep, pte_t pte);
 pte_t huge_ptep_get(pte_t *ptep);
diff --git a/arch/s390/mm/hugetlbpage.c b/arch/s390/mm/hugetlbpage.c
index 5674710a4841..d92e8c5c3e71 100644
--- a/arch/s390/mm/hugetlbpage.c
+++ b/arch/s390/mm/hugetlbpage.c
@@ -251,16 +251,24 @@ follow_huge_pud(struct mm_struct *mm, unsigned long address,
 	return pud_page(*pud) + ((address & ~PUD_MASK) >> PAGE_SHIFT);
 }
 
+bool __init arch_hugetlb_valid_size(unsigned long long size)
+{
+	if (MACHINE_HAS_EDAT1 && size == PMD_SIZE)
+		return true;
+	else if (MACHINE_HAS_EDAT2 && size == PUD_SIZE)
+		return true;
+	else
+		return false;
+}
+
 static __init int setup_hugepagesz(char *opt)
 {
-	unsigned long size;
+	unsigned long long size;
 	char *string = opt;
 
 	size = memparse(opt, &opt);
-	if (MACHINE_HAS_EDAT1 && size == PMD_SIZE) {
-		hugetlb_add_hstate(PMD_SHIFT - PAGE_SHIFT);
-	} else if (MACHINE_HAS_EDAT2 && size == PUD_SIZE) {
-		hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
+	if (arch_hugetlb_valid_size(size)) {
+		hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
 	} else {
 		hugetlb_bad_size();
 		pr_err("hugepagesz= specifies an unsupported page size %s\n",
diff --git a/arch/sparc/include/asm/hugetlb.h b/arch/sparc/include/asm/hugetlb.h
index 3963f80d1cb3..0d4f4adaffaf 100644
--- a/arch/sparc/include/asm/hugetlb.h
+++ b/arch/sparc/include/asm/hugetlb.h
@@ -10,6 +10,9 @@ struct pud_huge_patch_entry {
 	unsigned int insn;
 };
 extern struct pud_huge_patch_entry __pud_huge_patch, __pud_huge_patch_end;
+
+extern bool __init arch_hugetlb_valid_size(unsigned long long size);
+#define arch_hugetlb_valid_size arch_hugetlb_valid_size
 #endif
 
 #define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 1cf0d666dea3..4cc248817b19 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -360,17 +360,13 @@ static void __init pud_huge_patch(void)
 	__asm__ __volatile__("flush %0" : : "r" (addr));
 }
 
-static int __init setup_hugepagesz(char *string)
+bool __init arch_hugetlb_valid_size(unsigned long long size)
 {
-	unsigned long long hugepage_size;
-	unsigned int hugepage_shift;
+	unsigned int hugepage_shift = ilog2(size);
 	unsigned short hv_pgsz_idx;
 	unsigned int hv_pgsz_mask;
 	int rc = 0;
 
-	hugepage_size = memparse(string, &string);
-	hugepage_shift = ilog2(hugepage_size);
-
 	switch (hugepage_shift) {
 	case HPAGE_16GB_SHIFT:
 		hv_pgsz_mask = HV_PGSZ_MASK_16GB;
@@ -397,7 +393,20 @@ static int __init setup_hugepagesz(char *string)
 		hv_pgsz_mask = 0;
 	}
 
-	if ((hv_pgsz_mask & cpu_pgsz_mask) == 0U) {
+	if ((hv_pgsz_mask & cpu_pgsz_mask) == 0U)
+		return false;
+
+	return true;
+}
+
+static int __init setup_hugepagesz(char *string)
+{
+	unsigned long long hugepage_size;
+	int rc = 0;
+
+	hugepage_size = memparse(string, &string);
+
+	if (!arch_hugetlb_valid_size(hugepage_size)) {
 		hugetlb_bad_size();
 		pr_err("hugepagesz=%llu not supported by MMU.\n",
 			hugepage_size);
diff --git a/arch/x86/include/asm/hugetlb.h b/arch/x86/include/asm/hugetlb.h
index f65cfb48cfdd..8ed96e4010ec 100644
--- a/arch/x86/include/asm/hugetlb.h
+++ b/arch/x86/include/asm/hugetlb.h
@@ -7,6 +7,9 @@
 
 #define hugepages_supported() boot_cpu_has(X86_FEATURE_PSE)
 
+extern bool __init arch_hugetlb_valid_size(unsigned long long size);
+#define arch_hugetlb_valid_size arch_hugetlb_valid_size
+
 static inline int is_hugepage_only_range(struct mm_struct *mm,
 					 unsigned long addr,
 					 unsigned long len) {
diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
index 5bfd5aef5378..51e6208fdeec 100644
--- a/arch/x86/mm/hugetlbpage.c
+++ b/arch/x86/mm/hugetlbpage.c
@@ -181,16 +181,25 @@ hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 #endif /* CONFIG_HUGETLB_PAGE */
 
 #ifdef CONFIG_X86_64
+bool __init arch_hugetlb_valid_size(unsigned long long size)
+{
+	if (size == PMD_SIZE)
+		return true;
+	else if (size == PUD_SIZE && boot_cpu_has(X86_FEATURE_GBPAGES))
+		return true;
+	else
+		return false;
+}
+
 static __init int setup_hugepagesz(char *opt)
 {
-	unsigned long ps = memparse(opt, &opt);
-	if (ps == PMD_SIZE) {
-		hugetlb_add_hstate(PMD_SHIFT - PAGE_SHIFT);
-	} else if (ps == PUD_SIZE && boot_cpu_has(X86_FEATURE_GBPAGES)) {
-		hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
+	unsigned long long ps = memparse(opt, &opt);
+
+	if (arch_hugetlb_valid_size(ps)) {
+		hugetlb_add_hstate(ilog2(ps) - PAGE_SHIFT);
 	} else {
 		hugetlb_bad_size();
-		printk(KERN_ERR "hugepagesz: Unsupported page size %lu M\n",
+		printk(KERN_ERR "hugepagesz: Unsupported page size %llu M\n",
 			ps >> 20);
 		return 0;
 	}
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index b831e9fa1a26..33343eb980d0 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -678,6 +678,13 @@ static inline spinlock_t *huge_pte_lockptr(struct hstate *h,
 	return &mm->page_table_lock;
 }
 
+#ifndef arch_hugetlb_valid_size
+static inline bool arch_hugetlb_valid_size(unsigned long long size)
+{
+	return (size == HPAGE_SIZE);
+}
+#endif
+
 #ifndef hugepages_supported
 /*
  * Some platform decide whether they support huge pages at boot
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index d8ebd876871d..2f99359b93af 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3224,12 +3224,22 @@ static int __init hugetlb_nrpages_setup(char *s)
 }
 __setup("hugepages=", hugetlb_nrpages_setup);
 
-static int __init hugetlb_default_setup(char *s)
+static int __init default_hugepagesz_setup(char *s)
 {
-	default_hstate_size = memparse(s, &s);
+	unsigned long long size;
+	char *saved_s = s;
+
+	size = memparse(s, &s);
+
+	if (!arch_hugetlb_valid_size(size)) {
+		pr_err("HugeTLB: unsupported default_hugepagesz %s\n", saved_s);
+		return 0;
+	}
+
+	default_hstate_size = size;
 	return 1;
 }
-__setup("default_hugepagesz=", hugetlb_default_setup);
+__setup("default_hugepagesz=", default_hugepagesz_setup);
 
 static unsigned int cpuset_mems_nr(unsigned int *array)
 {
-- 
2.24.1

