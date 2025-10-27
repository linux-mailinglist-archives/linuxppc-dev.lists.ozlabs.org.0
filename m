Return-Path: <linuxppc-dev+bounces-13335-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B35B0C0E3E3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 15:07:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwFgS1Rv5z2ypW;
	Tue, 28 Oct 2025 01:07:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761574020;
	cv=none; b=ghsu+ZuME6bztcwngDTo5rTJDza2Vmjtdw+87MKMsEwmPBOw/uKOHC4bxCjYj4NPOR9G1I/ZFq2hCJL4DGO2qz/RBPht7L+uebxUIu71cWxwqLx51Ti3zp0tZ38x/o2tNrpaetpEMfPfx0BV0EeGHqHAxREkhHVZWtwK13Z/dQ3oBee7AMgAeUApHPZF6wkp9XzQutPWqlQyCFSgRVoDKKCX09GgIiIs5mLddvx+KvSKL/kOyI8Y6GYrZahGzMbKtRkwKVjVXRcd9MxpPdMxhLc4oJjGSren+3DMtVkQ9mFuYT0JjUSTFIuuywpz1jxTSNJPpaXGAnkNs/dUDadcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761574020; c=relaxed/relaxed;
	bh=kjdzQm5exJwMkoECe+jmGekr6J14A9CfzON8t7SsrV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBjQuX2IrcTlyB+xAB8FyeSCTg/xOImDteAyBwWAqo92e3pRUHkY22GVdTIok1lDNla7APzpK96B1fa0Q3jGru5QYDqBKX9Dp46LD0YGvcC+M/10DLxZTj/SqERMzXs0A30qdrAihfdocFtXDP9qfLLfCJLzHAlK5rWAKuzLMuIwpchL26PonFwqJgkY0qLMGpWCSfAwD1nY2u7AvaThLHhAGRj2C5OE/p354pVLnIAEqpn9rixxbOQtgPPbZCGh16sZCqaQ0GcPv/DFMgtcKEvEA9Z4lDe6n+sa2f4RvG0jBeIGVV8hm6AoQxoqD9OQhGlyVPcSnh3klAgYWw3fog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PJN+i/fv; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UYvCBPso; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PJN+i/fv; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UYvCBPso; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PJN+i/fv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UYvCBPso;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PJN+i/fv;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UYvCBPso;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwFgR0QbGz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 01:06:59 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 21CF41F45B;
	Mon, 27 Oct 2025 14:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761574011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kjdzQm5exJwMkoECe+jmGekr6J14A9CfzON8t7SsrV4=;
	b=PJN+i/fvebPtfIVO990VczsvcpPFlX4L+lrKt5cueUHrSZuTOoDpS9XRAXbAFKABtSEWT9
	xg1FnK0GjsoZiDn/cD2mfEpOQmbXhJQWhkTlGe2PIzhYbgZ4eZeLfIyScDDzEzsF2B/cX4
	VAxxIeXRTnVq+WkGTv7KQ49wuvfviCc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761574011;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kjdzQm5exJwMkoECe+jmGekr6J14A9CfzON8t7SsrV4=;
	b=UYvCBPsolpFjoDTCPVJ3UkWAbCXR9XrBURjvdympOicBORo2grSippHdTSCsP52qOalFaV
	pZ1SvPykKPcPNOAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="PJN+i/fv";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UYvCBPso
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761574011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kjdzQm5exJwMkoECe+jmGekr6J14A9CfzON8t7SsrV4=;
	b=PJN+i/fvebPtfIVO990VczsvcpPFlX4L+lrKt5cueUHrSZuTOoDpS9XRAXbAFKABtSEWT9
	xg1FnK0GjsoZiDn/cD2mfEpOQmbXhJQWhkTlGe2PIzhYbgZ4eZeLfIyScDDzEzsF2B/cX4
	VAxxIeXRTnVq+WkGTv7KQ49wuvfviCc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761574011;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kjdzQm5exJwMkoECe+jmGekr6J14A9CfzON8t7SsrV4=;
	b=UYvCBPsolpFjoDTCPVJ3UkWAbCXR9XrBURjvdympOicBORo2grSippHdTSCsP52qOalFaV
	pZ1SvPykKPcPNOAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF5DF13A9A;
	Mon, 27 Oct 2025 14:06:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gH6ILXp8/2jMdwAAD6G6ig
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
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH 1/2] powermac: backlight: Include <linux/of.h>
Date: Mon, 27 Oct 2025 15:05:40 +0100
Message-ID: <20251027140646.227025-2-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 21CF41F45B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[linaro.org,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,kernel.org];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -3.01
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Include <linux/of.h> to avoid dependency on backlight header to include
it. Declares of_find_node_by_name(), of_property_match_string() and
of_node_put().

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
 arch/powerpc/platforms/powermac/backlight.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/powermac/backlight.c b/arch/powerpc/platforms/powermac/backlight.c
index 79741370c40c..1796327955c6 100644
--- a/arch/powerpc/platforms/powermac/backlight.c
+++ b/arch/powerpc/platforms/powermac/backlight.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/backlight.h>
 #include <linux/adb.h>
+#include <linux/of.h>
 #include <linux/pmu.h>
 #include <linux/atomic.h>
 #include <linux/export.h>
-- 
2.51.1


