Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2F07FA103
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 14:26:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Xrw61NC3;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Aiwkb2hd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sf5vg1Yhdz3cnc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 00:26:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Xrw61NC3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Aiwkb2hd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 481 seconds by postgrey-1.37 at boromir; Tue, 28 Nov 2023 00:25:09 AEDT
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sf5tF5NYyz2ytJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Nov 2023 00:25:09 +1100 (AEDT)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8865121DC5;
	Mon, 27 Nov 2023 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1701091024; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T9nUBb+18eXVtm4dsBBg1cVhdvvBNf/Q74xkG7rkYjg=;
	b=Xrw61NC3+eZT17ZzAYq+kojK1uhaYraBz0nexV/TwNySBz35tBtiFZD6DYYYF1LhZ5Y6I2
	2uU1hXReLqgbZnbQiZHBMs1Kffe4klslAJpNo+fmbST9yqNUP3JLQxdzJW+eUhKh8DI9Jt
	fLShbtUaUVmo+tk8mAIJVw7Q5Dq3MQE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1701091024;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T9nUBb+18eXVtm4dsBBg1cVhdvvBNf/Q74xkG7rkYjg=;
	b=Aiwkb2hd/xhguhTqcMgq1LfccEy30eMK5umqr0g+dy4OuppefFSNquYQxkkREy72FF+jrb
	zbtRAH9KLR+aMoDQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 508C6132A6;
	Mon, 27 Nov 2023 13:17:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id kFOREtCWZGUhLQAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Mon, 27 Nov 2023 13:17:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de
Subject: [PATCH v2 19/32] fbdev/ps3fb: Initialize fb_ops with fbdev macros
Date: Mon, 27 Nov 2023 14:15:48 +0100
Message-ID: <20231127131655.4020-20-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127131655.4020-1-tzimmermann@suse.de>
References: <20231127131655.4020-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: *
X-Spam-Score: 1.90
X-Spamd-Result: default: False [1.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FREEMAIL_TO(0.00)[redhat.com,gmx.de];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,suse.de,ellerman.id.au,gmail.com,csgroup.eu,lists.ozlabs.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Nicholas Piggin <npiggin@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Initialize the instance of struct fb_ops with fbdev initializer
macros for framebuffers in virtual address space. Set the read/write,
draw and mmap callbacks to the correct implementation and avoid
implicit defaults. Also select the necessary helpers in Kconfig.

Fbdev drivers sometimes rely on the callbacks being NULL for a
default I/O-memory-based implementation to be invoked; hence
requiring the I/O helpers to be built in any case. Setting all
callbacks in all drivers explicitly will allow to make the I/O
helpers optional. This benefits systems that do not use these
functions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/Kconfig | 5 +----
 drivers/video/fbdev/ps3fb.c | 7 ++-----
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 4c82890887ba1..f9dab4c900332 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1715,10 +1715,7 @@ config FB_IBM_GXT4500
 config FB_PS3
 	tristate "PS3 GPU framebuffer driver"
 	depends on FB && PS3_PS3AV
-	select FB_SYS_FILLRECT
-	select FB_SYS_COPYAREA
-	select FB_SYS_IMAGEBLIT
-	select FB_SYS_FOPS
+	select FB_SYSMEM_HELPERS
 	help
 	  Include support for the virtual frame buffer in the PS3 platform.
 
diff --git a/drivers/video/fbdev/ps3fb.c b/drivers/video/fbdev/ps3fb.c
index de81ad3a5d1ed..de8d78bf070a0 100644
--- a/drivers/video/fbdev/ps3fb.c
+++ b/drivers/video/fbdev/ps3fb.c
@@ -939,15 +939,12 @@ static const struct fb_ops ps3fb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= ps3fb_open,
 	.fb_release	= ps3fb_release,
-	.fb_read        = fb_sys_read,
-	.fb_write       = fb_sys_write,
+	__FB_DEFAULT_SYSMEM_OPS_RDWR,
 	.fb_check_var	= ps3fb_check_var,
 	.fb_set_par	= ps3fb_set_par,
 	.fb_setcolreg	= ps3fb_setcolreg,
 	.fb_pan_display	= ps3fb_pan_display,
-	.fb_fillrect	= sys_fillrect,
-	.fb_copyarea	= sys_copyarea,
-	.fb_imageblit	= sys_imageblit,
+	__FB_DEFAULT_SYSMEM_OPS_DRAW,
 	.fb_mmap	= ps3fb_mmap,
 	.fb_blank	= ps3fb_blank,
 	.fb_ioctl	= ps3fb_ioctl,
-- 
2.43.0

