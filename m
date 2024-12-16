Return-Path: <linuxppc-dev+bounces-4145-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FF39F2B21
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 08:45:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBX6F6SMrz2xyG;
	Mon, 16 Dec 2024 18:45:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734335109;
	cv=none; b=EgiihCfPZqX09ARGRNYwgJes/dQA3KMxieBZ/yYNceVdGgErqJCpNqB8w5yLSP4BnIRVm4Ur2PoIJvWOVVWYwuQOTK3hhs9kQqTT6FPLKUnA1qtcOk8AGXIXsg2J9V1n8i/az4PSpDjKSsDIlQ7xtkoBvxytsapLBL2+tu94EzlEg88YE6xonNT3Swh+jNxl6fTNJFztbvuAqbX6KrmALMQgd6+opeOBOIXtICF7f+Vg+0+VpJ1P/Qzu+jRDGPuBsEBbfZdzUmemfg45HJbqL3E6Z0SInHr72Ee4mHFw6f466Nzmj4iU553Jdrqz2KH3L7t8yyM+QxX81FwDAUxr+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734335109; c=relaxed/relaxed;
	bh=NR2odFMvBCSBarTSuL9QZZ7twh0d73aEvCeSX/f3wKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oDaA1Jcj99J9tEMneB30CSohyBCbDCIvu+iNvGKJFhIHuHidC0jLu3pHfEQscxBoEANDKGBesh+0+FzT3wcZYUlgUdDcXrxLsU2Dm2+e+XeCGC/ZEiGbmb8w3ODCXerU/b8Y7lL8DxIayT47yeZDQ5S8OL/gHQng+QtgZozuKYwGR++hra+DOaJAVemL4BmQcRHuEetWJ4HvoV/GctlWqlvW9FyQ7KZFH5anVwoShelVZHEzKs/hOt+8ScyFm/7OidEPafoP6Y9+N4kKbjExG74gCF0po6DKDVISh9uLjLG/iZeLzl1/0HkOv9ExpvWPx5HDYbl8GQ5exBvWD7Je/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Okj3ZMHN; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WzKNXkba; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Okj3ZMHN; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WzKNXkba; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Okj3ZMHN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WzKNXkba;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Okj3ZMHN;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WzKNXkba;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBX6D75d2z2ypP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 18:45:08 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6C9A7211FB;
	Mon, 16 Dec 2024 07:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734335100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NR2odFMvBCSBarTSuL9QZZ7twh0d73aEvCeSX/f3wKk=;
	b=Okj3ZMHNM6Li+6wpDps878NCGBMzeVck3GY5Tk2IhZu14S/9wmXf/KNrFBPGkig6Z9ZNMf
	8wk0axdhfzBXjfz+n0TzY0vHDNWtKGcrGB98oimtlxMyhLPDzh4PiBOgu/b/rZhO6F6D2T
	gOKNGxJgnjyLDLyWp2qaLGiUET0HQ9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734335100;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NR2odFMvBCSBarTSuL9QZZ7twh0d73aEvCeSX/f3wKk=;
	b=WzKNXkba+1EoE226aQkH+8inEyCvYVZVYeut2y+GW00I75kVl3KzVws+gu2VwAFeniUNfA
	Q/1fY41DBpldtCDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734335100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NR2odFMvBCSBarTSuL9QZZ7twh0d73aEvCeSX/f3wKk=;
	b=Okj3ZMHNM6Li+6wpDps878NCGBMzeVck3GY5Tk2IhZu14S/9wmXf/KNrFBPGkig6Z9ZNMf
	8wk0axdhfzBXjfz+n0TzY0vHDNWtKGcrGB98oimtlxMyhLPDzh4PiBOgu/b/rZhO6F6D2T
	gOKNGxJgnjyLDLyWp2qaLGiUET0HQ9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734335100;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NR2odFMvBCSBarTSuL9QZZ7twh0d73aEvCeSX/f3wKk=;
	b=WzKNXkba+1EoE226aQkH+8inEyCvYVZVYeut2y+GW00I75kVl3KzVws+gu2VwAFeniUNfA
	Q/1fY41DBpldtCDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B19E13418;
	Mon, 16 Dec 2024 07:45:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J6sCBXzaX2egZAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 16 Dec 2024 07:45:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	arnd@arndb.de,
	deller@gmx.de,
	jani.nikula@linux.intel.com,
	christophe.leroy@csgroup.eu,
	simona@ffwll.ch,
	airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 0/3] drm,fbdev: Fix module dependencies
Date: Mon, 16 Dec 2024 08:42:46 +0100
Message-ID: <20241216074450.8590-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	FREEMAIL_TO(0.00)[redhat.com,arndb.de,gmx.de,linux.intel.com,csgroup.eu,ffwll.ch,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Fix the dependencies among the various graphics modules.

Before addressing the FB_CORE issue, patch 1 first resolves a problem
with BACKLIGHT_CLASS_DEVICE. A number of fbdev drivers select it, which
results in a recursive-dependency error after patch has been applied.
Making these drivers (or parts of them) depend on BACKLIGHT_CLASS_DEVICE
fixes this.

Patch 2 selects FB_CORE for DRM_GEM_DMA_HELPER and DRM_TTM_HELPER.
This is necessary with the recently added DRM client library.

Patch 3 is the second half of the patch provided by Arnd at [1]. It
could not yet be merged because of the issues fixed by patch 1.

Side note: For the majority of graphics drivers, backlight functionality
depends on BACKLIGHT_CLASS_DEVICE. In a few cases drivers select the
Kconfig token automatically. These drivers should be updated to depend
on the token as well, such that backlight functionality is fully user-
controlled.

v3:
- Fix PMAC_BACKLIGHT case (Christophe)
v2:
- s/BACKLIGHT_DEVICE_CLASS/BACKLIGHT_CLASS_DEVICE (Helge)
- Fix fbdev driver-dependency corner case (Arnd)

[1] https://patchwork.freedesktop.org/series/141411/

Arnd Bergmann (1):
  drm: rework FB_CORE dependency

Thomas Zimmermann (2):
  fbdev: Fix recursive dependencies wrt BACKLIGHT_CLASS_DEVICE
  drm/fbdev: Select FB_CORE dependency for fbdev on DMA and TTM

 arch/powerpc/configs/pmac32_defconfig |  1 +
 arch/powerpc/configs/ppc6xx_defconfig |  1 +
 drivers/auxdisplay/Kconfig            |  2 +-
 drivers/gpu/drm/Kconfig               |  3 +++
 drivers/macintosh/Kconfig             |  1 +
 drivers/staging/fbtft/Kconfig         |  1 +
 drivers/video/fbdev/Kconfig           | 18 +++++++++++++-----
 drivers/video/fbdev/core/Kconfig      |  3 +--
 8 files changed, 22 insertions(+), 8 deletions(-)

-- 
2.47.1


