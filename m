Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9405AFEDE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 10:20:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMwDp4M1Yz3bkR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 18:20:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jPxrhaSh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jPxrhaSh;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMwD8704Xz2xdQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 18:20:08 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2878G76Q013814;
	Wed, 7 Sep 2022 08:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=oms9dk9bKFuSX7t/LGOVMvenXX8N1bQOs0KFHJ8/Lbk=;
 b=jPxrhaShK7U2qcV+NJI60XDCy/vzTpLSraJM5bOVv8rY3/RvFOTgYUTir/MhNbmxWuhH
 KrI65kXO9e3QGt7sRztKRqslK226eAq1Z6a5nB1+EzWIZ/pySohj2xSdauGYDZJt1y2H
 fP3vXWtQKKJzdl9ify4AqTQzugVAAXvYCsSsYgjNVwyR/HERAUm3O0dxgQ2bekLifsN4
 4QogEyrdHzZw4HExNdJlUG5f2XxbTAvz/KiyuFg7XWi3vMOVTfif687rn2gJqMQUuyxv
 WBxul+LVC+WLvvc8hra8nzMlxM0larkFLFfviYIIyvQzapxTGKGTm55rVWeGeRjMVM+9 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jeqn08351-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Sep 2022 08:20:02 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2878Gkg8016616;
	Wed, 7 Sep 2022 08:20:01 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jeqn0834k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Sep 2022 08:20:01 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28785ae5005398;
	Wed, 7 Sep 2022 08:20:00 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by ppma04dal.us.ibm.com with ESMTP id 3jbxj9xsha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Sep 2022 08:20:00 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2878K0fY3932848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Sep 2022 08:20:00 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17C38AC05B;
	Wed,  7 Sep 2022 08:20:00 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 732E3AC059;
	Wed,  7 Sep 2022 08:19:58 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.98.238])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Wed,  7 Sep 2022 08:19:58 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com
Subject: [PATCH] powerpc/mm/book3s/hash: Rename flush_tlb_pmd_range
Date: Wed,  7 Sep 2022 13:49:41 +0530
Message-Id: <20220907081941.209501-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0eJUzQoT4EL9A27iHA0sjVbVsNfPghWZ
X-Proofpoint-ORIG-GUID: Mv894VBhuSw3m_b57O1U4KOCK3EEGK9-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_04,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=866 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209070034
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This function does the hash page table update. Hence rename it to
indicate this better to avoid confusion with flush_pmd_tlb_range()

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 5 ++---
 arch/powerpc/mm/book3s64/hash_pgtable.c            | 2 +-
 arch/powerpc/mm/book3s64/hash_tlb.c                | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index 8b762f282190..fd30fa20c392 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -112,13 +112,12 @@ static inline void hash__flush_tlb_kernel_range(unsigned long start,
 
 struct mmu_gather;
 extern void hash__tlb_flush(struct mmu_gather *tlb);
-void flush_tlb_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long addr);
 
 #ifdef CONFIG_PPC_64S_HASH_MMU
 /* Private function for use by PCI IO mapping code */
 extern void __flush_hash_table_range(unsigned long start, unsigned long end);
-extern void flush_tlb_pmd_range(struct mm_struct *mm, pmd_t *pmd,
-				unsigned long addr);
+extern void flush_hash_table_pmd_range(struct mm_struct *mm, pmd_t *pmd,
+				       unsigned long addr);
 #else
 static inline void __flush_hash_table_range(unsigned long start, unsigned long end) { }
 #endif
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index ae008b9df0e6..f30131933a01 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -256,7 +256,7 @@ pmd_t hash__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long addres
 	 * the __collapse_huge_page_copy can result in copying
 	 * the old content.
 	 */
-	flush_tlb_pmd_range(vma->vm_mm, &pmd, address);
+	flush_hash_table_pmd_range(vma->vm_mm, &pmd, address);
 	return pmd;
 }
 
diff --git a/arch/powerpc/mm/book3s64/hash_tlb.c b/arch/powerpc/mm/book3s64/hash_tlb.c
index eb0bccaf221e..a64ea0a7ef96 100644
--- a/arch/powerpc/mm/book3s64/hash_tlb.c
+++ b/arch/powerpc/mm/book3s64/hash_tlb.c
@@ -221,7 +221,7 @@ void __flush_hash_table_range(unsigned long start, unsigned long end)
 	local_irq_restore(flags);
 }
 
-void flush_tlb_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long addr)
+void flush_hash_table_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long addr)
 {
 	pte_t *pte;
 	pte_t *start_pte;
-- 
2.37.3

