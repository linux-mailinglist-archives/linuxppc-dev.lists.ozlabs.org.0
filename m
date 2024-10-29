Return-Path: <linuxppc-dev+bounces-2674-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ADF9B437F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 08:49:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xd2TF2hP4z2yMt;
	Tue, 29 Oct 2024 18:49:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730188161;
	cv=none; b=eduNTfqKGVn75sZ9Ft/jp98hxKT3B0/bPxZnm3Gn7lephpMAihEv7Xcth4gnfbKMPrDoGzHBMpAquWfND2OkbuTa5+pHVkp6v+BCWsRfQ+NyrwTWKY7fXWwyUFiLNBTEu/epg1LEWZDYDtHA7f+vzJQPRXDGZ4I7bibJ2li2CKsBh8PwIDf0Cqa1TKfoP7Ga+G3rsTGDqzNp/czR2guooirAN1f5O4jZcmhI34ux5sS8FGb1Ldf9SwfC2IhpmmkaUiOAiYA614OFfk6pOL30hu/UyXtZlgeBEjiKct97gtZReFD9/Q7xm24s/dh+PhJ+vMKbPtPf0tb1uwQPtQEytw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730188161; c=relaxed/relaxed;
	bh=QCw635TGuENx07EaRSTZGCzhpZFETm5Vel7NYeU7n3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C8hZ7Wqb8+pbCbIvCo0KalL9LzQuJUhGwnDinU3GE+MhM40vCuSqf44m5u7bvyf7ZQz0rcs7sX7Blj6fB2DLVdFvmr9UZ4mxmy3vW7NmrRSux2uGmbXi9uHQ8yqx407F7EY99v5QXIH8mB0LSNLWKEgEY/gwuc5PQJwebmyGOQ9HlKRFWDcEr6ki8rxlJntdelFS4VR/fpzHgAuvjXEsoGf8SpS6eBvy0ndO5O7UpIvOOZIkelDlNzK6EkVvqImofErHDj5Fnu1h/BSw3ZXFcF/HKjkeMbYJKe0YcB9+Xw5nQtajta9r8dHVWSur520/V1dogURkZ+IwhLfV/5SPLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1JI4O5WH; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1JI4O5WH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xd2TB4Mv2z2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 18:49:17 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-53b34ed38easo2425729e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 00:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730188149; x=1730792949; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QCw635TGuENx07EaRSTZGCzhpZFETm5Vel7NYeU7n3E=;
        b=1JI4O5WH9+vZx/qUccVek+uVMqcwqhWNx0bDHZgAHGQAeadIfywi3LHP/Sskna5UJi
         qSl7fnCHQV7kpFM2/tBFHuemsGl0iNchlGRxAWCTwUgG2QH4/LySSUro9Lj2vmzwEVDc
         WtayLkn6HLdXA1Mmsh6AjeFAx6+fjaOxi9cQRmu7wVfK4ITHAVQQtqYJrhpbEZIBpNwM
         9MnELPMj5eOyrTN77clVi8usq/RmDgafnZt33cfnFpR7T72//6Z5hJBwgOqNqC+kRMql
         YOFEsSPmACS/QISkkbgxKLGRkXeQYqOR4qp+mNCy+USEVAPcVvlcnj0TKbfGDaOOtY+r
         uAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730188149; x=1730792949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCw635TGuENx07EaRSTZGCzhpZFETm5Vel7NYeU7n3E=;
        b=ROj476FSnyYT0Fm1wxQg1vEIJjblbaTMznEefHr6cymeSNo+zCXZ1oPOZDfCmL+Qm9
         J5dcM0rM7DVcZe/qL0KsH8ju9TWZug4XVTLxSA4j7LQUqW2Y6pG6TcgZoFCgbPHnJXSy
         7gZguQsBd6ZkMCMmGjmEs+nwFo6qTT43baH0z9qu1R2+X3jLZbIBNvpsQBJG3httfFRl
         dH8Jtiw3fz8p53u0sFjezcb/uC4M7+6RTarzflpsWwUB1G4PoIeOEmwez3bHWqXL1la6
         vqH9ovz41dg1fXE5mEexTWqbbVCl5hh6AU7W4ibaMVxL9qMzXG9SYH1dMSIyQWTCBVvo
         kZug==
X-Forwarded-Encrypted: i=1; AJvYcCWBd+8f3UreoMqn+ucno1FwIitiLTwb2k4ZQcM88zdD86Mb1UQ3m6jSLVIxtedQTxyOfHzZYhNgAc+xDdQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwJG9MVof9/gjSRdV6WSfEB/9DTZ7Q8SRoIwmcUJUo1B5tdYUO3
	8566SZQMb3qwDCV7UrZ2fqsACFPzQT2VpqnX5lhJBEJ7d9tuRFFKRlvbFgGNMn8=
X-Google-Smtp-Source: AGHT+IEiy2uM0QbU0rGfI+6lQhTGNKNRDAhi18c5OfAAL1QDrCnK1OjCXdp0JS6eDw82pAWqu+69qg==
X-Received: by 2002:a05:6512:3ca1:b0:539:edf4:68b4 with SMTP id 2adb3069b0e04-53b34a320e7mr3505181e87.57.1730188149240;
        Tue, 29 Oct 2024 00:49:09 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b1cc0asm11850202f8f.10.2024.10.29.00.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 00:49:08 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
	Huisong Li <lihuisong@huawei.com>,
	Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Gabriel Somlo <gsomlo@gmail.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	Mark Brown <broonie@kernel.org>,
	David Wu <david.wu@rock-chips.com>,
	Jianqun Xu <jay.xu@rock-chips.com>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Izhar Ameer Shaikh <izhar.ameer.shaikh@amd.com>,
	Naman Trivedi Manojbhai <naman.trivedimanojbhai@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH] soc: Switch back to struct platform_driver::remove()
Date: Tue, 29 Oct 2024 08:48:58 +0100
Message-ID: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=26321; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=fnnipu1v9HmdJU4ysZHd39XDD27bDCU235ZUeCAg6nQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnIJNr/CHo9H03UCk92GQ+eXG9SjbKcOiSiGJM3 fvPNk4tk5+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZyCTawAKCRCPgPtYfRL+ Tr7WB/4oG7s/vSEelL6mw2Yv4b8acJHHEU0TymDWXfks0AghGYPP09hc+oS3icrfHXQ+BGjoJ4m iHzustxNtNbSMlEMziFj5toAnzAckkrZOp+HBPNyMa6BZ4d+Rev8bbiv3EEqHAW9yMSptFqS29R up+wNm2mTkdJHQA/zBMf2mzB1CBTyNq1QzyQi/v310HaL+LmsmSZnWwtmGV1a4ZmcgG9yYjrClI ThNQA3UAlM0/Dh4et/gbxxYd5I+GEuCgjI7dMaXzy9TqsfGaytroA4rHca5F+CuNw1WH8L0Nmz+ bnCkMH4JmUhw0NplwXtSNUoyb5xFcEUpWyvq7xgBzBLWuZcY
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/soc to use .remove(), with
the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

On the way do a few whitespace changes to make indention consistent.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of drivers/soc. While I usually prefer to
do one logical change per patch, this seems to be overengineering here
as the individual changes are really trivial and shouldn't be much in
the way for stable backports.

There is no dedicated maintainer for all of drivers/soc, but I'd expect
it to be ok to be picked up by the arm soc team.

This is based on today's next, if conflicts arise when you apply it at
some later time and don't want to resolve them, feel free to just drop
the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend.

Best regards
Uwe

 drivers/soc/aspeed/aspeed-lpc-ctrl.c        | 2 +-
 drivers/soc/aspeed/aspeed-lpc-snoop.c       | 2 +-
 drivers/soc/aspeed/aspeed-p2a-ctrl.c        | 2 +-
 drivers/soc/aspeed/aspeed-uart-routing.c    | 2 +-
 drivers/soc/fsl/dpaa2-console.c             | 2 +-
 drivers/soc/fsl/qe/qmc.c                    | 2 +-
 drivers/soc/fsl/qe/tsa.c                    | 2 +-
 drivers/soc/fujitsu/a64fx-diag.c            | 2 +-
 drivers/soc/hisilicon/kunpeng_hccs.c        | 2 +-
 drivers/soc/ixp4xx/ixp4xx-npe.c             | 2 +-
 drivers/soc/ixp4xx/ixp4xx-qmgr.c            | 2 +-
 drivers/soc/litex/litex_soc_ctrl.c          | 2 +-
 drivers/soc/loongson/loongson2_guts.c       | 2 +-
 drivers/soc/mediatek/mtk-devapc.c           | 2 +-
 drivers/soc/mediatek/mtk-mmsys.c            | 2 +-
 drivers/soc/mediatek/mtk-socinfo.c          | 2 +-
 drivers/soc/microchip/mpfs-sys-controller.c | 2 +-
 drivers/soc/pxa/ssp.c                       | 2 +-
 drivers/soc/qcom/icc-bwmon.c                | 2 +-
 drivers/soc/qcom/llcc-qcom.c                | 2 +-
 drivers/soc/qcom/ocmem.c                    | 2 +-
 drivers/soc/qcom/pmic_glink.c               | 2 +-
 drivers/soc/qcom/qcom_aoss.c                | 2 +-
 drivers/soc/qcom/qcom_gsbi.c                | 2 +-
 drivers/soc/qcom/qcom_stats.c               | 2 +-
 drivers/soc/qcom/ramp_controller.c          | 4 ++--
 drivers/soc/qcom/rmtfs_mem.c                | 2 +-
 drivers/soc/qcom/rpm-proc.c                 | 2 +-
 drivers/soc/qcom/rpm_master_stats.c         | 2 +-
 drivers/soc/qcom/smem.c                     | 2 +-
 drivers/soc/qcom/smp2p.c                    | 2 +-
 drivers/soc/qcom/smsm.c                     | 6 +++---
 drivers/soc/qcom/socinfo.c                  | 2 +-
 drivers/soc/rockchip/io-domain.c            | 8 ++++----
 drivers/soc/samsung/exynos-chipid.c         | 4 ++--
 drivers/soc/tegra/cbb/tegra194-cbb.c        | 2 +-
 drivers/soc/ti/k3-ringacc.c                 | 2 +-
 drivers/soc/ti/knav_dma.c                   | 4 ++--
 drivers/soc/ti/knav_qmss_queue.c            | 2 +-
 drivers/soc/ti/pm33xx.c                     | 2 +-
 drivers/soc/ti/pruss.c                      | 4 ++--
 drivers/soc/ti/smartreflex.c                | 2 +-
 drivers/soc/ti/wkup_m3_ipc.c                | 2 +-
 drivers/soc/xilinx/xlnx_event_manager.c     | 2 +-
 drivers/soc/xilinx/zynqmp_power.c           | 2 +-
 45 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
index e87038009d1b..ee58151bd69e 100644
--- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
@@ -353,7 +353,7 @@ static struct platform_driver aspeed_lpc_ctrl_driver = {
 		.of_match_table = aspeed_lpc_ctrl_match,
 	},
 	.probe = aspeed_lpc_ctrl_probe,
-	.remove_new = aspeed_lpc_ctrl_remove,
+	.remove = aspeed_lpc_ctrl_remove,
 };
 
 module_platform_driver(aspeed_lpc_ctrl_driver);
diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 888b5840c015..9ab5ba9cf1d6 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -366,7 +366,7 @@ static struct platform_driver aspeed_lpc_snoop_driver = {
 		.of_match_table = aspeed_lpc_snoop_match,
 	},
 	.probe = aspeed_lpc_snoop_probe,
-	.remove_new = aspeed_lpc_snoop_remove,
+	.remove = aspeed_lpc_snoop_remove,
 };
 
 module_platform_driver(aspeed_lpc_snoop_driver);
diff --git a/drivers/soc/aspeed/aspeed-p2a-ctrl.c b/drivers/soc/aspeed/aspeed-p2a-ctrl.c
index 8610ddacc7bc..6cc943744e12 100644
--- a/drivers/soc/aspeed/aspeed-p2a-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-p2a-ctrl.c
@@ -431,7 +431,7 @@ static struct platform_driver aspeed_p2a_ctrl_driver = {
 		.of_match_table = aspeed_p2a_ctrl_match,
 	},
 	.probe = aspeed_p2a_ctrl_probe,
-	.remove_new = aspeed_p2a_ctrl_remove,
+	.remove = aspeed_p2a_ctrl_remove,
 };
 
 module_platform_driver(aspeed_p2a_ctrl_driver);
diff --git a/drivers/soc/aspeed/aspeed-uart-routing.c b/drivers/soc/aspeed/aspeed-uart-routing.c
index a2195f062e01..0191e36e66e1 100644
--- a/drivers/soc/aspeed/aspeed-uart-routing.c
+++ b/drivers/soc/aspeed/aspeed-uart-routing.c
@@ -589,7 +589,7 @@ static struct platform_driver aspeed_uart_routing_driver = {
 		.of_match_table = aspeed_uart_routing_table,
 	},
 	.probe = aspeed_uart_routing_probe,
-	.remove_new = aspeed_uart_routing_remove,
+	.remove = aspeed_uart_routing_remove,
 };
 
 module_platform_driver(aspeed_uart_routing_driver);
diff --git a/drivers/soc/fsl/dpaa2-console.c b/drivers/soc/fsl/dpaa2-console.c
index 6dbc77db7718..6310f54e68a2 100644
--- a/drivers/soc/fsl/dpaa2-console.c
+++ b/drivers/soc/fsl/dpaa2-console.c
@@ -320,7 +320,7 @@ static struct platform_driver dpaa2_console_driver = {
 		   .of_match_table = dpaa2_console_match_table,
 		   },
 	.probe = dpaa2_console_probe,
-	.remove_new = dpaa2_console_remove,
+	.remove = dpaa2_console_remove,
 };
 module_platform_driver(dpaa2_console_driver);
 
diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 19cc581b06d0..29d7fd7d5b21 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -2092,7 +2092,7 @@ static struct platform_driver qmc_driver = {
 		.of_match_table = of_match_ptr(qmc_id_table),
 	},
 	.probe = qmc_probe,
-	.remove_new = qmc_remove,
+	.remove = qmc_remove,
 };
 module_platform_driver(qmc_driver);
 
diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
index f0889b3fcaf2..515da9b45c2c 100644
--- a/drivers/soc/fsl/qe/tsa.c
+++ b/drivers/soc/fsl/qe/tsa.c
@@ -1086,7 +1086,7 @@ static struct platform_driver tsa_driver = {
 		.of_match_table = of_match_ptr(tsa_id_table),
 	},
 	.probe = tsa_probe,
-	.remove_new = tsa_remove,
+	.remove = tsa_remove,
 };
 module_platform_driver(tsa_driver);
 
diff --git a/drivers/soc/fujitsu/a64fx-diag.c b/drivers/soc/fujitsu/a64fx-diag.c
index 330901893577..76cb0b6a221c 100644
--- a/drivers/soc/fujitsu/a64fx-diag.c
+++ b/drivers/soc/fujitsu/a64fx-diag.c
@@ -142,7 +142,7 @@ static struct platform_driver a64fx_diag_driver = {
 		.acpi_match_table = ACPI_PTR(a64fx_diag_acpi_match),
 	},
 	.probe = a64fx_diag_probe,
-	.remove_new = a64fx_diag_remove,
+	.remove = a64fx_diag_remove,
 };
 
 module_platform_driver(a64fx_diag_driver);
diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
index e882a61636ec..8f51e59c9bb1 100644
--- a/drivers/soc/hisilicon/kunpeng_hccs.c
+++ b/drivers/soc/hisilicon/kunpeng_hccs.c
@@ -1348,7 +1348,7 @@ MODULE_DEVICE_TABLE(acpi, hccs_acpi_match);
 
 static struct platform_driver hccs_driver = {
 	.probe = hccs_probe,
-	.remove_new = hccs_remove,
+	.remove = hccs_remove,
 	.driver = {
 		.name = "kunpeng_hccs",
 		.acpi_match_table = hccs_acpi_match,
diff --git a/drivers/soc/ixp4xx/ixp4xx-npe.c b/drivers/soc/ixp4xx/ixp4xx-npe.c
index 34a6f187c220..33e2e0366f19 100644
--- a/drivers/soc/ixp4xx/ixp4xx-npe.c
+++ b/drivers/soc/ixp4xx/ixp4xx-npe.c
@@ -759,7 +759,7 @@ static struct platform_driver ixp4xx_npe_driver = {
 		.of_match_table = ixp4xx_npe_of_match,
 	},
 	.probe = ixp4xx_npe_probe,
-	.remove_new = ixp4xx_npe_remove,
+	.remove = ixp4xx_npe_remove,
 };
 module_platform_driver(ixp4xx_npe_driver);
 
diff --git a/drivers/soc/ixp4xx/ixp4xx-qmgr.c b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
index cb112f3643e9..475e229039e3 100644
--- a/drivers/soc/ixp4xx/ixp4xx-qmgr.c
+++ b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
@@ -461,7 +461,7 @@ static struct platform_driver ixp4xx_qmgr_driver = {
 		.of_match_table = ixp4xx_qmgr_of_match,
 	},
 	.probe = ixp4xx_qmgr_probe,
-	.remove_new = ixp4xx_qmgr_remove,
+	.remove = ixp4xx_qmgr_remove,
 };
 module_platform_driver(ixp4xx_qmgr_driver);
 
diff --git a/drivers/soc/litex/litex_soc_ctrl.c b/drivers/soc/litex/litex_soc_ctrl.c
index 72c44119dd54..d08bfc8ef7be 100644
--- a/drivers/soc/litex/litex_soc_ctrl.c
+++ b/drivers/soc/litex/litex_soc_ctrl.c
@@ -131,7 +131,7 @@ static struct platform_driver litex_soc_ctrl_driver = {
 		.of_match_table = litex_soc_ctrl_of_match,
 	},
 	.probe = litex_soc_ctrl_probe,
-	.remove_new = litex_soc_ctrl_remove,
+	.remove = litex_soc_ctrl_remove,
 };
 
 module_platform_driver(litex_soc_ctrl_driver);
diff --git a/drivers/soc/loongson/loongson2_guts.c b/drivers/soc/loongson/loongson2_guts.c
index ef352a0f5022..ae42e3a9127f 100644
--- a/drivers/soc/loongson/loongson2_guts.c
+++ b/drivers/soc/loongson/loongson2_guts.c
@@ -169,7 +169,7 @@ static struct platform_driver loongson2_guts_driver = {
 		.of_match_table = loongson2_guts_of_match,
 	},
 	.probe = loongson2_guts_probe,
-	.remove_new = loongson2_guts_remove,
+	.remove = loongson2_guts_remove,
 };
 
 static int __init loongson2_guts_init(void)
diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index 56cc345552a4..2a1adcb87d4e 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -301,7 +301,7 @@ static void mtk_devapc_remove(struct platform_device *pdev)
 
 static struct platform_driver mtk_devapc_driver = {
 	.probe = mtk_devapc_probe,
-	.remove_new = mtk_devapc_remove,
+	.remove = mtk_devapc_remove,
 	.driver = {
 		.name = "mtk-devapc",
 		.of_match_table = mtk_devapc_dt_match,
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 938240714e54..bb4639ca0b8c 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -487,7 +487,7 @@ static struct platform_driver mtk_mmsys_drv = {
 		.of_match_table = of_match_mtk_mmsys,
 	},
 	.probe = mtk_mmsys_probe,
-	.remove_new = mtk_mmsys_remove,
+	.remove = mtk_mmsys_remove,
 };
 module_platform_driver(mtk_mmsys_drv);
 
diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
index 74672a9d6d13..123b12cd2543 100644
--- a/drivers/soc/mediatek/mtk-socinfo.c
+++ b/drivers/soc/mediatek/mtk-socinfo.c
@@ -187,7 +187,7 @@ static void mtk_socinfo_remove(struct platform_device *pdev)
 
 static struct platform_driver mtk_socinfo = {
 	.probe = mtk_socinfo_probe,
-	.remove_new = mtk_socinfo_remove,
+	.remove = mtk_socinfo_remove,
 	.driver = {
 		.name = "mtk-socinfo",
 	},
diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 7a4936019329..30bc45d17d34 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -232,7 +232,7 @@ static struct platform_driver mpfs_sys_controller_driver = {
 		.of_match_table = mpfs_sys_controller_of_match,
 	},
 	.probe = mpfs_sys_controller_probe,
-	.remove_new = mpfs_sys_controller_remove,
+	.remove = mpfs_sys_controller_remove,
 };
 module_platform_driver(mpfs_sys_controller_driver);
 
diff --git a/drivers/soc/pxa/ssp.c b/drivers/soc/pxa/ssp.c
index 854d32e04558..bb0062c165fe 100644
--- a/drivers/soc/pxa/ssp.c
+++ b/drivers/soc/pxa/ssp.c
@@ -197,7 +197,7 @@ static const struct platform_device_id ssp_id_table[] = {
 
 static struct platform_driver pxa_ssp_driver = {
 	.probe		= pxa_ssp_probe,
-	.remove_new	= pxa_ssp_remove,
+	.remove		= pxa_ssp_remove,
 	.driver		= {
 		.name		= "pxa2xx-ssp",
 		.of_match_table	= of_match_ptr(pxa_ssp_of_ids),
diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
index f9235bc3aa3b..3dfa448bf8cf 100644
--- a/drivers/soc/qcom/icc-bwmon.c
+++ b/drivers/soc/qcom/icc-bwmon.c
@@ -872,7 +872,7 @@ MODULE_DEVICE_TABLE(of, bwmon_of_match);
 
 static struct platform_driver bwmon_driver = {
 	.probe = bwmon_probe,
-	.remove_new = bwmon_remove,
+	.remove = bwmon_remove,
 	.driver = {
 		.name = "qcom-bwmon",
 		.of_match_table = bwmon_of_match,
diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index a470285f54a8..99fc6f7f35f0 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -3510,7 +3510,7 @@ static struct platform_driver qcom_llcc_driver = {
 		.of_match_table = qcom_llcc_of_match,
 	},
 	.probe = qcom_llcc_probe,
-	.remove_new = qcom_llcc_remove,
+	.remove = qcom_llcc_remove,
 };
 module_platform_driver(qcom_llcc_driver);
 
diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
index ff8df7d75d6b..9c3bd37b6579 100644
--- a/drivers/soc/qcom/ocmem.c
+++ b/drivers/soc/qcom/ocmem.c
@@ -439,7 +439,7 @@ MODULE_DEVICE_TABLE(of, ocmem_of_match);
 
 static struct platform_driver ocmem_driver = {
 	.probe = ocmem_dev_probe,
-	.remove_new = ocmem_dev_remove,
+	.remove = ocmem_dev_remove,
 	.driver = {
 		.name = "ocmem",
 		.of_match_table = ocmem_of_match,
diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index baa4ac6704a9..caf3f63d940e 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -399,7 +399,7 @@ MODULE_DEVICE_TABLE(of, pmic_glink_of_match);
 
 static struct platform_driver pmic_glink_driver = {
 	.probe = pmic_glink_probe,
-	.remove_new = pmic_glink_remove,
+	.remove = pmic_glink_remove,
 	.driver = {
 		.name = "qcom_pmic_glink",
 		.of_match_table = pmic_glink_of_match,
diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 60af26667bce..0320ad3b9148 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -664,7 +664,7 @@ static struct platform_driver qmp_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = qmp_probe,
-	.remove_new = qmp_remove,
+	.remove = qmp_remove,
 };
 module_platform_driver(qmp_driver);
 
diff --git a/drivers/soc/qcom/qcom_gsbi.c b/drivers/soc/qcom/qcom_gsbi.c
index f04b9a324ea9..8f1158e0c631 100644
--- a/drivers/soc/qcom/qcom_gsbi.c
+++ b/drivers/soc/qcom/qcom_gsbi.c
@@ -232,7 +232,7 @@ static struct platform_driver gsbi_driver = {
 		.of_match_table	= gsbi_dt_match,
 	},
 	.probe = gsbi_probe,
-	.remove_new = gsbi_remove,
+	.remove = gsbi_remove,
 };
 
 module_platform_driver(gsbi_driver);
diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index c429d5154aae..5de99cf59b9f 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -274,7 +274,7 @@ MODULE_DEVICE_TABLE(of, qcom_stats_table);
 
 static struct platform_driver qcom_stats = {
 	.probe = qcom_stats_probe,
-	.remove_new = qcom_stats_remove,
+	.remove = qcom_stats_remove,
 	.driver = {
 		.name = "qcom_stats",
 		.of_match_table = qcom_stats_table,
diff --git a/drivers/soc/qcom/ramp_controller.c b/drivers/soc/qcom/ramp_controller.c
index e9a0cca07189..349bdfbc61ef 100644
--- a/drivers/soc/qcom/ramp_controller.c
+++ b/drivers/soc/qcom/ramp_controller.c
@@ -331,8 +331,8 @@ static struct platform_driver qcom_ramp_controller_driver = {
 		.of_match_table = qcom_ramp_controller_match_table,
 		.suppress_bind_attrs = true,
 	},
-	.probe  = qcom_ramp_controller_probe,
-	.remove_new = qcom_ramp_controller_remove,
+	.probe = qcom_ramp_controller_probe,
+	.remove = qcom_ramp_controller_remove,
 };
 
 static int __init qcom_ramp_controller_init(void)
diff --git a/drivers/soc/qcom/rmtfs_mem.c b/drivers/soc/qcom/rmtfs_mem.c
index df850d073102..33603b8fd8f3 100644
--- a/drivers/soc/qcom/rmtfs_mem.c
+++ b/drivers/soc/qcom/rmtfs_mem.c
@@ -315,7 +315,7 @@ MODULE_DEVICE_TABLE(of, qcom_rmtfs_mem_of_match);
 
 static struct platform_driver qcom_rmtfs_mem_driver = {
 	.probe = qcom_rmtfs_mem_probe,
-	.remove_new = qcom_rmtfs_mem_remove,
+	.remove = qcom_rmtfs_mem_remove,
 	.driver  = {
 		.name  = "qcom_rmtfs_mem",
 		.of_match_table = qcom_rmtfs_mem_of_match,
diff --git a/drivers/soc/qcom/rpm-proc.c b/drivers/soc/qcom/rpm-proc.c
index 2995d9b90190..2466d0400c2e 100644
--- a/drivers/soc/qcom/rpm-proc.c
+++ b/drivers/soc/qcom/rpm-proc.c
@@ -53,7 +53,7 @@ MODULE_DEVICE_TABLE(of, rpm_proc_of_match);
 
 static struct platform_driver rpm_proc_driver = {
 	.probe = rpm_proc_probe,
-	.remove_new = rpm_proc_remove,
+	.remove = rpm_proc_remove,
 	.driver = {
 		.name = "qcom-rpm-proc",
 		.of_match_table = rpm_proc_of_match,
diff --git a/drivers/soc/qcom/rpm_master_stats.c b/drivers/soc/qcom/rpm_master_stats.c
index 086fe4ba6707..49e4f9457279 100644
--- a/drivers/soc/qcom/rpm_master_stats.c
+++ b/drivers/soc/qcom/rpm_master_stats.c
@@ -155,7 +155,7 @@ static const struct of_device_id rpm_master_table[] = {
 
 static struct platform_driver master_stats_driver = {
 	.probe = master_stats_probe,
-	.remove_new = master_stats_remove,
+	.remove = master_stats_remove,
 	.driver = {
 		.name = "qcom_rpm_master_stats",
 		.of_match_table = rpm_master_table,
diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 0d1ccf3ef108..b8e9f5068ca1 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -1257,7 +1257,7 @@ MODULE_DEVICE_TABLE(of, qcom_smem_of_match);
 
 static struct platform_driver qcom_smem_driver = {
 	.probe = qcom_smem_probe,
-	.remove_new = qcom_smem_remove,
+	.remove = qcom_smem_remove,
 	.driver  = {
 		.name = "qcom-smem",
 		.of_match_table = qcom_smem_of_match,
diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index cefcbd61c628..9295a13ae996 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -698,7 +698,7 @@ MODULE_DEVICE_TABLE(of, qcom_smp2p_of_match);
 
 static struct platform_driver qcom_smp2p_driver = {
 	.probe = qcom_smp2p_probe,
-	.remove_new = qcom_smp2p_remove,
+	.remove = qcom_smp2p_remove,
 	.driver  = {
 		.name  = "qcom_smp2p",
 		.of_match_table = qcom_smp2p_of_match,
diff --git a/drivers/soc/qcom/smsm.c b/drivers/soc/qcom/smsm.c
index ffe78ae34386..e803ea342c97 100644
--- a/drivers/soc/qcom/smsm.c
+++ b/drivers/soc/qcom/smsm.c
@@ -682,9 +682,9 @@ MODULE_DEVICE_TABLE(of, qcom_smsm_of_match);
 
 static struct platform_driver qcom_smsm_driver = {
 	.probe = qcom_smsm_probe,
-	.remove_new = qcom_smsm_remove,
-	.driver  = {
-		.name  = "qcom-smsm",
+	.remove = qcom_smsm_remove,
+	.driver = {
+		.name = "qcom-smsm",
 		.of_match_table = qcom_smsm_of_match,
 	},
 };
diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 21ab8c699251..01a0bb71638b 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -825,7 +825,7 @@ static void qcom_socinfo_remove(struct platform_device *pdev)
 
 static struct platform_driver qcom_socinfo_driver = {
 	.probe = qcom_socinfo_probe,
-	.remove_new = qcom_socinfo_remove,
+	.remove = qcom_socinfo_remove,
 	.driver  = {
 		.name = "qcom-socinfo",
 	},
diff --git a/drivers/soc/rockchip/io-domain.c b/drivers/soc/rockchip/io-domain.c
index fd9fd31f71c2..f94985a905c2 100644
--- a/drivers/soc/rockchip/io-domain.c
+++ b/drivers/soc/rockchip/io-domain.c
@@ -742,10 +742,10 @@ static void rockchip_iodomain_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver rockchip_iodomain_driver = {
-	.probe   = rockchip_iodomain_probe,
-	.remove_new = rockchip_iodomain_remove,
-	.driver  = {
-		.name  = "rockchip-iodomain",
+	.probe = rockchip_iodomain_probe,
+	.remove = rockchip_iodomain_remove,
+	.driver = {
+		.name = "rockchip-iodomain",
 		.of_match_table = rockchip_iodomain_match,
 	},
 };
diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 23cc20896b85..e37dde1fb588 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -198,8 +198,8 @@ static struct platform_driver exynos_chipid_driver = {
 		.name = "exynos-chipid",
 		.of_match_table = exynos_chipid_of_device_ids,
 	},
-	.probe	= exynos_chipid_probe,
-	.remove_new = exynos_chipid_remove,
+	.probe = exynos_chipid_probe,
+	.remove = exynos_chipid_remove,
 };
 module_platform_driver(exynos_chipid_driver);
 
diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb/tegra194-cbb.c
index 9cbc562ae7d3..846b17ffc2f9 100644
--- a/drivers/soc/tegra/cbb/tegra194-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
@@ -2330,7 +2330,7 @@ static const struct dev_pm_ops tegra194_cbb_pm = {
 
 static struct platform_driver tegra194_cbb_driver = {
 	.probe = tegra194_cbb_probe,
-	.remove_new = tegra194_cbb_remove,
+	.remove = tegra194_cbb_remove,
 	.driver = {
 		.name = "tegra194-cbb",
 		.of_match_table = of_match_ptr(tegra194_cbb_match),
diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
index 8c0102968351..82a15cad1c6c 100644
--- a/drivers/soc/ti/k3-ringacc.c
+++ b/drivers/soc/ti/k3-ringacc.c
@@ -1562,7 +1562,7 @@ static void k3_ringacc_remove(struct platform_device *pdev)
 
 static struct platform_driver k3_ringacc_driver = {
 	.probe		= k3_ringacc_probe,
-	.remove_new	= k3_ringacc_remove,
+	.remove		= k3_ringacc_remove,
 	.driver		= {
 		.name	= "k3-ringacc",
 		.of_match_table = k3_ringacc_of_match,
diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
index fb0746d8caad..a25ebe6cd503 100644
--- a/drivers/soc/ti/knav_dma.c
+++ b/drivers/soc/ti/knav_dma.c
@@ -783,8 +783,8 @@ MODULE_DEVICE_TABLE(of, of_match);
 
 static struct platform_driver knav_dma_driver = {
 	.probe	= knav_dma_probe,
-	.remove_new = knav_dma_remove,
-	.driver = {
+	.remove	= knav_dma_remove,
+	.driver	= {
 		.name		= "keystone-navigator-dma",
 		.of_match_table	= of_match,
 	},
diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index b4051cb932c4..ea52425864a9 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -1892,7 +1892,7 @@ static void knav_queue_remove(struct platform_device *pdev)
 
 static struct platform_driver keystone_qmss_driver = {
 	.probe		= knav_queue_probe,
-	.remove_new	= knav_queue_remove,
+	.remove		= knav_queue_remove,
 	.driver		= {
 		.name	= "keystone-navigator-qmss",
 		.of_match_table = keystone_qmss_of_match,
diff --git a/drivers/soc/ti/pm33xx.c b/drivers/soc/ti/pm33xx.c
index 8169885ab1e0..dfdff186c805 100644
--- a/drivers/soc/ti/pm33xx.c
+++ b/drivers/soc/ti/pm33xx.c
@@ -591,7 +591,7 @@ static struct platform_driver am33xx_pm_driver = {
 		.name   = "pm33xx",
 	},
 	.probe = am33xx_pm_probe,
-	.remove_new = am33xx_pm_remove,
+	.remove = am33xx_pm_remove,
 };
 module_platform_driver(am33xx_pm_driver);
 
diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index 3ec758f50e24..d7634bf5413a 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -593,8 +593,8 @@ static struct platform_driver pruss_driver = {
 		.name = "pruss",
 		.of_match_table = pruss_of_match,
 	},
-	.probe  = pruss_probe,
-	.remove_new = pruss_remove,
+	.probe = pruss_probe,
+	.remove = pruss_remove,
 };
 module_platform_driver(pruss_driver);
 
diff --git a/drivers/soc/ti/smartreflex.c b/drivers/soc/ti/smartreflex.c
index 38add2ab5613..ced3a73929e3 100644
--- a/drivers/soc/ti/smartreflex.c
+++ b/drivers/soc/ti/smartreflex.c
@@ -969,7 +969,7 @@ MODULE_DEVICE_TABLE(of, omap_sr_match);
 
 static struct platform_driver smartreflex_driver = {
 	.probe		= omap_sr_probe,
-	.remove_new     = omap_sr_remove,
+	.remove         = omap_sr_remove,
 	.shutdown	= omap_sr_shutdown,
 	.driver		= {
 		.name	= DRIVER_NAME,
diff --git a/drivers/soc/ti/wkup_m3_ipc.c b/drivers/soc/ti/wkup_m3_ipc.c
index 88f774db9208..79dde9a7ec63 100644
--- a/drivers/soc/ti/wkup_m3_ipc.c
+++ b/drivers/soc/ti/wkup_m3_ipc.c
@@ -755,7 +755,7 @@ MODULE_DEVICE_TABLE(of, wkup_m3_ipc_of_match);
 
 static struct platform_driver wkup_m3_ipc_driver = {
 	.probe = wkup_m3_ipc_probe,
-	.remove_new = wkup_m3_ipc_remove,
+	.remove = wkup_m3_ipc_remove,
 	.driver = {
 		.name = "wkup_m3_ipc",
 		.of_match_table = wkup_m3_ipc_of_match,
diff --git a/drivers/soc/xilinx/xlnx_event_manager.c b/drivers/soc/xilinx/xlnx_event_manager.c
index 85df6b9c04ee..a572d15f6161 100644
--- a/drivers/soc/xilinx/xlnx_event_manager.c
+++ b/drivers/soc/xilinx/xlnx_event_manager.c
@@ -711,7 +711,7 @@ static void xlnx_event_manager_remove(struct platform_device *pdev)
 
 static struct platform_driver xlnx_event_manager_driver = {
 	.probe = xlnx_event_manager_probe,
-	.remove_new = xlnx_event_manager_remove,
+	.remove = xlnx_event_manager_remove,
 	.driver = {
 		.name = "xlnx_event_manager",
 	},
diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
index 411d33f2fb05..ae59bf16659a 100644
--- a/drivers/soc/xilinx/zynqmp_power.c
+++ b/drivers/soc/xilinx/zynqmp_power.c
@@ -408,7 +408,7 @@ MODULE_DEVICE_TABLE(of, pm_of_match);
 
 static struct platform_driver zynqmp_pm_platform_driver = {
 	.probe = zynqmp_pm_probe,
-	.remove_new = zynqmp_pm_remove,
+	.remove = zynqmp_pm_remove,
 	.driver = {
 		.name = "zynqmp_power",
 		.of_match_table = pm_of_match,

base-commit: 6fb2fa9805c501d9ade047fc511961f3273cdcb5
-- 
2.45.2

