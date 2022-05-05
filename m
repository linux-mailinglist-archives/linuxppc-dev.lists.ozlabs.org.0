Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0393151B8EC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 09:29:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv51C6Q0Dz3brq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 17:29:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=F9C+/j6I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.79;
 helo=conuserg-12.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=F9C+/j6I; 
 dkim-atps=neutral
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv4wZ0LhWz3brf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 17:25:17 +1000 (AEST)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp
 [133.32.177.133]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id 2457Nenv019426;
 Thu, 5 May 2022 16:23:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 2457Nenv019426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1651735436;
 bh=CPqCziLLqCMP64InbbHc5QNHoo31bt69oR1U5YA1pwU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F9C+/j6IKPG71p4XooFL/R9MOxMp+Cf/oeeApXxXf7p6I5S5UJqis0n31bUKWw7wC
 AthIFmgv3PLrK/fpsF75Rimx8ovodQNHnpXemiBWeFxRP7oYXdjWxrFkA3Onvr+BX/
 ATPdNe3bAcBOLG6OoAPlD4Wole0WvVtpgDSjtX8VNwzkYdYDH2M5otOLipiO+CD0Cj
 Mmao6qtuzflAwpMEfZvIVQWSddttotiOG4LDU7CBnvHWRvwJu5TbgHir1MbGSafLFQ
 aSbqJzV0qmWHlpe40KoYPm+jES5j2bDyE8hWmZdQ/Yt3WPSkfzkG2htBDWpTrPYv8H
 BTLY4muxErOfA==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH v3 13/15] modpost: use hlist for hash table implementation
Date: Thu,  5 May 2022 16:22:42 +0900
Message-Id: <20220505072244.1155033-14-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505072244.1155033-1-masahiroy@kernel.org>
References: <20220505072244.1155033-1-masahiroy@kernel.org>
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
Cc: linux-s390@vger.kernel.org, Nicolas Schier a <nicolas@fjasle.eu>,
 Peter Zijlstra <peterz@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Import hlist macros from include/linux/list.h to implement the hash
table in a more generic way.

While I was here, I increased the hash table size from 1024 to 8192
to decrease the hash collision.

I moved ARRAY_SIZE() from file2alias.c to modpost.h because it is needed
in modpost.c as well.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v2)

Changes in v2:
  - Move to the end of the series because this is now optional

 scripts/mod/file2alias.c |  2 --
 scripts/mod/list.h       | 52 ++++++++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.c    | 39 +++++++++++++++---------------
 scripts/mod/modpost.h    |  2 ++
 4 files changed, 73 insertions(+), 22 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 5258247d78ac..e8a9c6816fec 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -734,8 +734,6 @@ static int do_vio_entry(const char *filename, void *symval,
 	return 1;
 }
 
-#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
-
 static void do_input(char *alias,
 		     kernel_ulong_t *arr, unsigned int min, unsigned int max)
 {
diff --git a/scripts/mod/list.h b/scripts/mod/list.h
index a924a6c4aa4d..c60dbaa70d6b 100644
--- a/scripts/mod/list.h
+++ b/scripts/mod/list.h
@@ -210,4 +210,56 @@ static inline int list_empty(const struct list_head *head)
 	     !list_entry_is_head(pos, head, member);			\
 	     pos = n, n = list_next_entry(n, member))
 
+/*
+ * Double linked lists with a single pointer list head.
+ * Mostly useful for hash tables where the two pointer list head is
+ * too wasteful.
+ * You lose the ability to access the tail in O(1).
+ */
+
+struct hlist_head {
+	struct hlist_node *first;
+};
+
+struct hlist_node {
+	struct hlist_node *next, **pprev;
+};
+
+/**
+ * hlist_add_head - add a new entry at the beginning of the hlist
+ * @n: new entry to be added
+ * @h: hlist head to add it after
+ *
+ * Insert a new entry after the specified head.
+ * This is good for implementing stacks.
+ */
+static inline void hlist_add_head(struct hlist_node *n, struct hlist_head *h)
+{
+	struct hlist_node *first = h->first;
+
+	n->next = first;
+	if (first)
+		first->pprev = &n->next;
+	h->first = n;
+	n->pprev = &h->first;
+}
+
+#define hlist_entry(ptr, type, member) container_of(ptr, type, member)
+
+#define hlist_entry_safe(ptr, type, member) \
+	({ typeof(ptr) ____ptr = (ptr); \
+	   ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
+	})
+
+/**
+ * hlist_for_each_entry	- iterate over list of given type
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the hlist_node within the struct.
+ */
+#define hlist_for_each_entry(pos, head, member)				\
+	for (pos = hlist_entry_safe((head)->first, typeof(*(pos)), member);\
+	     pos;							\
+	     pos = hlist_entry_safe((pos)->member.next, typeof(*(pos)), member))
+
 #endif /* LIST_H */
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 4edd5b223f49..7f7e0818940f 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -199,13 +199,8 @@ static struct module *new_module(const char *modname)
 	return mod;
 }
 
-/* A hash of all exported symbols,
- * struct symbol is also used for lists of unresolved symbols */
-
-#define SYMBOL_HASH_SIZE 1024
-
 struct symbol {
-	struct symbol *next;
+	struct hlist_node hash_node;	/* link to the hash table */
 	struct list_head list;	/* link to module::exported_symbols or module::unresolved_symbols */
 	struct module *module;
 	char *namespace;
@@ -217,8 +212,6 @@ struct symbol {
 	char name[];
 };
 
-static struct symbol *symbolhash[SYMBOL_HASH_SIZE];
-
 /* This is based on the hash algorithm from gdbm, via tdb */
 static inline unsigned int tdb_hash(const char *name)
 {
@@ -232,6 +225,21 @@ static inline unsigned int tdb_hash(const char *name)
 	return (1103515243 * value + 12345);
 }
 
+/* useful hash macros */
+#define hash_head(table, key)		(&(table)[tdb_hash(key) % ARRAY_SIZE(table)])
+
+#define hash_add_symbol(sym, table)	hlist_add_head(&(sym)->hash_node, \
+						       hash_head(table, (sym)->name))
+
+#define hash_for_matched_symbol(sym, table, key) \
+	hlist_for_each_entry(sym, hash_head(table, key), hash_node) \
+		if (!strcmp(sym->name, key))
+
+#define HASHTABLE_DECLARE(name, size)	struct hlist_head name[size]
+
+/* hash table of all exported symbols */
+HASHTABLE_DECLARE(exported_symbols, 8192);
+
 /**
  * Allocate a new symbols for use in the hash of exported symbols or
  * the list of unresolved symbols per module
@@ -246,15 +254,6 @@ static struct symbol *alloc_symbol(const char *name)
 	return s;
 }
 
-/* For the hash of exported symbols */
-static void hash_add_symbol(struct symbol *sym)
-{
-	unsigned int hash;
-
-	hash = tdb_hash(sym->name) % SYMBOL_HASH_SIZE;
-	sym->next = symbolhash[hash];
-	symbolhash[hash] = sym;
-}
 
 static void sym_add_unresolved(const char *name, struct module *mod, bool weak)
 {
@@ -274,8 +273,8 @@ static struct symbol *sym_find_with_module(const char *name, struct module *mod)
 	if (name[0] == '.')
 		name++;
 
-	for (s = symbolhash[tdb_hash(name) % SYMBOL_HASH_SIZE]; s; s = s->next) {
-		if (strcmp(s->name, name) == 0 && (!mod || s->module == mod))
+	hash_for_matched_symbol(s, exported_symbols, name) {
+		if (!mod || s->module == mod)
 			return s;
 	}
 	return NULL;
@@ -379,7 +378,7 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
 	s->is_static = !mod->from_dump;
 	s->is_gpl_only = gpl_only;
 	list_add_tail(&s->list, &mod->exported_symbols);
-	hash_add_symbol(s);
+	hash_add_symbol(s, exported_symbols);
 
 	return s;
 }
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 2e8c897e0953..0cd8eec6f59b 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -14,6 +14,8 @@
 #include "list.h"
 #include "elfconfig.h"
 
+#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
+
 /* On BSD-alike OSes elf.h defines these according to host's word size */
 #undef ELF_ST_BIND
 #undef ELF_ST_TYPE
-- 
2.32.0

