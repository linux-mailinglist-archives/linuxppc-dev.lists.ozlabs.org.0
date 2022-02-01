Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCA64A68BE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 00:48:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpM7p5BKgz3bmf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 10:48:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=urfUC2Te;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::134;
 helo=mail-lf1-x134.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=urfUC2Te; dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpM791fXpz2yfh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 10:47:46 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id z4so37138125lft.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Feb 2022 15:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tDl91pCxTReCNE1aU2nzUISNbuzO3L0SJItkPcl6pUM=;
 b=urfUC2Te907xmj6E2xNYtO5fCaL7szA/68O2FXd8oWgZWUkuO3zgR+aiv8Qa8hvW9K
 bMIpu009wuaNGvAZ+EB/np1qhOOFVwPiKqdIL0qGCkgnvH8PqNv9aTgEvvqAeVb4DGnQ
 CfSuUdvWHbr2xOUC2ebAtv2k+uXCv5gVTEcmOo0h4VsgyoUd5e7ecwTbsggUJ4XCncEB
 /SPJ7YrK0nmO3Kb/UaTc9gQmWZzM8rMAfcWypdTG4j3wRgVMKWEbqziJCGO09LcnOmwc
 YkBelE4cu7jMmFnTj3xW283XL/zIQTFkmAkWl8OZ1RyS3RuMy3AwJGbVOeU5nmL8Gqa/
 +uIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tDl91pCxTReCNE1aU2nzUISNbuzO3L0SJItkPcl6pUM=;
 b=osDlPVJJO75CVLaI57RXXtwg1T0aQhO2ToQwNa+VtC+4ixHNNz/0J45pX6pruEowVc
 wKWM86mENY6PFbW5dfYaxbNFp+QQvH3ZewaP7y7eNSCshIvndl0OAsvuLKijj7PN757D
 GQVv1JuP2ylGT+C3Ns9ddBquKYRaeaiQkXvTx9+rjIMkQahUpNugmHHa5+E8HmjzLIKF
 nkmL6gJvZ7Zcgg0aVZFuowIXWrTQ4Lq1MJatZBkfI1CG17O/XMnSsWSrAfSWh9Qicgnv
 4CDj3elGCWyYBbCmr4xN4uJRlgss3vXo0eQ9KvveQV154Mw4YMb1kmaA3Vm/qc0/AJYf
 Vv8A==
X-Gm-Message-State: AOAM531XQXIWEoBc8/ofFbzQvffRoi/wLhH9zTZatHHeobKD98ZQmfwa
 nyd+2Lc0LCb6Av4fIAZFpQGDYg==
X-Google-Smtp-Source: ABdhPJzYRFKveyx4qbvl5fhnYo3J6NQY4iqSZXvFmmwqmIdcBYyS6ujxmuOYjqn2ftOlU7ARNsnNog==
X-Received: by 2002:ac2:5ccc:: with SMTP id f12mr21482408lfq.335.1643759259268; 
 Tue, 01 Feb 2022 15:47:39 -0800 (PST)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id o8sm4280202lft.135.2022.02.01.15.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 15:47:38 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org
Subject: [PATCH] spi: mpc512x-psc: Fix compile errors
Date: Wed,  2 Feb 2022 00:45:35 +0100
Message-Id: <20220201234535.569973-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org,
 kernel test robot <lkp@intel.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

My patch created compilation bugs in the MPC512x-PSC driver.
Fix them up.

Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org
Reported-by: kernel test robot <lkp@intel.com>
Fixes: 2818824ced4b (" spi: mpc512x-psc: Convert to use GPIO descriptors")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
(This is because I don't have a PPC cross compiler.)
---
 drivers/spi/spi-mpc512x-psc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/spi/spi-mpc512x-psc.c b/drivers/spi/spi-mpc512x-psc.c
index 8a488d8e4c1b..03630359ce70 100644
--- a/drivers/spi/spi-mpc512x-psc.c
+++ b/drivers/spi/spi-mpc512x-psc.c
@@ -127,7 +127,7 @@ static void mpc512x_psc_spi_activate_cs(struct spi_device *spi)
 	out_be32(psc_addr(mps, ccr), ccr);
 	mps->bits_per_word = cs->bits_per_word;
 
-	if (cs->gpiod) {
+	if (spi->cs_gpiod) {
 		if (mps->cs_control)
 			/* boardfile override */
 			mps->cs_control(spi, (spi->mode & SPI_CS_HIGH) ? 1 : 0);
@@ -373,7 +373,6 @@ static int mpc512x_psc_spi_unprep_xfer_hw(struct spi_master *master)
 static int mpc512x_psc_spi_setup(struct spi_device *spi)
 {
 	struct mpc512x_psc_spi_cs *cs = spi->controller_state;
-	int ret;
 
 	if (spi->bits_per_word % 8)
 		return -EINVAL;
-- 
2.34.1

