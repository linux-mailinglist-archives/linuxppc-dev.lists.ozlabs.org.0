Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A795A9C409
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Aug 2019 15:39:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46GbpQ03RWzDqk7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Aug 2019 23:39:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=changbin.du@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="P2wojTKq"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GbSk3RbKzDqcg
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2019 23:24:06 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id u17so8739875pgi.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2019 06:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yFcwaE5XZgy8/JWul+9dMsDxHhsAe+rq+bNw4aia6aI=;
 b=P2wojTKqpcCoKKB15v009tP4jbbqDqoRSEYiqz7FPwBhWB5iibTOdDi5mVtT68je99
 wVzdcQqFhRNv8QKi21WWDTGIKS/SEmW1RHEoflINUYDkG88SrGWYEHwUIKDhADJaue6U
 ZHRjs76+u9Cx45pVEMopRjTpxExNjGX1xsCAjJ9HPpxpKKwOZNBFe2c3q6ghFxTJpOCY
 nGdKlWjpcE8DbZuCfA0MI3Hs2QrrqBNEsqMzzJ5cTYCqDE4mShA8PwXNb7y/siDYAlWc
 BZEW1BkB6Zl4YlxFzgPsNGhOKcBUfFUFcIoWTdhiIYzjV6xh4CyXnyrbHJrIS3P0rRyG
 UZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yFcwaE5XZgy8/JWul+9dMsDxHhsAe+rq+bNw4aia6aI=;
 b=QrQhRheul6/LiorlxWs67ICBFTDqS9ugFCer/HFgklsW2ZOxEOm/XGGjrJLkRCQyK/
 x/FR5m/7C6M6HUwBvqMpeT1WQ80qgXhYky3bLbHZ7fE256Ah9AEmBUNnuWdhz4ET+b16
 MUFo3VZOZ0AAZH9W9EhXnjknTpngzDgSY7pLhzdeSrftLwBYP9PanQmlMHO6T7EwraXC
 mi1dQ0uLAnN82yXWeFNEbExKAgPRhUz5WPEa7JYwCtEg1Izu4xEiOIQBN5PIi9DJtwdt
 Dq76LERM6sKw6Eh4GDScMqkIGHn9tucnpDR8up20O6ivetoWA/nxkUKwRROrDxOtA36R
 qwhA==
X-Gm-Message-State: APjAAAX8DyBE5fW+xipdac7ch4X7H7YnOm3Hjn5Ssptzwo5dgy/wW8s9
 kAz1d37NZtFiRPhEypbdzK4=
X-Google-Smtp-Source: APXvYqxRTC1ZCIou+O1ieQ8X4jZyYLi3Uuk65dRZrbyaBzYBL/qQqrtlREWLEIUs6943U+8msaNzDg==
X-Received: by 2002:a17:90a:bc06:: with SMTP id
 w6mr15457363pjr.130.1566739444052; 
 Sun, 25 Aug 2019 06:24:04 -0700 (PDT)
Received: from localhost.localdomain ([149.28.153.17])
 by smtp.gmail.com with ESMTPSA id y23sm11076562pfr.86.2019.08.25.06.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Aug 2019 06:24:02 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Subject: [PATCH 02/11] ftrace: introduce new building tool funcprototype
Date: Sun, 25 Aug 2019 21:23:21 +0800
Message-Id: <20190825132330.5015-3-changbin.du@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190825132330.5015-1-changbin.du@gmail.com>
References: <20190825132330.5015-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-parisc@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, sparclinux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Changbin Du <changbin.du@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a new ftrace tool to implement CONFIG_FTRACE_FUNC_PROTOTYPE
feature which allow ftrace record function parameters and return value
(see later patches).

Essentially funcprototype extracts only necessary information from
the DWARF debug sections in the ELF object file, including function
return type, parameter names and parameter data types. Then they will
be built into the original ELF object.

Here is an example for function memremap() in kernel/iomem.o. The
declaration is:
void *memremap(resource_size_t offset, size_t size, unsigned long flags)

The output of funcprototype tool is:
	.section __funcprotostr, "a"
.P_memremap_0:
	.string "offset"
.P_memremap_1:
	.string "size"
.P_memremap_2:
	.string "flags"

	.section __funcproto,  "a"
	.quad memremap
	.byte 0x8
	.byte 0x3
	.quad .P_memremap_0
	.byte 0x8
	.byte 0x55
	.byte 0x0
	.quad .P_memremap_1
	.byte 0x8
	.byte 0x54
	.byte 0x0
	.quad .P_memremap_2
	.byte 0x8
	.byte 0x51
	.byte 0x0

The strings are placed in '__funcprotostr' section, and prototype
information is placed in '__funcproto' section. It equals to below
C struct:

struct func_param {
       char *name;
       uint8_t type;
       uint8_t loc[2];
} __packed;

struct func_prototype {
       unsigned long ip;
       uint8_t ret_type;
       uint8_t nr_param;
       struct func_param params[0];
} __packed;

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 kernel/trace/Kconfig           |  19 ++
 scripts/Makefile.build         |  18 +-
 scripts/ftrace/.gitignore      |   2 +
 scripts/ftrace/Makefile        |   7 +-
 scripts/ftrace/funcprototype.c | 576 +++++++++++++++++++++++++++++++++
 5 files changed, 620 insertions(+), 2 deletions(-)
 create mode 100644 scripts/ftrace/funcprototype.c

diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 98da8998c25c..20d1b0ae114d 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -38,6 +38,9 @@ config HAVE_FTRACE_MCOUNT_RECORD
 	help
 	  See Documentation/trace/ftrace-design.rst
 
+config HAVE_FTRACE_FUNC_PROTOTYPE
+	bool
+
 config HAVE_SYSCALL_TRACEPOINTS
 	bool
 	help
@@ -170,6 +173,22 @@ config FUNCTION_GRAPH_TRACER
 	  the return value. This is done by setting the current return
 	  address on the current task structure into a stack of calls.
 
+config FTRACE_FUNC_PROTOTYPE
+	bool "Support recording function parameters and return value"
+	default n
+	depends on DYNAMIC_FTRACE
+	depends on HAVE_FTRACE_FUNC_PROTOTYPE
+	depends on FUNCTION_GRAPH_TRACER
+	help
+	  Enable the Function Graph Tracer to record function parameters and
+	  return value. It can be dynamically enabled/disabled by the
+	  'record-funcproto' trace option.
+
+	  By enabling this, function prototype information is built into
+	  kernel. And the kernel size will increase by approximately 2%.
+
+	  Say N if unsure.
+
 config TRACE_PREEMPT_TOGGLE
 	bool
 	help
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 67558983c518..d56850808d96 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -206,6 +206,21 @@ cmd_record_mcount = $(if $(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags)),
 endif # CC_USING_RECORD_MCOUNT
 endif # CONFIG_FTRACE_MCOUNT_RECORD
 
+ifdef CONFIG_FTRACE_FUNC_PROTOTYPE
+sub_cmd_funcprototype =							\
+	$(srctree)/scripts/ftrace/funcprototype "$(@)" |		\
+		$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -c		\
+		-o $(@D)/.tmp_$(@F:.o=.funcprototype) -x assembler -;	\
+	$(LD) $(ld_flags) -r -o $(@D)/.tmp_$(@F) $@ $(@D)/.tmp_$(@F:.o=.funcprototype); \
+	mv -f $(@D)/.tmp_$(@F) $@;					\
+	rm -f $(@D)/.tmp_$(@F:.o=.funcprototype);
+cmd_funcprototype = \
+	if $(OBJDUMP) -h $@ | grep -q __mcount_loc; then		\
+		$(sub_cmd_funcprototype)				\
+	fi
+funcprototype_source := $(srctree)/scripts/ftrace/funcprototype.c
+endif # CONFIG_FTRACE_FUNC_PROTOTYPE
+
 ifdef CONFIG_STACK_VALIDATION
 ifneq ($(SKIP_STACK_VALIDATION),1)
 
@@ -259,6 +274,7 @@ define rule_cc_o_c
 	$(call cmd,objtool)
 	$(call cmd,modversions_c)
 	$(call cmd,record_mcount)
+	$(call cmd,funcprototype)
 endef
 
 define rule_as_o_S
@@ -276,7 +292,7 @@ cmd_undef_syms = echo
 endif
 
 # Built-in and composite module parts
-$(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
+$(obj)/%.o: $(src)/%.c $(recordmcount_source) $(funcprototype_source) $(objtool_dep) FORCE
 	$(call cmd,force_checksrc)
 	$(call if_changed_rule,cc_o_c)
 
diff --git a/scripts/ftrace/.gitignore b/scripts/ftrace/.gitignore
index 54d582c8faad..92aa4f335656 100644
--- a/scripts/ftrace/.gitignore
+++ b/scripts/ftrace/.gitignore
@@ -2,3 +2,5 @@
 # Generated files
 #
 recordmcount
+funcprototype
+
diff --git a/scripts/ftrace/Makefile b/scripts/ftrace/Makefile
index 6797e51473e5..c44d131b075c 100644
--- a/scripts/ftrace/Makefile
+++ b/scripts/ftrace/Makefile
@@ -1,4 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
-hostprogs-$(BUILD_C_RECORDMCOUNT) += recordmcount
+hostprogs-$(BUILD_C_RECORDMCOUNT) := recordmcount
+
+hostprogs-$(CONFIG_FTRACE_FUNC_PROTOTYPE) += funcprototype
+HOSTLDLIBS_funcprototype += -lelf
+HOSTLDLIBS_funcprototype += -ldw
+
 always         := $(hostprogs-y)
diff --git a/scripts/ftrace/funcprototype.c b/scripts/ftrace/funcprototype.c
new file mode 100644
index 000000000000..064724047b19
--- /dev/null
+++ b/scripts/ftrace/funcprototype.c
@@ -0,0 +1,576 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * funcprototype.c: generate function prototypes of the locations of calls to
+ * 'mcount' so that ftrace can record function parameters and return value.
+ *
+ * Copyright 2019 Changbin Du <changbin.du@gmail.com>.  All rights reserved.
+ *
+ * Usage: funcprototype [OPTION...] elf-file
+ *
+ * Here is an example for function memremap() in kernel/iomem.o. The
+ * declaration is:
+ * void *memremap(resource_size_t offset, size_t size, unsigned long flags)
+ *
+ * The output of funcprototype tool is:
+ *         .section __funcprotostr, "a"
+ * .P_memremap_0:
+ *          .string "offset"
+ * .P_memremap_1:
+ *          .string "size"
+ * .P_memremap_2:
+ *          .string "flags"
+ *
+ *          .section __funcproto,  "a"
+ *          .quad memremap
+ *          .byte 0x8
+ *          .byte 0x3
+ *          .quad .P_memremap_0
+ *          .byte 0x8
+ *          .byte 0x55
+ *          .byte 0x0
+ *          .quad .P_memremap_1
+ *          .byte 0x8
+ *          .byte 0x54
+ *          .byte 0x0
+ *          .quad .P_memremap_2
+ *          .byte 0x8
+ *          .byte 0x51
+ *          .byte 0x0
+ */
+
+#include <assert.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <err.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <argp.h>
+#include <libelf.h>
+#include <gelf.h>
+#include <dwarf.h>
+#include <elfutils/libdw.h>
+#include <elfutils/libdwfl.h>
+
+struct func_param {
+	char *name;
+	uint8_t type;
+	u_int8_t loc[2]; /* Location expression, loc[0] is opcode */
+};
+
+struct func_prototype {
+	struct func_prototype *next;
+	bool skip;
+
+	char *name;
+	uint8_t ret_type;
+	uint8_t nr_param;
+	struct func_param *params;
+};
+
+#define MK_TYPE(sign, size)	(((!!sign) << 7) | size)
+
+static bool is_64bit_obj;
+static struct func_prototype *func_prototype_list;
+
+
+static struct func_prototype *func_prototype_list_add_new(const char *name)
+{
+	struct func_prototype *proto;
+
+	proto = malloc(sizeof(*proto));
+	if (!proto)
+		errx(1, "no memory");
+	memset(proto, 0, sizeof(*proto));
+
+	proto->name = strdup(name);
+	if (!proto->name)
+		errx(1, "no memory");
+
+	if (!func_prototype_list) {
+		proto->next = NULL;
+		func_prototype_list = proto;
+	} else {
+		proto->next = func_prototype_list->next;
+		func_prototype_list->next = proto;
+	}
+
+	return proto;
+}
+
+static struct func_prototype *func_prototype_list_search(const char *name)
+{
+	struct func_prototype *proto;
+
+	for (proto = func_prototype_list; proto != NULL; proto = proto->next) {
+		if (!strcmp(proto->name, name))
+			return proto;
+	};
+	return NULL;
+}
+
+static void func_prototype_list_dumpnames(void)
+{
+	struct func_prototype *proto;
+
+	for (proto = func_prototype_list; proto != NULL; proto = proto->next)
+		printf("%s\n", proto->name);
+}
+
+static void func_prototype_list_destroy(void)
+{
+	struct func_prototype *proto;
+	int i;
+
+	while (func_prototype_list) {
+		proto = func_prototype_list;
+		func_prototype_list = func_prototype_list->next;
+
+		free(proto->name);
+		if (proto->params) {
+			for (i = 0; i < proto->nr_param; i++)
+				free(proto->params[i].name);
+			free(proto->params);
+		}
+		free(proto);
+	}
+}
+
+static bool is_mcount(char *name)
+{
+	return !strcmp(name, "__fentry__") ||
+	       !strcmp(name, "_mcount") ||
+	       !strcmp(name, "mcount");
+}
+
+static void check_elf(Elf *elf)
+{
+	GElf_Ehdr ehdr_mem;
+	GElf_Ehdr *ehdr;
+
+	ehdr = gelf_getehdr(elf, &ehdr_mem);
+	if (!ehdr)
+		errx(1, "cannot read ELF header");
+
+	is_64bit_obj = gelf_getclass(elf) == ELFCLASS64;
+
+	switch (ehdr->e_machine) {
+	case EM_386:
+	case EM_X86_64:
+		break;
+	default:
+		errx(1, "unsupported arch %d", ehdr->e_machine);
+	}
+}
+
+/**
+ * Search the symbole table to get the entry which matches @scn and @offset
+ * from relocation talbe.
+ */
+static char *search_mcount_caller(Elf *elf, GElf_Shdr *symshdr,
+				  Elf_Data *symdata, int scn, int offset)
+{
+	int ndx;
+	char *caller;
+
+	for (ndx = 0; ndx < symshdr->sh_size / symshdr->sh_entsize; ++ndx) {
+		GElf_Sym sym;
+
+		gelf_getsym(symdata, ndx, &sym);
+
+		/* TODO: add local symobl support. */
+		if (GELF_ST_BIND(sym.st_info) == STB_GLOBAL &&
+		    scn == sym.st_shndx && (offset >= sym.st_value) &&
+		    (offset < sym.st_value + sym.st_size)) {
+			caller = elf_strptr(elf, symshdr->sh_link, sym.st_name);
+			return caller;
+		}
+	}
+
+	return NULL;
+}
+
+/* Get all functions that call to mcount. */
+static void get_mcount_callers(const char *elf_file)
+{
+	Elf *elf;
+	Elf_Scn *scn = NULL;
+	GElf_Shdr shdr;
+	int fd;
+	int ndx;
+
+	fd = open(elf_file, O_RDONLY);
+	if (fd < 0)
+		errx(1, "can not open %s", elf_file);
+
+	elf_version(EV_CURRENT);
+	elf = elf_begin(fd, ELF_C_READ, NULL);
+
+	check_elf(elf);
+
+	while ((scn = elf_nextscn(elf, scn)) != NULL) {
+		gelf_getshdr(scn, &shdr);
+
+		if (shdr.sh_type == SHT_REL || shdr.sh_type == SHT_RELA) {
+			Elf_Data *data = elf_getdata(scn, NULL);
+			Elf_Scn *symscn = elf_getscn(elf, shdr.sh_link);
+			Elf_Data *symdata = elf_getdata(symscn, NULL);
+			GElf_Shdr symshdr_mem;
+			GElf_Shdr *symshdr = gelf_getshdr(symscn, &symshdr_mem);
+
+			for (ndx = 0; ndx < shdr.sh_size / shdr.sh_entsize;
+			     ++ndx) {
+				unsigned long sym_index;
+				unsigned long offset;
+				GElf_Sym sym;
+				char *symname;
+
+				if (shdr.sh_type == SHT_REL) {
+					GElf_Rel rel_mem;
+					GElf_Rel *rel = gelf_getrel(data, ndx,
+								    &rel_mem);
+					sym_index = GELF_R_SYM(rel->r_info);
+					offset = rel->r_offset;
+				} else {
+					GElf_Rela rela_mem;
+					GElf_Rela *rela = gelf_getrela(
+						data, ndx, &rela_mem);
+					sym_index = GELF_R_SYM(rela->r_info);
+					offset = rela->r_offset;
+				}
+
+				gelf_getsym(symdata, sym_index, &sym);
+				symname = elf_strptr(elf, symshdr->sh_link,
+						     sym.st_name);
+
+				if (is_mcount(symname)) {
+					const char *caller;
+
+					caller = search_mcount_caller(
+							elf, symshdr, symdata,
+							shdr.sh_info, offset);
+					if (caller)
+						func_prototype_list_add_new(caller);
+				}
+			}
+		}
+	}
+
+	elf_end(elf);
+	close(fd);
+}
+
+/*
+ * Get a variable size and sign info.
+ * TODO: Determine the expected display format. (e.g. size_t for "%lu").
+ */
+static void die_type_sign_bytes(Dwarf_Die *die, bool *is_signed, int *bytes)
+{
+	Dwarf_Attribute attr;
+	Dwarf_Die type;
+	int ret;
+
+	*bytes = 0;
+	*is_signed = false;
+
+	ret = dwarf_peel_type(dwarf_formref_die(
+			dwarf_attr_integrate(die, DW_AT_type, &attr), &type),
+			&type);
+	if (ret == 0) {
+		Dwarf_Word val;
+
+		ret = dwarf_formudata(dwarf_attr(&type, DW_AT_encoding,
+					&attr), &val);
+		if (ret == 0)
+			*is_signed = (val == DW_ATE_signed) ||
+				     (val == DW_ATE_signed_char);
+
+		if (dwarf_aggregate_size(&type, &val) == 0)
+			*bytes = val;
+	}
+}
+
+static int get_func_nr_params(Dwarf_Die *funcdie)
+{
+	Dwarf_Die child;
+	int count = 0;
+
+	if (dwarf_child(funcdie, &child) == 0) {
+		do {
+			if (dwarf_tag(&child) == DW_TAG_formal_parameter)
+				count++;
+		} while (dwarf_siblingof(&child, &child) == 0);
+	}
+
+	return count;
+}
+
+static int get_loc_expr(const char *fname, Dwarf_Op *loc, uint8_t expr[2])
+{
+	int ret = 0;
+	int off;
+
+	switch (loc->atom) {
+	case DW_OP_reg0 ... DW_OP_reg31:
+		expr[0] = loc->atom;
+		expr[1] = 0;
+		break;
+	case DW_OP_fbreg:
+		off = (int32_t)loc->number;
+
+		/*
+		 * Very few functions have number that exceeds
+		 * (SCHAR_MIN, SCHAR_MAX). We skip these
+		 * functions to keep protrotype data as small
+		 * as possilbe.
+		 */
+		if (off > SCHAR_MAX || off < SCHAR_MIN) {
+			warnx("%s: loc fbreg offset %d too large", fname, off);
+			ret = -1;
+		} else {
+			expr[0] = loc->atom;
+			expr[1] = off; /* The operand is signed */
+		}
+		break;
+	case DW_OP_breg0 ... DW_OP_breg31:
+		off = (int32_t)loc->number;
+
+		if (off > SCHAR_MAX || off < SCHAR_MIN) {
+			warnx("%s: loc bregx offset %d too large", fname, off);
+			ret = -1;
+		} else {
+			expr[0] = loc->atom;
+			expr[1] = off;
+		}
+		break;
+	default:
+		warnx("%s: unsupported loc operation 0x%x",
+		      fname, loc->atom);
+		ret = -1;
+	};
+
+	return ret;
+}
+
+static int handle_function(Dwarf_Die *funcdie, void *arg)
+{
+	const char *name = dwarf_diename(funcdie);
+	Dwarf_Addr func_addr;
+	Dwarf_Die child;
+	struct func_prototype *proto;
+	int nr_params;
+	int sz, n = 0;
+
+	if (!dwarf_hasattr(funcdie, DW_AT_low_pc))
+		return 0;
+
+	/* Such symbol is a local function generated by GCC ipa-fnsplit. */
+	if (!dwarf_hasattr(funcdie, DW_AT_name))
+		return 0;
+
+	/* check whether it is a mcount caller. */
+	proto = func_prototype_list_search(name);
+	if (!proto)
+		return 0;
+
+	nr_params = get_func_nr_params(funcdie);
+	sz = sizeof(proto->params[0]) * nr_params;
+	proto->params = malloc(sz);
+	if (!proto->params)
+		errx(1, "no memory");
+
+	memset(proto->params, 0, sz);
+
+	dwarf_lowpc(funcdie, &func_addr);
+
+	/* get function return type */
+	if (dwarf_hasattr(funcdie, DW_AT_type)) {
+		bool is_signed;
+		int bytes;
+
+		die_type_sign_bytes(funcdie, &is_signed, &bytes);
+		proto->ret_type = MK_TYPE(is_signed, bytes);
+	} else
+		proto->ret_type = 0;
+
+	/* process function parameters. */
+	if (dwarf_child(funcdie, &child) == 0) {
+		do {
+			if (dwarf_tag(&child) == DW_TAG_formal_parameter) {
+				Dwarf_Attribute locattr;
+				Dwarf_Op *loc;
+				size_t nloc = 0;
+				bool is_signed;
+				int bytes;
+
+				die_type_sign_bytes(&child, &is_signed, &bytes);
+				proto->params[n].name = strdup(dwarf_diename(&child));
+				proto->params[n].type = MK_TYPE(is_signed, bytes);
+
+				if (!dwarf_hasattr(&child, DW_AT_location))
+					errx(1, "%s: no location attr", name);
+
+				dwarf_attr(&child, DW_AT_location, &locattr);
+				if (dwarf_getlocation(&locattr, &loc, &nloc) < 0) {
+					Dwarf_Addr base, begin, end;
+
+					if (dwarf_getlocations(
+							&locattr, 0, &base,
+							&begin, &end, &loc,
+							&nloc) <= 0)
+						errx(1, "%s: no param loc info",
+						     name);
+				}
+				if (get_loc_expr(name, loc, proto->params[n].loc)) {
+					/* skip this function. */
+					proto->skip = true;
+					return 0;
+				}
+
+				n++;
+			};
+		} while (dwarf_siblingof(&child, &child) == 0);
+	}
+
+	proto->nr_param = n;
+	return 0;
+}
+
+static const Dwfl_Callbacks offline_callbacks =	{
+	.find_debuginfo = dwfl_standard_find_debuginfo,
+	.section_address = dwfl_offline_section_address,
+};
+
+/* Iterate each DW_TAG_subprogram DIE to get their prototype info. */
+static void dwarf_get_prototypes(const char *elf_file)
+{
+	Dwfl *dwfl = NULL;
+	Dwarf_Die *cu = NULL;
+	Dwarf_Addr dwbias;
+	int ret;
+
+	dwfl = dwfl_begin(&offline_callbacks);
+	if (dwfl == NULL)
+		errx(1, "dwfl fail");
+
+	if (dwfl_report_offline(dwfl, "", elf_file, -1) == NULL)
+		errx(1, "dwfl report fail");
+
+	ret = dwfl_report_end(dwfl, NULL, NULL);
+	assert(ret == 0);
+
+	while ((cu = dwfl_nextcu(dwfl, cu, &dwbias)) != NULL)
+		dwarf_getfuncs(cu, &handle_function, NULL, 0);
+}
+
+static void print_prototypes_assembly(void)
+{
+	struct func_prototype *proto;
+	int i;
+
+	if (!func_prototype_list)
+		return;
+
+	printf("	.section __funcprotostr, \"a\"\n");
+	for (proto = func_prototype_list; proto != NULL; proto = proto->next) {
+		if (proto->skip)
+			continue;
+		for (i = 0; i < proto->nr_param; i++) {
+			printf(".P_%s_%d:\n", proto->name, i);
+			printf("	.string \"%s\"\n", proto->params[i].name);
+		}
+	};
+
+	printf("\n	.section __funcproto,  \"a\"\n");
+	for (proto = func_prototype_list; proto != NULL; proto = proto->next) {
+		if (proto->skip)
+			continue;
+		if (is_64bit_obj)
+			printf("	.quad %s\n", proto->name);
+		else
+			printf("	.long %s\n", proto->name);
+		printf("	.byte 0x%x\n", proto->ret_type);
+		printf("	.byte 0x%x\n", proto->nr_param);
+		for (i = 0; i < proto->nr_param; i++) {
+			if (is_64bit_obj)
+				printf("	.quad .P_%s_%d\n", proto->name, i);
+			else
+				printf("	.long .P_%s_%d\n", proto->name, i);
+			printf("	.byte 0x%x\n", proto->params[i].type);
+			printf("	.byte 0x%x\n", proto->params[i].loc[0]);
+			printf("	.byte 0x%x\n", proto->params[i].loc[1]);
+		}
+		printf("\n");
+	};
+}
+
+/* Program documentation. */
+static char doc[] =
+	"funcprototype -- a program to generate mcount caller prototypes";
+
+/* A description of the arguments we accept. */
+static const char args_doc[] = "elf-file";
+
+/* The options we understand. */
+static struct argp_option options[] = { { "mcount-callers", 'm', 0, 0,
+					  "show mcount callers only" },
+					{ 0 } };
+
+struct arguments {
+	char *elf_file;
+	int show_callers_only;
+};
+
+/* Parse options. */
+static error_t parse_opt(int key, char *arg, struct argp_state *state)
+{
+	struct arguments *arguments = state->input;
+
+	switch (key) {
+	case 'm':
+		arguments->show_callers_only = 1;
+		break;
+	case ARGP_KEY_ARG:
+		if (state->arg_num > 2) {
+			/* Too many arguments. */
+			argp_usage(state);
+		}
+		arguments->elf_file = arg;
+		break;
+	case ARGP_KEY_END:
+		if (state->arg_num < 1)
+			/* Not enough arguments. */
+			argp_usage(state);
+		break;
+	default:
+		return ARGP_ERR_UNKNOWN;
+	}
+	return 0;
+}
+
+/* Our argp parser. */
+static struct argp argp = { options, parse_opt, args_doc, doc };
+
+int main(int argc, char *argv[])
+{
+	struct arguments arguments;
+
+	arguments.show_callers_only = 0;
+	argp_parse(&argp, argc, argv, 0, 0, &arguments);
+
+	get_mcount_callers(arguments.elf_file);
+
+	if (arguments.show_callers_only) {
+		func_prototype_list_dumpnames();
+		goto free;
+	}
+
+	dwarf_get_prototypes(arguments.elf_file);
+	print_prototypes_assembly();
+
+free:
+	func_prototype_list_destroy();
+	return 0;
+}
-- 
2.20.1

