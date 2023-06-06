Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1D17236A5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 07:11:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZz8X31dyz3fsn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 15:11:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XseMTiaZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XseMTiaZ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZysf18QNz3dy5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 14:58:13 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3564l51V025049;
	Tue, 6 Jun 2023 04:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GtXXV1ea1Un9rzXBlZn1s5dS8N5u95C6wuxdWHgOLpc=;
 b=XseMTiaZv30dWFFU3mfNuZ8HlewJLYCwiPmerkCLew8fI2BZkrBgCrJ3VfoCMCSknck9
 GGyYB15urjkHUP/v7peUDNwnlHhUsIS+nUObaZzq46zThcqAvv/R8Bta09o9xFgQyBU9
 JHUZzQEZKlxAWP+/szwuRtU4bmuWCbAjGdZZzRWQZm+JB+twyKKbhZ3CHLMoBNTLRZOz
 jtNwcAD6GRotAMPfvsqT0YGXb8n4uSZHlHJW+LYtW0+fpESzzpkfSSLu6wpdy1Y766zf
 5+EagsjjRVw0uy4lhc+f4WM+ulw3PJfAMQ5nTq4MC5ePpl+dTkoyKtdEEZVjcMDRpc+Q wA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1x30g4k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 04:57:58 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3564vspD018879;
	Tue, 6 Jun 2023 04:57:57 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1x30g4jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 04:57:57 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3560s4h5026536;
	Tue, 6 Jun 2023 04:57:57 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3qyxfs55jr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 04:57:57 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3564vue83932814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jun 2023 04:57:56 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16D1C58063;
	Tue,  6 Jun 2023 04:57:56 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 434B25804B;
	Tue,  6 Jun 2023 04:57:51 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.204.255])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jun 2023 04:57:50 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 16/16] powerpc/book3s64/radix: Remove mmu_vmemmap_psize
Date: Tue,  6 Jun 2023 10:26:08 +0530
Message-Id: <20230606045608.55127-17-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606045608.55127-1-aneesh.kumar@linux.ibm.com>
References: <20230606045608.55127-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y6PYvbcgktADezP7_nTK8pUvZVPzpawv
X-Proofpoint-GUID: 48BU0m1fEnJh5Q_ak7NwkVSsm_WRDXn-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_02,2023-06-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060040
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
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is not used by radix anymore.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 10 ----------
 arch/powerpc/mm/init_64.c                | 21 ++++++++++++++-------
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 82d36df52a8d..b59219751599 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -601,16 +601,6 @@ void __init radix__early_init_mmu(void)
 	mmu_virtual_psize = MMU_PAGE_4K;
 #endif
 
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
 	/*
 	 * initialize page table size
 	 */
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
2.40.1

