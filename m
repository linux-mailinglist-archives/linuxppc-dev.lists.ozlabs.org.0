Return-Path: <linuxppc-dev+bounces-17891-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLWyGFy0rmkSHwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17891-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 12:51:56 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D64A238376
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 12:51:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTwN82kNVz3cBb;
	Mon, 09 Mar 2026 22:51:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773057112;
	cv=none; b=dlsY/FNbWLq643JrrRTCyPhN9K43tF8z12itAb12I2XV8OGemp+2/U23i0xgTMmaMgOSiwYXnQiLxDEllaUqL4A5rFaV7y9jMM4urlyEv6h9BUNs0tH3IF7HrTT5lKWfV4A1//7MwmJQG9vFsnuMLIRkTlnC4ynpAdjvvYSae3osQ2I07E/d1aroqGNznWbL1/OnHgfqQyIlPlnw8BMKV53xiXnDkP8fYq5gKb/2vj/ipMBZzwRmblYIYucbOpiCRKPY19lXG1wRAlOv2uNMoLDlQIMQcP0bhpSSNdOY3xKgFrCfpeiNFzArQwgGUr2jCZwxG3/+rlgFdEEfISHcxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773057112; c=relaxed/relaxed;
	bh=E6ni+V15gEXaXXBvNzq+0rhu2ZSMmb0xp9G3k1TvHqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WD73FvyoIkcusRNS7Gqu7+5q3erW1rjEFyZTeJugD2+adHdLZELhDaVOxkSgGsPiibMUTf7I7pbWk+V1g6EpKxvI4QlGd9BOKvxtP9ikEZPHbR3pzr8DcTCwUj7ehUURo2YSrbq3YC/Mq7r5ObyPzqS8LTtBcBilq91UHD7GU/KB39u1ngsBzhfCldKfUxoqsizBGoAf+CMKTqwXfbPG9dZ1gNJHZ/9rSv37gnUz8HSjU9MrXM7Rs2+icIcNjRsQtlxEwsUXzX0EcJdcbIBAZq39/6X2l7P5QueerfcUEvLhRm0G7RVSumR4s3IgdrH/8ryOMl3LtH7pc9JaTTUY0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jXElw1yS; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::; helo=out-188.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jXElw1yS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::; helo=out-188.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 461 seconds by postgrey-1.37 at boromir; Mon, 09 Mar 2026 22:51:48 AEDT
Received: from out-188.mta1.migadu.com (mta1.migadu.com [IPv6:2001:41d0:203:375::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTwN45wwqz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 22:51:48 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773056617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E6ni+V15gEXaXXBvNzq+0rhu2ZSMmb0xp9G3k1TvHqc=;
	b=jXElw1ySaZIGt0aOj4NcaVRPGdTR+68a8jfgKGMZjOR/3sUe4ETq+t/RN2Ngm1MrwhJ9BR
	HxSCqmgoVVJNQFCZ2Mz8nJb9TfWmngGIS3/rks5ZAMPn0YVjhQFTLHX4BxSsjpq2Gg4451
	LviTw7z0nNdzIKgAcSr1+eHqB0i7HrU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	stable@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: aoa: Handle empty codec list in i2sbus_pcm_prepare()
Date: Mon,  9 Mar 2026 12:41:59 +0100
Message-ID: <20260309114159.765304-3-thorsten.blum@linux.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2247; i=thorsten.blum@linux.dev; h=from:subject; bh=RlF+xgJCNuvzFdIDPLMyD53b705fRJwJDPrTPtFEut8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJnrNrHvXpf5KdbN7HPRj+gmq51nTr44wue80Tl3Q4/S9 0cSiyd6dpSyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBELqUw/Hf9Guiac7dYUzIl kXU+S/nnj5a17zMviF9b6dsWmJPfOofhf7mjQ27dwVCvR1+Zf2kqMO2reP1t/cQzeyOdulc2vCh dzg0A
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_FAIL,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 5D64A238376
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:johannes@sipsolutions.net,m:perex@perex.cz,m:tiwai@suse.com,m:kees@kernel.org,m:thorsten.blum@linux.dev,m:stable@vger.kernel.org,m:tiwai@suse.de,m:linuxppc-dev@lists.ozlabs.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thorsten.blum@linux.dev,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17891-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[linux.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:email,linux.dev:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

Replace two list_for_each_entry() loops with list_first_entry_or_null()
in i2sbus_pcm_prepare().

Handle an empty codec list explicitly by returning -ENODEV, which avoids
using uninitialized 'bi.sysclock_factor' in the 32-bit code path.

Fixes: f3d9478b2ce4 ("[ALSA] snd-aoa: add snd-aoa")
Cc: stable@vger.kernel.org
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/aoa/soundbus/i2sbus/pcm.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/aoa/soundbus/i2sbus/pcm.c b/sound/aoa/soundbus/i2sbus/pcm.c
index aff99003d833..65653601662d 100644
--- a/sound/aoa/soundbus/i2sbus/pcm.c
+++ b/sound/aoa/soundbus/i2sbus/pcm.c
@@ -314,7 +314,7 @@ static int i2sbus_pcm_prepare(struct i2sbus_dev *i2sdev, int in)
 	int i, periodsize, nperiods;
 	dma_addr_t offset;
 	struct bus_info bi;
-	struct codec_info_item *cii;
+	struct codec_info_item *cii = NULL;
 	int sfr = 0;		/* serial format register */
 	int dws = 0;		/* data word sizes reg */
 	int input_16bit;
@@ -390,13 +390,11 @@ static int i2sbus_pcm_prepare(struct i2sbus_dev *i2sdev, int in)
 	case SNDRV_PCM_FORMAT_U16_BE:
 		/* FIXME: if we add different bus factors we need to
 		 * do more here!! */
-		bi.bus_factor = 0;
-		list_for_each_entry(cii, &i2sdev->sound.codec_list, list) {
-			bi.bus_factor = cii->codec->bus_factor;
-			break;
-		}
-		if (!bi.bus_factor)
+		cii = list_first_entry_or_null(&i2sdev->sound.codec_list,
+					       struct codec_info_item, list);
+		if (!cii)
 			return -ENODEV;
+		bi.bus_factor = cii->codec->bus_factor;
 		input_16bit = 1;
 		break;
 	case SNDRV_PCM_FORMAT_S32_BE:
@@ -410,10 +408,12 @@ static int i2sbus_pcm_prepare(struct i2sbus_dev *i2sdev, int in)
 		return -EINVAL;
 	}
 	/* we assume all sysclocks are the same! */
-	list_for_each_entry(cii, &i2sdev->sound.codec_list, list) {
-		bi.sysclock_factor = cii->codec->sysclock_factor;
-		break;
-	}
+	if (!cii)
+		cii = list_first_entry_or_null(&i2sdev->sound.codec_list,
+					       struct codec_info_item, list);
+	if (!cii)
+		return -ENODEV;
+	bi.sysclock_factor = cii->codec->sysclock_factor;
 
 	if (clock_and_divisors(bi.sysclock_factor,
 			       bi.bus_factor,

