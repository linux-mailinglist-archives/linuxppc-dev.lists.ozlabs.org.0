Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E98764547
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 07:08:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tFEsGvrt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBJgT16vwz3cJm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 15:08:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tFEsGvrt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBJfZ3KY1z307V
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 15:07:18 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36R55lp5032382;
	Thu, 27 Jul 2023 05:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=ZRmrXjtwrCFgelRk+lTxAIReeEev3k3Qbshsmvf5Vpc=;
 b=tFEsGvrt+AEozlat3DYUApjolPhCBrjDQ7OIJMditKg3/q4jPeEuhobmc6RsoPCmlVab
 e433oSLOc06yuX5mH+a+TaVrs9pfCv6MEri2FEx9jLFJaKTEk1B2BRc7thmBQOdHlbrm
 n3lKvLDgPV33Lsm1EDSk5zVAQBhoNR815Bzd7rPyIJ4V9SphLY+faa29JXr2Ga4otcRr
 D2wtNvsUe+6AkeVNG+VEVUzIJRMGvDWVVvcg5ps24yT5QkShZVGvv1DMK+g8GmamShk3
 qREBv88x9c1Cyj8NY5A9J7zSXOjtrKHutJPu6k0xCmMePcFSYT0mqU3+nwAFdpMIPCv1 Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s3hty0c88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 05:06:55 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36R56E6V002031;
	Thu, 27 Jul 2023 05:06:54 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s3hty0c75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 05:06:54 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36R405ug003714;
	Thu, 27 Jul 2023 05:06:52 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0txkagjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 05:06:52 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36R56qNs64946544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jul 2023 05:06:52 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 403B258051;
	Thu, 27 Jul 2023 05:06:52 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4E205805A;
	Thu, 27 Jul 2023 05:06:47 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.109.212.144])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Jul 2023 05:06:47 +0000 (GMT)
X-Mailer: emacs 29.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v6 10/13 -fix] powerpc/book3s64/vmemmap: Switch radix to use
 a different vmemmap handling function
In-Reply-To: <20230724190759.483013-11-aneesh.kumar@linux.ibm.com>
References: <20230724190759.483013-1-aneesh.kumar@linux.ibm.com>
 <20230724190759.483013-11-aneesh.kumar@linux.ibm.com>
Date: Thu, 27 Jul 2023 10:36:45 +0530
Message-ID: <87edkuvt7e.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xHn9Uh0XayuDHJYGfvdcWpFLAz4HNTdQ
X-Proofpoint-ORIG-GUID: _cL_E65yOdvgMaTZOEy15pxCaHBE8O9Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307270046
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


From 9125b1815758ab3b83966aeead6f486c0708ea73 Mon Sep 17 00:00:00 2001
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Thu, 27 Jul 2023 10:02:37 +0530
Subject: [PATCH] powerpc/mm: Fix section mismatch warning

remove_pte_table is only called from remove_pmd_table which is marked
__meminit. These functions are used only during memory hotplug and they
also call functions marked __meminit. Mark remove_pte_table also with
__meminit so that we can avoid the section mismatch warning below.

WARNING: modpost: vmlinux: section mismatch in reference: remove_pte_table+0x230 (section: .text.remove_pte_table) -> free_vmemmap_pages (section: .meminit.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_pte_table+0x43c (section: .text.remove_pte_table) -> vmemmap_populated (section: .meminit.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_pte_table+0x4a4 (section: .text.remove_pte_table) -> free_vmemmap_pages (section: .meminit.text)

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 53f8340e390c..6d04dd579d03 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -793,9 +793,9 @@ static void __meminit free_vmemmap_pages(struct page *page,
 		free_pages((unsigned long)page_address(page), order);
 }
 
-static void remove_pte_table(pte_t *pte_start, unsigned long addr,
-			     unsigned long end, bool direct,
-			     struct vmem_altmap *altmap)
+static void __meminit remove_pte_table(pte_t *pte_start, unsigned long addr,
+				       unsigned long end, bool direct,
+				       struct vmem_altmap *altmap)
 {
 	unsigned long next, pages = 0;
 	pte_t *pte;
-- 
2.41.0

