Return-Path: <linuxppc-dev+bounces-16777-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2M5IEOBCi2mfRwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16777-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 15:38:24 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4D811BF71
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 15:38:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9PLf2kTQz2xQ1;
	Wed, 11 Feb 2026 01:38:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::734"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770734298;
	cv=none; b=YusBIoeafHLIIqoJJPOtOwAc1KTC9HI+SgTpVvoX5y1HjuQGGry04UREzWKpBubiUKDjSPBg9dda3XxiLca3qawMaUf5miB3NYEbGKArpeKbxoOOSwUaI6ZQtxAfePgEnpemLiTMkk5OsCFDrpeosACSPtLWgdrnJVIeCRvk8rMmhPBWYIhVbAAPBWTrBdhEnrU5dK0xSGeZiPS1O4bOepzxXF8UrvVIqt1r1FWthFsYcn7SNpd7xTv/DUwk2et3cXnPq3ZbLMvOT8NBGS0OCzfG5H35o0/zJi7FLyp8YaixxJdU89JZtZ6gC3yaaGyUsgSmGCPOINcPVwJf5sV4Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770734298; c=relaxed/relaxed;
	bh=pkYuyRwsnTcRNpSowH2WXxBKWT/+EdlbZCcoZtFynkQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HOsteZJzDVC737Aq37mvvx/UdBkvfWI3j8pi9kP1dGTeocx7omSGcWfuQc+wZ6o6bgvgc5vWJ9jSds0Pg4tsa3NyCLCxEvFUV05aHuHpfMQBAFVXnSoz1Q4/Qr4JKJYMRKmtpLbgYSeH8GH4c/eQIHTY8xBQgD0JmGwPDKJMykjYXPkulKC4iG77XNPnO1R4W5gYR/iT72GClzdoez/QNfwpU29SRfmauLvSYHKdjytLROxHM+vKVcAJ9HsP0XdzZVHjad59VfNDocYEYvIlPuq5E7nYBIetY3tkkTkl0+XFwhnjUi8FZygy2UKnLu/R9iUxOV6qxf2wnbBzVDOAkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; dkim=pass (2048-bit key; unprotected) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=NEnXAja0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com; envelope-from=n7l8m4@u.northwestern.edu; receiver=lists.ozlabs.org) smtp.mailfrom=u.northwestern.edu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=NEnXAja0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=u.northwestern.edu (client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com; envelope-from=n7l8m4@u.northwestern.edu; receiver=lists.ozlabs.org)
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9PLc5qXgz2xKx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 01:38:15 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-8cb1c4679ebso146175685a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 06:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770734292; x=1771339092; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pkYuyRwsnTcRNpSowH2WXxBKWT/+EdlbZCcoZtFynkQ=;
        b=NEnXAja0ZUal5rC8HjzCW/foxqmedO06g2gq072zLiBAr69WvgmbADM6nbFXDfenyn
         J+V69YdNIsbRoHzWFP/ulWIebh91oaQ53CXa/L1KEymckm0sum8OR7rGN1/Pv7OjCGcu
         xHnJwlHliR42T38PL7xW2cfWtE3sdV0pjHVZBsPpNN7UvAEvUgRFSruflwAP9slc/QFf
         8rio1YWbLwVQwm+6H8bFWFvjp7AqZZ5egwYfiRPzcMUJwJuAPQS3406Dm0Kfi584m+q/
         WVjhyHdKrJ0LmrDnN5spevTKyWzjEpCb8VAjgmUBUVJpZ6Xj23SKI0Ezso0A9hpR8Qob
         l2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770734292; x=1771339092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkYuyRwsnTcRNpSowH2WXxBKWT/+EdlbZCcoZtFynkQ=;
        b=kqFfWhjYqkw1t7PN2sWZmQ3d95+mcSdw0z+iwMy3hTVGfiyKk3C0nJerEhEGnxn151
         YlupTCZfpyGJFxu1wDTCeA028TEVl26cHLCsD6Y96Nj30dkxxUBtGl9i/iwQiF6qwAg6
         oAl66ni9mh6KF3UL2YUfq8p7o7bp9sBC5UMSB8SlLRes4CbSOOKqB3gEdox4iIokbnaX
         qSFcB492OQCaTEvqHdG+8eqYXc8yEd1/Hch9waiMMHaoihtB1nL08bMwgR7KL4QUcYWX
         KGljT5fdzAtD0ptoQWC2XBo2rBUkniUV2IXFB97c+HZruFEqBw6u0N6cl5rHUwvFv9Ld
         lCxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQS5SeVIPAKQ3EKv/p+dC7/RkqNlGs1zN3d8rMTGGjDkJqs95kSz4vm3C9loO/7t10yxur7gzkagyBH0Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz93lzubuYX1Q+myReHyvjUGcBL8x2WSJqdeYJmOyE3V0Aaw+mc
	PCHuKvJWkDD0zr4MTRXp4IDQiNKSsfFI+PU0MaqMBGMps72hR0MsR7Ikp/mX2LN1nUg=
X-Gm-Gg: AZuq6aL1eOzBmdLUAMlOyNXex57+BNHvU8zALDTo+IvzpM8Ti2CqLJ0r019Je9DAB9e
	imo5mcqi0rsQWEdLZ9mEAWBFkXiQKe4qDln95uuKOzcU8saCBtJcoOBEj7e9CT7jd+bXmFlunLj
	N35uioKVwA9ULOuKHqjVTainkLSbwBAm8jMpx2gEnfiVP7baXTUpnwyvWT/kAhj6ogp2qx2e5wI
	fzaZwkjY74wmWdS+VWpiZDCNnVb2JBK6aOd2z/GrXSfJdzY9iqCc/HdluuCBcjd1fy3UKCXxM0F
	urLWN7GMCj8rGWF2egaRbVheIGqaVefsecqaS98tyIcbCJ/NTzKa4zasiw0du3gqrTo1wM/+xXe
	wmmuwRgpCkiZwtZfCGwS074K37JTanj42w0r9SNVEpdVObcCK1H9r82sr9QpFDoFUYa8oowbDYK
	3hdFa0Z8qeoNppEZUnRqUFGJlXrV0hy7nM/V+pAQ30cVKJR+5qcksrP6nwicWjSeBdmO15IUt86
	jVX/4WCVBtt2ncgEF1W752qKR5+oIKP4/qhL561yew=
X-Received: by 2002:a05:620a:7087:b0:8cb:1d86:aa4f with SMTP id af79cd13be357-8cb1f72ee0dmr272527185a.78.1770734292144;
        Tue, 10 Feb 2026 06:38:12 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9a1575asm1132760985a.32.2026.02.10.06.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 06:38:11 -0800 (PST)
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
Subject: [PATCH] Revert "ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()"
Date: Tue, 10 Feb 2026 14:38:09 +0000
Message-Id: <20260210143809.297565-1-n7l8m4@u.northwestern.edu>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[u-northwestern-edu.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[northwestern.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[n7l8m4@u.northwestern.edu,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-16777-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tq-group.com:email,u.northwestern.edu:mid,u-northwestern-edu.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 6D4D811BF71
X-Rspamd-Action: no action

This reverts commit f514248727606b9087bc38a284ff686e0093abf1.

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
 sound/soc/fsl/fsl_xcvr.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 0b9dd64b9a82..a268fb81a2f8 100644
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


