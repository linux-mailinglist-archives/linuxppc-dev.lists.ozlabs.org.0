Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05727930694
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2024 19:03:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=evAqR8RQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WLvtf6RfLz3cgd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 03:03:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=evAqR8RQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WLvkC6zfqz3cy9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 02:56:19 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46DGR9xW007645;
	Sat, 13 Jul 2024 16:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=UtIuzeR5Xaa3x
	TS4OHvG23iJyP172k43SC7eZJ5Us0o=; b=evAqR8RQ2FBSkVGT6cI0ITWnc6tw4
	9na24cI7lwMavsZZzVh/Xi9/m+7xAEAnYzNW3VtZfOcV41hbnWltcjvlYgNpN52Y
	1VObgHit4jh5UF5jgdMz9OaF5f9oQN7r9IDFzryM5kWM6uOs1s8DTjt7NkY5Won7
	WXwJ6I3tVInNtOnkP2Fw8rRbMJybAHMhEuawgJTDvxQhQXuME3MVCD7DIxXXMw7K
	dI1MpbBA3GMICwV9+U7TZjbLkkabEW1uvsPQi617jAz2XQalWYTKUI1eTyXAcvfO
	zc7B98JAo7kTToqMYPUeiHr6gJ4efC0uMml5CaCpp2QOP5zTvW5tqqBMg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40brr2gchj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jul 2024 16:56:11 +0000 (GMT)
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46DGuBss016001;
	Sat, 13 Jul 2024 16:56:11 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40brr2gchb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jul 2024 16:56:11 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46DF4JT8024694;
	Sat, 13 Jul 2024 16:56:10 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 407g8uvhu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jul 2024 16:56:09 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46DGu4Sb51380482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 13 Jul 2024 16:56:06 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A1C720043;
	Sat, 13 Jul 2024 16:56:04 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ACC2820040;
	Sat, 13 Jul 2024 16:56:01 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.49.134])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 13 Jul 2024 16:56:01 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V7 09/18] tools/perf: Add some of the arithmetic instructions to support instruction tracking in powerpc
Date: Sat, 13 Jul 2024 22:25:20 +0530
Message-Id: <20240713165529.59298-10-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240713165529.59298-1-atrajeev@linux.vnet.ibm.com>
References: <20240713165529.59298-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: S5bxSjyWrZjXl2zfyk0Y3dwda6MAMv2f
X-Proofpoint-ORIG-GUID: ntKaGf5gt5iWVWIEa1r42zq9MYglV4zB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_13,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407130127
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Data type profiling has concept of instruction tracking.
Example sequence in powerpc:

	ld      r10,264(r3)
	mr      r31,r3
	<<after some sequence>
	ld      r9,312(r31)

or differently

	lwz	r10,264(r3)
	add	r31, r3, RB
	lwz	r9, 0(r31)

If a sample is hit at "lwz r9, 0(r31)", data type of r31 depends
on previous instruction sequence here. So to track the previous
instructions, patch adds changes to identify some of the arithmetic
instructions which are having opcode as 31. Since memory instructions
also has cases with opcode 31, use the bits 22:30 to filter the
arithmetic instructions here. Also there are instructions with just
two operands like addme, addze. Patch adds new instructions ops
"arithmetic_ops" to handle this

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../perf/arch/powerpc/annotate/instructions.c | 49 ++++++++++++++++++
 tools/perf/util/disasm.c                      | 51 +++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/tools/perf/arch/powerpc/annotate/instructions.c b/tools/perf/arch/powerpc/annotate/instructions.c
index 1ffb64c6bd0d..aa5ee09fa28f 100644
--- a/tools/perf/arch/powerpc/annotate/instructions.c
+++ b/tools/perf/arch/powerpc/annotate/instructions.c
@@ -51,6 +51,7 @@ static struct ins_ops *powerpc__associate_instruction_ops(struct arch *arch, con
 
 #define PPC_OP(op)	(((op) >> 26) & 0x3F)
 #define PPC_21_30(R)	(((R) >> 1) & 0x3ff)
+#define PPC_22_30(R)	(((R) >> 1) & 0x1ff)
 
 struct insn_offset {
 	const char	*name;
@@ -134,6 +135,44 @@ static struct insn_offset ins_array[] = {
 	{ .name = "OP_31_XOP_STFIWX",	.value = 983, },
 };
 
+/*
+ * Arithmetic instructions which are having opcode as 31.
+ * These instructions are tracked to save the register state
+ * changes. Example:
+ *
+ * lwz	r10,264(r3)
+ * add	r31, r3, r3
+ * lwz	r9, 0(r31)
+ *
+ * Here instruction tracking needs to identify the "add"
+ * instruction and save data type of r3 to r31. If a sample
+ * is hit at next "lwz r9, 0(r31)", by this instruction tracking,
+ * data type of r31 can be resolved.
+ */
+static struct insn_offset arithmetic_ins_op_31[] = {
+	{ .name = "SUB_CARRY_XO_FORM",  .value = 8, },
+	{ .name = "MUL_HDW_XO_FORM1",   .value = 9, },
+	{ .name = "ADD_CARRY_XO_FORM",  .value = 10, },
+	{ .name = "MUL_HW_XO_FORM1",    .value = 11, },
+	{ .name = "SUB_XO_FORM",        .value = 40, },
+	{ .name = "MUL_HDW_XO_FORM",    .value = 73, },
+	{ .name = "MUL_HW_XO_FORM",     .value = 75, },
+	{ .name = "SUB_EXT_XO_FORM",    .value = 136, },
+	{ .name = "ADD_EXT_XO_FORM",    .value = 138, },
+	{ .name = "SUB_ZERO_EXT_XO_FORM",       .value = 200, },
+	{ .name = "ADD_ZERO_EXT_XO_FORM",       .value = 202, },
+	{ .name = "SUB_EXT_XO_FORM2",   .value = 232, },
+	{ .name = "MUL_DW_XO_FORM",     .value = 233, },
+	{ .name = "ADD_EXT_XO_FORM2",   .value = 234, },
+	{ .name = "MUL_W_XO_FORM",      .value = 235, },
+	{ .name = "ADD_XO_FORM",	.value = 266, },
+	{ .name = "DIV_DW_XO_FORM1",    .value = 457, },
+	{ .name = "DIV_W_XO_FORM1",     .value = 459, },
+	{ .name = "DIV_DW_XO_FORM",	.value = 489, },
+	{ .name = "DIV_W_XO_FORM",	.value = 491, },
+};
+
+
 static int cmp_offset(const void *a, const void *b)
 {
 	const struct insn_offset *val1 = a;
@@ -163,6 +202,16 @@ static struct ins_ops *check_ppc_insn(u32 raw_insn)
 		ret = bsearch(&mem_insns_31_opcode, ins_array, ARRAY_SIZE(ins_array), sizeof(ins_array[0]), cmp_offset);
 		if (ret != NULL)
 			return &load_store_ops;
+		else {
+			mem_insns_31_opcode.value = PPC_22_30(raw_insn);
+			ret = bsearch(&mem_insns_31_opcode, arithmetic_ins_op_31, ARRAY_SIZE(arithmetic_ins_op_31),
+					sizeof(arithmetic_ins_op_31[0]), cmp_offset);
+			if (ret != NULL)
+				return &arithmetic_ops;
+			/* Bits 21 to 30 has value 444 for "mr" insn ie, OR X form */
+			if (PPC_21_30(raw_insn) == 444)
+				return &arithmetic_ops;
+		}
 	}
 
 	return NULL;
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index d39ff19ea081..801d57287a35 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -38,6 +38,7 @@ static struct ins_ops nop_ops;
 static struct ins_ops lock_ops;
 static struct ins_ops ret_ops;
 static struct ins_ops load_store_ops;
+static struct ins_ops arithmetic_ops;
 
 static int jump__scnprintf(struct ins *ins, char *bf, size_t size,
 			   struct ins_operands *ops, int max_ins_name);
@@ -679,6 +680,56 @@ static struct ins_ops mov_ops = {
 	.scnprintf = mov__scnprintf,
 };
 
+#define PPC_22_30(R)    (((R) >> 1) & 0x1ff)
+#define MINUS_EXT_XO_FORM	234
+#define SUB_EXT_XO_FORM		232
+#define	ADD_ZERO_EXT_XO_FORM	202
+#define	SUB_ZERO_EXT_XO_FORM	200
+
+static int arithmetic__scnprintf(struct ins *ins, char *bf, size_t size,
+		struct ins_operands *ops, int max_ins_name)
+{
+	return scnprintf(bf, size, "%-*s %s", max_ins_name, ins->name,
+			ops->raw);
+}
+
+/*
+ * Sets the fields: multi_regs and "mem_ref".
+ * "mem_ref" is set for ops->source which is later used to
+ * fill the objdump->memory_ref-char field. This ops is currently
+ * used by powerpc and since binary instruction code is used to
+ * extract opcode, regs and offset, no other parsing is needed here.
+ *
+ * Dont set multi regs for 4 cases since it has only one operand
+ * for source:
+ * - Add to Minus One Extended XO-form ( Ex: addme, addmeo )
+ * - Subtract From Minus One Extended XO-form ( Ex: subfme )
+ * - Add to Zero Extended XO-form ( Ex: addze, addzeo )
+ * - Subtract From Zero Extended XO-form ( Ex: subfze )
+ */
+static int arithmetic__parse(struct arch *arch __maybe_unused, struct ins_operands *ops,
+		struct map_symbol *ms __maybe_unused, struct disasm_line *dl)
+{
+	int opcode = PPC_OP(dl->raw.raw_insn);
+
+	ops->source.mem_ref = false;
+	if (opcode == 31) {
+		if ((opcode != MINUS_EXT_XO_FORM) && (opcode != SUB_EXT_XO_FORM) \
+				&& (opcode != ADD_ZERO_EXT_XO_FORM) && (opcode != SUB_ZERO_EXT_XO_FORM))
+			ops->source.multi_regs = true;
+	}
+
+	ops->target.mem_ref = false;
+	ops->target.multi_regs = false;
+
+	return 0;
+}
+
+static struct ins_ops arithmetic_ops = {
+	.parse     = arithmetic__parse,
+	.scnprintf = arithmetic__scnprintf,
+};
+
 static int load_store__scnprintf(struct ins *ins, char *bf, size_t size,
 		struct ins_operands *ops, int max_ins_name)
 {
-- 
2.43.0

