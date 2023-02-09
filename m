Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B658D690B32
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 15:02:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCJTQ3tKfz3fZ9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 01:02:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=A72ExH9X;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4+HZO7hf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=A72ExH9X;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4+HZO7hf;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCJKN62Jyz3f37
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 00:55:20 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 754C7229FA;
	Thu,  9 Feb 2023 13:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1675950913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kgQsjwqOWkegEQwhCA0vXxb8H/G8l/Mn0HdB+pT9yi4=;
	b=A72ExH9XqqIvCiwkmXutNdzfBj0p26bIsdTaZbdfhsM4lh6uTXKmCMaBbdigKbFZA+RDsE
	3bxVscHPBVA/pH3axAiRW3zHWgU8Je09kvWxnUHsJSFAvxF2wAP6qGAk9LN0qdDjtbo1il
	U1V+0pD2xaDA11ypPqlRZlEwaJ1Y8hI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1675950913;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kgQsjwqOWkegEQwhCA0vXxb8H/G8l/Mn0HdB+pT9yi4=;
	b=4+HZO7hfNYIRH3XythLS8e3AYkH7hcjPbL7VrBkz8MVPHSF4mxhok29IxxRuEsDedg62I4
	5MpN3EUbFqxlu8Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A06613915;
	Thu,  9 Feb 2023 13:55:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UJdgDUH75GNTfwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 13:55:13 +0000
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
Subject: [PATCH 03/11] fbdev: Support NULL for name in option-string lookup
Date: Thu,  9 Feb 2023 14:55:01 +0100
Message-Id: <20230209135509.7786-4-tzimmermann@suse.de>
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

Ignore the per-driver video options if no driver name has been
specified to fb_get_option(). Return the global options in this
case.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fb_cmdline.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fb_cmdline.c b/drivers/video/fbdev/core/fb_cmdline.c
index 702b00b71870..cc8a88e8f308 100644
--- a/drivers/video/fbdev/core/fb_cmdline.c
+++ b/drivers/video/fbdev/core/fb_cmdline.c
@@ -39,13 +39,18 @@ int fb_get_options(const char *name, char **option)
 {
 	const char *options = NULL;
 	int retval = 0;
-	int name_len = strlen(name), i;
+	size_t name_len;
 	char *opt;
 
+	if (name)
+		name_len = strlen(name);
+
 	if (name_len && ofonly && strncmp(name, "offb", 4))
 		retval = 1;
 
 	if (name_len && !retval) {
+		unsigned int i;
+
 		for (i = 0; i < FB_MAX; i++) {
 			if (video_options[i] == NULL)
 				continue;
-- 
2.39.1

