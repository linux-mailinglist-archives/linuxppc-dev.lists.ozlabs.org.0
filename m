Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D678274DAD7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 18:16:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kCArlejN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R08J65QNfz3cTd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 02:16:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kCArlejN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R089358L0z3brC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 02:09:59 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36AG6u0P022271;
	Mon, 10 Jul 2023 16:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=P+AZIqnopT1dy9laW4Ph6z8M3DAEFIp4FvwjX5DVsDo=;
 b=kCArlejNyJEpZ4iK2UfmX2NNpjTVANeJgWBikfNLsoExMDAGqt5nCx+/I7r3BwS4UeHL
 5cM+40jOJiF8KFrCyyfN4AMx89/Ffp/fAq0pAD4o1DXSEyklWdd756qdr2NhlWWsfn0t
 YO1sDCIcaVWl39NaWLzv09qeyEyt1v3v6aOO5OtZDCb9HIUOogvKfmcGTAqD/31SiAAB
 41DdlIqva/p1JudgPy5Kir0dZ2W3fDKabNjgLJv8s8a8smjPqnFxE5bYqofcKy/ZdwQy
 GA0gSofCX+i0dQAP9oIlMT/uKkjViaSRCFf9KwQ5CLOIFjUSbzKu3ULo4Eln1UlLbm0/ iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rrmxh8gh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jul 2023 16:09:40 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36AG70di022982;
	Mon, 10 Jul 2023 16:09:40 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rrmxh8ggp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jul 2023 16:09:40 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36AEJ887005249;
	Mon, 10 Jul 2023 16:09:39 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3rpye60kq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jul 2023 16:09:39 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36AG9b3o3474092
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Jul 2023 16:09:37 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56D5858056;
	Mon, 10 Jul 2023 16:09:37 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C2C05803F;
	Mon, 10 Jul 2023 16:09:31 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.9.86])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Jul 2023 16:09:30 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v4 07/13] mm/vmemmap optimization: Split hugetlb and devdax vmemmap optimization
Date: Mon, 10 Jul 2023 21:38:36 +0530
Message-ID: <20230710160842.56300-8-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710160842.56300-1-aneesh.kumar@linux.ibm.com>
References: <20230710160842.56300-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: isLGc3SvCmJ6YoWaUNk62wHBU3Q0HnO0
X-Proofpoint-ORIG-GUID: 3_EhPL9KedALYPy_LZ7tceuWpHNNmP9K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307100145
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arm disabled hugetlb vmemmap optimization [1] because hugetlb vmemmap
optimization includes an update of both the permissions (writeable to
read-only) and the output address (pfn) of the vmemmap ptes. That is not
supported without unmapping of pte(marking it invalid) by some
architectures.

With DAX vmemmap optimization we don't require such pte updates and
architectures can enable DAX vmemmap optimization while having hugetlb
vmemmap optimization disabled. Hence split DAX optimization support into a
different config.

s390, loongarch and riscv don't have devdax support. So the DAX config is not
enabled for them. With this change, arm64 should be able to select DAX
optimization

[1] commit 060a2c92d1b6 ("arm64: mm: hugetlb: Disable HUGETLB_PAGE_OPTIMIZE_VMEMMAP")

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/loongarch/Kconfig | 2 +-
 arch/riscv/Kconfig     | 2 +-
 arch/s390/Kconfig      | 2 +-
 arch/x86/Kconfig       | 3 ++-
 fs/Kconfig             | 2 +-
 include/linux/mm.h     | 2 +-
 mm/Kconfig             | 5 ++++-
 7 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index e55511af4c77..537ca2a4005a 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -59,7 +59,7 @@ config LOONGARCH
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select ARCH_WANT_LD_ORPHAN_WARN
-	select ARCH_WANT_OPTIMIZE_VMEMMAP
+	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	select ARCH_WANTS_NO_INSTR
 	select BUILDTIME_TABLE_SORT
 	select COMMON_CLK
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4c07b9189c86..6943d34c1ec1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -53,7 +53,7 @@ config RISCV
 	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select ARCH_WANT_LD_ORPHAN_WARN if !XIP_KERNEL
-	select ARCH_WANT_OPTIMIZE_VMEMMAP
+	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
 	select BUILDTIME_TABLE_SORT if MMU
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 5b39918b7042..975fd06e4f4d 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -127,7 +127,7 @@ config S390
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANT_DEFAULT_BPF_JIT
 	select ARCH_WANT_IPC_PARSE_VERSION
-	select ARCH_WANT_OPTIMIZE_VMEMMAP
+	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS2
 	select DMA_OPS if PCI
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 7422db409770..78224aa76409 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -128,7 +128,8 @@ config X86
 	select ARCH_WANT_GENERAL_HUGETLB
 	select ARCH_WANT_HUGE_PMD_SHARE
 	select ARCH_WANT_LD_ORPHAN_WARN
-	select ARCH_WANT_OPTIMIZE_VMEMMAP	if X86_64
+	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP	if X86_64
+	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP	if X86_64
 	select ARCH_WANTS_THP_SWAP		if X86_64
 	select ARCH_HAS_PARANOID_L1D_FLUSH
 	select BUILDTIME_TABLE_SORT
diff --git a/fs/Kconfig b/fs/Kconfig
index 18d034ec7953..9c104c130a6e 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -252,7 +252,7 @@ config HUGETLB_PAGE
 
 config HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 	def_bool HUGETLB_PAGE
-	depends on ARCH_WANT_OPTIMIZE_VMEMMAP
+	depends on ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	depends on SPARSEMEM_VMEMMAP
 
 config HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1a2234ee14d2..83f51ec0897d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3640,7 +3640,7 @@ void vmemmap_free(unsigned long start, unsigned long end,
 #endif
 
 #define VMEMMAP_RESERVE_NR	2
-#ifdef CONFIG_ARCH_WANT_OPTIMIZE_VMEMMAP
+#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
 					  struct dev_pagemap *pgmap)
 {
diff --git a/mm/Kconfig b/mm/Kconfig
index 09130434e30d..923bd35f81f2 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -487,7 +487,10 @@ config SPARSEMEM_VMEMMAP
 # Select this config option from the architecture Kconfig, if it is preferred
 # to enable the feature of HugeTLB/dev_dax vmemmap optimization.
 #
-config ARCH_WANT_OPTIMIZE_VMEMMAP
+config ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
+	bool
+
+config ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	bool
 
 config HAVE_MEMBLOCK_PHYS_MAP
-- 
2.41.0

