Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 605D576A7FB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 06:46:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FDfjJ7d5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFMyf24Bvz3d8T
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 14:46:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FDfjJ7d5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFMsB19kGz30PB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 14:42:06 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3714cQHt027889;
	Tue, 1 Aug 2023 04:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=F4qcZEoTqwkRahHimypWFVri5q7pOMDH/5i6hbY2k60=;
 b=FDfjJ7d5ogBaUqPsZlbd2E2h5DYUeI366BywS53lF9nANT1Xxmod+Oj0dF4SAxjpQg+F
 oYu8y557y+xC7IBQDzTdxlIgHN8XA40ZI81Kx/sD/D+O96OVcaEhHr1DdPdKOlG7FtD7
 C7RIhY9BKxDaCSCqutvu1cur2AnXGitEu6VnJdY9Ummyj1vkbilbji3GhWb5DV6cjI9B
 kqTwyfDpapiAGsQCT8SPgcWS+UDiFXFQlMYZ2x7rBVqL0yrm7yWnBTrju/Nf8oc5rKTr
 EW0sRMyl+jhHLo6pUv2ArwF092YS+nmZToBoaKJxVJ0hJErAht0uz3R8VwODzbprJ18b JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6u1a8acn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 04:41:54 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3714dBko032624;
	Tue, 1 Aug 2023 04:41:53 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6u1a8a32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 04:41:53 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3713o80n015578;
	Tue, 1 Aug 2023 04:41:47 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s5e3mrvrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 04:41:47 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3714fkjh35390140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Aug 2023 04:41:47 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9546458064;
	Tue,  1 Aug 2023 04:41:46 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8A565805D;
	Tue,  1 Aug 2023 04:41:42 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Aug 2023 04:41:42 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v7 5/7] powerpc/book3s64/memhotplug: Enable memmap on memory for radix
Date: Tue,  1 Aug 2023 10:11:14 +0530
Message-ID: <20230801044116.10674-6-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801044116.10674-1-aneesh.kumar@linux.ibm.com>
References: <20230801044116.10674-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9IXT-r0n7-ziHT5f4ToZV-7Q60ZuhYQx
X-Proofpoint-GUID: OfD5AOrkufi3u5P3Spvtha__jRmyWQWD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_02,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308010041
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Radix vmemmap mapping can map things correctly at the PMD level or PTE
level based on different device boundary checks. Hence we skip the
restrictions w.r.t vmemmap size to be multiple of PMD_SIZE. This also
makes the feature widely useful because to use PMD_SIZE vmemmap area we
require a memory block size of 2GiB

We can also use MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY to that the feature
can work with a memory block size of 256MB. Using altmap.reserve feature
to align things correctly at pageblock granularity. We can end up
losing some pages in memory with this. For ex: with a 256MiB memory block
size, we require 4 pages to map vmemmap pages, In order to align things
correctly we end up adding a reserve of 28 pages. ie, for every 4096
pages 28 pages get reserved.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/include/asm/pgtable.h            | 21 +++++++++++++++++++
 .../platforms/pseries/hotplug-memory.c        |  2 +-
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d0497d13f5b4..938294c996dc 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -157,6 +157,7 @@ config PPC
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_KEEP_MEMBLOCK
+	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if PPC_RADIX_MMU
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ARCH_OPTIONAL_KERNEL_RWX		if ARCH_HAS_STRICT_KERNEL_RWX
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index a4893b17705a..33464e6d6431 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -161,6 +161,27 @@ static inline pgtable_t pmd_pgtable(pmd_t pmd)
 int __meminit vmemmap_populated(unsigned long vmemmap_addr, int vmemmap_map_size);
 bool altmap_cross_boundary(struct vmem_altmap *altmap, unsigned long start,
 			   unsigned long page_size);
+/*
+ * mm/memory_hotplug.c:mhp_supports_memmap_on_memory goes into details
+ * some of the restrictions. We don't check for PMD_SIZE because our
+ * vmemmap allocation code can fallback correctly. The pageblock
+ * alignment requirement is met using altmap->reserve blocks.
+ */
+#define arch_supports_memmap_on_memory arch_supports_memmap_on_memory
+static inline bool arch_supports_memmap_on_memory(unsigned long vmemmap_size)
+{
+	if (!radix_enabled())
+		return false;
+	/*
+	 * With 4K page size and 2M PMD_SIZE, we can align
+	 * things better with memory block size value
+	 * starting from 128MB. Hence align things with PMD_SIZE.
+	 */
+	if (IS_ENABLED(CONFIG_PPC_4K_PAGES))
+		return IS_ALIGNED(vmemmap_size, PMD_SIZE);
+	return true;
+}
+
 #endif /* CONFIG_PPC64 */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 9c62c2c3b3d0..4f3d6a2f9065 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -637,7 +637,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 		nid = first_online_node;
 
 	/* Add the memory */
-	rc = __add_memory(nid, lmb->base_addr, block_sz, MHP_NONE);
+	rc = __add_memory(nid, lmb->base_addr, block_sz, MHP_MEMMAP_ON_MEMORY);
 	if (rc) {
 		invalidate_lmb_associativity_index(lmb);
 		return rc;
-- 
2.41.0

