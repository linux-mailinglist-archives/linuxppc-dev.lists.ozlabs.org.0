Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 731DE24A03C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 15:41:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWppF1w0rzDqvZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 23:41:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MBFUQ3Rq; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWp2V3ywvzDqts
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 23:06:42 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07JD4mWP147352; Wed, 19 Aug 2020 09:06:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JLWywUjS/+67SbhHMCFbphWRk1msvYeIOt1EvP/0J1s=;
 b=MBFUQ3RqlEF7I8EdzusxR+MWdr6Efh6jexw3zswEBX4IWmwAPwEpfK2JbOU3EV80pguP
 NoP/2Fz6wasU5YX17dHC9PFPYXZFbHyC8wVltUu6A4ytZIb1QHFXmlPmeXd1va6Vd1OS
 nhOqiuENA4csBfpU5K6zNaLr+Ym1Y0EaFEFCFdIsH9yOo29s53th++A31DNGSJYNYw28
 E9hC664pN2gROzznzyW+HD4lMNjigEdcqn2SY9bb9zGRU4eXNGXSnoWkz7sR9+OFeaz+
 A3B5lKM1Py/pNk0DGonN51oisqBfIc5ndNzMJofkYv27+EPxObumd7rGCeD30E5YhgZc Mw== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3304sxcq26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 09:06:28 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JD0WFo032462;
 Wed, 19 Aug 2020 13:01:57 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 3304tguyaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 13:01:57 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07JD1vJH53281184
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Aug 2020 13:01:57 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37053B205F;
 Wed, 19 Aug 2020 13:01:57 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5071BB2067;
 Wed, 19 Aug 2020 13:01:55 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.3.58])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 19 Aug 2020 13:01:54 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v2 13/13] mm/debug_vm_pgtable: populate a pte entry before
 fetching it
Date: Wed, 19 Aug 2020 18:31:07 +0530
Message-Id: <20200819130107.478414-14-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
References: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_04:2020-08-19,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=936 lowpriorityscore=0
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008190115
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pte_clear_tests operate on an existing pte entry. Make sure that is not a none
pte entry.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/debug_vm_pgtable.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 09ce9974c187..7d9f8e1d790f 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -531,7 +531,7 @@ static void __init pgd_populate_tests(struct mm_struct *mm, pgd_t *pgdp,
 static void __init pte_clear_tests(struct mm_struct *mm, pte_t *ptep,
 				   unsigned long vaddr)
 {
-	pte_t pte = ptep_get(ptep);
+	pte_t pte =  ptep_get_and_clear(mm, vaddr, ptep);
 
 	pr_debug("Validating PTE clear\n");
 	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
@@ -929,7 +929,7 @@ static int __init debug_vm_pgtable(void)
 	p4d_t *p4dp, *saved_p4dp;
 	pud_t *pudp, *saved_pudp;
 	pmd_t *pmdp, *saved_pmdp, pmd;
-	pte_t *ptep;
+	pte_t *ptep, pte;
 	pgtable_t saved_ptep;
 	pgprot_t prot, protnone;
 	phys_addr_t paddr;
@@ -1034,6 +1034,8 @@ static int __init debug_vm_pgtable(void)
 	 */
 
 	ptep = pte_alloc_map_lock(mm, pmdp, vaddr, &ptl);
+	pte = pfn_pte(pte_aligned, prot);
+	set_pte_at(mm, vaddr, ptep, pte);
 	pte_clear_tests(mm, ptep, vaddr);
 	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
 	pte_unmap_unlock(ptep, ptl);
-- 
2.26.2

