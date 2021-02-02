Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EC930D0F3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 02:45:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVkz34t6bzDwhn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 12:45:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+78410b086ab5a19d433c+6372+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=JR+JJbOn; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVNz70Y0tzDqSR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 23:14:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=97OftF2Q/HTMw50tJtcQtMkdcMcdgN4HYCC7YO73f2o=; b=JR+JJbOnPAb52s3u2TRaOEdl+Y
 xT62sEBt5frAsIycVwYrc92pbb9jkwo58GsbOTW1y8q04G+pBHsFSJFL5ylH3rjqGo4q1koDoBdGB
 sDft4EIDcKHMIcrcbt9gDYKKBM45K5Acbjk4gn7npynD6w/XO6ZXO9ueikA4ZOx17ZgrXi1sIL6lT
 Ia1WyiUaQUmoF6NvrukLR2SraJHTV91dHCTz1A/RwQChqNSAmTmTaDBSKQvCqA9Kftb+chgkHqOso
 q6NDta5ZdXmvjspshDQJKpWh9m3qm11n9s7H7prc60TXItOsF5b1XcNYvEPxGPGYgYZ7UfERzk8ZJ
 smULbzug==;
Received: from [2001:4bb8:198:6bf4:7f38:755e:a6e0:73e9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l6uZE-00FAMy-8A; Tue, 02 Feb 2021 12:14:00 +0000
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
Subject: [PATCH 09/13] module: merge each_symbol_section into find_symbol
Date: Tue,  2 Feb 2021 13:13:30 +0100
Message-Id: <20210202121334.1361503-10-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202121334.1361503-1-hch@lst.de>
References: <20210202121334.1361503-1-hch@lst.de>
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

each_symbol_section is only called by find_symbol, so merge the two
functions.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/module.c | 148 ++++++++++++++++++++++--------------------------
 1 file changed, 69 insertions(+), 79 deletions(-)

diff --git a/kernel/module.c b/kernel/module.c
index b050c836a0061f..ab219a16f35068 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -428,73 +428,6 @@ extern const s32 __start___kcrctab_unused_gpl[];
 #define symversion(base, idx) ((base != NULL) ? ((base) + (idx)) : NULL)
 #endif
 
-/* Returns true as soon as fn returns true, otherwise false. */
-static bool each_symbol_section(bool (*fn)(const struct symsearch *arr,
-				    struct module *owner,
-				    void *data),
-			 void *data)
-{
-	unsigned int i;
-	struct module *mod;
-	static const struct symsearch arr[] = {
-		{ __start___ksymtab, __stop___ksymtab, __start___kcrctab,
-		  NOT_GPL_ONLY, false },
-		{ __start___ksymtab_gpl, __stop___ksymtab_gpl,
-		  __start___kcrctab_gpl,
-		  GPL_ONLY, false },
-		{ __start___ksymtab_gpl_future, __stop___ksymtab_gpl_future,
-		  __start___kcrctab_gpl_future,
-		  WILL_BE_GPL_ONLY, false },
-#ifdef CONFIG_UNUSED_SYMBOLS
-		{ __start___ksymtab_unused, __stop___ksymtab_unused,
-		  __start___kcrctab_unused,
-		  NOT_GPL_ONLY, true },
-		{ __start___ksymtab_unused_gpl, __stop___ksymtab_unused_gpl,
-		  __start___kcrctab_unused_gpl,
-		  GPL_ONLY, true },
-#endif
-	};
-
-	module_assert_mutex_or_preempt();
-
-	for (i = 0; i < ARRAY_SIZE(arr); i++)
-		if (fn(&arr[i], NULL, data))
-			return true;
-
-	list_for_each_entry_rcu(mod, &modules, list,
-				lockdep_is_held(&module_mutex)) {
-		struct symsearch arr[] = {
-			{ mod->syms, mod->syms + mod->num_syms, mod->crcs,
-			  NOT_GPL_ONLY, false },
-			{ mod->gpl_syms, mod->gpl_syms + mod->num_gpl_syms,
-			  mod->gpl_crcs,
-			  GPL_ONLY, false },
-			{ mod->gpl_future_syms,
-			  mod->gpl_future_syms + mod->num_gpl_future_syms,
-			  mod->gpl_future_crcs,
-			  WILL_BE_GPL_ONLY, false },
-#ifdef CONFIG_UNUSED_SYMBOLS
-			{ mod->unused_syms,
-			  mod->unused_syms + mod->num_unused_syms,
-			  mod->unused_crcs,
-			  NOT_GPL_ONLY, true },
-			{ mod->unused_gpl_syms,
-			  mod->unused_gpl_syms + mod->num_unused_gpl_syms,
-			  mod->unused_gpl_crcs,
-			  GPL_ONLY, true },
-#endif
-		};
-
-		if (mod->state == MODULE_STATE_UNFORMED)
-			continue;
-
-		for (i = 0; i < ARRAY_SIZE(arr); i++)
-			if (fn(&arr[i], mod, data))
-				return true;
-	}
-	return false;
-}
-
 struct find_symbol_arg {
 	/* Input */
 	const char *name;
@@ -605,24 +538,81 @@ static const struct kernel_symbol *find_symbol(const char *name,
 					bool gplok,
 					bool warn)
 {
-	struct find_symbol_arg fsa;
+	static const struct symsearch arr[] = {
+		{ __start___ksymtab, __stop___ksymtab, __start___kcrctab,
+		  NOT_GPL_ONLY, false },
+		{ __start___ksymtab_gpl, __stop___ksymtab_gpl,
+		  __start___kcrctab_gpl,
+		  GPL_ONLY, false },
+		{ __start___ksymtab_gpl_future, __stop___ksymtab_gpl_future,
+		  __start___kcrctab_gpl_future,
+		  WILL_BE_GPL_ONLY, false },
+#ifdef CONFIG_UNUSED_SYMBOLS
+		{ __start___ksymtab_unused, __stop___ksymtab_unused,
+		  __start___kcrctab_unused,
+		  NOT_GPL_ONLY, true },
+		{ __start___ksymtab_unused_gpl, __stop___ksymtab_unused_gpl,
+		  __start___kcrctab_unused_gpl,
+		  GPL_ONLY, true },
+#endif
+	};
+	struct find_symbol_arg fsa = {
+		.name = name,
+		.gplok = gplok,
+		.warn = warn,
+	};
+	struct module *mod;
+	unsigned int i;
+
+	module_assert_mutex_or_preempt();
+
+	for (i = 0; i < ARRAY_SIZE(arr); i++)
+		if (find_exported_symbol_in_section(&arr[i], NULL, &fsa))
+			goto found;
 
-	fsa.name = name;
-	fsa.gplok = gplok;
-	fsa.warn = warn;
+	list_for_each_entry_rcu(mod, &modules, list,
+				lockdep_is_held(&module_mutex)) {
+		struct symsearch arr[] = {
+			{ mod->syms, mod->syms + mod->num_syms, mod->crcs,
+			  NOT_GPL_ONLY, false },
+			{ mod->gpl_syms, mod->gpl_syms + mod->num_gpl_syms,
+			  mod->gpl_crcs,
+			  GPL_ONLY, false },
+			{ mod->gpl_future_syms,
+			  mod->gpl_future_syms + mod->num_gpl_future_syms,
+			  mod->gpl_future_crcs,
+			  WILL_BE_GPL_ONLY, false },
+#ifdef CONFIG_UNUSED_SYMBOLS
+			{ mod->unused_syms,
+			  mod->unused_syms + mod->num_unused_syms,
+			  mod->unused_crcs,
+			  NOT_GPL_ONLY, true },
+			{ mod->unused_gpl_syms,
+			  mod->unused_gpl_syms + mod->num_unused_gpl_syms,
+			  mod->unused_gpl_crcs,
+			  GPL_ONLY, true },
+#endif
+		};
 
-	if (each_symbol_section(find_exported_symbol_in_section, &fsa)) {
-		if (owner)
-			*owner = fsa.owner;
-		if (crc)
-			*crc = fsa.crc;
-		if (license)
-			*license = fsa.license;
-		return fsa.sym;
+		if (mod->state == MODULE_STATE_UNFORMED)
+			continue;
+
+		for (i = 0; i < ARRAY_SIZE(arr); i++)
+			if (find_exported_symbol_in_section(&arr[i], mod, &fsa))
+				goto found;
 	}
 
 	pr_debug("Failed to find symbol %s\n", name);
 	return NULL;
+
+found:
+	if (owner)
+		*owner = fsa.owner;
+	if (crc)
+		*crc = fsa.crc;
+	if (license)
+		*license = fsa.license;
+	return fsa.sym;
 }
 
 /*
-- 
2.29.2

