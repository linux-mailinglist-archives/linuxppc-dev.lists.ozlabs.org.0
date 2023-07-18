Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F27937571DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 04:40:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m+mWrixn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4jqR6Gvjz3dGl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 12:40:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m+mWrixn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4jcd4zJ9z30f9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 12:31:13 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36I2Cblc030021;
	Tue, 18 Jul 2023 02:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Uid4soVR4vf6s+0fcrZuIzbN65q5Imh7atR87IkTTko=;
 b=m+mWrixnmG+s+m8meZqB7ZnZ3/+F7fKSEcKXNajMTpHcJctRyCyd4MCm9g7MD7giQuog
 lLY/gkI5OsoSdeZ2c3VX9/wIrj6joA4jFzpJ8iS3qTwZh+V5tP2BAHKg1/T1jMyAd1AD
 0aDB1K0AkddfPZMbge6dnICq0+nC+aWjxYN116O+Fgx//T9ZbksVE/JYvdEUV8WmfhEw
 tWjaLGGICLLFcmPzFoEG7IHHdPGCDWou6l+U6N4x2dgY81yTT0t9ZV7/9vvTFQ8JG4s5
 hXsbFr3iB6rpAEwYg+YXQhYp1HAcSG3R8T/F1+KBeC+WFRzuDhMMku1Af0FJMBBgqhrW yg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rwhrg8afu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:30:54 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36I2QSZf001672;
	Tue, 18 Jul 2023 02:30:54 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rwhrg8afj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:30:54 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36HMgqaU004962;
	Tue, 18 Jul 2023 02:30:52 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3rv65xbujy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:30:52 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36I2Uq3u2556468
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jul 2023 02:30:52 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0FD5658065;
	Tue, 18 Jul 2023 02:30:52 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EA5958057;
	Tue, 18 Jul 2023 02:30:47 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.62.199])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Jul 2023 02:30:46 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v5 12/13] powerpc/book3s64/radix: Remove mmu_vmemmap_psize
Date: Tue, 18 Jul 2023 07:59:32 +0530
Message-ID: <20230718022934.90447-13-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718022934.90447-1-aneesh.kumar@linux.ibm.com>
References: <20230718022934.90447-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XhuxBIvxCYtLvXdFiS90EFwKnqILnI7F
X-Proofpoint-ORIG-GUID: ZdAlO3lKITPO3qwPPgTFu5iFVCQNkBOR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307180017
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
index b492b67c0b7d..73d0987369ff 100644
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

