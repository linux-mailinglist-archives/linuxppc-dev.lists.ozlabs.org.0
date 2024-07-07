Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2797929864
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 16:45:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CG37uEbx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WH95y4l9Zz3cGS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2024 00:45:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CG37uEbx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WH95C74Gkz30TK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2024 00:44:47 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 467DIYvA029756;
	Sun, 7 Jul 2024 14:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=kQC5VTKaMX+Uc
	BgJ2AWgO2ehiJXqCbQEXoK+CylhJLA=; b=CG37uEbxhIqoxOJ1+L27UuJYNDXSR
	KJdu9xQ+/41YM3ZG0Xofe6TVB+J2tUFgFfkwMRgHvC7+iYb7UuvlFtd7VKWrewkq
	yVCmyzX7oQg+QAgewI36ixd5ZaiSdCw/k1i+GhZAwYIzc2L8UaKUHvfZ6xiCIZMY
	iYH7JzR4WJuodtnO81bcZYlOfE4J6Y4Bnl4XMpo0yva54rCT5EQ+P1bDRwksFFWN
	IfQOMkc66SBjC1czKdGKgtTmdUQCQz9yrqMWmc5QLwF2eUO2jO8k+bL4+UgGta2J
	o14xkFmqNPx79pZ8LNuMVnB369srabHr8FgW+719fRAbQToG0hAJz6PTw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 407u23r6f9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Jul 2024 14:44:36 +0000 (GMT)
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 467EiZxi017407;
	Sun, 7 Jul 2024 14:44:35 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 407u23r6f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Jul 2024 14:44:35 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 467B7XG8024583;
	Sun, 7 Jul 2024 14:44:34 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 407hrmad74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Jul 2024 14:44:34 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 467EiShD42926370
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 7 Jul 2024 14:44:30 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59DF220049;
	Sun,  7 Jul 2024 14:44:28 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6ECCE20040;
	Sun,  7 Jul 2024 14:44:25 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.1.68])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  7 Jul 2024 14:44:25 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V6 01/18] tools/perf: Move the data structures related to register type to header file
Date: Sun,  7 Jul 2024 20:14:02 +0530
Message-Id: <20240707144419.92510-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240707144419.92510-1-atrajeev@linux.vnet.ibm.com>
References: <20240707144419.92510-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bcRy2bif2y7HvszFu-lZ2qha5j1WHPuQ
X-Proofpoint-ORIG-GUID: y5F-4WqTK9gqSSRL7EGc_Y7TsBYhsGxY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-07_06,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
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

Data type profiling uses instruction tracking by checking each
instruction and updating the register type state in some data
structures. This is useful to find the data type in cases when the
register state gets transferred from one reg to another. Example, in
x86, "mov" instruction and in powerpc, "mr" instruction. Currently these
structures are defined in annotate-data.c and instruction tracking is
implemented only for x86. Move these data structures to
"annotate-data.h" header file so that other arch implementations can use
it in arch specific files as well.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/annotate-data.c | 53 +------------------------------
 tools/perf/util/annotate-data.h | 56 +++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 52 deletions(-)

diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
index 965da6c0b542..a4c7f98a75e3 100644
--- a/tools/perf/util/annotate-data.c
+++ b/tools/perf/util/annotate-data.c
@@ -31,15 +31,6 @@
 
 static void delete_var_types(struct die_var_type *var_types);
 
-enum type_state_kind {
-	TSR_KIND_INVALID = 0,
-	TSR_KIND_TYPE,
-	TSR_KIND_PERCPU_BASE,
-	TSR_KIND_CONST,
-	TSR_KIND_POINTER,
-	TSR_KIND_CANARY,
-};
-
 #define pr_debug_dtp(fmt, ...)					\
 do {								\
 	if (debug_type_profile)					\
@@ -140,49 +131,7 @@ static void pr_debug_location(Dwarf_Die *die, u64 pc, int reg)
 	}
 }
 
-/*
- * Type information in a register, valid when @ok is true.
- * The @caller_saved registers are invalidated after a function call.
- */
-struct type_state_reg {
-	Dwarf_Die type;
-	u32 imm_value;
-	bool ok;
-	bool caller_saved;
-	u8 kind;
-};
-
-/* Type information in a stack location, dynamically allocated */
-struct type_state_stack {
-	struct list_head list;
-	Dwarf_Die type;
-	int offset;
-	int size;
-	bool compound;
-	u8 kind;
-};
-
-/* FIXME: This should be arch-dependent */
-#define TYPE_STATE_MAX_REGS  16
-
-/*
- * State table to maintain type info in each register and stack location.
- * It'll be updated when new variable is allocated or type info is moved
- * to a new location (register or stack).  As it'd be used with the
- * shortest path of basic blocks, it only maintains a single table.
- */
-struct type_state {
-	/* state of general purpose registers */
-	struct type_state_reg regs[TYPE_STATE_MAX_REGS];
-	/* state of stack location */
-	struct list_head stack_vars;
-	/* return value register */
-	int ret_reg;
-	/* stack pointer register */
-	int stack_reg;
-};
-
-static bool has_reg_type(struct type_state *state, int reg)
+bool has_reg_type(struct type_state *state, int reg)
 {
 	return (unsigned)reg < ARRAY_SIZE(state->regs);
 }
diff --git a/tools/perf/util/annotate-data.h b/tools/perf/util/annotate-data.h
index 0a57d9f5ee78..cdb5cd8960bb 100644
--- a/tools/perf/util/annotate-data.h
+++ b/tools/perf/util/annotate-data.h
@@ -6,6 +6,11 @@
 #include <linux/compiler.h>
 #include <linux/rbtree.h>
 #include <linux/types.h>
+#include "annotate.h"
+
+#ifdef HAVE_DWARF_SUPPORT
+#include "debuginfo.h"
+#endif
 
 struct annotated_op_loc;
 struct debuginfo;
@@ -15,6 +20,15 @@ struct hist_entry;
 struct map_symbol;
 struct thread;
 
+enum type_state_kind {
+	TSR_KIND_INVALID = 0,
+	TSR_KIND_TYPE,
+	TSR_KIND_PERCPU_BASE,
+	TSR_KIND_CONST,
+	TSR_KIND_POINTER,
+	TSR_KIND_CANARY,
+};
+
 /**
  * struct annotated_member - Type of member field
  * @node: List entry in the parent list
@@ -143,6 +157,47 @@ struct annotated_data_stat {
 extern struct annotated_data_stat ann_data_stat;
 
 #ifdef HAVE_DWARF_SUPPORT
+/*
+ * Type information in a register, valid when @ok is true.
+ * The @caller_saved registers are invalidated after a function call.
+ */
+struct type_state_reg {
+	Dwarf_Die type;
+	u32 imm_value;
+	bool ok;
+	bool caller_saved;
+	u8 kind;
+};
+
+/* Type information in a stack location, dynamically allocated */
+struct type_state_stack {
+	struct list_head list;
+	Dwarf_Die type;
+	int offset;
+	int size;
+	bool compound;
+	u8 kind;
+};
+
+/* FIXME: This should be arch-dependent */
+#define TYPE_STATE_MAX_REGS  16
+
+/*
+ * State table to maintain type info in each register and stack location.
+ * It'll be updated when new variable is allocated or type info is moved
+ * to a new location (register or stack).  As it'd be used with the
+ * shortest path of basic blocks, it only maintains a single table.
+ */
+struct type_state {
+	/* state of general purpose registers */
+	struct type_state_reg regs[TYPE_STATE_MAX_REGS];
+	/* state of stack location */
+	struct list_head stack_vars;
+	/* return value register */
+	int ret_reg;
+	/* stack pointer register */
+	int stack_reg;
+};
 
 /* Returns data type at the location (ip, reg, offset) */
 struct annotated_data_type *find_data_type(struct data_loc_info *dloc);
@@ -160,6 +215,7 @@ void global_var_type__tree_delete(struct rb_root *root);
 
 int hist_entry__annotate_data_tty(struct hist_entry *he, struct evsel *evsel);
 
+bool has_reg_type(struct type_state *state, int reg);
 #else /* HAVE_DWARF_SUPPORT */
 
 static inline struct annotated_data_type *
-- 
2.43.0

