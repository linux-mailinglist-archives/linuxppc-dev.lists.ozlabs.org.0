Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E642FE487
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 09:01:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLvww0CZSzDr9M
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 19:01:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+5b2bf2cc950c4867fd89+6360+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=Ktv0btKA; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLvmN1gMxzDr41
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 18:54:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=GGrjojACjhG+8+TH5sgivGQzb3BJ/eSauJM3q5KfBTs=; b=Ktv0btKAweC7bgWiS0Tq9kQcDq
 lur3JwNvnp9BIFyDhZcmUI1H3pxmjd/ZLvA2pRyULJoTJauKkKBe3DSoBTDJQV1JqQkoFJq9Bggb/
 9fo/7N4p/S2mX+gKVtR2JCvftPc1c+niZwyH3x8iQYowJRjI1y9N55LbKj6NZXHZ9lNyh1bcQc0is
 82naw907YI2rbhBZ6CTkkzH9BFv9pwJu+HRnB8QYUDtNr1CDTSoaXl2Sx7RwAd218qaJbpAr0dal1
 UFAfSxVf8j/5ACKYD7rhFBOTJkxhehMlzgqP21VL+D/N0FubU73KdhAX/7mIcfo+iJ4E5TJ9qGcpg
 z/nWA2Ug==;
Received: from [2001:4bb8:188:1954:d5b3:2657:287:e45f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l2Umc-00Gm60-80; Thu, 21 Jan 2021 07:53:35 +0000
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
Subject: [PATCH 03/13] livepatch: refactor klp_init_object
Date: Thu, 21 Jan 2021 08:49:49 +0100
Message-Id: <20210121074959.313333-4-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121074959.313333-1-hch@lst.de>
References: <20210121074959.313333-1-hch@lst.de>
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

Merge three calls to klp_is_module (including one hidden inside
klp_find_object_module) into a single one to simplify the code a bit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/livepatch/core.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index f76fdb9255323d..a7f625dc24add3 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -54,9 +54,6 @@ static void klp_find_object_module(struct klp_object *obj)
 {
 	struct module *mod;
 
-	if (!klp_is_module(obj))
-		return;
-
 	mutex_lock(&module_mutex);
 	/*
 	 * We do not want to block removal of patched modules and therefore
@@ -73,7 +70,6 @@ static void klp_find_object_module(struct klp_object *obj)
 	 */
 	if (mod && mod->klp_alive)
 		obj->mod = mod;
-
 	mutex_unlock(&module_mutex);
 }
 
@@ -823,15 +819,19 @@ static int klp_init_object(struct klp_patch *patch, struct klp_object *obj)
 	int ret;
 	const char *name;
 
-	if (klp_is_module(obj) && strlen(obj->name) >= MODULE_NAME_LEN)
-		return -EINVAL;
-
 	obj->patched = false;
 	obj->mod = NULL;
 
-	klp_find_object_module(obj);
+	if (klp_is_module(obj)) {
+		if (strlen(obj->name) >= MODULE_NAME_LEN)
+			return -EINVAL;
+		name = obj->name;
+
+		klp_find_object_module(obj);
+	} else {
+		name = "vmlinux";
+	}
 
-	name = klp_is_module(obj) ? obj->name : "vmlinux";
 	ret = kobject_add(&obj->kobj, &patch->kobj, "%s", name);
 	if (ret)
 		return ret;
-- 
2.29.2

