Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1997234128
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 10:23:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJ0fH3VHTzDqcQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 18:23:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJ0W62fy9zDqbp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 18:17:05 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06V845ZZ076561; Fri, 31 Jul 2020 04:17:00 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32m2h233e5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 04:17:00 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06V8FTa6026896;
 Fri, 31 Jul 2020 08:16:59 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 32gcy4q119-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 08:16:59 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06V8FUE656492348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jul 2020 08:15:30 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DB1E11C052;
 Fri, 31 Jul 2020 08:16:56 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E9C211C054;
 Fri, 31 Jul 2020 08:16:54 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.77.199.67])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 31 Jul 2020 08:16:54 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3 2/4] powerpc/sstep: support emulation for vsx vector paired
 storage access instructions
Date: Fri, 31 Jul 2020 13:46:35 +0530
Message-Id: <20200731081637.1837559-3-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200731081637.1837559-1-bala24@linux.ibm.com>
References: <20200731081637.1837559-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_02:2020-07-31,
 2020-07-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=1
 priorityscore=1501 phishscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007310054
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
Cc: ravi.bangoria@linux.ibm.com, Balamuruhan S <bala24@linux.ibm.com>,
 paulus@samba.org, sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

add emulate_step() changes to support vsx vector paired storage
access instructions that provides octword operands loads/stores
between storage and set of 64 Vector Scalar Registers (VSRs).

Suggested-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Suggested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/lib/sstep.c | 77 +++++++++++++++++++++++++++++++---------
 1 file changed, 60 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 22147257d74d..01e1a3adc406 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -280,6 +280,19 @@ static nokprobe_inline void do_byte_reverse(void *ptr, int nb)
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
@@ -710,6 +723,8 @@ void emulate_vsx_load(struct instruction_op *op, union vsx_reg *reg,
 	reg->d[0] = reg->d[1] = 0;
 
 	switch (op->element_size) {
+	case 32:
+		/* [p]lxvp[x] */
 	case 16:
 		/* whole vector; lxv[x] or lxvl[l] */
 		if (size == 0)
@@ -718,7 +733,7 @@ void emulate_vsx_load(struct instruction_op *op, union vsx_reg *reg,
 		if (IS_LE && (op->vsx_flags & VSX_LDLEFT))
 			rev = !rev;
 		if (rev)
-			do_byte_reverse(reg, 16);
+			do_byte_reverse(reg, size);
 		break;
 	case 8:
 		/* scalar loads, lxvd2x, lxvdsx */
@@ -794,6 +809,20 @@ void emulate_vsx_store(struct instruction_op *op, const union vsx_reg *reg,
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
@@ -862,28 +891,35 @@ static nokprobe_inline int do_vsx_load(struct instruction_op *op,
 				       bool cross_endian)
 {
 	int reg = op->reg;
-	u8 mem[16];
-	union vsx_reg buf;
+	int i, nr_vsx_regs;
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
+			for (i = 0; i < nr_vsx_regs; i++)
+				load_vsrn(reg + i, &buf[i].v);
 		} else {
-			current->thread.fp_state.fpr[reg][0] = buf.d[0];
-			current->thread.fp_state.fpr[reg][1] = buf.d[1];
+			for (i = 0; i < nr_vsx_regs; i++) {
+				current->thread.fp_state.fpr[reg + i][0] = buf[i].d[0];
+				current->thread.fp_state.fpr[reg + i][1] = buf[i].d[1];
+			}
 		}
 	} else {
 		if (regs->msr & MSR_VEC)
-			load_vsrn(reg, &buf);
+			for (i = 0; i < nr_vsx_regs; i++)
+				load_vsrn(reg + i, &buf[i].v);
 		else
-			current->thread.vr_state.vr[reg - 32] = buf.v;
+			for (i = 0; i < nr_vsx_regs; i++)
+				current->thread.vr_state.vr[reg - 32 + i] = buf[i].v;
 	}
 	preempt_enable();
 	return 0;
@@ -894,30 +930,37 @@ static nokprobe_inline int do_vsx_store(struct instruction_op *op,
 					bool cross_endian)
 {
 	int reg = op->reg;
-	u8 mem[16];
-	union vsx_reg buf;
+	int i, nr_vsx_regs;
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
+			for (i = 0; i < nr_vsx_regs; i++)
+				store_vsrn(reg + i, &buf[i].v);
 		} else {
-			buf.d[0] = current->thread.fp_state.fpr[reg][0];
-			buf.d[1] = current->thread.fp_state.fpr[reg][1];
+			for (i = 0; i < nr_vsx_regs; i++) {
+				buf[i].d[0] = current->thread.fp_state.fpr[reg + i][0];
+				buf[i].d[1] = current->thread.fp_state.fpr[reg + i][1];
+			}
 		}
 	} else {
 		if (regs->msr & MSR_VEC)
-			store_vsrn(reg, &buf);
+			for (i = 0; i < nr_vsx_regs; i++)
+				store_vsrn(reg + i, &buf[i].v);
 		else
-			buf.v = current->thread.vr_state.vr[reg - 32];
+			for (i = 0; i < nr_vsx_regs; i++)
+				buf[i].v = current->thread.vr_state.vr[reg - 32 + i];
 	}
 	preempt_enable();
-	emulate_vsx_store(op, &buf, mem, cross_endian);
+	emulate_vsx_store(op, buf, mem, cross_endian);
 	return  copy_mem_out(mem, ea, size, regs);
 }
 #endif /* CONFIG_VSX */
-- 
2.24.1

