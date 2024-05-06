Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A518BCDC8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 14:24:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZGApZSZo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VY0w311mFz3cZF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 22:24:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZGApZSZo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VY0pf69sgz30WP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 22:19:54 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 446BlZfA011547;
	Mon, 6 May 2024 12:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=iHTUeZ0T/IUAIn09/t+OMcvI8S2itkKjhzjC2IDYdIQ=;
 b=ZGApZSZo1hSk4xnXEa2DFpGLUp4RH3Lu47IlF4IrNySuGSWMPnt7yo4HgSxVaV5AJmSQ
 0gUFd38hoWaAcukD23OrCifT2X7Pf+mrj+wTOnPQ2qEiCNK4Lf/9c3JkAXvZgtfRqAa6
 6wtySAVrYLzE8khbJnWWr8IIjekH9CNbIjO+aH0SarvDSjoSysyXfogLpnW953zXKuFp
 B95Ll9biQqZO6gtYm4as6zJRL6Mth+8rvGAlys7NlD6MzbS72LLGqp7Qc8OlLQwppNZA
 O756hvbhdXc0sGzLxZO49nvrwfMSMnI0LDRb5fHNmMI/uTv6KuOB2U147rVF2CqXoLe8 gg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xxxmt82yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 12:19:47 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 446CJkQZ005665;
	Mon, 6 May 2024 12:19:46 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xxxmt82ym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 12:19:46 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 446BfLV4031316;
	Mon, 6 May 2024 12:19:45 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xwybtr2ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 12:19:45 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 446CJewn40108518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 May 2024 12:19:42 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 439F120049;
	Mon,  6 May 2024 12:19:40 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7345F20040;
	Mon,  6 May 2024 12:19:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.103.211])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 May 2024 12:19:37 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V2 7/9] tools/perf: Update instruction tracking with add instruction
Date: Mon,  6 May 2024 17:49:04 +0530
Message-Id: <20240506121906.76639-8-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
References: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2k4ly3FmCmI4WVbNYzBIFkjqTnlVDspR
X-Proofpoint-GUID: Y42foEVAob09gcOwenFX9W6oVukdxgF-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_07,2024-05-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405060085
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

Update instruction tracking with add instruction. Apart from "mr"
instruction, the register state is carried on by other insns, ie,
"add, addi, addis". Since these are not memory instructions and doesn't
fall in the range of (32 to 63), add these as part of nmemonic table.
For now, add* instructions are added. There is possibility of getting
more added here. But to extract regs, still the binary code will be
used. So associate this with "load_store_ops" itself and no other
changes required.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../perf/arch/powerpc/annotate/instructions.c | 21 +++++++++++++++++++
 tools/perf/util/disasm.c                      |  1 +
 2 files changed, 22 insertions(+)

diff --git a/tools/perf/arch/powerpc/annotate/instructions.c b/tools/perf/arch/powerpc/annotate/instructions.c
index cce7023951fe..1f35d8a65bb4 100644
--- a/tools/perf/arch/powerpc/annotate/instructions.c
+++ b/tools/perf/arch/powerpc/annotate/instructions.c
@@ -1,6 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/compiler.h>
 
+/*
+ * powerpc instruction nmemonic table to associate load/store instructions with
+ * move_ops. mov_ops is used to identify add/mr to do instruction tracking.
+ */
+static struct ins powerpc__instructions[] = {
+	{ .name = "mr",         .ops = &load_store_ops,  },
+	{ .name = "addi",       .ops = &load_store_ops,   },
+	{ .name = "addis",      .ops = &load_store_ops,  },
+	{ .name = "add",        .ops = &load_store_ops,  },
+};
+
 static struct ins_ops *powerpc__associate_instruction_ops(struct arch *arch, const char *name)
 {
 	int i;
@@ -75,6 +86,9 @@ static void update_insn_state_powerpc(struct type_state *state,
 	if (annotate_get_insn_location(dloc->arch, dl, &loc) < 0)
 		return;
 
+	if (!strncmp(dl->ins.name, "add", 3))
+		goto regs_check;
+
 	if (strncmp(dl->ins.name, "mr", 2))
 		return;
 
@@ -85,6 +99,7 @@ static void update_insn_state_powerpc(struct type_state *state,
 		dst->reg1 = src_reg;
 	}
 
+regs_check:
 	if (!has_reg_type(state, dst->reg1))
 		return;
 
@@ -115,6 +130,12 @@ static void update_insn_state_powerpc(struct type_state *state __maybe_unused, s
 static int powerpc__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
 {
 	if (!arch->initialized) {
+		arch->nr_instructions = ARRAY_SIZE(powerpc__instructions);
+		arch->instructions = calloc(arch->nr_instructions, sizeof(struct ins));
+		if (!arch->instructions)
+			return -ENOMEM;
+		memcpy(arch->instructions, powerpc__instructions, sizeof(struct ins) * arch->nr_instructions);
+		arch->nr_instructions_allocated = arch->nr_instructions;
 		arch->initialized = true;
 		arch->associate_instruction_ops = powerpc__associate_instruction_ops;
 		arch->objdump.comment_char      = '#';
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index ac6b8b8da38a..32cf506a9010 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -36,6 +36,7 @@ static struct ins_ops mov_ops;
 static struct ins_ops nop_ops;
 static struct ins_ops lock_ops;
 static struct ins_ops ret_ops;
+static struct ins_ops load_store_ops;
 
 static int jump__scnprintf(struct ins *ins, char *bf, size_t size,
 			   struct ins_operands *ops, int max_ins_name);
-- 
2.43.0

