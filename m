Return-Path: <linuxppc-dev+bounces-3912-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 686C09EB367
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 15:33:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y71Rj34vpz2yyy;
	Wed, 11 Dec 2024 01:33:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733841185;
	cv=none; b=R855tHOj3fWvCxWteJQPThcIUL700xu0HmqeE2h+8E0D56pebH4hgYPtRYQqGL26sklkMFm/FxFfd60fbf+ZEixf81FGryhDdEHP9FhUMzC/+Z9XuTSgcU2nQsqtMnMbqTeDi3MbdQPPAzCheAhEHkbmNl68wT9sXMkU3QdBKaQAh+6rL2E8C+qRv5g1j8HnoZ7czfGiGtn3s4aFu2B1PA20dKh54W/ffuLcav+av/wQdp4lIiWPuJY8YsDx2XLB269O77JGCn7rKU11or7mY6+eTUrw1nHm2KXY9MEI2C0fmIkwp3CmJ4Icmy7audHPzl3FLFc9ykCCsdABfCjGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733841185; c=relaxed/relaxed;
	bh=GB9q3GASfVdx/kiMIAlNdjcRL4d4cfHFx+cud4xXi/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ww86miYzKeMUfvDyTFs6V/lDLFzftfUMu8aUFxnB68dikFz6HhYbTKmMW56eUYxka00qzk6UKr9z2utBd4HlsPSFqVtn1SmxcAwr+tlFJ7gadbY3WtjegpPqOGIasyDWdWhWDgTeB1R+yMwyfBhike86WTWFSQHuuVLKxomMb5sP7YzFIBj1JcvCg4rC5fCaTdqZ78FisNA5aMzIIkBvrv/tvxa/SCiU01XM+MTjNckGGJChxfhNJ/4mQaxZb9tpz/CF/QPvPMk2HhNDJQiFZ2KLq/sHM6dLs/J66DgV2HQxxa1gU+yig9PIBThJBzrJwMoNDXZoXJKSuSKfwARXsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VOve/0JE; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aYh3RYDp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mrUxiBCl; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Y3FFs/gu; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VOve/0JE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=aYh3RYDp;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mrUxiBCl;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Y3FFs/gu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y71Rh3rlNz2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 01:33:04 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E7A2221166;
	Tue, 10 Dec 2024 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733840617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GB9q3GASfVdx/kiMIAlNdjcRL4d4cfHFx+cud4xXi/M=;
	b=VOve/0JEHjApS7cwwJv88EzR7fOFa74+ds4btSsDXKrCXlDHhlf3fpFg1xWyAqv+WK7ym+
	z190UBtFp3aLwEAhT0j5VbZKU/yqpe8wyqFQbAcH81z9TJd/skUyt6vE60ZiyBE0FwL0HI
	3H6iKjNmpTHwKeQoOi46QCWs6bgiwVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733840617;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GB9q3GASfVdx/kiMIAlNdjcRL4d4cfHFx+cud4xXi/M=;
	b=aYh3RYDprAiGxhICTUYkh45iw4Mx2cC7+6T/oD1LDWiCJCwaiffXZpzkQNU+oivROCUcNR
	PN6OnMRt69zjNJBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mrUxiBCl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Y3FFs/gu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733840615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GB9q3GASfVdx/kiMIAlNdjcRL4d4cfHFx+cud4xXi/M=;
	b=mrUxiBCl6UjVc0YOankPUNv5KtIiboJ6Jh71LKpv5Gi4f/rq6T3/XSl4CNQbU8YhKMq+s3
	ccEdI5tSLEGpFT+2UbBU8RYwUcB1uyg7KGXOuPWH69QTQBJ/cxCEb2oIVDzp6HeOHQUswb
	w3KoT07Rlczellls6ti5VBkfyIj42hw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733840615;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GB9q3GASfVdx/kiMIAlNdjcRL4d4cfHFx+cud4xXi/M=;
	b=Y3FFs/gurgcR84Gnh7EVeA1eqV8J3py4LRELHbnAvqcd/fyuuxLVNyHaYPYf/6ForD1TFd
	1sEHLNx8qOzo8xBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E78713A69;
	Tue, 10 Dec 2024 14:23:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kNJyJedOWGfREwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Dec 2024 14:23:35 +0000
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
Subject: [PATCH 3/3] drm: rework FB_CORE dependency
Date: Tue, 10 Dec 2024 15:09:56 +0100
Message-ID: <20241210142329.660801-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210142329.660801-1-tzimmermann@suse.de>
References: <20241210142329.660801-1-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: E7A2221166
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,arndb.de,gmx.de,ffwll.ch,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,arndb.de:email,patchwork.freedesktop.org:url];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLtfyjk8sg4x43ngtem9djprcp)];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
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
index 6105a55eb464..d4efacbb24a3 100644
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


