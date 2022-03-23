Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 829144E51A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 12:53:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNmvL35M0z30F2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 22:53:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j7qgUBBM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j7qgUBBM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNmtZ2zJdz2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Mar 2022 22:52:21 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22N9aLAq010524; 
 Wed, 23 Mar 2022 11:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6mf/Yn93etqYMoIshl9s+PYEO6J4gI7JEbEjuC1AcTY=;
 b=j7qgUBBMUr0z9xep8/vxwxJAJ6R8CSSUbhnPDRXbabgtiwodeGz+WFuaIpXw2K0fBVhO
 oVz5oIWgOzS0dnXFH6ab4InLPgV5HQemu7T7uJunQYY4ThR7+4GSfA2xOWUERUvHPaPG
 vSCsRzYEShAE7W49WCHv4LIKjgra6Y1GM9kPdbbmWMKox5DMPqcBzFUVjwNtBDkzqd6P
 rAwt5t3RKeT/pwrtiRCKbL7FF7GjkU1T87CuQwVNczB4yoU/DbeFfNb/QycUcCcRqxJg
 YZHq+s2YhHYl4PcAjux937Co84oUY4bEpOOnTNorHR5bYC8vwjxDdpi8gNXJ9cWhrz8N 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eywtc6eu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 11:52:14 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22NBMWYj028277;
 Wed, 23 Mar 2022 11:52:14 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eywtc6etd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 11:52:14 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22NBhBFl002730;
 Wed, 23 Mar 2022 11:52:12 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3ew6t90eun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 11:52:12 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22NBqAnk54526426
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 11:52:10 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F282C4C040;
 Wed, 23 Mar 2022 11:52:09 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 762DF4C050;
 Wed, 23 Mar 2022 11:52:08 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.106.108])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 23 Mar 2022 11:52:08 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/2] powerpc: Reject probes on instructions that can't be
 single stepped
Date: Wed, 23 Mar 2022 17:21:35 +0530
Message-Id: <e81779aa105d67799742c3e3f59075dce9f05cfb.1648030681.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1648030681.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1648030681.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xCzmLhwOwdbTrKxAbiOpJ_tDkFixbr3l
X-Proofpoint-GUID: OyRugh5Cw7XalZfaGwNnsoWvl4pO3PMn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-23_06,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=782 lowpriorityscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203230066
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

Per the ISA, a Trace interrupt is not generated for:
- [h|u]rfi[d]
- rfscv
- sc, scv, and Trap instructions that trap
- Power-Saving Mode instructions
- other instructions that cause interrupts (other than Trace interrupts)
- the first instructions of any interrupt handler (applies to Branch and Single Step tracing;
CIABR matches may still occur)
- instructions that are emulated by software

Add a helper to check for instructions belonging to the first four
categories above and to reject kprobes, uprobes and xmon breakpoints on
such instructions. We reject probing on instructions belonging to these
categories across all ISA versions and across both BookS and BookE.

For trap instructions, we can't know in advance if they can cause a
trap, and there is no good reason to allow probing on those. Also,
uprobes already refuses to probe trap instructions and kprobes does not
allow probes on trap instructions used for kernel warnings and bugs. As
such, stop allowing any type of probes/breakpoints on trap instruction
across uprobes, kprobes and xmon.

For some of the fp/altivec instructions that can generate an interrupt
and which we emulate in the kernel (altivec assist, for example), we
check and turn off single stepping in emulate_single_step().

Instructions generating a DSI are restarted and single stepping normally
completes once the instruction is completed.

In uprobes, if a single stepped instruction results in a non-fatal
signal to be delivered to the task, such signals are "delayed" until
after the instruction completes. For fatal signals, single stepping is
cancelled and the instruction restarted in-place so that core dump
captures proper addresses.

In kprobes, we do not allow probes on instructions having an extable
entry and we also do not allow probing interrupt vectors.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/probes.h | 55 +++++++++++++++++++++++++++++++
 arch/powerpc/kernel/kprobes.c     |  4 +--
 arch/powerpc/kernel/uprobes.c     |  5 +++
 arch/powerpc/xmon/xmon.c          | 11 +++----
 4 files changed, 67 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/probes.h b/arch/powerpc/include/asm/probes.h
index c5d984700d241a..21ab5b6256b590 100644
--- a/arch/powerpc/include/asm/probes.h
+++ b/arch/powerpc/include/asm/probes.h
@@ -31,6 +31,61 @@ typedef u32 ppc_opcode_t;
 #define MSR_SINGLESTEP	(MSR_SE)
 #endif
 
+static inline bool can_single_step(u32 inst)
+{
+	switch (inst >> 26) {
+	case 2:		/* tdi */
+		return false;
+	case 3:		/* twi */
+		return false;
+	case 17:	/* sc and scv */
+		return false;
+	case 19:
+		switch ((inst >> 1) & 0x3ff) {
+		case 18:	/* rfid */
+			return false;
+		case 38:	/* rfmci */
+			return false;
+		case 39:	/* rfdi */
+			return false;
+		case 50:	/* rfi */
+			return false;
+		case 51:	/* rfci */
+			return false;
+		case 82:	/* rfscv */
+			return false;
+		case 274:	/* hrfid */
+			return false;
+		case 306:	/* urfid */
+			return false;
+		case 370:	/* stop */
+			return false;
+		case 402:	/* doze */
+			return false;
+		case 434:	/* nap */
+			return false;
+		case 466:	/* sleep */
+			return false;
+		case 498:	/* rvwinkle */
+			return false;
+		}
+		break;
+	case 31:
+		switch ((inst >> 1) & 0x3ff) {
+		case 4:		/* tw */
+			return false;
+		case 68:	/* td */
+			return false;
+		case 146:	/* mtmsr */
+			return false;
+		case 178:	/* mtmsrd */
+			return false;
+		}
+		break;
+	}
+	return true;
+}
+
 /* Enable single stepping for the current task */
 static inline void enable_single_step(struct pt_regs *regs)
 {
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 9a492fdec1dfbe..0936a6c8c256b9 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -129,8 +129,8 @@ int arch_prepare_kprobe(struct kprobe *p)
 	if ((unsigned long)p->addr & 0x03) {
 		printk("Attempt to register kprobe at an unaligned address\n");
 		ret = -EINVAL;
-	} else if (IS_MTMSRD(insn) || IS_RFID(insn)) {
-		printk("Cannot register a kprobe on mtmsr[d]/rfi[d]\n");
+	} else if (!can_single_step(ppc_inst_val(insn))) {
+		printk("Cannot register a kprobe on instructions that can't be single stepped\n");
 		ret = -EINVAL;
 	} else if ((unsigned long)p->addr & ~PAGE_MASK &&
 		   ppc_inst_prefixed(ppc_inst_read(p->addr - 1))) {
diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
index c6975467d9ffdc..95a41ae9dfa755 100644
--- a/arch/powerpc/kernel/uprobes.c
+++ b/arch/powerpc/kernel/uprobes.c
@@ -48,6 +48,11 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe,
 		return -EINVAL;
 	}
 
+	if (!can_single_step(ppc_inst_val(ppc_inst_read(auprobe->insn)))) {
+		pr_info_ratelimited("Cannot register a uprobe on instructions that can't be single stepped\n");
+		return -ENOTSUPP;
+	}
+
 	return 0;
 }
 
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index fd72753e8ad502..a92c5739d954e2 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -921,9 +921,9 @@ static void insert_bpts(void)
 			bp->enabled = 0;
 			continue;
 		}
-		if (IS_MTMSRD(instr) || IS_RFID(instr)) {
-			printf("Breakpoint at %lx is on an mtmsrd or rfid "
-			       "instruction, disabling it\n", bp->address);
+		if (!can_single_step(ppc_inst_val(instr))) {
+			printf("Breakpoint at %lx is on an instruction that can't be single stepped, disabling it\n",
+					bp->address);
 			bp->enabled = 0;
 			continue;
 		}
@@ -1470,9 +1470,8 @@ static long check_bp_loc(unsigned long addr)
 		printf("Can't read instruction at address %lx\n", addr);
 		return 0;
 	}
-	if (IS_MTMSRD(instr) || IS_RFID(instr)) {
-		printf("Breakpoints may not be placed on mtmsrd or rfid "
-		       "instructions\n");
+	if (!can_single_step(ppc_inst_val(instr))) {
+		printf("Breakpoints may not be placed on instructions that can't be single stepped\n");
 		return 0;
 	}
 	return 1;
-- 
2.35.1

