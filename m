Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A061A690B10
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 14:56:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCJLJ43Dtz3f6p
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 00:56:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ysXmUKmd;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=swXYWmDf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ysXmUKmd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=swXYWmDf;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCJKK3wbKz3cgs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 00:55:17 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 35C8C5D031;
	Thu,  9 Feb 2023 13:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1675950913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jRGV1sHWfA7dHKuzbZtPETV56sGZm893xDJqn9cFqAI=;
	b=ysXmUKmdYXeGDvLEm+JQVP6v7SCD19NlPd+F4LIqlZ5CPgmjMdhcaMGivagmFoyJmPkD3X
	fllymK0hneVqsFRNk48x7r79fovNMEuuZHHCWc0IZ66Jy7r3iOvggKFmE9cG2Jani52bMh
	DELoNCZiMwIUkc2gAo4HUoDas3QPwk4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1675950913;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jRGV1sHWfA7dHKuzbZtPETV56sGZm893xDJqn9cFqAI=;
	b=swXYWmDfLiLpLXZVgBaUGMMoVUFVyi3ll6Vjpk9dJdYBEhGtsxvlSYiq5s+/pkkJWzgV1A
	bmFCfMPDFVn9lTCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EE117138E4;
	Thu,  9 Feb 2023 13:55:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UD5MOUD75GNTfwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 13:55:12 +0000
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
Subject: [PATCH 02/11] fbdev: Transfer video= option strings to caller; clarify ownership
Date: Thu,  9 Feb 2023 14:55:00 +0100
Message-Id: <20230209135509.7786-3-tzimmermann@suse.de>
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

In fb_get_options(), always duplicate the returned option string and
transfer ownership of the memory to the function's caller.

Until now, only the global option string got duplicated and transferred
to the caller; the per-driver options were owned by fb_get_options().
In the end, it was impossible for the function's caller to detect if
it had to release the string's memory buffer. Hence, all calling drivers
leak the memory buffer. The leaks have existed ever since, but drivers
only call fb_get_option() once as part of module initialization. So the
amount of leaked memory is not significant.

Fix the semantics of fb_get_option() by unconditionally transferring
ownership of the memory buffer to the caller. Later patches can resolve
the memory leaks in the fbdev drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fb_cmdline.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_cmdline.c b/drivers/video/fbdev/core/fb_cmdline.c
index 6792010d6716..702b00b71870 100644
--- a/drivers/video/fbdev/core/fb_cmdline.c
+++ b/drivers/video/fbdev/core/fb_cmdline.c
@@ -30,13 +30,17 @@ EXPORT_SYMBOL_GPL(fb_mode_option);
  *          (video=<name>:<options>)
  * @option: the option will be stored here
  *
+ * The caller owns the string returned in @option and is
+ * responsible for releasing the memory.
+ *
  * NOTE: Needed to maintain backwards compatibility
  */
 int fb_get_options(const char *name, char **option)
 {
-	char *opt, *options = NULL;
+	const char *options = NULL;
 	int retval = 0;
 	int name_len = strlen(name), i;
+	char *opt;
 
 	if (name_len && ofonly && strncmp(name, "offb", 4))
 		retval = 1;
@@ -55,12 +59,16 @@ int fb_get_options(const char *name, char **option)
 	}
 	/* No match, pass global option */
 	if (!options && option && fb_mode_option)
-		options = kstrdup(fb_mode_option, GFP_KERNEL);
+		options = fb_mode_option;
 	if (options && !strncmp(options, "off", 3))
 		retval = 1;
 
-	if (option)
-		*option = options;
+	if (option) {
+		if (options)
+			*option = kstrdup(options, GFP_KERNEL);
+		else
+			*option = NULL;
+	}
 
 	return retval;
 }
-- 
2.39.1

