Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A69E52B8B16
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 06:45:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc7tW5kV5zDqWs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 16:45:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ebKHdeYH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc7pt4BV8zDqc9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 16:41:55 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJ5Vgij009016; Thu, 19 Nov 2020 00:41:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=qe//0s4wXTq9ZPV3rKhfOykBf8h/xmrRK8Ib5sl3qOM=;
 b=ebKHdeYHZ+uJm2peo7wA2YEbz1iw6SMIeUOayPp69twzeO3FWF7M2tHRQKEcz74sYXie
 RCZ5npKMUwd90KS43XP/gBH5/PFZ4McWL7zyfbpZM6iaTNehRarsXUGTU19ppw3ERXdE
 T4wZeKxdkSl50oF9XAxYOZgIctqGwbJUEJEDkxOisFlmu34b8o4pAppR2ANB9BTgl7GE
 I6zD30SRnBzFPN1FuV1rwzg+6BZqtbeFFnrsLhk1zVkR0TpS1LlpGDPmmcObYTWhG12Z
 nvYsFeEkfAJgm+ElFYu3vuqjH1jgN4VbR82KRB/b44+7MUCQuYVSu6UoM0Fpv92KFo2+ BQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34wg67ubty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 00:41:47 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AJ5fkh1041364;
 Thu, 19 Nov 2020 00:41:47 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34wg67ubte-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 00:41:46 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AJ5dC8E020254;
 Thu, 19 Nov 2020 05:41:44 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 34v69us392-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 05:41:44 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AJ5ffYa58261798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 05:41:42 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D757C11C04A;
 Thu, 19 Nov 2020 05:41:41 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88C8C11C052;
 Thu, 19 Nov 2020 05:41:40 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 19 Nov 2020 05:41:40 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 1/2] powerpc: sstep: Fix load and update instructions
Date: Thu, 19 Nov 2020 11:11:38 +0530
Message-Id: <20201119054139.244083-1-sandipan@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_01:2020-11-17,
 2020-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 mlxlogscore=862 phishscore=0 lowpriorityscore=0 suspectscore=1 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190037
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, paulus@samba.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, dja@axtens.net
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

Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
 arch/powerpc/lib/sstep.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 855457ed09b5..25a5436be6c6 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -2157,11 +2157,15 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 		case 23:	/* lwzx */
 		case 55:	/* lwzux */
+			if (u && (ra == 0 || ra == rd))
+				return -1;
 			op->type = MKOP(LOAD, u, 4);
 			break;
 
 		case 87:	/* lbzx */
 		case 119:	/* lbzux */
+			if (u && (ra == 0 || ra == rd))
+				return -1;
 			op->type = MKOP(LOAD, u, 1);
 			break;
 
@@ -2215,6 +2219,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 #ifdef __powerpc64__
 		case 21:	/* ldx */
 		case 53:	/* ldux */
+			if (u && (ra == 0 || ra == rd))
+				return -1;
 			op->type = MKOP(LOAD, u, 8);
 			break;
 
@@ -2236,18 +2242,24 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 		case 279:	/* lhzx */
 		case 311:	/* lhzux */
+			if (u && (ra == 0 || ra == rd))
+				return -1;
 			op->type = MKOP(LOAD, u, 2);
 			break;
 
 #ifdef __powerpc64__
 		case 341:	/* lwax */
 		case 373:	/* lwaux */
+			if (u && (ra == 0 || ra == rd))
+				return -1;
 			op->type = MKOP(LOAD, SIGNEXT | u, 4);
 			break;
 #endif
 
 		case 343:	/* lhax */
 		case 375:	/* lhaux */
+			if (u && (ra == 0 || ra == rd))
+				return -1;
 			op->type = MKOP(LOAD, SIGNEXT | u, 2);
 			break;
 
@@ -2540,12 +2552,16 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 	case 32:	/* lwz */
 	case 33:	/* lwzu */
+		if (u && (ra == 0 || ra == rd))
+			return -1;
 		op->type = MKOP(LOAD, u, 4);
 		op->ea = dform_ea(word, regs);
 		break;
 
 	case 34:	/* lbz */
 	case 35:	/* lbzu */
+		if (u && (ra == 0 || ra == rd))
+			return -1;
 		op->type = MKOP(LOAD, u, 1);
 		op->ea = dform_ea(word, regs);
 		break;
@@ -2564,12 +2580,16 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 	case 40:	/* lhz */
 	case 41:	/* lhzu */
+		if (u && (ra == 0 || ra == rd))
+			return -1;
 		op->type = MKOP(LOAD, u, 2);
 		op->ea = dform_ea(word, regs);
 		break;
 
 	case 42:	/* lha */
 	case 43:	/* lhau */
+		if (u && (ra == 0 || ra == rd))
+			return -1;
 		op->type = MKOP(LOAD, SIGNEXT | u, 2);
 		op->ea = dform_ea(word, regs);
 		break;
@@ -2659,6 +2679,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			op->type = MKOP(LOAD, 0, 8);
 			break;
 		case 1:		/* ldu */
+			if (ra == 0 || ra == rd)
+				return -1;
 			op->type = MKOP(LOAD, UPDATE, 8);
 			break;
 		case 2:		/* lwa */
-- 
2.25.1

