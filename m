Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 100B1934A88
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 10:56:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pW9SXWMK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPmrN75Prz3dJm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 18:56:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pW9SXWMK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPmc72DbDz3dDt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 18:45:58 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I8QbVD001322;
	Thu, 18 Jul 2024 08:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=vr7W5Xzm/s9Qa
	GIYhCDx0WOA+B+aZE32cz0L1rM6Vwg=; b=pW9SXWMKSYs6hWtNCo6iTt+eJ3uii
	pcd9YN1HUOaIYiDNGV7+OJ+Wji0vf3Cc6WrjWj35+FvggbQFFF408hgsTYZgkBAH
	BRi47v72HOlmWY7DeEUAEkw6qfqjuBMK5hynl3XZfKIluDJwa861atsJADHV2AsE
	nyM5eijqpYbc9O4/C8Z3xyA3OeMKgmdve/T/gnvKQ7ez1RPNVXYvEtmdOdYE4l2o
	JXZk2uAr12TXZk+5pI0yhGzTWujiqlBtOpNXTCYe5VwA4bUpR6ZxK/9FYK+9oXa5
	sNWiKTqp1jASGo7owLmqJ7Y+KW2q2FI60CbCRygltmpPiMt55bEckBSBQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40ewtpg91k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 08:45:50 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46I8hZ2i024954;
	Thu, 18 Jul 2024 08:45:50 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40ewtpg91f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 08:45:50 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46I59J0Z006020;
	Thu, 18 Jul 2024 08:45:49 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 40dwkn8rks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 08:45:49 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46I8jhrR44106172
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Jul 2024 08:45:46 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D013C2004E;
	Thu, 18 Jul 2024 08:45:43 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85A1320040;
	Thu, 18 Jul 2024 08:45:40 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.69.1])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Jul 2024 08:45:40 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V8 15/15] tools/perf: Set instruction name to be used with insn-stat when using raw instruction
Date: Thu, 18 Jul 2024 14:13:58 +0530
Message-Id: <20240718084358.72242-16-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240718084358.72242-1-atrajeev@linux.vnet.ibm.com>
References: <20240718084358.72242-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hIEO2A8xu-DdcJHOjttqB19CRvjQewcP
X-Proofpoint-ORIG-GUID: 55Ht9lDrkXJK5fCm_P8VLmxO3lzK_6hb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_04,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407180054
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

Since the "ins.name" is not set while using raw instruction,
perf annotate with insn-stat gives wrong data:

Result from "./perf annotate --data-type --insn-stat":

Annotate Instruction stats
total 615, ok 419 (68.1%), bad 196 (31.9%)

  Name      :  Good   Bad
  -----------------------------------------------------------
            :   419   196

Patch sets "dl->ins.name" in arch specific function "check_ppc_insn"
while initialising "struct disasm_line". Also update "ins_find" function
to pass "struct disasm_line" as a parameter so as to set its name field
in arch specific call.

With the patch changes:

  Annotate Instruction stats
  total 609, ok 446 (73.2%), bad 163 (26.8%)

  Name/opcode         :  Good   Bad
  -----------------------------------------------------------
  58                  :   323    80
  32                  :    49    43
  34                  :    33    11
  OP_31_XOP_LDX       :     8    20
  40                  :    23     0
  OP_31_XOP_LWARX     :     5     1
  OP_31_XOP_LWZX      :     2     3
  OP_31_XOP_LDARX     :     3     0
  33                  :     0     2
  OP_31_XOP_LBZX      :     0     1
  OP_31_XOP_LWAX      :     0     1
  OP_31_XOP_LHZX      :     0     1

Reviewed-and-tested-by: Kajol Jain<kjain@linux.ibm.com>
Reviewed-by: Namhyung Kim <namhyung@kernel.org>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../perf/arch/powerpc/annotate/instructions.c  | 18 +++++++++++++++---
 tools/perf/builtin-annotate.c                  |  4 ++--
 tools/perf/util/annotate.c                     |  2 +-
 tools/perf/util/disasm.c                       | 10 +++++-----
 tools/perf/util/disasm.h                       |  2 +-
 5 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/tools/perf/arch/powerpc/annotate/instructions.c b/tools/perf/arch/powerpc/annotate/instructions.c
index af1032572bf3..ede9eeade0ab 100644
--- a/tools/perf/arch/powerpc/annotate/instructions.c
+++ b/tools/perf/arch/powerpc/annotate/instructions.c
@@ -189,8 +189,9 @@ static int cmp_offset(const void *a, const void *b)
 	return (val1->value - val2->value);
 }
 
-static struct ins_ops *check_ppc_insn(u32 raw_insn)
+static struct ins_ops *check_ppc_insn(struct disasm_line *dl)
 {
+	int raw_insn = dl->raw.raw_insn;
 	int opcode = PPC_OP(raw_insn);
 	int mem_insn_31 = PPC_21_30(raw_insn);
 	struct insn_offset *ret;
@@ -198,19 +199,30 @@ static struct ins_ops *check_ppc_insn(u32 raw_insn)
 		"OP_31_INSN",
 		mem_insn_31
 	};
+	char name_insn[32];
 
 	/*
 	 * Instructions with opcode 32 to 63 are memory
 	 * instructions in powerpc
 	 */
 	if ((opcode & 0x20)) {
+		/*
+		 * Set name in case of raw instruction to
+		 * opcode to be used in insn-stat
+		 */
+		if (!strlen(dl->ins.name)) {
+			sprintf(name_insn, "%d", opcode);
+			dl->ins.name = strdup(name_insn);
+		}
 		return &load_store_ops;
 	} else if (opcode == 31) {
 		/* Check for memory instructions with opcode 31 */
 		ret = bsearch(&mem_insns_31_opcode, ins_array, ARRAY_SIZE(ins_array), sizeof(ins_array[0]), cmp_offset);
-		if (ret != NULL)
+		if (ret) {
+			if (!strlen(dl->ins.name))
+				dl->ins.name = strdup(ret->name);
 			return &load_store_ops;
-		else {
+		} else {
 			mem_insns_31_opcode.value = PPC_22_30(raw_insn);
 			ret = bsearch(&mem_insns_31_opcode, arithmetic_ins_op_31, ARRAY_SIZE(arithmetic_ins_op_31),
 					sizeof(arithmetic_ins_op_31[0]), cmp_offset);
diff --git a/tools/perf/builtin-annotate.c b/tools/perf/builtin-annotate.c
index b10b7f005658..cf60392b1c19 100644
--- a/tools/perf/builtin-annotate.c
+++ b/tools/perf/builtin-annotate.c
@@ -396,10 +396,10 @@ static void print_annotate_item_stat(struct list_head *head, const char *title)
 	printf("total %d, ok %d (%.1f%%), bad %d (%.1f%%)\n\n", total,
 	       total_good, 100.0 * total_good / (total ?: 1),
 	       total_bad, 100.0 * total_bad / (total ?: 1));
-	printf("  %-10s: %5s %5s\n", "Name", "Good", "Bad");
+	printf("  %-20s: %5s %5s\n", "Name/opcode", "Good", "Bad");
 	printf("-----------------------------------------------------------\n");
 	list_for_each_entry(istat, head, list)
-		printf("  %-10s: %5d %5d\n", istat->name, istat->good, istat->bad);
+		printf("  %-20s: %5d %5d\n", istat->name, istat->good, istat->bad);
 	printf("\n");
 }
 
diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index ce99db291c5e..a2ee4074f768 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -2229,7 +2229,7 @@ static struct annotated_item_stat *annotate_data_stat(struct list_head *head,
 		return NULL;
 
 	istat->name = strdup(name);
-	if (istat->name == NULL) {
+	if ((istat->name == NULL) || (!strlen(istat->name))) {
 		free(istat);
 		return NULL;
 	}
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 63681df6482b..cd283c42195c 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -859,7 +859,7 @@ static void ins__sort(struct arch *arch)
 	qsort(arch->instructions, nmemb, sizeof(struct ins), ins__cmp);
 }
 
-static struct ins_ops *__ins__find(struct arch *arch, const char *name, u32 raw_insn)
+static struct ins_ops *__ins__find(struct arch *arch, const char *name, struct disasm_line *dl)
 {
 	struct ins *ins;
 	const int nmemb = arch->nr_instructions;
@@ -871,7 +871,7 @@ static struct ins_ops *__ins__find(struct arch *arch, const char *name, u32 raw_
 		 */
 		struct ins_ops *ops;
 
-		ops = check_ppc_insn(raw_insn);
+		ops = check_ppc_insn(dl);
 		if (ops)
 			return ops;
 	}
@@ -905,9 +905,9 @@ static struct ins_ops *__ins__find(struct arch *arch, const char *name, u32 raw_
 	return ins ? ins->ops : NULL;
 }
 
-struct ins_ops *ins__find(struct arch *arch, const char *name, u32 raw_insn)
+struct ins_ops *ins__find(struct arch *arch, const char *name, struct disasm_line *dl)
 {
-	struct ins_ops *ops = __ins__find(arch, name, raw_insn);
+	struct ins_ops *ops = __ins__find(arch, name, dl);
 
 	if (!ops && arch->associate_instruction_ops)
 		ops = arch->associate_instruction_ops(arch, name);
@@ -917,7 +917,7 @@ struct ins_ops *ins__find(struct arch *arch, const char *name, u32 raw_insn)
 
 static void disasm_line__init_ins(struct disasm_line *dl, struct arch *arch, struct map_symbol *ms)
 {
-	dl->ins.ops = ins__find(arch, dl->ins.name, dl->raw.raw_insn);
+	dl->ins.ops = ins__find(arch, dl->ins.name, dl);
 
 	if (!dl->ins.ops)
 		return;
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index c1bb1e484bfb..f56beedeb9da 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -105,7 +105,7 @@ struct annotate_args {
 struct arch *arch__find(const char *name);
 bool arch__is(struct arch *arch, const char *name);
 
-struct ins_ops *ins__find(struct arch *arch, const char *name, u32 raw_insn);
+struct ins_ops *ins__find(struct arch *arch, const char *name, struct disasm_line *dl);
 int ins__scnprintf(struct ins *ins, char *bf, size_t size,
 		   struct ins_operands *ops, int max_ins_name);
 
-- 
2.43.0

