Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EECC1C044
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 03:10:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45303F3LZWzDqHp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 11:10:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4530052qL2zDqGg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 11:07:16 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4E11aTt086903
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 21:07:13 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sfg4nqegg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 21:07:12 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Tue, 14 May 2019 02:07:12 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 May 2019 02:07:08 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4E15qhf13500556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 May 2019 01:05:52 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98D32B2064;
 Tue, 14 May 2019 01:05:52 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF36DB2067;
 Tue, 14 May 2019 01:05:50 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.80.221.111])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 14 May 2019 01:05:50 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/mm: Handle page table allocation failures
Date: Tue, 14 May 2019 06:35:43 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19051401-0040-0000-0000-000004EF402F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011094; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01202963; UDB=6.00631396; IPR=6.00983879; 
 MB=3.00026874; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-14 01:07:10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051401-0041-0000-0000-000008FB4DDA
Message-Id: <20190514010543.29896-1-aneesh.kumar@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-13_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=726 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905140005
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This fix the below crash that arise due to not handling page table allocation
failures while allocating hugetlb page table.

 BUG: Kernel NULL pointer dereference at 0x0000001c
 Faulting instruction address: 0xc000000001d1e58c
 Oops: Kernel access of bad area, sig: 11 [#1]
 LE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries

 CPU: 3 PID: 4635 Comm: futex_wake04 Tainted: G        W  O      5.1.0-next-20190507-autotest #1
 NIP:  c000000001d1e58c LR: c000000001d1e54c CTR: 0000000000000000
 REGS: c000000004937890 TRAP: 0300   Tainted: G        W  O       (5.1.0-next-20190507-autotest)
 MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 22424822  XER: 00000000
 CFAR: c00000000183e9e0 DAR: 000000000000001c DSISR: 40000000 IRQMASK: 0
 GPR00: c000000001901a80 c000000004937b20 c000000003938700 0000000000000000
 GPR04: 0000000000400cc0 000000000003efff 000000027966e000 c000000003ba8700
 GPR08: c000000003ba8700 000000000d601125 c000000003ba8700 0000000080000000
 GPR12: 0000000022424822 c00000001ecae280 0000000000000000 0000000000000000
 GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
 GPR20: 0000000000000018 c0000000039e2d30 c0000000039e2d28 c0000002762da460
 GPR24: 000000000000001c 0000000000000000 0000000000000001 c000000001901a80
 GPR28: 0000000000400cc0 0000000000000000 0000000000000000 0000000000400cc0
 NIP [c000000001d1e58c] kmem_cache_alloc+0xbc/0x5a0
 LR [c000000001d1e54c] kmem_cache_alloc+0x7c/0x5a0
 Call Trace:
  [c000000001c91150] __pud_alloc+0x160/0x200 (unreliable)
  [c000000001901a80] huge_pte_alloc+0x580/0x950
  [c000000001cf7910] hugetlb_fault+0x9a0/0x1250
  [c000000001c94a80] handle_mm_fault+0x490/0x4a0
  [c0000000018d529c] __do_page_fault+0x77c/0x1f00
  [c0000000018d6a48] do_page_fault+0x28/0x50
  [c00000000183b0d4] handle_page_fault+0x18/0x38

Fixes: e2b3d202d1db ("powerpc: Switch 16GB and 16MB explicit hugepages to a different page table format")
Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---

Note: I did add a recent commit for the Fixes tag. But in reality we never checked for page table
allocation failure there. If we want to go to that old commit, then we may need.

Fixes: a4fe3ce7699b ("powerpc/mm: Allow more flexible layouts for hugepage pagetables")

 arch/powerpc/mm/hugetlbpage.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index c5c9ff2d7afc..ae9d71da5219 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -130,6 +130,8 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, unsigned long addr, unsigned long sz
 	} else {
 		pdshift = PUD_SHIFT;
 		pu = pud_alloc(mm, pg, addr);
+		if (!pu)
+			return NULL;
 		if (pshift == PUD_SHIFT)
 			return (pte_t *)pu;
 		else if (pshift > PMD_SHIFT) {
@@ -138,6 +140,8 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, unsigned long addr, unsigned long sz
 		} else {
 			pdshift = PMD_SHIFT;
 			pm = pmd_alloc(mm, pu, addr);
+			if (!pm)
+				return NULL;
 			if (pshift == PMD_SHIFT)
 				/* 16MB hugepage */
 				return (pte_t *)pm;
@@ -154,12 +158,16 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, unsigned long addr, unsigned long sz
 	} else {
 		pdshift = PUD_SHIFT;
 		pu = pud_alloc(mm, pg, addr);
+		if (!pu)
+			return NULL;
 		if (pshift >= PUD_SHIFT) {
 			ptl = pud_lockptr(mm, pu);
 			hpdp = (hugepd_t *)pu;
 		} else {
 			pdshift = PMD_SHIFT;
 			pm = pmd_alloc(mm, pu, addr);
+			if (!pm)
+				return NULL;
 			ptl = pmd_lockptr(mm, pm);
 			hpdp = (hugepd_t *)pm;
 		}
-- 
2.21.0

