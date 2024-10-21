Return-Path: <linuxppc-dev+bounces-2459-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D81589A644F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 12:45:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXBmG4421z2yVG;
	Mon, 21 Oct 2024 21:45:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729507534;
	cv=none; b=miGdHW0NcYaOmbx8pNN01iNMj2vRUi860HOvcIJgkmuCuGns9vXEw5sIs2J8cs3yECTvOzKUTOHTdCSb/l4UlmYslzmVzN56kKI61SwopET47y++JrSPHPAXEIEv3MbLKArUPycy4oGa4TcwQVJAhIv1oH2ZM1MrCcTL5Aj/XCddRXmsAjZbPWQl7kzxujjG17+mrAzQtD+GsnrAEDhaBbOjDZKLlLRveOTpoMqdHcsrVfgGr/1HNupsxdXQJF4fyck1jPT3HbRil063egPjiOgG89+f0Bw6UaNDJydSsEOGS4Abjp7Wf0Qmc8iyWjbxGk+7REdDN8BOlvbHLW1vpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729507534; c=relaxed/relaxed;
	bh=k3Cby4XV9gflu8W/UxOMiO5p42AshZvdOYCZUKwbt7o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n4VsDtvuU4UCE3DbitYEZBNep34vK0rNb59T2IrgwYpHdgMsPg9oEm8ehE3RlglRbOPi5F/Ah3N++dQJNgH2f84VBoKux9oVwujOYej9QvtqAssh6xUibagBZNYr3y1INhn0pVrASvJJhzKMQHNq9lMaDfyDKcfbfv66bQpfhfmQy5buf8AFKZN4l9FQcDt0FhRJfVIZ4hHsQ9umDuqQvw7gdhuZjAU/LNSux6eA4ufb//9eV4mXlc7viNcLiV8MISM3egV4YRn2WFqJYilB9CUIAlgnxn4OWXemrtxZCHvuOX/gHNxbmR1hxvVvwNw1zCWYDFYN482ur2SF9FzU9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=d6/CjXvN; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=d6/CjXvN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXBmD0tVGz2yLT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 21:45:28 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a9a977d6cc7so80633166b.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 03:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729507520; x=1730112320; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k3Cby4XV9gflu8W/UxOMiO5p42AshZvdOYCZUKwbt7o=;
        b=d6/CjXvNnS3tK2Yq9Bc3SiMeXjVwwBEI4ADM6NJly7aNY1WkmyIdM2IF3DCAfZdgzo
         B2AePVhH/VjD9ck1icNXZL+chEkuyWrZWkhFLYDuyNwOEvUyLsG2/boM6T8tEGYJ6qwF
         ozfKMIoWlucgY07/IfRpWdA5GYlLMI/qazj/hpT4SGksRfMuuJudidIoOtpG9rjha7Dq
         Ek7H2w8xLmumY+Q6oifYk+saNni7QcatxDjCd0M7FPrSg3yjo491ryObvdYg1KNMBCGV
         9LU0VScxMcHF0e2JERuH9SNAASmggcIidAMwZQnIAL4446OWSDW7v9NY5utXLXCSvygN
         TQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729507520; x=1730112320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3Cby4XV9gflu8W/UxOMiO5p42AshZvdOYCZUKwbt7o=;
        b=maNGq7tMD2PQGe6A0NX2SXEXE1YHq5LBK51+kkBDGWrgfICQtqMLnofBwdU69PYV+t
         y5BytI3IwGqx2GUvzqcS33NMAgcfmv/XrTO+kFYtGzg6eBLuoeCqC2BSxXahvbcPYrhj
         BqyTkuzw/F9pcs9YxlrQs9tp6OtZ9jhOBnh0FDebmSsHvJBubQWbfDmDikCSXRoR86q8
         eqxmZp62By5I2FtY5OW/4rAdDs+9cBJMzvmh1QVDW4ggxwmsKzJtHQcOe+KWuiRdTVVy
         wnY12LHSnCoIEewTr9pxU/zFMD7qYrqDpcEHHduD28uIoKDnW3Do5tk1Gc7pkV8Eo3I1
         B0ug==
X-Forwarded-Encrypted: i=1; AJvYcCVnLNnqU0n/tVX7NxDXS42qA/W4hDTriF5Qy1V/G7R0hjGrbEREmrQSQwPK1sqngfrUfO6dVOsxdouMlQM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxoM5PBgDduBWSzR1F7MjuD25JJgqGY/bJOrdsPcRmU3VbPF4oP
	A9rsx2I2l7jBCstp/9zkHGlOaop2skseMyVa6WIwlNkzKesz4Cmkq1Vcs4AJAgE=
X-Google-Smtp-Source: AGHT+IEhQ3lbc8bcTJ8PlVXWeGqp6K4dGB5VDI8ZZrvz+LFlAzQU+b1XSNKxL45fg2rsrolynjs5Iw==
X-Received: by 2002:a05:6402:51ca:b0:5c9:5928:970 with SMTP id 4fb4d7f45d1cf-5ca0ac61c0bmr12512201a12.19.1729507520113;
        Mon, 21 Oct 2024 03:45:20 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4dcsm1900917a12.4.2024.10.21.03.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 03:45:19 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mattia Dongili <malattia@linux.it>,
	Michal Simek <michal.simek@amd.com>,
	Eli Billauer <eli.billauer@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linuxppc-dev@lists.ozlabs.org,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] char: Switch back to struct platform_driver::remove()
Date: Mon, 21 Oct 2024 12:45:10 +0200
Message-ID: <20241021104511.405661-2-u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=WF27qBqFlxa47fR6RZgi2nrHC+6rRe7/Ai9CV0XlLus=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnFjC3w6Kl7S70XmAcoWOq+It3bPB4+g2z0+2EQ UtyssaTcPmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZxYwtwAKCRCPgPtYfRL+ TpT2B/46n9Xt4qU9Wegsv/T7RB51fpED9noRiefgHo+uEsifrm2IjxEOl7NfbxZ1GEvbx2QRl5t zUHmzaViAgRoGfCHyBR6RIC6a5ckq8ybHJPzSJVlooIaghhldpod0/yXf0ge1mwIDJ/YTti8pVR RvDv2uKKLc3GYlg3Zf2amGdXucKqjVyMBECi81cHSWHjqRMsIcWozcyMfYEe1Kl9nWX44oRawC7 JqfJC5sLZKcmEtpGorzapBcnpoLp2CtJPb/9sp14y9GuLKiCwsOo8KuZbLXmBfhTnFd13QUYz7y ll/KDOfBPY2cAyoXl1jq/7tC8FXXuph8AGLiUnUKRfFZRuKO
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers matched by the "CHAR and MISC DRIVERS"
maintainer's entry to use .remove(), with the eventual goal to drop
struct platform_driver::remove_new(). As .remove() and .remove_new()
have the same prototypes, conversion is done by just changing the
structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/char/powernv-op-panel.c            | 2 +-
 drivers/char/sonypi.c                      | 2 +-
 drivers/char/xilinx_hwicap/xilinx_hwicap.c | 2 +-
 drivers/char/xillybus/xillybus_of.c        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/char/powernv-op-panel.c b/drivers/char/powernv-op-panel.c
index f2cff1a6fed5..53467b0a6187 100644
--- a/drivers/char/powernv-op-panel.c
+++ b/drivers/char/powernv-op-panel.c
@@ -213,7 +213,7 @@ static struct platform_driver oppanel_driver = {
 		.of_match_table	= oppanel_match,
 	},
 	.probe	= oppanel_probe,
-	.remove_new = oppanel_remove,
+	.remove	= oppanel_remove,
 };
 
 module_platform_driver(oppanel_driver);
diff --git a/drivers/char/sonypi.c b/drivers/char/sonypi.c
index 0f8185e541ed..f887569fd3d0 100644
--- a/drivers/char/sonypi.c
+++ b/drivers/char/sonypi.c
@@ -1467,7 +1467,7 @@ static struct platform_driver sonypi_driver = {
 		.pm	= SONYPI_PM,
 	},
 	.probe		= sonypi_probe,
-	.remove_new	= sonypi_remove,
+	.remove		= sonypi_remove,
 	.shutdown	= sonypi_shutdown,
 };
 
diff --git a/drivers/char/xilinx_hwicap/xilinx_hwicap.c b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
index 4f6c3cb8aa41..34a345dc5e72 100644
--- a/drivers/char/xilinx_hwicap/xilinx_hwicap.c
+++ b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
@@ -738,7 +738,7 @@ MODULE_DEVICE_TABLE(of, hwicap_of_match);
 
 static struct platform_driver hwicap_platform_driver = {
 	.probe = hwicap_drv_probe,
-	.remove_new = hwicap_drv_remove,
+	.remove = hwicap_drv_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = hwicap_of_match,
diff --git a/drivers/char/xillybus/xillybus_of.c b/drivers/char/xillybus/xillybus_of.c
index 8802e2a6fd20..1a1e64133315 100644
--- a/drivers/char/xillybus/xillybus_of.c
+++ b/drivers/char/xillybus/xillybus_of.c
@@ -74,7 +74,7 @@ static void xilly_drv_remove(struct platform_device *op)
 
 static struct platform_driver xillybus_platform_driver = {
 	.probe = xilly_drv_probe,
-	.remove_new = xilly_drv_remove,
+	.remove = xilly_drv_remove,
 	.driver = {
 		.name = xillyname,
 		.of_match_table = xillybus_of_match,

base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
-- 
2.45.2


