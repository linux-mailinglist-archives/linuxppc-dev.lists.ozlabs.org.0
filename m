Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ACE8D6E53
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 08:15:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IhfhC/zK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrqTr0Xs6z30W4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 16:15:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IhfhC/zK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrqNM4Xbqz30Vh
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 16:10:27 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4515vAu2016297;
	Sat, 1 Jun 2024 06:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=UUr7WgXR8c8B7f+ngHK3rYzjhEXPKZVkT8PobcyjG3M=;
 b=IhfhC/zKW2wpAu5HvoEO0QTKoAYe9QC7CmhMcbgHXQd65k0L/qdLi2J7zOO8jbTNPjaa
 yLHpputH4EhLNCHNiJM6eVYVy6lEOrKfkrr2XHSnP+vhfPkie40JT78rIgP+9bRHyKqj
 N1l+GP3iLsM8CHBcT4A3hGacoY9d9dAomFX1fzMOswgF4qN8gwKyrRppUS/Rac0Kaj5N
 ZWkQAVTjbuYzY2fJnU3NXAIhZtNXQ186qfhMSrB0/wzbcsppDxo8W6FgcR+5v0/SNwwt
 FLV1Sh05vv4rf/6M7OjHzZssJkJF+6g4gajlrf+rGfVmlFG2abDSdY71Agx5ysY7qm7t kA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yfwxnr0y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Jun 2024 06:10:18 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4516AIhU009919;
	Sat, 1 Jun 2024 06:10:18 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yfwxnr0xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Jun 2024 06:10:18 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4514JDWp022540;
	Sat, 1 Jun 2024 06:10:17 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yfv180jym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Jun 2024 06:10:16 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4516ABZM21954940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 1 Jun 2024 06:10:13 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EB042004E;
	Sat,  1 Jun 2024 06:10:11 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8038A20043;
	Sat,  1 Jun 2024 06:10:08 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.41.43])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  1 Jun 2024 06:10:08 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V3 06/14] tools/perf: Update parameters for reg extract functions to use raw instruction on powerpc
Date: Sat,  1 Jun 2024 11:39:33 +0530
Message-Id: <20240601060941.13692-7-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240601060941.13692-1-atrajeev@linux.vnet.ibm.com>
References: <20240601060941.13692-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T1fyLirwVv78n3NdM0Ur9huskLyRcvdb
X-Proofpoint-ORIG-GUID: S4lm2u9NsjzEcdTPLx1raQebXfrjfE5l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-01_01,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406010045
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

Use the raw instruction code and macros to identify memory instructions,
extract register fields and also offset. The implementation addresses
the D-form, X-form, DS-form instructions. Two main functions are added.
New parse function "load_store__parse" as instruction ops parser for
memory instructions. Unlink other parser (like mov__parse), this parser
fills in the "raw_insn" field for source/target and new added "mem_ref"
field. Also set if it is multi_regs and opcode as well. No other fields
are set because, here there is no need to parse the disassembled
code and arch specific macros will take care of extracting offset and
regs which is easier and will be precise.

In powerpc, all instructions with a primary opcode from 32 to 63
are memory instructions. Update "ins__find" function to have "raw_insn"
also as a parameter. Don't use the "extract_reg_offset", instead use
newly added function "get_arch_regs" which will set these fields: reg1,
reg2, offset depending of where it is source or target ops.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../perf/arch/powerpc/annotate/instructions.c | 16 +++++
 tools/perf/arch/powerpc/util/dwarf-regs.c     | 44 +++++++++++++
 tools/perf/util/annotate.c                    | 25 +++++++-
 tools/perf/util/disasm.c                      | 64 +++++++++++++++++--
 tools/perf/util/disasm.h                      |  4 +-
 tools/perf/util/include/dwarf-regs.h          |  3 +
 6 files changed, 147 insertions(+), 9 deletions(-)

diff --git a/tools/perf/arch/powerpc/annotate/instructions.c b/tools/perf/arch/powerpc/annotate/instructions.c
index d57fd023ef9c..10fea5e5cf4c 100644
--- a/tools/perf/arch/powerpc/annotate/instructions.c
+++ b/tools/perf/arch/powerpc/annotate/instructions.c
@@ -49,6 +49,22 @@ static struct ins_ops *powerpc__associate_instruction_ops(struct arch *arch, con
 	return ops;
 }
 
+#define PPC_OP(op)      (((op) >> 26) & 0x3F)
+
+static struct ins_ops *check_ppc_insn(int raw_insn)
+{
+	int opcode = PPC_OP(raw_insn);
+
+	/*
+	 * Instructions with opcode 32 to 63 are memory
+	 * instructions in powerpc
+	 */
+	if ((opcode & 0x20))
+		return &load_store_ops;
+
+	return NULL;
+}
+
 static int powerpc__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
 {
 	if (!arch->initialized) {
diff --git a/tools/perf/arch/powerpc/util/dwarf-regs.c b/tools/perf/arch/powerpc/util/dwarf-regs.c
index 430623ca5612..38b74fa01d8b 100644
--- a/tools/perf/arch/powerpc/util/dwarf-regs.c
+++ b/tools/perf/arch/powerpc/util/dwarf-regs.c
@@ -107,3 +107,47 @@ int regs_query_register_offset(const char *name)
 #define PPC_DS(DS)	((DS) & 0xfffc)
 #define OP_LD	58
 #define OP_STD	62
+
+static int get_source_reg(unsigned int raw_insn)
+{
+	return PPC_RA(raw_insn);
+}
+
+static int get_target_reg(unsigned int raw_insn)
+{
+	return PPC_RT(raw_insn);
+}
+
+static int get_offset_opcode(int raw_insn __maybe_unused)
+{
+	int opcode = PPC_OP(raw_insn);
+
+	/* DS- form */
+	if ((opcode == OP_LD) || (opcode == OP_STD))
+		return PPC_DS(raw_insn);
+	else
+		return PPC_D(raw_insn);
+}
+
+/*
+ * Fills the required fields for op_loc depending on if it
+ * is a source or target.
+ * D form: ins RT,D(RA) -> src_reg1 = RA, offset = D, dst_reg1 = RT
+ * DS form: ins RT,DS(RA) -> src_reg1 = RA, offset = DS, dst_reg1 = RT
+ * X form: ins RT,RA,RB -> src_reg1 = RA, src_reg2 = RB, dst_reg1 = RT
+ */
+void get_arch_regs(int raw_insn __maybe_unused, int is_source __maybe_unused,
+		struct annotated_op_loc *op_loc __maybe_unused)
+{
+	if (is_source)
+		op_loc->reg1 = get_source_reg(raw_insn);
+	else
+		op_loc->reg1 = get_target_reg(raw_insn);
+
+	if (op_loc->multi_regs)
+		op_loc->reg2 = PPC_RB(raw_insn);
+
+	/* TODO: Implement offset handling for X Form */
+	if ((op_loc->mem_ref) && (PPC_OP(raw_insn) != 31))
+		op_loc->offset = get_offset_opcode(raw_insn);
+}
diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index 1451caf25e77..2b8cc759ae35 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -2079,6 +2079,12 @@ static int extract_reg_offset(struct arch *arch, const char *str,
 	return 0;
 }
 
+__weak void get_arch_regs(int raw_insn __maybe_unused, int is_source __maybe_unused,
+		struct annotated_op_loc *op_loc __maybe_unused)
+{
+	return;
+}
+
 /**
  * annotate_get_insn_location - Get location of instruction
  * @arch: the architecture info
@@ -2123,20 +2129,33 @@ int annotate_get_insn_location(struct arch *arch, struct disasm_line *dl,
 	for_each_insn_op_loc(loc, i, op_loc) {
 		const char *insn_str = ops->source.raw;
 		bool multi_regs = ops->source.multi_regs;
+		bool mem_ref = ops->source.mem_ref;
 
 		if (i == INSN_OP_TARGET) {
 			insn_str = ops->target.raw;
 			multi_regs = ops->target.multi_regs;
+			mem_ref = ops->target.mem_ref;
 		}
 
 		/* Invalidate the register by default */
 		op_loc->reg1 = -1;
 		op_loc->reg2 = -1;
 
-		if (insn_str == NULL)
-			continue;
+		if (insn_str == NULL) {
+			if (!arch__is(arch, "powerpc"))
+				continue;
+		}
 
-		if (strchr(insn_str, arch->objdump.memory_ref_char)) {
+		/*
+		 * For powerpc, call get_arch_regs function which extracts the
+		 * required fields for op_loc, ie reg1, reg2, offset from the
+		 * raw instruction.
+		 */
+		if (arch__is(arch, "powerpc")) {
+			op_loc->mem_ref = mem_ref;
+			op_loc->multi_regs = multi_regs;
+			get_arch_regs(ops->raw_insn, !i, op_loc);
+		} else if (strchr(insn_str, arch->objdump.memory_ref_char)) {
 			op_loc->mem_ref = true;
 			op_loc->multi_regs = multi_regs;
 			extract_reg_offset(arch, insn_str, op_loc);
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 61f0f1656f82..252cb0d1f5d1 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -37,6 +37,7 @@ static struct ins_ops mov_ops;
 static struct ins_ops nop_ops;
 static struct ins_ops lock_ops;
 static struct ins_ops ret_ops;
+static struct ins_ops load_store_ops;
 
 static int jump__scnprintf(struct ins *ins, char *bf, size_t size,
 			   struct ins_operands *ops, int max_ins_name);
@@ -517,7 +518,7 @@ static int lock__parse(struct arch *arch, struct ins_operands *ops, struct map_s
 	if (disasm_line__parse(ops->raw, &ops->locked.ins.name, &ops->locked.ops->raw) < 0)
 		goto out_free_ops;
 
-	ops->locked.ins.ops = ins__find(arch, ops->locked.ins.name);
+	ops->locked.ins.ops = ins__find(arch, ops->locked.ins.name, 0);
 
 	if (ops->locked.ins.ops == NULL)
 		goto out_free_ops;
@@ -672,6 +673,47 @@ static struct ins_ops mov_ops = {
 	.scnprintf = mov__scnprintf,
 };
 
+static int load_store__scnprintf(struct ins *ins, char *bf, size_t size,
+		struct ins_operands *ops, int max_ins_name)
+{
+	return scnprintf(bf, size, "%-*s %s", max_ins_name, ins->name,
+			ops->raw);
+}
+
+/*
+ * Sets the fields: "raw_insn", opcode, multi_regs and "mem_ref".
+ * "mem_ref" is set for ops->source which is later used to
+ * fill the objdump->memory_ref-char field. This ops is currently
+ * used by powerpc and since binary instruction code is used to
+ * extract opcode, regs and offset, no other parsing is needed here
+ */
+static int load_store__parse(struct arch *arch __maybe_unused, struct ins_operands *ops,
+		struct map_symbol *ms __maybe_unused)
+{
+	ops->source.raw_insn = ops->raw_insn;
+	ops->source.mem_ref = true;
+	ops->source.opcode = ops->opcode;
+	ops->source.multi_regs = false;
+
+	if (!ops->source.raw_insn)
+		return -1;
+
+	ops->target.raw_insn = ops->raw_insn;
+	ops->target.mem_ref = false;
+	ops->target.multi_regs = false;
+	ops->target.opcode = ops->opcode;
+
+	if (!ops->target.raw_insn)
+		return -1;
+
+	return 0;
+}
+
+static struct ins_ops load_store_ops = {
+	.parse     = load_store__parse,
+	.scnprintf = load_store__scnprintf,
+};
+
 static int dec__parse(struct arch *arch __maybe_unused, struct ins_operands *ops, struct map_symbol *ms __maybe_unused)
 {
 	char *target, *comment, *s, prev;
@@ -762,11 +804,23 @@ static void ins__sort(struct arch *arch)
 	qsort(arch->instructions, nmemb, sizeof(struct ins), ins__cmp);
 }
 
-static struct ins_ops *__ins__find(struct arch *arch, const char *name)
+static struct ins_ops *__ins__find(struct arch *arch, const char *name, int raw_insn)
 {
 	struct ins *ins;
 	const int nmemb = arch->nr_instructions;
 
+	if (arch__is(arch, "powerpc")) {
+		/*
+		 * For powerpc, identify the instruction ops
+		 * from the opcode using raw_insn.
+		 */
+		struct ins_ops *ops;
+
+		ops = check_ppc_insn(raw_insn);
+		if (ops)
+			return ops;
+	}
+
 	if (!arch->sorted_instructions) {
 		ins__sort(arch);
 		arch->sorted_instructions = true;
@@ -796,9 +850,9 @@ static struct ins_ops *__ins__find(struct arch *arch, const char *name)
 	return ins ? ins->ops : NULL;
 }
 
-struct ins_ops *ins__find(struct arch *arch, const char *name)
+struct ins_ops *ins__find(struct arch *arch, const char *name, int raw_insn)
 {
-	struct ins_ops *ops = __ins__find(arch, name);
+	struct ins_ops *ops = __ins__find(arch, name, raw_insn);
 
 	if (!ops && arch->associate_instruction_ops)
 		ops = arch->associate_instruction_ops(arch, name);
@@ -808,7 +862,7 @@ struct ins_ops *ins__find(struct arch *arch, const char *name)
 
 static void disasm_line__init_ins(struct disasm_line *dl, struct arch *arch, struct map_symbol *ms)
 {
-	dl->ins.ops = ins__find(arch, dl->ins.name);
+	dl->ins.ops = ins__find(arch, dl->ins.name, dl->ops.raw_insn);
 
 	if (!dl->ins.ops)
 		return;
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index a391e1bb81f7..831ebcc329cd 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -62,6 +62,7 @@ struct ins_operands {
 		bool	offset_avail;
 		bool	outside;
 		bool	multi_regs;
+		bool	mem_ref;
 	} target;
 	union {
 		struct {
@@ -71,6 +72,7 @@ struct ins_operands {
 			int	raw_insn;
 			u64	addr;
 			bool	multi_regs;
+			bool	mem_ref;
 		} source;
 		struct {
 			struct ins	    ins;
@@ -104,7 +106,7 @@ struct annotate_args {
 struct arch *arch__find(const char *name);
 bool arch__is(struct arch *arch, const char *name);
 
-struct ins_ops *ins__find(struct arch *arch, const char *name);
+struct ins_ops *ins__find(struct arch *arch, const char *name, int raw_insn);
 int ins__scnprintf(struct ins *ins, char *bf, size_t size,
 		   struct ins_operands *ops, int max_ins_name);
 
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 01fb25a1150a..7ea39362ecaf 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef _PERF_DWARF_REGS_H_
 #define _PERF_DWARF_REGS_H_
+#include "annotate.h"
 
 #define DWARF_REG_PC  0xd3af9c /* random number */
 #define DWARF_REG_FB  0xd3affb /* random number */
@@ -31,6 +32,8 @@ static inline int get_dwarf_regnum(const char *name __maybe_unused,
 }
 #endif
 
+void get_arch_regs(int raw_insn, int is_source, struct annotated_op_loc *op_loc);
+
 #ifdef HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET
 /*
  * Arch should support fetching the offset of a register in pt_regs
-- 
2.43.0

