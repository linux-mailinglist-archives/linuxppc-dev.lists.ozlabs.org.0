Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E80E430ACA1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 17:31:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTtjq4VFYzDrQM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 03:31:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTtg82tJKzDrNZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 03:28:49 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A28F56736F; Mon,  1 Feb 2021 17:28:42 +0100 (CET)
Date: Mon, 1 Feb 2021 17:28:42 +0100
From: Christoph Hellwig <hch@lst.de>
To: Miroslav Benes <mbenes@suse.cz>
Subject: Re: [PATCH 05/13] kallsyms: refactor {,module_}kallsyms_on_each_symbol
Message-ID: <20210201162842.GB7276@lst.de>
References: <20210128181421.2279-1-hch@lst.de>
 <20210128181421.2279-6-hch@lst.de> <YBPYyEvesLMrRtZM@alley>
 <20210201114749.GB19696@lst.de>
 <alpine.LSU.2.21.2102011436320.21637@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.21.2102011436320.21637@pobox.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Petr Mladek <pmladek@suse.com>, Jiri Kosina <jikos@kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 live-patching@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
 Joe Lawrence <joe.lawrence@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Jessica Yu <jeyu@kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 01, 2021 at 02:37:12PM +0100, Miroslav Benes wrote:
> > > This change is not needed. (objname == NULL) means that we are
> > > interested only in symbols in "vmlinux".
> > > 
> > > module_kallsyms_on_each_symbol(klp_find_callback, &args)
> > > will always fail when objname == NULL.
> > 
> > I just tried to keep the old behavior.  I can respin it with your
> > recommended change noting the change in behavior, though.
> 
> Yes, please. It would be cleaner that way.

Let me know if this works for you:

---
From 18af41e88d088cfb8680d1669fcae2bc2ede5328 Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Wed, 20 Jan 2021 16:23:16 +0100
Subject: kallsyms: refactor {,module_}kallsyms_on_each_symbol

Require an explicit call to module_kallsyms_on_each_symbol to look
for symbols in modules instead of the call from kallsyms_on_each_symbol,
and acquire module_mutex inside of module_kallsyms_on_each_symbol instead
of leaving that up to the caller.  Note that this slightly changes the
behavior for the livepatch code in that the symbols from vmlinux are not
iterated anymore if objname is set, but that actually is the desired
behavior in this case.

Signed-off-by: Christoph Hellwig <hch@lst.de>
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

