Return-Path: <linuxppc-dev+bounces-16787-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLrHGpp/i2mPUwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16787-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 19:57:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D37B11E77F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 19:57:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9W5f5GVHz2xQ1;
	Wed, 11 Feb 2026 05:57:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::835"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770749846;
	cv=none; b=mSZf3DRghVi7D7DLnOt+HtR1kqJy+ao/8ri3ve8sf1uWm36Ue7NJzgAiciXgGujxr5v79HESGQt3haVOuFpvyuI/3uA/5VaHq7QXr+jwP5E/s0pySq7TZm238f0RUcSuIGxluIuVCMxSdecaC5XrxLd7QZhGdG0JpjIAG9wPzFyuWQT4zUK5zedNgv8hV1Dt37HMnCiBFraYSfNV1Q1xzWq8Je+Yt0kuONFl28xiKLbkeTt3O/08Q1gAEhJDAnpQ5TI0VVoqrxRTmKmMfSEyI4F+KZWVlvANpO6Ut+7BrrHCgxTBkqvmVtqVoy116fnSLVjugUuMMwIP3VUVXdjFqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770749846; c=relaxed/relaxed;
	bh=EsOvx8MYis3OxBhDDm84POW3mkp8XwXXG9CZxnTszuM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UdBDlMnPjxSL+F62QhC4qbOdzql52r0dT9V5N0giWbM6EKa6CvRmgwyXc3RHA+0+BIP6mvIT5Xs8ZK490yyaNjJq4awR45YukosI6SY3BmpBOrb9Mura15lPTUHApzsIv9NJyHaNjkGrMLsGeCWgc64f2TYI7pJCS0lSZWZ7KtbbHhY8c0AQUO/CUd/uTXDPtarTVf2pXCGuBRYK6M1fyGa7xHRlD0pth9AQADtfSgLGG6MDjmKTuy5gbvqJpFbATvmQmwdQSHIao6zREJSeOpBB3dqg6kh/+rS9w6/tXjrr6n422exrKJUdXOCAGaj5TuU9hlNJVVivNJtqy3Q/rQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; dkim=pass (2048-bit key; unprotected) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=iHgD1jpj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=n7l8m4@u.northwestern.edu; receiver=lists.ozlabs.org) smtp.mailfrom=u.northwestern.edu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=iHgD1jpj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=u.northwestern.edu (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=n7l8m4@u.northwestern.edu; receiver=lists.ozlabs.org)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9W5c4xmJz2xKx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 05:57:23 +1100 (AEDT)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-50145d27b4cso68518331cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 10:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770749840; x=1771354640; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EsOvx8MYis3OxBhDDm84POW3mkp8XwXXG9CZxnTszuM=;
        b=iHgD1jpjmDgmoJ0JOKRyAWW21HeEqW1msh15oLap6wVPKDTPPmv1w7nsZfEBa2F0sF
         a6L4Rab+LXJDK8AtttR1h36oArMhMQrNLbKhUcQm3tP9O10fajzNC3lDNXvy9pGbUJQT
         eKsD3ytGI106MrTZZ9sefESxMcwnmGxTFziJ/BAWBNl7oft7gBPB+UorTW19CQxVB+Pn
         xEbK9jRbY0iURGbisdbYszhFjj3Df3KmTFIBu3JVpdpu+tR75lE4uTA5K9omMO5owKgk
         rq7nRzXhekQ/Vf+OGknfc1hcID+xEEDAQWf0T2kXnOVVoNuQOP3k52gSMcUXpiz33WJN
         yBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770749840; x=1771354640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EsOvx8MYis3OxBhDDm84POW3mkp8XwXXG9CZxnTszuM=;
        b=j79u/3Y8iDwLsi+LP134N1SnTs6vcorbH7rGGIxSVZjPN8AHQTmgwb6pqJxWWe4GUD
         Zo8Wh/KPZHB4rm1xMz+Kmzf4oggt+wSt/udCGSc6bdY/JbDg6griz36oYw4YC1Iq/rkO
         w6i924W3ZPdV4I48A54TUJlWEsw6wvayQJx7rSrexZr1MBWK18ZyvITiDywpa1P3vXW4
         IcDJ+gAE75XTeVJzMzGHVmQDBCD8BJPQ9AdaEuYJ4Ld8iYKrQoMeKSfdtkhjaFhagXWW
         w5Qc4Pzbb1qBkwIQHB4MTmL9M0icMMK5bD8mcYXipgOWpiKBxVBmPkuY0dCHoikGAIeJ
         5H8A==
X-Forwarded-Encrypted: i=1; AJvYcCXehohqSVKprIIxeXOadKjTznly9xvQs6Pzw/fhdEw5vV2+VW6i1rLKeaNITtt6Bj+eRwXFrXYmDEKY1Js=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwrvY8n+CEnHjT4lRUV66Ojq7dAluZHU0Vo8ZUS2+0+aMr6qSay
	09FaKcw3dT0lC2WOxFyZfrOcgJI5XKdiAn2Ys6RfpVFjL2KD+giWZGHgFDPjuSkoLuU=
X-Gm-Gg: AZuq6aLZ7HVu8hB/wo1yvGXtDYrFROn8kiA/odPRtTszEq9cIC9gUU6meH/rpwe93uZ
	wOdPBtu7HQ6i0Icx4kVDuBFGniLp23m6y8k/l6Iqj0tMuRyetToSToRxQPUx7+Qufzw4yGQmRYB
	BHK0EaygfoiOKoAF/jizisBKzWU0ti/RPljU81E83T4Od0XuhAxDblyJKbQKqkB9i/+um9lxxSr
	FJFMVmqOApnkZ0aA7/Sn38UuaNKl+WJw+tAdV1oxYlpYBWIZbzz55E8JVbjzbuuDSqySGiyZqtc
	pCgfaMwkvIWYGkHWULsVggQcSyQL+fPlEIrcjNFRQEwGqXte9zhnt4Mk9nzy2/ruQiIJkG+JRkU
	NJgn2x+YEWSePnh4vL5BB9U7cQeIfgK6tA+hnZLMq+5RgdDxg9tYxP8KN4AmQPZKDRMdinHpahn
	ehQ+u5QMtRmrNURTmxLIPkDtAq6jz0ICle+CIooTJ4eMCJGrL/lZI0/8gCfGoqR4NzLBUriDFId
	/KQOdNfsjwrWwx85LbvfzUAmvTu8x5eWYCUoJZMPSM=
X-Received: by 2002:ac8:5952:0:b0:502:a063:c439 with SMTP id d75a77b69052e-506399e4349mr205718631cf.80.1770749839732;
        Tue, 10 Feb 2026 10:57:19 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392c1d4esm106040631cf.27.2026.02.10.10.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 10:57:19 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Mark Brown <broonie@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH v2] ASoC: fsl_xcvr: Revert fix missing lock in fsl_xcvr_mode_put()
Date: Tue, 10 Feb 2026 18:57:14 +0000
Message-Id: <20260210185714.556385-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
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
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[u-northwestern-edu.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[northwestern.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[n7l8m4@u.northwestern.edu,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-16787-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:alexander.stein@ew.tq-group.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:n7l8m4@u.northwestern.edu,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[u-northwestern-edu.20230601.gappssmtp.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[n7l8m4@u.northwestern.edu,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org,u.northwestern.edu];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[u.northwestern.edu:mid,tq-group.com:email]
X-Rspamd-Queue-Id: 2D37B11E77F
X-Rspamd-Action: no action

This reverts commit f51424872760 ("ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()").

The original patch attempted to acquire the card->controls_rwsem lock in
fsl_xcvr_mode_put(). However, this function is called from the upper ALSA
core function snd_ctl_elem_write(), which already holds the write lock on
controls_rwsem for the whole put operation. So there is no need to simply
hold the lock for fsl_xcvr_activate_ctl() again.

Acquiring the read lock while holding the write lock in the same thread
results in a deadlock and a hung task, as reported by Alexander Stein.

Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Closes: https://lore.kernel.org/linux-sound/5056506.GXAFRqVoOG@steina-w/
Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
v2:
 - Refactor subject line style
 - Include human readable descriptions
 - Fix the sha1 information for sound/soc/fsl/fsl_xcvr.c

 sound/soc/fsl/fsl_xcvr.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 5de93f458b56..a268fb81a2f8 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -223,13 +223,10 @@ static int fsl_xcvr_mode_put(struct snd_kcontrol *kcontrol,
 
 	xcvr->mode = snd_soc_enum_item_to_val(e, item[0]);
 
-	down_read(&card->snd_card->controls_rwsem);
 	fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name,
 			      (xcvr->mode == FSL_XCVR_MODE_ARC));
 	fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name,
 			      (xcvr->mode == FSL_XCVR_MODE_EARC));
-	up_read(&card->snd_card->controls_rwsem);
-
 	/* Allow playback for SPDIF only */
 	rtd = snd_soc_get_pcm_runtime(card, card->dai_link);
 	rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream_count =
-- 
2.34.1


