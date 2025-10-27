Return-Path: <linuxppc-dev+bounces-13338-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C0AC0E455
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 15:12:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwFnd4yxKz306S;
	Tue, 28 Oct 2025 01:12:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761574341;
	cv=none; b=dAm+EYNJrqd3TXan+fi85vNVu7m8f3Kxx8onq5FBbdWSYs+Kq3cP+HQetMJojxuFEges7lWWQtQ8VX0enrY6rhPOvySkni/XqjbtUgjgCkY5+CFHa6usUW8ri3ewDjoPX345doKRAqXDOic7ndfcz0pxuMTF/8HZT/Kq7yfGI7VIbSJGKgPVQ9WYRtyaANvnD1dyVTzaFV1+Te9q+PLjKpc+JCZkg1P+d0Nd8xS7Z/Ww60o0rlneQanuSDlZqST5LQHKqRZEWSNz6IGOTAJhqRwLfN7pkQYDZsrPaQvdqyESIHhf8MzS6wJLCu2Gvvy0M168oq+BvLzZyACby8Hn7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761574341; c=relaxed/relaxed;
	bh=fO0TbvnWdk4B6flZBNryj4UTlawtK3PKy0XxEAgaHLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NH0PZQh4dmMCwjHlGc6ezx0bVJIDuQNi69petvc7jK1dS9Lujz55pF245TlbyS2X3W+AvWzjoxWgOcLeaTicJOKeTe5VkRbrtYDXivsp43SVXpaCY9STGCbQVCL1V2l9ilbB2B9s6s/u5S6QLkex6R5KaX9Bt591cxfM6VPfoZ73g9BR5z+WwlvF5C7Bc3nvfUW6IGSDpuo6RYOGNX8gJ0NO4FbqoMkzTVg819CzbcBL+w81/z/75JFp4jO7vcdu1Go59xwnzH7qzrpZPd3sPbIFr7ibakLugle44FXZ6SOkfAL5f8x25AsfE75eOxbCZDrKGaqEbOlnhxW+vL82LA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aWUyu4iE; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6LpRkn2u; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aWUyu4iE; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6LpRkn2u; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aWUyu4iE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6LpRkn2u;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aWUyu4iE;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6LpRkn2u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 321 seconds by postgrey-1.37 at boromir; Tue, 28 Oct 2025 01:12:20 AEDT
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwFnc3ZXbz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 01:12:20 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B8D9421A3A;
	Mon, 27 Oct 2025 14:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761574010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fO0TbvnWdk4B6flZBNryj4UTlawtK3PKy0XxEAgaHLQ=;
	b=aWUyu4iEHcsIH/QUqscncDi/GtVg8fov4PogbF8kTQXGOq8tH9btyFyGXpFBRpreCDlLnN
	OlSjQJ0tCRTF1BwdkCBbNYyxqM8ZcFCbv8yG2IKP80vFQl5GHglEk1GgpvSpKxQRbZ6mXe
	KPZXkrObMQR9uKhhmeDlG+8zaJW7OAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761574010;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fO0TbvnWdk4B6flZBNryj4UTlawtK3PKy0XxEAgaHLQ=;
	b=6LpRkn2u5YixPleU4NEjy7by9nFIUmyTwN+t6xd8F9OeaorRMWoMgelFDskX1l+NLajY1M
	M/6wYaa8nloLmSDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aWUyu4iE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6LpRkn2u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761574010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fO0TbvnWdk4B6flZBNryj4UTlawtK3PKy0XxEAgaHLQ=;
	b=aWUyu4iEHcsIH/QUqscncDi/GtVg8fov4PogbF8kTQXGOq8tH9btyFyGXpFBRpreCDlLnN
	OlSjQJ0tCRTF1BwdkCBbNYyxqM8ZcFCbv8yG2IKP80vFQl5GHglEk1GgpvSpKxQRbZ6mXe
	KPZXkrObMQR9uKhhmeDlG+8zaJW7OAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761574010;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fO0TbvnWdk4B6flZBNryj4UTlawtK3PKy0XxEAgaHLQ=;
	b=6LpRkn2u5YixPleU4NEjy7by9nFIUmyTwN+t6xd8F9OeaorRMWoMgelFDskX1l+NLajY1M
	M/6wYaa8nloLmSDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 570D113693;
	Mon, 27 Oct 2025 14:06:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LIXJE3p8/2jMdwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 27 Oct 2025 14:06:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: naresh.kamboju@linaro.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] powerpc: Fix backlight include fallout
Date: Mon, 27 Oct 2025 15:05:39 +0100
Message-ID: <20251027140646.227025-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Queue-Id: B8D9421A3A
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[linaro.org,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,kernel.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -3.01
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fix the fallout from a recent cleanup of the backlight header.

Thomas Zimmermann (2):
  powermac: backlight: Include <linux/of.h>
  macintosh/via-pmu-backlight: Include <linux/fb.h> and <linux/of.h>

 arch/powerpc/platforms/powermac/backlight.c | 1 +
 drivers/macintosh/via-pmu-backlight.c       | 2 ++
 2 files changed, 3 insertions(+)

-- 
2.51.1


