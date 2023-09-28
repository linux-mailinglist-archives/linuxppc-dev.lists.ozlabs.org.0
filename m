Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC557B182D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 12:22:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M3CVEWod;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rx8fj5Wvfz3cLX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 20:22:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M3CVEWod;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rx5Cm62c9z2ytJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 17:47:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 39B5B61B45;
	Thu, 28 Sep 2023 07:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00BADC433C7;
	Thu, 28 Sep 2023 07:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695887215;
	bh=Af7aDzVx41jirnSASQ/UkmQmVSgstLQVhYHpLf/6830=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=M3CVEWodpA6shzaMBLBOu0zeQ+lMo1Bgzbr/6kL40UAJkJPSAeDfixt9HbxwfelSL
	 VN4FQDlcS4YUoDRxwhJukMx/5PZ+MgNb25LXGJcyCNVBg9TVySD5P9XI6cvycLgK/b
	 t1qj9t7+qjOcMf1zx9YWLc0nHfCEhxuMkDo8I9hstXQ6pMjHePsrJ31HlBMZ+Jhg9/
	 CAlRrDo/Tur6t0L4tkdelzmjpsK4sDJxxLEXIjPqY/ne/z+Uqou0IOJT3oHAeZm686
	 RdYG5LjWImNoTQa51vaSZTWmDaUBeZczfVywHCf95iuE5R1Apti8bSE9IRjR1OHUjq
	 yyUa+0wrAOZmA==
From: Vinod Koul <vkoul@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230919133207.1400430-1-u.kleine-koenig@pengutronix.de>
References: <20230919133207.1400430-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/59] dma: Convert to platform remove callback
 returning void
Message-Id: <169588719663.133598.11807608811384105232.b4-ty@kernel.org>
Date: Thu, 28 Sep 2023 13:16:36 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3
X-Mailman-Approved-At: Thu, 28 Sep 2023 20:21:23 +1000
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


On Tue, 19 Sep 2023 15:31:08 +0200, Uwe Kleine-König wrote:
> this series convert nearly all platform drivers below drivers/dma to use
> .remove_new(). The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side.
> 
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
> 
> [...]

Applied, thanks!

[01/59] dma: altera-msgdma: Convert to platform remove callback returning void
        commit: 8876762f285fff08b1aefeba52c7157a2c9beec1
[02/59] dma: apple-admac: Convert to platform remove callback returning void
        commit: e7d5aa30c8a19e6d9c4ec19d3b9e501df22e1d1a
[03/59] dma: at_hdmac: Convert to platform remove callback returning void
        commit: ae3f38e495b42494414cbace3b3bd3cb6dc10506
[04/59] dma: at_xdmac: Convert to platform remove callback returning void
        commit: b13af3c41bad5f4e45a73d6978f31ad48ffc2dee
[05/59] dma: bcm-sba-raid: Convert to platform remove callback returning void
        commit: 017df796a3635edee5169a0700634da6dac92f6a
[06/59] dma: bcm2835-dma: Convert to platform remove callback returning void
        commit: 8f63a2da288454e9228f6b438b86627f6ceae36b
[07/59] dma: bestcomm: bestcomm: Convert to platform remove callback returning void
        commit: 7689bca111997e0d7a12cf6457fc26a52b8c800f
[08/59] dma: dma-axi-dmac: Convert to platform remove callback returning void
        commit: b5f095a70117629c3abb49bcb07dfa954d275e99
[09/59] dma: dma-jz4780: Convert to platform remove callback returning void
        commit: a8c85540bee12d492904a430c0c1105a4b7b101c
[10/59] dma: dw-axi-dmac: dw-axi-dmac-platform: Convert to platform remove callback returning void
        commit: c689a2fd2a3f2a0a9e775c59c0f02ea64677c254
[11/59] dma: dw: platform: Convert to platform remove callback returning void
        commit: 67572bfe2e35c232c3497b3fc8babbfe62600ce0
[12/59] dma: fsl-edma-main: Convert to platform remove callback returning void
        commit: fa13c3ef3f45bca5a1474755dac57bfaf28ef61b
[13/59] dma: fsl-qdma: Convert to platform remove callback returning void
        commit: fe3d44cdaea41173e50833440db84982e2a8d2a7
[14/59] dma: fsl_raid: Convert to platform remove callback returning void
        commit: 37b24b50c5f8ad9037fbe81f1ee43f5e16fb5334
[15/59] dma: fsldma: Convert to platform remove callback returning void
        commit: d69f80110da5d0e665d7f2872bf2185fe7f14409
[16/59] dma: idma64: Convert to platform remove callback returning void
        commit: e8da277fbb8701308cfd2337afb13d34cc233349
[17/59] dma: img-mdc-dma: Convert to platform remove callback returning void
        commit: 6e1b4a907e860071d957baee688a30a0bff102ef
[18/59] dma: imx-dma: Convert to platform remove callback returning void
        commit: 14c49dd0c34e457d71494b04290c27d7a14584d7
[19/59] dma: imx-sdma: Convert to platform remove callback returning void
        commit: 06e4f653fafdeec7b13958b771226efa1cdf76d2
[20/59] dma: k3dma: Convert to platform remove callback returning void
        commit: 3faf902cb808163e9e65bf568c235a272215aed2
[21/59] dma: mcf-edma-main: Convert to platform remove callback returning void
        commit: 48236cb8314238917788f73353290dd1afb9a7c6
[22/59] dma: mediatek: mtk-cqdma: Convert to platform remove callback returning void
        commit: bdeb61f5180efc920cf55b966a2a30bc2336d6d4
[23/59] dma: mediatek: mtk-hsdma: Convert to platform remove callback returning void
        commit: 97283173effa6e53ea698726ea5d07f7ca06e5cf
[24/59] dma: mediatek: mtk-uart-apdma: Convert to platform remove callback returning void
        commit: 4db30945a001ac97b5044db2aa2990b8e7df9452
[25/59] dma: mmp_pdma: Convert to platform remove callback returning void
        commit: c0f0d93fc1da36de564da9b3f0462b5bdc4b1948
[26/59] dma: mmp_tdma: Convert to platform remove callback returning void
        commit: f543b251500a0de589bc4c97da45b88410bf7c56
[27/59] dma: moxart-dma: Convert to platform remove callback returning void
        commit: 1a65831fa037457114ca75ea262d87fbde3158f0
[28/59] dma: mpc512x_dma: Convert to platform remove callback returning void
        commit: 80d0159bbe80d8de6f64c0a8554b4066c66eb378
[29/59] dma: mv_xor_v2: Convert to platform remove callback returning void
        commit: 733dbb8d62f33448c0d7470ba06ce39bdd790ddd
[30/59] dma: nbpfaxi: Convert to platform remove callback returning void
        commit: 44d5338c4a5d7f3f1ef07d502b9db22a29a8756a
[31/59] dma: owl-dma: Convert to platform remove callback returning void
        commit: 1260486a347567c33e0118626bb8778e342e6080
[32/59] dma: ppc4xx: adma: Convert to platform remove callback returning void
        commit: 5f8f212fb416dc3600046955fb008732a512fa5c
[33/59] dma: pxa_dma: Convert to platform remove callback returning void
        commit: 44ea88715d37dc31145b7712b5474808258bab5f
[34/59] dma: qcom: bam_dma: Convert to platform remove callback returning void
        commit: 8d0f1ca5e4037f671cee43a4a582c0f8c6e8e31d
[35/59] dma: qcom: hidma: Convert to platform remove callback returning void
        commit: af9bc3c26b08714eb2309dcbf9a74a6c7af6327f
[36/59] dma: qcom: qcom_adm: Convert to platform remove callback returning void
        commit: 1a6d1c87542d6bb178db5bc2befc9abf99447684
[37/59] dma: sa11x0-dma: Convert to platform remove callback returning void
        commit: d6798037fa1c01e6b9486cc1fbe1b5a272dde477
[38/59] dma: sf-pdma: sf-pdma: Convert to platform remove callback returning void
        commit: 3d97deeb3b3077b3a6f9636f3ea312fef7f54059
[39/59] dma: sh: rcar-dmac: Convert to platform remove callback returning void
        commit: 8ca342994ab8abda069c4b918aab5fa6b8c1614f
[40/59] dma: sh: rz-dmac: Convert to platform remove callback returning void
        commit: bd4205f52310a158c78171d3a5f68c7301a532fd
[41/59] dma: sh: shdmac: Convert to platform remove callback returning void
        commit: 384ba9a683d3ba9f2f598b4c5fbf6f79a9213e94
[42/59] dma: sh: usb-dmac: Convert to platform remove callback returning void
        commit: 9f2812a7fe47c422a367ef95e418dd63fced7238
[43/59] dma: sprd-dma: Convert to platform remove callback returning void
        commit: 8d82eb85a74246afb9b4bc69abf6e79014b06d4f
[44/59] dma: st_fdma: Convert to platform remove callback returning void
        commit: 9c52ffa09f580c49df1cc0b1998d7ea8fdf2c0b4
[45/59] dma: sun4i-dma: Convert to platform remove callback returning void
        commit: 2db76471c8f45837efafdd7d57633aa9f194d787
[46/59] dma: sun6i-dma: Convert to platform remove callback returning void
        commit: 7d6ef7550a4577ae943194421dea73f3df084265
[47/59] dma: tegra186-gpc-dma: Convert to platform remove callback returning void
        commit: d669b198efac1ea97fa39d6f8be59aefe5f39171
[48/59] dma: tegra20-apb-dma: Convert to platform remove callback returning void
        commit: afd1ac2e1b9b39040bb5eedd94b2b152020994e0
[49/59] dma: tegra210-adma: Convert to platform remove callback returning void
        commit: 1a3fa3e369bf54bef0021a8c840567622f52354f
[50/59] dma: ti: cppi41: Convert to platform remove callback returning void
        commit: 36a7e98c36a598c2865daf748a7d9d889a34aaf3
[51/59] dma: ti: edma: Convert to platform remove callback returning void
        commit: 68bcaf5c4e03ada2696b4fbd03ee775781945034
[52/59] dma: ti: omap-dma: Convert to platform remove callback returning void
        commit: 5ea68dc1cee00e5ecf174f2a3ef13d63520971cb
[53/59] dma: timb_dma: Convert to platform remove callback returning void
        commit: 4f339d6efa6a74a16f77fd9a06adf01d9df84734
[54/59] dma: txx9dmac: Convert to platform remove callback returning void
        commit: a3b4af719e571bd899b7952626c2b4d8ec7c0c77
[55/59] dma: xgene-dma: Convert to platform remove callback returning void
        commit: 2c9d879fae9ab1be3d4926ebea5e85305998cf93
[56/59] dma: xilinx: xdma: Convert to platform remove callback returning void
        commit: 78369eb5dc8881d78f163434ee2788a800b89219
[57/59] dma: xilinx: xilinx_dma: Convert to platform remove callback returning void
        commit: cc99582d46b428ba4c2cb7ecd05df4569b02d1f4
[58/59] dma: xilinx: xilinx_dpdma: Convert to platform remove callback returning void
        commit: c962eca73c5cce72936a8b3bd23a24b29852ea97
[59/59] dma: xilinx: zynqmp_dma: Convert to platform remove callback returning void
        commit: b1c50ac25425385b576dd58b7b38c1c5963dde85

Best regards,
-- 
~Vinod


