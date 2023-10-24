Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0F87D542C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 16:38:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hLeZcbf9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SFF640LHVz3cN4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Oct 2023 01:38:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hLeZcbf9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SFF5B0Gljz2xpd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Oct 2023 01:37:17 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39OEPMXS019888;
	Tue, 24 Oct 2023 14:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=WpY1biqPF84OgOTiznFBUuSH0gs7DxZ7U517/l1xF6M=;
 b=hLeZcbf9niDLPkYzM5g+f6Qh+7IbE68YtkiifZHyyzmTNaAsk4hUsCy0wrPjdCq24qtk
 ZFbcPx687PI4m2ZIjqJjyJyFtd458Xqj/6GlUV8wV05wThyDLsqwHpP7/dEr672x/zNf
 qntb/5WZx+JLVuhp33yKTPhF7cI+blFrt7sGgRLrznAzWlET4btGHtd4SHEFrFMhuuUv
 iaFdkiEgtnHzJcjqxUqXjUPGp4fkleHR8U7VJ5/WsuhweAO3msFwjJV0W53sOUQmaNB9
 e7r4Dw/1GL4b3Kcb2pDHFZD0rOxr3dVQSpFM8lJ/CQ+WJ8TpM++kPoHFY8Z0LRQNPnC8 eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3txfnu8pch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Oct 2023 14:36:58 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39OEQLLb022593;
	Tue, 24 Oct 2023 14:36:58 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3txfnu8pc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Oct 2023 14:36:58 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39ODPEcn010284;
	Tue, 24 Oct 2023 14:36:57 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tvsbyg60m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Oct 2023 14:36:57 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39OEavxd23265836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Oct 2023 14:36:57 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C37058054;
	Tue, 24 Oct 2023 14:36:57 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55C1A5805A;
	Tue, 24 Oct 2023 14:36:54 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.60.100])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Oct 2023 14:36:53 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v2] powerpc/mm: Avoid calling arch_enter/leave_lazy_mmu() in set_ptes
Date: Tue, 24 Oct 2023 20:06:04 +0530
Message-ID: <20231024143604.16749-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZNIHQ-ezz6ES3oDEhYqnAm0ssmQ8MFeH
X-Proofpoint-ORIG-GUID: WMN2SV16PpZrDSHRzQ_poATNIyypGT2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_14,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310240125
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
API") we added set_ptes to powerpc architecture. The implementation
included calling arch_enter/leave_lazy_mmu() calls.

The patch removes the usage of arch_enter/leave_lazy_mmu() because
set_pte is not supposed to be used when updating a pte entry. Powerpc
architecture uses this rule to skip the expensive tlb invalidate which
is not needed when you are setting up the pte for the first time. See
commit 56eecdb912b5 ("mm: Use ptep/pmdp_set_numa() for updating
_PAGE_NUMA bit") for more details

The patch also makes sure we are not using the interface to update a
valid/present pte entry by adding VM_WARN_ON check all the ptes we
are setting up. Furthermore, we add a comment to set_pte_filter to
clarify it can only update folio-related flags and cannot filter
pfn specific details in pte filtering.

Removal of arch_enter/leave_lazy_mmu() also will avoid nesting of
these functions that are not supported. For ex:

remap_pte_range()
  -> arch_enter_lazy_mmu()
  -> set_ptes()
      -> arch_enter_lazy_mmu()
      -> arch_leave_lazy_mmu()
  -> arch_leave_lazy_mmu()

Fixes: 9fee28baa601 ("powerpc: implement the new page table range API")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/pgtable.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 3ba9fe411604..4d69bfb9bc11 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -104,6 +104,8 @@ static pte_t set_pte_filter_hash(pte_t pte) { return pte; }
 /* Embedded type MMU with HW exec support. This is a bit more complicated
  * as we don't have two bits to spare for _PAGE_EXEC and _PAGE_HWEXEC so
  * instead we "filter out" the exec permission for non clean pages.
+ *
+ * This is also called once for the folio. So only work with folio->flags here.
  */
 static inline pte_t set_pte_filter(pte_t pte)
 {
@@ -190,29 +192,39 @@ static pte_t set_access_flags_filter(pte_t pte, struct vm_area_struct *vma,
 void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 		pte_t pte, unsigned int nr)
 {
-	/*
-	 * Make sure hardware valid bit is not set. We don't do
-	 * tlb flush for this update.
-	 */
-	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
 
 	/* Note: mm->context.id might not yet have been assigned as
 	 * this context might not have been activated yet when this
-	 * is called.
+	 * is called. Filter the pte value and use the filtered value
+	 * to setup all the ptes in the range.
 	 */
 	pte = set_pte_filter(pte);
 
-	/* Perform the setting of the PTE */
-	arch_enter_lazy_mmu_mode();
+	/*
+	 * We don't need to call arch_enter/leave_lazy_mmu_mode()
+	 * because we expect set_ptes to be only be used on not present
+	 * and not hw_valid ptes. Hence there is no translation cache flush
+	 * involved that need to be batched.
+	 */
 	for (;;) {
+
+		/*
+		 * Make sure hardware valid bit is not set. We don't do
+		 * tlb flush for this update.
+		 */
+		VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
+
+		/* Perform the setting of the PTE */
 		__set_pte_at(mm, addr, ptep, pte, 0);
 		if (--nr == 0)
 			break;
 		ptep++;
-		pte = __pte(pte_val(pte) + (1UL << PTE_RPN_SHIFT));
 		addr += PAGE_SIZE;
+		/*
+		 * increment the pfn.
+		 */
+		pte = pfn_pte(pte_pfn(pte) + 1, pte_pgprot((pte)));
 	}
-	arch_leave_lazy_mmu_mode();
 }
 
 void unmap_kernel_page(unsigned long va)
-- 
2.41.0

