Return-Path: <linuxppc-dev+bounces-13336-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E4BC0E3EF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 15:07:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwFgf6ly0z3btx;
	Tue, 28 Oct 2025 01:07:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761574030;
	cv=none; b=AM5157PYSH7uYwKlmQ7PDXUAah8dedTM2xQLOKCXvEG1rABRfR8lMqMLuhDEqWbs0yGZpznq8gwuQPdGYm02jzFsPQM9VXRxT5dk38iMgLyp2bE+EFNj5UcGOBLGLWdsJ2IAkMz777B4SwsOSqltlax/3etWqwNJ8f9F+4rhDJZbjDu4E92EHJU7VVOkPPiZq65AYYQBuuVfZlvhW/SEGRHRXNL3WvJfXzHdAowAR6QPJJvDqKk5vsWMAA5USEyKQqGGLImAesIUi7ceGUl7FEX6rn1mGFYC5Pgp/kwq3iYtcEbzzHSi9dUmumubi85Xcco6LL3PjGjeoaDUGwlR8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761574030; c=relaxed/relaxed;
	bh=UMBRz3/kIbljTwwKsAee9oUPo7ZO+qDa/VXbEIyCMYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cPiwbg9tn4NwetE7FxoPb0RRPg8BwiUQgAFZVsL3wiqjDxxuy0V2S98jI32JFz2XfxQDA4lRriq5Mkd2YwncqLN7xBxwVYGFdaZm/CkQ7vyheaPbzJyaTv360YS8uvfewcoat0c5rs427d/Kh+nExOO+azHAjQWuu/UGh6huBa/AnQ3vSbkHlierxC1ezZM269dWuUh2JDs6PBVzVghTX5Dzx6ks6IAAOGfr6KhskY57/3FU6YAsLVjzM5b0lXRJPW/nJUfsWqrR+8d+bho/mfRuopJynxrWWjj9Yd7Ia3IfAp9TW522BqK9mIgVYCusKxX83jsOrIsdvhjXCUaElQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gUnzp/E5; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wy72e1WP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gUnzp/E5; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wy72e1WP; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gUnzp/E5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wy72e1WP;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gUnzp/E5;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wy72e1WP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwFgf03B2z2ypW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 01:07:09 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 844F51F460;
	Mon, 27 Oct 2025 14:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761574011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMBRz3/kIbljTwwKsAee9oUPo7ZO+qDa/VXbEIyCMYc=;
	b=gUnzp/E5dgeNK4utjFx35ty+Oa/lR5jZzNWH4TjgFhibqHBCP2KK6hphD4ZSyD9hALnG5R
	lkKNqPIkgiDPmIF2LfNZDN/Gz+xP8TzUIuFEqQJFmhW7u3/hvL884lf8SKRH5oDs8M+zA8
	rAQh91cHYU1RaF+b+KXKOTvu4p5XvMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761574011;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMBRz3/kIbljTwwKsAee9oUPo7ZO+qDa/VXbEIyCMYc=;
	b=wy72e1WP2bK7cNl5kZIo3AjYLeGz49QHkkmiG04jKEEgglYWm6HYgIIDbWWbcJLEkNpG5Q
	jbNsOpoJpagUaPBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761574011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMBRz3/kIbljTwwKsAee9oUPo7ZO+qDa/VXbEIyCMYc=;
	b=gUnzp/E5dgeNK4utjFx35ty+Oa/lR5jZzNWH4TjgFhibqHBCP2KK6hphD4ZSyD9hALnG5R
	lkKNqPIkgiDPmIF2LfNZDN/Gz+xP8TzUIuFEqQJFmhW7u3/hvL884lf8SKRH5oDs8M+zA8
	rAQh91cHYU1RaF+b+KXKOTvu4p5XvMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761574011;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMBRz3/kIbljTwwKsAee9oUPo7ZO+qDa/VXbEIyCMYc=;
	b=wy72e1WP2bK7cNl5kZIo3AjYLeGz49QHkkmiG04jKEEgglYWm6HYgIIDbWWbcJLEkNpG5Q
	jbNsOpoJpagUaPBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 27FBC13693;
	Mon, 27 Oct 2025 14:06:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MMhUCHt8/2jMdwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 27 Oct 2025 14:06:51 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH 2/2] macintosh/via-pmu-backlight: Include <linux/fb.h> and <linux/of.h>
Date: Mon, 27 Oct 2025 15:05:41 +0100
Message-ID: <20251027140646.227025-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027140646.227025-1-tzimmermann@suse.de>
References: <20251027140646.227025-1-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,linaro.org:email,suse.de:email,suse.de:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[linaro.org,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,kernel.org];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Include <linux/fb.h> and <linux/of.h> to avoid dependency on backlight
header to include them. Declares of_machine_is_compatible() and defines
FB_BACKLIGHT_MAX.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 243ce64b2b37 ("backlight: Do not include <linux/fb.h> in header file")
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Closes: https://lore.kernel.org/linuxppc-dev/CA+G9fYs8fn5URQx2+s2oNxdUgZkSrdLC0P1tNBW_n-6BaBkK2Q@mail.gmail.com/
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Thompson (RISCstar) <danielt@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <danielt@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/macintosh/via-pmu-backlight.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/macintosh/via-pmu-backlight.c b/drivers/macintosh/via-pmu-backlight.c
index 26bd9ed5e664..d91825bb0a5c 100644
--- a/drivers/macintosh/via-pmu-backlight.c
+++ b/drivers/macintosh/via-pmu-backlight.c
@@ -11,6 +11,8 @@
 #include <asm/ptrace.h>
 #include <linux/adb.h>
 #include <linux/backlight.h>
+#include <linux/fb.h>
+#include <linux/of.h>
 #include <linux/pmu.h>
 #include <asm/backlight.h>
 
-- 
2.51.1


