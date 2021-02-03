Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 771A830D372
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 07:40:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVsVq30LlzDwy9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 17:40:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bUIQPhtD; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVsTX1MDTzDwrg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 17:38:55 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1136YfA4081615; Wed, 3 Feb 2021 01:38:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=8DE90hczvStXYO8JlAdLmdwiqJu4QEMNsCQVEWE5rF8=;
 b=bUIQPhtDumI/bds2HYPxM8YWG6rB9xXQb+CAoLlskkX7WaSRx2j84BQXXpOCMdBeO6da
 LkyPzh8R9AUmmTqF/uh8uPtqwaIlgQ+M9aPdXWra2zZ5iRpkWxL6P8tnzNOM191f13e5
 F3XulqksZs6bbJPFbbd8LjBaLW66KOfGp3Ew7p0CXli9NdG3/37Jkn3GDUxavFWjqwgM
 TzJ8VPYPQg9M8aOAxA/1OxovrVxH0eUA4jvKwW8i2kzZFKGciFQQj3AFY4fK6RuMNXQj
 2f/G8UNZgvZGqvxOC9dNf+PkeIgoIwbc6Eo0d+6mJq7DL69DIwKWoqt38vzwJAnb7U48 GA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36fpjjg7ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 01:38:49 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1136Zds1086927;
 Wed, 3 Feb 2021 01:38:48 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36fpjjg7dn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 01:38:48 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1136WFZ6000309;
 Wed, 3 Feb 2021 06:38:47 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 36er8y9d0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 06:38:46 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1136ciua41353476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Feb 2021 06:38:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E75E35204F;
 Wed,  3 Feb 2021 06:38:43 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 7842A5204E;
 Wed,  3 Feb 2021 06:38:42 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 1/3] powerpc: sstep: Fix load and update emulation
Date: Wed,  3 Feb 2021 12:08:39 +0530
Message-Id: <20210203063841.431063-1-sandipan@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-03_01:2021-02-02,
 2021-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102030035
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
Cc: ravi.bangoria@linux.ibm.com, ananth@linux.ibm.com, jniethe5@gmail.com,
 paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Power ISA says that the fixed-point load and update
instructions must neither use R0 for the base address (RA)
nor have the destination (RT) and the base address (RA) as
the same register. In these cases, the instruction is
invalid. This applies to the following instructions.
  * Load Byte and Zero with Update (lbzu)
  * Load Byte and Zero with Update Indexed (lbzux)
  * Load Halfword and Zero with Update (lhzu)
  * Load Halfword and Zero with Update Indexed (lhzux)
  * Load Halfword Algebraic with Update (lhau)
  * Load Halfword Algebraic with Update Indexed (lhaux)
  * Load Word and Zero with Update (lwzu)
  * Load Word and Zero with Update Indexed (lwzux)
  * Load Word Algebraic with Update Indexed (lwaux)
  * Load Doubleword with Update (ldu)
  * Load Doubleword with Update Indexed (ldux)

However, the following behaviour is observed using some
invalid opcodes where RA = RT.

An userspace program using an invalid instruction word like
0xe9ce0001, i.e. "ldu r14, 0(r14)", runs and exits without
getting terminated abruptly. The instruction performs the
load operation but does not write the effective address to
the base address register. Attaching an uprobe at that
instruction's address results in emulation which writes the
effective address to the base register. Thus, the final value
of the base address register is different.

To remove any inconsistencies, this adds an additional check
for the aforementioned instructions to make sure that they
are treated as unknown by the emulation infrastructure when
RA = 0 or RA = RT. The kernel will then fallback to executing
the instruction on hardware.

Fixes: 0016a4cf5582 ("powerpc: Emulate most Book I instructions in emulate_step()")
Reviewed-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
Previous versions can be found at:
v1: https://lore.kernel.org/linuxppc-dev/20201119054139.244083-1-sandipan@linux.ibm.com/

Changes in v2:
- Jump to unknown_opcode instead of returning -1 for invalid
  instruction forms.

---
 arch/powerpc/lib/sstep.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index e96cff845ef7..db824fec6165 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -2232,11 +2232,15 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 		case 23:	/* lwzx */
 		case 55:	/* lwzux */
+			if (u && (ra == 0 || ra == rd))
+				goto unknown_opcode;
 			op->type = MKOP(LOAD, u, 4);
 			break;
 
 		case 87:	/* lbzx */
 		case 119:	/* lbzux */
+			if (u && (ra == 0 || ra == rd))
+				goto unknown_opcode;
 			op->type = MKOP(LOAD, u, 1);
 			break;
 
@@ -2290,6 +2294,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 #ifdef __powerpc64__
 		case 21:	/* ldx */
 		case 53:	/* ldux */
+			if (u && (ra == 0 || ra == rd))
+				goto unknown_opcode;
 			op->type = MKOP(LOAD, u, 8);
 			break;
 
@@ -2311,18 +2317,24 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 		case 279:	/* lhzx */
 		case 311:	/* lhzux */
+			if (u && (ra == 0 || ra == rd))
+				goto unknown_opcode;
 			op->type = MKOP(LOAD, u, 2);
 			break;
 
 #ifdef __powerpc64__
 		case 341:	/* lwax */
 		case 373:	/* lwaux */
+			if (u && (ra == 0 || ra == rd))
+				goto unknown_opcode;
 			op->type = MKOP(LOAD, SIGNEXT | u, 4);
 			break;
 #endif
 
 		case 343:	/* lhax */
 		case 375:	/* lhaux */
+			if (u && (ra == 0 || ra == rd))
+				goto unknown_opcode;
 			op->type = MKOP(LOAD, SIGNEXT | u, 2);
 			break;
 
@@ -2656,12 +2668,16 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 	case 32:	/* lwz */
 	case 33:	/* lwzu */
+		if (u && (ra == 0 || ra == rd))
+			goto unknown_opcode;
 		op->type = MKOP(LOAD, u, 4);
 		op->ea = dform_ea(word, regs);
 		break;
 
 	case 34:	/* lbz */
 	case 35:	/* lbzu */
+		if (u && (ra == 0 || ra == rd))
+			goto unknown_opcode;
 		op->type = MKOP(LOAD, u, 1);
 		op->ea = dform_ea(word, regs);
 		break;
@@ -2680,12 +2696,16 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 	case 40:	/* lhz */
 	case 41:	/* lhzu */
+		if (u && (ra == 0 || ra == rd))
+			goto unknown_opcode;
 		op->type = MKOP(LOAD, u, 2);
 		op->ea = dform_ea(word, regs);
 		break;
 
 	case 42:	/* lha */
 	case 43:	/* lhau */
+		if (u && (ra == 0 || ra == rd))
+			goto unknown_opcode;
 		op->type = MKOP(LOAD, SIGNEXT | u, 2);
 		op->ea = dform_ea(word, regs);
 		break;
@@ -2779,6 +2799,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			op->type = MKOP(LOAD, 0, 8);
 			break;
 		case 1:		/* ldu */
+			if (ra == 0 || ra == rd)
+				goto unknown_opcode;
 			op->type = MKOP(LOAD, UPDATE, 8);
 			break;
 		case 2:		/* lwa */
-- 
2.25.1

