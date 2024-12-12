Return-Path: <linuxppc-dev+bounces-4040-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 025EF9EE3C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 11:07:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y87Rj0M7dz30Vf;
	Thu, 12 Dec 2024 21:06:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733998017;
	cv=none; b=ZSjbEdnzkrs1NfCNsXQrEIza4gfXO9kY2MYJ0jc8Q9QdtTnq2ywbUsqj3+3+GJsQfiUbvr5zcMUZ+uxDv8s9R7PrSKtbTjTG6qj3QEv44SJQPjRYIDKHQ4hFVn3Rsw2T4HkzeK8XqJ0X/210CyCx41aFVp3zD+PVSwR6d0GKaCDy1uErbli+sc6fuZboyCJBzr8w5CZY3De3xxOxo6uiqtcQpEvou0Nmne+a9WhNL7r7xR6TubkjgLDP9QDQtzoTxyCrxnKsh/iaLMer+0PBieKkAh9Q/iWDssKbI9Rn7KOgLzv6dGyl5bQ+MVy0U0NWlrw4lGkgDPm4hIyUi9mLbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733998017; c=relaxed/relaxed;
	bh=INRxU7ywg6HovcPyrlJbcPMTZP3ggyxEfuKjc8HY5a0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c1hJXDDcSqZJUXQ5tIgTdXeJUv2MpjdvroftqY23EmikDLq88MLUNqfX+rsCnH/40kdGuXqRAU4XxKwr3cs8sTfazeVLQE4CYXwSBeSWWrqGEn0W0AodCxBnVcsTN29M+4lrnj7K7RtbiTWLuxP207QhF1S5w7Qs1HkhWNp+Fq/3gGGCmb7W9t11N4yRS+o7Qk2BoSC8vp+eOd7WBbQ5qScip+cx8/uJ1B9SAC7x+eqVLh0S2wNdHWJXN5RJPGM29GaR0kdXWZKkDKMG6go8WC4PcWcjmjqnBLh/ZbxJJFB/0o0uO1jdxhcRevqz7Ns4Qa/Lb/MOfKeBUrwa1JRp5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SzM+e4c5; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zFPTjN+S; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=C88eEKfu; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=m3hu/pJr; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SzM+e4c5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zFPTjN+S;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=C88eEKfu;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=m3hu/pJr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y87Rg00Jjz2yWr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 21:06:54 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EA3121F445;
	Thu, 12 Dec 2024 10:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733998008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=INRxU7ywg6HovcPyrlJbcPMTZP3ggyxEfuKjc8HY5a0=;
	b=SzM+e4c5Ym1h/jm5jVRn2Nl51bBZwlCrsSXJWKE8eSsIvW1x9151YFQ/8jopNe/WT25DGg
	dd1JI7f5fPyaMHMgN/Ns+wcJEoBAlD4ktf1B5G0Rxga4vLYmWhLSQa2b/9SiuHDatXE9HY
	OzOzrwlsl6v5KmUvSCQM31/RRV2N4gA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733998008;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=INRxU7ywg6HovcPyrlJbcPMTZP3ggyxEfuKjc8HY5a0=;
	b=zFPTjN+SsvBeunjkwP/6JkWexsWilBM8ALnk3ZViWyFS1fpwyJhjXgRJzw0NyKM21lX+lG
	LIfa6gdLNBg95qBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733998007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=INRxU7ywg6HovcPyrlJbcPMTZP3ggyxEfuKjc8HY5a0=;
	b=C88eEKfuMDlPH1HvCmRgYqp7pDVG0sASkljzBfoFjeIItcffK0rfCEdrJ6k6fzsg2nJixD
	ehYwzmW1s/iAjBGe1kDFRbd0z2U+Z76a6jqrJ3XZLxn+NeyeS9jXOgjRu1dmjfQei+JTv+
	/CUM5DG9DIH47O3FPita/Ms4GR3rDzc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733998007;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=INRxU7ywg6HovcPyrlJbcPMTZP3ggyxEfuKjc8HY5a0=;
	b=m3hu/pJriaq1pEPdNSNu7jWg+8lOgOsUJfmtvq7KSt8hFHyu4O52BzltbsBFM3X7OFUdd3
	yYq2vSEFm2yEa6Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A70C013939;
	Thu, 12 Dec 2024 10:06:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uB+YJ7e1WmeaGwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 12 Dec 2024 10:06:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	arnd@arndb.de,
	deller@gmx.de,
	simona@ffwll.ch,
	airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/3] drm,fbdev: Fix module dependencies
Date: Thu, 12 Dec 2024 11:04:42 +0100
Message-ID: <20241212100636.45875-1-tzimmermann@suse.de>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
	FREEMAIL_TO(0.00)[redhat.com,arndb.de,gmx.de,ffwll.ch,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[10];
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
Kconfig token automatically. These drivers should be updated to depends
on the token as well, such that backlight functionality is fully user-
controlled.

v2:
- s/BACKLIGHT_DEVICE_CLASS/BACKLIGHT_CLASS_DEVICE (Helge)
- Fix fbdev driver-dependency corner case (Arnd)

[1] https://patchwork.freedesktop.org/series/141411/

Arnd Bergmann (1):
  drm: rework FB_CORE dependency

Thomas Zimmermann (2):
  fbdev: Fix recursive dependencies wrt BACKLIGHT_CLASS_DEVICE
  drm/fbdev: Select FB_CORE dependency for fbdev on DMA and TTM

 drivers/auxdisplay/Kconfig       |  2 +-
 drivers/gpu/drm/Kconfig          |  3 +++
 drivers/macintosh/Kconfig        |  1 +
 drivers/staging/fbtft/Kconfig    |  1 +
 drivers/video/fbdev/Kconfig      | 18 +++++++++++++-----
 drivers/video/fbdev/core/Kconfig |  3 +--
 6 files changed, 20 insertions(+), 8 deletions(-)

-- 
2.47.1


