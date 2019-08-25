Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD479C420
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Aug 2019 15:51:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Gc3t5z8bzDqRW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Aug 2019 23:51:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=changbin.du@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="I/UiMy2R"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GbTM1HGCzDqdp
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2019 23:24:39 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id z3so8499242pln.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2019 06:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2pTVuNmqzcV3Op0lr/NM5GfDOg6CKox2DhhefWfSKJA=;
 b=I/UiMy2RRPAPvoKy0t7HkHjN2MpeaAd6rZsrJIBNtVbPYCLfqfqP9wnn0PZ2SmIe6p
 Bk8ibbvIlhXpzVLG/hou/A2kBOhmQSlhGhN7rZk+9DEqMpludfcVVfdbTIdga06mwYCJ
 GVfRE8TvzxhuP1uKOUgGU3wr4QMbG7PfwGgNhSX1hpgonK0EaRH174VYFDovga9YevWC
 nT214rTNH1dZBi647hDH7iko9v1XQU4Osegpd4WDi8uSwE33Sm5ejsO6/uaKsra4Mc0Y
 OsAuU2FA0NyR4DEil46tNmKFj7vzQxuusnSu5Yr2XjrZZYzNXIpN7r2t//WW8drnxQV0
 v14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2pTVuNmqzcV3Op0lr/NM5GfDOg6CKox2DhhefWfSKJA=;
 b=SNIS88rzKw+XizFWs2mrju08uluXk9Su/PM4rLGDBo3yQTUD5DBLtK4cwCvOqVTFA7
 XLHGT4yVoiKl3VI+tNYna94sAtHIS1ILiGL5pDS39b5axYRHok4cxeBqTxgrmndTp3J6
 KbhwHPYVCk3FaS/kyE8mU4m05hwIEqDrle6vs3UCNybU71sd9aMrPp6sA/hg00SstBd+
 kbl8ho+4Fjutn9IT8YJLzGYkRDSlpiNkBSGjrqykPyaZpQBxH1FZ7cKjN1+zL0fjrGeU
 Kl/bn0ZP2y4C4NYPkK3eQxH6mEGQBGtvOs95aXl5u4Ftv1hAdf5dTlMMfWsitp9z+i1a
 QN6w==
X-Gm-Message-State: APjAAAXD/75rCjMOPLw4l60sxj4u6dvy/N4JXlCXp1KfPR0pcYjkx+Gi
 ZzGXx1vdnQQtlaCeoDoE0Yk=
X-Google-Smtp-Source: APXvYqwW5vgalEvzXbNDzG8Sy2C+nrBmYuDxURknm4QUVr63S8vbHRcx35z28SMC7WZypbpFAxEGaA==
X-Received: by 2002:a17:902:b593:: with SMTP id
 a19mr14240906pls.110.1566739474770; 
 Sun, 25 Aug 2019 06:24:34 -0700 (PDT)
Received: from localhost.localdomain ([149.28.153.17])
 by smtp.gmail.com with ESMTPSA id y23sm11076562pfr.86.2019.08.25.06.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Aug 2019 06:24:34 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Subject: [PATCH 06/11] ftrace: process function prototype data in vmlinux and
 modules
Date: Sun, 25 Aug 2019 21:23:25 +0800
Message-Id: <20190825132330.5015-7-changbin.du@gmail.com>
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

Walk through the '__funcproto' section in vmlinux and kernel modules.
For each item we add it to a new ftrace hash table ftrace_prototype_hash.
When unloading a module, its items are removed from hash table.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 include/asm-generic/vmlinux.lds.h | 18 ++++++++
 include/linux/ftrace.h            | 18 ++++++++
 include/linux/module.h            |  4 ++
 kernel/module.c                   | 25 ++++++++--
 kernel/trace/ftrace.c             | 76 ++++++++++++++++++++++++++++++-
 kernel/trace/trace.h              |  4 ++
 6 files changed, 140 insertions(+), 5 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index cd28f63bfbc7..3b0a10cbf0ca 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -125,6 +125,23 @@
 #define MCOUNT_REC()
 #endif
 
+#ifdef CONFIG_FTRACE_FUNC_PROTOTYPE
+#define FUNC_PROTOTYPE							\
+	. = ALIGN(8);							\
+	__funcprotostr : AT(ADDR(__funcprotostr) - LOAD_OFFSET) {	\
+		KEEP(*(__funcprotostr)) 				\
+	}								\
+									\
+	. = ALIGN(8);							\
+	__funcproto : AT(ADDR(__funcproto) - LOAD_OFFSET) {		\
+		__start_funcproto = .;					\
+		KEEP(*(__funcproto))					\
+		__stop_funcproto = .;					\
+	}
+#else
+#define	FUNC_PROTOTYPE
+#endif
+
 #ifdef CONFIG_TRACE_BRANCH_PROFILING
 #define LIKELY_PROFILE()	__start_annotated_branch_profile = .;	\
 				KEEP(*(_ftrace_annotated_branch))	\
@@ -396,6 +413,7 @@
 	}								\
 									\
 	TRACEDATA							\
+	FUNC_PROTOTYPE							\
 									\
 	/* Kernel symbol table: Normal symbols */			\
 	__ksymtab         : AT(ADDR(__ksymtab) - LOAD_OFFSET) {		\
diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 8a8cb3c401b2..f5aab37a8c34 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -361,6 +361,24 @@ struct dyn_ftrace {
 	struct dyn_arch_ftrace	arch;
 };
 
+#ifdef CONFIG_FTRACE_FUNC_PROTOTYPE
+struct func_param {
+	char *name;
+	uint8_t type;
+	uint8_t loc[2];
+} __packed;
+
+struct func_prototype {
+	unsigned long ip;
+	uint8_t ret_type;
+	uint8_t nr_param;
+	struct func_param params[0];
+} __packed;
+
+#define FTRACE_PROTOTYPE_SIGNED(t)	(t & BIT(7))
+#define FTRACE_PROTOTYPE_SIZE(t)	(t & GENMASK(6, 0))
+#endif
+
 int ftrace_force_update(void);
 int ftrace_set_filter_ip(struct ftrace_ops *ops, unsigned long ip,
 			 int remove, int reset);
diff --git a/include/linux/module.h b/include/linux/module.h
index 1455812dd325..516062dfe567 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -477,6 +477,10 @@ struct module {
 	unsigned int num_ftrace_callsites;
 	unsigned long *ftrace_callsites;
 #endif
+#ifdef CONFIG_FTRACE_FUNC_PROTOTYPE
+	struct func_prototype *funcproto_start;
+	size_t funcproto_sec_size;
+#endif
 
 #ifdef CONFIG_LIVEPATCH
 	bool klp; /* Is this a livepatch module? */
diff --git a/kernel/module.c b/kernel/module.c
index 9ee93421269c..1c5eea7b6a28 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -360,17 +360,30 @@ static void *section_addr(const struct load_info *info, const char *name)
 	return (void *)info->sechdrs[find_sec(info, name)].sh_addr;
 }
 
+/* Get info of a module section. */
+static void *section_info(const struct load_info *info,
+			  const char *name,
+			  size_t *size)
+{
+	unsigned int sec = find_sec(info, name);
+
+	/* Section 0 has sh_addr 0 and sh_size 0. */
+	*size = info->sechdrs[sec].sh_size;
+	return (void *)info->sechdrs[sec].sh_addr;
+}
+
 /* Find a module section, or NULL.  Fill in number of "objects" in section. */
 static void *section_objs(const struct load_info *info,
 			  const char *name,
 			  size_t object_size,
 			  unsigned int *num)
 {
-	unsigned int sec = find_sec(info, name);
+	void *addr;
+	size_t sz;
 
-	/* Section 0 has sh_addr 0 and sh_size 0. */
-	*num = info->sechdrs[sec].sh_size / object_size;
-	return (void *)info->sechdrs[sec].sh_addr;
+	addr = section_info(info, name, &sz);
+	*num = sz / object_size;
+	return addr;
 }
 
 /* Provided by the linker */
@@ -3140,6 +3153,10 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 					     sizeof(*mod->ftrace_callsites),
 					     &mod->num_ftrace_callsites);
 #endif
+#ifdef CONFIG_FTRACE_FUNC_PROTOTYPE
+	mod->funcproto_start = section_info(info, "__funcproto",
+					    &mod->funcproto_sec_size);
+#endif
 #ifdef CONFIG_FUNCTION_ERROR_INJECTION
 	mod->ei_funcs = section_objs(info, "_error_injection_whitelist",
 					    sizeof(*mod->ei_funcs),
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index cfcb8dad93ea..438b8b47198f 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -5060,6 +5060,9 @@ static DEFINE_MUTEX(graph_lock);
 
 struct ftrace_hash *ftrace_graph_hash = EMPTY_HASH;
 struct ftrace_hash *ftrace_graph_notrace_hash = EMPTY_HASH;
+#ifdef CONFIG_FTRACE_FUNC_PROTOTYPE
+struct ftrace_hash *ftrace_prototype_hash = EMPTY_HASH;
+#endif
 
 enum graph_filter_type {
 	GRAPH_FILTER_NOTRACE	= 0,
@@ -5615,6 +5618,46 @@ static int ftrace_process_locs(struct module *mod,
 	return ret;
 }
 
+#ifdef CONFIG_FTRACE_FUNC_PROTOTYPE
+static int ftrace_process_funcproto(struct module *mod,
+			       struct func_prototype *start,
+			       struct func_prototype *end,
+			       bool remove)
+{
+	struct ftrace_func_entry *ent;
+	struct func_prototype *proto;
+	int ret = 0;
+
+	mutex_lock(&ftrace_lock);
+
+restart:
+	proto = start;
+	while (proto < end) {
+		if (remove) {
+			ent = ftrace_lookup_ip(ftrace_prototype_hash,
+					       proto->ip);
+			if (ent)
+				free_hash_entry(ftrace_prototype_hash, ent);
+		} else {
+			ret = add_hash_entry(ftrace_prototype_hash,
+					     proto->ip, proto);
+			if (ret < 0) {
+				end = proto;
+				remove = 1;
+				goto restart;
+			}
+		}
+		proto = (struct func_prototype *)((char *)proto +
+			sizeof(*proto) +
+			sizeof(proto->params[0]) * proto->nr_param);
+	}
+
+	mutex_unlock(&ftrace_lock);
+
+	return ret;
+}
+#endif
+
 struct ftrace_mod_func {
 	struct list_head	list;
 	char			*name;
@@ -5707,7 +5750,7 @@ static void ftrace_free_mod_map(struct rcu_head *rcu)
 	kfree(mod_map);
 }
 
-void ftrace_release_mod(struct module *mod)
+void ftrace_release_dyn(struct module *mod)
 {
 	struct ftrace_mod_map *mod_map;
 	struct ftrace_mod_map *n;
@@ -5773,6 +5816,17 @@ void ftrace_release_mod(struct module *mod)
 	}
 }
 
+void ftrace_release_mod(struct module *mod)
+{
+	ftrace_release_dyn(mod);
+
+#ifdef CONFIG_FTRACE_FUNC_PROTOTYPE
+	ftrace_process_funcproto(mod, mod->funcproto_start,
+			(void *)mod->funcproto_start + mod->funcproto_sec_size,
+			true);
+#endif
+}
+
 void ftrace_module_enable(struct module *mod)
 {
 	struct dyn_ftrace *rec;
@@ -5852,6 +5906,11 @@ void ftrace_module_init(struct module *mod)
 
 	ftrace_process_locs(mod, mod->ftrace_callsites,
 			    mod->ftrace_callsites + mod->num_ftrace_callsites);
+#ifdef CONFIG_FTRACE_FUNC_PROTOTYPE
+	ftrace_process_funcproto(mod, mod->funcproto_start,
+			(void *)mod->funcproto_start + mod->funcproto_sec_size,
+			false);
+#endif
 }
 
 static void save_ftrace_mod_rec(struct ftrace_mod_map *mod_map,
@@ -6146,6 +6205,10 @@ void __init ftrace_init(void)
 {
 	extern unsigned long __start_mcount_loc[];
 	extern unsigned long __stop_mcount_loc[];
+#ifdef CONFIG_FTRACE_FUNC_PROTOTYPE
+	extern struct func_prototype __start_funcproto[];
+	extern struct func_prototype __stop_funcproto[];
+#endif
 	unsigned long count, flags;
 	int ret;
 
@@ -6179,6 +6242,17 @@ void __init ftrace_init(void)
 				  __start_mcount_loc,
 				  __stop_mcount_loc);
 
+#ifdef CONFIG_FTRACE_FUNC_PROTOTYPE
+	ftrace_prototype_hash = alloc_ftrace_hash(FTRACE_HASH_DEFAULT_BITS);
+	if (WARN_ON(!ftrace_prototype_hash))
+		goto failed;
+
+	ftrace_process_funcproto(NULL,
+				 __start_funcproto,
+				 __stop_funcproto,
+				 false);
+#endif
+
 	set_ftrace_early_filters();
 
 	return;
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index ad619c73a505..22433a15e340 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -940,6 +940,10 @@ extern void __trace_graph_return(struct trace_array *tr,
 extern struct ftrace_hash *ftrace_graph_hash;
 extern struct ftrace_hash *ftrace_graph_notrace_hash;
 
+#ifdef CONFIG_FTRACE_FUNC_PROTOTYPE
+extern struct ftrace_hash *ftrace_prototype_hash;
+#endif
+
 static inline int ftrace_graph_addr(struct ftrace_graph_ent *trace)
 {
 	unsigned long addr = trace->func;
-- 
2.20.1

