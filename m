Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BE419B5D2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 20:41:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sw5n6S37zDqqW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 05:41:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=DqP6xCJP; 
 dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sw3C5PPxzDqRS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 05:39:34 +1100 (AEDT)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 031Icsec187325;
 Wed, 1 Apr 2020 18:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=0ZeM42CZcVmYIfKb0IIJNxRy08YqIyrnux31zctChvU=;
 b=DqP6xCJP4WoWC9kil5qqtX4CHQ9yzNPLYzy2yBK5gVGjM08NCzmw6zOBUdDlazrwZJL5
 klVsTDW4i7lL4FC+UnZTXQosSdeckozXZ43MSjdcyuSfbPc6FXJ5xqqL7e0OfR66irvp
 HE+E9rjGKsUv8M4Ay+I5sV+igkey06JARa+MsUFetmQXAijgEFzgvdcvKGTbj1BrO7j0
 eD/ZYCSgYmIomWDaVgDTyXsSRWAryzPs1fT8hDbsc4K2+DNwkRy2EyaNz9qA6OTulunA
 h3SxRyRW8WIf7l8QFV4nUt4s7gHuDhwS9iJQue2wFJlW795JJ+vwxFDY7u+WXENBjvbH 4w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 303aqhqmxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 01 Apr 2020 18:38:55 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 031IcUGQ175847;
 Wed, 1 Apr 2020 18:38:39 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 302ga0ym8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 01 Apr 2020 18:38:39 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 031IcZYN015513;
 Wed, 1 Apr 2020 18:38:35 GMT
Received: from monkey.oracle.com (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 01 Apr 2020 11:38:34 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 2/4] hugetlbfs: move hugepagesz= parsing to arch
 independent code
Date: Wed,  1 Apr 2020 11:38:17 -0700
Message-Id: <20200401183819.20647-3-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200401183819.20647-1-mike.kravetz@oracle.com>
References: <20200401183819.20647-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9578
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010151
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9578
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004010151
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
Cc: Mina Almasry <almasrymina@google.com>, Albert Ou <aou@eecs.berkeley.edu>,
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

Now that architectures provide arch_hugetlb_valid_size(), parsing
of "hugepagesz=" can be done in architecture independent code.
Create a single routine to handle hugepagesz= parsing and remove
all arch specific routines.  We can also remove the interface
hugetlb_bad_size() as this is no longer used outside arch independent
code.

This also provides consistent behavior of hugetlbfs command line
options.  The hugepagesz= option should only be specified once for
a specific size, but some architectures allow multiple instances.
This appears to be more of an oversight when code was added by some
architectures to set up ALL huge pages sizes.

Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
---
 arch/arm64/mm/hugetlbpage.c   | 15 ---------------
 arch/powerpc/mm/hugetlbpage.c | 15 ---------------
 arch/riscv/mm/hugetlbpage.c   | 16 ----------------
 arch/s390/mm/hugetlbpage.c    | 18 ------------------
 arch/sparc/mm/init_64.c       | 22 ----------------------
 arch/x86/mm/hugetlbpage.c     | 16 ----------------
 include/linux/hugetlb.h       |  1 -
 mm/hugetlb.c                  | 23 +++++++++++++++++------
 8 files changed, 17 insertions(+), 109 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 069b96ee2aec..f706b821aba6 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -476,18 +476,3 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
 
 	return false;
 }
-
-static __init int setup_hugepagesz(char *opt)
-{
-	unsigned long ps = memparse(opt, &opt);
-
-	if (arch_hugetlb_valid_size(ps)) {
-		add_huge_page_size(ps);
-		return 1;
-	}
-
-	hugetlb_bad_size();
-	pr_err("hugepagesz: Unsupported page size %lu K\n", ps >> 10);
-	return 0;
-}
-__setup("hugepagesz=", setup_hugepagesz);
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index de54d2a37830..2c3fa0a7787b 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -589,21 +589,6 @@ static int __init add_huge_page_size(unsigned long long size)
 	return 0;
 }
 
-static int __init hugepage_setup_sz(char *str)
-{
-	unsigned long long size;
-
-	size = memparse(str, &str);
-
-	if (add_huge_page_size(size) != 0) {
-		hugetlb_bad_size();
-		pr_err("Invalid huge page size specified(%llu)\n", size);
-	}
-
-	return 1;
-}
-__setup("hugepagesz=", hugepage_setup_sz);
-
 static int __init hugetlbpage_init(void)
 {
 	bool configured = false;
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index da1f516bc451..4e5d7e9f0eef 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -22,22 +22,6 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
 		return false;
 }
 
-static __init int setup_hugepagesz(char *opt)
-{
-	unsigned long ps = memparse(opt, &opt);
-
-	if (arch_hugetlb_valid_size(ps)) {
-		hugetlb_add_hstate(ilog2(ps) - PAGE_SHIFT);
-		return 1;
-	}
-
-	hugetlb_bad_size();
-	pr_err("hugepagesz: Unsupported page size %lu M\n", ps >> 20);
-	return 0;
-
-}
-__setup("hugepagesz=", setup_hugepagesz);
-
 #ifdef CONFIG_CONTIG_ALLOC
 static __init int gigantic_pages_init(void)
 {
diff --git a/arch/s390/mm/hugetlbpage.c b/arch/s390/mm/hugetlbpage.c
index ac25b207624c..242dfc0d462d 100644
--- a/arch/s390/mm/hugetlbpage.c
+++ b/arch/s390/mm/hugetlbpage.c
@@ -261,24 +261,6 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
 		return false;
 }
 
-static __init int setup_hugepagesz(char *opt)
-{
-	unsigned long size;
-	char *string = opt;
-
-	size = memparse(opt, &opt);
-	if (arch_hugetlb_valid_size(size)) {
-		hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
-	} else {
-		hugetlb_bad_size();
-		pr_err("hugepagesz= specifies an unsupported page size %s\n",
-			string);
-		return 0;
-	}
-	return 1;
-}
-__setup("hugepagesz=", setup_hugepagesz);
-
 static unsigned long hugetlb_get_unmapped_area_bottomup(struct file *file,
 		unsigned long addr, unsigned long len,
 		unsigned long pgoff, unsigned long flags)
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 2bfe8e22b706..4618f96fd30f 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -397,28 +397,6 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
 
 	return true;
 }
-
-static int __init setup_hugepagesz(char *string)
-{
-	unsigned long long hugepage_size;
-	int rc = 0;
-
-	hugepage_size = memparse(string, &string);
-
-	if (!arch_hugetlb_valid_size((unsigned long)hugepage_size)) {
-		hugetlb_bad_size();
-		pr_err("hugepagesz=%llu not supported by MMU.\n",
-			hugepage_size);
-		goto out;
-	}
-
-	add_huge_page_size(hugepage_size);
-	rc = 1;
-
-out:
-	return rc;
-}
-__setup("hugepagesz=", setup_hugepagesz);
 #endif	/* CONFIG_HUGETLB_PAGE */
 
 void update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep)
diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
index 1c4372bfe782..937d640a89e3 100644
--- a/arch/x86/mm/hugetlbpage.c
+++ b/arch/x86/mm/hugetlbpage.c
@@ -191,22 +191,6 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
 		return false;
 }
 
-static __init int setup_hugepagesz(char *opt)
-{
-	unsigned long ps = memparse(opt, &opt);
-
-	if (arch_hugetlb_valid_size(ps)) {
-		hugetlb_add_hstate(ilog2(ps) - PAGE_SHIFT);
-	} else {
-		hugetlb_bad_size();
-		printk(KERN_ERR "hugepagesz: Unsupported page size %lu M\n",
-			ps >> 20);
-		return 0;
-	}
-	return 1;
-}
-__setup("hugepagesz=", setup_hugepagesz);
-
 #ifdef CONFIG_CONTIG_ALLOC
 static __init int gigantic_pages_init(void)
 {
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 962bb1e6682b..d40340b13198 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -519,7 +519,6 @@ int huge_add_to_page_cache(struct page *page, struct address_space *mapping,
 int __init __alloc_bootmem_huge_page(struct hstate *h);
 int __init alloc_bootmem_huge_page(struct hstate *h);
 
-void __init hugetlb_bad_size(void);
 void __init hugetlb_add_hstate(unsigned order);
 struct hstate *size_to_hstate(unsigned long size);
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index e9d9d179cf12..02b13ee26790 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3249,12 +3249,6 @@ static int __init hugetlb_init(void)
 }
 subsys_initcall(hugetlb_init);
 
-/* Should be called on processing a hugepagesz=... option */
-void __init hugetlb_bad_size(void)
-{
-	parsed_valid_hugepagesz = false;
-}
-
 void __init hugetlb_add_hstate(unsigned int order)
 {
 	struct hstate *h;
@@ -3324,6 +3318,23 @@ static int __init hugetlb_nrpages_setup(char *s)
 }
 __setup("hugepages=", hugetlb_nrpages_setup);
 
+static int __init hugepagesz_setup(char *s)
+{
+	unsigned long size;
+
+	size = (unsigned long)memparse(s, NULL);
+
+	if (!arch_hugetlb_valid_size(size)) {
+		parsed_valid_hugepagesz = false;
+		pr_err("HugeTLB: unsupported hugepagesz %s\n", s);
+		return 0;
+	}
+
+	hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
+	return 1;
+}
+__setup("hugepagesz=", hugepagesz_setup);
+
 static int __init default_hugepagesz_setup(char *s)
 {
 	unsigned long size;
-- 
2.25.1

