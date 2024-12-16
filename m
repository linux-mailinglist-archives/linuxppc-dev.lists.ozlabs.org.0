Return-Path: <linuxppc-dev+bounces-4143-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 524039F2B1C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 08:45:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBX6C0LRlz2yYd;
	Mon, 16 Dec 2024 18:45:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734335106;
	cv=none; b=OxRXexIqWQiRIzH32kjjqNqSznLvor0qe//HgwPRBYrqM54s4E4krji7GQIz7C5wfLYosJpBNoTPKDkyMficiJGPGFc5Yw1fAeI18F7NxMfydx1rIEr4N0m2ABBJOQj+Xn41ClIJO2WgkqLfyT2h9i918kbhJpTHzmnI/uQUNIDO8ncq0hQpopTszTpg9C04FhhNwZyPJ6ovcb2lnll2x6DIzKbQjKhjOU92PRGvDM/QGoGhpF0+AxUJ8RtQFjh2M6e1yNhqetBua4qO67ZjZOtZzBHqdbrG4ZRixbxnOylJlVFqrHKC3F7AO32g893hcq4XqA350KFuFWMlevYyCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734335106; c=relaxed/relaxed;
	bh=ErN9wcGBgiB6JprkFXTrxRToJxKIiYBt8gCDJYKfCZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mY1c7cWoe7sNhnbG5+dDFraa32ku5B+I62EzsDqoLfA5oxXTBi/V5lUsoPP4CN0w9VAU+bgD5fGkJpt7dJfwc+Nn0LTpHs+1qgPuT7olgiG9GFwITwOWZwkaefLTtfV1ffqur6XCaK/L4NImNPUuQYLGhFFhC4a24K9rZh0TVrIRWpMHFE2ddqzUtC8xd22zafldPqMJ4ki1G++uwW+dHNMT3CmHo4+pZvMT+XCkNd6VRj2FjbNEVQnPPLBUWS8b9GapZlv8NknHjEOzC4wSmqXc6Tltg1QhWVNusvh4rWq0dPMfAIVlqD0Sg6C6kLpjGScGkKlR7U1JJIVjfF2OyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=m/p2ltQU; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3nz2fXgx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=m/p2ltQU; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3nz2fXgx; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=m/p2ltQU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3nz2fXgx;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=m/p2ltQU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3nz2fXgx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBX693dR1z2yRd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 18:45:05 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AE3201F441;
	Mon, 16 Dec 2024 07:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734335101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErN9wcGBgiB6JprkFXTrxRToJxKIiYBt8gCDJYKfCZU=;
	b=m/p2ltQU07FOSRB/0oMKIbbKi0qbzJtaRXnTmnrjKmzo91ghJsUWwrxWX37v+aFW9fAbr5
	cNp5+8gyWon33wVe5J7wtlGzhgaR9d6t1Z2kJGJUAMQr8jbjzsqIeNL6AedHp7kxcL+WVh
	dCZGJHMOscWUC/sMLkGk94CqgLljSvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734335101;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErN9wcGBgiB6JprkFXTrxRToJxKIiYBt8gCDJYKfCZU=;
	b=3nz2fXgxmUgckT/dc1Y+F2wHfc+aBr5cjtyriaVo3Zo5anrzSfvl7SkJO5+DYXfFitEeMN
	l/sjuB4LUD6ZzWAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734335101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErN9wcGBgiB6JprkFXTrxRToJxKIiYBt8gCDJYKfCZU=;
	b=m/p2ltQU07FOSRB/0oMKIbbKi0qbzJtaRXnTmnrjKmzo91ghJsUWwrxWX37v+aFW9fAbr5
	cNp5+8gyWon33wVe5J7wtlGzhgaR9d6t1Z2kJGJUAMQr8jbjzsqIeNL6AedHp7kxcL+WVh
	dCZGJHMOscWUC/sMLkGk94CqgLljSvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734335101;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErN9wcGBgiB6JprkFXTrxRToJxKIiYBt8gCDJYKfCZU=;
	b=3nz2fXgxmUgckT/dc1Y+F2wHfc+aBr5cjtyriaVo3Zo5anrzSfvl7SkJO5+DYXfFitEeMN
	l/sjuB4LUD6ZzWAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5F63313A62;
	Mon, 16 Dec 2024 07:45:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EOoXFn3aX2egZAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 16 Dec 2024 07:45:01 +0000
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
Subject: [PATCH v3 3/3] drm: rework FB_CORE dependency
Date: Mon, 16 Dec 2024 08:42:49 +0100
Message-ID: <20241216074450.8590-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241216074450.8590-1-tzimmermann@suse.de>
References: <20241216074450.8590-1-tzimmermann@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,arndb.de,gmx.de,linux.intel.com,csgroup.eu,ffwll.ch,gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLykjg6e7ifkwtw7jmpw7b9yio)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -6.80
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Arnd Bergmann <arnd@arndb.de>

The 'select FB_CORE' statement moved from CONFIG_DRM to DRM_CLIENT_LIB,
but there are now configurations that have code calling into fb_core
as built-in even though the client_lib itself is a loadable module:

x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend':
drm_fb_helper.c:(.text+0x2c6): undefined reference to `fb_set_suspend'
x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_resume_worker':
drm_fb_helper.c:(.text+0x2e1): undefined reference to `fb_set_suspend'

In addition to DRM_CLIENT_LIB, the 'select' needs to be at least in
DRM_KMS_HELPER and DRM_GEM_SHMEM_HELPER, so add it here.

This patch is the KMS_HELPER part of [1].

Fixes: dadd28d4142f ("drm/client: Add client-lib module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/series/141411/ # 1
---
 drivers/gpu/drm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 55ce61a46984..2f51546b0b88 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -99,6 +99,7 @@ config DRM_KUNIT_TEST
 config DRM_KMS_HELPER
 	tristate
 	depends on DRM
+	select FB_CORE if DRM_FBDEV_EMULATION
 	help
 	  CRTC helpers for KMS drivers.
 
-- 
2.47.1


