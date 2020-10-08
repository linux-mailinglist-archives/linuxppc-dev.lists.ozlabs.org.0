Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE58F286F85
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 09:33:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6NGf282szDqCp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 18:33:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RS13dJA4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6N8P3N2YzDqRY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 18:27:48 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09873cel076598; Thu, 8 Oct 2020 03:27:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GWuzcPhMgkv2wT1oft/SxmusNuEx9MM/qJyZm7pD9N4=;
 b=RS13dJA46z5Lgrhd7FukS+V5jl7KOepp58WFrJH9MGpNZ7YgOaB8z2IvcWKp/R9bOQPY
 tSlI85RLBQ7GWABGfcorc7r9rIRQYNPRhHUheTBdKI2ajlDTVfjFaEjo7iU90YsrMI4H
 czq1U/OPGZtKmkO6hVNkK50l+qOKgv21c79rYsDdHiRIZLuIY4sh5U1bdB4tJ8AZfznj
 nCoM+xuGRpWIr4UwACaX0FXuJW6LhVCiPnCiPo8K/vfGIxgSwZjkD2NpkgkdJ1MSuRk/
 TXgYqL/Wa2Nb6sybC09G2jwWpkO3y9zn4JxyZghORDCOHNs/gyzwwpzSuWaFXaGf0rw0 Dw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341v10cayy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 03:27:44 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0987OadS019959;
 Thu, 8 Oct 2020 07:27:42 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 33xgx8d2g3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 07:27:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0987Rd8333489172
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Oct 2020 07:27:39 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C3D34C046;
 Thu,  8 Oct 2020 07:27:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BBF64C044;
 Thu,  8 Oct 2020 07:27:37 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.37.242])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  8 Oct 2020 07:27:37 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v4 2/4] powerpc/sstep: Support VSX vector paired storage
 access instructions
Date: Thu,  8 Oct 2020 12:57:24 +0530
Message-Id: <20201008072726.233086-3-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201008072726.233086-1-ravi.bangoria@linux.ibm.com>
References: <20201008072726.233086-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-08_03:2020-10-08,
 2020-10-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=1
 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010080051
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
Cc: ravi.bangoria@linux.ibm.com, bala24@linux.ibm.com, paulus@samba.org,
 sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Balamuruhan S <bala24@linux.ibm.com>

VSX Vector Paired instructions loads/stores an octword (32 bytes)
from/to storage into two sequential VSRs. Add emulation support
for these new instructions:
  * Load VSX Vector Paired (lxvp)
  * Load VSX Vector Paired Indexed (lxvpx)
  * Prefixed Load VSX Vector Paired (plxvp)
  * Store VSX Vector Paired (stxvp)
  * Store VSX Vector Paired Indexed (stxvpx)
  * Prefixed Store VSX Vector Paired (pstxvp)

Suggested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/lib/sstep.c | 146 +++++++++++++++++++++++++++++++++------
 1 file changed, 125 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index e6242744c71b..e39ee1651636 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -32,6 +32,10 @@ extern char system_call_vectored_emulate[];
 #define XER_OV32	0x00080000U
 #define XER_CA32	0x00040000U
 
+#ifdef CONFIG_VSX
+#define VSX_REGISTER_XTP(rd)   ((((rd) & 1) << 5) | ((rd) & 0xfe))
+#endif
+
 #ifdef CONFIG_PPC_FPU
 /*
  * Functions in ldstfp.S
@@ -279,6 +283,19 @@ static nokprobe_inline void do_byte_reverse(void *ptr, int nb)
 		up[1] = tmp;
 		break;
 	}
+	case 32: {
+		unsigned long *up = (unsigned long *)ptr;
+		unsigned long tmp;
+
+		tmp = byterev_8(up[0]);
+		up[0] = byterev_8(up[3]);
+		up[3] = tmp;
+		tmp = byterev_8(up[2]);
+		up[2] = byterev_8(up[1]);
+		up[1] = tmp;
+		break;
+	}
+
 #endif
 	default:
 		WARN_ON_ONCE(1);
@@ -709,6 +726,8 @@ void emulate_vsx_load(struct instruction_op *op, union vsx_reg *reg,
 	reg->d[0] = reg->d[1] = 0;
 
 	switch (op->element_size) {
+	case 32:
+		/* [p]lxvp[x] */
 	case 16:
 		/* whole vector; lxv[x] or lxvl[l] */
 		if (size == 0)
@@ -717,7 +736,7 @@ void emulate_vsx_load(struct instruction_op *op, union vsx_reg *reg,
 		if (IS_LE && (op->vsx_flags & VSX_LDLEFT))
 			rev = !rev;
 		if (rev)
-			do_byte_reverse(reg, 16);
+			do_byte_reverse(reg, size);
 		break;
 	case 8:
 		/* scalar loads, lxvd2x, lxvdsx */
@@ -793,6 +812,20 @@ void emulate_vsx_store(struct instruction_op *op, const union vsx_reg *reg,
 	size = GETSIZE(op->type);
 
 	switch (op->element_size) {
+	case 32:
+		/* [p]stxvp[x] */
+		if (size == 0)
+			break;
+		if (rev) {
+			/* reverse 32 bytes */
+			buf.d[0] = byterev_8(reg->d[3]);
+			buf.d[1] = byterev_8(reg->d[2]);
+			buf.d[2] = byterev_8(reg->d[1]);
+			buf.d[3] = byterev_8(reg->d[0]);
+			reg = &buf;
+		}
+		memcpy(mem, reg, size);
+		break;
 	case 16:
 		/* stxv, stxvx, stxvl, stxvll */
 		if (size == 0)
@@ -861,28 +894,43 @@ static nokprobe_inline int do_vsx_load(struct instruction_op *op,
 				       bool cross_endian)
 {
 	int reg = op->reg;
-	u8 mem[16];
-	union vsx_reg buf;
+	int i, j, nr_vsx_regs;
+	u8 mem[32];
+	union vsx_reg buf[2];
 	int size = GETSIZE(op->type);
 
 	if (!address_ok(regs, ea, size) || copy_mem_in(mem, ea, size, regs))
 		return -EFAULT;
 
-	emulate_vsx_load(op, &buf, mem, cross_endian);
+	nr_vsx_regs = size / sizeof(__vector128);
+	emulate_vsx_load(op, buf, mem, cross_endian);
 	preempt_disable();
 	if (reg < 32) {
 		/* FP regs + extensions */
 		if (regs->msr & MSR_FP) {
-			load_vsrn(reg, &buf);
+			for (i = 0; i < nr_vsx_regs; i++) {
+				j = IS_LE ? nr_vsx_regs - i - 1 : i;
+				load_vsrn(reg + i, &buf[j].v);
+			}
 		} else {
-			current->thread.fp_state.fpr[reg][0] = buf.d[0];
-			current->thread.fp_state.fpr[reg][1] = buf.d[1];
+			for (i = 0; i < nr_vsx_regs; i++) {
+				j = IS_LE ? nr_vsx_regs - i - 1 : i;
+				current->thread.fp_state.fpr[reg + i][0] = buf[j].d[0];
+				current->thread.fp_state.fpr[reg + i][1] = buf[j].d[1];
+			}
 		}
 	} else {
-		if (regs->msr & MSR_VEC)
-			load_vsrn(reg, &buf);
-		else
-			current->thread.vr_state.vr[reg - 32] = buf.v;
+		if (regs->msr & MSR_VEC) {
+			for (i = 0; i < nr_vsx_regs; i++) {
+				j = IS_LE ? nr_vsx_regs - i - 1 : i;
+				load_vsrn(reg + i, &buf[j].v);
+			}
+		} else {
+			for (i = 0; i < nr_vsx_regs; i++) {
+				j = IS_LE ? nr_vsx_regs - i - 1 : i;
+				current->thread.vr_state.vr[reg - 32 + i] = buf[j].v;
+			}
+		}
 	}
 	preempt_enable();
 	return 0;
@@ -893,30 +941,45 @@ static nokprobe_inline int do_vsx_store(struct instruction_op *op,
 					bool cross_endian)
 {
 	int reg = op->reg;
-	u8 mem[16];
-	union vsx_reg buf;
+	int i, j, nr_vsx_regs;
+	u8 mem[32];
+	union vsx_reg buf[2];
 	int size = GETSIZE(op->type);
 
 	if (!address_ok(regs, ea, size))
 		return -EFAULT;
 
+	nr_vsx_regs = size / sizeof(__vector128);
 	preempt_disable();
 	if (reg < 32) {
 		/* FP regs + extensions */
 		if (regs->msr & MSR_FP) {
-			store_vsrn(reg, &buf);
+			for (i = 0; i < nr_vsx_regs; i++) {
+				j = IS_LE ? nr_vsx_regs - i - 1 : i;
+				store_vsrn(reg + i, &buf[j].v);
+			}
 		} else {
-			buf.d[0] = current->thread.fp_state.fpr[reg][0];
-			buf.d[1] = current->thread.fp_state.fpr[reg][1];
+			for (i = 0; i < nr_vsx_regs; i++) {
+				j = IS_LE ? nr_vsx_regs - i - 1 : i;
+				buf[j].d[0] = current->thread.fp_state.fpr[reg + i][0];
+				buf[j].d[1] = current->thread.fp_state.fpr[reg + i][1];
+			}
 		}
 	} else {
-		if (regs->msr & MSR_VEC)
-			store_vsrn(reg, &buf);
-		else
-			buf.v = current->thread.vr_state.vr[reg - 32];
+		if (regs->msr & MSR_VEC) {
+			for (i = 0; i < nr_vsx_regs; i++) {
+				j = IS_LE ? nr_vsx_regs - i - 1 : i;
+				store_vsrn(reg + i, &buf[j].v);
+			}
+		} else {
+			for (i = 0; i < nr_vsx_regs; i++) {
+				j = IS_LE ? nr_vsx_regs - i - 1 : i;
+				buf[j].v = current->thread.vr_state.vr[reg - 32 + i];
+			}
+		}
 	}
 	preempt_enable();
-	emulate_vsx_store(op, &buf, mem, cross_endian);
+	emulate_vsx_store(op, buf, mem, cross_endian);
 	return  copy_mem_out(mem, ea, size, regs);
 }
 #endif /* CONFIG_VSX */
@@ -2403,6 +2466,14 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			op->vsx_flags = VSX_SPLAT;
 			break;
 
+		case 333:       /* lxvpx */
+			if (!cpu_has_feature(CPU_FTR_ARCH_31))
+				return -1;
+			op->reg = VSX_REGISTER_XTP(rd);
+			op->type = MKOP(LOAD_VSX, 0, 32);
+			op->element_size = 32;
+			break;
+
 		case 364:	/* lxvwsx */
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 4);
@@ -2431,6 +2502,13 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 				VSX_CHECK_VEC;
 			break;
 		}
+		case 461:       /* stxvpx */
+			if (!cpu_has_feature(CPU_FTR_ARCH_31))
+				return -1;
+			op->reg = VSX_REGISTER_XTP(rd);
+			op->type = MKOP(STORE_VSX, 0, 32);
+			op->element_size = 32;
+			break;
 		case 524:	/* lxsspx */
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 4);
@@ -2672,6 +2750,22 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 #endif
 
 #ifdef CONFIG_VSX
+	case 6:
+		if (!cpu_has_feature(CPU_FTR_ARCH_31))
+			return -1;
+		op->ea = dqform_ea(word, regs);
+		op->reg = VSX_REGISTER_XTP(rd);
+		op->element_size = 32;
+		switch (word & 0xf) {
+		case 0:         /* lxvp */
+			op->type = MKOP(LOAD_VSX, 0, 32);
+			break;
+		case 1:         /* stxvp */
+			op->type = MKOP(STORE_VSX, 0, 32);
+			break;
+		}
+		break;
+
 	case 61:	/* stfdp, lxv, stxsd, stxssp, stxv */
 		switch (word & 7) {
 		case 0:		/* stfdp with LSB of DS field = 0 */
@@ -2803,12 +2897,22 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			case 57:	/* pld */
 				op->type = MKOP(LOAD, PREFIXED, 8);
 				break;
+			case 58:        /* plxvp */
+				op->reg = VSX_REGISTER_XTP(rd);
+				op->type = MKOP(LOAD_VSX, PREFIXED, 32);
+				op->element_size = 32;
+				break;
 			case 60:        /* stq */
 				op->type = MKOP(STORE, PREFIXED, 16);
 				break;
 			case 61:	/* pstd */
 				op->type = MKOP(STORE, PREFIXED, 8);
 				break;
+			case 62:        /* pstxvp */
+				op->reg = VSX_REGISTER_XTP(rd);
+				op->type = MKOP(STORE_VSX, PREFIXED, 32);
+				op->element_size = 32;
+				break;
 			}
 			break;
 		case 1: /* Type 01 Eight-Byte Register-to-Register */
-- 
2.26.2

