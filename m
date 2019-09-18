Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD0DB659A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 16:13:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YMQm2pyyzDrQW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 00:13:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YM8x01l6zF39l
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 00:01:36 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8IDvJ9m127888; Wed, 18 Sep 2019 10:01:14 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v3m8gmn9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Sep 2019 10:01:12 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8IDtcio023019;
 Wed, 18 Sep 2019 14:01:11 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 2v37jvnrgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Sep 2019 14:01:11 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8IE19fI14615532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2019 14:01:09 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2411012405E;
 Wed, 18 Sep 2019 14:01:09 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAFD7124055;
 Wed, 18 Sep 2019 14:01:07 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.34.110])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 18 Sep 2019 14:01:07 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/book3s64/radix: Avoid WARN_ON in destroy_context
Date: Wed, 18 Sep 2019 19:31:03 +0530
Message-Id: <20190918140103.24395-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-18_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=4 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=812 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909180141
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 "Priya M . A" <priyama2@in.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On failed task initialization due to memory allocation failures,
we can call into destroy_context with process_tb entry set. This patch
forces the process_tb entry to zero in destroy_context. With
this patch, we lose the ability to track if we are destroying a context
without flushing the process table entry.

 WARNING: CPU: 4 PID: 6368 at arch/powerpc/mm/mmu_context_book3s64.c:246 destroy_context+0x58/0x340
 NIP [c0000000000875f8] destroy_context+0x58/0x340
 LR [c00000000013da18] __mmdrop+0x78/0x270
 Call Trace:
 [c000000f7db77c80] [c00000000013da18] __mmdrop+0x78/0x270
 [c000000f7db77cf0] [c0000000004d6a34] __do_execve_file.isra.13+0xbd4/0x1000
 [c000000f7db77e00] [c0000000004d7428] sys_execve+0x58/0x70
 [c000000f7db77e30] [c00000000000b388] system_call+0x5c/0x70

Reported-by: Priya M.A <priyama2@in.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/mmu_context.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
index 2d0cb5ba9a47..3a0f5ab190ec 100644
--- a/arch/powerpc/mm/book3s64/mmu_context.c
+++ b/arch/powerpc/mm/book3s64/mmu_context.c
@@ -256,8 +256,18 @@ void destroy_context(struct mm_struct *mm)
 #ifdef CONFIG_SPAPR_TCE_IOMMU
 	WARN_ON_ONCE(!list_empty(&mm->context.iommu_group_mem_list));
 #endif
+	/* For tasks which were successfully initialized we would end up
+	 * calling arch_exit_mmap which clears the process table entry.
+	 * arch_exit_mmap get called before the required fullmm tlb flush
+	 * which does a RIC=2 flush. Hence for an initialized task, we do
+	 * clear any cached process table entry. The condition below handles
+	 * the error case during task init. We do set the process table entry
+	 * early and if we fail a task initialization, we need to ensure
+	 * the process table entry is zeroed. We need not worry about process
+	 * table entry caches because the task never ran with the PID value.
+	 */
 	if (radix_enabled())
-		WARN_ON(process_tb[mm->context.id].prtb0 != 0);
+		process_tb[mm->context.id].prtb0 = 0;
 	else
 		subpage_prot_free(mm);
 	destroy_contexts(&mm->context);
-- 
2.21.0

