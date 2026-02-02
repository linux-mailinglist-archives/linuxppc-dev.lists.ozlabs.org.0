Return-Path: <linuxppc-dev+bounces-16524-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH0lJQXngGleCAMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16524-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 19:03:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3765CFE6C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 19:03:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4ZHP0TpMz309y;
	Tue, 03 Feb 2026 05:03:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770054081;
	cv=none; b=g4hpNlhAaOH0mAwF7UWP9Ecp31F3I5xHFHqmyNSvv1uogqoA0ERyW/oNQjnovQugge5HmEvEqvRwPNIrnDtozetbqXGhgNF+VJqLRGXiB987DHr0DSGXg23odo/27iok4TaW768isr25GhJF/n8rM383Xxk7fMxpF7K5hPBJ6IL2XGgXchl93kVE1DGKWfV+RMfC4HRIIMsoYQcB/ms9AgD+x6aaLyFV67OH97Zxj4OeRTVAX/oOH6stklQrPUbvndZj2W1Mgwj0YRdwMDavK+oL8pe2wKMANwlRmbWYVQXfRAOpmZOXXmqo20bxxqjEoVxlbRDG9WPdeXZavHZD4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770054081; c=relaxed/relaxed;
	bh=s8hbofn9BxxsYVhBolr0rYFiwuYMaB/sew2pKb65Ces=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CQHuXAty/dD2/fry/5Ist+wACFkB5cxqppBvLz8/G3FWoVx4BApTY0a/DbXVQm2SEiNfrwzMMUnx9IRdbXCu4ob+krGk9oY2uuWZAzhjrBj3o75yaZ1eJ1P4GrVc3nmE9BLrI6Ie8Ivg5u2pORWRiPRyRiKkDF5490ULIb7FNdiqv9HUDmXQnhOpreroVXRJ4Ym4HS8dxAURa5l3vNN8NzHtMruojRa48iQTgI6r9OADF6JIUo49IklDyrdplBxHiZ03F3ANAf1wBD/v3jRjjHLAbUHHPC37NMP22N8i/R7ChMfKkW8OhkfsHu455EDnAQ+9x6ntLRhgHkf8pqJ+bA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; dkim=pass (2048-bit key; unprotected) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=l6FPmvMU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com; envelope-from=n7l8m4@u.northwestern.edu; receiver=lists.ozlabs.org) smtp.mailfrom=u.northwestern.edu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=l6FPmvMU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=u.northwestern.edu (client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com; envelope-from=n7l8m4@u.northwestern.edu; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4YnW0y33z2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Feb 2026 04:41:18 +1100 (AEDT)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7cfd0f349c4so2901921a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 09:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770054075; x=1770658875; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s8hbofn9BxxsYVhBolr0rYFiwuYMaB/sew2pKb65Ces=;
        b=l6FPmvMU/T2mbf/OMzCh+vExKji0VrKIxUDBxi0gtXzTQUuBQXHyWgD0HTomWtAB2Y
         6Om4+OhZ962i4uYYAcdRnSWegru9FuT6Pxb9q/r+Flq/wYAM5GkTu4IEklT567tnnDay
         wan0tysPPTYmwGmAuH8FpS+K+XrfmGyOepp7DfslygJsdFS6IYqyDxM14ltVzrylaN4b
         3XNQrSm1QdtSSmDjiahFWfSN/nCiVOVfnP23JLhn6c+lNquzKM2YsnAWz28CE83F9az0
         8YC29VtoaQ81af3BVdNY0JgbbuZyAX+Ifj5Ud8jnRSM8e+B9DNnLtZybFMQ0b8maZWEh
         /ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770054075; x=1770658875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8hbofn9BxxsYVhBolr0rYFiwuYMaB/sew2pKb65Ces=;
        b=Ang84arGzjn9RcL89dlZ775RBeWCiimyGEHi3q/5vvT2VKwsnFmmuv0wHaa4lN3vex
         XuedgV8CgFBiEU8eiNXIH6p02rYm/4m61lnhifnCog0N28wM89XKpAWclH0sb8wzrler
         8KAiT6jvmZVvOvfYpMncI1CbVHdSsDNKlFyIt7zDK+bhdwSd7n8Rt5WdIDvwE5RC7IaF
         pDKkYfHU/Qjfq32arSsYgSJF1tKRs0AHcRMjvd7PQHojgxG5J7PxHFxGo06o9v2J2qcr
         4O0TglP0GScTYKNTfw5a/Po5o9Z3nKwLBr9+DU0RmdKic9LqwNm7+kZGwY2y08n52RxN
         qqgw==
X-Forwarded-Encrypted: i=1; AJvYcCW/hy1WzSb1XU30t/XSRAS00qp86qrJ9dHm/TzLVF05E8zELYxig9kXEcMxUBL2ipby93fBJe8Rr3W3FMQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyiZ69WssbeSKOQviL7PS3VcJPl4QE/QAytmLGn1JfZ/wP9YoiN
	dVGyj8hS9AksEPtmkQ/7KSV5DF5Ql1qL1KjOEExCrodYIq4umE2sbmL9QYze4hT+V8A=
X-Gm-Gg: AZuq6aItw9snD/Kq7/vfFXJOxoDkcnqxR8yi+AlcAtyUX6KS2IG+LPeBdJ37RGOIBla
	4h1GCfCEaR2UFydQIZRu1MdSBxCC0UMRmmdfXXq1NnbV5j9rL7uKH2r1r4v5AFe8QdNqb6tRKNB
	10tdl88MdPxZHTuYX0Vh5NuSC+JjJQrphNtkOxPUaksqZtMAJOKPeSgPOHBMS0Iv66AKL8VcC++
	sEmCryjkQJK4K3CEtVJoXtU4dggzMIysqmFU5v1phyuduxsGD6fi/BzIrAuB396GkUI+8csg4FX
	laOIlXMTfQDq5CBSpM6UswR/m7w/k4XAyzIKpmA7o1gOioXjqKOieIm1mmRKfWn3M44F3dI5ign
	ikGs+iXcO/1SRNkXUCdlDc6VeRo3u1csnpnhPDTf9TIXOBrbMn4kLiFzCWMRruf5hcCjez7hU8x
	13rWpcHjAeCUolI0mYBORPBra4GJgeYj0UZqZudWPQ9N3/Eui3NM5pOnqOF9N+ZahTTRZysrTzG
	WROTFBL+nPt3MLTJ/u1+JYuH+m3gGc=
X-Received: by 2002:a9d:7549:0:b0:7d2:eb51:ca21 with SMTP id 46e09a7af769-7d2eb51d9ddmr3079904a34.23.1770054074769;
        Mon, 02 Feb 2026 09:41:14 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d18c7ffcc7sm10936421a34.23.2026.02.02.09.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:41:14 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()
Date: Mon,  2 Feb 2026 17:41:12 +0000
Message-Id: <20260202174112.2018402-1-n7l8m4@u.northwestern.edu>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-16524-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:n7l8m4@u.northwestern.edu,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[u-northwestern-edu.20230601.gappssmtp.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[n7l8m4@u.northwestern.edu,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org,u.northwestern.edu];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,northwestern.edu:email,u.northwestern.edu:mid]
X-Rspamd-Queue-Id: D3765CFE6C
X-Rspamd-Action: no action

fsl_xcvr_activate_ctl() has 
lockdep_assert_held(&card->snd_card->controls_rwsem),
but fsl_xcvr_mode_put() calls it without acquiring this lock.

Other callers of fsl_xcvr_activate_ctl() in fsl_xcvr_startup() and
fsl_xcvr_shutdown() properly acquire the lock with down_read()/up_read().

Add the missing down_read()/up_read() calls around fsl_xcvr_activate_ctl()
in fsl_xcvr_mode_put() to fix the lockdep assertion and prevent potential
race conditions when multiple userspace threads access the control.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 sound/soc/fsl/fsl_xcvr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index a268fb81a2f8..0b9dd64b9a82 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -223,10 +223,13 @@ static int fsl_xcvr_mode_put(struct snd_kcontrol *kcontrol,
 
 	xcvr->mode = snd_soc_enum_item_to_val(e, item[0]);
 
+	down_read(&card->snd_card->controls_rwsem);
 	fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name,
 			      (xcvr->mode == FSL_XCVR_MODE_ARC));
 	fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name,
 			      (xcvr->mode == FSL_XCVR_MODE_EARC));
+	up_read(&card->snd_card->controls_rwsem);
+
 	/* Allow playback for SPDIF only */
 	rtd = snd_soc_get_pcm_runtime(card, card->dai_link);
 	rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream_count =
-- 
2.34.1


