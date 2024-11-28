Return-Path: <linuxppc-dev+bounces-3597-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5EE9DB6AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2024 12:43:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XzZFR2J6gz2y8V;
	Thu, 28 Nov 2024 22:43:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732794203;
	cv=none; b=ibnoEa18m+/Z4oIOxs9mBo+4KnmXAKqbeeFH+dEoiqm9gLKdVklS9jN7cMpphozY9ekfZ95XI1t3/4X+bgfEY61JZStAsO6vDgMblYu7Gzl7TKsD+DDsOcPr8VhTAB4jcFB6oRqoKfXkzaAyl+xIsou2WDm5NegI8eEsdmGyMt44wfvMV1yMdbPDyrRz9ROicGtReJMxjDvHkQCoJ3O2huM+8hLCaUg0isgIqWEFPBlPlp/IhxxeIAGqWD85tAyhOCr+zu5KMxYS8dSA/ca/mRLwTRVveAJ5qD8DaMqN2q8I7j09si8Zj3kZwo1KOnN+3eGTxNLGFTM+6acRV4Vwvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732794203; c=relaxed/relaxed;
	bh=XLmDoPuQ18peT/hndI856uO41dAuVqmy/jkydI86Zhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RIgB6j3Qrbxuc2Az8NngYs1wYHqsng5bMIT9tyh80PFOUPbvchX7mg+SQdGeJNxBPJNfV+nHYnquSIPOBdOqi5RjRWSZjoZHeWkmOQK1joKq6cGHKYQluEDiCcAank76TsfOjiwmj1hHO9optVcfQ3mIGk8aSNvZtSCPPrrNWUVr8f6KG2wZv/1j7Hare0UumiqiiEZhNeHSqeV07+MtIR1TO4s9JhYXyHwDShqFMBxVGI/hTFtOKGl0fmBrzjquysiXluBWAwEYCZldcCT6nmgPjyb14a5D6i55Z7hEMnVcT+V2TZQ3Pte4XeJRLvL3LyyOtT5bsDxArQmy316IOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=QndMCnw5; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=QndMCnw5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XzZFN5Vncz2xk7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2024 22:43:18 +1100 (AEDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-434a2033562so6441415e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2024 03:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732794191; x=1733398991; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLmDoPuQ18peT/hndI856uO41dAuVqmy/jkydI86Zhk=;
        b=QndMCnw5BksX2UMdkUHVAy/k1J/Fs/BONvi3g0ylf8BOwxpozevOGjPV8gpq7LYIMP
         i7WfF+A+TwkY4NLwlcaEuZV3rotlHG3dQb6OJMlSJDiLretiD6vA9igFE9y52GelRGjN
         bYUjWxYHkCyFyKvQOngffkMh0DXW9RJKYlSU8aQbo5ujijeAK1Mr5rsSePnt7LV0+p99
         dBk7evfehXo0j/kLa2cZNggoi57VbexuhUfEAR67fLmbUi/hrS6LalbBJGBl3UANOMrK
         TZe+dpkF4hhY2hwMeCLwP/9vr9ErB6OCL8CJRLMMbJ/pHVO0zIDyBc+fjSKVmq8QPZB9
         W1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732794191; x=1733398991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLmDoPuQ18peT/hndI856uO41dAuVqmy/jkydI86Zhk=;
        b=Rz8KqHSOnJRRzIiJ8r4dMzrXP6mPs+Rk/JZh39UGciBi4OyS0rEpXmKU+BCCCa/k3t
         OnRsCmsMh2v34nfo39yxVEwzFlY2bogz42nUsziGa9rMCJuGjU3RQonPdj4hto2NEuJq
         Qke76M+XHMDMbd4vIUPjJdYFadci2zrR5OzghLnkL84RwWEkHpoDRpmlc9200nNlwOWi
         gSGXLjOmnVBRTb2IJNIMX6/yeGDM18K6kKVrA8ITVs17xNhDYs7CAnXQtOmBOQWBG6+P
         ZAx5KV+6fpn6JDONpS6PeIr7tb4Oeai25THXpi38uir9O+//udZ4j94Py06ZrXKSgHyj
         sPnA==
X-Gm-Message-State: AOJu0YzB73MxQautARGxxml3w9ceAzD4XX3YocaODQeryi4i/uhbJ1w8
	55CM0tRYQEMXp+FBJLvSzgSz0GUutmDU2HttDG9lCRvq1Fd2Lf549BcvODYE2eQ=
X-Gm-Gg: ASbGnctcHDqyses/4s7OwDYH72B1gBufNJB5H5AeWMtWj9LgWnYkABvR1qFk1gXp+h4
	mJcAHMfhMJ8yG61u4z5lZ7ItcASjsA9fqL2b21bOzFhM89ptbGBmfLIat7MfslSrr+OyVgcMX6W
	0Yb/G1Y7f9Ah9xeQgZZy+rxl7uhpIw/1sViCwq1zZ0FWCuuEbd1+z192vcnaaRBnNW3M4uvd6k0
	9Px8njgnINDZCHjn/E2NA1idwcIS0yVp1MAdb/t8vHGbjfWUQv6Hx8=
X-Google-Smtp-Source: AGHT+IFGCrTV3fkXgo4Knuc7JqzNxStEYWTG2YlU7JItHlfbF36hU71rjxx6nTGxuBOrZ2UkuQzUbw==
X-Received: by 2002:a05:600c:3b07:b0:434:a4ae:13e0 with SMTP id 5b1f17b1804b1-434a9dd036amr66918465e9.18.1732794191367;
        Thu, 28 Nov 2024 03:43:11 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7644c3sm50809565e9.13.2024.11.28.03.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 03:43:11 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nick Bowler <nbowler@draconx.ca>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] macintosh: Switch back to struct platform_driver::remove()
Date: Thu, 28 Nov 2024 12:42:53 +0100
Message-ID: <20241128114253.776950-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
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
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4925; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=tItLusgeUmbf8IGLZ4mX4+vAasma+cljc7lDNoyyk2Y=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnSFc+ak6lMqmCbkLiZPZmpgmycexJaXAdc3BGt +yLP/pvCtCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ0hXPgAKCRCPgPtYfRL+ TrTvCACLqcZmHzFwKWU5iBkPjvzFw6P/GV8vH87fKUzqv3966abCuW2w92xzJi3bW1f632C0jRX YHWVRRMihQWLL/iDBKnt96U8OXpFoGwW6FFb3u2YmzP6L0lWAMWw+om5/OwIqp1e7wC7B0s/Bwd taU2MRQiXozzKr0nSegC+bd/BDpIwyB/rpKn93bvS1ebG/Br5VJohkJeU9pd4TULrsj2j9NtKFJ kznuwgE1MfQdcBB1+1sWCVgrX6ka7udiye0vH/7X4msGLLkpAGK0cD8KJOFdgBzjd/XGHNn7CmQ ErRcZqferP5e3gLtb7QpnEvaa2xsiBsx6pJNfeZBHu4ykmF9
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/macintosh to use .remove(),
with the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

En passant make the alignment of the struct initializer in
two drivers consistent.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

given the simplicity of the individual changes I do this all in a single
patch. I you don't agree, please tell and I will happily split it.

It's based on today's next, feel free to drop changes that result in a
conflict when you come around to apply this. I'll care for the fallout
at a later time then. (Having said that, if you use b4 am -3 and git am
-3, there should be hardly any conflict.)

Best regards
Uwe

 drivers/macintosh/therm_windtunnel.c | 2 +-
 drivers/macintosh/windfarm_pm112.c   | 2 +-
 drivers/macintosh/windfarm_pm121.c   | 2 +-
 drivers/macintosh/windfarm_pm72.c    | 6 +++---
 drivers/macintosh/windfarm_pm81.c    | 2 +-
 drivers/macintosh/windfarm_pm91.c    | 2 +-
 drivers/macintosh/windfarm_rm31.c    | 6 +++---
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/macintosh/therm_windtunnel.c b/drivers/macintosh/therm_windtunnel.c
index 2576a53f247e..0b2e08a1bee0 100644
--- a/drivers/macintosh/therm_windtunnel.c
+++ b/drivers/macintosh/therm_windtunnel.c
@@ -499,7 +499,7 @@ static struct platform_driver therm_of_driver = {
 		.of_match_table = therm_of_match,
 	},
 	.probe		= therm_of_probe,
-	.remove_new	= therm_of_remove,
+	.remove		= therm_of_remove,
 };
 
 struct apple_thermal_info {
diff --git a/drivers/macintosh/windfarm_pm112.c b/drivers/macintosh/windfarm_pm112.c
index 876b4d8cbe37..5bd6d1ccf246 100644
--- a/drivers/macintosh/windfarm_pm112.c
+++ b/drivers/macintosh/windfarm_pm112.c
@@ -669,7 +669,7 @@ static void wf_pm112_remove(struct platform_device *dev)
 
 static struct platform_driver wf_pm112_driver = {
 	.probe = wf_pm112_probe,
-	.remove_new = wf_pm112_remove,
+	.remove = wf_pm112_remove,
 	.driver = {
 		.name = "windfarm",
 	},
diff --git a/drivers/macintosh/windfarm_pm121.c b/drivers/macintosh/windfarm_pm121.c
index cd45fbc4fe1c..660180c843a3 100644
--- a/drivers/macintosh/windfarm_pm121.c
+++ b/drivers/macintosh/windfarm_pm121.c
@@ -999,7 +999,7 @@ static void pm121_remove(struct platform_device *ddev)
 
 static struct platform_driver pm121_driver = {
 	.probe = pm121_probe,
-	.remove_new = pm121_remove,
+	.remove = pm121_remove,
 	.driver = {
 		.name = "windfarm",
 		.bus = &platform_bus_type,
diff --git a/drivers/macintosh/windfarm_pm72.c b/drivers/macintosh/windfarm_pm72.c
index 14fa1e9ac3e0..d207f13396ae 100644
--- a/drivers/macintosh/windfarm_pm72.c
+++ b/drivers/macintosh/windfarm_pm72.c
@@ -781,9 +781,9 @@ static void wf_pm72_remove(struct platform_device *dev)
 }
 
 static struct platform_driver wf_pm72_driver = {
-	.probe	= wf_pm72_probe,
-	.remove_new = wf_pm72_remove,
-	.driver	= {
+	.probe = wf_pm72_probe,
+	.remove = wf_pm72_remove,
+	.driver = {
 		.name = "windfarm",
 	},
 };
diff --git a/drivers/macintosh/windfarm_pm81.c b/drivers/macintosh/windfarm_pm81.c
index 404d2454e33d..ada97377e19e 100644
--- a/drivers/macintosh/windfarm_pm81.c
+++ b/drivers/macintosh/windfarm_pm81.c
@@ -765,7 +765,7 @@ static void wf_smu_remove(struct platform_device *ddev)
 
 static struct platform_driver wf_smu_driver = {
 	.probe = wf_smu_probe,
-	.remove_new = wf_smu_remove,
+	.remove = wf_smu_remove,
 	.driver = {
 		.name = "windfarm",
 	},
diff --git a/drivers/macintosh/windfarm_pm91.c b/drivers/macintosh/windfarm_pm91.c
index fba02a375435..108d7938e714 100644
--- a/drivers/macintosh/windfarm_pm91.c
+++ b/drivers/macintosh/windfarm_pm91.c
@@ -695,7 +695,7 @@ static void wf_smu_remove(struct platform_device *ddev)
 
 static struct platform_driver wf_smu_driver = {
 	.probe = wf_smu_probe,
-	.remove_new = wf_smu_remove,
+	.remove = wf_smu_remove,
 	.driver = {
 		.name = "windfarm",
 	},
diff --git a/drivers/macintosh/windfarm_rm31.c b/drivers/macintosh/windfarm_rm31.c
index dc8f2c7ef103..d76a70bf09c9 100644
--- a/drivers/macintosh/windfarm_rm31.c
+++ b/drivers/macintosh/windfarm_rm31.c
@@ -674,9 +674,9 @@ static void wf_rm31_remove(struct platform_device *dev)
 }
 
 static struct platform_driver wf_rm31_driver = {
-	.probe	= wf_rm31_probe,
-	.remove_new = wf_rm31_remove,
-	.driver	= {
+	.probe = wf_rm31_probe,
+	.remove = wf_rm31_remove,
+	.driver = {
 		.name = "windfarm",
 	},
 };

base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
-- 
2.45.2


