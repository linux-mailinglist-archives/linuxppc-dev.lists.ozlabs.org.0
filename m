Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2F930D0EF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 02:43:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVkx86q6pzDqnF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 12:43:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+78410b086ab5a19d433c+6372+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=Nvd24owx; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVNz065J4zDqSR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 23:14:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=8NxK820uFUydC9QGaqCC8FKN2i1E7yLrklCQP+JUF/Y=; b=Nvd24owxzlLlfxwU5CdyHv0gP6
 v2r+G5RzDJ0QgLCJJp3dS/1GGIXWUJPZb5TyM3Ju2IKb6tFlgAZFLmNdfDUNgQ4GLdNKrf1AaelKe
 A5RRzqmBjgw624Cttt1t5foDV45qMKnN5Ccz/g95NIrz3jZCzd394/KpbkWzMgrqdCUlaotFstKaP
 g7IEuLkgfi3mpPFsh6+vpVczTsSPYnFUQVp4ugAsNDaO6cX7kZWj1XUxTEO4AuqwidwhMDGuESv/U
 1q3xWs5eqwYIFNjb+wOyT9V3PIA/oyWAdDF6yHKB6WQO4pKWPRxl+ggc479VBRGUtNLPP3EDR/iP0
 mCSF3Qjg==;
Received: from [2001:4bb8:198:6bf4:7f38:755e:a6e0:73e9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l6uZB-00FAMg-7C; Tue, 02 Feb 2021 12:13:57 +0000
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
Subject: [PATCH 08/13] module: remove each_symbol_in_section
Date: Tue,  2 Feb 2021 13:13:29 +0100
Message-Id: <20210202121334.1361503-9-hch@lst.de>
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

each_symbol_in_section just contains a trivial loop over its arguments.
Just open code the loop in the two callers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/module.c | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/kernel/module.c b/kernel/module.c
index 1635656d47654a..b050c836a0061f 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -428,30 +428,13 @@ extern const s32 __start___kcrctab_unused_gpl[];
 #define symversion(base, idx) ((base != NULL) ? ((base) + (idx)) : NULL)
 #endif
 
-static bool each_symbol_in_section(const struct symsearch *arr,
-				   unsigned int arrsize,
-				   struct module *owner,
-				   bool (*fn)(const struct symsearch *syms,
-					      struct module *owner,
-					      void *data),
-				   void *data)
-{
-	unsigned int j;
-
-	for (j = 0; j < arrsize; j++) {
-		if (fn(&arr[j], owner, data))
-			return true;
-	}
-
-	return false;
-}
-
 /* Returns true as soon as fn returns true, otherwise false. */
 static bool each_symbol_section(bool (*fn)(const struct symsearch *arr,
 				    struct module *owner,
 				    void *data),
 			 void *data)
 {
+	unsigned int i;
 	struct module *mod;
 	static const struct symsearch arr[] = {
 		{ __start___ksymtab, __stop___ksymtab, __start___kcrctab,
@@ -474,8 +457,9 @@ static bool each_symbol_section(bool (*fn)(const struct symsearch *arr,
 
 	module_assert_mutex_or_preempt();
 
-	if (each_symbol_in_section(arr, ARRAY_SIZE(arr), NULL, fn, data))
-		return true;
+	for (i = 0; i < ARRAY_SIZE(arr); i++)
+		if (fn(&arr[i], NULL, data))
+			return true;
 
 	list_for_each_entry_rcu(mod, &modules, list,
 				lockdep_is_held(&module_mutex)) {
@@ -504,8 +488,9 @@ static bool each_symbol_section(bool (*fn)(const struct symsearch *arr,
 		if (mod->state == MODULE_STATE_UNFORMED)
 			continue;
 
-		if (each_symbol_in_section(arr, ARRAY_SIZE(arr), mod, fn, data))
-			return true;
+		for (i = 0; i < ARRAY_SIZE(arr); i++)
+			if (fn(&arr[i], mod, data))
+				return true;
 	}
 	return false;
 }
-- 
2.29.2

