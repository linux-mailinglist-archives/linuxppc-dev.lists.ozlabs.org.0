Return-Path: <linuxppc-dev+bounces-5265-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0CDA110D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 20:06:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXdrk2rfwz30T0;
	Wed, 15 Jan 2025 06:06:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736881574;
	cv=none; b=JEUhHGRvg31Q9ACfD8Q7vud60KsMuHxEj7HG9mY26ps6i97xIUixdBMdFP4G0qHBToo5itpvSbp2x8KdahOri+8RgDhX6ydgz8FTraOcPX1UydFKGnTjwxWHoKyw+Tua2S0LMWcABPu9BXbJU3IRp+jxK0jjqssN+kJy0KHcz4Kl3tdzGsY9VDwFm6qVwavWEmV2UxWTc6teAyWymPIw/nB5C1cuNRfMhhzOXFx5WZ3aUl4g25smo9Czf1Fj8F8QGVvCDqivu5mECJSa1ChiNqwwERNmon53WeuzWz31IoQVhu+dHq3d/VQj1l7maYDEPb0YARcfMDWv4umxzPRS5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736881574; c=relaxed/relaxed;
	bh=lN5rUEMysp3+AroTy4SlvvD7Pduqgen38rd5O/+MvPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CEURZk/exckat/joXCS8aYAwttbRXBApD2ZtEWc1M6nP98NdT6w48pD78M2C2V1v16SvTBBy57ZlZic8zMgIm2cQYIi/ZPkgZQcypRCkPbNrOjX85K+x7JC/Ad1cQ49rjDbYOd6W6kODwGsuHLiR9URjpS3Lie3qtnpRBDNf7d+iyiOsyf5XqQU+id+iFhqDhJtXzmN54+QoatXQdI1l3ZWEvec2pSdUHXdxtjMBQBHWFgZ+lmU4JL3hxzYcGk/DtoxQTjYgSrYBSSr8P6sY6pl64FJhCNUoCo/5jfWamseneYkKj7PVM4OQbwtOOqyAjHEcHLf1dsfh++CVuylBLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lVc4FxdI; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lVc4FxdI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXdrh4Pjyz2yMF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 06:06:11 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3862c78536bso332476f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 11:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736881565; x=1737486365; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lN5rUEMysp3+AroTy4SlvvD7Pduqgen38rd5O/+MvPY=;
        b=lVc4FxdI93hFQ+lEgPfillJBvEwzs6iFq3II3vaopHHxmQmAUuOasgDte4dRHfHf09
         +a6zk+ewOCvZdDeHzjuSy/nmsPWTI4FkIP3wfg4mUUhsBbUQly+Id2L9XBu1hFNw21rd
         FNAqQdAWZedpUIYOT3ySrfRoHDMV7UmvyqvSY1prvUdavKS8Hv/4JxIGZ1erUKz8uXZ9
         ZpydajIohn0az6sx7BZ66deJljSmkUnwzMuD5Z07xm+qPKxhd5XvJi9HlUu9BB8iY4Xb
         i3r+Wnu+XzOvK3Dk/in+qBoI8aBIY3opXnfgHnSPPb3fvSnqGMTw34kRii/pt26AQWdp
         xNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736881565; x=1737486365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lN5rUEMysp3+AroTy4SlvvD7Pduqgen38rd5O/+MvPY=;
        b=PgwA+6Yek8JPOA75NhYbm3m2cy/wHIzRYOGjZxWANnBm9HXk17PuGntz0G5ooWD4ka
         TQCiHlPEeoaW/sBjPuJPS057kPlmzjLAO19eeBElYohtVWJfrBTfJwB36AjmV3IrMiU2
         MRdLajtDdwQRASR2jgAKtq6qPvHaBwhrx/def7va0Xh5+4q/xug3coNnxF+DrxASyalR
         cb/dv6aCfZU2rPmZtJ1se2i3ObUkeltSkZXZtXtcIv2wpqSUFNStUmtsIhuMTUz035S9
         wpuNOFDxcgwtXcBbf+FjJufJPoFkj3A6qZ6YrrGZQfMdm+OC1TfwU5Xx7+mdBRvXkBTT
         7JIg==
X-Forwarded-Encrypted: i=1; AJvYcCWQoLo+DTSi/y8ZD+rAsv4It2dsArmAnfwKoaTBMuJXqqBmjF3UEc1b5Xzj2yL519yW0aBHpmbLyPYGZIo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxmQuK8C3Lo8v1T9GKmbjA3B1oFxagK4vtOvW7OK4v6DBBdQrck
	DQ+XGmg3PTOen6OaNWsA8pfGI3hOwsyKISI2D47uDmJJX1Y9LZMF+dCmYsPrYiQ=
X-Gm-Gg: ASbGncs3xsl86FwB+DDeHD/HMO0DVTvyVhsIDIhrWjuer4TA46ytH4untCPZVpw2Kn/
	1UgnUsAGN7rc1om9BvZVzQx4dEMl+iX5bcdw6r2t+8i9zPkw0ScT93cLmDrq8gP186/W8rSq3cy
	9/1TC43020XqFNX2QOza9M81Gsv2fXV+t5v3gMjxZC9EPER/bLDYnkHVlKXqsu4oR5MxImGiLFR
	Q7zCGveEHR3LNdir0h+ZVE9Gh/d3tS0jggyrDZMBFUmjCHuZW+8tFi+zC7H3ZrGf//bUgs=
X-Google-Smtp-Source: AGHT+IE6pa0lthPJtWzhB15VzlOKuOcoh6DUo2csVHRrLlrQDBEdBv9yOOVd7c4Cp/ivr1V81kDl7A==
X-Received: by 2002:a05:6000:705:b0:37d:4aa2:5cfe with SMTP id ffacd0b85a97d-38a872d9f96mr8638256f8f.6.1736881564689;
        Tue, 14 Jan 2025 11:06:04 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b81a4sm15958883f8f.68.2025.01.14.11.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:06:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] cpufreq: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 20:06:00 +0100
Message-ID: <20250114190600.846651-1-krzysztof.kozlowski@linaro.org>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Fix enable->enabled
---
 drivers/cpufreq/cpufreq.c         | 7 ++++---
 drivers/cpufreq/powernv-cpufreq.c | 3 ++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 418236fef172..1076e37a18ad 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -25,6 +25,7 @@
 #include <linux/mutex.h>
 #include <linux/pm_qos.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/suspend.h>
 #include <linux/syscore_ops.h>
 #include <linux/tick.h>
@@ -602,12 +603,12 @@ static ssize_t store_boost(struct kobject *kobj, struct kobj_attribute *attr,
 
 	if (cpufreq_boost_trigger_state(enable)) {
 		pr_err("%s: Cannot %s BOOST!\n",
-		       __func__, enable ? "enable" : "disable");
+		       __func__, str_enable_disable(enable));
 		return -EINVAL;
 	}
 
 	pr_debug("%s: cpufreq BOOST %s\n",
-		 __func__, enable ? "enabled" : "disabled");
+		 __func__, str_enabled_disabled(enable));
 
 	return count;
 }
@@ -2812,7 +2813,7 @@ int cpufreq_boost_trigger_state(int state)
 	write_unlock_irqrestore(&cpufreq_driver_lock, flags);
 
 	pr_err("%s: Cannot %s BOOST\n",
-	       __func__, state ? "enable" : "disable");
+	       __func__, str_enable_disable(state));
 
 	return ret;
 }
diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index 8de759247771..ae79d909943b 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -18,6 +18,7 @@
 #include <linux/of.h>
 #include <linux/reboot.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/cpu.h>
 #include <linux/hashtable.h>
 #include <trace/events/power.h>
@@ -281,7 +282,7 @@ static int init_powernv_pstates(void)
 	pr_info("cpufreq pstate min 0x%x nominal 0x%x max 0x%x\n", pstate_min,
 		pstate_nominal, pstate_max);
 	pr_info("Workload Optimized Frequency is %s in the platform\n",
-		(powernv_pstate_info.wof_enabled) ? "enabled" : "disabled");
+		str_enabled_disabled(powernv_pstate_info.wof_enabled));
 
 	pstate_ids = of_get_property(power_mgt, "ibm,pstate-ids", &len_ids);
 	if (!pstate_ids) {
-- 
2.43.0


