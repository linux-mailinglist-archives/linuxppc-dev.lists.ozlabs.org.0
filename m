Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5B830D0DC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 02:36:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVkmy0SYpzDr3M
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 12:36:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+78410b086ab5a19d433c+6372+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=S3XLWVvO; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVNyh6P3CzDr9S
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 23:14:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=XZTC5SIMvJdOEqgDU+iIbCSxaEGoFe1SHGfByrwd00g=; b=S3XLWVvOyKvKUYYqHqqt+ziNGW
 yJYK/kqQMGT1QCR9/vos9RUmeKJPxeHpkcazip+Yknz0VlFHQAFL8LW43Q49lmNcN7Ew5AgKEsqTY
 DW36OZVvxv8Mp+UJpRx+eVcgZo4eXZ9UA2dKuKGYj9b9a3m/gS+Xg6ETWat5E7Y6AjUj21wztjsf7
 ez1Xef7D21kx0aCFnYCwMi7D+2PBLd8iQdKg7Osu6/TkXJhl5Lt394F5YZqRVxek29x+V6lr3LFYz
 ovUQ1mEvxvJ2zZEQMcjIbUpCXkzLL7KzBVOpU+KSsY4pmesHVlECQFxfhk0PZMz+WLjSGyDCVw+Zf
 R5s+Snwg==;
Received: from [2001:4bb8:198:6bf4:7f38:755e:a6e0:73e9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l6uYz-00FALZ-GH; Tue, 02 Feb 2021 12:13:46 +0000
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
Subject: [PATCH 04/13] module: use RCU to synchronize find_module
Date: Tue,  2 Feb 2021 13:13:25 +0100
Message-Id: <20210202121334.1361503-5-hch@lst.de>
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

Allow for a RCU-sched critical section around find_module, following
the lower level find_module_all helper, and switch the two callers
outside of module.c to use such a RCU-sched critical section instead
of module_mutex.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Acked-by: Miroslav Benes <mbenes@suse.cz>
---
 include/linux/module.h      | 2 +-
 kernel/livepatch/core.c     | 5 +++--
 kernel/module.c             | 1 -
 kernel/trace/trace_kprobe.c | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 7a0bcb5b1ffccd..a64aa84d1b182c 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -586,7 +586,7 @@ static inline bool within_module(unsigned long addr, const struct module *mod)
 	return within_module_init(addr, mod) || within_module_core(addr, mod);
 }
 
-/* Search for module by name: must hold module_mutex. */
+/* Search for module by name: must be in a RCU-sched critical section. */
 struct module *find_module(const char *name);
 
 struct symsearch {
diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index f76fdb9255323d..262cd9b003b9f0 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -19,6 +19,7 @@
 #include <linux/moduleloader.h>
 #include <linux/completion.h>
 #include <linux/memory.h>
+#include <linux/rcupdate.h>
 #include <asm/cacheflush.h>
 #include "core.h"
 #include "patch.h"
@@ -57,7 +58,7 @@ static void klp_find_object_module(struct klp_object *obj)
 	if (!klp_is_module(obj))
 		return;
 
-	mutex_lock(&module_mutex);
+	rcu_read_lock_sched();
 	/*
 	 * We do not want to block removal of patched modules and therefore
 	 * we do not take a reference here. The patches are removed by
@@ -74,7 +75,7 @@ static void klp_find_object_module(struct klp_object *obj)
 	if (mod && mod->klp_alive)
 		obj->mod = mod;
 
-	mutex_unlock(&module_mutex);
+	rcu_read_unlock_sched();
 }
 
 static bool klp_initialized(void)
diff --git a/kernel/module.c b/kernel/module.c
index 981302f616b411..6772fb2680eb3e 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -668,7 +668,6 @@ static struct module *find_module_all(const char *name, size_t len,
 
 struct module *find_module(const char *name)
 {
-	module_assert_mutex();
 	return find_module_all(name, strlen(name), false);
 }
 
diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
index e6fba1798771b4..3137992baa5e7a 100644
--- a/kernel/trace/trace_kprobe.c
+++ b/kernel/trace/trace_kprobe.c
@@ -124,9 +124,9 @@ static nokprobe_inline bool trace_kprobe_module_exist(struct trace_kprobe *tk)
 	if (!p)
 		return true;
 	*p = '\0';
-	mutex_lock(&module_mutex);
+	rcu_read_lock_sched();
 	ret = !!find_module(tk->symbol);
-	mutex_unlock(&module_mutex);
+	rcu_read_unlock_sched();
 	*p = ':';
 
 	return ret;
-- 
2.29.2

