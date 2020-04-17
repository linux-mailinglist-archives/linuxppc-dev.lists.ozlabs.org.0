Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A5B1AE55A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 20:59:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493lkB0WmVzDsJQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 04:58:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=l6QC2Frv; 
 dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493lZG2MSMzDqtK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Apr 2020 04:52:05 +1000 (AEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03HIox8h151271;
 Fri, 17 Apr 2020 18:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=JcTpHh1BSdOMPj2xVpWa05cMngN2al4EtuO1ITOii3M=;
 b=l6QC2FrvquwrqSWiQjOz1RL3lgaNwogQ1wNAu2zqFed1FIYfWGs9ApsGIolJEoKlhYI3
 KANwDzFTUKoziDHM1HQi+B0NAZimTGi6pMJC09L+DuOfEFbjp63Di8LTN680uD2Tx4Yg
 0QuJepCSDnjW8fXZMbfx8N1HvDnaIDkJPPcWWkWDdUr4ToaL82YgZyfzSHQXNo34o4xQ
 ATgmT6qg8mU8hfwHXbEe51my1Ab53Eo9vL67XsnSPQD73vC67CkcSUPIPuV/j+SBPCs2
 W/T7CAyUdW9Js0orZFEJjPA6ZbA+lAdnOXJLhse3bXDIeLNWRSozr/DNlVzdh/tNs11g zQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 30dn960r7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Apr 2020 18:51:10 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03HIbLPr095614;
 Fri, 17 Apr 2020 18:51:09 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 30emerj3e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Apr 2020 18:51:09 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03HIox04025273;
 Fri, 17 Apr 2020 18:50:59 GMT
Received: from monkey.oracle.com (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 17 Apr 2020 11:50:59 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v3 1/4] hugetlbfs: add arch_hugetlb_valid_size
Date: Fri, 17 Apr 2020 11:50:46 -0700
Message-Id: <20200417185049.275845-2-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200417185049.275845-1-mike.kravetz@oracle.com>
References: <20200417185049.275845-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9594
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004170142
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9594
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1011
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004170142
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Peter Xu <peterx@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Will Deacon <will@kernel.org>,
 Mina Almasry <almasrymina@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Longpeng <longpeng2@huawei.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Nitesh Narayan Lal <nitesh@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
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
 arch/arm64/mm/hugetlbpage.c   | 17 +++++++++++++----
 arch/powerpc/mm/hugetlbpage.c | 20 +++++++++++++-------
 arch/riscv/mm/hugetlbpage.c   | 26 +++++++++++++++++---------
 arch/s390/mm/hugetlbpage.c    | 16 ++++++++++++----
 arch/sparc/mm/init_64.c       | 24 ++++++++++++++++--------
 arch/x86/mm/hugetlbpage.c     | 17 +++++++++++++----
 include/linux/hugetlb.h       |  1 +
 mm/hugetlb.c                  | 21 ++++++++++++++++++---
 8 files changed, 103 insertions(+), 39 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index bbeb6a5a6ba6..069b96ee2aec 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -462,17 +462,26 @@ static int __init hugetlbpage_init(void)
 }
 arch_initcall(hugetlbpage_init);
 
-static __init int setup_hugepagesz(char *opt)
+bool __init arch_hugetlb_valid_size(unsigned long size)
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
+	unsigned long ps = memparse(opt, &opt);
+
+	if (arch_hugetlb_valid_size(ps)) {
 		add_huge_page_size(ps);
 		return 1;
 	}
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 33b3461d91e8..de54d2a37830 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -558,7 +558,7 @@ unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
 	return vma_kernel_pagesize(vma);
 }
 
-static int __init add_huge_page_size(unsigned long long size)
+bool __init arch_hugetlb_valid_size(unsigned long size)
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
+	if (!arch_hugetlb_valid_size((unsigned long)size))
+		return -EINVAL;
 
+	if (!size_to_hstate(size))
+		hugetlb_add_hstate(shift - PAGE_SHIFT);
 	return 0;
 }
 
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index a6189ed36c5f..da1f516bc451 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -12,21 +12,29 @@ int pmd_huge(pmd_t pmd)
 	return pmd_leaf(pmd);
 }
 
+bool __init arch_hugetlb_valid_size(unsigned long size)
+{
+	if (size == HPAGE_SIZE)
+		return true;
+	else if (IS_ENABLED(CONFIG_64BIT) && size == PUD_SIZE)
+		return true;
+	else
+		return false;
+}
+
 static __init int setup_hugepagesz(char *opt)
 {
 	unsigned long ps = memparse(opt, &opt);
 
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
 
diff --git a/arch/s390/mm/hugetlbpage.c b/arch/s390/mm/hugetlbpage.c
index f01daddcbc5e..ac25b207624c 100644
--- a/arch/s390/mm/hugetlbpage.c
+++ b/arch/s390/mm/hugetlbpage.c
@@ -251,16 +251,24 @@ follow_huge_pud(struct mm_struct *mm, unsigned long address,
 	return pud_page(*pud) + ((address & ~PUD_MASK) >> PAGE_SHIFT);
 }
 
+bool __init arch_hugetlb_valid_size(unsigned long size)
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
 	unsigned long size;
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
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 1cf0d666dea3..2bfe8e22b706 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -360,16 +360,11 @@ static void __init pud_huge_patch(void)
 	__asm__ __volatile__("flush %0" : : "r" (addr));
 }
 
-static int __init setup_hugepagesz(char *string)
+bool __init arch_hugetlb_valid_size(unsigned long size)
 {
-	unsigned long long hugepage_size;
-	unsigned int hugepage_shift;
+	unsigned int hugepage_shift = ilog2(size);
 	unsigned short hv_pgsz_idx;
 	unsigned int hv_pgsz_mask;
-	int rc = 0;
-
-	hugepage_size = memparse(string, &string);
-	hugepage_shift = ilog2(hugepage_size);
 
 	switch (hugepage_shift) {
 	case HPAGE_16GB_SHIFT:
@@ -397,7 +392,20 @@ static int __init setup_hugepagesz(char *string)
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
+	if (!arch_hugetlb_valid_size((unsigned long)hugepage_size)) {
 		hugetlb_bad_size();
 		pr_err("hugepagesz=%llu not supported by MMU.\n",
 			hugepage_size);
diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
index 5bfd5aef5378..1c4372bfe782 100644
--- a/arch/x86/mm/hugetlbpage.c
+++ b/arch/x86/mm/hugetlbpage.c
@@ -181,13 +181,22 @@ hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 #endif /* CONFIG_HUGETLB_PAGE */
 
 #ifdef CONFIG_X86_64
+bool __init arch_hugetlb_valid_size(unsigned long size)
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
 	unsigned long ps = memparse(opt, &opt);
-	if (ps == PMD_SIZE) {
-		hugetlb_add_hstate(PMD_SHIFT - PAGE_SHIFT);
-	} else if (ps == PUD_SIZE && boot_cpu_has(X86_FEATURE_GBPAGES)) {
-		hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
+
+	if (arch_hugetlb_valid_size(ps)) {
+		hugetlb_add_hstate(ilog2(ps) - PAGE_SHIFT);
 	} else {
 		hugetlb_bad_size();
 		printk(KERN_ERR "hugepagesz: Unsupported page size %lu M\n",
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 43a1cef8f0f1..2eb15f5ab01e 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -521,6 +521,7 @@ int __init alloc_bootmem_huge_page(struct hstate *h);
 
 void __init hugetlb_bad_size(void);
 void __init hugetlb_add_hstate(unsigned order);
+bool __init arch_hugetlb_valid_size(unsigned long size);
 struct hstate *size_to_hstate(unsigned long size);
 
 #ifndef HUGE_MAX_HSTATE
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index cd459155d28a..871ac1681f37 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3256,6 +3256,12 @@ static int __init hugetlb_init(void)
 }
 subsys_initcall(hugetlb_init);
 
+/* Overwritten by architectures with more huge page sizes */
+bool __init __attribute((weak)) arch_hugetlb_valid_size(unsigned long size)
+{
+	return size == HPAGE_SIZE;
+}
+
 /* Should be called on processing a hugepagesz=... option */
 void __init hugetlb_bad_size(void)
 {
@@ -3331,12 +3337,21 @@ static int __init hugetlb_nrpages_setup(char *s)
 }
 __setup("hugepages=", hugetlb_nrpages_setup);
 
-static int __init hugetlb_default_setup(char *s)
+static int __init default_hugepagesz_setup(char *s)
 {
-	default_hstate_size = memparse(s, &s);
+	unsigned long size;
+
+	size = (unsigned long)memparse(s, NULL);
+
+	if (!arch_hugetlb_valid_size(size)) {
+		pr_err("HugeTLB: unsupported default_hugepagesz %s\n", s);
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
2.25.2

