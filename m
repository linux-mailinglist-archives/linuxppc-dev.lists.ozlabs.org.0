Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B969D8D6E4D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 08:13:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iGynyR3r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrqRL71sRz30V1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 16:13:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iGynyR3r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrqNH4j88z30VJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 16:10:23 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4515oXcQ017441;
	Sat, 1 Jun 2024 06:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=22VSPfHLJCj1Z99y/lF4467dDgjD0DULHeuhYPQKV7Q=;
 b=iGynyR3rwLQQWKlPpmzDPT46Jj/B5RZ5hun2GqwDgwgSOWrleFWm3T8rPcqG57Di0cft
 HTeP9CujgV2OKgw+4mnpV/keNEM/pX3uez8Le98n2EJ92g7ZG78tSZKw3grucela3dUW
 iFjUXtdFEQS3n0+VdtnSZR6+7CysavVDpvHiEgw4eLsglmkWwYSOQz8sLYZZWKZmbagD
 UGhlXXTKjwG3VZN+aIgGJRNP25g0TR2mwuopSXVOzbHU0m0+JERBtxx2/PuIWxfCZjP9
 BXnVPk47iSGE3cKqUdKas4CjMntkAbOmBbLbg/lEoExEll1mBzD4fgwKtnD5XAAVNoAc JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yfwgy02bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Jun 2024 06:10:05 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4516A491020201;
	Sat, 1 Jun 2024 06:10:04 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yfwgy02b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Jun 2024 06:10:04 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4514JDJV013136;
	Sat, 1 Jun 2024 06:10:04 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yfvad8ghm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Jun 2024 06:10:03 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45169w1Q43122946
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 1 Jun 2024 06:10:00 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0328920040;
	Sat,  1 Jun 2024 06:09:58 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2BB920043;
	Sat,  1 Jun 2024 06:09:54 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.41.43])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  1 Jun 2024 06:09:54 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V3 02/14] tools/perf: Add "update_insn_state" callback function to handle arch specific instruction tracking
Date: Sat,  1 Jun 2024 11:39:29 +0530
Message-Id: <20240601060941.13692-3-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240601060941.13692-1-atrajeev@linux.vnet.ibm.com>
References: <20240601060941.13692-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: V81T6T0zla8X88ybjfl6W-qKiJMxR-il
X-Proofpoint-ORIG-GUID: R7eMI8TjF5oMAGEKBVV4QITR4nM8UpOu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-01_01,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406010045
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

Add "update_insn_state" callback to "struct arch" to handle instruction
tracking. Currently updating instruction state is handled by static
function "update_insn_state_x86" which is defined in "annotate-data.c".
Make this as a callback for specific arch and move to archs specific
file "arch/x86/annotate/instructions.c" . This will help to add helper
function for other platforms in file:
"arch/<platform>/annotate/instructions.c and make changes/updates
easier.

Define callback "update_insn_state" as part of "struct arch", also make
some of the debug functions non-static so that it can be referenced from
other places.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/arch/x86/annotate/instructions.c | 383 +++++++++++++++++++
 tools/perf/util/annotate-data.c             | 391 +-------------------
 tools/perf/util/annotate-data.h             |  23 ++
 tools/perf/util/disasm.c                    |   2 +
 tools/perf/util/disasm.h                    |   7 +
 5 files changed, 423 insertions(+), 383 deletions(-)

diff --git a/tools/perf/arch/x86/annotate/instructions.c b/tools/perf/arch/x86/annotate/instructions.c
index 5cdf457f5cbe..715d8ce65f7f 100644
--- a/tools/perf/arch/x86/annotate/instructions.c
+++ b/tools/perf/arch/x86/annotate/instructions.c
@@ -206,3 +206,386 @@ static int x86__annotate_init(struct arch *arch, char *cpuid)
 	arch->initialized = true;
 	return err;
 }
+
+#ifdef HAVE_DWARF_SUPPORT
+static void update_insn_state_x86(struct type_state *state,
+				  struct data_loc_info *dloc, Dwarf_Die *cu_die,
+				  struct disasm_line *dl)
+{
+	struct annotated_insn_loc loc;
+	struct annotated_op_loc *src = &loc.ops[INSN_OP_SOURCE];
+	struct annotated_op_loc *dst = &loc.ops[INSN_OP_TARGET];
+	struct type_state_reg *tsr;
+	Dwarf_Die type_die;
+	u32 insn_offset = dl->al.offset;
+	int fbreg = dloc->fbreg;
+	int fboff = 0;
+
+	if (annotate_get_insn_location(dloc->arch, dl, &loc) < 0)
+		return;
+
+	if (ins__is_call(&dl->ins)) {
+		struct symbol *func = dl->ops.target.sym;
+
+		if (func == NULL)
+			return;
+
+		/* __fentry__ will preserve all registers */
+		if (!strcmp(func->name, "__fentry__"))
+			return;
+
+		pr_debug_dtp("call [%x] %s\n", insn_offset, func->name);
+
+		/* Otherwise invalidate caller-saved registers after call */
+		for (unsigned i = 0; i < ARRAY_SIZE(state->regs); i++) {
+			if (state->regs[i].caller_saved)
+				state->regs[i].ok = false;
+		}
+
+		/* Update register with the return type (if any) */
+		if (die_find_func_rettype(cu_die, func->name, &type_die)) {
+			tsr = &state->regs[state->ret_reg];
+			tsr->type = type_die;
+			tsr->kind = TSR_KIND_TYPE;
+			tsr->ok = true;
+
+			pr_debug_dtp("call [%x] return -> reg%d",
+				     insn_offset, state->ret_reg);
+			pr_debug_type_name(&type_die, tsr->kind);
+		}
+		return;
+	}
+
+	if (!strncmp(dl->ins.name, "add", 3)) {
+		u64 imm_value = -1ULL;
+		int offset;
+		const char *var_name = NULL;
+		struct map_symbol *ms = dloc->ms;
+		u64 ip = ms->sym->start + dl->al.offset;
+
+		if (!has_reg_type(state, dst->reg1))
+			return;
+
+		tsr = &state->regs[dst->reg1];
+
+		if (src->imm)
+			imm_value = src->offset;
+		else if (has_reg_type(state, src->reg1) &&
+			 state->regs[src->reg1].kind == TSR_KIND_CONST)
+			imm_value = state->regs[src->reg1].imm_value;
+		else if (src->reg1 == DWARF_REG_PC) {
+			u64 var_addr = annotate_calc_pcrel(dloc->ms, ip,
+							   src->offset, dl);
+
+			if (get_global_var_info(dloc, var_addr,
+						&var_name, &offset) &&
+			    !strcmp(var_name, "this_cpu_off") &&
+			    tsr->kind == TSR_KIND_CONST) {
+				tsr->kind = TSR_KIND_PERCPU_BASE;
+				imm_value = tsr->imm_value;
+			}
+		}
+		else
+			return;
+
+		if (tsr->kind != TSR_KIND_PERCPU_BASE)
+			return;
+
+		if (get_global_var_type(cu_die, dloc, ip, imm_value, &offset,
+					&type_die) && offset == 0) {
+			/*
+			 * This is not a pointer type, but it should be treated
+			 * as a pointer.
+			 */
+			tsr->type = type_die;
+			tsr->kind = TSR_KIND_POINTER;
+			tsr->ok = true;
+
+			pr_debug_dtp("add [%x] percpu %#"PRIx64" -> reg%d",
+				     insn_offset, imm_value, dst->reg1);
+			pr_debug_type_name(&tsr->type, tsr->kind);
+		}
+		return;
+	}
+
+	if (strncmp(dl->ins.name, "mov", 3))
+		return;
+
+	if (dloc->fb_cfa) {
+		u64 ip = dloc->ms->sym->start + dl->al.offset;
+		u64 pc = map__rip_2objdump(dloc->ms->map, ip);
+
+		if (die_get_cfa(dloc->di->dbg, pc, &fbreg, &fboff) < 0)
+			fbreg = -1;
+	}
+
+	/* Case 1. register to register or segment:offset to register transfers */
+	if (!src->mem_ref && !dst->mem_ref) {
+		if (!has_reg_type(state, dst->reg1))
+			return;
+
+		tsr = &state->regs[dst->reg1];
+		if (dso__kernel(map__dso(dloc->ms->map)) &&
+		    src->segment == INSN_SEG_X86_GS && src->imm) {
+			u64 ip = dloc->ms->sym->start + dl->al.offset;
+			u64 var_addr;
+			int offset;
+
+			/*
+			 * In kernel, %gs points to a per-cpu region for the
+			 * current CPU.  Access with a constant offset should
+			 * be treated as a global variable access.
+			 */
+			var_addr = src->offset;
+
+			if (var_addr == 40) {
+				tsr->kind = TSR_KIND_CANARY;
+				tsr->ok = true;
+
+				pr_debug_dtp("mov [%x] stack canary -> reg%d\n",
+					     insn_offset, dst->reg1);
+				return;
+			}
+
+			if (!get_global_var_type(cu_die, dloc, ip, var_addr,
+						 &offset, &type_die) ||
+			    !die_get_member_type(&type_die, offset, &type_die)) {
+				tsr->ok = false;
+				return;
+			}
+
+			tsr->type = type_die;
+			tsr->kind = TSR_KIND_TYPE;
+			tsr->ok = true;
+
+			pr_debug_dtp("mov [%x] this-cpu addr=%#"PRIx64" -> reg%d",
+				     insn_offset, var_addr, dst->reg1);
+			pr_debug_type_name(&tsr->type, tsr->kind);
+			return;
+		}
+
+		if (src->imm) {
+			tsr->kind = TSR_KIND_CONST;
+			tsr->imm_value = src->offset;
+			tsr->ok = true;
+
+			pr_debug_dtp("mov [%x] imm=%#x -> reg%d\n",
+				     insn_offset, tsr->imm_value, dst->reg1);
+			return;
+		}
+
+		if (!has_reg_type(state, src->reg1) ||
+		    !state->regs[src->reg1].ok) {
+			tsr->ok = false;
+			return;
+		}
+
+		tsr->type = state->regs[src->reg1].type;
+		tsr->kind = state->regs[src->reg1].kind;
+		tsr->ok = true;
+
+		pr_debug_dtp("mov [%x] reg%d -> reg%d",
+			     insn_offset, src->reg1, dst->reg1);
+		pr_debug_type_name(&tsr->type, tsr->kind);
+	}
+	/* Case 2. memory to register transers */
+	if (src->mem_ref && !dst->mem_ref) {
+		int sreg = src->reg1;
+
+		if (!has_reg_type(state, dst->reg1))
+			return;
+
+		tsr = &state->regs[dst->reg1];
+
+retry:
+		/* Check stack variables with offset */
+		if (sreg == fbreg) {
+			struct type_state_stack *stack;
+			int offset = src->offset - fboff;
+
+			stack = find_stack_state(state, offset);
+			if (stack == NULL) {
+				tsr->ok = false;
+				return;
+			} else if (!stack->compound) {
+				tsr->type = stack->type;
+				tsr->kind = stack->kind;
+				tsr->ok = true;
+			} else if (die_get_member_type(&stack->type,
+						       offset - stack->offset,
+						       &type_die)) {
+				tsr->type = type_die;
+				tsr->kind = TSR_KIND_TYPE;
+				tsr->ok = true;
+			} else {
+				tsr->ok = false;
+				return;
+			}
+
+			pr_debug_dtp("mov [%x] -%#x(stack) -> reg%d",
+				     insn_offset, -offset, dst->reg1);
+			pr_debug_type_name(&tsr->type, tsr->kind);
+		}
+		/* And then dereference the pointer if it has one */
+		else if (has_reg_type(state, sreg) && state->regs[sreg].ok &&
+			 state->regs[sreg].kind == TSR_KIND_TYPE &&
+			 die_deref_ptr_type(&state->regs[sreg].type,
+					    src->offset, &type_die)) {
+			tsr->type = type_die;
+			tsr->kind = TSR_KIND_TYPE;
+			tsr->ok = true;
+
+			pr_debug_dtp("mov [%x] %#x(reg%d) -> reg%d",
+				     insn_offset, src->offset, sreg, dst->reg1);
+			pr_debug_type_name(&tsr->type, tsr->kind);
+		}
+		/* Or check if it's a global variable */
+		else if (sreg == DWARF_REG_PC) {
+			struct map_symbol *ms = dloc->ms;
+			u64 ip = ms->sym->start + dl->al.offset;
+			u64 addr;
+			int offset;
+
+			addr = annotate_calc_pcrel(ms, ip, src->offset, dl);
+
+			if (!get_global_var_type(cu_die, dloc, ip, addr, &offset,
+						 &type_die) ||
+			    !die_get_member_type(&type_die, offset, &type_die)) {
+				tsr->ok = false;
+				return;
+			}
+
+			tsr->type = type_die;
+			tsr->kind = TSR_KIND_TYPE;
+			tsr->ok = true;
+
+			pr_debug_dtp("mov [%x] global addr=%"PRIx64" -> reg%d",
+				     insn_offset, addr, dst->reg1);
+			pr_debug_type_name(&type_die, tsr->kind);
+		}
+		/* And check percpu access with base register */
+		else if (has_reg_type(state, sreg) &&
+			 state->regs[sreg].kind == TSR_KIND_PERCPU_BASE) {
+			u64 ip = dloc->ms->sym->start + dl->al.offset;
+			u64 var_addr = src->offset;
+			int offset;
+
+			if (src->multi_regs) {
+				int reg2 = (sreg == src->reg1) ? src->reg2 : src->reg1;
+
+				if (has_reg_type(state, reg2) && state->regs[reg2].ok &&
+				    state->regs[reg2].kind == TSR_KIND_CONST)
+					var_addr += state->regs[reg2].imm_value;
+			}
+
+			/*
+			 * In kernel, %gs points to a per-cpu region for the
+			 * current CPU.  Access with a constant offset should
+			 * be treated as a global variable access.
+			 */
+			if (get_global_var_type(cu_die, dloc, ip, var_addr,
+						&offset, &type_die) &&
+			    die_get_member_type(&type_die, offset, &type_die)) {
+				tsr->type = type_die;
+				tsr->kind = TSR_KIND_TYPE;
+				tsr->ok = true;
+
+				if (src->multi_regs) {
+					pr_debug_dtp("mov [%x] percpu %#x(reg%d,reg%d) -> reg%d",
+						     insn_offset, src->offset, src->reg1,
+						     src->reg2, dst->reg1);
+				} else {
+					pr_debug_dtp("mov [%x] percpu %#x(reg%d) -> reg%d",
+						     insn_offset, src->offset, sreg, dst->reg1);
+				}
+				pr_debug_type_name(&tsr->type, tsr->kind);
+			} else {
+				tsr->ok = false;
+			}
+		}
+		/* And then dereference the calculated pointer if it has one */
+		else if (has_reg_type(state, sreg) && state->regs[sreg].ok &&
+			 state->regs[sreg].kind == TSR_KIND_POINTER &&
+			 die_get_member_type(&state->regs[sreg].type,
+					     src->offset, &type_die)) {
+			tsr->type = type_die;
+			tsr->kind = TSR_KIND_TYPE;
+			tsr->ok = true;
+
+			pr_debug_dtp("mov [%x] pointer %#x(reg%d) -> reg%d",
+				     insn_offset, src->offset, sreg, dst->reg1);
+			pr_debug_type_name(&tsr->type, tsr->kind);
+		}
+		/* Or try another register if any */
+		else if (src->multi_regs && sreg == src->reg1 &&
+			 src->reg1 != src->reg2) {
+			sreg = src->reg2;
+			goto retry;
+		}
+		else {
+			int offset;
+			const char *var_name = NULL;
+
+			/* it might be per-cpu variable (in kernel) access */
+			if (src->offset < 0) {
+				if (get_global_var_info(dloc, (s64)src->offset,
+							&var_name, &offset) &&
+				    !strcmp(var_name, "__per_cpu_offset")) {
+					tsr->kind = TSR_KIND_PERCPU_BASE;
+
+					pr_debug_dtp("mov [%x] percpu base reg%d\n",
+						     insn_offset, dst->reg1);
+				}
+			}
+
+			tsr->ok = false;
+		}
+	}
+	/* Case 3. register to memory transfers */
+	if (!src->mem_ref && dst->mem_ref) {
+		if (!has_reg_type(state, src->reg1) ||
+		    !state->regs[src->reg1].ok)
+			return;
+
+		/* Check stack variables with offset */
+		if (dst->reg1 == fbreg) {
+			struct type_state_stack *stack;
+			int offset = dst->offset - fboff;
+
+			tsr = &state->regs[src->reg1];
+
+			stack = find_stack_state(state, offset);
+			if (stack) {
+				/*
+				 * The source register is likely to hold a type
+				 * of member if it's a compound type.  Do not
+				 * update the stack variable type since we can
+				 * get the member type later by using the
+				 * die_get_member_type().
+				 */
+				if (!stack->compound)
+					set_stack_state(stack, offset, tsr->kind,
+							&tsr->type);
+			} else {
+				findnew_stack_state(state, offset, tsr->kind,
+						    &tsr->type);
+			}
+
+			pr_debug_dtp("mov [%x] reg%d -> -%#x(stack)",
+				     insn_offset, src->reg1, -offset);
+			pr_debug_type_name(&tsr->type, tsr->kind);
+		}
+		/*
+		 * Ignore other transfers since it'd set a value in a struct
+		 * and won't change the type.
+		 */
+	}
+	/* Case 4. memory to memory transfers (not handled for now) */
+}
+#else /* HAVE_DWARF_SUPPORT */
+static void update_insn_state_x86(struct type_state *state __maybe_unused, struct data_loc_info *dloc __maybe_unused,
+		Dwarf_Die * cu_die __maybe_unused, struct disasm_line *dl __maybe_unused)
+{
+	return;
+}
+#endif
diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
index a4c7f98a75e3..7a48c3d72b89 100644
--- a/tools/perf/util/annotate-data.c
+++ b/tools/perf/util/annotate-data.c
@@ -39,7 +39,7 @@ do {								\
 		pr_debug3(fmt, ##__VA_ARGS__);			\
 } while (0)
 
-static void pr_debug_type_name(Dwarf_Die *die, enum type_state_kind kind)
+void pr_debug_type_name(Dwarf_Die *die, enum type_state_kind kind)
 {
 	struct strbuf sb;
 	char *str;
@@ -390,7 +390,7 @@ static int check_variable(struct data_loc_info *dloc, Dwarf_Die *var_die,
 	return 0;
 }
 
-static struct type_state_stack *find_stack_state(struct type_state *state,
+struct type_state_stack *find_stack_state(struct type_state *state,
 						 int offset)
 {
 	struct type_state_stack *stack;
@@ -406,7 +406,7 @@ static struct type_state_stack *find_stack_state(struct type_state *state,
 	return NULL;
 }
 
-static void set_stack_state(struct type_state_stack *stack, int offset, u8 kind,
+void set_stack_state(struct type_state_stack *stack, int offset, u8 kind,
 			    Dwarf_Die *type_die)
 {
 	int tag;
@@ -433,7 +433,7 @@ static void set_stack_state(struct type_state_stack *stack, int offset, u8 kind,
 	}
 }
 
-static struct type_state_stack *findnew_stack_state(struct type_state *state,
+struct type_state_stack *findnew_stack_state(struct type_state *state,
 						    int offset, u8 kind,
 						    Dwarf_Die *type_die)
 {
@@ -537,7 +537,7 @@ void global_var_type__tree_delete(struct rb_root *root)
 	}
 }
 
-static bool get_global_var_info(struct data_loc_info *dloc, u64 addr,
+bool get_global_var_info(struct data_loc_info *dloc, u64 addr,
 				const char **var_name, int *var_offset)
 {
 	struct addr_location al;
@@ -611,7 +611,7 @@ static void global_var__collect(struct data_loc_info *dloc)
 	}
 }
 
-static bool get_global_var_type(Dwarf_Die *cu_die, struct data_loc_info *dloc,
+bool get_global_var_type(Dwarf_Die *cu_die, struct data_loc_info *dloc,
 				u64 ip, u64 var_addr, int *var_offset,
 				Dwarf_Die *type_die)
 {
@@ -722,381 +722,6 @@ static void update_var_state(struct type_state *state, struct data_loc_info *dlo
 	}
 }
 
-static void update_insn_state_x86(struct type_state *state,
-				  struct data_loc_info *dloc, Dwarf_Die *cu_die,
-				  struct disasm_line *dl)
-{
-	struct annotated_insn_loc loc;
-	struct annotated_op_loc *src = &loc.ops[INSN_OP_SOURCE];
-	struct annotated_op_loc *dst = &loc.ops[INSN_OP_TARGET];
-	struct type_state_reg *tsr;
-	Dwarf_Die type_die;
-	u32 insn_offset = dl->al.offset;
-	int fbreg = dloc->fbreg;
-	int fboff = 0;
-
-	if (annotate_get_insn_location(dloc->arch, dl, &loc) < 0)
-		return;
-
-	if (ins__is_call(&dl->ins)) {
-		struct symbol *func = dl->ops.target.sym;
-
-		if (func == NULL)
-			return;
-
-		/* __fentry__ will preserve all registers */
-		if (!strcmp(func->name, "__fentry__"))
-			return;
-
-		pr_debug_dtp("call [%x] %s\n", insn_offset, func->name);
-
-		/* Otherwise invalidate caller-saved registers after call */
-		for (unsigned i = 0; i < ARRAY_SIZE(state->regs); i++) {
-			if (state->regs[i].caller_saved)
-				state->regs[i].ok = false;
-		}
-
-		/* Update register with the return type (if any) */
-		if (die_find_func_rettype(cu_die, func->name, &type_die)) {
-			tsr = &state->regs[state->ret_reg];
-			tsr->type = type_die;
-			tsr->kind = TSR_KIND_TYPE;
-			tsr->ok = true;
-
-			pr_debug_dtp("call [%x] return -> reg%d",
-				     insn_offset, state->ret_reg);
-			pr_debug_type_name(&type_die, tsr->kind);
-		}
-		return;
-	}
-
-	if (!strncmp(dl->ins.name, "add", 3)) {
-		u64 imm_value = -1ULL;
-		int offset;
-		const char *var_name = NULL;
-		struct map_symbol *ms = dloc->ms;
-		u64 ip = ms->sym->start + dl->al.offset;
-
-		if (!has_reg_type(state, dst->reg1))
-			return;
-
-		tsr = &state->regs[dst->reg1];
-
-		if (src->imm)
-			imm_value = src->offset;
-		else if (has_reg_type(state, src->reg1) &&
-			 state->regs[src->reg1].kind == TSR_KIND_CONST)
-			imm_value = state->regs[src->reg1].imm_value;
-		else if (src->reg1 == DWARF_REG_PC) {
-			u64 var_addr = annotate_calc_pcrel(dloc->ms, ip,
-							   src->offset, dl);
-
-			if (get_global_var_info(dloc, var_addr,
-						&var_name, &offset) &&
-			    !strcmp(var_name, "this_cpu_off") &&
-			    tsr->kind == TSR_KIND_CONST) {
-				tsr->kind = TSR_KIND_PERCPU_BASE;
-				imm_value = tsr->imm_value;
-			}
-		}
-		else
-			return;
-
-		if (tsr->kind != TSR_KIND_PERCPU_BASE)
-			return;
-
-		if (get_global_var_type(cu_die, dloc, ip, imm_value, &offset,
-					&type_die) && offset == 0) {
-			/*
-			 * This is not a pointer type, but it should be treated
-			 * as a pointer.
-			 */
-			tsr->type = type_die;
-			tsr->kind = TSR_KIND_POINTER;
-			tsr->ok = true;
-
-			pr_debug_dtp("add [%x] percpu %#"PRIx64" -> reg%d",
-				     insn_offset, imm_value, dst->reg1);
-			pr_debug_type_name(&tsr->type, tsr->kind);
-		}
-		return;
-	}
-
-	if (strncmp(dl->ins.name, "mov", 3))
-		return;
-
-	if (dloc->fb_cfa) {
-		u64 ip = dloc->ms->sym->start + dl->al.offset;
-		u64 pc = map__rip_2objdump(dloc->ms->map, ip);
-
-		if (die_get_cfa(dloc->di->dbg, pc, &fbreg, &fboff) < 0)
-			fbreg = -1;
-	}
-
-	/* Case 1. register to register or segment:offset to register transfers */
-	if (!src->mem_ref && !dst->mem_ref) {
-		if (!has_reg_type(state, dst->reg1))
-			return;
-
-		tsr = &state->regs[dst->reg1];
-		if (dso__kernel(map__dso(dloc->ms->map)) &&
-		    src->segment == INSN_SEG_X86_GS && src->imm) {
-			u64 ip = dloc->ms->sym->start + dl->al.offset;
-			u64 var_addr;
-			int offset;
-
-			/*
-			 * In kernel, %gs points to a per-cpu region for the
-			 * current CPU.  Access with a constant offset should
-			 * be treated as a global variable access.
-			 */
-			var_addr = src->offset;
-
-			if (var_addr == 40) {
-				tsr->kind = TSR_KIND_CANARY;
-				tsr->ok = true;
-
-				pr_debug_dtp("mov [%x] stack canary -> reg%d\n",
-					     insn_offset, dst->reg1);
-				return;
-			}
-
-			if (!get_global_var_type(cu_die, dloc, ip, var_addr,
-						 &offset, &type_die) ||
-			    !die_get_member_type(&type_die, offset, &type_die)) {
-				tsr->ok = false;
-				return;
-			}
-
-			tsr->type = type_die;
-			tsr->kind = TSR_KIND_TYPE;
-			tsr->ok = true;
-
-			pr_debug_dtp("mov [%x] this-cpu addr=%#"PRIx64" -> reg%d",
-				     insn_offset, var_addr, dst->reg1);
-			pr_debug_type_name(&tsr->type, tsr->kind);
-			return;
-		}
-
-		if (src->imm) {
-			tsr->kind = TSR_KIND_CONST;
-			tsr->imm_value = src->offset;
-			tsr->ok = true;
-
-			pr_debug_dtp("mov [%x] imm=%#x -> reg%d\n",
-				     insn_offset, tsr->imm_value, dst->reg1);
-			return;
-		}
-
-		if (!has_reg_type(state, src->reg1) ||
-		    !state->regs[src->reg1].ok) {
-			tsr->ok = false;
-			return;
-		}
-
-		tsr->type = state->regs[src->reg1].type;
-		tsr->kind = state->regs[src->reg1].kind;
-		tsr->ok = true;
-
-		pr_debug_dtp("mov [%x] reg%d -> reg%d",
-			     insn_offset, src->reg1, dst->reg1);
-		pr_debug_type_name(&tsr->type, tsr->kind);
-	}
-	/* Case 2. memory to register transers */
-	if (src->mem_ref && !dst->mem_ref) {
-		int sreg = src->reg1;
-
-		if (!has_reg_type(state, dst->reg1))
-			return;
-
-		tsr = &state->regs[dst->reg1];
-
-retry:
-		/* Check stack variables with offset */
-		if (sreg == fbreg) {
-			struct type_state_stack *stack;
-			int offset = src->offset - fboff;
-
-			stack = find_stack_state(state, offset);
-			if (stack == NULL) {
-				tsr->ok = false;
-				return;
-			} else if (!stack->compound) {
-				tsr->type = stack->type;
-				tsr->kind = stack->kind;
-				tsr->ok = true;
-			} else if (die_get_member_type(&stack->type,
-						       offset - stack->offset,
-						       &type_die)) {
-				tsr->type = type_die;
-				tsr->kind = TSR_KIND_TYPE;
-				tsr->ok = true;
-			} else {
-				tsr->ok = false;
-				return;
-			}
-
-			pr_debug_dtp("mov [%x] -%#x(stack) -> reg%d",
-				     insn_offset, -offset, dst->reg1);
-			pr_debug_type_name(&tsr->type, tsr->kind);
-		}
-		/* And then dereference the pointer if it has one */
-		else if (has_reg_type(state, sreg) && state->regs[sreg].ok &&
-			 state->regs[sreg].kind == TSR_KIND_TYPE &&
-			 die_deref_ptr_type(&state->regs[sreg].type,
-					    src->offset, &type_die)) {
-			tsr->type = type_die;
-			tsr->kind = TSR_KIND_TYPE;
-			tsr->ok = true;
-
-			pr_debug_dtp("mov [%x] %#x(reg%d) -> reg%d",
-				     insn_offset, src->offset, sreg, dst->reg1);
-			pr_debug_type_name(&tsr->type, tsr->kind);
-		}
-		/* Or check if it's a global variable */
-		else if (sreg == DWARF_REG_PC) {
-			struct map_symbol *ms = dloc->ms;
-			u64 ip = ms->sym->start + dl->al.offset;
-			u64 addr;
-			int offset;
-
-			addr = annotate_calc_pcrel(ms, ip, src->offset, dl);
-
-			if (!get_global_var_type(cu_die, dloc, ip, addr, &offset,
-						 &type_die) ||
-			    !die_get_member_type(&type_die, offset, &type_die)) {
-				tsr->ok = false;
-				return;
-			}
-
-			tsr->type = type_die;
-			tsr->kind = TSR_KIND_TYPE;
-			tsr->ok = true;
-
-			pr_debug_dtp("mov [%x] global addr=%"PRIx64" -> reg%d",
-				     insn_offset, addr, dst->reg1);
-			pr_debug_type_name(&type_die, tsr->kind);
-		}
-		/* And check percpu access with base register */
-		else if (has_reg_type(state, sreg) &&
-			 state->regs[sreg].kind == TSR_KIND_PERCPU_BASE) {
-			u64 ip = dloc->ms->sym->start + dl->al.offset;
-			u64 var_addr = src->offset;
-			int offset;
-
-			if (src->multi_regs) {
-				int reg2 = (sreg == src->reg1) ? src->reg2 : src->reg1;
-
-				if (has_reg_type(state, reg2) && state->regs[reg2].ok &&
-				    state->regs[reg2].kind == TSR_KIND_CONST)
-					var_addr += state->regs[reg2].imm_value;
-			}
-
-			/*
-			 * In kernel, %gs points to a per-cpu region for the
-			 * current CPU.  Access with a constant offset should
-			 * be treated as a global variable access.
-			 */
-			if (get_global_var_type(cu_die, dloc, ip, var_addr,
-						&offset, &type_die) &&
-			    die_get_member_type(&type_die, offset, &type_die)) {
-				tsr->type = type_die;
-				tsr->kind = TSR_KIND_TYPE;
-				tsr->ok = true;
-
-				if (src->multi_regs) {
-					pr_debug_dtp("mov [%x] percpu %#x(reg%d,reg%d) -> reg%d",
-						     insn_offset, src->offset, src->reg1,
-						     src->reg2, dst->reg1);
-				} else {
-					pr_debug_dtp("mov [%x] percpu %#x(reg%d) -> reg%d",
-						     insn_offset, src->offset, sreg, dst->reg1);
-				}
-				pr_debug_type_name(&tsr->type, tsr->kind);
-			} else {
-				tsr->ok = false;
-			}
-		}
-		/* And then dereference the calculated pointer if it has one */
-		else if (has_reg_type(state, sreg) && state->regs[sreg].ok &&
-			 state->regs[sreg].kind == TSR_KIND_POINTER &&
-			 die_get_member_type(&state->regs[sreg].type,
-					     src->offset, &type_die)) {
-			tsr->type = type_die;
-			tsr->kind = TSR_KIND_TYPE;
-			tsr->ok = true;
-
-			pr_debug_dtp("mov [%x] pointer %#x(reg%d) -> reg%d",
-				     insn_offset, src->offset, sreg, dst->reg1);
-			pr_debug_type_name(&tsr->type, tsr->kind);
-		}
-		/* Or try another register if any */
-		else if (src->multi_regs && sreg == src->reg1 &&
-			 src->reg1 != src->reg2) {
-			sreg = src->reg2;
-			goto retry;
-		}
-		else {
-			int offset;
-			const char *var_name = NULL;
-
-			/* it might be per-cpu variable (in kernel) access */
-			if (src->offset < 0) {
-				if (get_global_var_info(dloc, (s64)src->offset,
-							&var_name, &offset) &&
-				    !strcmp(var_name, "__per_cpu_offset")) {
-					tsr->kind = TSR_KIND_PERCPU_BASE;
-
-					pr_debug_dtp("mov [%x] percpu base reg%d\n",
-						     insn_offset, dst->reg1);
-				}
-			}
-
-			tsr->ok = false;
-		}
-	}
-	/* Case 3. register to memory transfers */
-	if (!src->mem_ref && dst->mem_ref) {
-		if (!has_reg_type(state, src->reg1) ||
-		    !state->regs[src->reg1].ok)
-			return;
-
-		/* Check stack variables with offset */
-		if (dst->reg1 == fbreg) {
-			struct type_state_stack *stack;
-			int offset = dst->offset - fboff;
-
-			tsr = &state->regs[src->reg1];
-
-			stack = find_stack_state(state, offset);
-			if (stack) {
-				/*
-				 * The source register is likely to hold a type
-				 * of member if it's a compound type.  Do not
-				 * update the stack variable type since we can
-				 * get the member type later by using the
-				 * die_get_member_type().
-				 */
-				if (!stack->compound)
-					set_stack_state(stack, offset, tsr->kind,
-							&tsr->type);
-			} else {
-				findnew_stack_state(state, offset, tsr->kind,
-						    &tsr->type);
-			}
-
-			pr_debug_dtp("mov [%x] reg%d -> -%#x(stack)",
-				     insn_offset, src->reg1, -offset);
-			pr_debug_type_name(&tsr->type, tsr->kind);
-		}
-		/*
-		 * Ignore other transfers since it'd set a value in a struct
-		 * and won't change the type.
-		 */
-	}
-	/* Case 4. memory to memory transfers (not handled for now) */
-}
-
 /**
  * update_insn_state - Update type state for an instruction
  * @state: type state table
@@ -1115,8 +740,8 @@ static void update_insn_state_x86(struct type_state *state,
 static void update_insn_state(struct type_state *state, struct data_loc_info *dloc,
 			      Dwarf_Die *cu_die, struct disasm_line *dl)
 {
-	if (arch__is(dloc->arch, "x86"))
-		update_insn_state_x86(state, dloc, cu_die, dl);
+	if (dloc->arch->update_insn_state)
+		dloc->arch->update_insn_state(state, dloc, cu_die, dl);
 }
 
 /*
diff --git a/tools/perf/util/annotate-data.h b/tools/perf/util/annotate-data.h
index ef235b1b15e1..2bc870e61c74 100644
--- a/tools/perf/util/annotate-data.h
+++ b/tools/perf/util/annotate-data.h
@@ -7,6 +7,7 @@
 #include <linux/rbtree.h>
 #include <linux/types.h>
 #include "dwarf-aux.h"
+#include "dwarf-regs.h"
 #include "annotate.h"
 #include "debuginfo.h"
 
@@ -18,6 +19,14 @@ struct hist_entry;
 struct map_symbol;
 struct thread;
 
+#define pr_debug_dtp(fmt, ...)					\
+do {								\
+	if (debug_type_profile)					\
+		pr_info(fmt, ##__VA_ARGS__);			\
+	else							\
+		pr_debug3(fmt, ##__VA_ARGS__);			\
+} while (0)
+
 enum type_state_kind {
 	TSR_KIND_INVALID = 0,
 	TSR_KIND_TYPE,
@@ -215,6 +224,20 @@ void global_var_type__tree_delete(struct rb_root *root);
 int hist_entry__annotate_data_tty(struct hist_entry *he, struct evsel *evsel);
 
 bool has_reg_type(struct type_state *state, int reg);
+struct type_state_stack *findnew_stack_state(struct type_state *state,
+						int offset, u8 kind,
+						Dwarf_Die *type_die);
+void set_stack_state(struct type_state_stack *stack, int offset, u8 kind,
+				Dwarf_Die *type_die);
+struct type_state_stack *find_stack_state(struct type_state *state,
+						int offset);
+bool get_global_var_type(Dwarf_Die *cu_die, struct data_loc_info *dloc,
+				u64 ip, u64 var_addr, int *var_offset,
+				Dwarf_Die *type_die);
+bool get_global_var_info(struct data_loc_info *dloc, u64 addr,
+				const char **var_name, int *var_offset);
+void pr_debug_type_name(Dwarf_Die *die, enum type_state_kind kind);
+
 #else /* HAVE_DWARF_SUPPORT */
 
 static inline struct annotated_data_type *
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 72aec8f61b94..b5fe3a7508bb 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -12,6 +12,7 @@
 #include <subcmd/run-command.h>
 
 #include "annotate.h"
+#include "annotate-data.h"
 #include "build-id.h"
 #include "debug.h"
 #include "disasm.h"
@@ -145,6 +146,7 @@ static struct arch architectures[] = {
 			.memory_ref_char = '(',
 			.imm_char = '$',
 		},
+		.update_insn_state = update_insn_state_x86,
 	},
 	{
 		.name = "powerpc",
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index 3d381a043520..718177fa4775 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -3,12 +3,16 @@
 #define __PERF_UTIL_DISASM_H
 
 #include "map_symbol.h"
+#include "dwarf-aux.h"
 
 struct annotation_options;
 struct disasm_line;
 struct ins;
 struct evsel;
 struct symbol;
+struct data_loc_info;
+struct type_state;
+struct disasm_line;
 
 struct arch {
 	const char	*name;
@@ -32,6 +36,9 @@ struct arch {
 		char memory_ref_char;
 		char imm_char;
 	} objdump;
+	void		(*update_insn_state)(struct type_state *state,
+				struct data_loc_info *dloc, Dwarf_Die *cu_die,
+				struct disasm_line *dl);
 };
 
 struct ins {
-- 
2.43.0

