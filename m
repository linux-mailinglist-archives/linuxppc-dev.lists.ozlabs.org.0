Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCF3769FD7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 19:56:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wcMYO8Xn;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YfZcOQKW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RF5XQ1c3Jz30K6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 03:56:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wcMYO8Xn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YfZcOQKW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RF5WV59lsz2yW8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 03:55:49 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C64F22205E;
	Mon, 31 Jul 2023 17:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1690826139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=blrHYZH6S+MmbSDFCHnNDxEACT0tP3PtmP/NQlgF3tk=;
	b=wcMYO8XndgLwG5p/OyuY3UpiE0l+0HMY2x1/SXrwph3joT1jV78ELTxvq5rSvQ59fT3Nan
	eVT4LzQfnb4JQ5uE96bTIJoDTJElJZ/UjRyNF0RReDUZWsvNZAUGxD0/USFcwUfsyQ21JS
	NbhXgR+O31ACU0arIv6SxAIQFGfSIjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690826139;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=blrHYZH6S+MmbSDFCHnNDxEACT0tP3PtmP/NQlgF3tk=;
	b=YfZcOQKWYqRzLZYjV6sNoImbAU2dOa4BJTDS23JpYYytINavTcuFq9l4WepVwHoUXqYIVV
	MSoFkLnJEEaHv6Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6FDA1133F7;
	Mon, 31 Jul 2023 17:55:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id If54Gpv1x2SGOgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 31 Jul 2023 17:55:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	sam@ravnborg.org,
	javierm@redhat.com,
	bagasdotme@gmail.com,
	rd.dunlab@gmail.com,
	regressions@leemhuis.info,
	sfr@canb.auug.org.au
Subject: [PATCH] fbdev/ps3fb: Build without kernel device
Date: Mon, 31 Jul 2023 19:55:00 +0200
Message-ID: <20230731175535.11345-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
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
Cc: linux-fbdev@vger.kernel.org, regressions@lists.linux.dev, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use fb_info() to print status message at the end of the probe function,
which avoids decoding the devices. fb_info() works with or without an
fbdev kernel device. Fixes the following error:

../drivers/video/fbdev/ps3fb.c: In function 'ps3fb_probe':
../drivers/video/fbdev/ps3fb.c:1172:40: error: 'struct fb_info' has no member named 'dev'
 1172 |                  dev_driver_string(info->dev), dev_name(info->dev),
      |                                        ^~
../include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                                     ^~~~~~~~~~~
../drivers/video/fbdev/ps3fb.c:1171:9: note: in expansion of macro 'dev_info'
 1171 |         dev_info(info->device, "%s %s, using %u KiB of video memory\n",
      |         ^~~~~~~~
../drivers/video/fbdev/ps3fb.c:1172:61: error: 'struct fb_info' has no member named 'dev'
 1172 |                  dev_driver_string(info->dev), dev_name(info->dev),
      |                                                             ^~
../include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                                     ^~~~~~~~~~~
../drivers/video/fbdev/ps3fb.c:1171:9: note: in expansion of macro 'dev_info'
 1171 |         dev_info(info->device, "%s %s, using %u KiB of video memory\n",
      |         ^~~~~~~~

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/lkml/ccc63065-2976-88ef-1211-731330bf2866@infradead.org/
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 701d2054fa31 ("fbdev: Make support for userspace interfaces configurable")
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
---
 drivers/video/fbdev/ps3fb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/ps3fb.c b/drivers/video/fbdev/ps3fb.c
index 5aedc30c5f7e..64d291d6b153 100644
--- a/drivers/video/fbdev/ps3fb.c
+++ b/drivers/video/fbdev/ps3fb.c
@@ -1168,9 +1168,7 @@ static int ps3fb_probe(struct ps3_system_bus_device *dev)
 
 	ps3_system_bus_set_drvdata(dev, info);
 
-	dev_info(info->device, "%s %s, using %u KiB of video memory\n",
-		 dev_driver_string(info->dev), dev_name(info->dev),
-		 info->fix.smem_len >> 10);
+	fb_info(info, "using %u KiB of video memory\n", info->fix.smem_len >> 10);
 
 	task = kthread_run(ps3fbd, info, DEVICE_NAME);
 	if (IS_ERR(task)) {
-- 
2.41.0

