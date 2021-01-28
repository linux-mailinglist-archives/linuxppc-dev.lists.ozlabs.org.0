Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E388307DE5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 19:27:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRTTn6jvvzDr3B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 05:27:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+81cfe4b7420194b52767+6367+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=cqZuyvYR; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRTD723HgzDrdp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 05:15:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=7XGAY7yvj4y7G092iC+u/MlLzi5B5Wf+JlZcTn93bqM=; b=cqZuyvYRD8sBU527A0A+piP4Wx
 PoRrWGMshCEFWqgtDYa2pB4HpQJ2wNkmRTeQW/xKMcdnvfP5jrco7AO9Pb+okH5NKvIPsFOPDtbaT
 wAL4ZYK39HWhI6DAHfKoY0lY3RA/BtGrN2xVjnN2t6NMhWI9tG/3Q/0vw+Q/w6fvfmxWDdbEDZokz
 wQgNByrIaLETMBTYh482R32UM7fZBAvt5/cn27F7mF5uW+DZ2Jlfe8d41TMM8hBoxFiqScuAUK/Xz
 QeFpS2JfaPKe1iYiv6GHJSrashFymPb+vbyU7ukcrbG3BjRUJD7c/psx31m89Pc7nhN5ol+jLAtTF
 +PUIlClw==;
Received: from [2001:4bb8:198:6bf4:e052:196b:7e32:37d9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l5Boo-008ns7-D7; Thu, 28 Jan 2021 18:15:01 +0000
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
Date: Thu, 28 Jan 2021 19:14:13 +0100
Message-Id: <20210128181421.2279-6-hch@lst.de>
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

Require an explicit call to module_kallsyms_on_each_symbol to look
for symbols in modules instead of the call from kallsyms_on_each_symbol,
and acquire module_mutex inside of module_kallsyms_on_each_symbol instead
of leaving that up to the caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/kallsyms.c       | 6 +++++-
 kernel/livepatch/core.c | 6 +-----
 kernel/module.c         | 8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

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
index 262cd9b003b9f0..f591dac5e86ef4 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -164,12 +164,8 @@ static int klp_find_object_symbol(const char *objname, const char *name,
 		.pos = sympos,
 	};
 
-	mutex_lock(&module_mutex);
-	if (objname)
+	if (objname || !kallsyms_on_each_symbol(klp_find_callback, &args))
 		module_kallsyms_on_each_symbol(klp_find_callback, &args);
-	else
-		kallsyms_on_each_symbol(klp_find_callback, &args);
-	mutex_unlock(&module_mutex);
 
 	/*
 	 * Ensure an address was found. If sympos is 0, ensure symbol is unique;
diff --git a/kernel/module.c b/kernel/module.c
index 6772fb2680eb3e..ae9045c5292a78 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -4379,8 +4379,7 @@ int module_kallsyms_on_each_symbol(int (*fn)(void *, const char *,
 	unsigned int i;
 	int ret;
 
-	module_assert_mutex();
-
+	mutex_lock(&module_mutex);
 	list_for_each_entry(mod, &modules, list) {
 		/* We hold module_mutex: no need for rcu_dereference_sched */
 		struct mod_kallsyms *kallsyms = mod->kallsyms;
@@ -4396,10 +4395,11 @@ int module_kallsyms_on_each_symbol(int (*fn)(void *, const char *,
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

