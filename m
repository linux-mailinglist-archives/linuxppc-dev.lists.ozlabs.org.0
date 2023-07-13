Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6034F7522DC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 15:05:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Xm0uu0Vo;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Uv+mmec0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1vwf0D3vz3cRq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 23:05:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Xm0uu0Vo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Uv+mmec0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1vtn3PHrz3c3M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 23:03:44 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9550221D5A;
	Thu, 13 Jul 2023 13:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689253421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N67kus8L150iwAk6cmNTqy6XkNIgTnRqEe54TsDygpI=;
	b=Xm0uu0VoNAnznojOCJHWRxuZ8jWAnPVvGr3I7nfDF5JPgc6a4f8t2d6acP9+A1DvfK+wVy
	sqdChB7z1EWOXbY08AYKZ4qsKzII8hKTgwxEM+EEJZlz40bkKdCB3zn2umJVcvMSOmGT2z
	948k89xorlN/VV9ANwqxCfHcfvnGfpE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689253421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N67kus8L150iwAk6cmNTqy6XkNIgTnRqEe54TsDygpI=;
	b=Uv+mmec0lIu+mxMNTxiVXmiIuROgLZECy4OsFJzomoWjltP2RfvpBN02QKZ9/KsNtNf4tF
	822gSS0XJsgHlDAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 403F613489;
	Thu, 13 Jul 2023 13:03:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id fbbQDi32r2TVPgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 13 Jul 2023 13:03:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH v2 00/18] fbdev: Remove FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT flags
Date: Thu, 13 Jul 2023 14:58:20 +0200
Message-ID: <20230713130338.31086-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove the unused flags FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT from
fbdev and drivers, as briefly discussed at [1]. Both flags were maybe
useful when fbdev had special handling for driver modules. With
commit 376b3ff54c9a ("fbdev: Nuke FBINFO_MODULE"), they are both 0
and have no further effect.

Patches 1 to 7 remove FBINFO_DEFAULT from drivers. Patches 2 to 5
split this by the way the fb_info struct is being allocated. All flags
are cleared to zero during the allocation.

Patches 8 to 16 do the same for FBINFO_FLAG_DEFAULT. Patch 8 fixes
an actual bug in how arch/sh uses the tokne for struct fb_videomode,
which is unrelated.

Patch 17 removes both flag constants from <linux/fb.h> and patch 18
documents the zero'ed memory returned by framebuffer_alloc().

v2:
	* sh: use FB_MODE_IS_UNKNOWN (Adrian)
	* fix commit messages (Miguel)
	* document framebuffer_alloc()'s zero'ed memory (Miguel)

[1] https://lore.kernel.org/dri-devel/877crer8fm.fsf@minerva.mail-host-address-is-not-set/

Thomas Zimmermann (18):
  drm: Remove flag FBINFO_DEFAULT from fbdev emulation
  fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
  fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
  fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
  fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
  fbdev/fsl-diu-fb: Remove flag FBINFO_DEFAULT
  vfio-mdev: Remove flag FBINFO_DEFAULT from fbdev sample driver
  sh: Assign FB_MODE_IS_UNKNOWN to struct fb_videomode.flag
  auxdisplay: Remove flag FBINFO_FLAG_DEFAULT from fbdev drivers
  hid/picolcd: Remove flag FBINFO_FLAG_DEFAULT from fbdev driver
  media: Remove flag FBINFO_FLAG_DEFAULT from fbdev drivers
  staging: Remove flag FBINFO_FLAG_DEFAULT from fbdev drivers
  fbdev: Remove flag FBINFO_FLAG_DEFAULT from fbdev drivers
  fbdev: Remove flag FBINFO_FLAG_DEFAULT from fbdev drivers
  fbdev/atafb: Remove flag FBINFO_FLAG_DEFAULT
  fbdev/pxafb: Remove flag FBINFO_FLAG_DEFAULT
  fbdev: Remove FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT
  fbdev: Document that framebuffer_alloc() returns zero'ed data

 arch/sh/boards/mach-sh7763rdp/setup.c          | 2 +-
 drivers/auxdisplay/cfag12864bfb.c              | 1 -
 drivers/auxdisplay/ht16k33.c                   | 1 -
 drivers/gpu/drm/drm_fbdev_dma.c                | 1 -
 drivers/gpu/drm/drm_fbdev_generic.c            | 1 -
 drivers/gpu/drm/gma500/fbdev.c                 | 2 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c          | 2 +-
 drivers/hid/hid-picolcd_fb.c                   | 1 -
 drivers/media/pci/ivtv/ivtvfb.c                | 1 -
 drivers/media/test-drivers/vivid/vivid-osd.c   | 1 -
 drivers/staging/fbtft/fbtft-core.c             | 2 +-
 drivers/staging/sm750fb/sm750.c                | 1 -
 drivers/video/fbdev/68328fb.c                  | 2 +-
 drivers/video/fbdev/acornfb.c                  | 2 +-
 drivers/video/fbdev/amba-clcd.c                | 1 -
 drivers/video/fbdev/amifb.c                    | 5 ++---
 drivers/video/fbdev/arcfb.c                    | 1 -
 drivers/video/fbdev/asiliantfb.c               | 1 -
 drivers/video/fbdev/atafb.c                    | 1 -
 drivers/video/fbdev/atmel_lcdfb.c              | 2 +-
 drivers/video/fbdev/aty/aty128fb.c             | 1 -
 drivers/video/fbdev/aty/atyfb_base.c           | 3 +--
 drivers/video/fbdev/aty/radeon_base.c          | 3 +--
 drivers/video/fbdev/broadsheetfb.c             | 2 +-
 drivers/video/fbdev/bw2.c                      | 1 -
 drivers/video/fbdev/carminefb.c                | 1 -
 drivers/video/fbdev/cg14.c                     | 2 +-
 drivers/video/fbdev/cg3.c                      | 1 -
 drivers/video/fbdev/cg6.c                      | 2 +-
 drivers/video/fbdev/chipsfb.c                  | 1 -
 drivers/video/fbdev/cirrusfb.c                 | 3 +--
 drivers/video/fbdev/clps711x-fb.c              | 1 -
 drivers/video/fbdev/cobalt_lcdfb.c             | 1 -
 drivers/video/fbdev/controlfb.c                | 2 +-
 drivers/video/fbdev/core/fb_info.c             | 3 ++-
 drivers/video/fbdev/cyber2000fb.c              | 2 +-
 drivers/video/fbdev/da8xx-fb.c                 | 1 -
 drivers/video/fbdev/efifb.c                    | 1 -
 drivers/video/fbdev/ep93xx-fb.c                | 1 -
 drivers/video/fbdev/ffb.c                      | 3 +--
 drivers/video/fbdev/fm2fb.c                    | 1 -
 drivers/video/fbdev/fsl-diu-fb.c               | 2 +-
 drivers/video/fbdev/g364fb.c                   | 2 +-
 drivers/video/fbdev/gbefb.c                    | 1 -
 drivers/video/fbdev/geode/gx1fb_core.c         | 1 -
 drivers/video/fbdev/geode/gxfb_core.c          | 1 -
 drivers/video/fbdev/geode/lxfb_core.c          | 1 -
 drivers/video/fbdev/goldfishfb.c               | 1 -
 drivers/video/fbdev/grvga.c                    | 2 +-
 drivers/video/fbdev/gxt4500.c                  | 3 +--
 drivers/video/fbdev/hecubafb.c                 | 2 +-
 drivers/video/fbdev/hgafb.c                    | 2 +-
 drivers/video/fbdev/hitfb.c                    | 2 +-
 drivers/video/fbdev/hpfb.c                     | 1 -
 drivers/video/fbdev/hyperv_fb.c                | 2 --
 drivers/video/fbdev/i740fb.c                   | 2 +-
 drivers/video/fbdev/i810/i810_main.c           | 4 ++--
 drivers/video/fbdev/imsttfb.c                  | 3 +--
 drivers/video/fbdev/imxfb.c                    | 3 +--
 drivers/video/fbdev/intelfb/intelfbdrv.c       | 5 ++---
 drivers/video/fbdev/kyro/fbdev.c               | 1 -
 drivers/video/fbdev/leo.c                      | 1 -
 drivers/video/fbdev/macfb.c                    | 1 -
 drivers/video/fbdev/matrox/matroxfb_crtc2.c    | 5 ++---
 drivers/video/fbdev/maxinefb.c                 | 1 -
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c     | 2 +-
 drivers/video/fbdev/metronomefb.c              | 2 +-
 drivers/video/fbdev/mmp/fb/mmpfb.c             | 2 +-
 drivers/video/fbdev/mx3fb.c                    | 1 -
 drivers/video/fbdev/neofb.c                    | 2 +-
 drivers/video/fbdev/nvidia/nvidia.c            | 4 ++--
 drivers/video/fbdev/offb.c                     | 2 +-
 drivers/video/fbdev/omap/omapfb_main.c         | 1 -
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c | 1 -
 drivers/video/fbdev/p9100.c                    | 1 -
 drivers/video/fbdev/platinumfb.c               | 1 -
 drivers/video/fbdev/pm2fb.c                    | 3 +--
 drivers/video/fbdev/pm3fb.c                    | 3 +--
 drivers/video/fbdev/pmag-aa-fb.c               | 1 -
 drivers/video/fbdev/pmag-ba-fb.c               | 1 -
 drivers/video/fbdev/pmagb-b-fb.c               | 1 -
 drivers/video/fbdev/ps3fb.c                    | 2 +-
 drivers/video/fbdev/pvr2fb.c                   | 2 +-
 drivers/video/fbdev/pxa168fb.c                 | 2 +-
 drivers/video/fbdev/pxafb.c                    | 2 --
 drivers/video/fbdev/q40fb.c                    | 1 -
 drivers/video/fbdev/riva/fbdev.c               | 3 +--
 drivers/video/fbdev/s1d13xxxfb.c               | 4 ++--
 drivers/video/fbdev/s3c-fb.c                   | 1 -
 drivers/video/fbdev/sa1100fb.c                 | 1 -
 drivers/video/fbdev/savage/savagefb_driver.c   | 3 +--
 drivers/video/fbdev/sh_mobile_lcdcfb.c         | 2 --
 drivers/video/fbdev/simplefb.c                 | 1 -
 drivers/video/fbdev/sis/sis_main.c             | 5 +----
 drivers/video/fbdev/skeletonfb.c               | 2 +-
 drivers/video/fbdev/sm501fb.c                  | 2 +-
 drivers/video/fbdev/sm712fb.c                  | 1 -
 drivers/video/fbdev/smscufx.c                  | 2 +-
 drivers/video/fbdev/sstfb.c                    | 1 -
 drivers/video/fbdev/sunxvr1000.c               | 1 -
 drivers/video/fbdev/sunxvr2500.c               | 1 -
 drivers/video/fbdev/sunxvr500.c                | 1 -
 drivers/video/fbdev/tcx.c                      | 1 -
 drivers/video/fbdev/tdfxfb.c                   | 2 +-
 drivers/video/fbdev/tgafb.c                    | 2 +-
 drivers/video/fbdev/tridentfb.c                | 2 +-
 drivers/video/fbdev/udlfb.c                    | 2 +-
 drivers/video/fbdev/uvesafb.c                  | 3 +--
 drivers/video/fbdev/valkyriefb.c               | 1 -
 drivers/video/fbdev/vermilion/vermilion.c      | 2 +-
 drivers/video/fbdev/vesafb.c                   | 2 +-
 drivers/video/fbdev/vfb.c                      | 1 -
 drivers/video/fbdev/vga16fb.c                  | 2 +-
 drivers/video/fbdev/via/viafbdev.c             | 2 +-
 drivers/video/fbdev/vt8500lcdfb.c              | 3 +--
 drivers/video/fbdev/wm8505fb.c                 | 3 +--
 drivers/video/fbdev/xen-fbfront.c              | 2 +-
 drivers/video/fbdev/xilinxfb.c                 | 1 -
 include/linux/fb.h                             | 3 ---
 samples/vfio-mdev/mdpy-fb.c                    | 1 -
 120 files changed, 68 insertions(+), 151 deletions(-)

-- 
2.41.0

