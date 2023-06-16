Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3E4732FAC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 13:18:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RUFGDkV/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjGr40LgSz3cRG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:18:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RUFGDkV/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjGfQ4gTTz3bx1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 21:10:22 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35GAl7hT012077;
	Fri, 16 Jun 2023 11:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fnptJB5qGAcHT1CUlyBof6IMLSq55vUSDFTN16YlJMU=;
 b=RUFGDkV/YOyUnQk7PIhvQaVSZdhcPhVgfcs0S6gaOIsaxTaCswznPk0c0SKhqCWB23XV
 skoS/+iIb2T6ABkvygfiyd+/h/ZOglgOQA+n6DV3jdB5mnY6oeJP6HsfGDJUOvUEkwkR
 CEX3iTXh376FU8ycWICkG8fhPPf00ot+Crgy4lqNCMcJX2eCRH7rDj3sbJ+86cZLC76V
 lexAf6aPRv94hGC/TozFxrcXl3ldx2mvQj1q0uhUua5HtNZkNeoQbMckeEFD7UcPYCEI
 r17r9uk/HTOG7lcjM5p1tTUwn1Dif6fw6E98hxP3LoHztb80exDbPdXWvPSOOsFPsxMs OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8p9n8e7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 11:10:05 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35GB59ko029868;
	Fri, 16 Jun 2023 11:10:05 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8p9n8e73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 11:10:05 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35G8w3MO012063;
	Fri, 16 Jun 2023 11:10:04 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3r4gt6s34x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 11:10:04 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35GBA2JU28771058
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jun 2023 11:10:02 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87C3858058;
	Fri, 16 Jun 2023 11:10:02 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 454595805C;
	Fri, 16 Jun 2023 11:09:56 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.52.24])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jun 2023 11:09:55 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v2 12/16] mm/vmemmap optimization: Split hugetlb and devdax vmemmap optimization
Date: Fri, 16 Jun 2023 16:38:22 +0530
Message-Id: <20230616110826.344417-13-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
References: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: or_7neAhvWhjnojFDN9BtabCUIumjqQv
X-Proofpoint-GUID: sXKKgXKZW4iyFjCUKvQCt774s8hcpCSd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_07,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 mlxscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160099
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

loongarch and riscv don't have devdax support. So the DAX config is not
enabled for them. With this change, arm64 should be able to select DAX
optimization

[1] commit 060a2c92d1b6 ("arm64: mm: hugetlb: Disable HUGETLB_PAGE_OPTIMIZE_VMEMMAP")

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/loongarch/Kconfig | 2 +-
 arch/riscv/Kconfig     | 2 +-
 arch/x86/Kconfig       | 3 ++-
 fs/Kconfig             | 2 +-
 include/linux/mm.h     | 2 +-
 mm/Kconfig             | 5 ++++-
 6 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index d38b066fc931..2060990c4612 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -55,7 +55,7 @@ config LOONGARCH
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select ARCH_WANT_LD_ORPHAN_WARN
-	select ARCH_WANT_OPTIMIZE_VMEMMAP
+	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	select ARCH_WANTS_NO_INSTR
 	select BUILDTIME_TABLE_SORT
 	select COMMON_CLK
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5966ad97c30c..d8f3765ff115 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -50,7 +50,7 @@ config RISCV
 	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select ARCH_WANT_LD_ORPHAN_WARN if !XIP_KERNEL
-	select ARCH_WANT_OPTIMIZE_VMEMMAP
+	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
 	select BUILDTIME_TABLE_SORT if MMU
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 53bab123a8ee..eb383960b6ee 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -127,7 +127,8 @@ config X86
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
index 9a45e61cd83f..6e56ae09f0c1 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3553,7 +3553,7 @@ void vmemmap_free(unsigned long start, unsigned long end,
 #endif
 
 #define VMEMMAP_RESERVE_NR	2
-#ifdef CONFIG_ARCH_WANT_OPTIMIZE_VMEMMAP
+#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
 					  struct dev_pagemap *pgmap)
 {
diff --git a/mm/Kconfig b/mm/Kconfig
index 7672a22647b4..7b388c10baab 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -461,7 +461,10 @@ config SPARSEMEM_VMEMMAP
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
2.40.1

