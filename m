Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F636934A60
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 10:50:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TARIBdDg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPmj32ftFz3dJs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 18:50:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TARIBdDg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPmbW6tcrz3dRb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 18:45:27 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I7ocj2001156;
	Thu, 18 Jul 2024 08:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=+0LKTMb3TFeqT
	otJZTC1Sq07DPASs8Vuhg+WTCDaIEw=; b=TARIBdDgjbrv64PudC0n9+USpMn8I
	fIEFWLCwyEh+6UCnAnis+F58A8cFd+NwdL9UQjnS+1/U9B7I1BnzrCgT2rDwcZL/
	jA7WXUymZ7qpyFPb+msZv0IL/ItT9D/UUvrLIOcq/tY075zkiTfhw5PAwGbvczVi
	SOdBgSQ6ueUaGwOOBKFt11ApEfWJH3A7zYPsqX3RmsE5JFDLg3jBRZVXmNTKwtrM
	3nzIAsGR2hjql+56Lb1JdV46WUACf2hLxSS9rgFegHMRIC6kiD+eoScGiM94dXzO
	A7uDO/N3R5YufFT6weIwi/hQNvYOmuALrhYR0kVTUS4EXHQZjD0K0e+BA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40eev9agbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 08:45:19 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46I8jIO3018299;
	Thu, 18 Jul 2024 08:45:18 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40eev9agbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 08:45:18 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46I50lm0006337;
	Thu, 18 Jul 2024 08:45:17 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 40dwkmgrtj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 08:45:17 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46I8jCt950856406
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Jul 2024 08:45:14 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 154F42004D;
	Thu, 18 Jul 2024 08:45:12 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F026020040;
	Thu, 18 Jul 2024 08:45:08 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.69.1])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Jul 2024 08:45:08 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V8 06/15] tools/perf: Update parameters for reg extract functions to use raw instruction on powerpc
Date: Thu, 18 Jul 2024 14:13:49 +0530
Message-Id: <20240718084358.72242-7-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240718084358.72242-1-atrajeev@linux.vnet.ibm.com>
References: <20240718084358.72242-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: G4fz4dMmnwyOV2wXSLjicYgtTblkYFvh
X-Proofpoint-GUID: ADp3X01xbXOc5jQgnZCdfcw-d3S0A7Wf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_04,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407180054
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the raw instruction code and macros to identify memory instructions,
extract register fields and also offset. The implementation addresses
the D-form, X-form, DS-form instructions. Adds "mem_ref" field to check
whether source/target has memory reference. Add function
"get_powerpc_regs" which will set these fields: reg1, reg2, offset
depending of where it is source or target ops.

Update "parse" callback for "struct ins_ops" to also pass "struct
disasm_line" as argument. This is needed in parse functions where opcode
is used to determine whether to set multi_regs and other fields

Reviewed-and-tested-by: Kajol Jain <kjain@linux.ibm.com>
Reviewed-by: Namhyung Kim <namhyung@kernel.org>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/arch/arm64/annotate/instructions.c |  3 +-
 .../arch/loongarch/annotate/instructions.c    |  6 ++-
 tools/perf/arch/powerpc/util/dwarf-regs.c     | 44 +++++++++++++++++++
 tools/perf/arch/s390/annotate/instructions.c  |  5 ++-
 tools/perf/util/annotate.c                    | 19 ++++++--
 tools/perf/util/disasm.c                      | 19 +++++---
 tools/perf/util/disasm.h                      |  5 ++-
 tools/perf/util/include/dwarf-regs.h          | 11 +++++
 8 files changed, 96 insertions(+), 16 deletions(-)

diff --git a/tools/perf/arch/arm64/annotate/instructions.c b/tools/perf/arch/arm64/annotate/instructions.c
index 4af0c3a0f86e..f86d9f4798bd 100644
--- a/tools/perf/arch/arm64/annotate/instructions.c
+++ b/tools/perf/arch/arm64/annotate/instructions.c
@@ -11,7 +11,8 @@ struct arm64_annotate {
 
 static int arm64_mov__parse(struct arch *arch __maybe_unused,
 			    struct ins_operands *ops,
-			    struct map_symbol *ms __maybe_unused)
+			    struct map_symbol *ms __maybe_unused,
+			    struct disasm_line *dl __maybe_unused)
 {
 	char *s = strchr(ops->raw, ','), *target, *endptr;
 
diff --git a/tools/perf/arch/loongarch/annotate/instructions.c b/tools/perf/arch/loongarch/annotate/instructions.c
index 21cc7e4149f7..ab43b1ab51e3 100644
--- a/tools/perf/arch/loongarch/annotate/instructions.c
+++ b/tools/perf/arch/loongarch/annotate/instructions.c
@@ -5,7 +5,8 @@
  * Copyright (C) 2020-2023 Loongson Technology Corporation Limited
  */
 
-static int loongarch_call__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms)
+static int loongarch_call__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
+		struct disasm_line *dl __maybe_unused)
 {
 	char *c, *endptr, *tok, *name;
 	struct map *map = ms->map;
@@ -51,7 +52,8 @@ static struct ins_ops loongarch_call_ops = {
 	.scnprintf = call__scnprintf,
 };
 
-static int loongarch_jump__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms)
+static int loongarch_jump__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
+		struct disasm_line *dl __maybe_unused)
 {
 	struct map *map = ms->map;
 	struct symbol *sym = ms->sym;
diff --git a/tools/perf/arch/powerpc/util/dwarf-regs.c b/tools/perf/arch/powerpc/util/dwarf-regs.c
index 430623ca5612..104c7ae5c433 100644
--- a/tools/perf/arch/powerpc/util/dwarf-regs.c
+++ b/tools/perf/arch/powerpc/util/dwarf-regs.c
@@ -107,3 +107,47 @@ int regs_query_register_offset(const char *name)
 #define PPC_DS(DS)	((DS) & 0xfffc)
 #define OP_LD	58
 #define OP_STD	62
+
+static int get_source_reg(u32 raw_insn)
+{
+	return PPC_RA(raw_insn);
+}
+
+static int get_target_reg(u32 raw_insn)
+{
+	return PPC_RT(raw_insn);
+}
+
+static int get_offset_opcode(u32 raw_insn)
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
+void get_powerpc_regs(u32 raw_insn, int is_source,
+		struct annotated_op_loc *op_loc)
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
diff --git a/tools/perf/arch/s390/annotate/instructions.c b/tools/perf/arch/s390/annotate/instructions.c
index da5aa3e1f04c..eeac25cca699 100644
--- a/tools/perf/arch/s390/annotate/instructions.c
+++ b/tools/perf/arch/s390/annotate/instructions.c
@@ -2,7 +2,7 @@
 #include <linux/compiler.h>
 
 static int s390_call__parse(struct arch *arch, struct ins_operands *ops,
-			    struct map_symbol *ms)
+			    struct map_symbol *ms, struct disasm_line *dl __maybe_unused)
 {
 	char *endptr, *tok, *name;
 	struct map *map = ms->map;
@@ -52,7 +52,8 @@ static struct ins_ops s390_call_ops = {
 
 static int s390_mov__parse(struct arch *arch __maybe_unused,
 			   struct ins_operands *ops,
-			   struct map_symbol *ms __maybe_unused)
+			   struct map_symbol *ms __maybe_unused,
+			   struct disasm_line *dl __maybe_unused)
 {
 	char *s = strchr(ops->raw, ','), *target, *endptr;
 
diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index 1451caf25e77..ce99db291c5e 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -2123,20 +2123,33 @@ int annotate_get_insn_location(struct arch *arch, struct disasm_line *dl,
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
+		 * For powerpc, call get_powerpc_regs function which extracts the
+		 * required fields for op_loc, ie reg1, reg2, offset from the
+		 * raw instruction.
+		 */
+		if (arch__is(arch, "powerpc")) {
+			op_loc->mem_ref = mem_ref;
+			op_loc->multi_regs = multi_regs;
+			get_powerpc_regs(dl->raw.raw_insn, !i, op_loc);
+		} else if (strchr(insn_str, arch->objdump.memory_ref_char)) {
 			op_loc->mem_ref = true;
 			op_loc->multi_regs = multi_regs;
 			extract_reg_offset(arch, insn_str, op_loc);
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 646290b043b2..8e45f0874e03 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -256,7 +256,8 @@ bool ins__is_fused(struct arch *arch, const char *ins1, const char *ins2)
 	return arch->ins_is_fused(arch, ins1, ins2);
 }
 
-static int call__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms)
+static int call__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
+		struct disasm_line *dl __maybe_unused)
 {
 	char *endptr, *tok, *name;
 	struct map *map = ms->map;
@@ -351,7 +352,8 @@ static inline const char *validate_comma(const char *c, struct ins_operands *ops
 	return c;
 }
 
-static int jump__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms)
+static int jump__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
+		struct disasm_line *dl __maybe_unused)
 {
 	struct map *map = ms->map;
 	struct symbol *sym = ms->sym;
@@ -510,7 +512,8 @@ static int comment__symbol(char *raw, char *comment, u64 *addrp, char **namep)
 	return 0;
 }
 
-static int lock__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms)
+static int lock__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
+		struct disasm_line *dl __maybe_unused)
 {
 	ops->locked.ops = zalloc(sizeof(*ops->locked.ops));
 	if (ops->locked.ops == NULL)
@@ -525,7 +528,7 @@ static int lock__parse(struct arch *arch, struct ins_operands *ops, struct map_s
 		goto out_free_ops;
 
 	if (ops->locked.ins.ops->parse &&
-	    ops->locked.ins.ops->parse(arch, ops->locked.ops, ms) < 0)
+	    ops->locked.ins.ops->parse(arch, ops->locked.ops, ms, NULL) < 0)
 		goto out_free_ops;
 
 	return 0;
@@ -596,7 +599,8 @@ static bool check_multi_regs(struct arch *arch, const char *op)
 	return count > 1;
 }
 
-static int mov__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms __maybe_unused)
+static int mov__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms __maybe_unused,
+		struct disasm_line *dl __maybe_unused)
 {
 	char *s = strchr(ops->raw, ','), *target, *comment, prev;
 
@@ -674,7 +678,8 @@ static struct ins_ops mov_ops = {
 	.scnprintf = mov__scnprintf,
 };
 
-static int dec__parse(struct arch *arch __maybe_unused, struct ins_operands *ops, struct map_symbol *ms __maybe_unused)
+static int dec__parse(struct arch *arch __maybe_unused, struct ins_operands *ops, struct map_symbol *ms __maybe_unused,
+		struct disasm_line *dl __maybe_unused)
 {
 	char *target, *comment, *s, prev;
 
@@ -815,7 +820,7 @@ static void disasm_line__init_ins(struct disasm_line *dl, struct arch *arch, str
 	if (!dl->ins.ops)
 		return;
 
-	if (dl->ins.ops->parse && dl->ins.ops->parse(arch, &dl->ops, ms) < 0)
+	if (dl->ins.ops->parse && dl->ins.ops->parse(arch, &dl->ops, ms, dl) < 0)
 		dl->ins.ops = NULL;
 }
 
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index c835759c8e2b..30be0a94ea04 100644
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
@@ -69,6 +70,7 @@ struct ins_operands {
 			char	*name;
 			u64	addr;
 			bool	multi_regs;
+			bool	mem_ref;
 		} source;
 		struct {
 			struct ins	    ins;
@@ -83,7 +85,8 @@ struct ins_operands {
 
 struct ins_ops {
 	void (*free)(struct ins_operands *ops);
-	int (*parse)(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms);
+	int (*parse)(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
+			struct disasm_line *dl);
 	int (*scnprintf)(struct ins *ins, char *bf, size_t size,
 			 struct ins_operands *ops, int max_ins_name);
 };
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 01fb25a1150a..75b28dcc8317 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef _PERF_DWARF_REGS_H_
 #define _PERF_DWARF_REGS_H_
+#include "annotate.h"
 
 #define DWARF_REG_PC  0xd3af9c /* random number */
 #define DWARF_REG_FB  0xd3affb /* random number */
@@ -31,6 +32,16 @@ static inline int get_dwarf_regnum(const char *name __maybe_unused,
 }
 #endif
 
+#if !defined(__powerpc__) || !defined(HAVE_DWARF_SUPPORT)
+static inline void get_powerpc_regs(u32 raw_insn __maybe_unused, int is_source __maybe_unused,
+		struct annotated_op_loc *op_loc __maybe_unused)
+{
+	return;
+}
+#else
+void get_powerpc_regs(u32 raw_insn, int is_source, struct annotated_op_loc *op_loc);
+#endif
+
 #ifdef HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET
 /*
  * Arch should support fetching the offset of a register in pt_regs
-- 
2.43.0

