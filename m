Return-Path: <linuxppc-dev+bounces-2907-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D449BE7A3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 13:16:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xk41Q3TGlz2yTy;
	Wed,  6 Nov 2024 23:16:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730895370;
	cv=none; b=cx1C3FlmtF5DkTBIDwZlddWDk5PmtmI3tc1IM/krn5Ljj/EaJfpm+naGeuzOwnMV/IwB5gTHYKjvdNbNPWlHpEfYwgEl1exaHVLyvqrlWg8y+MjIBsWWhAgYCAO2tN3ajcwKpg8teseUR5Bi9yLr/ov9aSisoeGUHjSddFvPxJaSxQAeoInpxUQqSr+jg1LF6d/tjL4E14Yd6VwfyuiJvxdyyUcMANMuhRC3fAET6C4F1Rf5uE8kA4r3WNqfzE8zWPKO6Ht1aYPwWRwUjnh3Ue+ing35vINo3RaiADfOTpqAR5ZGITOdMqteP43h4rJvH8zi7ZFZoXCvV29yuQBUnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730895370; c=relaxed/relaxed;
	bh=8ohwiTc+yZhDyRvRbtXG6pJM+owozZa197xSwSi956s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nwnAsKRV2+on8ApPfnj4ehYoHX/3LAxgP6baqiObTkciU5xAcOMD/Bcw5tUE7NE42gTqgkkL7ylPI8d4Uf2l5/14Rl3vgQsNzRDcWqRwqgBrhGrQDOId+r47h21ogEXaBwuDJ3xMVzpKlPBqDDsPflUtzk+MZvFrPNyCMuLhQCeE8Exd/VQIMOTv7A4VgsZlZ9ISKQuzdzApOZEwpu8BweJWhRGeyfe4NB2ihMq0ddE2WgFXQecLds+gotIhenB153TGPPFK9HsEUu1Rbw//RmJqWiKQe7V1TSzSOFWUZ9KpE5bZnsAtgQYv0Xf7yRK/S5lzREaxCXreJcJfPSrJQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pLpXnFk/; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hNLG7Mek; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pLpXnFk/; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hNLG7Mek; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pLpXnFk/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hNLG7Mek;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pLpXnFk/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hNLG7Mek;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 332 seconds by postgrey-1.37 at boromir; Wed, 06 Nov 2024 23:16:05 AEDT
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xk41K4S3wz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 23:16:05 +1100 (AEDT)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	by smtp-out1.suse.de (Postfix) with ESMTP id B212D21CB9;
	Wed,  6 Nov 2024 12:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730895022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ohwiTc+yZhDyRvRbtXG6pJM+owozZa197xSwSi956s=;
	b=pLpXnFk/ycD+ULfoIakRcKlvXI5oUXDANOX4VJs3LOyoEWXt2wCuNjXLXwEs0fYddQUEcm
	kVFqrE/cm1N4XnPWdKHxXzbUFmdSxItvKEx8psbvDrxsug35o0yPtAw+o2X2MAdu1mQGuL
	3or5unDeqOGozBmIXbB0W4o4x3WxAFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730895022;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ohwiTc+yZhDyRvRbtXG6pJM+owozZa197xSwSi956s=;
	b=hNLG7MekLxD2oSy9GQ81JHS6Syztv0ET2URzJ2oIrG4qJ9W8/DIHAItGY+v0gWuZ2CsF8Y
	IP/1fWptmtgTdGBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730895022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ohwiTc+yZhDyRvRbtXG6pJM+owozZa197xSwSi956s=;
	b=pLpXnFk/ycD+ULfoIakRcKlvXI5oUXDANOX4VJs3LOyoEWXt2wCuNjXLXwEs0fYddQUEcm
	kVFqrE/cm1N4XnPWdKHxXzbUFmdSxItvKEx8psbvDrxsug35o0yPtAw+o2X2MAdu1mQGuL
	3or5unDeqOGozBmIXbB0W4o4x3WxAFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730895022;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ohwiTc+yZhDyRvRbtXG6pJM+owozZa197xSwSi956s=;
	b=hNLG7MekLxD2oSy9GQ81JHS6Syztv0ET2URzJ2oIrG4qJ9W8/DIHAItGY+v0gWuZ2CsF8Y
	IP/1fWptmtgTdGBg==
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Cc: Michal Suchanek <msuchanek@suse.de>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Danny Tsen <dtsen@linux.ibm.com>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nicolai Stange <nstange@suse.com>
Subject: [PATCH] aes-gcm-p10: Use the correct bit to test for P10
Date: Wed,  6 Nov 2024 13:09:33 +0100
Message-ID: <20241106121019.25629-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240923133040.4630-3-dtsen@linux.ibm.com>
References: <20240923133040.4630-3-dtsen@linux.ibm.com>
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
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gondor.apana.org.au,davemloft.net,ellerman.id.au,gmail.com,csgroup.eu,kernel.org,linux.ibm.com,vger.kernel.org,suse.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.de:mid,suse.de:email];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

A hwcap feature bit is passed to cpu_has_feature, resulting in testing
for CPU_FTR_MMCRA instead of the 3.1 platform revision.

Fixes: c954b252dee9 ("crypto: powerpc/p10-aes-gcm - Register modules as SIMD")
Reported-by: Nicolai Stange <nstange@suse.com>
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/powerpc/crypto/aes-gcm-p10-glue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/crypto/aes-gcm-p10-glue.c b/arch/powerpc/crypto/aes-gcm-p10-glue.c
index e52629334cf8..1f8b67775658 100644
--- a/arch/powerpc/crypto/aes-gcm-p10-glue.c
+++ b/arch/powerpc/crypto/aes-gcm-p10-glue.c
@@ -414,7 +414,7 @@ static int __init p10_init(void)
 {
 	int ret;
 
-	if (!cpu_has_feature(PPC_FEATURE2_ARCH_3_1))
+	if (!cpu_has_feature(CPU_FTR_ARCH_31))
 		return 0;
 
 	ret = simd_register_aeads_compat(gcm_aes_algs,
-- 
2.46.1


