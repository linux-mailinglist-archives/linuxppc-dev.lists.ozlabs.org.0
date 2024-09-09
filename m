Return-Path: <linuxppc-dev+bounces-1180-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1372971BAC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 15:51:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2StW47xwz2xHY;
	Mon,  9 Sep 2024 23:51:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725887365;
	cv=none; b=TswfGYlXHVedGCKNxeUIDge4tHwqihHDwbxU73DU/2tQd/lgg06VpxDN/UzOjMmDQpzHDOjZBOWKEphGEoulxbTrRWIHH/lAgQm35DrTswcSDYHhC7/EvpAT4ARjxda80aLXaDbwhynZvjimJpj0GboofHEHeZuFWz29LaaRG05m7zW6lOXM5pO5EZ9bKV4QtgdgEp3tVy3UZKCGoZI7ci34fj9GXZxvD9iBdjT+5fc5flhLvXRA0dKmrDXFYRnm2TUAVItw4pFuP72ddkRHzw2mwBSyXTOM1FSPcgH2I9uo5XcFEXGE075pb2UHan4qtkEHI+xJQcnYd4sGF4HlIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725887365; c=relaxed/relaxed;
	bh=aAURSljfvWOUnSCZm9ewNbUz25v5xVFUUG+FBCHjEWU=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Type; b=LgWz3wf2qTEGvJTHoBL43F/yCuGV3I69jvF3rNqSCjpyGShs9bI7qLuYqZYHX15xx5zDgMmwbr44iLtf3RjUhcjFVJdEkJtEybVTDTpH3yyjfiySOUpKgXxZ4fZyFzbol1PB0fMaO+ISdMJEl0NDBG4DJzu1qVpC0rxingqOX+nnLRyMO/MWVwnkudLqB8xhj9+mZMZizzyAAEEjPHX+phOWL3qUhtEwRQ8fsr4xqHAMTCzJequw7LciqKcsWoLHS7PLD08Kz31XHUvrJSvVvp2xHEaCW8+57vddnNCojIL4UFLWzq3/VwnWtv1oTbyCMzACTB2NlHHtVJGfWrY06Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WFt1GH36; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WFt1GH36;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2Rxc0vs4z2yNP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2024 23:09:21 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2f75428b9f8so28149791fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2024 06:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725887355; x=1726492155; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aAURSljfvWOUnSCZm9ewNbUz25v5xVFUUG+FBCHjEWU=;
        b=WFt1GH36M5QRTUhr6Dxc4HMbrq2y66ewuN1n34eCvTQghWNyhZseZLU8h1FeiqC7eD
         bC5msAZp9EQYT+vEMx2JmA9YQnMZMDy3jZG+esaX4LbN8KchkAgRxvSIH1IGs4C5FslS
         KRjLftjT0v5No4vlHsDwA7wG5hXpGRtnfYcTuNwa6hBV5NJxsWtruzFZQKjZcSDgFHKV
         FT1xox8ZE84TfUy8jfPo/Rfvcwn9cxrIFO9CG0kj8/X+wC9xz2eLnAjQ4DBDC8xmuupy
         cIWULRHAbbhrbHH4JJjednh9obgNF9xMFDjaYcm4ZOB2TABYiJJRGt6IHABRS92vTdUl
         K2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725887355; x=1726492155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAURSljfvWOUnSCZm9ewNbUz25v5xVFUUG+FBCHjEWU=;
        b=SeIMOwinAEiauZDY8ZBI+4ucd7wP3VAI5uCHykScgFX27yP58l8rfPX4n9Pqsp8VR2
         za+LLibxhTwNru0abQPck9lw7BeqDbPieV9yvPDtmnp+vadL21jI19ALlXaqwRqvauRL
         JkRq79xrkb7xtf52h70D9U3sihAKpXu/P3JqUFtW9nlNkJ9fIASFN2+JIQ3/zUT6zfBP
         cbmM8vO1w3IfURFOX042f8LzkOB/cxoRqBslBANWUOLjVIg8poUnkB5ftbfnCp9SoPrY
         ObUiEKQzEJQ17+2MPAy2qhSCRAOByBNT+j0r6LY0J4ttzqVZmNgDxybmsMyBwWPL45B8
         +tLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUukLPRt7i2IV4TCxDKcjd5diKeLe7pOL6BNgnDloBDKLph+3tjJYLgA6A0g6A4T1vOJEHORFza27aZz7Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzt9d+Ix9Y6NnPmQ8HzJVELZnEr92ow/0+ODFN4P3E9kdQyeBu+
	BA6dErD9/zh9e5uVlxbjpxT5PXb4Ro4nh2+B45qtdFIHXn8+Ce3YjLarRhUkGxI=
X-Google-Smtp-Source: AGHT+IGvAkpCTUXSCD4RCTI4mY3upOidztjIICWmYy7eHUTHVfdLGq1vaNeCnJBjog/e67ya8RGgxQ==
X-Received: by 2002:a2e:461a:0:b0:2f7:5a41:b0b with SMTP id 38308e7fff4ca-2f75a99e208mr46443101fa.26.1725887354419;
        Mon, 09 Sep 2024 06:09:14 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:87bc:816e:c851:13be])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c72eb0sm340294466b.132.2024.09.09.06.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:09:13 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Anatolij Gustschin <agust@denx.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Scott Wood <oss@buserror.net>,
	Haoran Liu <liuhaoran14@163.com>,
	Vaibhav Jain <vaibhav@linux.ibm.com>,
	Shivaprasad G Bhat <sbhat@linux.ibm.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Switch back to struct platform_driver::remove()
Date: Mon,  9 Sep 2024 15:09:02 +0200
Message-ID: <20240909130902.851274-2-u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4592; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Bav01iKpie8ZYs15I4Ii6sqi+A/JL0ipfULVoCE3TV4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBm3vNuP45HdGNVM6T1kks05FzN2/n3daGPTyGwi E+cLHGg44aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZt7zbgAKCRCPgPtYfRL+ TjeFCACtTac4vQVfCImvNOV+KRWAK19KLkQgPVMPjdGCTiHWp9CakijV88Gn9ugSdzBK72cw3Gm Ig6tYdFp78S7ceImXrueSiQURvG1qvWlkCTwtATPXpcNQswa1V0lryq17VjuVT/xhKP+gNJtTG8 b5gbIkLkCE4auvuHLW01z+YeBU1aJzEvLDCmnBVsB4rLSPRT+z03WOiZMXytJ8EfdteBwz4N/RZ ZevIFo4WKN82HdskqucK4+3u9kdcdOjFwvnSlQl0qFt5PBGFr1ptbIDn0gJmidZ5363Q5tM7o80 tVgYsE+kUyIqq6ywsHr4GZh4pAmw4uIJQ+r2Cdtnxho2JJEV
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all pwm drivers to use .remove(), with the eventual goal to drop
struct platform_driver::remove_new(). As .remove() and .remove_new() have
the same prototypes, conversion is done by just changing the structure
member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 arch/powerpc/platforms/512x/mpc512x_lpbfifo.c | 2 +-
 arch/powerpc/platforms/85xx/sgy_cts1000.c     | 2 +-
 arch/powerpc/platforms/pasemi/gpio_mdio.c     | 2 +-
 arch/powerpc/platforms/powernv/opal-prd.c     | 2 +-
 arch/powerpc/platforms/pseries/papr_scm.c     | 2 +-
 arch/powerpc/sysdev/fsl_msi.c                 | 2 +-
 arch/powerpc/sysdev/pmi.c                     | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
index 4a25b6b48615..9668b052cd4b 100644
--- a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
+++ b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
@@ -504,7 +504,7 @@ MODULE_DEVICE_TABLE(of, mpc512x_lpbfifo_match);
 
 static struct platform_driver mpc512x_lpbfifo_driver = {
 	.probe = mpc512x_lpbfifo_probe,
-	.remove_new = mpc512x_lpbfifo_remove,
+	.remove = mpc512x_lpbfifo_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = mpc512x_lpbfifo_match,
diff --git a/arch/powerpc/platforms/85xx/sgy_cts1000.c b/arch/powerpc/platforms/85xx/sgy_cts1000.c
index 34ce21f42623..e635b27ee718 100644
--- a/arch/powerpc/platforms/85xx/sgy_cts1000.c
+++ b/arch/powerpc/platforms/85xx/sgy_cts1000.c
@@ -143,7 +143,7 @@ static struct platform_driver gpio_halt_driver = {
 		.of_match_table = gpio_halt_match,
 	},
 	.probe		= gpio_halt_probe,
-	.remove_new	= gpio_halt_remove,
+	.remove		= gpio_halt_remove,
 };
 
 module_platform_driver(gpio_halt_driver);
diff --git a/arch/powerpc/platforms/pasemi/gpio_mdio.c b/arch/powerpc/platforms/pasemi/gpio_mdio.c
index 4e983af32949..e4538d471256 100644
--- a/arch/powerpc/platforms/pasemi/gpio_mdio.c
+++ b/arch/powerpc/platforms/pasemi/gpio_mdio.c
@@ -285,7 +285,7 @@ MODULE_DEVICE_TABLE(of, gpio_mdio_match);
 static struct platform_driver gpio_mdio_driver =
 {
 	.probe		= gpio_mdio_probe,
-	.remove_new	= gpio_mdio_remove,
+	.remove		= gpio_mdio_remove,
 	.driver = {
 		.name = "gpio-mdio-bitbang",
 		.of_match_table = gpio_mdio_match,
diff --git a/arch/powerpc/platforms/powernv/opal-prd.c b/arch/powerpc/platforms/powernv/opal-prd.c
index 24f04f20d3e8..dc246ed4b7b4 100644
--- a/arch/powerpc/platforms/powernv/opal-prd.c
+++ b/arch/powerpc/platforms/powernv/opal-prd.c
@@ -443,7 +443,7 @@ static struct platform_driver opal_prd_driver = {
 		.of_match_table	= opal_prd_match,
 	},
 	.probe	= opal_prd_probe,
-	.remove_new = opal_prd_remove,
+	.remove = opal_prd_remove,
 };
 
 module_platform_driver(opal_prd_driver);
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index f6a70bc92e83..d95e03b3d3e3 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -1509,7 +1509,7 @@ static const struct of_device_id papr_scm_match[] = {
 
 static struct platform_driver papr_scm_driver = {
 	.probe = papr_scm_probe,
-	.remove_new = papr_scm_remove,
+	.remove = papr_scm_remove,
 	.driver = {
 		.name = "papr_scm",
 		.of_match_table = papr_scm_match,
diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
index e205135ae1fe..1aa0cb097c9c 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -603,7 +603,7 @@ static struct platform_driver fsl_of_msi_driver = {
 		.of_match_table = fsl_of_msi_ids,
 	},
 	.probe = fsl_of_msi_probe,
-	.remove_new = fsl_of_msi_remove,
+	.remove = fsl_of_msi_remove,
 };
 
 static __init int fsl_of_msi_init(void)
diff --git a/arch/powerpc/sysdev/pmi.c b/arch/powerpc/sysdev/pmi.c
index 737f97fd67d7..2511e586fe31 100644
--- a/arch/powerpc/sysdev/pmi.c
+++ b/arch/powerpc/sysdev/pmi.c
@@ -193,7 +193,7 @@ static void pmi_of_remove(struct platform_device *dev)
 
 static struct platform_driver pmi_of_platform_driver = {
 	.probe		= pmi_of_probe,
-	.remove_new	= pmi_of_remove,
+	.remove		= pmi_of_remove,
 	.driver = {
 		.name = "pmi",
 		.of_match_table = pmi_match,

base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
-- 
2.45.2


