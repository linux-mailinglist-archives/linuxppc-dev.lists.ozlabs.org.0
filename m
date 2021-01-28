Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F169307E22
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 19:39:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRTlj3tlzzDsVK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 05:39:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+81cfe4b7420194b52767+6367+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=hNTZWMk/; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRTDk6nXTzDrYf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 05:16:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=whdfL/tlLmNfOgTI4yN4C4LjV+sKymW02WfCUP2FJCE=; b=hNTZWMk/3xUGs41flRK2WV8tDQ
 crMXkrqFncwDkVMy4OF1hYfSiHzkIQ7s92N+qTpA6CY0P3QxKZ+/FzY8Yp5pV1D++0JDztsjK+jEo
 w7WQfn1XPnjpD1x0YoMj7uqWdkRU5kKVoVXm2UpRzBdNLlWl2phVz4lBCpiXIwfenbFXiAIgKJtiR
 CsJNQcboQpScAo5EsMDZA9H6/bCg95lqfKpZeI9SN5p1Dk2xQJNh43cAt5gGrsXoHr5hoMZRXq7e9
 HsFC6dbJvCZMNPlZ+FX6ywMEzlILABpIfizFZn+JWPGPMWCBBLY+uyN6Qc69gKiQEZtjAg9p5pAAj
 ZjcU0/gg==;
Received: from [2001:4bb8:198:6bf4:e052:196b:7e32:37d9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l5BpX-008o1i-L5; Thu, 28 Jan 2021 18:15:44 +0000
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
Subject: [PATCH 11/13] module: move struct symsearch to module.c
Date: Thu, 28 Jan 2021 19:14:19 +0100
Message-Id: <20210128181421.2279-12-hch@lst.de>
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

struct symsearch is only used inside of module.h, so move the definition
out of module.h.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/module.h | 11 -----------
 kernel/module.c        | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 0f360c48fe92a6..da0f5966ee80c9 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -587,17 +587,6 @@ static inline bool within_module(unsigned long addr, const struct module *mod)
 /* Search for module by name: must be in a RCU-sched critical section. */
 struct module *find_module(const char *name);
 
-struct symsearch {
-	const struct kernel_symbol *start, *stop;
-	const s32 *crcs;
-	enum mod_license {
-		NOT_GPL_ONLY,
-		GPL_ONLY,
-		WILL_BE_GPL_ONLY,
-	} license;
-	bool unused;
-};
-
 /* Returns 0 and fills in value, defined and namebuf, or -ERANGE if
    symnum out of range. */
 int module_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
diff --git a/kernel/module.c b/kernel/module.c
index f1441d39c015f5..576c780e79c799 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -433,6 +433,17 @@ extern const s32 __start___kcrctab_unused_gpl[];
 #define symversion(base, idx) ((base != NULL) ? ((base) + (idx)) : NULL)
 #endif
 
+struct symsearch {
+	const struct kernel_symbol *start, *stop;
+	const s32 *crcs;
+	enum mod_license {
+		NOT_GPL_ONLY,
+		GPL_ONLY,
+		WILL_BE_GPL_ONLY,
+	} license;
+	bool unused;
+};
+
 struct find_symbol_arg {
 	/* Input */
 	const char *name;
-- 
2.29.2

