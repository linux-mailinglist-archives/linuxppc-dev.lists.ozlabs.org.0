Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1B8388BFE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 12:49:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlV4D16nxz30Dv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 20:49:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y5OmaGEI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Y5OmaGEI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlV2N0Vhmz2yxF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 20:47:55 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14JAXftv068459; Wed, 19 May 2021 06:47:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HI1xUJik1hHlw8w5Q4QEE4Nfy9BYztB9ZHbmpRXmDvs=;
 b=Y5OmaGEIlfN4AFDlf1R7fA+XIOB6O/kr7sypn0zVystweO2o4vwxM+syqdhIM8f9a4Xa
 9OwYvstlMuiAMk8mqsfHskUB0ca4zUIu8FN4bm7LAIqkJWdxO6WKCx02z6N0c6HMW3Dv
 tVUMdqZnBm1WlIvJJtOvTEK6UPNB0ov1s6wlfYiS6RLQqtbwsUaYhbIQlN7vlzrisjZN
 BH0pYA9I/CjsQ6ojfospaAT5oExSioXvkXpowNkTKQloZ/BmuOG0YlDMsYNuMXBbdFAs
 /sWWOLlYi5vQKGmqGdfRBBzJ2VNy1GiMyame0B8hFGtC43XUqRFRJWrZx3pFrq/S8Nwt fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38n0wdgj4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 06:47:47 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14JAXua5070374;
 Wed, 19 May 2021 06:47:47 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38n0wdgj40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 06:47:46 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14JAS6pp003771;
 Wed, 19 May 2021 10:47:44 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 38j5x7t1wy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 10:47:44 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14JAlgZb61604124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 10:47:42 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88F88A404D;
 Wed, 19 May 2021 10:47:42 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0E57A405B;
 Wed, 19 May 2021 10:47:40 +0000 (GMT)
Received: from naverao1-tp.in.ibm.com (unknown [9.85.72.228])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 May 2021 10:47:40 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jordan Niethe <jniethe5@gmail.com>
Subject: [PATCH 3/5] powerpc/kprobes: Check instruction validity during kprobe
 registration
Date: Wed, 19 May 2021 16:17:19 +0530
Message-Id: <f033696e8ac89a7cba2c336680dfb67911c643bd.1621416666.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1621416666.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1621416666.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VNBVjxBiF89WbrQr-xt5RO7vx6JqncMI
X-Proofpoint-GUID: 38QGrJpPKqbWB4HEF2InaBSe7u61zfps
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-19_04:2021-05-19,
 2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105190072
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

In trap-based (classic) kprobes, we try to emulate the probed
instruction so as to avoid having to single step it. We use a flag to
determine if the probed instruction was successfully emulated, so that we
can speed up subsequent probe hits.

However, emulate_step() doesn't differentiate between unknown
instructions and an emulation attempt that failed. As such, the current
heuristic is not of much use. Instead, use analyse_instr() during kprobe
registration to determine if the probed instruction can be decoded by
our instruction emulation infrastructure. For unknown instructions, we
can then directly single-step while for other instructions, we can
attempt to emulate and fall back to single stepping if that fails.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/kprobes.c | 62 +++++++++--------------------------
 1 file changed, 16 insertions(+), 46 deletions(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index b7b20875d34d91..bbef9e918ecb39 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -107,6 +107,8 @@ int arch_prepare_kprobe(struct kprobe *p)
 {
 	int ret = 0;
 	struct kprobe *prev;
+	struct pt_regs regs;
+	struct instruction_op op;
 	struct ppc_inst insn = ppc_inst_read((struct ppc_inst *)p->addr);
 
 	if ((unsigned long)p->addr & 0x03) {
@@ -140,9 +142,18 @@ int arch_prepare_kprobe(struct kprobe *p)
 	if (!ret) {
 		patch_instruction((struct ppc_inst *)p->ainsn.insn, insn);
 		p->opcode = ppc_inst_val(insn);
+
+		/* Check if this is an instruction we recognise */
+		p->ainsn.boostable = 0;
+		memset(&regs, 0, sizeof(struct pt_regs));
+		regs.nip = (unsigned long)p->addr;
+		regs.msr = MSR_KERNEL;
+		ret = analyse_instr(&op, &regs, insn);
+		if (ret == 1 || (ret == 0 && GETTYPE(op.type) != UNKNOWN))
+			p->ainsn.boostable = 1;
+		ret = 0;
 	}
 
-	p->ainsn.boostable = 0;
 	return ret;
 }
 NOKPROBE_SYMBOL(arch_prepare_kprobe);
@@ -225,47 +236,6 @@ void arch_prepare_kretprobe(struct kretprobe_instance *ri, struct pt_regs *regs)
 }
 NOKPROBE_SYMBOL(arch_prepare_kretprobe);
 
-static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
-{
-	int ret;
-	struct ppc_inst insn = ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
-
-	/* regs->nip is also adjusted if emulate_step returns 1 */
-	ret = emulate_step(regs, insn);
-	if (ret > 0) {
-		/*
-		 * Once this instruction has been boosted
-		 * successfully, set the boostable flag
-		 */
-		if (unlikely(p->ainsn.boostable == 0))
-			p->ainsn.boostable = 1;
-	} else if (ret < 0) {
-		/*
-		 * We don't allow kprobes on mtmsr(d)/rfi(d), etc.
-		 * So, we should never get here... but, its still
-		 * good to catch them, just in case...
-		 */
-		printk("Can't step on instruction %s\n", ppc_inst_as_str(insn));
-		BUG();
-	} else {
-		/*
-		 * If we haven't previously emulated this instruction, then it
-		 * can't be boosted. Note it down so we don't try to do so again.
-		 *
-		 * If, however, we had emulated this instruction in the past,
-		 * then this is just an error with the current run (for
-		 * instance, exceptions due to a load/store). We return 0 so
-		 * that this is now single-stepped, but continue to try
-		 * emulating it in subsequent probe hits.
-		 */
-		if (unlikely(p->ainsn.boostable != 1))
-			p->ainsn.boostable = -1;
-	}
-
-	return ret;
-}
-NOKPROBE_SYMBOL(try_to_emulate);
-
 int kprobe_handler(struct pt_regs *regs)
 {
 	struct kprobe *p;
@@ -334,8 +304,8 @@ int kprobe_handler(struct pt_regs *regs)
 		set_current_kprobe(p, regs, kcb);
 		kprobes_inc_nmissed_count(p);
 		kcb->kprobe_status = KPROBE_REENTER;
-		if (p->ainsn.boostable >= 0) {
-			ret = try_to_emulate(p, regs);
+		if (p->ainsn.boostable) {
+			ret = emulate_step(regs, ppc_inst_read((struct ppc_inst *)p->ainsn.insn));
 
 			if (ret > 0) {
 				restore_previous_kprobe(kcb);
@@ -356,8 +326,8 @@ int kprobe_handler(struct pt_regs *regs)
 		return 1;
 	}
 
-	if (p->ainsn.boostable >= 0) {
-		ret = try_to_emulate(p, regs);
+	if (p->ainsn.boostable) {
+		ret = emulate_step(regs, ppc_inst_read((struct ppc_inst *)p->ainsn.insn));
 
 		if (ret > 0) {
 			if (p->post_handler)
-- 
2.30.2

