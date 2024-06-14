Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FAF90916E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 19:28:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HLV12VmY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W15pY4dstz3cf7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 03:28:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HLV12VmY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W15n32Fndz3cYM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 03:27:02 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45EGcJie010803;
	Fri, 14 Jun 2024 17:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=co57nuNrHPYEE
	66TT44hKD3LaG//aQrqYGNHuVsyeuY=; b=HLV12VmYsrfWJd1ExrQiGO+/A1uz6
	L6ihSadu0clIsJw1ADki2PQXH6N9eZ2Oz00xlNdAA1WiUZWD/wlW7CnzdDeSJjLr
	9CBRLrvzZ/dLdUaeUw5nTTM7wN2jzSvawqViS3Xuk8Tj2M8adYvzyl2BqeQhTCK6
	34Tq5yBvoHiJl0BOkQoiHpPUSSo4/ZqPfwCC9yEB7pLodE4SY5CDCpER0uJTk11g
	0fpt4s9o06b/hE2BLcLr4plQspWpiMpFJD9UHMJ72vHp9z0E02XEqH1IZDb4zskl
	JQBEDyi6j0ZT26wqkDn4zsZvAbpJkywjRSWBrAEuRcDbq/frpJQZHbE7Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yrsja85en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 17:26:51 +0000 (GMT)
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45EHQoXF025347;
	Fri, 14 Jun 2024 17:26:50 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yrsja85ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 17:26:50 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45EGGQcR027246;
	Fri, 14 Jun 2024 17:26:50 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yn211kkwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 17:26:50 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45EHQiTG44761564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 17:26:46 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 385E720040;
	Fri, 14 Jun 2024 17:26:44 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D44420043;
	Fri, 14 Jun 2024 17:26:41 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.82.18])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Jun 2024 17:26:41 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [V4 01/16] tools/perf: Move the data structures related to register type to header file
Date: Fri, 14 Jun 2024 22:56:16 +0530
Message-Id: <20240614172631.56803-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240614172631.56803-1-atrajeev@linux.vnet.ibm.com>
References: <20240614172631.56803-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Tvpa_wW7tyV71PHvIjkvWyrZIoMo3Nbb
X-Proofpoint-GUID: HNOsJHHA5Qd4NzxTP-6t7ZJkVXE-r85L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_15,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406140119
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
 tools/perf/util/annotate-data.h | 55 +++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 52 deletions(-)

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
index 0a57d9f5ee78..ef235b1b15e1 100644
--- a/tools/perf/util/annotate-data.h
+++ b/tools/perf/util/annotate-data.h
@@ -6,6 +6,9 @@
 #include <linux/compiler.h>
 #include <linux/rbtree.h>
 #include <linux/types.h>
+#include "dwarf-aux.h"
+#include "annotate.h"
+#include "debuginfo.h"
 
 struct annotated_op_loc;
 struct debuginfo;
@@ -15,6 +18,15 @@ struct hist_entry;
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
@@ -142,6 +154,48 @@ struct annotated_data_stat {
 };
 extern struct annotated_data_stat ann_data_stat;
 
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
+#define TYPE_STATE_MAX_REGS  32
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
+
 #ifdef HAVE_DWARF_SUPPORT
 
 /* Returns data type at the location (ip, reg, offset) */
@@ -160,6 +214,7 @@ void global_var_type__tree_delete(struct rb_root *root);
 
 int hist_entry__annotate_data_tty(struct hist_entry *he, struct evsel *evsel);
 
+bool has_reg_type(struct type_state *state, int reg);
 #else /* HAVE_DWARF_SUPPORT */
 
 static inline struct annotated_data_type *
-- 
2.43.0

