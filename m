Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D987690B15
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 14:57:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCJMK1QJHz3f4y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 00:57:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rGoNUeHA;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fxzGR2US;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rGoNUeHA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fxzGR2US;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCJKK3sSmz3cfW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 00:55:16 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9CE3E229E0;
	Thu,  9 Feb 2023 13:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1675950912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uRXYWe304mkCxYZE0lH4+u8aTbd19nfJc9iHmaY1sNs=;
	b=rGoNUeHAKyyaOWP1mlyHpoRNo8hh31zgKYmRP6qxRNT8QfNwA6YaXG7rHjRGE1m/ylLMGR
	g9ejrdOFZJ3NQA7dCMmp65bqYgU2kGtttdHBB326k38YyttBqXNB+ELPB4GiJtmucnSX6G
	/PrKOuOx9K1EKieAsj2P1/t25VALtC8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1675950912;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uRXYWe304mkCxYZE0lH4+u8aTbd19nfJc9iHmaY1sNs=;
	b=fxzGR2USnOzNJy0acLQiboQ/osEf+Oy+1nm5x8+ggn+D4J+XiU1aI6WICQgpe6xViZClJ+
	fNNF/22aiuayXkAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B3E3138E4;
	Thu,  9 Feb 2023 13:55:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iaZWFUD75GNTfwAAMHmgww
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
Subject: [PATCH 00/11] drm,fbdev: Move video= option to drivers/video
Date: Thu,  9 Feb 2023 14:54:58 +0100
Message-Id: <20230209135509.7786-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
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

The kernel's video= option sets the initial video mode. It is shared
by fbdev and DRM, but located within the fbdev code. Move it to
drivers/video/ and adapt callers. Allows DRM (and others) to use the
option without depending on fbdev.

While at it, fix the interface of the lookup functions. This requires
a number of changes. First clarify the ownership of the option string
in patch 2. The helper fb_get_options() returns the video= parameter's
value. It's sometimes a copy and sometimes the original string. Hence
callers, mostly fbdev drivers, have just leaked the returned string.
Change this to always duplicate the option string in fb_get_options()
and transfer ownership of the copy to the caller. We can then start to
fix the memory leaks in the fbdev drivers.

There's a global video= setting and a number of per-output settings.
In patches 3 to 5, support explicit lookup of the global video option
and lookup the string in fbdev's modedb and in a PS3 driver. Then
avoid exporting the global setting's internal state variable in patch 6.

Finally, in patches 7 to 11, move the video= option to drivers/video.
It can be used directly in DRM and a PS3 driver. This fixes any memory
leaks from the returned option string. For fbdev drivers, the helper
fb_get_options() remains as an adapter aroudn the new interface.

Tested with DRM and fbdev and built for the PS3.

Thomas Zimmermann (11):
  fbdev: Fix contact info in fb_cmdline.c
  fbdev: Transfer video= option strings to caller; clarify ownership
  fbdev: Support NULL for name in option-string lookup
  drivers/ps3: Read video= option with fb_get_option()
  fbdev: Read video= option with fb_get_option() in modedb
  fbdev: Unexport fb_mode_option
  fbdev: Move option-string lookup into helper
  fbdev: Handle video= parameter in video/cmdline.c
  driver/ps3: Include <video/cmdline.h> for mode parsing
  drm: Include <video/cmdline.h> for mode parsing
  drm: Fix comment on mode parsing

 drivers/gpu/drm/Kconfig               |   2 +-
 drivers/gpu/drm/drm_connector.c       |   9 +-
 drivers/gpu/drm/drm_modes.c           |   3 +-
 drivers/ps3/ps3av.c                   |   9 +-
 drivers/video/Kconfig                 |   3 +
 drivers/video/Makefile                |   1 +
 drivers/video/cmdline.c               | 133 ++++++++++++++++++++++++++
 drivers/video/fbdev/Kconfig           |   5 +-
 drivers/video/fbdev/core/Makefile     |   3 +-
 drivers/video/fbdev/core/fb_cmdline.c |  94 +++++-------------
 drivers/video/fbdev/core/modedb.c     |   8 +-
 include/linux/fb.h                    |   1 -
 include/video/cmdline.h               |  20 ++++
 13 files changed, 202 insertions(+), 89 deletions(-)
 create mode 100644 drivers/video/cmdline.c
 create mode 100644 include/video/cmdline.h


base-commit: 1a019dd7a5d25f7c1c9b77931138290e28947e6a
-- 
2.39.1

