Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DF230D0E5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 02:38:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVkpk12fkzDrgw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 12:38:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+78410b086ab5a19d433c+6372+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=nZ+T+b9G; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVNym028TzDqSR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 23:14:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Nt3OH/j8x3/E3EkxymSc5d71PS1AjT6KFPt4K6BMIsQ=; b=nZ+T+b9GD5oLErWBB4jZj+iTsh
 tG9ykvdy/X7hETt+BBVa1DA7rIxv6b2pCYO0kJmwmbOfzqjScubyewfLqvho8w2kmdwYW0NL1Lzs4
 848O6Y4vzqMBFvWe68kRlP/JSpbZbBmVGaOsK60ysi80LyMa8Lf0V+oUp2dZjj96bbgi9kaKUHQq3
 oyjU/HyX7aeodA+kTGRWAsC5VxhKUFiDV85pf9uDJ2HjHS78n7be1AMIJrto68QGpW0+lyT7UjClo
 +ENT94VOWmypwqAxsEZFDx+WA5M8psyTZb5VjJsh0D7KYreuiNDUwQ/+sI8RwHifY1WqBCdc1xqR8
 KhL3DknA==;
Received: from [2001:4bb8:198:6bf4:7f38:755e:a6e0:73e9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l6uZ1-00FALm-V6; Tue, 02 Feb 2021 12:13:48 +0000
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
Subject: [PATCH 05/13] kallsyms: refactor {,module_}kallsyms_on_each_symbol
Date: Tue,  2 Feb 2021 13:13:26 +0100
Message-Id: <20210202121334.1361503-6-hch@lst.de>
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

Require an explicit call to module_kallsyms_on_each_symbol to look
for symbols in modules instead of the call from kallsyms_on_each_symbol,
and acquire module_mutex inside of module_kallsyms_on_each_symbol instead
of leaving that up to the caller.  Note that this slightly changes the
behavior for the livepatch code in that the symbols from vmlinux are not
iterated anymore if objname is set, but that actually is the desired
behavior in this case.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Miroslav Benes <mbenes@suse.cz>
---
 kernel/kallsyms.c       |  6 +++++-
 kernel/livepatch/core.c |  2 --
 kernel/module.c         | 13 ++++---------
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index fe9de067771c34..a0d3f0865916f9 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -177,6 +177,10 @@ unsigned long kallsyms_lookup_name(const char *name)
 	return module_kallsyms_lookup_name(name);
 }
 
+/*
+ * Iterate over all symbols in vmlinux.  For symbols from modules use
+ * module_kallsyms_on_each_symbol instead.
+ */
 int kallsyms_on_each_symbol(int (*fn)(void *, const char *, struct module *,
 				      unsigned long),
 			    void *data)
@@ -192,7 +196,7 @@ int kallsyms_on_each_symbol(int (*fn)(void *, const char *, struct module *,
 		if (ret != 0)
 			return ret;
 	}
-	return module_kallsyms_on_each_symbol(fn, data);
+	return 0;
 }
 
 static unsigned long get_symbol_pos(unsigned long addr,
diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index 262cd9b003b9f0..335d988bd81117 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -164,12 +164,10 @@ static int klp_find_object_symbol(const char *objname, const char *name,
 		.pos = sympos,
 	};
 
-	mutex_lock(&module_mutex);
 	if (objname)
 		module_kallsyms_on_each_symbol(klp_find_callback, &args);
 	else
 		kallsyms_on_each_symbol(klp_find_callback, &args);
-	mutex_unlock(&module_mutex);
 
 	/*
 	 * Ensure an address was found. If sympos is 0, ensure symbol is unique;
diff --git a/kernel/module.c b/kernel/module.c
index 6772fb2680eb3e..25345792c770d1 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -255,11 +255,6 @@ static void mod_update_bounds(struct module *mod)
 struct list_head *kdb_modules = &modules; /* kdb needs the list of modules */
 #endif /* CONFIG_KGDB_KDB */
 
-static void module_assert_mutex(void)
-{
-	lockdep_assert_held(&module_mutex);
-}
-
 static void module_assert_mutex_or_preempt(void)
 {
 #ifdef CONFIG_LOCKDEP
@@ -4379,8 +4374,7 @@ int module_kallsyms_on_each_symbol(int (*fn)(void *, const char *,
 	unsigned int i;
 	int ret;
 
-	module_assert_mutex();
-
+	mutex_lock(&module_mutex);
 	list_for_each_entry(mod, &modules, list) {
 		/* We hold module_mutex: no need for rcu_dereference_sched */
 		struct mod_kallsyms *kallsyms = mod->kallsyms;
@@ -4396,10 +4390,11 @@ int module_kallsyms_on_each_symbol(int (*fn)(void *, const char *,
 			ret = fn(data, kallsyms_symbol_name(kallsyms, i),
 				 mod, kallsyms_symbol_value(sym));
 			if (ret != 0)
-				return ret;
+				break;
 		}
 	}
-	return 0;
+	mutex_unlock(&module_mutex);
+	return ret;
 }
 #endif /* CONFIG_KALLSYMS */
 
-- 
2.29.2

