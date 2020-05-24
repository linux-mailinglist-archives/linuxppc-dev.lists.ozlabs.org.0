Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D366C1DFDFE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 May 2020 11:40:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49VFZ86s7XzDqW8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 May 2020 19:40:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49VFXY5HB0zDqQm
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 19:38:37 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04O9V6XE034109; Sun, 24 May 2020 05:38:32 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 316wethdty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 24 May 2020 05:38:32 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04O9ZGp0013771;
 Sun, 24 May 2020 09:38:31 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 316uf97u35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 24 May 2020 09:38:31 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04O9cS5d10748572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 24 May 2020 09:38:29 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07B0F6A04F;
 Sun, 24 May 2020 09:38:30 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 115AB6A04D;
 Sun, 24 May 2020 09:38:27 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.75.35])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 24 May 2020 09:38:27 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 1/4] powerpc/instruction_dump: Fix kernel crash with
 show_instructions
Date: Sun, 24 May 2020 15:08:19 +0530
Message-Id: <20200524093822.423487-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-23_14:2020-05-22,
 2020-05-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=841 priorityscore=1501 clxscore=1015
 suspectscore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005240078
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With Hard Lockup watchdog, we can hit a BUG() if we take a watchdog
interrupt when in OPAL mode. This happens in show_instructions()
where the kernel takes the watchdog NMI IPI with MSR_IR == 0.
With that show_instructions() updates the variable pc in the loop
and the second iterations will result in BUG().

We hit the BUG_ON due the below check in  __va()

 #define __va(x)								\
({									\
	VIRTUAL_BUG_ON((unsigned long)(x) >= PAGE_OFFSET);		\
	(void *)(unsigned long)((phys_addr_t)(x) | PAGE_OFFSET);	\
})

Fixes: 4dd7554a6456 ("powerpc/64: Add VIRTUAL_BUG_ON checks for __va and __pa addresses")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/kernel/process.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 048d64c4e115..93bf4a766707 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1253,29 +1253,32 @@ struct task_struct *__switch_to(struct task_struct *prev,
 static void show_instructions(struct pt_regs *regs)
 {
 	int i;
+	unsigned long nip = regs->nip;
 	unsigned long pc = regs->nip - (NR_INSN_TO_PRINT * 3 / 4 * sizeof(int));
 
 	printk("Instruction dump:");
 
+#if !defined(CONFIG_BOOKE)
+	/* If executing with the IMMU off, adjust pc rather
+	 * than print XXXXXXXX.
+	 */
+	if (!(regs->msr & MSR_IR)) {
+		pc = (unsigned long)phys_to_virt(pc);
+		nip = (unsigned long)phys_to_virt(regs->nip);
+	}
+#endif
+
 	for (i = 0; i < NR_INSN_TO_PRINT; i++) {
 		int instr;
 
 		if (!(i % 8))
 			pr_cont("\n");
 
-#if !defined(CONFIG_BOOKE)
-		/* If executing with the IMMU off, adjust pc rather
-		 * than print XXXXXXXX.
-		 */
-		if (!(regs->msr & MSR_IR))
-			pc = (unsigned long)phys_to_virt(pc);
-#endif
-
 		if (!__kernel_text_address(pc) ||
 		    probe_kernel_address((const void *)pc, instr)) {
 			pr_cont("XXXXXXXX ");
 		} else {
-			if (regs->nip == pc)
+			if (nip == pc)
 				pr_cont("<%08x> ", instr);
 			else
 				pr_cont("%08x ", instr);
-- 
2.26.2

