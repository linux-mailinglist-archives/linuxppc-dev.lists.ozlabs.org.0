Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D95E690B26
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 14:58:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCJPM1MV5z3fBq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 00:58:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=slW/zNLm;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LI9oqUHU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=slW/zNLm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LI9oqUHU;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCJKL2Ksbz3chK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 00:55:18 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3F99422A1C;
	Thu,  9 Feb 2023 13:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1675950915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZwfR56fbuvo/MTtNd66Z0ieJlINfxnc673WXqwCPhUo=;
	b=slW/zNLmt7PqCtBY4PkTg9bqTEq4TrXg9jivZrHOg9VS7y44jRth1wfoUs6OmGfKzDIZQ+
	7k8F/9ABuOMEi2WVRYf/Q+dJUD9b3jLf7AzbI3F6vYbT1pdO02IHzFLyky3vumxhxlmhxl
	yAyUkiVrlNVKnZf6egj45VUmx7u18AE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1675950915;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZwfR56fbuvo/MTtNd66Z0ieJlINfxnc673WXqwCPhUo=;
	b=LI9oqUHUjxx48qBXEZ1ggfFn05NONmrCTtN5Yt57T+rCVaMLahL9D+GGqUzaZtpgaOtm0O
	A56+cDKRDTGNqcBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E47CF13915;
	Thu,  9 Feb 2023 13:55:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id mBXLNkL75GNTfwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 13:55:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	geoff@infradead.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH 09/11] driver/ps3: Include <video/cmdline.h> for mode parsing
Date: Thu,  9 Feb 2023 14:55:07 +0100
Message-Id: <20230209135509.7786-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209135509.7786-1-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Include <video/cmdline.h> in ps3av.c to get video_get_options() and
avoid the dependency on <linux/fb.h>. The replaced function
fb_get_options() is just a tiny wrapper around video_get_opions(). No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/ps3/ps3av.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/ps3/ps3av.c b/drivers/ps3/ps3av.c
index 8f3e60f1bfe2..f6c9e56bdba7 100644
--- a/drivers/ps3/ps3av.c
+++ b/drivers/ps3/ps3av.c
@@ -11,13 +11,14 @@
 #include <linux/delay.h>
 #include <linux/notifier.h>
 #include <linux/ioctl.h>
-#include <linux/fb.h>
 #include <linux/slab.h>
 
 #include <asm/firmware.h>
 #include <asm/ps3av.h>
 #include <asm/ps3.h>
 
+#include <video/cmdline.h>
+
 #include "vuart.h"
 
 #define BUFSIZE          4096	/* vuart buf size */
@@ -921,9 +922,7 @@ EXPORT_SYMBOL_GPL(ps3av_audio_mute);
 
 static int ps3av_probe(struct ps3_system_bus_device *dev)
 {
-#ifdef CONFIG_FB
-	char *mode_option = NULL;
-#endif
+	const char *mode_option;
 	int res;
 	int id;
 
@@ -971,14 +970,9 @@ static int ps3av_probe(struct ps3_system_bus_device *dev)
 
 	ps3av_get_hw_conf(ps3av);
 
-#ifdef CONFIG_FB
-	fb_get_options(NULL, &mode_option);
-	if (mode_option) {
-		if (!strcmp(mode_option, "safe"))
-			safe_mode = 1;
-		kfree(mode_option);
-	}
-#endif /* CONFIG_FB */
+	mode_option = video_get_options(NULL);
+	if (mode_option && !strcmp(mode_option, "safe"))
+		safe_mode = 1;
 	id = ps3av_auto_videomode(&ps3av->av_hw_conf);
 	if (id < 0) {
 		printk(KERN_ERR "%s: invalid id :%d\n", __func__, id);
-- 
2.39.1

