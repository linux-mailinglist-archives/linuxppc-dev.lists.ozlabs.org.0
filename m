Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 381DA388C07
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 12:50:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlV4t0vz1z3bs3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 20:50:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fgOeaCdy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fgOeaCdy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlV2P58f1z3021
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 20:47:57 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14JAXMbg060942; Wed, 19 May 2021 06:47:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pck/0HzqIqFKP2DtlKubg3MXM1ejDFgg5K/mi4qw9bA=;
 b=fgOeaCdyp8tDl5Ud+4Musn9aK/MK5BvC/kMZIclH2YV0OZCJ0S16w1b9pvIhSFweQrK5
 YsZemIQ+Z/84HgYEIWNx+wThemli8RKAAh54WKEnI4Lq20yvqCZ48r/Surr2NURAZ85h
 K/Aquw/4T4YxyvZm1Y8DrSgwj2J1bscnOu4w63IhqAdnW7i27CuuPm8IANbIudElTbvT
 K1/2k8g5iTV1j4QXnC5pxIQFSHFCur6E+VIK/MhgdPwFLHn6aTQ9yG6zIpYNXn3SR8lP
 FC54i2QqIx0LXGHlafoFFiZf8IdtdcejRjolEFpEJxPKln8qlpvFBYzqpMgRYFjQtfRP /A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38n0s18q8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 06:47:49 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14JAYsND068883;
 Wed, 19 May 2021 06:47:49 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38n0s18q86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 06:47:49 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14JATFBo030323;
 Wed, 19 May 2021 10:47:47 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 38j5x894dr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 10:47:47 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 14JAlHHG37487014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 10:47:17 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E097DA404D;
 Wed, 19 May 2021 10:47:44 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E71CFA4051;
 Wed, 19 May 2021 10:47:42 +0000 (GMT)
Received: from naverao1-tp.in.ibm.com (unknown [9.85.72.228])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 May 2021 10:47:42 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jordan Niethe <jniethe5@gmail.com>
Subject: [PATCH 4/5] powerpc/kprobes: Refactor arch_prepare_kprobe()
Date: Wed, 19 May 2021 16:17:20 +0530
Message-Id: <6a532d967b1263d463c2413fd647a173453bdc15.1621416666.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1621416666.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1621416666.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Lu0yLH8uIzRltWn5CDb05hRpgZx_Wqpc
X-Proofpoint-GUID: jUMgmy0dr2oTRcZhIz-SDgs-a7LI3AEJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-19_04:2021-05-19,
 2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=984
 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105190072
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clean up the function to look sane:
- return immediately on error, rather than pointlessly setting the
  return value
- pr_info() instead of printk()
- check return value of patch_instruction()
- and to top it all of: a reverse christmas tree!

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/kprobes.c | 64 +++++++++++++++++------------------
 1 file changed, 31 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index bbef9e918ecb39..7195162362941f 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -105,56 +105,54 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
 
 int arch_prepare_kprobe(struct kprobe *p)
 {
-	int ret = 0;
+	struct ppc_inst insn = ppc_inst_read((struct ppc_inst *)p->addr);
+	struct instruction_op op;
 	struct kprobe *prev;
 	struct pt_regs regs;
-	struct instruction_op op;
-	struct ppc_inst insn = ppc_inst_read((struct ppc_inst *)p->addr);
+	int ret = 0;
 
 	if ((unsigned long)p->addr & 0x03) {
-		printk("Attempt to register kprobe at an unaligned address\n");
-		ret = -EINVAL;
+		pr_info("Attempt to register kprobe at an unaligned address\n");
+		return -EINVAL;
 	} else if (IS_MTMSRD(insn) || IS_RFID(insn)) {
-		printk("Cannot register a kprobe on mtmsr[d]/rfi[d]\n");
-		ret = -EINVAL;
+		pr_info("Cannot register a kprobe on mtmsr[d]/rfi[d]\n");
+		return -EINVAL;
 	} else if ((unsigned long)p->addr & ~PAGE_MASK &&
 			ppc_inst_prefixed(ppc_inst_read((struct ppc_inst *)(p->addr - 1)))) {
-		printk("Cannot register a kprobe on the second word of prefixed instruction\n");
-		ret = -EINVAL;
+		pr_info("Cannot register a kprobe on the second word of prefixed instruction\n");
+		return -EINVAL;
 	}
+
+	/* Check if the previous instruction is a prefix instruction with an active kprobe */
 	preempt_disable();
 	prev = get_kprobe(p->addr - 1);
 	preempt_enable_no_resched();
-	if (prev &&
-	    ppc_inst_prefixed(ppc_inst_read((struct ppc_inst *)prev->ainsn.insn))) {
-		printk("Cannot register a kprobe on the second word of prefixed instruction\n");
-		ret = -EINVAL;
+	if (prev && ppc_inst_prefixed(ppc_inst_read((struct ppc_inst *)prev->ainsn.insn))) {
+		pr_info("Cannot register a kprobe on the second word of prefixed instruction\n");
+		return -EINVAL;
 	}
 
 	/* insn must be on a special executable page on ppc64.  This is
 	 * not explicitly required on ppc32 (right now), but it doesn't hurt */
-	if (!ret) {
-		p->ainsn.insn = get_insn_slot();
-		if (!p->ainsn.insn)
-			ret = -ENOMEM;
-	}
+	p->ainsn.insn = get_insn_slot();
+	if (!p->ainsn.insn)
+		return -ENOMEM;
 
-	if (!ret) {
-		patch_instruction((struct ppc_inst *)p->ainsn.insn, insn);
-		p->opcode = ppc_inst_val(insn);
-
-		/* Check if this is an instruction we recognise */
-		p->ainsn.boostable = 0;
-		memset(&regs, 0, sizeof(struct pt_regs));
-		regs.nip = (unsigned long)p->addr;
-		regs.msr = MSR_KERNEL;
-		ret = analyse_instr(&op, &regs, insn);
-		if (ret == 1 || (ret == 0 && GETTYPE(op.type) != UNKNOWN))
-			p->ainsn.boostable = 1;
-		ret = 0;
-	}
+	if (patch_instruction((struct ppc_inst *)p->ainsn.insn, insn))
+		return -EFAULT;
 
-	return ret;
+	p->opcode = ppc_inst_val(insn);
+
+	/* Check if this is an instruction we recognise */
+	p->ainsn.boostable = 0;
+	memset(&regs, 0, sizeof(struct pt_regs));
+	regs.nip = (unsigned long)p->addr;
+	regs.msr = MSR_KERNEL;
+	ret = analyse_instr(&op, &regs, insn);
+	if (ret == 1 || (ret == 0 && GETTYPE(op.type) != UNKNOWN))
+		p->ainsn.boostable = 1;
+
+	return 0;
 }
 NOKPROBE_SYMBOL(arch_prepare_kprobe);
 
-- 
2.30.2

