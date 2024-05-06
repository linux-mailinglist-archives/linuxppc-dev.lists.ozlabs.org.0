Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D898BCDAB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 14:21:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J1II07+m;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VY0qt3G6Sz3cSp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 22:20:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J1II07+m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VY0pQ4MrDz2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 22:19:42 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 446Arb4q020821;
	Mon, 6 May 2024 12:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gSGdGqLNePCs3Ej/AqCwp17nX5/Q3Dt39eOfXgqNevw=;
 b=J1II07+mz7kOOCChPd4En8BQNeFPCa7r2x4E6XJ9GeVO/Siz8xZKnvGb5YmPhYgmgXxo
 i0sAhuG2nh3msIwaAT2/YuoUP2dwVRqP7I2fGh96GUwbIcXM0aT7NnPLm5b+eXspTwxI
 k2TvZ+OnIGqdfWLry8S83XjAvXChq5W7tq1tQ7w9cvOyKj/UWTM8rYrG5LqcEGvteZwt
 kjacLoyNjxdepBn/QGYYw6SluRclfZVfusWvTJIQypKZ8+0wdQXsRGQXQ1rwW9+YZSft
 sSU+FNRWfh6H5rMmIWg4y0bE4yThcqbh+7FmNLeNuyKSjj7yG9vNA12N1vzqfsnboB0S hw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xxwu5r67s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 12:19:27 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 446CJRRq021976;
	Mon, 6 May 2024 12:19:27 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xxwu5r67n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 12:19:27 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 446BfNVq030881;
	Mon, 6 May 2024 12:19:26 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xwybtr29u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 12:19:26 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 446CJK9d22151554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 May 2024 12:19:22 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B2F0F2004D;
	Mon,  6 May 2024 12:19:20 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E978C20040;
	Mon,  6 May 2024 12:19:17 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.103.211])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 May 2024 12:19:17 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V2 1/9] tools/perf: Move the data structures related to register  type to header file
Date: Mon,  6 May 2024 17:48:58 +0530
Message-Id: <20240506121906.76639-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
References: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6-Dw7ekIEr2-o_7zVJBe_2swFKYLpT4A
X-Proofpoint-ORIG-GUID: 6JTIeUsf9WTB2RMy8soqVSBLRPWRaIgH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_07,2024-05-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
index 2c98813f95cd..e812dec09c99 100644
--- a/tools/perf/util/annotate-data.c
+++ b/tools/perf/util/annotate-data.c
@@ -30,15 +30,6 @@
 
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
@@ -139,49 +130,7 @@ static void pr_debug_location(Dwarf_Die *die, u64 pc, int reg)
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

