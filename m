Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 539064DE3AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 22:46:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKyJX22wlz3bXL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 08:46:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OXQd9p66;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OXQd9p66; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKgqQ6tlLz2ynp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Mar 2022 21:53:54 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22I7vjir011346; 
 Fri, 18 Mar 2022 10:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1dxESL4wrWhiNiFzfmUFeh1MGvu9VOj/ATKHLuRWj7s=;
 b=OXQd9p66lTsez6l02+Ds20iaUihnIbI15MLXxprpeprpJrklKSanzryKs+R46Fn6qUij
 gGnL9AO8dIqa8RaElvnDmEappCeyPDrZn5NFOtDSpO+RerfagfXE0euRn/b5c8nBsu23
 kuOlBDblfW5Iss2J7Z/fCjXIDj1DvQyMuQhNSLIsRf4D076bNjzb/ZX/0VKqzCTbxsuH
 KkSQo+iXtb9gNrAMAuCRt7IfCTHLhTM6hojjK+b0a+7SuT5LY4mK6kMnwHOxCceZDk3j
 UH27YR6rU4K/yYw6bTvbn8ObW1hD3rl3V2chH9MDJwERoAL7Q4M2jXqiyfU21yXYrQym 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev2s51p5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 10:53:31 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22IAqtK8017577;
 Fri, 18 Mar 2022 10:53:31 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev2s51p5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 10:53:31 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22IArRmZ026929;
 Fri, 18 Mar 2022 10:53:28 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3erk595b2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 10:53:28 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22IArQ8j19726780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 10:53:26 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EC2C42047;
 Fri, 18 Mar 2022 10:53:26 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7655E4203F;
 Fri, 18 Mar 2022 10:53:23 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown
 [9.43.86.72]) by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 18 Mar 2022 10:53:23 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/3] objtool: Move common code to utils.c
Date: Fri, 18 Mar 2022 16:21:38 +0530
Message-Id: <20220318105140.43914-2-sv@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220318105140.43914-1-sv@linux.ibm.com>
References: <20220318105140.43914-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 28vsj1gaIiAWR3ol53GRSKjETyNUnhZe
X-Proofpoint-GUID: 8aqvLo5e6oisQn81p_U3MNdYm4m88s_g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-18_08,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180058
X-Mailman-Approved-At: Sat, 19 Mar 2022 08:45:00 +1100
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
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 aik@ozlabs.ru, sv@linux.ibm.com, jpoimboe@redhat.com,
 naveen.n.rao@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch moves common code to utils.c file. Code from this file will
be reused across check.c and mcount.c (will be introduced in the coming
patches). Also, ensure that this change works well with existing
commands.

Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 tools/objtool/Build                   |   1 +
 tools/objtool/check.c                 | 178 +-----------------------
 tools/objtool/include/objtool/check.h |   2 -
 tools/objtool/include/objtool/utils.h |  28 ++++
 tools/objtool/orc_gen.c               |   1 +
 tools/objtool/utils.c                 | 192 ++++++++++++++++++++++++++
 6 files changed, 223 insertions(+), 179 deletions(-)
 create mode 100644 tools/objtool/include/objtool/utils.h
 create mode 100644 tools/objtool/utils.c

diff --git a/tools/objtool/Build b/tools/objtool/Build
index b7222d5cc7bc..161fd451241a 100644
--- a/tools/objtool/Build
+++ b/tools/objtool/Build
@@ -12,6 +12,7 @@ objtool-y += builtin-check.o
 objtool-y += builtin-orc.o
 objtool-y += elf.o
 objtool-y += objtool.o
+objtool-y += utils.o
 
 objtool-y += libstring.o
 objtool-y += libctype.o
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 7c33ec67c4a9..161dd181d9d4 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -12,6 +12,7 @@
 #include <objtool/cfi.h>
 #include <objtool/arch.h>
 #include <objtool/check.h>
+#include <objtool/utils.h>
 #include <objtool/special.h>
 #include <objtool/warn.h>
 #include <objtool/endianness.h>
@@ -33,19 +34,6 @@ static struct cfi_init_state initial_func_cfi;
 static struct cfi_state init_cfi;
 static struct cfi_state func_cfi;
 
-struct instruction *find_insn(struct objtool_file *file,
-			      struct section *sec, unsigned long offset)
-{
-	struct instruction *insn;
-
-	hash_for_each_possible(file->insn_hash, insn, hash, sec_offset_hash(sec, offset)) {
-		if (insn->sec == sec && insn->offset == offset)
-			return insn;
-	}
-
-	return NULL;
-}
-
 static struct instruction *next_insn_same_sec(struct objtool_file *file,
 					      struct instruction *insn)
 {
@@ -342,86 +330,8 @@ static void *cfi_hash_alloc(unsigned long size)
 	return cfi_hash;
 }
 
-static unsigned long nr_insns;
 static unsigned long nr_insns_visited;
 
-/*
- * Call the arch-specific instruction decoder for all the instructions and add
- * them to the global instruction list.
- */
-static int decode_instructions(struct objtool_file *file)
-{
-	struct section *sec;
-	struct symbol *func;
-	unsigned long offset;
-	struct instruction *insn;
-	int ret;
-
-	for_each_sec(file, sec) {
-
-		if (!(sec->sh.sh_flags & SHF_EXECINSTR))
-			continue;
-
-		if (strcmp(sec->name, ".altinstr_replacement") &&
-		    strcmp(sec->name, ".altinstr_aux") &&
-		    strncmp(sec->name, ".discard.", 9))
-			sec->text = true;
-
-		if (!strcmp(sec->name, ".noinstr.text") ||
-		    !strcmp(sec->name, ".entry.text"))
-			sec->noinstr = true;
-
-		for (offset = 0; offset < sec->sh.sh_size; offset += insn->len) {
-			insn = malloc(sizeof(*insn));
-			if (!insn) {
-				WARN("malloc failed");
-				return -1;
-			}
-			memset(insn, 0, sizeof(*insn));
-			INIT_LIST_HEAD(&insn->alts);
-			INIT_LIST_HEAD(&insn->stack_ops);
-
-			insn->sec = sec;
-			insn->offset = offset;
-
-			ret = arch_decode_instruction(file, sec, offset,
-						      sec->sh.sh_size - offset,
-						      &insn->len, &insn->type,
-						      &insn->immediate,
-						      &insn->stack_ops);
-			if (ret)
-				goto err;
-
-			hash_add(file->insn_hash, &insn->hash, sec_offset_hash(sec, insn->offset));
-			list_add_tail(&insn->list, &file->insn_list);
-			nr_insns++;
-		}
-
-		list_for_each_entry(func, &sec->symbol_list, list) {
-			if (func->type != STT_FUNC || func->alias != func)
-				continue;
-
-			if (!find_insn(file, sec, func->offset)) {
-				WARN("%s(): can't find starting instruction",
-				     func->name);
-				return -1;
-			}
-
-			sym_for_each_insn(file, func, insn)
-				insn->func = func;
-		}
-	}
-
-	if (stats)
-		printf("nr_insns: %lu\n", nr_insns);
-
-	return 0;
-
-err:
-	free(insn);
-	return ret;
-}
-
 /*
  * Read the pv_ops[] .data table to find the static initialized values.
  */
@@ -731,49 +641,6 @@ static int create_retpoline_sites_sections(struct objtool_file *file)
 	return 0;
 }
 
-static int create_mcount_loc_sections(struct objtool_file *file)
-{
-	struct section *sec;
-	unsigned long *loc;
-	struct instruction *insn;
-	int idx;
-
-	sec = find_section_by_name(file->elf, "__mcount_loc");
-	if (sec) {
-		INIT_LIST_HEAD(&file->mcount_loc_list);
-		WARN("file already has __mcount_loc section, skipping");
-		return 0;
-	}
-
-	if (list_empty(&file->mcount_loc_list))
-		return 0;
-
-	idx = 0;
-	list_for_each_entry(insn, &file->mcount_loc_list, call_node)
-		idx++;
-
-	sec = elf_create_section(file->elf, "__mcount_loc", 0, sizeof(unsigned long), idx);
-	if (!sec)
-		return -1;
-
-	idx = 0;
-	list_for_each_entry(insn, &file->mcount_loc_list, call_node) {
-
-		loc = (unsigned long *)sec->data->d_buf + idx;
-		memset(loc, 0, sizeof(unsigned long));
-
-		if (elf_add_reloc_to_insn(file->elf, sec,
-					  idx * sizeof(unsigned long),
-					  R_X86_64_64,
-					  insn->sec, insn->offset))
-			return -1;
-
-		idx++;
-	}
-
-	return 0;
-}
-
 /*
  * Warnings shouldn't be reported for ignored functions.
  */
@@ -1013,38 +880,6 @@ __weak bool arch_is_retpoline(struct symbol *sym)
 	return false;
 }
 
-#define NEGATIVE_RELOC	((void *)-1L)
-
-static struct reloc *insn_reloc(struct objtool_file *file, struct instruction *insn)
-{
-	if (insn->reloc == NEGATIVE_RELOC)
-		return NULL;
-
-	if (!insn->reloc) {
-		if (!file)
-			return NULL;
-
-		insn->reloc = find_reloc_by_dest_range(file->elf, insn->sec,
-						       insn->offset, insn->len);
-		if (!insn->reloc) {
-			insn->reloc = NEGATIVE_RELOC;
-			return NULL;
-		}
-	}
-
-	return insn->reloc;
-}
-
-static void remove_insn_ops(struct instruction *insn)
-{
-	struct stack_op *op, *tmp;
-
-	list_for_each_entry_safe(op, tmp, &insn->stack_ops, list) {
-		list_del(&op->list);
-		free(op);
-	}
-}
-
 static void annotate_call_site(struct objtool_file *file,
 			       struct instruction *insn, bool sibling)
 {
@@ -1256,17 +1091,6 @@ static int add_jump_destinations(struct objtool_file *file)
 	return 0;
 }
 
-static struct symbol *find_call_destination(struct section *sec, unsigned long offset)
-{
-	struct symbol *call_dest;
-
-	call_dest = find_func_by_offset(sec, offset);
-	if (!call_dest)
-		call_dest = find_symbol_by_offset(sec, offset);
-
-	return call_dest;
-}
-
 /*
  * Find the destination instructions for all calls.
  */
diff --git a/tools/objtool/include/objtool/check.h b/tools/objtool/include/objtool/check.h
index 6cfff078897f..d4e378c7aa30 100644
--- a/tools/objtool/include/objtool/check.h
+++ b/tools/objtool/include/objtool/check.h
@@ -79,8 +79,6 @@ static inline bool is_jump(struct instruction *insn)
 	return is_static_jump(insn) || is_dynamic_jump(insn);
 }
 
-struct instruction *find_insn(struct objtool_file *file,
-			      struct section *sec, unsigned long offset);
 
 #define for_each_insn(file, insn)					\
 	list_for_each_entry(insn, &file->insn_list, list)
diff --git a/tools/objtool/include/objtool/utils.h b/tools/objtool/include/objtool/utils.h
new file mode 100644
index 000000000000..f808a66dd0a8
--- /dev/null
+++ b/tools/objtool/include/objtool/utils.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2017 Josh Poimboeuf <jpoimboe@redhat.com>
+ */
+
+#ifndef UTILS_H
+#define UTILS_H
+
+#include <stdbool.h>
+#include <objtool/cfi.h>
+#include <objtool/arch.h>
+
+int decode_instructions(struct objtool_file *file);
+struct reloc *insn_reloc(struct objtool_file *file, struct instruction *insn);
+void remove_insn_ops(struct instruction *insn);
+struct symbol *find_call_destination(struct section *sec, unsigned long offset);
+int create_mcount_loc_sections(struct objtool_file *file);
+struct instruction *find_insn(struct objtool_file *file,
+			      struct section *sec, unsigned long offset);
+
+#define sym_for_each_insn(file, sym, insn)                              \
+	for (insn = find_insn(file, sym->sec, sym->offset);             \
+	     insn && &insn->list != &file->insn_list &&                 \
+		insn->sec == sym->sec &&                                \
+		insn->offset < sym->offset + sym->len;                  \
+	     insn = list_next_entry(insn, list))
+
+#endif /* UTILS_H */
diff --git a/tools/objtool/orc_gen.c b/tools/objtool/orc_gen.c
index dd3c64af9db2..383c5f2f0658 100644
--- a/tools/objtool/orc_gen.c
+++ b/tools/objtool/orc_gen.c
@@ -10,6 +10,7 @@
 #include <asm/orc_types.h>
 
 #include <objtool/check.h>
+#include <objtool/utils.h>
 #include <objtool/warn.h>
 #include <objtool/endianness.h>
 
diff --git a/tools/objtool/utils.c b/tools/objtool/utils.c
new file mode 100644
index 000000000000..d1fc6a123a6e
--- /dev/null
+++ b/tools/objtool/utils.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2017 Josh Poimboeuf <jpoimboe@redhat.com>
+ */
+
+#include <string.h>
+#include <stdlib.h>
+#include <sys/mman.h>
+
+#include <objtool/builtin.h>
+#include <objtool/check.h>
+#include <objtool/utils.h>
+#include <objtool/warn.h>
+
+#include <linux/objtool.h>
+#include <linux/hashtable.h>
+#include <linux/kernel.h>
+#include <linux/static_call_types.h>
+
+struct instruction *find_insn(struct objtool_file *file,
+			      struct section *sec, unsigned long offset)
+{
+	struct instruction *insn;
+
+	hash_for_each_possible(file->insn_hash, insn, hash, sec_offset_hash(sec, offset)) {
+		if (insn->sec == sec && insn->offset == offset)
+			return insn;
+	}
+
+	return NULL;
+}
+
+#define NEGATIVE_RELOC  ((void *)-1L)
+
+struct reloc *insn_reloc(struct objtool_file *file, struct instruction *insn)
+{
+	if (insn->reloc == NEGATIVE_RELOC)
+		return NULL;
+
+	if (!insn->reloc) {
+		if (!file)
+			return NULL;
+
+		insn->reloc = find_reloc_by_dest_range(file->elf, insn->sec,
+						       insn->offset, insn->len);
+		if (!insn->reloc) {
+			insn->reloc = NEGATIVE_RELOC;
+			return NULL;
+		}
+	}
+
+	return insn->reloc;
+}
+void remove_insn_ops(struct instruction *insn)
+{
+	struct stack_op *op, *tmp;
+
+	list_for_each_entry_safe(op, tmp, &insn->stack_ops, list) {
+		list_del(&op->list);
+		free(op);
+	}
+}
+
+
+struct symbol *find_call_destination(struct section *sec, unsigned long offset)
+{
+	struct symbol *call_dest;
+
+	call_dest = find_func_by_offset(sec, offset);
+	if (!call_dest)
+		call_dest = find_symbol_by_offset(sec, offset);
+
+	return call_dest;
+}
+
+static unsigned long nr_insns;
+
+int decode_instructions(struct objtool_file *file)
+{
+	struct section *sec;
+	struct symbol *func;
+	unsigned long offset;
+	struct instruction *insn;
+	int ret;
+
+	for_each_sec(file, sec) {
+
+		if (!(sec->sh.sh_flags & SHF_EXECINSTR))
+			continue;
+
+		if (strcmp(sec->name, ".altinstr_replacement") &&
+		    strcmp(sec->name, ".altinstr_aux") &&
+		    strncmp(sec->name, ".discard.", 9))
+			sec->text = true;
+
+		if (!strcmp(sec->name, ".noinstr.text") ||
+		    !strcmp(sec->name, ".entry.text"))
+			sec->noinstr = true;
+
+		for (offset = 0; offset < sec->sh.sh_size; offset += insn->len) {
+			insn = malloc(sizeof(*insn));
+			if (!insn) {
+				WARN("malloc failed");
+				return -1;
+			}
+			memset(insn, 0, sizeof(*insn));
+			INIT_LIST_HEAD(&insn->alts);
+			INIT_LIST_HEAD(&insn->stack_ops);
+
+			insn->sec = sec;
+			insn->offset = offset;
+
+			ret = arch_decode_instruction(file, sec, offset,
+						      sec->sh.sh_size - offset,
+						      &insn->len, &insn->type,
+						      &insn->immediate,
+						      &insn->stack_ops);
+			if (ret)
+				goto err;
+
+			hash_add(file->insn_hash, &insn->hash, sec_offset_hash(sec, insn->offset));
+			list_add_tail(&insn->list, &file->insn_list);
+			nr_insns++;
+		}
+
+		list_for_each_entry(func, &sec->symbol_list, list) {
+			if (func->type != STT_FUNC || func->alias != func)
+				continue;
+
+			if (!find_insn(file, sec, func->offset)) {
+				WARN("%s(): can't find starting instruction",
+				     func->name);
+				return -1;
+			}
+
+			sym_for_each_insn(file, func, insn)
+				insn->func = func;
+		}
+	}
+
+	if (stats)
+		printf("nr_insns: %lu\n", nr_insns);
+
+	return 0;
+
+err:
+	free(insn);
+	return ret;
+}
+
+int create_mcount_loc_sections(struct objtool_file *file)
+{
+	struct section *sec;
+	unsigned long *loc;
+	struct instruction *insn;
+	int idx;
+
+	sec = find_section_by_name(file->elf, "__mcount_loc");
+	if (sec) {
+		INIT_LIST_HEAD(&file->mcount_loc_list);
+		WARN("file already has __mcount_loc section, skipping");
+		return 0;
+	}
+
+	if (list_empty(&file->mcount_loc_list))
+		return 0;
+
+	idx = 0;
+	list_for_each_entry(insn, &file->mcount_loc_list, call_node)
+		idx++;
+
+	sec = elf_create_section(file->elf, "__mcount_loc", 0, sizeof(unsigned long), idx);
+	if (!sec)
+		return -1;
+
+	idx = 0;
+	list_for_each_entry(insn, &file->mcount_loc_list, call_node) {
+
+		loc = (unsigned long *)sec->data->d_buf + idx;
+		memset(loc, 0, sizeof(unsigned long));
+
+		if (elf_add_reloc_to_insn(file->elf, sec,
+					  idx * sizeof(unsigned long),
+					  R_X86_64_64,
+					  insn->sec, insn->offset))
+			return -1;
+
+		idx++;
+	}
+
+	return 0;
+}
-- 
2.31.1

