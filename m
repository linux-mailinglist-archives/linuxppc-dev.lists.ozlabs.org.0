Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B649D307E20
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 19:37:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRTjV4jT5zDsQg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 05:37:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+81cfe4b7420194b52767+6367+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=Y/CJPI4y; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRTDf63mzzDrgj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 05:16:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=4hEp4wFOeFEctoLF9/twuUfnYNlzjyJJa7IvAmNqN1c=; b=Y/CJPI4y8EYyfzB2OLpX7J4JN5
 OOOp6GAIbGiql+SaEfg3zrWvctrt2R7/7tuxxFown2gL85J2bhozD4uwmRRChnoYG4jMCtf9ZYgO4
 MdjUoWYvJKsTWRNkPzupPBEtwkTNf8P6pEG906oNjqVgWo9hRWEjJDsDYf5qE/+oEfE0q686LVWAK
 Lnt0EEYsBE4lsVjcu2achuNfoFSDnI2LfZr5c9Hp33UHhNTOhgjhiJHhZJkRYAlTI5MmGJo29f8do
 dWBShOok7xdf+pbcTw00DZURt14OpHcypoKpy/g8VSte1Mi2diyst8K7epixVOsShxxckd18KXpKM
 3ZbE6H1g==;
Received: from [2001:4bb8:198:6bf4:e052:196b:7e32:37d9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l5BpS-008o0k-5E; Thu, 28 Jan 2021 18:15:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jessica Yu <jeyu@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>
Subject: [PATCH 10/13] module: pass struct find_symbol_args to find_symbol
Date: Thu, 28 Jan 2021 19:14:18 +0100
Message-Id: <20210128181421.2279-11-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128181421.2279-1-hch@lst.de>
References: <20210128181421.2279-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, live-patching@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Simplify the calling convention by passing the find_symbol_args structure
to find_symbol instead of initializing it inside the function.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/module.c | 113 ++++++++++++++++++++++--------------------------
 1 file changed, 52 insertions(+), 61 deletions(-)

diff --git a/kernel/module.c b/kernel/module.c
index ff9045cc984b50..f1441d39c015f5 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -536,12 +536,7 @@ static bool find_exported_symbol_in_section(const struct symsearch *syms,
  * Find an exported symbol and return it, along with, (optional) crc and
  * (optional) module which owns it.  Needs preempt disabled or module_mutex.
  */
-static const struct kernel_symbol *find_symbol(const char *name,
-					struct module **owner,
-					const s32 **crc,
-					enum mod_license *license,
-					bool gplok,
-					bool warn)
+static bool find_symbol(struct find_symbol_arg *fsa)
 {
 	static const struct symsearch arr[] = {
 		{ __start___ksymtab, __stop___ksymtab, __start___kcrctab,
@@ -561,19 +556,14 @@ static const struct kernel_symbol *find_symbol(const char *name,
 		  GPL_ONLY, true },
 #endif
 	};
-	struct find_symbol_arg fsa = {
-		.name = name,
-		.gplok = gplok,
-		.warn = warn,
-	};
 	struct module *mod;
 	unsigned int i;
 
 	module_assert_mutex_or_preempt();
 
 	for (i = 0; i < ARRAY_SIZE(arr); i++)
-		if (find_exported_symbol_in_section(&arr[i], NULL, &fsa))
-			goto found;
+		if (find_exported_symbol_in_section(&arr[i], NULL, fsa))
+			return true;
 
 	list_for_each_entry_rcu(mod, &modules, list,
 				lockdep_is_held(&module_mutex)) {
@@ -603,21 +593,12 @@ static const struct kernel_symbol *find_symbol(const char *name,
 			continue;
 
 		for (i = 0; i < ARRAY_SIZE(arr); i++)
-			if (find_exported_symbol_in_section(&arr[i], mod, &fsa))
-				goto found;
+			if (find_exported_symbol_in_section(&arr[i], mod, fsa))
+				return true;
 	}
 
-	pr_debug("Failed to find symbol %s\n", name);
-	return NULL;
-
-found:
-	if (owner)
-		*owner = fsa.owner;
-	if (crc)
-		*crc = fsa.crc;
-	if (license)
-		*license = fsa.license;
-	return fsa.sym;
+	pr_debug("Failed to find symbol %s\n", fsa->name);
+	return false;
 }
 
 /*
@@ -1079,12 +1060,15 @@ static inline void print_unload_info(struct seq_file *m, struct module *mod)
 
 void __symbol_put(const char *symbol)
 {
-	struct module *owner;
+	struct find_symbol_arg fsa = {
+		.name	= symbol,
+		.gplok	= true,
+	};
 
 	preempt_disable();
-	if (!find_symbol(symbol, &owner, NULL, NULL, true, false))
+	if (!find_symbol(&fsa))
 		BUG();
-	module_put(owner);
+	module_put(fsa.owner);
 	preempt_enable();
 }
 EXPORT_SYMBOL(__symbol_put);
@@ -1353,19 +1337,22 @@ static int check_version(const struct load_info *info,
 static inline int check_modstruct_version(const struct load_info *info,
 					  struct module *mod)
 {
-	const s32 *crc;
+	struct find_symbol_arg fsa = {
+		.name	= "module_layout",
+		.gplok	= true,
+	};
 
 	/*
 	 * Since this should be found in kernel (which can't be removed), no
 	 * locking is necessary -- use preempt_disable() to placate lockdep.
 	 */
 	preempt_disable();
-	if (!find_symbol("module_layout", NULL, &crc, NULL, true, false)) {
+	if (!find_symbol(&fsa)) {
 		preempt_enable();
 		BUG();
 	}
 	preempt_enable();
-	return check_version(info, "module_layout", mod, crc);
+	return check_version(info, "module_layout", mod, fsa.crc);
 }
 
 /* First part is kernel version, which we ignore if module has crcs. */
@@ -1459,10 +1446,11 @@ static const struct kernel_symbol *resolve_symbol(struct module *mod,
 						  const char *name,
 						  char ownername[])
 {
-	struct module *owner;
-	const struct kernel_symbol *sym;
-	const s32 *crc;
-	enum mod_license license;
+	struct find_symbol_arg fsa = {
+		.name	= name,
+		.gplok	= !(mod->taints & (1 << TAINT_PROPRIETARY_MODULE)),
+		.warn	= true,
+	};
 	int err;
 
 	/*
@@ -1472,42 +1460,40 @@ static const struct kernel_symbol *resolve_symbol(struct module *mod,
 	 */
 	sched_annotate_sleep();
 	mutex_lock(&module_mutex);
-	sym = find_symbol(name, &owner, &crc, &license,
-			  !(mod->taints & (1 << TAINT_PROPRIETARY_MODULE)), true);
-	if (!sym)
+	if (!find_symbol(&fsa))
 		goto unlock;
 
-	if (license == GPL_ONLY)
+	if (fsa.license == GPL_ONLY)
 		mod->using_gplonly_symbols = true;
 
-	if (!inherit_taint(mod, owner)) {
-		sym = NULL;
+	if (!inherit_taint(mod, fsa.owner)) {
+		fsa.sym = NULL;
 		goto getname;
 	}
 
-	if (!check_version(info, name, mod, crc)) {
-		sym = ERR_PTR(-EINVAL);
+	if (!check_version(info, name, mod, fsa.crc)) {
+		fsa.sym = ERR_PTR(-EINVAL);
 		goto getname;
 	}
 
-	err = verify_namespace_is_imported(info, sym, mod);
+	err = verify_namespace_is_imported(info, fsa.sym, mod);
 	if (err) {
-		sym = ERR_PTR(err);
+		fsa.sym = ERR_PTR(err);
 		goto getname;
 	}
 
-	err = ref_module(mod, owner);
+	err = ref_module(mod, fsa.owner);
 	if (err) {
-		sym = ERR_PTR(err);
+		fsa.sym = ERR_PTR(err);
 		goto getname;
 	}
 
 getname:
 	/* We must make copy under the lock if we failed to get ref. */
-	strncpy(ownername, module_name(owner), MODULE_NAME_LEN);
+	strncpy(ownername, module_name(fsa.owner), MODULE_NAME_LEN);
 unlock:
 	mutex_unlock(&module_mutex);
-	return sym;
+	return fsa.sym;
 }
 
 static const struct kernel_symbol *
@@ -2268,16 +2254,19 @@ static void free_module(struct module *mod)
 
 void *__symbol_get(const char *symbol)
 {
-	struct module *owner;
-	const struct kernel_symbol *sym;
+	struct find_symbol_arg fsa = {
+		.name	= symbol,
+		.gplok	= true,
+		.warn	= true,
+	};
 
 	preempt_disable();
-	sym = find_symbol(symbol, &owner, NULL, NULL, true, true);
-	if (sym && strong_try_module_get(owner))
-		sym = NULL;
+	if (!find_symbol(&fsa) || !strong_try_module_get(fsa.owner)) {
+		preempt_enable();
+		return NULL;
+	}
 	preempt_enable();
-
-	return sym ? (void *)kernel_symbol_value(sym) : NULL;
+	return (void *)kernel_symbol_value(fsa.sym);
 }
 EXPORT_SYMBOL_GPL(__symbol_get);
 
@@ -2290,7 +2279,6 @@ EXPORT_SYMBOL_GPL(__symbol_get);
 static int verify_exported_symbols(struct module *mod)
 {
 	unsigned int i;
-	struct module *owner;
 	const struct kernel_symbol *s;
 	struct {
 		const struct kernel_symbol *sym;
@@ -2307,12 +2295,15 @@ static int verify_exported_symbols(struct module *mod)
 
 	for (i = 0; i < ARRAY_SIZE(arr); i++) {
 		for (s = arr[i].sym; s < arr[i].sym + arr[i].num; s++) {
-			if (find_symbol(kernel_symbol_name(s), &owner, NULL,
-					NULL, true, false)) {
+			struct find_symbol_arg fsa = {
+				.name	= kernel_symbol_name(s),
+				.gplok	= true,
+			};
+			if (find_symbol(&fsa)) {
 				pr_err("%s: exports duplicate symbol %s"
 				       " (owned by %s)\n",
 				       mod->name, kernel_symbol_name(s),
-				       module_name(owner));
+				       module_name(fsa.owner));
 				return -ENOEXEC;
 			}
 		}
-- 
2.29.2

