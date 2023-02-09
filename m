Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE60690B2B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 15:00:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCJRP1YWwz3fFp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 01:00:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0KCsbM2v;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lrX1a/nB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0KCsbM2v;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lrX1a/nB;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCJKN5c9Jz3chK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 00:55:20 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8DDF522A14;
	Thu,  9 Feb 2023 13:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1675950914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=msBxcERkKMvLqznzzBGHEc/n4urDGACOz1gYm5JVXyM=;
	b=0KCsbM2vfZEq/hZEd1ijikGYYKLmz3QW4mX3QoiPifhakbV88MPeJwnWr7CZEkAZefCX93
	XISjVI4/ymZEz2RpGDgXW1roscO81qUFpdJSIpb80HOKAm7jaj/jOy/tWuOhTyoAFjJl1i
	cheGyMNXalyoYNOgKGEy4uFwtDekXb8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1675950914;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=msBxcERkKMvLqznzzBGHEc/n4urDGACOz1gYm5JVXyM=;
	b=lrX1a/nBCZxBYfRy/HlY71zgBpHjiOcl4uaDA05uQlgm09oXnrLIqjK3gNWjDuYU3K+/oh
	a8YPYeKjfqdS7/DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4AA8613915;
	Thu,  9 Feb 2023 13:55:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +PZyEUL75GNTfwAAMHmgww
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
Subject: [PATCH 07/11] fbdev: Move option-string lookup into helper
Date: Thu,  9 Feb 2023 14:55:05 +0100
Message-Id: <20230209135509.7786-8-tzimmermann@suse.de>
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

Move the lookup of the option string into an internal helper. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fb_cmdline.c | 60 ++++++++++++++++-----------
 1 file changed, 36 insertions(+), 24 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_cmdline.c b/drivers/video/fbdev/core/fb_cmdline.c
index 512da89ff8b5..f811c7b679e1 100644
--- a/drivers/video/fbdev/core/fb_cmdline.c
+++ b/drivers/video/fbdev/core/fb_cmdline.c
@@ -21,6 +21,36 @@ static char *video_options[FB_MAX] __read_mostly;
 static const char *fb_mode_option __read_mostly;
 static int ofonly __read_mostly;
 
+static const char *__fb_get_options(const char *name)
+{
+	const char *options = NULL;
+	size_t name_len = 0;
+
+	if (name)
+		name_len = strlen(name);
+
+	if (name_len) {
+		unsigned int i;
+		const char *opt;
+
+		for (i = 0; i < ARRAY_SIZE(video_options); ++i) {
+			if (!video_options[i])
+				continue;
+			if (video_options[i][0] == '\0')
+				continue;
+			opt = video_options[i];
+			if (!strncmp(opt, name, name_len) && opt[name_len] == ':')
+				options = opt + name_len + 1;
+		}
+	}
+
+	/* No match, return global options */
+	if (!options)
+		options = fb_mode_option;
+
+	return options;
+}
+
 /**
  * fb_get_options - get kernel boot parameters
  * @name:   framebuffer name as it would appear in
@@ -35,36 +65,18 @@ static int ofonly __read_mostly;
  */
 int fb_get_options(const char *name, char **option)
 {
-	const char *options = NULL;
 	int retval = 0;
-	size_t name_len;
-	char *opt;
+	const char *options;
 
-	if (name)
-		name_len = strlen(name);
-
-	if (name_len && ofonly && strncmp(name, "offb", 4))
+	if (name && ofonly && strncmp(name, "offb", 4))
 		retval = 1;
 
-	if (name_len && !retval) {
-		unsigned int i;
+	options = __fb_get_options(name);
 
-		for (i = 0; i < FB_MAX; i++) {
-			if (video_options[i] == NULL)
-				continue;
-			if (!video_options[i][0])
-				continue;
-			opt = video_options[i];
-			if (!strncmp(name, opt, name_len) &&
-			    opt[name_len] == ':')
-				options = opt + name_len + 1;
-		}
+	if (options) {
+		if (!strncmp(options, "off", 3))
+			retval = 1;
 	}
-	/* No match, pass global option */
-	if (!options && option && fb_mode_option)
-		options = fb_mode_option;
-	if (options && !strncmp(options, "off", 3))
-		retval = 1;
 
 	if (option) {
 		if (options)
-- 
2.39.1

