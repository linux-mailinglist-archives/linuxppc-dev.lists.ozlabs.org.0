Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C93C830254B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 14:09:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPVZQ4n5PzDqrs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 00:09:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ananth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UKAs/Eom; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPVW11mFfzDqBW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 00:06:36 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10PD4Ib2195400; Mon, 25 Jan 2021 08:06:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=YYUeTWKQO/l0L6emINQDe8Ip3j1xvKR8kQxJ9Dvd4xY=;
 b=UKAs/Eom/iMOQhwoZvd9z+zlb/dY9qCzbJFk1HkmZNcIxefdk/BkWdhLJB0LhzB97l8C
 pdu+TbHuicETNxepUGcJdLvdtZK2FPuidnn15lpS3tbc+The9IQfaxH39nO74YE3i2eW
 iszw18R3+Y/m6MSQuoxdLBoTjA1Hl1j4XLPQFoTuwAqtV28jq1AjD5+X4CI6dfZZFuSB
 JP5fJhF5HMR6KHHETsEnPF6GZIafDktFnNk9ryghEoLS1VZZ95eohHUCA0HxsvzSllQS
 npLrmWtkPbW13pAfRhh6rgXFTwCg7BNzZwfDerrHt954MY5Odk+dSmCYY96vxFSyTFmR xg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 369x530wvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 08:06:29 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10PCvQPn016158;
 Mon, 25 Jan 2021 13:06:28 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 368be89u3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 13:06:27 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10PD6PwW44630386
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jan 2021 13:06:25 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 220DE11C052;
 Mon, 25 Jan 2021 13:06:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D25C111C05C;
 Mon, 25 Jan 2021 13:06:23 +0000 (GMT)
Received: from thinktux.local (unknown [9.199.44.75])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 25 Jan 2021 13:06:23 +0000 (GMT)
Subject: [PATCH v4 1/2] [PATCH] powerpc/sstep: Check instruction validity
 against ISA version before emulation
From: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Date: Mon, 25 Jan 2021 18:36:22 +0530
Message-ID: <161157995977.64773.13794501093457185080.stgit@thinktux.local>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-25_04:2021-01-25,
 2021-01-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011
 spamscore=0 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101250074
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
Cc: ravi.bangoria@linux.ibm.com, paulus@samba.org, naveen.n.rao@linux.ibm.com,
 msuchanek@suse.de, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We currently unconditionally try to emulate newer instructions on older
Power versions that could cause issues. Gate it.

Fixes: 350779a29f11 ("powerpc: Handle most loads and stores in instruction emulation code")
Signed-off-by: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
---

[v4] Based on feedback from Paul Mackerras, Naveen Rao and Michael Ellerman,
     changed return code to 0, after setting opcode type to UNKNOWN
[v3] Addressed Naveen's comments on scv and addpcis
[v2] Fixed description
---
 arch/powerpc/lib/sstep.c |   78 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 62 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index bf7a7d62ae8b..f859cbbb6375 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1304,9 +1304,11 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		if ((word & 0xfe2) == 2)
 			op->type = SYSCALL;
 		else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
-				(word & 0xfe3) == 1)
+				(word & 0xfe3) == 1) {	/* scv */
 			op->type = SYSCALL_VECTORED_0;
-		else
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
+		} else
 			op->type = UNKNOWN;
 		return 0;
 #endif
@@ -1410,7 +1412,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 #ifdef __powerpc64__
 	case 1:
 		if (!cpu_has_feature(CPU_FTR_ARCH_31))
-			return -1;
+			goto unknown_opcode;
 
 		prefix_r = GET_PREFIX_R(word);
 		ra = GET_PREFIX_RA(suffix);
@@ -1444,7 +1446,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 #ifdef __powerpc64__
 	case 4:
 		if (!cpu_has_feature(CPU_FTR_ARCH_300))
-			return -1;
+			goto unknown_opcode;
 
 		switch (word & 0x3f) {
 		case 48:	/* maddhd */
@@ -1530,6 +1532,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 	case 19:
 		if (((word >> 1) & 0x1f) == 2) {
 			/* addpcis */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
 			imm = (short) (word & 0xffc1);	/* d0 + d2 fields */
 			imm |= (word >> 15) & 0x3e;	/* d1 field */
 			op->val = regs->nip + (imm << 16) + 4;
@@ -1842,7 +1846,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 #ifdef __powerpc64__
 		case 265:	/* modud */
 			if (!cpu_has_feature(CPU_FTR_ARCH_300))
-				return -1;
+				goto unknown_opcode;
 			op->val = regs->gpr[ra] % regs->gpr[rb];
 			goto compute_done;
 #endif
@@ -1852,7 +1856,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 		case 267:	/* moduw */
 			if (!cpu_has_feature(CPU_FTR_ARCH_300))
-				return -1;
+				goto unknown_opcode;
 			op->val = (unsigned int) regs->gpr[ra] %
 				(unsigned int) regs->gpr[rb];
 			goto compute_done;
@@ -1889,7 +1893,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 #endif
 		case 755:	/* darn */
 			if (!cpu_has_feature(CPU_FTR_ARCH_300))
-				return -1;
+				goto unknown_opcode;
 			switch (ra & 0x3) {
 			case 0:
 				/* 32-bit conditioned */
@@ -1911,14 +1915,14 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 #ifdef __powerpc64__
 		case 777:	/* modsd */
 			if (!cpu_has_feature(CPU_FTR_ARCH_300))
-				return -1;
+				goto unknown_opcode;
 			op->val = (long int) regs->gpr[ra] %
 				(long int) regs->gpr[rb];
 			goto compute_done;
 #endif
 		case 779:	/* modsw */
 			if (!cpu_has_feature(CPU_FTR_ARCH_300))
-				return -1;
+				goto unknown_opcode;
 			op->val = (int) regs->gpr[ra] %
 				(int) regs->gpr[rb];
 			goto compute_done;
@@ -1995,14 +1999,14 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 #endif
 		case 538:	/* cnttzw */
 			if (!cpu_has_feature(CPU_FTR_ARCH_300))
-				return -1;
+				goto unknown_opcode;
 			val = (unsigned int) regs->gpr[rd];
 			op->val = (val ? __builtin_ctz(val) : 32);
 			goto logical_done;
 #ifdef __powerpc64__
 		case 570:	/* cnttzd */
 			if (!cpu_has_feature(CPU_FTR_ARCH_300))
-				return -1;
+				goto unknown_opcode;
 			val = regs->gpr[rd];
 			op->val = (val ? __builtin_ctzl(val) : 64);
 			goto logical_done;
@@ -2112,7 +2116,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		case 890:	/* extswsli with sh_5 = 0 */
 		case 891:	/* extswsli with sh_5 = 1 */
 			if (!cpu_has_feature(CPU_FTR_ARCH_300))
-				return -1;
+				goto unknown_opcode;
 			op->type = COMPUTE + SETREG;
 			sh = rb | ((word & 2) << 4);
 			val = (signed int) regs->gpr[rd];
@@ -2439,6 +2443,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 268:	/* lxvx */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 16);
 			op->element_size = 16;
@@ -2448,6 +2454,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		case 269:	/* lxvl */
 		case 301: {	/* lxvll */
 			int nb;
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
 			op->reg = rd | ((word & 1) << 5);
 			op->ea = ra ? regs->gpr[ra] : 0;
 			nb = regs->gpr[rb] & 0xff;
@@ -2468,13 +2476,15 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 		case 333:       /* lxvpx */
 			if (!cpu_has_feature(CPU_FTR_ARCH_31))
-				return -1;
+				goto unknown_opcode;
 			op->reg = VSX_REGISTER_XTP(rd);
 			op->type = MKOP(LOAD_VSX, 0, 32);
 			op->element_size = 32;
 			break;
 
 		case 364:	/* lxvwsx */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 4);
 			op->element_size = 4;
@@ -2482,6 +2492,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 396:	/* stxvx */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(STORE_VSX, 0, 16);
 			op->element_size = 16;
@@ -2491,6 +2503,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		case 397:	/* stxvl */
 		case 429: {	/* stxvll */
 			int nb;
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
 			op->reg = rd | ((word & 1) << 5);
 			op->ea = ra ? regs->gpr[ra] : 0;
 			nb = regs->gpr[rb] & 0xff;
@@ -2504,7 +2518,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		}
 		case 461:       /* stxvpx */
 			if (!cpu_has_feature(CPU_FTR_ARCH_31))
-				return -1;
+				goto unknown_opcode;
 			op->reg = VSX_REGISTER_XTP(rd);
 			op->type = MKOP(STORE_VSX, 0, 32);
 			op->element_size = 32;
@@ -2542,6 +2556,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 781:	/* lxsibzx */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 1);
 			op->element_size = 8;
@@ -2549,6 +2565,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 812:	/* lxvh8x */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 16);
 			op->element_size = 2;
@@ -2556,6 +2574,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 813:	/* lxsihzx */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 2);
 			op->element_size = 8;
@@ -2569,6 +2589,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 876:	/* lxvb16x */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 16);
 			op->element_size = 1;
@@ -2582,6 +2604,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 909:	/* stxsibx */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(STORE_VSX, 0, 1);
 			op->element_size = 8;
@@ -2589,6 +2613,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 940:	/* stxvh8x */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(STORE_VSX, 0, 16);
 			op->element_size = 2;
@@ -2596,6 +2622,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 941:	/* stxsihx */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(STORE_VSX, 0, 2);
 			op->element_size = 8;
@@ -2609,6 +2637,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 1004:	/* stxvb16x */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(STORE_VSX, 0, 16);
 			op->element_size = 1;
@@ -2717,12 +2747,16 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			op->type = MKOP(LOAD_FP, 0, 16);
 			break;
 		case 2:		/* lxsd */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
 			op->reg = rd + 32;
 			op->type = MKOP(LOAD_VSX, 0, 8);
 			op->element_size = 8;
 			op->vsx_flags = VSX_CHECK_VEC;
 			break;
 		case 3:		/* lxssp */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
 			op->reg = rd + 32;
 			op->type = MKOP(LOAD_VSX, 0, 4);
 			op->element_size = 8;
@@ -2752,7 +2786,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 #ifdef CONFIG_VSX
 	case 6:
 		if (!cpu_has_feature(CPU_FTR_ARCH_31))
-			return -1;
+			goto unknown_opcode;
 		op->ea = dqform_ea(word, regs);
 		op->reg = VSX_REGISTER_XTP(rd);
 		op->element_size = 32;
@@ -2775,6 +2809,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 1:		/* lxv */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
 			op->ea = dqform_ea(word, regs);
 			if (word & 8)
 				op->reg = rd + 32;
@@ -2785,6 +2821,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 		case 2:		/* stxsd with LSB of DS field = 0 */
 		case 6:		/* stxsd with LSB of DS field = 1 */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
 			op->ea = dsform_ea(word, regs);
 			op->reg = rd + 32;
 			op->type = MKOP(STORE_VSX, 0, 8);
@@ -2794,6 +2832,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 		case 3:		/* stxssp with LSB of DS field = 0 */
 		case 7:		/* stxssp with LSB of DS field = 1 */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
 			op->ea = dsform_ea(word, regs);
 			op->reg = rd + 32;
 			op->type = MKOP(STORE_VSX, 0, 4);
@@ -2802,6 +2842,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 5:		/* stxv */
+			if (!cpu_has_feature(CPU_FTR_ARCH_300))
+				goto unknown_opcode;
 			op->ea = dqform_ea(word, regs);
 			if (word & 8)
 				op->reg = rd + 32;
@@ -2831,7 +2873,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		break;
 	case 1: /* Prefixed instructions */
 		if (!cpu_has_feature(CPU_FTR_ARCH_31))
-			return -1;
+			goto unknown_opcode;
 
 		prefix_r = GET_PREFIX_R(word);
 		ra = GET_PREFIX_RA(suffix);
@@ -2980,6 +3022,10 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 	return 0;
 
+ unknown_opcode:
+	op->type = UNKNOWN;
+	return 0;
+
  logical_done:
 	if (word & 1)
 		set_cr0(regs, op);


