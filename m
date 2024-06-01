Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7608A8D6E55
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 08:16:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qhnxHpYf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrqVl4zttz3bqP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 16:15:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qhnxHpYf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrqNR0WVQz30VH
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 16:10:30 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4515lOPe007863;
	Sat, 1 Jun 2024 06:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=+9nPPwcmLRJPMlzbYuZl7IbE0jq0jxMgtvrCV7+6ht8=;
 b=qhnxHpYfUlhsssNg+ptlVSxnuyQ8WeO44sV3cZNh3OlkxOgVhIu03igg+3nMJEv2wIGM
 SL0m8NQaklUEUlCvRWfHplcI6SJQ80gkRpHTpVekadWFQw50Aa2fWXtjsopx4CdOpZTb
 vagJSH2rc+qYTQ7uAFlhQ/ry2+JptuPQd2INNOMdYH+yAlbGryTL4DHJpSLGVVx9+TLO
 dRFjbpSVWQHTdAa4v/jNd1IvvZnkwjxPjmth6S013+D3WJjrnMmbIh+CfUVkepiCBhRc
 fVDK61QtvjjR4e+dHDIw1Eu58dSv2+orpx2+/WWuMKnB/5bMTUwRA/uVrnCQTSNW/iio zg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yfwt281vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Jun 2024 06:10:23 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4516AMlu019364;
	Sat, 1 Jun 2024 06:10:22 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yfwt281v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Jun 2024 06:10:22 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4514JJkX013313;
	Sat, 1 Jun 2024 06:10:20 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yfvad8gjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Jun 2024 06:10:20 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4516AEes43975066
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 1 Jun 2024 06:10:17 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9BCB2004D;
	Sat,  1 Jun 2024 06:10:14 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5E6820040;
	Sat,  1 Jun 2024 06:10:11 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.41.43])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  1 Jun 2024 06:10:11 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V3 07/14] tools/perf: Add support to identify memory instructions of opcode 31 in powerpc
Date: Sat,  1 Jun 2024 11:39:34 +0530
Message-Id: <20240601060941.13692-8-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240601060941.13692-1-atrajeev@linux.vnet.ibm.com>
References: <20240601060941.13692-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PqEsXCLTKK58gjEK3kpGcFetCS-AhGvl
X-Proofpoint-GUID: cbUejsWQ745Z0midxG80U3MkXnAf7Me0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-01_01,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 mlxlogscore=934
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

There are memory instructions in powerpc with opcode as 31.
Example: "ldx RT,RA,RB" , Its X form is as below:

  ______________________________________
  | 31 |  RT  |  RA |  RB |   21     |/|
  --------------------------------------
  0    6     11    16    21         30 31

The opcode for "ldx" is 31. There are other instructions also with
opcode 31 which are memory insn like ldux, stbx, lwzx, lhaux
But all instructions with opcode 31 are not memory. Example is add
instruction: "add RT,RA,RB"

The value in bit 21-30 [ 21 for ldx ] is different for these
instructions. Patch uses this value to assign instruction ops for these
cases. The naming convention and value to identify these are picked from
defines in "arch/powerpc/include/asm/ppc-opcode.h"

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../perf/arch/powerpc/annotate/instructions.c | 107 +++++++++++++++++-
 tools/perf/util/disasm.c                      |   4 +-
 2 files changed, 108 insertions(+), 3 deletions(-)

diff --git a/tools/perf/arch/powerpc/annotate/instructions.c b/tools/perf/arch/powerpc/annotate/instructions.c
index 10fea5e5cf4c..4ee959a24738 100644
--- a/tools/perf/arch/powerpc/annotate/instructions.c
+++ b/tools/perf/arch/powerpc/annotate/instructions.c
@@ -49,18 +49,121 @@ static struct ins_ops *powerpc__associate_instruction_ops(struct arch *arch, con
 	return ops;
 }
 
-#define PPC_OP(op)      (((op) >> 26) & 0x3F)
+#define PPC_OP(op)	(((op) >> 26) & 0x3F)
+#define PPC_21_30(R)	(((R) >> 1) & 0x3ff)
+
+struct insn_offset {
+	const char	*name;
+	int		value;
+};
+
+/*
+ * There are memory instructions with opcode 31 which are
+ * of X Form, Example:
+ * ldx RT,RA,RB
+ * ______________________________________
+ * | 31 |  RT  |  RA |  RB |   21     |/|
+ * --------------------------------------
+ * 0    6     11    16    21         30 31
+ *
+ * But all instructions with opcode 31 are not memory.
+ * Example: add RT,RA,RB
+ *
+ * Use bits 21 to 30 to check memory insns with 31 as opcode.
+ * In ins_array below, for ldx instruction:
+ * name => OP_31_XOP_LDX
+ * value => 21
+ */
+
+static struct insn_offset ins_array[] = {
+	{ .name = "OP_31_XOP_LXSIWZX",  .value = 12, },
+	{ .name = "OP_31_XOP_LWARX",	.value = 20, },
+	{ .name = "OP_31_XOP_LDX",	.value = 21, },
+	{ .name = "OP_31_XOP_LWZX",	.value = 23, },
+	{ .name = "OP_31_XOP_LDUX",	.value = 53, },
+	{ .name = "OP_31_XOP_LWZUX",	.value = 55, },
+	{ .name = "OP_31_XOP_LXSIWAX",  .value = 76, },
+	{ .name = "OP_31_XOP_LDARX",    .value = 84, },
+	{ .name = "OP_31_XOP_LBZX",	.value = 87, },
+	{ .name = "OP_31_XOP_LVX",      .value = 103, },
+	{ .name = "OP_31_XOP_LBZUX",    .value = 119, },
+	{ .name = "OP_31_XOP_STXSIWX",  .value = 140, },
+	{ .name = "OP_31_XOP_STDX",	.value = 149, },
+	{ .name = "OP_31_XOP_STWX",	.value = 151, },
+	{ .name = "OP_31_XOP_STDUX",	.value = 181, },
+	{ .name = "OP_31_XOP_STWUX",	.value = 183, },
+	{ .name = "OP_31_XOP_STBX",	.value = 215, },
+	{ .name = "OP_31_XOP_STVX",     .value = 231, },
+	{ .name = "OP_31_XOP_STBUX",	.value = 247, },
+	{ .name = "OP_31_XOP_LHZX",	.value = 279, },
+	{ .name = "OP_31_XOP_LHZUX",	.value = 311, },
+	{ .name = "OP_31_XOP_LXVDSX",   .value = 332, },
+	{ .name = "OP_31_XOP_LWAX",	.value = 341, },
+	{ .name = "OP_31_XOP_LHAX",	.value = 343, },
+	{ .name = "OP_31_XOP_LWAUX",	.value = 373, },
+	{ .name = "OP_31_XOP_LHAUX",	.value = 375, },
+	{ .name = "OP_31_XOP_STHX",	.value = 407, },
+	{ .name = "OP_31_XOP_STHUX",	.value = 439, },
+	{ .name = "OP_31_XOP_LXSSPX",   .value = 524, },
+	{ .name = "OP_31_XOP_LDBRX",	.value = 532, },
+	{ .name = "OP_31_XOP_LSWX",	.value = 533, },
+	{ .name = "OP_31_XOP_LWBRX",	.value = 534, },
+	{ .name = "OP_31_XOP_LFSUX",    .value = 567, },
+	{ .name = "OP_31_XOP_LXSDX",    .value = 588, },
+	{ .name = "OP_31_XOP_LSWI",	.value = 597, },
+	{ .name = "OP_31_XOP_LFDX",     .value = 599, },
+	{ .name = "OP_31_XOP_LFDUX",    .value = 631, },
+	{ .name = "OP_31_XOP_STXSSPX",  .value = 652, },
+	{ .name = "OP_31_XOP_STDBRX",	.value = 660, },
+	{ .name = "OP_31_XOP_STXWX",	.value = 661, },
+	{ .name = "OP_31_XOP_STWBRX",	.value = 662, },
+	{ .name = "OP_31_XOP_STFSX",	.value = 663, },
+	{ .name = "OP_31_XOP_STFSUX",	.value = 695, },
+	{ .name = "OP_31_XOP_STXSDX",   .value = 716, },
+	{ .name = "OP_31_XOP_STSWI",	.value = 725, },
+	{ .name = "OP_31_XOP_STFDX",	.value = 727, },
+	{ .name = "OP_31_XOP_STFDUX",	.value = 759, },
+	{ .name = "OP_31_XOP_LXVW4X",   .value = 780, },
+	{ .name = "OP_31_XOP_LHBRX",	.value = 790, },
+	{ .name = "OP_31_XOP_LXVD2X",   .value = 844, },
+	{ .name = "OP_31_XOP_LFIWAX",	.value = 855, },
+	{ .name = "OP_31_XOP_LFIWZX",	.value = 887, },
+	{ .name = "OP_31_XOP_STXVW4X",  .value = 908, },
+	{ .name = "OP_31_XOP_STHBRX",	.value = 918, },
+	{ .name = "OP_31_XOP_STXVD2X",  .value = 972, },
+	{ .name = "OP_31_XOP_STFIWX",	.value = 983, },
+};
+
+static int cmp_offset(const void *a, const void *b)
+{
+	const struct insn_offset *val1 = a;
+	const struct insn_offset *val2 = b;
+
+	return (val1->value - val2->value);
+}
 
 static struct ins_ops *check_ppc_insn(int raw_insn)
 {
 	int opcode = PPC_OP(raw_insn);
+	int mem_insn_31 = PPC_21_30(raw_insn);
+	struct insn_offset *ret;
+	struct insn_offset mem_insns_31_opcode = {
+		"OP_31_INSN",
+		mem_insn_31
+	};
 
 	/*
 	 * Instructions with opcode 32 to 63 are memory
 	 * instructions in powerpc
 	 */
-	if ((opcode & 0x20))
+	if ((opcode & 0x20)) {
 		return &load_store_ops;
+	} else if (opcode == 31) {
+		/* Check for memory instructions with opcode 31 */
+		ret = bsearch(&mem_insns_31_opcode, ins_array, ARRAY_SIZE(ins_array), sizeof(ins_array[0]), cmp_offset);
+		if (ret != NULL)
+			return &load_store_ops;
+	}
 
 	return NULL;
 }
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 252cb0d1f5d1..16d1e3eaaeb3 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -693,7 +693,9 @@ static int load_store__parse(struct arch *arch __maybe_unused, struct ins_operan
 	ops->source.raw_insn = ops->raw_insn;
 	ops->source.mem_ref = true;
 	ops->source.opcode = ops->opcode;
-	ops->source.multi_regs = false;
+	/* opcode 31 is of X form */
+	if (ops->source.opcode == 31)
+		ops->source.multi_regs = true;
 
 	if (!ops->source.raw_insn)
 		return -1;
-- 
2.43.0

