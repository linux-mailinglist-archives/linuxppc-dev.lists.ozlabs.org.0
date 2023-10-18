Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E567CD34E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 06:56:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d1X2UiNx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9JTx18fSz3cDr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 15:56:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d1X2UiNx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9JT21vlHz30GC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 15:55:49 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39I4fYcK008884;
	Wed, 18 Oct 2023 04:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=GpcH5PZS6ShuR6VGGU6csNNfTn1Vuyobt3fIQBPnkyY=;
 b=d1X2UiNxPK+/tGYSrxwtR44P3WgXlDcDyr/xmiUWhhfk4apVgHKVgwjBP5ZLGUkvzIXr
 LLETZCXMq9Yxl320nW2JIPrYgD0CYTfP60W+5gg2+/vYLxGf2hnts7ynXHFoY3WZNTCK
 IBqyT2SNsGFkPnhTBJt/wGfwh7WZ4Z6KfrfW5Hi5l52Iev6VE8fVcG2T0ioCcZJH9ZFQ
 IEaH9CmkNYVB3k4qwQXMlL4g+SSsv70GMSFe9DoQEw/TzqpzugSvFTBtAWdB8KqEU8sy
 f6GYrw/nTVEkMxMDLghIcKwPjQejmU7IpZzRgGKBjTgHx0X9gJqIFLWwGfq5AxKPhswG YA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tt8990mym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 04:55:39 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39I4p6dG002568;
	Wed, 18 Oct 2023 04:55:39 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tt8990my4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 04:55:38 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39I3IQki019713;
	Wed, 18 Oct 2023 04:55:38 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tr811nctd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 04:55:38 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39I4tb7K23200438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Oct 2023 04:55:37 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DB245803F;
	Wed, 18 Oct 2023 04:55:37 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A15458063;
	Wed, 18 Oct 2023 04:55:34 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.81.129])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Oct 2023 04:55:34 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH] powerpc/mm: Update set_ptes to call pte_filter for all the ptes
Date: Wed, 18 Oct 2023 10:25:23 +0530
Message-ID: <20231018045523.776679-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Wc4MdH6OA4atdYSHERr_01i4CaV2rS-n
X-Proofpoint-ORIG-GUID: vmbR8KdcEZHzW3V-9tzN4LrGkiSB7nJ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_02,2023-10-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 clxscore=1011 bulkscore=0 phishscore=0
 suspectscore=0 adultscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310180040
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, willy@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With commit 9fee28baa601 ("powerpc: implement the new page table range
API") we added set_ptes to powerpc architecture but the implementation
missed calling the pte filter for all the ptes we are setting in the
range. set_pte_filter can be used for filter pte values and on some
platforms which don't support coherent icache it clears the exec bit so
that we can flush the icache on exec fault

The patch also removes the usage of arch_enter/leave_lazy_mmu() because
set_pte is not supposed to be used when updating a pte entry. Powerpc
architecture uses this rule to skip the expensive tlb invalidate which
is not needed when you are setting up the pte for the first time. See
commit 56eecdb912b5 ("mm: Use ptep/pmdp_set_numa() for updating
_PAGE_NUMA bit") for more details

Fixes: 9fee28baa601 ("powerpc: implement the new page table range API")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/pgtable.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 3ba9fe411604..95ab20cca2da 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -191,28 +191,35 @@ void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 		pte_t pte, unsigned int nr)
 {
 	/*
-	 * Make sure hardware valid bit is not set. We don't do
-	 * tlb flush for this update.
+	 * We don't need to call arch_enter/leave_lazy_mmu_mode()
+	 * because we expect set_ptes to be only be used on not present
+	 * and not hw_valid ptes. Hence there is not translation cache flush
+	 * involved that need to be batched.
 	 */
-	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
+	for (;;) {
 
-	/* Note: mm->context.id might not yet have been assigned as
-	 * this context might not have been activated yet when this
-	 * is called.
-	 */
-	pte = set_pte_filter(pte);
+		/*
+		 * Make sure hardware valid bit is not set. We don't do
+		 * tlb flush for this update.
+		 */
+		VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
 
-	/* Perform the setting of the PTE */
-	arch_enter_lazy_mmu_mode();
-	for (;;) {
+		/* Note: mm->context.id might not yet have been assigned as
+		 * this context might not have been activated yet when this
+		 * is called.
+		 */
+		pte = set_pte_filter(pte);
+
+		/* Perform the setting of the PTE */
 		__set_pte_at(mm, addr, ptep, pte, 0);
 		if (--nr == 0)
 			break;
 		ptep++;
-		pte = __pte(pte_val(pte) + (1UL << PTE_RPN_SHIFT));
 		addr += PAGE_SIZE;
+		/* increment the pfn */
+		pte = __pte(pte_val(pte) + PAGE_SIZE);
+
 	}
-	arch_leave_lazy_mmu_mode();
 }
 
 void unmap_kernel_page(unsigned long va)
-- 
2.41.0

