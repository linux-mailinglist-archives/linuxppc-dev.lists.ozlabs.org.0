Return-Path: <linuxppc-dev+bounces-14570-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D85DC9C9C8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 02 Dec 2025 19:22:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLTd92z4dz3c44;
	Wed, 03 Dec 2025 05:22:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764697504;
	cv=none; b=JNQG6IvBW8C8O3Gvb6g+s7WZNvUS3sgog8XKsPzdW6A83YniznYDAB7+puxK9iCec7pEAtRN84XcDnTDudIPglfh+v1EZ34cTYJbHhsWGYNz7rQt/qpH/G1PTRAPssrqw6KDaomN5Vn2gVZ8nu5qfUTRddBvIn3H9nqmkvtfpM6HJPTi4HqqU3c6aMZVVgkDqpLplfWWhcVz8G8qkWb6aJ7RcUf/6b/Ik4nMSjamxX2PJBPZYHBCMiDbSYm1LF35ern+XFt5J6L3FsALQyplujuciPHDq6FO+JqTa+h8mAKweCLUQa1boxxfYMqc3FlVAnYF60Ju9cNbrqMetfiWdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764697504; c=relaxed/relaxed;
	bh=ED9tSGVJh0x09FYQjOL2o8g73Yk/StYFmkwh8LhI7Qs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hUNzei70dTvCm6ihdXGf4vcjS047Y88t6P58H2uadtobHqSHd/Ml9v9fRr3cWAqQ2rnphQE7CPlVZPh5poi3dOnAAM6wfJxsKwVTCubWgSEklSE7S4wZ1N4Tg6eAM6s4NKQaDyyj8s6B0oO9oQhFOgDoyoWkqpJPjQ+Lqh/QvG8antfhCO/Xztw7mBmGoZgNmksLf9Tpb8aSNQWQYWhkRHJyGvt0DPrFB+5t48/LgextbtwODnhYrfsfp8aSgUs0StfEg0seE0t1rVgZOWEHfxLx/u27AKBpczOrJ7WCagjP7MMolq5tqcEGTfSgQsKs7Y+zHbRK5bwkjjV9h61p1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KRcJtbqa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=hanguidong02@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KRcJtbqa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=hanguidong02@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dLSpQ3ShNz3bxC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Dec 2025 04:45:01 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7c66822dd6dso43910b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Dec 2025 09:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764697499; x=1765302299; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ED9tSGVJh0x09FYQjOL2o8g73Yk/StYFmkwh8LhI7Qs=;
        b=KRcJtbqaTFkyieGGB6p1iiWprMRLO1ft2B6sVtmrup8gkEUbj9w3Bel51WA4ynYMQg
         BEX7SZplnT9XqxRg7paOiJP0ODYQ0oeHA3N9su9zkeSUguy75g9g7ITmSut/guOoGsiN
         i6ehi/KzDO9pLzo3GGj4eeJbALxpffSdQ0yrx7RNnE3ds8qgB5Bp4ppk/jb9WEPt6c2z
         yyKXiiygGapkGlMmxXmjSKKT5hFKQKoOu/7NXyzyRevfkDZSGUD86bRHP2SjFvi7ohW6
         2ZcWPfkLzXgwllDBkwWRnHgPNzCEMVYV1RnhvqH0rLLjAbXCON151JV530FDGuS7TwEj
         sPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764697499; x=1765302299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ED9tSGVJh0x09FYQjOL2o8g73Yk/StYFmkwh8LhI7Qs=;
        b=mq8+4dMFWHpE1zQdQQ/A5Fg24FcTAN7V7Wv1zo7HyeqLEd2FsfDfnaJkffUQ7JjzZL
         +0hZedSegFDqeIJn3zL+683Ue3Q+y9FggQJhmuBmwKStsoGQpHH5bWZsywaN3dY4OBGI
         AelM5kO4bLhleWfT5UF4cQrE55bnVkC06q+qR9KAFpNLMxr8WwRwWklk0yDPZl6ceNWm
         pUwuleNGfeAp2TqIkLob5Q0+Hs+zT25n4dZd+VFj4RrCRt46yUpwe4GPodwbT3BowgzU
         cPvfZ3BcsIuU0WVebEme/yvAHi6F5ZiIqCdUGGn8lqgint4VtF7BAupn/JzY1/aAid8T
         buqg==
X-Gm-Message-State: AOJu0YyboSqqelJCQapbwdch2G2CM+aT1sTQcug3yXFVkspN4ujkkMqr
	Yj246CovjcYP1yYCKzOPe8fOtEBpxV4xdiyjqQBaaFrOh++UL2hrsHlh
X-Gm-Gg: ASbGncsrJauljGKRabLn8JF/5WgwW7Yqz4CsQ0GAL3o+8/NFjF2CdHyrku5jgWvyCRJ
	ZGGIDcn2lh/D1YQ+sZTe13YM4uEuZjWVT4lAIrp1mS5vsUIEMKFW8qaM1Nf487zD5AWwtDzi1lM
	6wY55HV9EeKHXLexG4tfWqlDFzH1dk4ZvQ/ceFoOcDqec2UL2RKTKrR+ZlPSkmQERcx+6Ky0qYr
	24qA5JKGw+2fiOOJEg7odMRImdCA7SL9T3igYLzJLxW5c3n3vv9XBOKGfzRDc6IMuqsum6e2wPH
	GR36A4RziPuZFAvF+KC4o3qk3Eackwin/JlHVmCAaFqrUaWKEAVB/lyX1h68VrfRHTK4e2TLFRG
	NPGCbiBVIrY/5m8bEoqWL8LLB/4XTQaENMDIqyO+VLN5KDS7pCQfBAwmV4Y7yXhgqDWPhr5s1Du
	eJ+cSvJKCZFLNlSWoDE8AWBkLkFPRTzGnHhFybEYL4Lfd9YeluQsr/eezNeecvPPBLq62Ne5Elr
	ZkFJfyWQuJV9ULsf/9BdTCHUsTgewU5StFuTsJjFV2RG8nVrbnvjZ6wfw1X
X-Google-Smtp-Source: AGHT+IEJA6ge4wFCANfbRxKoKiXJwQLoc+/E8FFao7Y7q4CuOUiy2Rbn+7WQlpnH2DFciZOyBF+QWg==
X-Received: by 2002:a17:90b:4b8f:b0:343:6a63:85d5 with SMTP id 98e67ed59e1d1-34907fa9e16mr3588267a91.16.1764697498834;
        Tue, 02 Dec 2025 09:44:58 -0800 (PST)
Received: from 2045D.localdomain (191.sub-75-229-198.myvzw.com. [75.229.198.191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-349106cf36dsm56865a91.10.2025.12.02.09.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 09:44:58 -0800 (PST)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: ioana.ciornei@nxp.com
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Gui-Dong Han <hanguidong02@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] bus: fsl-mc: fix use-after-free in driver_override_show()
Date: Wed,  3 Dec 2025 01:44:38 +0800
Message-ID: <20251202174438.12658-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
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
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The driver_override_show() function reads the driver_override string
without holding the device_lock. However, driver_override_store() uses
driver_set_override(), which modifies and frees the string while holding
the device_lock.

This can result in a concurrent use-after-free if the string is freed
by the store function while being read by the show function.

Fix this by holding the device_lock around the read operation.

Fixes: 1f86a00c1159 ("bus/fsl-mc: add support for 'driver_override' in the mc-bus")
Cc: stable@vger.kernel.org
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
I verified this with a stress test that continuously writes/reads the
attribute. It triggered KASAN and leaked bytes like a0 f4 81 9f a3 ff ff
(likely kernel pointers). Since driver_override is world-readable (0644),
this allows unprivileged users to leak kernel pointers and bypass KASLR.
Similar races were fixed in other buses (e.g., commits 9561475db680 and
91d44c1afc61). Currently, 9 of 11 buses handle this correctly; this patch
fixes one of the remaining two.
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 25845c04e562..a97baf2cbcdd 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -202,8 +202,12 @@ static ssize_t driver_override_show(struct device *dev,
 				    struct device_attribute *attr, char *buf)
 {
 	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
+	ssize_t len;
 
-	return sysfs_emit(buf, "%s\n", mc_dev->driver_override);
+	device_lock(dev);
+	len = sysfs_emit(buf, "%s\n", mc_dev->driver_override);
+	device_unlock(dev);
+	return len;
 }
 static DEVICE_ATTR_RW(driver_override);
 
-- 
2.43.0


