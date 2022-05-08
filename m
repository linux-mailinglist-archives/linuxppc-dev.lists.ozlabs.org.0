Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F174451F007
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 21:16:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxDYJ5hQ0z3f6S
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 05:16:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=v567Pj5G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.76;
 helo=conuserg-09.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=v567Pj5G; 
 dkim-atps=neutral
Received: from conuserg-09.nifty.com (conuserg-09.nifty.com [210.131.2.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxDQh5wZnz3cFD
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 05:10:20 +1000 (AEST)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp
 [133.32.177.133]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id 248J8qSX030019;
 Mon, 9 May 2022 04:09:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 248J8qSX030019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1652036944;
 bh=7dVosA98YsgJAc1+4NwlKOpt2daMW/NjA4iASuFudpw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=v567Pj5GkH9qyqgf1aE9TntJT+yjdXuw4QMOStvVTv8qOpX9wzdNOoBLi3PvqEF2S
 vKbc8AURe1DmvvshndOInFInjaHdtLIFeHPQMCsoWFkpHg/BSp9xeph0yuCe7EmDHO
 btzmcymQDVTlLOpt3rm8S7zn/qiN7hJXjTUnT1l0BvUv6hXeHf7uazePIwMdyNq8xS
 9DAmpyA8AqfCGBMPPhBECL/YKJuJwB0hTSs+2eNqXGmPwzZR3JtVcktZzmx901vRZd
 izJAHnNVE8foareCu3qE4k8aetZnUFOSHieu7Y0B5I3KGJ/oCNnmazTa4h/I/JQBkL
 k8jmasqrFzAmg==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH v4 10/14] kbuild: check static EXPORT_SYMBOL* by script
 instead of modpost
Date: Mon,  9 May 2022 04:06:27 +0900
Message-Id: <20220508190631.2386038-11-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220508190631.2386038-1-masahiroy@kernel.org>
References: <20220508190631.2386038-1-masahiroy@kernel.org>
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
Cc: linux-s390@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>,
 Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, clang-built-linux@googlegroups.com,
 Sami Tolvanen <samitolvanen@google.com>, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The 'static' specifier and EXPORT_SYMBOL() are an odd combination.

Commit 15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL*
functions") tried to detect it, but this check has false negatives.

Here is the sample code.

  Makefile:

    obj-y += foo1.o foo2.o

  foo1.c:

    #include <linux/export.h>
    static void foo(void) {}
    EXPORT_SYMBOL(foo);

  foo2.c:

    void foo(void) {}

foo1.c exports the static symbol 'foo', but modpost cannot catch it
because it is fooled by foo2.c, which has a global symbol with the
same name.

s->is_static is cleared if a global symbol with the same name is found
somewhere, but EXPORT_SYMBOL() and the global symbol do not necessarily
belong to the same compilation unit.

This check should be done per compilation unit, but I do not know how
to do it in modpost. modpost runs against vmlinux.o or modules, which
merges multiple objects, then forgets their origin.

It is true modpost gets access to the lists of all the member objects
(.vmlinux.objs and *.mod), but it is impossible to parse individual
objects in modpost; they might be LLVM IR instead of ELF when
CONFIG_LTO_CLANG=y.

Add a simple bash script to parse the output from ${NM}. This works for
CONFIG_LTO_CLANG=y because llvm-nm can dump symbols of LLVM bitcode.

Revert 15bfc2348d54.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v4:
  - New patch

 scripts/Makefile.build     |  4 ++++
 scripts/check-local-export | 48 ++++++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.c      | 28 +---------------------
 3 files changed, 53 insertions(+), 27 deletions(-)
 create mode 100755 scripts/check-local-export

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 838ea5e83174..c2a173b3fd60 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -244,9 +244,12 @@ cmd_gen_ksymdeps = \
 	$(CONFIG_SHELL) $(srctree)/scripts/gen_ksymdeps.sh $@ >> $(dot-target).cmd
 endif
 
+cmd_check_local_export = $(srctree)/scripts/check-local-export $@
+
 define rule_cc_o_c
 	$(call cmd_and_fixdep,cc_o_c)
 	$(call cmd,gen_ksymdeps)
+	$(call cmd,check_local_export)
 	$(call cmd,checksrc)
 	$(call cmd,checkdoc)
 	$(call cmd,gen_objtooldep)
@@ -257,6 +260,7 @@ endef
 define rule_as_o_S
 	$(call cmd_and_fixdep,as_o_S)
 	$(call cmd,gen_ksymdeps)
+	$(call cmd,check_local_export)
 	$(call cmd,gen_objtooldep)
 	$(call cmd,gen_symversions_S)
 endef
diff --git a/scripts/check-local-export b/scripts/check-local-export
new file mode 100755
index 000000000000..d1721fa63057
--- /dev/null
+++ b/scripts/check-local-export
@@ -0,0 +1,48 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Copyright (C) 2022 Masahiro Yamada
+
+set -e
+set -o pipefail
+
+declare -A symbol_types
+declare -a export_symbols
+
+exit_code=0
+
+while read value type name
+do
+	# to avoid error for clang LTO; $name may be empty
+	if [[ $value = -* && -z $name ]]; then
+		continue
+	fi
+
+	# The first field (value) may be empty. If so, fix it up.
+	if [[ -z $name ]]; then
+	   name=${type}
+	   type=${value}
+	fi
+
+	# save (name, type) in the associative array
+	symbol_types[$name]=$type
+
+	# append the exported symbol to the array
+	if [[ $name == __ksymtab_* ]]; then
+		export_symbols+=(${name#__ksymtab_})
+	fi
+done < <(${NM} ${1} 2>/dev/null)
+
+# Catch error in the process substitution
+wait $!
+
+for name in "${export_symbols[@]}"
+do
+	# nm(3) says "If lowercase, the symbol is usually local"
+	if [[ ${symbol_types[$name]} =~ [a-z] ]]; then
+		echo "$@: error: local symbol '${name}' was exported" >&2
+		exit_code=1
+	fi
+done
+
+exit ${exit_code}
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 018527d96680..fa73ddb6a6cf 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -212,7 +212,6 @@ struct symbol {
 	unsigned int crc;
 	bool crc_valid;
 	bool weak;
-	bool is_static;		/* true if symbol is not global */
 	bool is_gpl_only;	/* exported by EXPORT_SYMBOL_GPL */
 	char name[];
 };
@@ -242,7 +241,7 @@ static struct symbol *alloc_symbol(const char *name)
 
 	memset(s, 0, sizeof(*s));
 	strcpy(s->name, name);
-	s->is_static = true;
+
 	return s;
 }
 
@@ -875,20 +874,6 @@ static void read_symbols(const char *modname)
 					     sym_get_data(&info, sym));
 	}
 
-	// check for static EXPORT_SYMBOL_* functions && global vars
-	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
-		unsigned char bind = ELF_ST_BIND(sym->st_info);
-
-		if (bind == STB_GLOBAL || bind == STB_WEAK) {
-			struct symbol *s =
-				find_symbol(remove_dot(info.strtab +
-						       sym->st_name));
-
-			if (s)
-				s->is_static = false;
-		}
-	}
-
 	check_sec_ref(mod, modname, &info);
 
 	if (!mod->is_vmlinux) {
@@ -1318,7 +1303,6 @@ static void read_dump(const char *fname)
 			mod->from_dump = true;
 		}
 		s = sym_add_exported(symname, mod, gpl_only);
-		s->is_static = false;
 		sym_set_crc(s, crc);
 		sym_update_namespace(symname, namespace);
 	}
@@ -1383,7 +1367,6 @@ int main(int argc, char **argv)
 	char *missing_namespace_deps = NULL;
 	char *dump_write = NULL, *files_source = NULL;
 	int opt;
-	int n;
 	LIST_HEAD(dump_lists);
 	struct dump_list *dl, *dl2;
 
@@ -1459,15 +1442,6 @@ int main(int argc, char **argv)
 	if (sec_mismatch_count && !sec_mismatch_warn_only)
 		error("Section mismatches detected.\n"
 		      "Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.\n");
-	for (n = 0; n < SYMBOL_HASH_SIZE; n++) {
-		struct symbol *s;
-
-		for (s = symbolhash[n]; s; s = s->next) {
-			if (s->is_static)
-				error("\"%s\" [%s] is a static EXPORT_SYMBOL\n",
-				      s->name, s->module->name);
-		}
-	}
 
 	if (nr_unresolved > MAX_UNRESOLVED_REPORTS)
 		warn("suppressed %u unresolved symbol warnings because there were too many)\n",
-- 
2.32.0

