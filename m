Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 764DB91D72C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 06:43:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bd7fJVE+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCD241mLBz2xQL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 14:43:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bd7fJVE+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCCrt6RrCz3cTM
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 14:35:26 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4613Qfgh021637;
	Mon, 1 Jul 2024 04:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=JLd6+hUz6eGWy
	DUpEWuE8G44zvtE8YD4lbq8oDHxG6c=; b=Bd7fJVE+fPB0mD0Qveud0Xq99Auc/
	r2En1uV0N2GIzSwgBpulRDw2YwJGOLrbjihSzau5kD7VPw9dGksncU2Lr1OFXIW2
	K81WMrGr3O0f7xUnQTswjd622jEgbMtm0U4DKTt43P1EmkGV//CET6zCKgFuc80X
	zU3Etc4yttgcjK6K95NvOTCVsJfdXL7DW8vDZOVEuh7d+ydU9NGJ11dbh7APQbT7
	HkDX00c/8jM+jigVXNumtrVi6zgfS6Vfu46/w6KM80J5AfAyJbpzp3IQ1ZVxxYXM
	RKvR53mykGUfEnup+2d0D0c2ZIhEO2vfHJl5tK7AlhzHRs3mEH74QAX/g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 403m5085pk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 04:35:18 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4614ZH4l022633;
	Mon, 1 Jul 2024 04:35:18 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 403m5085ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 04:35:17 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4613TqeX009152;
	Mon, 1 Jul 2024 04:35:17 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 402w00dgdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 04:35:17 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4614ZBM135914026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Jul 2024 04:35:13 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7733220040;
	Mon,  1 Jul 2024 04:35:11 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 854452004D;
	Mon,  1 Jul 2024 04:35:08 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.21.126])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  1 Jul 2024 04:35:08 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V5 11/17] tools/perf: Update instruction tracking for powerpc
Date: Mon,  1 Jul 2024 10:04:24 +0530
Message-Id: <20240701043430.66666-12-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240701043430.66666-1-atrajeev@linux.vnet.ibm.com>
References: <20240701043430.66666-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MnFtEHmxQPmRV29oanSqzQpStbEYHdlO
X-Proofpoint-GUID: 1ait4Af32JTzkq7w6L2Wrh-Xz4phVuKL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_03,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407010030
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

Add instruction tracking function "update_insn_state_powerpc" for
powerpc. Example sequence in powerpc:

ld      r10,264(r3)
mr      r31,r3
<<after some sequence>
ld      r9,312(r31)

Consider ithe sample is pointing to: "ld r9,312(r31)".
Here the memory reference is hit at "312(r31)" where 312 is the offset
and r31 is the source register. Previous instruction sequence shows that
register state of r3 is moved to r31. So to identify the data type for r31
access, the previous instruction ("mr") needs to be tracked and the
state type entry has to be updated. Current instruction tracking support
in perf tools infrastructure is specific to x86. Patch adds this support
for powerpc as well.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../perf/arch/powerpc/annotate/instructions.c | 59 +++++++++++++++++++
 tools/perf/util/annotate-data.c               |  9 ++-
 tools/perf/util/disasm.c                      |  3 +
 3 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/powerpc/annotate/instructions.c b/tools/perf/arch/powerpc/annotate/instructions.c
index aa25a336d8d0..7f2b09000860 100644
--- a/tools/perf/arch/powerpc/annotate/instructions.c
+++ b/tools/perf/arch/powerpc/annotate/instructions.c
@@ -231,6 +231,65 @@ static struct ins_ops *check_ppc_insn(u32 raw_insn)
 	return NULL;
 }
 
+/*
+ * Instruction tracking function to track register state moves.
+ * Example sequence:
+ *    ld      r10,264(r3)
+ *    mr      r31,r3
+ *    <<after some sequence>
+ *    ld      r9,312(r31)
+ *
+ * Previous instruction sequence shows that register state of r3
+ * is moved to r31. update_insn_state_powerpc tracks these state
+ * changes
+ */
+#ifdef HAVE_DWARF_SUPPORT
+static void update_insn_state_powerpc(struct type_state *state,
+		struct data_loc_info *dloc, Dwarf_Die * cu_die __maybe_unused,
+		struct disasm_line *dl)
+{
+	struct annotated_insn_loc loc;
+	struct annotated_op_loc *src = &loc.ops[INSN_OP_SOURCE];
+	struct annotated_op_loc *dst = &loc.ops[INSN_OP_TARGET];
+	struct type_state_reg *tsr;
+	u32 insn_offset = dl->al.offset;
+
+	if (annotate_get_insn_location(dloc->arch, dl, &loc) < 0)
+		return;
+
+	/*
+	 * Value 444 for bits 21:30 is for "mr"
+	 * instruction. "mr" is extended OR. So set the
+	 * source and destination reg correctly
+	 */
+	if (PPC_21_30(dl->raw.raw_insn) == 444) {
+		int src_reg = src->reg1;
+
+		src->reg1 = dst->reg1;
+		dst->reg1 = src_reg;
+	}
+
+	if (!has_reg_type(state, dst->reg1, dloc->arch))
+		return;
+
+	tsr = &state->regs[dst->reg1];
+
+	if (!has_reg_type(state, src->reg1, dloc->arch) ||
+			!state->regs[src->reg1].ok) {
+		tsr->ok = false;
+		return;
+	}
+
+	tsr->type = state->regs[src->reg1].type;
+	tsr->kind = state->regs[src->reg1].kind;
+	tsr->ok = true;
+
+	pr_debug_dtp("mov [%x] reg%d -> reg%d",
+			insn_offset, src->reg1, dst->reg1);
+	pr_debug_type_name(&tsr->type, tsr->kind);
+}
+#endif /* HAVE_DWARF_SUPPORT */
+
 static int powerpc__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
 {
 	if (!arch->initialized) {
diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
index fac9d3cdd318..721235e1e6cf 100644
--- a/tools/perf/util/annotate-data.c
+++ b/tools/perf/util/annotate-data.c
@@ -1085,6 +1085,13 @@ static int find_data_type_insn(struct data_loc_info *dloc,
 	return ret;
 }
 
+static int arch_supports_insn_tracking(struct data_loc_info *dloc)
+{
+	if ((arch__is(dloc->arch, "x86")) || (arch__is(dloc->arch, "powerpc")))
+		return 1;
+	return 0;
+}
+
 /*
  * Construct a list of basic blocks for each scope with variables and try to find
  * the data type by updating a type state table through instructions.
@@ -1099,7 +1106,7 @@ static int find_data_type_block(struct data_loc_info *dloc,
 	int ret = -1;
 
 	/* TODO: other architecture support */
-	if (!arch__is(dloc->arch, "x86"))
+	if (!arch_supports_insn_tracking(dloc))
 		return -1;
 
 	prev_dst_ip = dst_ip = dloc->ip;
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 03227112ccfb..9da5bc893c66 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -157,6 +157,9 @@ static struct arch architectures[] = {
 	{
 		.name = "powerpc",
 		.init = powerpc__annotate_init,
+#ifdef HAVE_DWARF_SUPPORT
+		.update_insn_state = update_insn_state_powerpc,
+#endif
 	},
 	{
 		.name = "riscv64",
-- 
2.43.0

