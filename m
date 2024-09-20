Return-Path: <linuxppc-dev+bounces-1494-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3135A97D752
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 17:10:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X9G6B64Lgz2yF4;
	Sat, 21 Sep 2024 01:10:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726845026;
	cv=none; b=ScjE+0RgpDbaDiN2qUPAiwJN6zSh2ZCWlOfl1FU81YAf3jDYw+pxBADCzO2VexUB6a+1heFBYyW1k6nqybcjGgw25mh32V86/If9ilAQslObs3CymKSZ0CYvw87beuQFgHOEZ7RtE9T5OSBGyr9WkZsUfj66uRm1kxeLqvOS3gwW/ZkOklkelAKkOsqRJAa3Y5HDa7ivOTcjJnEeUmOKHsamNrjbyeRU6iY2kV77ucPcI21QTXElmrjU4gHS2NWpDZYaxW6JPKOlyvRCz2IbY7NAXk7k7w0WTfWqot+AHCUTijG9dLY/2C4P7aNraKA2YahypLqqFwq5o6SX5FmtDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726845026; c=relaxed/relaxed;
	bh=dqxB4KzGedlZDzswgDTRSffnag1Yh8CdsgK618Kt3iI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M8jF+rs+/6ODDhaPINGxs8LAyFDKAkArNsCgiOPF0jfTCiIqnm84M93DrJ1CzgwSvRsdyXZ+XY9kkxeeLdOb2ylRbe5dulnUbeuVuFrY921EUD5dANi0qQIPe56Mv868LfYF9nqjaPX7y3PbvdeRnY0rLPzhNKnRMO6hQNS66kg9vaLcF8TdkQbRmViE3CdxVkMeUa6gpk49YYcJb56tZ0HTIPxTVS4LV3WBdXBUWEJY4Auar4Rx5TId6GAOCb+k5pdt2RkjVP7+4WSGuoHqH8lb03eMbQwwPhR59LGrVW5ORBHcAxH68hDKdy5/ZScisHJCxnxtwFNhVovayL3aEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=vklUqvvb; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=vklUqvvb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X9G693nycz2xxy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2024 01:10:23 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso18410025e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 08:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726845018; x=1727449818; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dqxB4KzGedlZDzswgDTRSffnag1Yh8CdsgK618Kt3iI=;
        b=vklUqvvbPgoXRdqzcd6CaFKXn++EtsiyrT6gfBOJBSTJqxCkuh24w7d9SHWbCFgVKq
         WIAj7GDtNnMiqfg4cShFbrbwhrDjcXd8YF/xP4Z2tP8d0F6ljt5I5mREPScTQO0ilZlZ
         ZCVWY6A4MzV962DTaBhzIRQDCMy+2lcGoJuT2vY0w4Gr0fEJ33nNd74P7hCL2PRRNpTT
         i+mc3/TaXbiGtcZtrs6LXSsgoDBZUGQFsdZnPTludtQ7wXrYglPeVhofRPhjvlRce8FJ
         VVQIQKdaz4LMhB+GLja/IsCyyiJs37WpzcG2C4TTZ/xvJi4hEwiqW4G58RNw67uW4Nw/
         6VJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726845018; x=1727449818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqxB4KzGedlZDzswgDTRSffnag1Yh8CdsgK618Kt3iI=;
        b=YB5arQmO4mv5ytXz9Qj2+IeVhoq/oPRLC26PaMOdJBiTxWirFiiZUPCmxULXZpt95z
         R1g/FEd02xHBwNCYyeIi7aAi+CusUPCqdXtyEHspMBORK3gckmigyQ1RCGybykVsb9UP
         TURogwC1arFxKp9garREMwVhLJ+xeOkf5+YA7/T/lL0+V83wkYgJsM5S/yqWP3lOzeBr
         yHTnVD9KjOhACyzd2hsQG0PBGRQnSkbBUoaNGnPq19dp+MgwT6kOAwNkZOTf9Q0S+khZ
         ll+DaUWSCX/K2LJOQn+R/TtQKU3ABoO+zMMPCWZcODqiRVvx4ytbcvx7A8Ru8V/NqO65
         +KGA==
X-Forwarded-Encrypted: i=1; AJvYcCWSYklfnEQPWZGQ+yTSUam8XqK17BbZ9+9VAlK7rcR1mxKV7R4JOkXyQyynz7RkxpEFylghVevxsXDPnfE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzuwAMitnuyWUxuQtHTqqMDhf1yoSwNP+UYIcNOJQMXFZwFzDS8
	yqw0e7zbTNzYhC2Xdrtv7lk/JUcHk+Vx6kq3M5YlSbeYqqWRR8WTVhTv16JMyaE=
X-Google-Smtp-Source: AGHT+IG4ybmvfCPFK7GpLPZJ9S6gMbOoQX6B/i66eB46HTLEMiy8K/MDelU5eMphLtP74FLdVw9wMw==
X-Received: by 2002:a05:600c:1d85:b0:42c:c401:6d67 with SMTP id 5b1f17b1804b1-42e7abe12c9mr21430965e9.6.1726845017829;
        Fri, 20 Sep 2024 08:10:17 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e75389c88sm54088995e9.0.2024.09.20.08.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:10:17 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linuxppc-dev@lists.ozlabs.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH] ALSA: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Fri, 20 Sep 2024 17:10:08 +0200
Message-ID: <20240920151009.499188-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2252; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=UMPI6dbr3vZF/IEea0Gxx5qCUzLzf9e2xNJR+bN0i6E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBm7ZBR/8GCUV4aeWj8Lb2TYNLJVkJrXibxwUuPQ 5Sqo3ZScMyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZu2QUQAKCRCPgPtYfRL+ Th38B/wPssqPeUx8jeBlsp1PHwKwqwZKv0klqLgfgERAspSV9HlI9RhbIl5FNCUL+XdJvUV62A+ Jy0sEEPwbrSUxzs5FY2CGHw1mLFG38sJVTWAcAQvGAiNQQmpZWeUAmE9ypN2EN4oGnyA+OxmR1W p7uFRCfonXSQay49ptoU+YwMGcVz2sfBfYOOEcaXufzilvyMVasjLMnvG2o5TME6VJQE3FVYVxj XgIuqy6O9iFMl5KHMxWyoGPHtSHoWly2reMtLnsvHUtRZjyUZhy0uJV2GAeYeev3xwORxOoGBQM Pt3kHzQc/wQNGfPt/6j6t/pU32qov0X5Z/ManUH30q8z9FQw
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/aoa/codecs/onyx.c         | 2 +-
 sound/aoa/codecs/tas.c          | 2 +-
 sound/pci/hda/cs35l41_hda_i2c.c | 2 +-
 sound/pci/hda/tas2781_hda_i2c.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/aoa/codecs/onyx.c b/sound/aoa/codecs/onyx.c
index e90e03bb0dc0..ac347a14f282 100644
--- a/sound/aoa/codecs/onyx.c
+++ b/sound/aoa/codecs/onyx.c
@@ -1040,7 +1040,7 @@ static void onyx_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id onyx_i2c_id[] = {
-	{ "MAC,pcm3052", 0 },
+	{ "MAC,pcm3052" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c,onyx_i2c_id);
diff --git a/sound/aoa/codecs/tas.c b/sound/aoa/codecs/tas.c
index be9822ebf9f8..804b2ebbe28f 100644
--- a/sound/aoa/codecs/tas.c
+++ b/sound/aoa/codecs/tas.c
@@ -927,7 +927,7 @@ static void tas_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tas_i2c_id[] = {
-	{ "MAC,tas3004", 0 },
+	{ "MAC,tas3004" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c,tas_i2c_id);
diff --git a/sound/pci/hda/cs35l41_hda_i2c.c b/sound/pci/hda/cs35l41_hda_i2c.c
index 603e9bff3a71..bb84740c8520 100644
--- a/sound/pci/hda/cs35l41_hda_i2c.c
+++ b/sound/pci/hda/cs35l41_hda_i2c.c
@@ -39,7 +39,7 @@ static void cs35l41_hda_i2c_remove(struct i2c_client *clt)
 }
 
 static const struct i2c_device_id cs35l41_hda_i2c_id[] = {
-	{ "cs35l41-hda", 0 },
+	{ "cs35l41-hda" },
 	{}
 };
 
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index f58f434e7110..4b9dc84ce6bb 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -951,7 +951,7 @@ static const struct dev_pm_ops tas2781_hda_pm_ops = {
 };
 
 static const struct i2c_device_id tas2781_hda_i2c_id[] = {
-	{ "tas2781-hda", 0 },
+	{ "tas2781-hda" },
 	{}
 };
 

base-commit: 62f92d634458a1e308bb699986b9147a6d670457
-- 
2.45.2


