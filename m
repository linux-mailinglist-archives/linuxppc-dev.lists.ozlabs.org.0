Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F8F1AE544
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 20:56:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493lgJ5dHKzDqLB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 04:56:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=TPxUta0d; 
 dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493lZG1RKCzDqS6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Apr 2020 04:52:05 +1000 (AEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03HIoxVc151261;
 Fri, 17 Apr 2020 18:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=DYHHp6weBkuFwIRXVbnbA+At0BLq1KaDyQt4hlEOPJI=;
 b=TPxUta0dcPsBcdrhJ9RrurAhXENLoeNndDsVeU5oTICOmbuUWadhjYtvEJPIAZx/an8R
 Eai+T6zQ+CYpw7ggw9EjbbRO3Y1SrxuFiBNhWOad1lsSSrEW2csaQPA+tJf8jCqVkAOe
 pDDwk4nITBwmNqs9y/+NyhBRasF//1b/5hzu1byD9YpZt0saMV7DU4Uairql37vULHmz
 orMTcfZc4Jwz1/pPAR+ztkqH1I6n7CGgJNf1XgDc3PRBoCKIz5ENBB+VpG/wPEF1pZC1
 8thbKzyWL3L39L7WKibbclOP1S0hW2jgrFInpZ+WWZVWgvunyfVRP0Ao0Q44FgEMLbZm TA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 30dn960r7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Apr 2020 18:51:23 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03HIpMe7024298;
 Fri, 17 Apr 2020 18:51:22 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 30dn921b15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Apr 2020 18:51:22 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03HIp7Ev029062;
 Fri, 17 Apr 2020 18:51:07 GMT
Received: from monkey.oracle.com (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 17 Apr 2020 11:51:07 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v3 3/4] hugetlbfs: remove hugetlb_add_hstate() warning for
 existing hstate
Date: Fri, 17 Apr 2020 11:50:48 -0700
Message-Id: <20200417185049.275845-4-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200417185049.275845-1-mike.kravetz@oracle.com>
References: <20200417185049.275845-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9594
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004170143
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9594
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1015
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

The routine hugetlb_add_hstate prints a warning if the hstate already
exists.  This was originally done as part of kernel command line
parsing.  If 'hugepagesz=' was specified more than once, the warning
	pr_warn("hugepagesz= specified twice, ignoring\n");
would be printed.

Some architectures want to enable all huge page sizes.  They would
call hugetlb_add_hstate for all supported sizes.  However, this was
done after command line processing and as a result hstates could have
already been created for some sizes.  To make sure no warning were
printed, there would often be code like:
	if (!size_to_hstate(size)
		hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT)

The only time we want to print the warning is as the result of command
line processing.  So, remove the warning from hugetlb_add_hstate and
add it to the single arch independent routine processing "hugepagesz=".
After this, calls to size_to_hstate() in arch specific code can be
removed and hugetlb_add_hstate can be called without worrying about
warning messages.

Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
Acked-by: Mina Almasry <almasrymina@google.com>
---
 arch/arm64/mm/hugetlbpage.c   | 16 ++++------------
 arch/powerpc/mm/hugetlbpage.c |  3 +--
 arch/riscv/mm/hugetlbpage.c   |  2 +-
 arch/sparc/mm/init_64.c       | 19 ++++---------------
 arch/x86/mm/hugetlbpage.c     |  2 +-
 mm/hugetlb.c                  |  9 ++++++---
 6 files changed, 17 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index f706b821aba6..21fa98b51e00 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -441,22 +441,14 @@ void huge_ptep_clear_flush(struct vm_area_struct *vma,
 	clear_flush(vma->vm_mm, addr, ptep, pgsize, ncontig);
 }
 
-static void __init add_huge_page_size(unsigned long size)
-{
-	if (size_to_hstate(size))
-		return;
-
-	hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
-}
-
 static int __init hugetlbpage_init(void)
 {
 #ifdef CONFIG_ARM64_4K_PAGES
-	add_huge_page_size(PUD_SIZE);
+	hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
 #endif
-	add_huge_page_size(CONT_PMD_SIZE);
-	add_huge_page_size(PMD_SIZE);
-	add_huge_page_size(CONT_PTE_SIZE);
+	hugetlb_add_hstate(CONT_PMD_SHIFT - PAGE_SHIFT);
+	hugetlb_add_hstate(PMD_SHIFT - PAGE_SHIFT);
+	hugetlb_add_hstate(CONT_PTE_SHIFT - PAGE_SHIFT);
 
 	return 0;
 }
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 2c3fa0a7787b..4d5ed1093615 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -584,8 +584,7 @@ static int __init add_huge_page_size(unsigned long long size)
 	if (!arch_hugetlb_valid_size((unsigned long)size))
 		return -EINVAL;
 
-	if (!size_to_hstate(size))
-		hugetlb_add_hstate(shift - PAGE_SHIFT);
+	hugetlb_add_hstate(shift - PAGE_SHIFT);
 	return 0;
 }
 
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 4e5d7e9f0eef..932dadfdca54 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -26,7 +26,7 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
 static __init int gigantic_pages_init(void)
 {
 	/* With CONTIG_ALLOC, we can allocate gigantic pages at runtime */
-	if (IS_ENABLED(CONFIG_64BIT) && !size_to_hstate(1UL << PUD_SHIFT))
+	if (IS_ENABLED(CONFIG_64BIT))
 		hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
 	return 0;
 }
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 4618f96fd30f..ae819a16d07a 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -325,23 +325,12 @@ static void __update_mmu_tsb_insert(struct mm_struct *mm, unsigned long tsb_inde
 }
 
 #ifdef CONFIG_HUGETLB_PAGE
-static void __init add_huge_page_size(unsigned long size)
-{
-	unsigned int order;
-
-	if (size_to_hstate(size))
-		return;
-
-	order = ilog2(size) - PAGE_SHIFT;
-	hugetlb_add_hstate(order);
-}
-
 static int __init hugetlbpage_init(void)
 {
-	add_huge_page_size(1UL << HPAGE_64K_SHIFT);
-	add_huge_page_size(1UL << HPAGE_SHIFT);
-	add_huge_page_size(1UL << HPAGE_256MB_SHIFT);
-	add_huge_page_size(1UL << HPAGE_2GB_SHIFT);
+	hugetlb_add_hstate(HPAGE_64K_SHIFT - PAGE_SHIFT);
+	hugetlb_add_hstate(HPAGE_SHIFT - PAGE_SHIFT);
+	hugetlb_add_hstate(HPAGE_256MB_SHIFT - PAGE_SHIFT);
+	hugetlb_add_hstate(HPAGE_2GB_SHIFT - PAGE_SHIFT);
 
 	return 0;
 }
diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
index 937d640a89e3..cf5781142716 100644
--- a/arch/x86/mm/hugetlbpage.c
+++ b/arch/x86/mm/hugetlbpage.c
@@ -195,7 +195,7 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
 static __init int gigantic_pages_init(void)
 {
 	/* With compaction or CMA we can allocate gigantic pages at runtime */
-	if (boot_cpu_has(X86_FEATURE_GBPAGES) && !size_to_hstate(1UL << PUD_SHIFT))
+	if (boot_cpu_has(X86_FEATURE_GBPAGES))
 		hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
 	return 0;
 }
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index b2d276408cec..0e6eb755ae94 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3222,8 +3222,7 @@ static int __init hugetlb_init(void)
 		}
 
 		default_hstate_size = HPAGE_SIZE;
-		if (!size_to_hstate(default_hstate_size))
-			hugetlb_add_hstate(HUGETLB_PAGE_ORDER);
+		hugetlb_add_hstate(HUGETLB_PAGE_ORDER);
 	}
 	default_hstate_idx = hstate_index(size_to_hstate(default_hstate_size));
 	if (default_hstate_max_huge_pages) {
@@ -3268,7 +3267,6 @@ void __init hugetlb_add_hstate(unsigned int order)
 	unsigned long i;
 
 	if (size_to_hstate(PAGE_SIZE << order)) {
-		pr_warn("hugepagesz= specified twice, ignoring\n");
 		return;
 	}
 	BUG_ON(hugetlb_max_hstate >= HUGE_MAX_HSTATE);
@@ -3343,6 +3341,11 @@ static int __init hugepagesz_setup(char *s)
 		return 0;
 	}
 
+	if (size_to_hstate(size)) {
+		pr_warn("HugeTLB: hugepagesz %s specified twice, ignoring\n", s);
+		return 0;
+	}
+
 	hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
 	return 1;
 }
-- 
2.25.2

