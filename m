Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B439929887
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 16:53:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oZSVB1M4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WH9H50rRKz3cXH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2024 00:53:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oZSVB1M4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WH95m6QMwz3cXK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2024 00:45:16 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 467DGt9L008329;
	Sun, 7 Jul 2024 14:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=WX4wusfJTU3VY
	GdORkObtUkPdyBwGK8weKJiUofIwSk=; b=oZSVB1M4WWXMCc+FDXBqOsHKSncPq
	jQ0PWEdCr1WXv2aNMqrwEodkavvDspQbTyVYqYjg0ikiUfqNZ+2rXeODiT1AGLSY
	DaLSr6RQgcapxgEG8G68t2JTikmRlquuQeZMEIiSU0wPeNYO+GXNYwCBU4ZwMJOl
	WCQesStNC6OIbqNnDpbL/UNP++61i/WfmInigCqCzGGF85rA+MXyNQV4VSODglIH
	yNIxMMJx31IEgTjovNDvciZSmwXSfdeP/ULHRt0/8UhmS+L3N0mCI99m8jW8mSAd
	zvrohHrBxyRqeDiT7pJpW3tH/GQu76CgYuEQrr5ZdbLx7/uPQS9alB+LA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 407pnqgkrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Jul 2024 14:45:08 +0000 (GMT)
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 467Ej7qm029950;
	Sun, 7 Jul 2024 14:45:07 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 407pnqgkra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Jul 2024 14:45:07 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 467EQUME013923;
	Sun, 7 Jul 2024 14:45:06 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 407gn0anu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Jul 2024 14:45:06 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 467Ej0NU32572012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 7 Jul 2024 14:45:02 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A86C920040;
	Sun,  7 Jul 2024 14:45:00 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C816420049;
	Sun,  7 Jul 2024 14:44:57 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.1.68])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  7 Jul 2024 14:44:57 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V6 11/18] tools/perf: Update instruction tracking for powerpc
Date: Sun,  7 Jul 2024 20:14:12 +0530
Message-Id: <20240707144419.92510-12-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240707144419.92510-1-atrajeev@linux.vnet.ibm.com>
References: <20240707144419.92510-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: w49ZNzJKIn13wU4Qg6-nt2IUBsq024KW
X-Proofpoint-ORIG-GUID: ACu5ksjhJav_gJg258yQEZVln-pqodEx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-07_06,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2407070117
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
index aa25a336d8d0..af1032572bf3 100644
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
+	if (!has_reg_type(state, dst->reg1))
+		return;
+
+	tsr = &state->regs[dst->reg1];
+
+	if (!has_reg_type(state, src->reg1) ||
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
index 7a48c3d72b89..734acdd8c4b7 100644
--- a/tools/perf/util/annotate-data.c
+++ b/tools/perf/util/annotate-data.c
@@ -1080,6 +1080,13 @@ static int find_data_type_insn(struct data_loc_info *dloc,
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
@@ -1094,7 +1101,7 @@ static int find_data_type_block(struct data_loc_info *dloc,
 	int ret = -1;
 
 	/* TODO: other architecture support */
-	if (!arch__is(dloc->arch, "x86"))
+	if (!arch_supports_insn_tracking(dloc))
 		return -1;
 
 	prev_dst_ip = dst_ip = dloc->ip;
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 801d57287a35..a839f037bdaf 100644
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

