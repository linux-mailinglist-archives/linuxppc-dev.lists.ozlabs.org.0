Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBC67A6D07
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 23:41:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rqw8f1slKz3cjn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 07:41:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 1329 seconds by postgrey-1.37 at boromir; Tue, 19 Sep 2023 23:54:37 AEST
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rqjp52gg4z2ymM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 23:54:37 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiapy-0004ag-Bz; Tue, 19 Sep 2023 15:32:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiapm-007T2h-H7; Tue, 19 Sep 2023 15:32:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiapm-0030dV-1Z; Tue, 19 Sep 2023 15:32:10 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 00/59] dma: Convert to platform remove callback returning void
Date: Tue, 19 Sep 2023 15:31:08 +0200
Message-Id: <20230919133207.1400430-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9667; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=tGUgNdNJQ695fgG9hIgTJQYL5sxpmWlzE5DMR2kZNlc=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlTOhWtLjCu3xIpJ1tk3pezRVeg6rNEtxCXsJlBVr3bg4 JsVOpWdjMYsDIxcDLJiiiz2jWsyrarkIjvX/rsMM4iVCWQKAxenAEzkswoHw8LXkzrq3WIZnyZn aDe1hsff5brekVkqVSd8df29f+t2cdtpMkbG78qb8uKDwde10aIPVgm0X7ny/lVz+smb71SUb7J xyvxVulO8zvUwd4/x0Whm+cTGTLOCeV3JkRcNr8wwuZreMUVY8kHD2pPn117dY5Fto654or3K8f sqi8W2N/1L155KfcOtv2n+FvO/qydtUTc/oswgXVFsrClsxGPCcDjMYGpegdZvrrg1VTKTRfksL u0qrGsVeHsgupv1eFFxzMaFFz5+t++K27owNfJt5Dutw60Srt0Mcr+Fl+aebbn+kMud5zL/5YB7 7xJ3/1q8wHTpjvwssxsKusdMtT28XU4UHvVZPSfY58hHAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Mailman-Approved-At: Wed, 20 Sep 2023 07:40:55 +1000
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-arm-msm@vger.kernel.org, Brian Xu <brian.xu@amd.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Paul Cercueil <paul@crapouillou.net>, Biju Das <biju.das.jz@bp.renesas.com>, Chen-Yu Tsai <wens@csie.org>, Laxman Dewangan <ldewangan@nvidia.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>, Swati Agarwal <swati.agarwal@amd.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, Peter Korsgaard <peter@korsgaard.com>, Lars-Peter Clausen <lars@metafoo.de>, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Green Wan <green.wan@sifive.com>, Viresh Kumar <vireshk@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Sinan Kaya <okaya@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, Peter Ujfalusi <peter.ujfalu
 si@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Zhang Wei <zw@zh-kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, ye xingchen <ye.xingchen@zte.com.cn>, Olivier Dautricourt <olivierdautricourt@gmail.com>, Yangtao Li <frank.li@vivo.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Patrice Chotard <patrice.chotard@foss.st.com>, linux-tegra@vger.kernel.org, Kees Cook <keescook@chromium.org>, Sven Peter <sven@svenpeter.dev>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@mediatek.com>, linux-actions@lists.infradead.org, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Liu Shixin <liushixin2@huawei.com>, Robert Jarzmik <robert.jarzmik@free.fr>, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Baolin Wang <baolin.wang@
 linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Harini Katakam <harini.katakam@amd.com>, Lizhi Hou <lizhi.hou@amd.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Scott Branden <sbranden@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>, linux-mips@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, linux-sunxi@lists.linux.dev, Thierry Reding <thierry.reding@gmail.com>, asahi@lists.linux.dev, kernel@pengutronix.de, Pavel Machek <pavel@denx.de>, dmaengine@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Daniel Mack <daniel@zon
 que.org>, Hien Huynh <hien.huynh.px@renesas.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

this series convert nearly all platform drivers below drivers/dma to use
.remove_new(). The motivation is to get rid of an integer return code
that is (mostly) ignored by the platform driver core and error prone on
the driver side.

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal.

There are 4 drivers I didn't convert in this series:

	drivers/dma/milbeaut-hdmac.c
	drivers/dma/milbeaut-xdmac.c
	drivers/dma/uniphier-mdmac.c
	drivers/dma/uniphier-xdmac.c

These all might return early in .remove() if dmaengine_terminate_sync()
fails. I only looked deeper into the first one, and this shows exactly
the error that is easy to make with .remove() returning an int: When
returning early from .remove(), some cleanup (here:
dma_async_device_unregister()) is skipped. So the dma device stays
known, but the device is still unregistered and the devm allocated stuff
(here e.g. *mdev) is freed. So it can probably easily happen, that
something tries to use the dma device and this will likely result in an
oops.

I don't know enough about the dma framework to address this properly,
maybe someone else knows what to do?

There are no interdependencies between the patches. As there are still
quite a few drivers to convert, I'm happy about every patch that makes
it in. So even if there is a merge conflict with one patch until you
apply or I picked a wrong subject prefix, please apply the remainder of
this series anyhow.

Best regards
Uwe


Uwe Kleine-König (59):
  dma: altera-msgdma: Convert to platform remove callback returning void
  dma: apple-admac: Convert to platform remove callback returning void
  dma: at_hdmac: Convert to platform remove callback returning void
  dma: at_xdmac: Convert to platform remove callback returning void
  dma: bcm-sba-raid: Convert to platform remove callback returning void
  dma: bcm2835-dma: Convert to platform remove callback returning void
  dma: bestcomm: bestcomm: Convert to platform remove callback returning
    void
  dma: dma-axi-dmac: Convert to platform remove callback returning void
  dma: dma-jz4780: Convert to platform remove callback returning void
  dma: dw-axi-dmac: dw-axi-dmac-platform: Convert to platform remove
    callback returning void
  dma: dw: platform: Convert to platform remove callback returning void
  dma: fsl-edma-main: Convert to platform remove callback returning void
  dma: fsl-qdma: Convert to platform remove callback returning void
  dma: fsl_raid: Convert to platform remove callback returning void
  dma: fsldma: Convert to platform remove callback returning void
  dma: idma64: Convert to platform remove callback returning void
  dma: img-mdc-dma: Convert to platform remove callback returning void
  dma: imx-dma: Convert to platform remove callback returning void
  dma: imx-sdma: Convert to platform remove callback returning void
  dma: k3dma: Convert to platform remove callback returning void
  dma: mcf-edma-main: Convert to platform remove callback returning void
  dma: mediatek: mtk-cqdma: Convert to platform remove callback
    returning void
  dma: mediatek: mtk-hsdma: Convert to platform remove callback
    returning void
  dma: mediatek: mtk-uart-apdma: Convert to platform remove callback
    returning void
  dma: mmp_pdma: Convert to platform remove callback returning void
  dma: mmp_tdma: Convert to platform remove callback returning void
  dma: moxart-dma: Convert to platform remove callback returning void
  dma: mpc512x_dma: Convert to platform remove callback returning void
  dma: mv_xor_v2: Convert to platform remove callback returning void
  dma: nbpfaxi: Convert to platform remove callback returning void
  dma: owl-dma: Convert to platform remove callback returning void
  dma: ppc4xx: adma: Convert to platform remove callback returning void
  dma: pxa_dma: Convert to platform remove callback returning void
  dma: qcom: bam_dma: Convert to platform remove callback returning void
  dma: qcom: hidma: Convert to platform remove callback returning void
  dma: qcom: qcom_adm: Convert to platform remove callback returning
    void
  dma: sa11x0-dma: Convert to platform remove callback returning void
  dma: sf-pdma: sf-pdma: Convert to platform remove callback returning
    void
  dma: sh: rcar-dmac: Convert to platform remove callback returning void
  dma: sh: rz-dmac: Convert to platform remove callback returning void
  dma: sh: shdmac: Convert to platform remove callback returning void
  dma: sh: usb-dmac: Convert to platform remove callback returning void
  dma: sprd-dma: Convert to platform remove callback returning void
  dma: st_fdma: Convert to platform remove callback returning void
  dma: sun4i-dma: Convert to platform remove callback returning void
  dma: sun6i-dma: Convert to platform remove callback returning void
  dma: tegra186-gpc-dma: Convert to platform remove callback returning
    void
  dma: tegra20-apb-dma: Convert to platform remove callback returning
    void
  dma: tegra210-adma: Convert to platform remove callback returning void
  dma: ti: cppi41: Convert to platform remove callback returning void
  dma: ti: edma: Convert to platform remove callback returning void
  dma: ti: omap-dma: Convert to platform remove callback returning void
  dma: timb_dma: Convert to platform remove callback returning void
  dma: txx9dmac: Convert to platform remove callback returning void
  dma: xgene-dma: Convert to platform remove callback returning void
  dma: xilinx: xdma: Convert to platform remove callback returning void
  dma: xilinx: xilinx_dma: Convert to platform remove callback returning
    void
  dma: xilinx: xilinx_dpdma: Convert to platform remove callback
    returning void
  dma: xilinx: zynqmp_dma: Convert to platform remove callback returning
    void

 drivers/dma/altera-msgdma.c                    |  6 ++----
 drivers/dma/apple-admac.c                      |  6 ++----
 drivers/dma/at_hdmac.c                         |  6 ++----
 drivers/dma/at_xdmac.c                         |  6 ++----
 drivers/dma/bcm-sba-raid.c                     |  6 ++----
 drivers/dma/bcm2835-dma.c                      |  6 ++----
 drivers/dma/bestcomm/bestcomm.c                |  6 ++----
 drivers/dma/dma-axi-dmac.c                     |  6 ++----
 drivers/dma/dma-jz4780.c                       |  6 ++----
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  6 ++----
 drivers/dma/dw/platform.c                      |  6 ++----
 drivers/dma/fsl-edma-main.c                    |  6 ++----
 drivers/dma/fsl-qdma.c                         |  5 ++---
 drivers/dma/fsl_raid.c                         |  6 ++----
 drivers/dma/fsldma.c                           |  6 ++----
 drivers/dma/idma64.c                           |  6 ++----
 drivers/dma/img-mdc-dma.c                      |  6 ++----
 drivers/dma/imx-dma.c                          |  6 ++----
 drivers/dma/imx-sdma.c                         |  5 ++---
 drivers/dma/k3dma.c                            |  5 ++---
 drivers/dma/mcf-edma-main.c                    |  6 ++----
 drivers/dma/mediatek/mtk-cqdma.c               |  6 ++----
 drivers/dma/mediatek/mtk-hsdma.c               |  6 ++----
 drivers/dma/mediatek/mtk-uart-apdma.c          |  6 ++----
 drivers/dma/mmp_pdma.c                         |  5 ++---
 drivers/dma/mmp_tdma.c                         |  6 ++----
 drivers/dma/moxart-dma.c                       |  6 ++----
 drivers/dma/mpc512x_dma.c                      |  6 ++----
 drivers/dma/mv_xor_v2.c                        |  6 ++----
 drivers/dma/nbpfaxi.c                          |  6 ++----
 drivers/dma/owl-dma.c                          |  6 ++----
 drivers/dma/ppc4xx/adma.c                      |  5 ++---
 drivers/dma/pxa_dma.c                          |  5 ++---
 drivers/dma/qcom/bam_dma.c                     |  6 ++----
 drivers/dma/qcom/hidma.c                       |  6 ++----
 drivers/dma/qcom/qcom_adm.c                    |  6 ++----
 drivers/dma/sa11x0-dma.c                       |  6 ++----
 drivers/dma/sf-pdma/sf-pdma.c                  |  6 ++----
 drivers/dma/sh/rcar-dmac.c                     |  6 ++----
 drivers/dma/sh/rz-dmac.c                       |  6 ++----
 drivers/dma/sh/shdmac.c                        |  6 ++----
 drivers/dma/sh/usb-dmac.c                      |  6 ++----
 drivers/dma/sprd-dma.c                         |  5 ++---
 drivers/dma/st_fdma.c                          |  6 ++----
 drivers/dma/sun4i-dma.c                        |  6 ++----
 drivers/dma/sun6i-dma.c                        |  6 ++----
 drivers/dma/tegra186-gpc-dma.c                 |  6 ++----
 drivers/dma/tegra20-apb-dma.c                  |  6 ++----
 drivers/dma/tegra210-adma.c                    |  6 ++----
 drivers/dma/ti/cppi41.c                        |  5 ++---
 drivers/dma/ti/edma.c                          |  6 ++----
 drivers/dma/ti/omap-dma.c                      |  6 ++----
 drivers/dma/timb_dma.c                         |  5 ++---
 drivers/dma/txx9dmac.c                         | 10 ++++------
 drivers/dma/xgene-dma.c                        |  6 ++----
 drivers/dma/xilinx/xdma.c                      |  6 ++----
 drivers/dma/xilinx/xilinx_dma.c                |  6 ++----
 drivers/dma/xilinx/xilinx_dpdma.c              |  6 ++----
 drivers/dma/xilinx/zynqmp_dma.c                |  6 ++----
 59 files changed, 120 insertions(+), 229 deletions(-)


base-commit: 29e400e3ea486bf942b214769fc9778098114113
-- 
2.40.1

