Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9501221C8A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 08:22:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6kgQ2fvxzDqgb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 16:22:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6kY62lymzDqdS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 16:16:42 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06G63oXJ002565; Thu, 16 Jul 2020 02:16:37 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32afv02c15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 02:16:37 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06G644x8004183;
 Thu, 16 Jul 2020 02:16:36 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32afv02c08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 02:16:36 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06G6GY1I003997;
 Thu, 16 Jul 2020 06:16:34 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 328rbqsetn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 06:16:34 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06G6GV3a53215352
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 06:16:31 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EEAD42054;
 Thu, 16 Jul 2020 06:16:31 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D40142042;
 Thu, 16 Jul 2020 06:16:27 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.79.215.148])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 Jul 2020 06:16:27 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 2/4] powerpc/sstep: support emulation for vsx vector paired
 storage access instructions
Date: Thu, 16 Jul 2020 11:45:56 +0530
Message-Id: <20200716061558.1532199-3-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200716061558.1532199-1-bala24@linux.ibm.com>
References: <20200716061558.1532199-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_12:2020-07-15,
 2020-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 suspectscore=1
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007160042
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com,
 Balamuruhan S <bala24@linux.ibm.com>, paulus@samba.org, sandipan@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

add emulate_step() changes to support vsx vector paired storage
access instructions that provides octword operands loads/stores
between storage and set of 2 Vector Scalar Registers (VSRs).

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/include/asm/sstep.h |  2 +-
 arch/powerpc/lib/sstep.c         | 58 +++++++++++++++++++++++++++-----
 2 files changed, 50 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/sstep.h b/arch/powerpc/include/asm/sstep.h
index 3b01c69a44aa..a6c0b299bcc9 100644
--- a/arch/powerpc/include/asm/sstep.h
+++ b/arch/powerpc/include/asm/sstep.h
@@ -126,7 +126,7 @@ union vsx_reg {
 	unsigned long d[2];
 	float	fp[4];
 	double	dp[2];
-	__vector128 v;
+	__vector128 v[2];
 };
 
 /*
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 1af8c1920b36..010ce81aeffb 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -279,6 +279,19 @@ static nokprobe_inline void do_byte_reverse(void *ptr, int nb)
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
@@ -709,6 +722,8 @@ void emulate_vsx_load(struct instruction_op *op, union vsx_reg *reg,
 	reg->d[0] = reg->d[1] = 0;
 
 	switch (op->element_size) {
+	case 32:
+		/* [p]lxvp[x] or [p]stxvp[x] */
 	case 16:
 		/* whole vector; lxv[x] or lxvl[l] */
 		if (size == 0)
@@ -717,7 +732,7 @@ void emulate_vsx_load(struct instruction_op *op, union vsx_reg *reg,
 		if (IS_LE && (op->vsx_flags & VSX_LDLEFT))
 			rev = !rev;
 		if (rev)
-			do_byte_reverse(reg, 16);
+			do_byte_reverse(reg, size);
 		break;
 	case 8:
 		/* scalar loads, lxvd2x, lxvdsx */
@@ -793,6 +808,22 @@ void emulate_vsx_store(struct instruction_op *op, const union vsx_reg *reg,
 	size = GETSIZE(op->type);
 
 	switch (op->element_size) {
+	case 32:
+		/* [p]lxvp[x] or [p]stxvp[x] */
+		if (size == 0)
+			break;
+		if (IS_LE && (op->vsx_flags & VSX_LDLEFT))
+			rev = !rev;
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
@@ -861,28 +892,33 @@ static nokprobe_inline int do_vsx_load(struct instruction_op *op,
 				       bool cross_endian)
 {
 	int reg = op->reg;
-	u8 mem[16];
+	int i, nr_vsx_regs;
+	u8 mem[32];
 	union vsx_reg buf;
 	int size = GETSIZE(op->type);
 
 	if (!address_ok(regs, ea, size) || copy_mem_in(mem, ea, size, regs))
 		return -EFAULT;
 
+	nr_vsx_regs = size / sizeof(__vector128);
 	emulate_vsx_load(op, &buf, mem, cross_endian);
 	preempt_disable();
 	if (reg < 32) {
 		/* FP regs + extensions */
 		if (regs->msr & MSR_FP) {
-			load_vsrn(reg, &buf);
+			for (i = 0; i < nr_vsx_regs; i++)
+				load_vsrn(reg + i, &buf.v[i]);
 		} else {
 			current->thread.fp_state.fpr[reg][0] = buf.d[0];
 			current->thread.fp_state.fpr[reg][1] = buf.d[1];
 		}
 	} else {
 		if (regs->msr & MSR_VEC)
-			load_vsrn(reg, &buf);
+			for (i = 0; i < nr_vsx_regs; i++)
+				load_vsrn(reg + i, &buf.v[i]);
+
 		else
-			current->thread.vr_state.vr[reg - 32] = buf.v;
+			current->thread.vr_state.vr[reg - 32] = buf.v[0];
 	}
 	preempt_enable();
 	return 0;
@@ -893,27 +929,31 @@ static nokprobe_inline int do_vsx_store(struct instruction_op *op,
 					bool cross_endian)
 {
 	int reg = op->reg;
-	u8 mem[16];
+	int i, nr_vsx_regs;
+	u8 mem[32];
 	union vsx_reg buf;
 	int size = GETSIZE(op->type);
 
 	if (!address_ok(regs, ea, size))
 		return -EFAULT;
 
+	nr_vsx_regs = size / sizeof(__vector128);
 	preempt_disable();
 	if (reg < 32) {
 		/* FP regs + extensions */
 		if (regs->msr & MSR_FP) {
-			store_vsrn(reg, &buf);
+			for (i = 0; i < nr_vsx_regs; i++)
+				store_vsrn(reg + i, &buf.v[i]);
 		} else {
 			buf.d[0] = current->thread.fp_state.fpr[reg][0];
 			buf.d[1] = current->thread.fp_state.fpr[reg][1];
 		}
 	} else {
 		if (regs->msr & MSR_VEC)
-			store_vsrn(reg, &buf);
+			for (i = 0; i < nr_vsx_regs; i++)
+				store_vsrn(reg + i, &buf.v[i]);
 		else
-			buf.v = current->thread.vr_state.vr[reg - 32];
+			buf.v[0] = current->thread.vr_state.vr[reg - 32];
 	}
 	preempt_enable();
 	emulate_vsx_store(op, &buf, mem, cross_endian);
-- 
2.24.1

