Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C40497497FD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 11:10:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aM1pXunm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxW2c6yMNz3cn0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 19:10:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aM1pXunm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxVpf2rX4z3bsQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 18:59:54 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3668lcjn027656;
	Thu, 6 Jul 2023 08:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6kxLrFH9O/dgnOxiwQllt1opEKBmkSY2lqJtQlTEuI8=;
 b=aM1pXunmJrh1gwpCx6J3gcZns+AA7zOZ2rwspLHOD7dDdCtQz4VWJqqNSALhVh7o4lqY
 C/9H+6Lbqtwx7gRZleqAauJ3VTrsZlKj1qE9l29VhAcwLxXkUATRiozHE1TPFPlEEXvL
 T/c6nufLglrpusoAC3wecmfSreaMQWrC60iuTzdjmfAXSgWX0pfqHuP10m9CBrMTeIDu
 fq5nVUs3Yd6/l16Y1z1S0MDr+yHf9aTSsXU7uU4KXsGBcXfj50aDUuNhwWgsknNxpiBw
 hdE51QhPjVna5XmSRhjnV9uaJncLBj26pCHqzjVpdoEznSAkuJH0JdTWvjcgKgfeTN1J ow== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rntdpg8ca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:59:37 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3668laYu027524;
	Thu, 6 Jul 2023 08:59:36 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rntdpg8by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:59:36 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3668Y8GK001878;
	Thu, 6 Jul 2023 08:59:35 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3rjbs583t0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 08:59:35 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3668xYXN55640546
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jul 2023 08:59:34 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A6135805D;
	Thu,  6 Jul 2023 08:59:34 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9FE9258057;
	Thu,  6 Jul 2023 08:59:29 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Jul 2023 08:59:29 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v3 12/13] powerpc/book3s64/radix: Remove mmu_vmemmap_psize
Date: Thu,  6 Jul 2023 14:28:18 +0530
Message-ID: <20230706085819.827761-13-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706085819.827761-1-aneesh.kumar@linux.ibm.com>
References: <20230706085819.827761-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: I6yQXQ_t4WZHt1CiojNjaT6B5BTrhU44
X-Proofpoint-GUID: RPQhsPkU4-f7pY4ofFUewyBBCePrbR4k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_05,2023-07-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060075
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

This is not used by radix anymore.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 11 -----------
 arch/powerpc/mm/init_64.c                | 21 ++++++++++++++-------
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index c05783466562..dac56c883099 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -601,17 +601,6 @@ void __init radix__early_init_mmu(void)
 #else
 	mmu_virtual_psize = MMU_PAGE_4K;
 #endif
-
-#ifdef CONFIG_SPARSEMEM_VMEMMAP
-	/* vmemmap mapping */
-	if (mmu_psize_defs[MMU_PAGE_2M].shift) {
-		/*
-		 * map vmemmap using 2M if available
-		 */
-		mmu_vmemmap_psize = MMU_PAGE_2M;
-	} else
-		mmu_vmemmap_psize = mmu_virtual_psize;
-#endif
 #endif
 	/*
 	 * initialize page table size
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 5701faca39ef..6db7a063ba63 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -198,17 +198,12 @@ bool altmap_cross_boundary(struct vmem_altmap *altmap, unsigned long start,
 	return false;
 }
 
-int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
-		struct vmem_altmap *altmap)
+int __meminit __vmemmap_populate(unsigned long start, unsigned long end, int node,
+				 struct vmem_altmap *altmap)
 {
 	bool altmap_alloc;
 	unsigned long page_size = 1 << mmu_psize_defs[mmu_vmemmap_psize].shift;
 
-#ifdef CONFIG_PPC_BOOK3S_64
-	if (radix_enabled())
-		return radix__vmemmap_populate(start, end, node, altmap);
-#endif
-
 	/* Align to the page size of the linear mapping. */
 	start = ALIGN_DOWN(start, page_size);
 
@@ -277,6 +272,18 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 	return 0;
 }
 
+int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
+			       struct vmem_altmap *altmap)
+{
+
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (radix_enabled())
+		return radix__vmemmap_populate(start, end, node, altmap);
+#endif
+
+	return __vmemmap_populate(start, end, node, altmap);
+}
+
 #ifdef CONFIG_MEMORY_HOTPLUG
 static unsigned long vmemmap_list_free(unsigned long start)
 {
-- 
2.41.0

