Return-Path: <linuxppc-dev+bounces-12042-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3B9B53DF6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 23:44:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNB0x3Ssxz2yRZ;
	Fri, 12 Sep 2025 07:44:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757627089;
	cv=none; b=F/06pkNJTZPvuk8K2Y9zWarOM1nTGZs+M5vcg0nUQN9SfmT9ZMKzR+ckNyVMETMJhLIjm1R77g9PGoyG33d+OLKAJfO23nAGJRhFNL+TSPWNEQw94aFVY5U13XCIqGxXiarhDm+yfR6fSLMsYh7+pejtv/VS4ikIJqJIaP61kRKhHyG6az+pMV/v2jUoK39+jxWynhx6V8tAG3S5pwHlqJnFyVqi6haYS+E3VFV8J4auWyaRTYTbE2CTb7hQJTetaQlbZdYFGg9YW6lWCcqHsI4bibCqsQ4zw+tvNw/BEnpLXbIjRuk+0yTDtJhp5L5A+PTP2OZniuJslDRSMHiXBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757627089; c=relaxed/relaxed;
	bh=oSsmD+PT9J7Rok4sUSj0iKhGngM/Czt934IPRIT54X8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cmzJSXh3y16x+0ZBdiXK7+8zX8K7VAYl7jz+g97HasK0c8nL1BPAaQo6uUeG+XVKcmWizmrnDxDgpER18jSfc8hSdqm2ePzKOMDOFJTaynEyh2EiQK8RNRGIrFQeTqPIXWaKOsMX1Dd772m3/7zZ9ZaHRbHcpRVS4XRA7JBAWJV8kYEhtItnthbsHK6B2nia45AR5+MEj35tGpumHJd3vsjEWxNq/Dtvk7pgB73zX8gdvU0B3JXDcQfY/jT4OVkW0lRsU86QZYKspzVTCnH6Ysp4PRQNiSkM2sB7u2ON63glem7kQcvX38tBkYk3dDe9SZJFa8GpIkCMeMGbwqiFaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VJ7nEJoU; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::b3; helo=out-179.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VJ7nEJoU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b3; helo=out-179.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNB0t3fFjz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 07:44:46 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757627057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oSsmD+PT9J7Rok4sUSj0iKhGngM/Czt934IPRIT54X8=;
	b=VJ7nEJoURZKTp3AMNtFWZTZunptkFQ3hJgZglAaJad3SE5RQGE7N02UZ9TARw4BB+lpOR5
	nURSLtXRGfi5KPF/YKeyNijYlKtsPbK0w3DVsbSa/OA1fa+SDxUn9LX65EXs8w2JP0qL/2
	+4WjlieDhlKy932EffdHd3HHlTcvCYk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: aoa: Remove redundant size arguments from strscpy()
Date: Thu, 11 Sep 2025 23:43:22 +0200
Message-ID: <20250911214334.1482982-2-thorsten.blum@linux.dev>
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
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The size parameter of strscpy() is optional if the destination buffer
has a fixed length and strscpy() can automatically determine its size
using sizeof(). This makes many explicit size arguments redundant.

Remove them to shorten and simplify the code.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/aoa/codecs/onyx.c    | 2 +-
 sound/aoa/codecs/tas.c     | 2 +-
 sound/aoa/codecs/toonie.c  | 2 +-
 sound/aoa/core/alsa.c      | 8 ++++----
 sound/aoa/fabrics/layout.c | 9 +++------
 5 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/sound/aoa/codecs/onyx.c b/sound/aoa/codecs/onyx.c
index ac347a14f282..fe59a7c59091 100644
--- a/sound/aoa/codecs/onyx.c
+++ b/sound/aoa/codecs/onyx.c
@@ -1013,7 +1013,7 @@ static int onyx_i2c_probe(struct i2c_client *client)
 		goto fail;
 	}
 
-	strscpy(onyx->codec.name, "onyx", MAX_CODEC_NAME_LEN);
+	strscpy(onyx->codec.name, "onyx");
 	onyx->codec.owner = THIS_MODULE;
 	onyx->codec.init = onyx_init_codec;
 	onyx->codec.exit = onyx_exit_codec;
diff --git a/sound/aoa/codecs/tas.c b/sound/aoa/codecs/tas.c
index 804b2ebbe28f..68b420a35fec 100644
--- a/sound/aoa/codecs/tas.c
+++ b/sound/aoa/codecs/tas.c
@@ -892,7 +892,7 @@ static int tas_i2c_probe(struct i2c_client *client)
 	/* seems that half is a saner default */
 	tas->drc_range = TAS3004_DRC_MAX / 2;
 
-	strscpy(tas->codec.name, "tas", MAX_CODEC_NAME_LEN);
+	strscpy(tas->codec.name, "tas");
 	tas->codec.owner = THIS_MODULE;
 	tas->codec.init = tas_init_codec;
 	tas->codec.exit = tas_exit_codec;
diff --git a/sound/aoa/codecs/toonie.c b/sound/aoa/codecs/toonie.c
index 0da5af129492..b59967c49e0a 100644
--- a/sound/aoa/codecs/toonie.c
+++ b/sound/aoa/codecs/toonie.c
@@ -126,7 +126,7 @@ static int __init toonie_init(void)
 	if (!toonie)
 		return -ENOMEM;
 
-	strscpy(toonie->codec.name, "toonie", sizeof(toonie->codec.name));
+	strscpy(toonie->codec.name, "toonie");
 	toonie->codec.owner = THIS_MODULE;
 	toonie->codec.init = toonie_init_codec;
 	toonie->codec.exit = toonie_exit_codec;
diff --git a/sound/aoa/core/alsa.c b/sound/aoa/core/alsa.c
index 7fce8581ddbd..aad7dfe089c7 100644
--- a/sound/aoa/core/alsa.c
+++ b/sound/aoa/core/alsa.c
@@ -28,10 +28,10 @@ int aoa_alsa_init(char *name, struct module *mod, struct device *dev)
 		return err;
 	aoa_card = alsa_card->private_data;
 	aoa_card->alsa_card = alsa_card;
-	strscpy(alsa_card->driver, "AppleOnbdAudio", sizeof(alsa_card->driver));
-	strscpy(alsa_card->shortname, name, sizeof(alsa_card->shortname));
-	strscpy(alsa_card->longname, name, sizeof(alsa_card->longname));
-	strscpy(alsa_card->mixername, name, sizeof(alsa_card->mixername));
+	strscpy(alsa_card->driver, "AppleOnbdAudio");
+	strscpy(alsa_card->shortname, name);
+	strscpy(alsa_card->longname, name);
+	strscpy(alsa_card->mixername, name);
 	err = snd_card_register(aoa_card->alsa_card);
 	if (err < 0) {
 		printk(KERN_ERR "snd-aoa: couldn't register alsa card\n");
diff --git a/sound/aoa/fabrics/layout.c b/sound/aoa/fabrics/layout.c
index e68b4cb4df29..bb2a0ef3004b 100644
--- a/sound/aoa/fabrics/layout.c
+++ b/sound/aoa/fabrics/layout.c
@@ -949,8 +949,7 @@ static void layout_attached_codec(struct aoa_codec *codec)
 				ldev->gpio.methods->set_lineout(codec->gpio, 1);
 			ctl = snd_ctl_new1(&lineout_ctl, codec->gpio);
 			if (cc->connected & CC_LINEOUT_LABELLED_HEADPHONE)
-				strscpy(ctl->id.name,
-					"Headphone Switch", sizeof(ctl->id.name));
+				strscpy(ctl->id.name, "Headphone Switch");
 			ldev->lineout_ctrl = ctl;
 			aoa_snd_ctl_add(ctl);
 			ldev->have_lineout_detect =
@@ -964,15 +963,13 @@ static void layout_attached_codec(struct aoa_codec *codec)
 						   ldev);
 				if (cc->connected & CC_LINEOUT_LABELLED_HEADPHONE)
 					strscpy(ctl->id.name,
-						"Headphone Detect Autoswitch",
-						sizeof(ctl->id.name));
+						"Headphone Detect Autoswitch");
 				aoa_snd_ctl_add(ctl);
 				ctl = snd_ctl_new1(&lineout_detected,
 						   ldev);
 				if (cc->connected & CC_LINEOUT_LABELLED_HEADPHONE)
 					strscpy(ctl->id.name,
-						"Headphone Detected",
-						sizeof(ctl->id.name));
+						"Headphone Detected");
 				ldev->lineout_detected_ctrl = ctl;
 				aoa_snd_ctl_add(ctl);
 			}
-- 
2.50.1


