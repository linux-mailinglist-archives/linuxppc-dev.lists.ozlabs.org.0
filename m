Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 307DB2FCD8D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 10:47:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLLL32NT0zDqvV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 20:47:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ananth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MHfk7JJn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLLJG426xzDqc7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 20:46:19 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10K9gsiA079772; Wed, 20 Jan 2021 04:46:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=5jbV/iw4rK6+502Tg/Y8kIWXA2lci081wdhQhqZUXvI=;
 b=MHfk7JJnIHZR9VZvw2jsqM2HsS/KE7KBbKfRzyFVPRvEDjQarnFUo/HLbWBLv8V6t+lC
 8u++OLYuR/vT73cBQAplG6YCe4plBj+8i1l+He5vCQUUiVJBfzcGbHc0fC9O/VkdVsFR
 oQG/+fBLwDPbZgjud5+ntpVxdi8gh8YAEfkNP8zi26h821zDh2LNaCjXediDUrlQ63e3
 FTVNX2W953h4mQx7+2PHDTXxI1IhCB9xhn+XkAcPUGLNJ0o3H1uPfV78jbu663eS/peh
 aa6GVi4/xc7i7KK2t737lc/YaaE/iqYoPQGFpjybjDy33+ZXDB8yQWd7uE9n48jqjgF7 0w== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 366j4j82kc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 04:46:12 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10K9S7Zr012189;
 Wed, 20 Jan 2021 09:46:10 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3668p4g7fx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 09:46:10 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10K9k7YM20316576
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 09:46:07 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CCB24204B;
 Wed, 20 Jan 2021 09:46:07 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44F1E42041;
 Wed, 20 Jan 2021 09:46:06 +0000 (GMT)
Received: from thinktux.local (unknown [9.199.63.129])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 20 Jan 2021 09:46:06 +0000 (GMT)
Subject: [PATCH] [PATCH] powerpc/sstep: Check ISA 3.0 instruction validity
 before emulation
From: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Date: Wed, 20 Jan 2021 15:16:05 +0530
Message-ID: <161113596420.206556.5023431229030762544.stgit@thinktux.local>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_02:2021-01-18,
 2021-01-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=810 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101200052
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
Cc: naveen.n.rao@linux.ibm.com, ravi.bangoria@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We currently unconditionally try to newer emulate instructions on older
Power versions that could cause issues. Gate it.

Signed-off-by: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
---
 arch/powerpc/lib/sstep.c |   40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index bf7a7d62ae8b..ed119858e5e9 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1528,6 +1528,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		goto compute_done;
 
 	case 19:
+		if (!cpu_has_feature(CPU_FTR_ARCH_300))
+			return -1;
 		if (((word >> 1) & 0x1f) == 2) {
 			/* addpcis */
 			imm = (short) (word & 0xffc1);	/* d0 + d2 fields */
@@ -2439,6 +2441,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 268:	/* lxvx */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				return -1;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 16);
 			op->element_size = 16;
@@ -2448,6 +2452,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		case 269:	/* lxvl */
 		case 301: {	/* lxvll */
 			int nb;
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				return -1;
 			op->reg = rd | ((word & 1) << 5);
 			op->ea = ra ? regs->gpr[ra] : 0;
 			nb = regs->gpr[rb] & 0xff;
@@ -2475,6 +2481,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 364:	/* lxvwsx */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				return -1;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 4);
 			op->element_size = 4;
@@ -2482,6 +2490,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 396:	/* stxvx */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				return -1;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(STORE_VSX, 0, 16);
 			op->element_size = 16;
@@ -2491,6 +2501,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		case 397:	/* stxvl */
 		case 429: {	/* stxvll */
 			int nb;
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				return -1;
 			op->reg = rd | ((word & 1) << 5);
 			op->ea = ra ? regs->gpr[ra] : 0;
 			nb = regs->gpr[rb] & 0xff;
@@ -2542,6 +2554,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 781:	/* lxsibzx */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				return -1;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 1);
 			op->element_size = 8;
@@ -2549,6 +2563,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 812:	/* lxvh8x */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				return -1;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 16);
 			op->element_size = 2;
@@ -2556,6 +2572,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 813:	/* lxsihzx */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				return -1;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 2);
 			op->element_size = 8;
@@ -2569,6 +2587,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 876:	/* lxvb16x */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				return -1;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 16);
 			op->element_size = 1;
@@ -2582,6 +2602,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 909:	/* stxsibx */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				return -1;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(STORE_VSX, 0, 1);
 			op->element_size = 8;
@@ -2589,6 +2611,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 940:	/* stxvh8x */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				return -1;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(STORE_VSX, 0, 16);
 			op->element_size = 2;
@@ -2596,6 +2620,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 941:	/* stxsihx */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				return -1;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(STORE_VSX, 0, 2);
 			op->element_size = 8;
@@ -2609,6 +2635,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 1004:	/* stxvb16x */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				return -1;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(STORE_VSX, 0, 16);
 			op->element_size = 1;
@@ -2717,12 +2745,16 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			op->type = MKOP(LOAD_FP, 0, 16);
 			break;
 		case 2:		/* lxsd */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				return -1;
 			op->reg = rd + 32;
 			op->type = MKOP(LOAD_VSX, 0, 8);
 			op->element_size = 8;
 			op->vsx_flags = VSX_CHECK_VEC;
 			break;
 		case 3:		/* lxssp */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				return -1;
 			op->reg = rd + 32;
 			op->type = MKOP(LOAD_VSX, 0, 4);
 			op->element_size = 8;
@@ -2775,6 +2807,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 1:		/* lxv */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				return -1;
 			op->ea = dqform_ea(word, regs);
 			if (word & 8)
 				op->reg = rd + 32;
@@ -2785,6 +2819,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 		case 2:		/* stxsd with LSB of DS field = 0 */
 		case 6:		/* stxsd with LSB of DS field = 1 */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				return -1;
 			op->ea = dsform_ea(word, regs);
 			op->reg = rd + 32;
 			op->type = MKOP(STORE_VSX, 0, 8);
@@ -2794,6 +2830,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 		case 3:		/* stxssp with LSB of DS field = 0 */
 		case 7:		/* stxssp with LSB of DS field = 1 */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				return -1;
 			op->ea = dsform_ea(word, regs);
 			op->reg = rd + 32;
 			op->type = MKOP(STORE_VSX, 0, 4);
@@ -2802,6 +2840,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 5:		/* stxv */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				return -1;
 			op->ea = dqform_ea(word, regs);
 			if (word & 8)
 				op->reg = rd + 32;


