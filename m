Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EAD4DE3AC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 22:47:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKyKK33wLz3bjT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 08:47:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n2OL4IfY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=n2OL4IfY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKgqR68rrz2ynp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Mar 2022 21:53:55 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22IA9BNS026607; 
 Fri, 18 Mar 2022 10:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2ew6wRg1wjtuO6uiQny5V0EzHjASVsiq/XY8gPk0vWA=;
 b=n2OL4IfY+xFDvIgvDLtBFipG45eV7jhvV8zaeHh90HkA0WdABw94GUjip+sfBXAX7sFC
 iB1SF1ibWob4Ox+IVHOygdP6TQNiW1iOFfIi4eaTHU2q/cidnLNd3EZOv3ljjTPLbvDC
 OPwcxE1/NmJoP31aT3mF52PN285scYjxRosCmpDmQREjXj/MKypnbv1gkhGi2lcvhItu
 AwG223HJk1TaJCTmcWoU5OIJo3LJUp83fJFzivDzUjPxrJfOlj4I4tZz1ymN8M23EqRI
 0aGWSEh5JRKf3QMG0bi51pifIj4Vd0kIWNH+slJB8HnqyExdGSMnCupI/slfn8vXJ/xq NA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev04qmu1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 10:53:35 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22IAi0Ib019720;
 Fri, 18 Mar 2022 10:53:35 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev04qmu1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 10:53:35 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22IArR8D024792;
 Fri, 18 Mar 2022 10:53:32 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3erk58ubwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 10:53:32 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22IArUZc14156074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 10:53:30 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5590442047;
 Fri, 18 Mar 2022 10:53:30 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 891DA42042;
 Fri, 18 Mar 2022 10:53:27 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown
 [9.43.86.72]) by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 18 Mar 2022 10:53:27 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/3] objtool: Enable and implement 'mcount' subcommand
Date: Fri, 18 Mar 2022 16:21:39 +0530
Message-Id: <20220318105140.43914-3-sv@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220318105140.43914-1-sv@linux.ibm.com>
References: <20220318105140.43914-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3RGrmuy0K9pOsAbWcN8jqOUXdgbA1cwi
X-Proofpoint-ORIG-GUID: tEldzbnDPlSEygwEjURN2gENrvWTOj7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-18_08,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180055
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

This patch adds 'mcount' as a subcommand to objtool, and enables
the same for x86. objtool is built if CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
is selected. Additionally, architectures can select HAVE_NOP_MCOUNT
if they choose to nop out mcount call sites. If that config option is
selected, then --mnop is passed as an option to 'objtool mcount'

Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 Makefile                                |   6 ++
 arch/x86/Kconfig                        |   3 +-
 scripts/Makefile.build                  |  12 +++
 tools/objtool/Build                     |   2 +
 tools/objtool/Makefile                  |   4 +-
 tools/objtool/builtin-mcount.c          |  74 +++++++++++++
 tools/objtool/include/objtool/builtin.h |   4 +-
 tools/objtool/include/objtool/objtool.h |   1 +
 tools/objtool/mcount.c                  | 138 ++++++++++++++++++++++++
 tools/objtool/objtool.c                 |   1 +
 tools/objtool/weak.c                    |   5 +
 11 files changed, 247 insertions(+), 3 deletions(-)
 create mode 100644 tools/objtool/builtin-mcount.c
 create mode 100644 tools/objtool/mcount.c

diff --git a/Makefile b/Makefile
index 55a30ca69350..316f7d08b30a 100644
--- a/Makefile
+++ b/Makefile
@@ -846,7 +846,9 @@ ifdef CONFIG_FTRACE_MCOUNT_USE_CC
   endif
 endif
 ifdef CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
+ ifdef CONFIG_HAVE_NOP_MCOUNT
   CC_FLAGS_USING	+= -DCC_USING_NOP_MCOUNT
+ endif
 endif
 ifdef CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
   ifdef CONFIG_HAVE_C_RECORDMCOUNT
@@ -1303,6 +1305,10 @@ ifdef CONFIG_STACK_VALIDATION
 prepare: tools/objtool
 endif
 
+ifdef CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
+prepare: tools/objtool
+endif
+
 ifdef CONFIG_BPF
 ifdef CONFIG_DEBUG_INFO_BTF
 prepare: tools/bpf/resolve_btfids
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 9f5bd41bf660..eecfe588cd9f 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -185,7 +185,8 @@ config X86
 	select HAVE_CONTEXT_TRACKING		if X86_64
 	select HAVE_CONTEXT_TRACKING_OFFSTACK	if HAVE_CONTEXT_TRACKING
 	select HAVE_C_RECORDMCOUNT
-	select HAVE_OBJTOOL_MCOUNT		if STACK_VALIDATION
+	select HAVE_OBJTOOL_MCOUNT
+	select HAVE_NOP_MCOUNT			if HAVE_OBJTOOL_MCOUNT
 	select HAVE_BUILDTIME_MCOUNT_SORT
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index a4b89b757287..6a09b4ba14a1 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -242,6 +242,18 @@ cmd_gen_objtooldep = $(if $(objtool-enabled), { echo ; echo '$@: $$(wildcard $(o
 
 endif # CONFIG_STACK_VALIDATION
 
+ifdef CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
+
+objtool := $(objtree)/tools/objtool/objtool
+
+objtool_args := mcount
+objtool_args += $(if $(CONFIG_HAVE_NOP_MCOUNT), --mnop)
+
+cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool_args) $@)
+cmd_gen_objtooldep = $(if $(objtool-enabled), { echo ; echo '$@: $$(wildcard $(objtool))' ; } >> $(dot-target).cmd)
+
+endif # CONFIG_FTRACE_MCOUNT_USE_OBJTOOL
+
 ifdef CONFIG_LTO_CLANG
 
 # Skip objtool for LLVM bitcode
diff --git a/tools/objtool/Build b/tools/objtool/Build
index 161fd451241a..0b9b8bd0ee92 100644
--- a/tools/objtool/Build
+++ b/tools/objtool/Build
@@ -2,12 +2,14 @@ objtool-y += arch/$(SRCARCH)/
 
 objtool-y += weak.o
 
+objtool-$(SUBCMD_MCOUNT) += mcount.o
 objtool-$(SUBCMD_CHECK) += check.o
 objtool-$(SUBCMD_CHECK) += special.o
 objtool-$(SUBCMD_ORC) += check.o
 objtool-$(SUBCMD_ORC) += orc_gen.o
 objtool-$(SUBCMD_ORC) += orc_dump.o
 
+objtool-y += builtin-mcount.o
 objtool-y += builtin-check.o
 objtool-y += builtin-orc.o
 objtool-y += elf.o
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 92ce4fce7bc7..8404cf696954 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -41,13 +41,15 @@ AWK = awk
 
 SUBCMD_CHECK := n
 SUBCMD_ORC := n
+SUBCMD_MCOUNT := n
 
 ifeq ($(SRCARCH),x86)
 	SUBCMD_CHECK := y
 	SUBCMD_ORC := y
+	SUBCMD_MCOUNT := y
 endif
 
-export SUBCMD_CHECK SUBCMD_ORC
+export SUBCMD_CHECK SUBCMD_ORC SUBCMD_MCOUNT
 export srctree OUTPUT CFLAGS SRCARCH AWK
 include $(srctree)/tools/build/Makefile.include
 
diff --git a/tools/objtool/builtin-mcount.c b/tools/objtool/builtin-mcount.c
new file mode 100644
index 000000000000..f203d118cffa
--- /dev/null
+++ b/tools/objtool/builtin-mcount.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <subcmd/parse-options.h>
+#include <string.h>
+#include <stdlib.h>
+#include <objtool/builtin.h>
+#include <objtool/objtool.h>
+
+bool mnop;
+
+static const char * const mcount_usage[] = {
+	"objtool mcount [<options>] file.o",
+	NULL,
+};
+
+static const char * const env_usage[] = {
+	"OBJTOOL_ARGS=\"<options>\"",
+	NULL,
+};
+
+const struct option mcount_options[] = {
+	OPT_BOOLEAN('N', "mnop", &mnop, "nop mcount call sites"),
+	OPT_END(),
+};
+
+int cmd_parse_options_mcount(int argc, const char **argv, const char * const usage[])
+{
+	const char *envv[16] = { };
+	char *env;
+	int envc;
+
+	env = getenv("OBJTOOL_ARGS");
+	if (env) {
+		envv[0] = "OBJTOOL_ARGS";
+		for (envc = 1; envc < ARRAY_SIZE(envv); ) {
+			envv[envc++] = env;
+			env = strchr(env, ' ');
+			if (!env)
+				break;
+			*env = '\0';
+			env++;
+		}
+
+		parse_options(envc, envv, mcount_options, env_usage, 0);
+	}
+
+	argc = parse_options(argc, argv, mcount_options, usage, 0);
+	if (argc != 1)
+		usage_with_options(usage, mcount_options);
+	return argc;
+}
+
+int cmd_mcount(int argc, const char **argv)
+{
+	const char *objname;
+	struct objtool_file *file;
+	int ret;
+
+	argc = cmd_parse_options_mcount(argc, argv, mcount_usage);
+	objname = argv[0];
+
+	file = objtool_open_read(objname);
+	if (!file)
+		return 1;
+
+	ret = objtool_mcount(file);
+	if (ret)
+		return ret;
+
+	if (file->elf->changed)
+		return elf_write(file->elf);
+
+	return 0;
+}
diff --git a/tools/objtool/include/objtool/builtin.h b/tools/objtool/include/objtool/builtin.h
index 89ba869ed08f..d7ed6ff65729 100644
--- a/tools/objtool/include/objtool/builtin.h
+++ b/tools/objtool/include/objtool/builtin.h
@@ -9,11 +9,13 @@
 
 extern const struct option check_options[];
 extern bool no_fp, no_unreachable, retpoline, module, backtrace, uaccess, stats,
-            validate_dup, vmlinux, mcount, noinstr, backup, sls;
+	    validate_dup, vmlinux, mcount, noinstr, backup, sls, mnop;
 
 extern int cmd_parse_options(int argc, const char **argv, const char * const usage[]);
+extern int cmd_parse_options_mcount(int argc, const char **argv, const char * const usage[]);
 
 extern int cmd_check(int argc, const char **argv);
 extern int cmd_orc(int argc, const char **argv);
+extern int cmd_mcount(int argc, const char **argv);
 
 #endif /* _BUILTIN_H */
diff --git a/tools/objtool/include/objtool/objtool.h b/tools/objtool/include/objtool/objtool.h
index f99fbc6078d5..edcf28d4407c 100644
--- a/tools/objtool/include/objtool/objtool.h
+++ b/tools/objtool/include/objtool/objtool.h
@@ -41,5 +41,6 @@ void objtool_pv_add(struct objtool_file *file, int idx, struct symbol *func);
 int check(struct objtool_file *file);
 int orc_dump(const char *objname);
 int orc_create(struct objtool_file *file);
+int objtool_mcount(struct objtool_file *file);
 
 #endif /* _OBJTOOL_H */
diff --git a/tools/objtool/mcount.c b/tools/objtool/mcount.c
new file mode 100644
index 000000000000..fc3d215671bf
--- /dev/null
+++ b/tools/objtool/mcount.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <string.h>
+#include <stdlib.h>
+#include <sys/mman.h>
+
+#include <arch/elf.h>
+#include <objtool/builtin.h>
+#include <objtool/cfi.h>
+#include <objtool/arch.h>
+#include <objtool/check.h>
+#include <objtool/utils.h>
+#include <objtool/special.h>
+#include <objtool/warn.h>
+
+#include <linux/objtool.h>
+#include <linux/hashtable.h>
+#include <linux/kernel.h>
+#include <linux/static_call_types.h>
+
+static int classify_symbols(struct objtool_file *file)
+{
+	struct section *sec;
+	struct symbol *func;
+
+	for_each_sec(file, sec) {
+		list_for_each_entry(func, &sec->symbol_list, list) {
+			if (func->bind != STB_GLOBAL)
+				continue;
+			if ((!strcmp(func->name, "__fentry__")) || (!strcmp(func->name, "_mcount")))
+				func->fentry = true;
+		}
+	}
+
+	return 0;
+}
+
+static void annotate_call_site(struct objtool_file *file,
+							   struct instruction *insn, bool sibling)
+{
+	struct reloc *reloc = insn_reloc(file, insn);
+	struct symbol *sym = insn->call_dest;
+
+	if (!sym)
+		sym = reloc->sym;
+
+	if (sym->fentry) {
+		if (sibling)
+			WARN_FUNC("Tail call to _mcount !?!?", insn->sec, insn->offset);
+		if (mnop) {
+			if (reloc) {
+				reloc->type = R_NONE;
+				elf_write_reloc(file->elf, reloc);
+			}
+			elf_write_insn(file->elf, insn->sec,
+				       insn->offset, insn->len,
+				       arch_nop_insn(insn->len));
+
+			insn->type = INSN_NOP;
+		}
+
+		list_add_tail(&insn->call_node, &file->mcount_loc_list);
+		return;
+	}
+}
+
+static void add_call_dest(struct objtool_file *file, struct instruction *insn,
+						  struct symbol *dest, bool sibling)
+{
+	insn->call_dest = dest;
+	if (!dest)
+		return;
+
+	remove_insn_ops(insn);
+
+	annotate_call_site(file, insn, sibling);
+}
+static int add_call_destinations(struct objtool_file *file)
+{
+	struct instruction *insn;
+	unsigned long dest_off;
+	struct symbol *dest;
+	struct reloc *reloc;
+
+	for_each_insn(file, insn) {
+		if (insn->type != INSN_CALL)
+			continue;
+
+		reloc = insn_reloc(file, insn);
+		if (!reloc) {
+			dest_off = arch_jump_destination(insn);
+			dest = find_call_destination(insn->sec, dest_off);
+
+			add_call_dest(file, insn, dest, false);
+
+
+		} else {
+			add_call_dest(file, insn, reloc->sym, false);
+		}
+	}
+
+	return 0;
+}
+
+static int decode_sections(struct objtool_file *file)
+{
+	int ret;
+
+	ret = decode_instructions(file);
+	if (ret)
+		return ret;
+
+	ret = classify_symbols(file);
+	if (ret)
+		return ret;
+
+	ret = add_call_destinations(file);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+
+int objtool_mcount(struct objtool_file *file)
+{
+	int ret, warnings = 0;
+
+	ret = decode_sections(file);
+	if (ret < 0)
+		return 0;
+
+	ret = create_mcount_loc_sections(file);
+	if (ret < 0)
+		return 0;
+	warnings += ret;
+	return 0;
+}
diff --git a/tools/objtool/objtool.c b/tools/objtool/objtool.c
index bdf699f6552b..e19851813d5b 100644
--- a/tools/objtool/objtool.c
+++ b/tools/objtool/objtool.c
@@ -37,6 +37,7 @@ static const char objtool_usage_string[] =
 
 static struct cmd_struct objtool_cmds[] = {
 	{"check",	cmd_check,	"Perform stack metadata validation on an object file" },
+	{"mcount",      cmd_mcount,    "Generate __mcount_loc section" },
 	{"orc",		cmd_orc,	"Generate in-place ORC unwind tables for an object file" },
 };
 
diff --git a/tools/objtool/weak.c b/tools/objtool/weak.c
index 8314e824db4a..19b2dfcacf2e 100644
--- a/tools/objtool/weak.c
+++ b/tools/objtool/weak.c
@@ -29,3 +29,8 @@ int __weak orc_create(struct objtool_file *file)
 {
 	UNSUPPORTED("orc");
 }
+
+int __weak objtool_mcount(struct objtool_file *file)
+{
+	UNSUPPORTED("mcount subcommand");
+}
-- 
2.31.1

