Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD5F91D712
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 06:37:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VEQcPrRA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCCvY5gj8z3d87
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 14:37:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VEQcPrRA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCCrR3QcQz3dC1
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 14:35:03 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4613wV4q016911;
	Mon, 1 Jul 2024 04:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=S7oOTW+qLFjlG
	B5kpeaZ+EfbfHw4h0sOROYcy+NoB1Q=; b=VEQcPrRAVHXd9zy67hCtEW81kowc/
	hhS8F4o6vxDzbOSrvYESc/ycHuVq5TJ0vtEsyTuWgPOBVTNRFHkm1PfauP+tUkiI
	w/1WGOEG1f9lemfBgC68PmufbcMIX7edo2yGyX3r/zfcaexd9yqoa55lw4oyupUy
	f/SHq1v7Gx9Fs2P+mBQZZiQeyrNwXcx6zJBY80I7o/pa7nHHeCluE+SBdRKqK0Xy
	jRoyXrKZQKwfaYRRjKROfcCvF3kpjuJmdj6aCR6GbduIAHWBVX5y+Dm0sUiFQFsl
	a81rJlCE7bk67Nh+YOMR3eEbqj4R/CTiJ48qfFK3dT9fVMXq0z2C32mlg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 403n138273-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 04:34:54 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4614YrSY006865;
	Mon, 1 Jul 2024 04:34:53 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 403n13826y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 04:34:53 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4611A810009473;
	Mon, 1 Jul 2024 04:34:52 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 402xtmd40w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 04:34:52 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4614YlXf46596416
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Jul 2024 04:34:49 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2570A20043;
	Mon,  1 Jul 2024 04:34:46 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3AC0520040;
	Mon,  1 Jul 2024 04:34:43 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.21.126])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  1 Jul 2024 04:34:43 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V5 03/17] tools/perf: Update TYPE_STATE_MAX_REGS to include max of regs in powerpc
Date: Mon,  1 Jul 2024 10:04:16 +0530
Message-Id: <20240701043430.66666-4-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240701043430.66666-1-atrajeev@linux.vnet.ibm.com>
References: <20240701043430.66666-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5Ed9XCMxb9STlaoeAXFh2u6XjXtZIIgz
X-Proofpoint-ORIG-GUID: JWcqimXO3rnML0e_r0wMIsE8CKhhryBR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_03,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010030
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

Add TYPE_STATE_MAX_REGS_X86 and TYPE_STATE_MAX_REGS_PPC. Define
TYPE_STATE_MAX_REGS to be 32 which is max size of the array. While
checking if reg is valid using has_reg_type, use the max value
depending on the architecture. For x86, use TYPE_STATE_MAX_REGS_X86
since max number of regs is 16. Update has_reg_type to
pass "struct arch" also as one of the parameters.

Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>
---
 tools/perf/arch/x86/annotate/instructions.c | 20 ++++++++++----------
 tools/perf/util/annotate-data.c             | 13 +++++++++----
 tools/perf/util/annotate-data.h             |  6 ++++--
 3 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/tools/perf/arch/x86/annotate/instructions.c b/tools/perf/arch/x86/annotate/instructions.c
index 7b7d462c6c6b..ea1dc686e7b4 100644
--- a/tools/perf/arch/x86/annotate/instructions.c
+++ b/tools/perf/arch/x86/annotate/instructions.c
@@ -263,14 +263,14 @@ static void update_insn_state_x86(struct type_state *state,
 		struct map_symbol *ms = dloc->ms;
 		u64 ip = ms->sym->start + dl->al.offset;
 
-		if (!has_reg_type(state, dst->reg1))
+		if (!has_reg_type(state, dst->reg1, dloc->arch))
 			return;
 
 		tsr = &state->regs[dst->reg1];
 
 		if (src->imm)
 			imm_value = src->offset;
-		else if (has_reg_type(state, src->reg1) &&
+		else if (has_reg_type(state, src->reg1, dloc->arch) &&
 			 state->regs[src->reg1].kind == TSR_KIND_CONST)
 			imm_value = state->regs[src->reg1].imm_value;
 		else if (src->reg1 == DWARF_REG_PC) {
@@ -321,7 +321,7 @@ static void update_insn_state_x86(struct type_state *state,
 
 	/* Case 1. register to register or segment:offset to register transfers */
 	if (!src->mem_ref && !dst->mem_ref) {
-		if (!has_reg_type(state, dst->reg1))
+		if (!has_reg_type(state, dst->reg1, dloc->arch))
 			return;
 
 		tsr = &state->regs[dst->reg1];
@@ -374,7 +374,7 @@ static void update_insn_state_x86(struct type_state *state,
 			return;
 		}
 
-		if (!has_reg_type(state, src->reg1) ||
+		if (!has_reg_type(state, src->reg1, dloc->arch) ||
 		    !state->regs[src->reg1].ok) {
 			tsr->ok = false;
 			return;
@@ -392,7 +392,7 @@ static void update_insn_state_x86(struct type_state *state,
 	if (src->mem_ref && !dst->mem_ref) {
 		int sreg = src->reg1;
 
-		if (!has_reg_type(state, dst->reg1))
+		if (!has_reg_type(state, dst->reg1, dloc->arch))
 			return;
 
 		tsr = &state->regs[dst->reg1];
@@ -427,7 +427,7 @@ static void update_insn_state_x86(struct type_state *state,
 			pr_debug_type_name(&tsr->type, tsr->kind);
 		}
 		/* And then dereference the pointer if it has one */
-		else if (has_reg_type(state, sreg) && state->regs[sreg].ok &&
+		else if (has_reg_type(state, sreg, dloc->arch) && state->regs[sreg].ok &&
 			 state->regs[sreg].kind == TSR_KIND_TYPE &&
 			 die_deref_ptr_type(&state->regs[sreg].type,
 					    src->offset, &type_die)) {
@@ -464,7 +464,7 @@ static void update_insn_state_x86(struct type_state *state,
 			pr_debug_type_name(&type_die, tsr->kind);
 		}
 		/* And check percpu access with base register */
-		else if (has_reg_type(state, sreg) &&
+		else if (has_reg_type(state, sreg, dloc->arch) &&
 			 state->regs[sreg].kind == TSR_KIND_PERCPU_BASE) {
 			u64 ip = dloc->ms->sym->start + dl->al.offset;
 			u64 var_addr = src->offset;
@@ -473,7 +473,7 @@ static void update_insn_state_x86(struct type_state *state,
 			if (src->multi_regs) {
 				int reg2 = (sreg == src->reg1) ? src->reg2 : src->reg1;
 
-				if (has_reg_type(state, reg2) && state->regs[reg2].ok &&
+				if (has_reg_type(state, reg2, dloc->arch) && state->regs[reg2].ok &&
 				    state->regs[reg2].kind == TSR_KIND_CONST)
 					var_addr += state->regs[reg2].imm_value;
 			}
@@ -504,7 +504,7 @@ static void update_insn_state_x86(struct type_state *state,
 			}
 		}
 		/* And then dereference the calculated pointer if it has one */
-		else if (has_reg_type(state, sreg) && state->regs[sreg].ok &&
+		else if (has_reg_type(state, sreg, dloc->arch) && state->regs[sreg].ok &&
 			 state->regs[sreg].kind == TSR_KIND_POINTER &&
 			 die_get_member_type(&state->regs[sreg].type,
 					     src->offset, &type_die)) {
@@ -543,7 +543,7 @@ static void update_insn_state_x86(struct type_state *state,
 	}
 	/* Case 3. register to memory transfers */
 	if (!src->mem_ref && dst->mem_ref) {
-		if (!has_reg_type(state, src->reg1) ||
+		if (!has_reg_type(state, src->reg1, dloc->arch) ||
 		    !state->regs[src->reg1].ok)
 			return;
 
diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
index 7a48c3d72b89..fac9d3cdd318 100644
--- a/tools/perf/util/annotate-data.c
+++ b/tools/perf/util/annotate-data.c
@@ -131,9 +131,14 @@ static void pr_debug_location(Dwarf_Die *die, u64 pc, int reg)
 	}
 }
 
-bool has_reg_type(struct type_state *state, int reg)
+bool has_reg_type(struct type_state *state, int reg, struct arch *arch)
 {
-	return (unsigned)reg < ARRAY_SIZE(state->regs);
+	if (arch__is(arch, "x86"))
+		return (unsigned)reg < TYPE_STATE_MAX_REGS_x86;
+	else if (arch__is(arch, "powerpc"))
+		return (unsigned)reg < TYPE_STATE_MAX_REGS_PPC;
+	else
+		return (unsigned)reg < ARRAY_SIZE(state->regs);
 }
 
 static void init_type_state(struct type_state *state, struct arch *arch)
@@ -707,7 +712,7 @@ static void update_var_state(struct type_state *state, struct data_loc_info *dlo
 			pr_debug_dtp("var [%"PRIx64"] -%#x(stack)",
 				     insn_offset, -var->offset + fb_offset);
 			pr_debug_type_name(&mem_die, TSR_KIND_TYPE);
-		} else if (has_reg_type(state, var->reg) && var->offset == 0) {
+		} else if (has_reg_type(state, var->reg, dloc->arch) && var->offset == 0) {
 			struct type_state_reg *reg;
 
 			reg = &state->regs[var->reg];
@@ -943,7 +948,7 @@ static int check_matching_type(struct type_state *state,
 			if (dloc->op->reg2 == reg)
 				reg2 = dloc->op->reg1;
 
-			if (has_reg_type(state, reg2) && state->regs[reg2].ok &&
+			if (has_reg_type(state, reg2, dloc->arch) && state->regs[reg2].ok &&
 			    state->regs[reg2].kind == TSR_KIND_CONST)
 				var_addr += state->regs[reg2].imm_value;
 		}
diff --git a/tools/perf/util/annotate-data.h b/tools/perf/util/annotate-data.h
index 6fe8ee8b8410..4d8682cdc53c 100644
--- a/tools/perf/util/annotate-data.h
+++ b/tools/perf/util/annotate-data.h
@@ -189,7 +189,9 @@ struct type_state_stack {
 };
 
 /* FIXME: This should be arch-dependent */
-#define TYPE_STATE_MAX_REGS  16
+#define TYPE_STATE_MAX_REGS  32
+#define TYPE_STATE_MAX_REGS_x86	16
+#define TYPE_STATE_MAX_REGS_PPC	32
 
 /*
  * State table to maintain type info in each register and stack location.
@@ -224,7 +226,7 @@ void global_var_type__tree_delete(struct rb_root *root);
 
 int hist_entry__annotate_data_tty(struct hist_entry *he, struct evsel *evsel);
 
-bool has_reg_type(struct type_state *state, int reg);
+bool has_reg_type(struct type_state *state, int reg, struct arch *arch);
 struct type_state_stack *findnew_stack_state(struct type_state *state,
 						int offset, u8 kind,
 						Dwarf_Die *type_die);
-- 
2.43.0

