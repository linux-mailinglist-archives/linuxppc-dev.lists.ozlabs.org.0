Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F04B907E87
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 00:03:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0bz03xbcz3fsr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 08:03:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=zhengyejian1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0PBT1bmSz30W9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 23:58:09 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4W0Ncy6vjrzxSf1;
	Thu, 13 Jun 2024 21:32:34 +0800 (CST)
Received: from dggpeml500012.china.huawei.com (unknown [7.185.36.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A566180069;
	Thu, 13 Jun 2024 21:36:40 +0800 (CST)
Received: from localhost.localdomain (10.67.175.61) by
 dggpeml500012.china.huawei.com (7.185.36.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 21:36:40 +0800
From: Zheng Yejian <zhengyejian1@huawei.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>, <mark.rutland@arm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen.n.rao@linux.ibm.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <mcgrof@kernel.org>, <mathieu.desnoyers@efficios.com>,
	<masahiroy@kernel.org>, <nathan@kernel.org>, <nicolas@fjasle.eu>,
	<kees@kernel.org>, <james.clark@arm.com>, <kent.overstreet@linux.dev>,
	<yhs@fb.com>, <jpoimboe@kernel.org>, <peterz@infradead.org>
Subject: [PATCH 2/6] kallsyms: Emit symbol at the holes in the text
Date: Thu, 13 Jun 2024 21:37:07 +0800
Message-ID: <20240613133711.2867745-3-zhengyejian1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613133711.2867745-1-zhengyejian1@huawei.com>
References: <20240613133711.2867745-1-zhengyejian1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.61]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500012.china.huawei.com (7.185.36.15)
X-Mailman-Approved-At: Fri, 14 Jun 2024 08:01:41 +1000
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
Cc: zhengyejian1@huawei.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a weak type function is overridden, its symbol will be removed
from the symbol table, but its code will not be removed. Besides,
due to lacking of size for kallsyms, kernel compute function size by
substracting its symbol address from its next symbol address (see
kallsyms_lookup_size_offset()). These will cause that size of some
function is computed to be larger than it actually is, just because
symbol of its following weak function is removed.

This issue also causes multiple __fentry__ locations to be counted in
the some function scope, and eventually causes ftrace_location() to find
wrong __fentry__ location. It was reported in
Link: https://lore.kernel.org/all/20240607115211.734845-1-zhengyejian1@huawei.com/

Peter suggested to change scipts/kallsyms.c to emit readily
identifiable symbol names for all the weak junk, eg:

  __weak_junk_NNNNN

The name of this kind symbol needs some discussion, but it's temporarily
called "__hole_symbol_XXXXX" in this patch:
1. Pass size info to scripts/kallsyms  (see mksysmap());
2. Traverse sorted function symbols, if one function address plus its
   size less than next function address, it means there's a hole, then
   emit a symbol "__hole_symbol_XXXXX" there which type is 't'.

After this patch, the effect is as follows:

  $ cat /proc/kallsyms | grep -A 3 do_one_initcall
  ffffffff810021e0 T do_one_initcall
  ffffffff8100245e t __hole_symbol_XXXXX
  ffffffff810024a0 t __pfx_rootfs_init_fs_context

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Zheng Yejian <zhengyejian1@huawei.com>
---
 scripts/kallsyms.c      | 101 +++++++++++++++++++++++++++++++++++++++-
 scripts/link-vmlinux.sh |   4 +-
 scripts/mksysmap        |   2 +-
 3 files changed, 102 insertions(+), 5 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 6559a9802f6e..5c4cde864a04 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -35,6 +35,7 @@
 struct sym_entry {
 	struct sym_entry *next;
 	unsigned long long addr;
+	unsigned long long size;
 	unsigned int len;
 	unsigned int seq;
 	unsigned int start_pos;
@@ -74,6 +75,7 @@ static int token_profit[0x10000];
 static unsigned char best_table[256][2];
 static unsigned char best_table_len[256];
 
+static const char hole_symbol[] = "__hole_symbol_XXXXX";
 
 static void usage(void)
 {
@@ -130,8 +132,16 @@ static struct sym_entry *read_symbol(FILE *in, char **buf, size_t *buf_len)
 	size_t len;
 	ssize_t readlen;
 	struct sym_entry *sym;
+	unsigned long long size = 0;
 
 	errno = 0;
+	/*
+	 * Example of expected symbol format:
+	 * 1. symbol with size info:
+	 *    ffffffff81000070 00000000000001d7 T __startup_64
+	 * 2. symbol without size info:
+	 *    0000000002a00000 A text_size
+	 */
 	readlen = getline(buf, buf_len, in);
 	if (readlen < 0) {
 		if (errno) {
@@ -145,9 +155,24 @@ static struct sym_entry *read_symbol(FILE *in, char **buf, size_t *buf_len)
 		(*buf)[readlen - 1] = 0;
 
 	addr = strtoull(*buf, &p, 16);
+	if (*buf == p || *p++ != ' ') {
+		fprintf(stderr, "line format error: unable to parse address\n");
+		exit(EXIT_FAILURE);
+	}
+
+	if (*p == '0') {
+		char *str = p;
 
-	if (*buf == p || *p++ != ' ' || !isascii((type = *p++)) || *p++ != ' ') {
-		fprintf(stderr, "line format error\n");
+		size = strtoull(str, &p, 16);
+		if (str == p || *p++ != ' ') {
+			fprintf(stderr, "line format error: unable to parse size\n");
+			exit(EXIT_FAILURE);
+		}
+	}
+
+	type = *p++;
+	if (!isascii(type) || *p++ != ' ') {
+		fprintf(stderr, "line format error: unable to parse type\n");
 		exit(EXIT_FAILURE);
 	}
 
@@ -182,6 +207,7 @@ static struct sym_entry *read_symbol(FILE *in, char **buf, size_t *buf_len)
 		exit(EXIT_FAILURE);
 	}
 	sym->addr = addr;
+	sym->size = size;
 	sym->len = len;
 	sym->sym[0] = type;
 	strcpy(sym_name(sym), name);
@@ -795,6 +821,76 @@ static void sort_symbols(void)
 	qsort(table, table_cnt, sizeof(table[0]), compare_symbols);
 }
 
+static int may_exist_hole_after_symbol(const struct sym_entry *se)
+{
+	char type = se->sym[0];
+
+	/* Only check text symbol or weak symbol */
+	if (type != 't' && type != 'T' &&
+	    type != 'w' && type != 'W')
+		return 0;
+	/* Symbol without size has no hole */
+	return se->size != 0;
+}
+
+static struct sym_entry *gen_hole_symbol(unsigned long long addr)
+{
+	struct sym_entry *sym;
+	static size_t len = sizeof(hole_symbol);
+
+	/* include type field */
+	sym = malloc(sizeof(*sym) + len + 1);
+	if (!sym) {
+		fprintf(stderr, "unable to allocate memory for hole symbol\n");
+		exit(EXIT_FAILURE);
+	}
+	sym->addr = addr;
+	sym->size = 0;
+	sym->len = len;
+	sym->sym[0] = 't';
+	strcpy(sym_name(sym), hole_symbol);
+	sym->percpu_absolute = 0;
+	return sym;
+}
+
+static void emit_hole_symbols(void)
+{
+	unsigned int i, pos, nr_emit;
+	struct sym_entry **new_table;
+	unsigned int new_cnt;
+
+	nr_emit = 0;
+	for (i = 0; i < table_cnt - 1; i++) {
+		if (may_exist_hole_after_symbol(table[i]) &&
+		    table[i]->addr + table[i]->size < table[i+1]->addr)
+			nr_emit++;
+	}
+	if (!nr_emit)
+		return;
+
+	new_cnt = table_cnt + nr_emit;
+	new_table = malloc(sizeof(*new_table) * new_cnt);
+	if (!new_table) {
+		fprintf(stderr, "unable to allocate memory for new table\n");
+		exit(EXIT_FAILURE);
+	}
+
+	pos = 0;
+	for (i = 0; i < table_cnt; i++) {
+		unsigned long long addr;
+
+		new_table[pos++] = table[i];
+		if ((i == table_cnt - 1) || !may_exist_hole_after_symbol(table[i]))
+			continue;
+		addr = table[i]->addr + table[i]->size;
+		if (addr < table[i+1]->addr)
+			new_table[pos++] = gen_hole_symbol(addr);
+	}
+	free(table);
+	table = new_table;
+	table_cnt = new_cnt;
+}
+
 static void make_percpus_absolute(void)
 {
 	unsigned int i;
@@ -854,6 +950,7 @@ int main(int argc, char **argv)
 	if (absolute_percpu)
 		make_percpus_absolute();
 	sort_symbols();
+	emit_hole_symbols();
 	if (base_relative)
 		record_relative_base();
 	optimize_token_table();
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 518c70b8db50..8e1373902bfe 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -189,11 +189,11 @@ kallsyms_step()
 }
 
 # Create map file with all symbols from ${1}
-# See mksymap for additional details
+# See mksysmap for additional details
 mksysmap()
 {
 	info NM ${2}
-	${NM} -n "${1}" | sed -f "${srctree}/scripts/mksysmap" > "${2}"
+	${NM} -nS "${1}" | sed -f "${srctree}/scripts/mksysmap" > "${2}"
 }
 
 sorttable()
diff --git a/scripts/mksysmap b/scripts/mksysmap
index c12723a04655..7a4415f21143 100755
--- a/scripts/mksysmap
+++ b/scripts/mksysmap
@@ -2,7 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # sed script to filter out symbols that are not needed for System.map,
-# or not suitable for kallsyms. The input should be 'nm -n <file>'.
+# or not suitable for kallsyms. The input should be 'nm -nS <file>'.
 #
 # System.map is used by module-init tools and some debugging
 # tools to retrieve the actual addresses of symbols in the kernel.
-- 
2.25.1

