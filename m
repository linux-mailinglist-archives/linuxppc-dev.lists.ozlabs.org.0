Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBA01C9028
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 16:41:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Hx3L31bGzDqF1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 00:41:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HwgF2XJhzDqbf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 00:23:36 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 047E6kGE119956; Thu, 7 May 2020 10:23:30 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30sp8n2vc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 May 2020 10:23:29 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 047EMXSb011028;
 Thu, 7 May 2020 14:23:29 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 30s0g74xnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 May 2020 14:23:29 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 047ENSvx52691382
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 May 2020 14:23:28 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B32012405B;
 Thu,  7 May 2020 14:23:28 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9BA212405A;
 Thu,  7 May 2020 14:23:26 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.52.212])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  7 May 2020 14:23:26 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 2/3] powerpc: Fix instruction dumping to use address value
 correctly
Date: Thu,  7 May 2020 19:53:15 +0530
Message-Id: <20200507142316.265457-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507142316.265457-1-aneesh.kumar@linux.ibm.com>
References: <20200507142316.265457-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-07_09:2020-05-07,
 2020-05-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 mlxlogscore=924 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005070114
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

Avoid updating address value in the loop. If in real mode, convert the address
outside the loop. Also, use ___va() to convert the real address that will
skip the input validation. We can get interrupts with IR=0 and with NIP
value > PAGE_OFFSET.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/processor.h |  9 +++++++++
 arch/powerpc/kernel/process.c        | 18 ++++++++++--------
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 591987da44e2..4e7a5adc04df 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -436,6 +436,15 @@ extern void cvt_fd(float *from, double *to);
 extern void cvt_df(double *from, float *to);
 extern void _nmask_and_or_msr(unsigned long nmask, unsigned long or_val);
 
+static inline unsigned long fixup_real_addr(struct pt_regs *regs,
+					    unsigned long addr)
+{
+	if (!(regs->msr & MSR_IR))
+		return (unsigned long)___va(addr);
+
+	return addr;
+}
+
 #ifdef CONFIG_PPC64
 /*
  * We handle most unaligned accesses in hardware. On the other hand 
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 682deeee421f..36cc03c33d25 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1238,29 +1238,31 @@ struct task_struct *__switch_to(struct task_struct *prev,
 static void show_instructions(struct pt_regs *regs)
 {
 	int i;
+	unsigned long nip = regs->nip;
 	unsigned long pc = regs->nip - (NR_INSN_TO_PRINT * 3 / 4 * sizeof(int));
 
 	printk("Instruction dump:");
 
+
+#if !defined(CONFIG_BOOKE)
+	/* If executing with the IMMU off, adjust pc rather
+	 * than print XXXXXXXX.
+	 */
+	pc = fixup_real_addr(regs, pc);
+	nip = fixup_real_addr(regs, nip);
+#endif
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

