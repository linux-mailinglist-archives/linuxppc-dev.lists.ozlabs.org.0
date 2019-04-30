Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 325B7F1BB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 10:01:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tYr522nszDqST
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 18:01:09 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tYpH72XQzDqPP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 17:59:35 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3U7phNH155576; Tue, 30 Apr 2019 03:59:25 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2s6hjdt351-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Apr 2019 03:59:24 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x3U23GVl007646;
 Tue, 30 Apr 2019 02:03:16 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 2s4eq3s7eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Apr 2019 02:03:16 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3U7xMD862914662
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 07:59:22 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D7B87805F;
 Tue, 30 Apr 2019 07:59:22 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF93D7805C;
 Tue, 30 Apr 2019 07:59:17 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.121.214])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 30 Apr 2019 07:59:17 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/mm/radix: Fix kernel crash when running subpage
 protect test
Date: Tue, 30 Apr 2019 13:29:07 +0530
Message-Id: <20190430075907.7701-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904300054
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

This patch fixes the below crash by making sure we touch the subpage protection
related structures only if we know they are allocated on the platform. With
radix translation we don't allocate hash context at all and trying to access
subpage_prot_table results in

 Faulting instruction address: 0xc00000000008bdb4
 Oops: Kernel access of bad area, sig: 11 [#1]
 LE PAGE_SIZE=64K MMU=Radix MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
 ....
 NIP [c00000000008bdb4] sys_subpage_prot+0x74/0x590
 LR [c00000000000b688] system_call+0x5c/0x70
 Call Trace:
 [c00020002c6b7d30] [c00020002c6b7d90] 0xc00020002c6b7d90 (unreliable)
 [c00020002c6b7e20] [c00000000000b688] system_call+0x5c/0x70
 Instruction dump:
 fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f821ff11 e92d1178 f9210068
 39200000 e92d0968 ebe90630 e93f03e8 <eb891038> 60000000 3860fffe e9410068

We also move the subpage_prot_table with mmp_sem held to avoid racec
between two parallel subpage_prot syscall.

Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/subpage-prot.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/subpage-prot.c b/arch/powerpc/mm/subpage-prot.c
index c9dff4e1f295..473dd430e306 100644
--- a/arch/powerpc/mm/subpage-prot.c
+++ b/arch/powerpc/mm/subpage-prot.c
@@ -90,16 +90,18 @@ static void hpte_flush_range(struct mm_struct *mm, unsigned long addr,
 static void subpage_prot_clear(unsigned long addr, unsigned long len)
 {
 	struct mm_struct *mm = current->mm;
-	struct subpage_prot_table *spt = mm_ctx_subpage_prot(&mm->context);
+	struct subpage_prot_table *spt;
 	u32 **spm, *spp;
 	unsigned long i;
 	size_t nw;
 	unsigned long next, limit;
 
+	down_write(&mm->mmap_sem);
+
+	spt = mm_ctx_subpage_prot(&mm->context);
 	if (!spt)
-		return ;
+		goto err_out;
 
-	down_write(&mm->mmap_sem);
 	limit = addr + len;
 	if (limit > spt->maxaddr)
 		limit = spt->maxaddr;
@@ -127,6 +129,8 @@ static void subpage_prot_clear(unsigned long addr, unsigned long len)
 		/* now flush any existing HPTEs for the range */
 		hpte_flush_range(mm, addr, nw);
 	}
+
+err_out:
 	up_write(&mm->mmap_sem);
 }
 
@@ -189,7 +193,7 @@ SYSCALL_DEFINE3(subpage_prot, unsigned long, addr,
 		unsigned long, len, u32 __user *, map)
 {
 	struct mm_struct *mm = current->mm;
-	struct subpage_prot_table *spt = mm_ctx_subpage_prot(&mm->context);
+	struct subpage_prot_table *spt;
 	u32 **spm, *spp;
 	unsigned long i;
 	size_t nw;
@@ -219,6 +223,7 @@ SYSCALL_DEFINE3(subpage_prot, unsigned long, addr,
 
 	down_write(&mm->mmap_sem);
 
+	spt = mm_ctx_subpage_prot(&mm->context);
 	if (!spt) {
 		/*
 		 * Allocate subpage prot table if not already done.
-- 
2.20.1

