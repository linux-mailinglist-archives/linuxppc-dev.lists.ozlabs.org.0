Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B211D6BC569
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 05:53:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcZfP4kr5z3cf4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 15:53:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcDPh2clcz3flD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 02:11:36 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjl-00075T-9q; Wed, 15 Mar 2023 16:08:21 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjO-004KTZ-15; Wed, 15 Mar 2023 16:07:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjM-0057br-Fi; Wed, 15 Mar 2023 16:07:56 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mohan Kumar <mkumard@nvidia.com>,
	Geoff Levand <geoff@infradead.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	syed saba kareem <syed.sabakareem@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Meng Tang <tangmeng@uniontech.com>,
	=?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Peter Rosin <peda@axentia.se>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Allison Randal <allison@lohutok.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Lucas Tanure <tanureal@opensource.cirrus.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
	Zhang Qilong <zhangqilong3@huawei.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Liang He <windhl@126.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Minghao Chi <chi.minghao@zte.com.cn>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	=?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Moises Cardona <moisesmcardona@gmail.com>,
	Zhen Ni <nizhen@uniontech.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andrey Turkin <andrey.turkin@gmail.com>,
	Muralidhar Reddy <muralidhar.reddy@intel.com>,
	Zhu Ning <zhuning0077@gmail.com>,
	Gongjun Song <gongjun.song@intel.com>,
	Shuming Fan <shumingf@realtek.com>,
	Yong Zhi <yong.zhi@intel.com>,
	Lior Amsalem <alior@marvell.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Hezi Shahmoon <hezi@marvell.com>,
	Neta Zur Hershkovits <neta@marvell.com>,
	Marcin Wojtas <mw@semihalf.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Dan Carpenter <error27@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linh Phung <linh.phung.jy@renesas.com>,
	Shang XiaoJing <shangxiaojing@huawei.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Li Chen <lchen@ambarella.com>,
	Ban Tao <fengzheng923@gmail.com>,
	Sameer Pujar <spujar@nvidia.com>,
	YueHaibing <yuehaibing@huawei.com>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Li kunyu <kunyu@nfschina.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michal Simek <michal.simek@xilinx.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH 000/173] ALSA/ASoC: Convert to platform remove callback returning void
Date: Wed, 15 Mar 2023 16:04:52 +0100
Message-Id: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=25545; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=PMsdLl7+2srBgOkC/kKuNw6JdBSADxMVdeLzTSx01Yk=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd0lGWSf7mBiLMp2KinWd50LDXzl92rLl/GxV 0HA0b56vvCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdJQAKCRDB/BR4rcrs CaOTB/9SS0cNqV2Mcl90tkPZq4QGuch48aG/eLkNoTwCLq2HvWxRY6KYZjU/rV7iqunxoFM8z/K GgQi3jXV1zH9yq1qlQk3Y7pXyJm2NLOWDzVJGDCH/MV3xW383oxnWsWEwvPfbvGd+uNeccbeCNv rkPCga6gSPRM8ND5MbNvgWXtICHrrlHWEUxDGAXnSITKZfgroin+/YMW84N0nCDlEhwNjyDgHiX FaF3XBOQbBwjfwg+vcnUlQne7FqMmxX2QgvmDiEPRxsneo7/ToT/nP8VBN7DbaTg8B6yqKbbJW1 Wfho+4oLvjlarb13pJxbYj2ovfqjVXvTSnH279o45HmR+yhs
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Mailman-Approved-At: Thu, 16 Mar 2023 15:53:23 +1100
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
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev, linux-xtensa@linux-xtensa.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Nicholas Piggin <npiggin@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, patches@opensource.cirrus.com, asahi@lists.linux.dev, kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

this series adapts the platform drivers below sound/ to use the .remove_new()
callback. Compared to the traditional .remove() callback .remove_new() returns
no value. This is a good thing because the driver core doesn't (and cannot)
cope for errors during remove. The only effect of a non-zero return value in
.remove() is that the driver core emits a warning. The device is removed anyhow
and an early return from .remove() usually yields a resource leak.

By changing the remove callback to return void driver authors cannot
reasonably assume any more that there is some kind of cleanup later.

The first two patches simplify a driver each to return zero unconditionally,
and then all drivers are trivially converted to .remove_new().

There are nearly no interdependencies in this patch set---only 1 <- 11 and
2 <- 16. So even if some individual problems are found (I don't expect that),
the other patches can (and from my POV should) still be applied.

Best regards
Uwe

Uwe Kleine-König (173):
  ALSA: sh: aica: Drop if blocks with always false condition
  ASoC: amd: acp: rembrandt: Drop if blocks with always false condition
  ALSA: pxa2xx: Convert to platform remove callback returning void
  ALSA: atmel: ac97: Convert to platform remove callback returning void
  ALSA: mts64: Convert to platform remove callback returning void
  ALSA: portman2x4: Convert to platform remove callback returning void
  ALSA: mips/hal2: Convert to platform remove callback returning void
  ALSA: mips/sgio2audio: Convert to platform remove callback returning
    void
  ALSA: hda/tegra: Convert to platform remove callback returning void
  ALSA: ppc/powermac: Convert to platform remove callback returning void
  ALSA: sh: aica: Convert to platform remove callback returning void
  ALSA: sh_dac_audio: Convert to platform remove callback returning void
  ASoC: adi: axi-i2s: Convert to platform remove callback returning void
  ASoC: adi: axi-spdif: Convert to platform remove callback returning
    void
  ASoC: amd: acp-pcm-dma: Convert to platform remove callback returning
    void
  ASoC: amd: acp: rembrandt: Convert to platform remove callback
    returning void
  ASoC: amd: acp: renoir: Convert to platform remove callback returning
    void
  ASoC: amd: ps: Convert to platform remove callback returning void
  ASoC: amd: raven: acp3x-pcm-dma: Convert to platform remove callback
    returning void
  ASoC: amd: raven: acp3x-pdm-dma: Convert to platform remove callback
    returning void
  ASoC: amd: vangogh: acp5x-pcm-dma: Convert to platform remove callback
    returning void
  ASoC: amd: yc: acp6x-pdm-dma: Convert to platform remove callback
    returning void
  ASoC: apple: mca: Convert to platform remove callback returning void
  ASoC: atmel: atmel-i2s: Convert to platform remove callback returning
    void
  ASoC: atmel: atmel_wm8904: Convert to platform remove callback
    returning void
  ASoC: atmel: mchp-i2s-mcc: Convert to platform remove callback
    returning void
  ASoC: atmel: mchp-pdmc: Convert to platform remove callback returning
    void
  ASoC: atmel: mchp-spdifrx: Convert to platform remove callback
    returning void
  ASoC: atmel: mchp-spdiftx: Convert to platform remove callback
    returning void
  ASoC: atmel: mikroe-proto: Convert to platform remove callback
    returning void
  ASoC: atmel: sam9g20_wm8731: Convert to platform remove callback
    returning void
  ASoC: atmel: sam9x5_wm8731: Convert to platform remove callback
    returning void
  ASoC: atmel: tse850-pcm5142: Convert to platform remove callback
    returning void
  ASoC: au1x: ac97c: Convert to platform remove callback returning void
  ASoC: au1x: i2sc: Convert to platform remove callback returning void
  ASoC: au1x: psc-ac97: Convert to platform remove callback returning
    void
  ASoC: au1x: psc-i2s: Convert to platform remove callback returning
    void
  ASoC: bcm: bcm63xx-i2s-whistler: Convert to platform remove callback
    returning void
  ASoC: bcm: cygnus-ssp: Convert to platform remove callback returning
    void
  ASoC: cirrus: edb93xx: Convert to platform remove callback returning
    void
  ASoC: cirrus: ep93xx-i2s: Convert to platform remove callback
    returning void
  ASoC: codecs: cs47l15: Convert to platform remove callback returning
    void
  ASoC: codecs: cs47l24: Convert to platform remove callback returning
    void
  ASoC: codecs: cs47l35: Convert to platform remove callback returning
    void
  ASoC: codecs: cs47l85: Convert to platform remove callback returning
    void
  ASoC: codecs: cs47l90: Convert to platform remove callback returning
    void
  ASoC: codecs: cs47l92: Convert to platform remove callback returning
    void
  ASoC: codecs: inno_rk3036: Convert to platform remove callback
    returning void
  ASoC: codecs: lpass-rx-macro: Convert to platform remove callback
    returning void
  ASoC: codecs: lpass-tx-macro: Convert to platform remove callback
    returning void
  ASoC: codecs: lpass-va-macro: Convert to platform remove callback
    returning void
  ASoC: codecs: lpass-wsa-macro: Convert to platform remove callback
    returning void
  ASoC: codecs: msm8916-wcd-analog: Convert to platform remove callback
    returning void
  ASoC: codecs: msm8916-wcd-digital: Convert to platform remove callback
    returning void
  ASoC: codecs: rk817_codec: Convert to platform remove callback
    returning void
  ASoC: codecs: wcd938x: Convert to platform remove callback returning
    void
  ASoC: codecs: wm5102: Convert to platform remove callback returning
    void
  ASoC: codecs: wm5110: Convert to platform remove callback returning
    void
  ASoC: codecs: wm8994: Convert to platform remove callback returning
    void
  ASoC: codecs: wm8997: Convert to platform remove callback returning
    void
  ASoC: codecs: wm8998: Convert to platform remove callback returning
    void
  ASoC: dwc: dwc-i2s: Convert to platform remove callback returning void
  ASoC: fsl: eukrea-tlv320: Convert to platform remove callback
    returning void
  ASoC: fsl: fsl_asrc: Convert to platform remove callback returning
    void
  ASoC: fsl: fsl_aud2htx: Convert to platform remove callback returning
    void
  ASoC: fsl: fsl_audmix: Convert to platform remove callback returning
    void
  ASoC: fsl: fsl_dma: Convert to platform remove callback returning void
  ASoC: fsl: fsl_easrc: Convert to platform remove callback returning
    void
  ASoC: fsl: fsl_esai: Convert to platform remove callback returning
    void
  ASoC: fsl: fsl_mqs: Convert to platform remove callback returning void
  ASoC: fsl: fsl_rpmsg: Convert to platform remove callback returning
    void
  ASoC: fsl: fsl_sai: Convert to platform remove callback returning void
  ASoC: fsl: fsl_spdif: Convert to platform remove callback returning
    void
  ASoC: fsl: fsl_ssi: Convert to platform remove callback returning void
  ASoC: fsl: fsl_xcvr: Convert to platform remove callback returning
    void
  ASoC: fsl: imx-audmux: Convert to platform remove callback returning
    void
  ASoC: fsl: imx-pcm-rpmsg: Convert to platform remove callback
    returning void
  ASoC: fsl: imx-sgtl5000: Convert to platform remove callback returning
    void
  ASoC: fsl: mpc5200_psc_ac97: Convert to platform remove callback
    returning void
  ASoC: fsl: mpc5200_psc_i2s: Convert to platform remove callback
    returning void
  ASoC: fsl: mpc8610_hpcd: Convert to platform remove callback returning
    void
  ASoC: fsl: p1022_ds: Convert to platform remove callback returning
    void
  ASoC: fsl: p1022_rdk: Convert to platform remove callback returning
    void
  ASoC: fsl: pcm030-audio-fabric: Convert to platform remove callback
    returning void
  ASoC: generic: test-component: Convert to platform remove callback
    returning void
  ASoC: img: img-i2s-in: Convert to platform remove callback returning
    void
  ASoC: img: img-i2s-out: Convert to platform remove callback returning
    void
  ASoC: img: img-parallel-out: Convert to platform remove callback
    returning void
  ASoC: img: img-spdif-in: Convert to platform remove callback returning
    void
  ASoC: img: img-spdif-out: Convert to platform remove callback
    returning void
  ASoC: img: pistachio-internal-dac: Convert to platform remove callback
    returning void
  ASoC: Intel: sst-mfld-platform-pcm: Convert to platform remove
    callback returning void
  ASoC: Intel: sst: Convert to platform remove callback returning void
  ASoC: Intel: bytcht_es8316: Convert to platform remove callback
    returning void
  ASoC: Intel: bytcr_rt5640: Convert to platform remove callback
    returning void
  ASoC: Intel: boards: bytcr_rt5651: Convert to platform remove callback
    returning void
  ASoC: Intel: bytcr_wm5102: Convert to platform remove callback
    returning void
  ASoC: Intel: cht_bsw_max98090_ti: Convert to platform remove callback
    returning void
  ASoC: Intel: sof_es8336: Convert to platform remove callback returning
    void
  ASoC: Intel: sof_pcm512x: Convert to platform remove callback
    returning void
  ASoC: Intel: sof_sdw: Convert to platform remove callback returning
    void
  ASoC: Intel: sof_wm8804: Convert to platform remove callback returning
    void
  ASoC: Intel: catpt: Convert to platform remove callback returning void
  ASoC: Intel: skl-ssp-clk: Convert to platform remove callback
    returning void
  ASoC: kirkwood: kirkwood-i2s: Convert to platform remove callback
    returning void
  ASoC: mediatek: mtk-btcvsd: Convert to platform remove callback
    returning void
  ASoC: mediatek: mt2701-afe-pcm: Convert to platform remove callback
    returning void
  ASoC: mediatek: mt6797-afe-pcm: Convert to platform remove callback
    returning void
  ASoC: mediatek: mt8173-afe-pcm: Convert to platform remove callback
    returning void
  ASoC: mediatek: mt8183-afe-pcm: Convert to platform remove callback
    returning void
  ASoC: mediatek: mt8188-afe-pcm: Convert to platform remove callback
    returning void
  ASoC: mediatek: mt8192-afe-pcm: Convert to platform remove callback
    returning void
  ASoC: mediatek: mt8195-afe-pcm: Convert to platform remove callback
    returning void
  ASoC: meson: aiu: Convert to platform remove callback returning void
  ASoC: mxs: mxs-sgtl5000: Convert to platform remove callback returning
    void
  ASoC: pxa: mmp-sspa: Convert to platform remove callback returning
    void
  ASoC: pxa: pxa2xx-ac97: Convert to platform remove callback returning
    void
  ASoC: qcom: qdsp6: Convert to platform remove callback returning void
  ASoC: rockchip: rockchip_i2s: Convert to platform remove callback
    returning void
  ASoC: rockchip: rockchip_i2s_tdm: Convert to platform remove callback
    returning void
  ASoC: rockchip: rockchip_pdm: Convert to platform remove callback
    returning void
  ASoC: rockchip: rockchip_rt5645: Convert to platform remove callback
    returning void
  ASoC: rockchip: rockchip_spdif: Convert to platform remove callback
    returning void
  ASoC: samsung: arndale: Convert to platform remove callback returning
    void
  ASoC: samsung: i2s: Convert to platform remove callback returning void
  ASoC: samsung: odroid: Convert to platform remove callback returning
    void
  ASoC: samsung: pcm: Convert to platform remove callback returning void
  ASoC: samsung: snow: Convert to platform remove callback returning
    void
  ASoC: samsung: spdif: Convert to platform remove callback returning
    void
  ASoC: sh: fsi: Convert to platform remove callback returning void
  ASoC: sh: hac: Convert to platform remove callback returning void
  ASoC: sh: rcar: Convert to platform remove callback returning void
  ASoC: sh: rz-ssi: Convert to platform remove callback returning void
  ASoC: sh: siu_dai: Convert to platform remove callback returning void
  ASoC: sprd: sprd-mcdt: Convert to platform remove callback returning
    void
  ASoC: stm: stm32_adfsdm: Convert to platform remove callback returning
    void
  ASoC: stm: stm32_i2s: Convert to platform remove callback returning
    void
  ASoC: stm: stm32_sai_sub: Convert to platform remove callback
    returning void
  ASoC: stm: stm32_spdifrx: Convert to platform remove callback
    returning void
  ASoC: sunxi: sun4i-codec: Convert to platform remove callback
    returning void
  ASoC: sunxi: sun4i-i2s: Convert to platform remove callback returning
    void
  ASoC: sunxi: sun4i-spdif: Convert to platform remove callback
    returning void
  ASoC: sunxi: sun50i-dmic: Convert to platform remove callback
    returning void
  ASoC: sunxi: sun8i-codec: Convert to platform remove callback
    returning void
  ASoC: tegra: tegra186_asrc: Convert to platform remove callback
    returning void
  ASoC: tegra: tegra186_dspk: Convert to platform remove callback
    returning void
  ASoC: tegra: tegra20_ac97: Convert to platform remove callback
    returning void
  ASoC: tegra: tegra20_i2s: Convert to platform remove callback
    returning void
  ASoC: tegra: tegra210_admaif: Convert to platform remove callback
    returning void
  ASoC: tegra: tegra210_adx: Convert to platform remove callback
    returning void
  ASoC: tegra: tegra210_ahub: Convert to platform remove callback
    returning void
  ASoC: tegra: tegra210_amx: Convert to platform remove callback
    returning void
  ASoC: tegra: tegra210_dmic: Convert to platform remove callback
    returning void
  ASoC: tegra: tegra210_i2s: Convert to platform remove callback
    returning void
  ASoC: tegra: tegra210_mixer: Convert to platform remove callback
    returning void
  ASoC: tegra: tegra210_mvc: Convert to platform remove callback
    returning void
  ASoC: tegra: tegra210_ope: Convert to platform remove callback
    returning void
  ASoC: tegra: tegra210_sfc: Convert to platform remove callback
    returning void
  ASoC: tegra: tegra30_ahub: Convert to platform remove callback
    returning void
  ASoC: tegra: tegra30_i2s: Convert to platform remove callback
    returning void
  ASoC: ti: ams-delta: Convert to platform remove callback returning
    void
  ASoC: ti: davinci-i2s: Convert to platform remove callback returning
    void
  ASoC: ti: davinci-mcasp: Convert to platform remove callback returning
    void
  ASoC: ti: omap-hdmi: Convert to platform remove callback returning
    void
  ASoC: ti: omap-mcbsp: Convert to platform remove callback returning
    void
  ASoC: uniphier: evea: Convert to platform remove callback returning
    void
  ASoC: ux500: mop500: Convert to platform remove callback returning
    void
  ASoC: ux500: ux500_msp_dai: Convert to platform remove callback
    returning void
  ASoC: xilinx: xlnx_formatter_pcm: Convert to platform remove callback
    returning void
  ASoC: xilinx: xlnx_spdif: Convert to platform remove callback
    returning void
  ASoC: xtensa: xtfpga-i2s: Convert to platform remove callback
    returning void
  ALSA: sparc/cs4231: Convert to platform remove callback returning void
  ALSA: sparc/dbri: Convert to platform remove callback returning void

 sound/arm/pxa2xx-ac97.c                      |  6 ++----
 sound/atmel/ac97c.c                          |  6 ++----
 sound/drivers/mts64.c                        |  6 ++----
 sound/drivers/portman2x4.c                   |  6 ++----
 sound/mips/hal2.c                            |  5 ++---
 sound/mips/sgio2audio.c                      |  5 ++---
 sound/pci/hda/hda_tegra.c                    |  6 ++----
 sound/ppc/powermac.c                         |  5 ++---
 sound/sh/aica.c                              |  7 ++-----
 sound/sh/sh_dac_audio.c                      |  5 ++---
 sound/soc/adi/axi-i2s.c                      |  6 ++----
 sound/soc/adi/axi-spdif.c                    |  6 ++----
 sound/soc/amd/acp-pcm-dma.c                  |  6 ++----
 sound/soc/amd/acp/acp-rembrandt.c            | 13 +++----------
 sound/soc/amd/acp/acp-renoir.c               |  5 ++---
 sound/soc/amd/ps/ps-pdm-dma.c                |  5 ++---
 sound/soc/amd/raven/acp3x-pcm-dma.c          |  5 ++---
 sound/soc/amd/renoir/acp3x-pdm-dma.c         |  5 ++---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c        |  5 ++---
 sound/soc/amd/yc/acp6x-pdm-dma.c             |  5 ++---
 sound/soc/apple/mca.c                        |  5 ++---
 sound/soc/atmel/atmel-i2s.c                  |  6 ++----
 sound/soc/atmel/atmel_wm8904.c               |  6 ++----
 sound/soc/atmel/mchp-i2s-mcc.c               |  6 ++----
 sound/soc/atmel/mchp-pdmc.c                  |  6 ++----
 sound/soc/atmel/mchp-spdifrx.c               |  6 ++----
 sound/soc/atmel/mchp-spdiftx.c               |  6 ++----
 sound/soc/atmel/mikroe-proto.c               |  6 ++----
 sound/soc/atmel/sam9g20_wm8731.c             |  6 ++----
 sound/soc/atmel/sam9x5_wm8731.c              |  6 ++----
 sound/soc/atmel/tse850-pcm5142.c             |  6 ++----
 sound/soc/au1x/ac97c.c                       |  6 ++----
 sound/soc/au1x/i2sc.c                        |  6 ++----
 sound/soc/au1x/psc-ac97.c                    |  6 ++----
 sound/soc/au1x/psc-i2s.c                     |  6 ++----
 sound/soc/bcm/bcm63xx-i2s-whistler.c         |  5 ++---
 sound/soc/bcm/cygnus-ssp.c                   |  6 ++----
 sound/soc/cirrus/edb93xx.c                   |  6 ++----
 sound/soc/cirrus/ep93xx-i2s.c                |  5 ++---
 sound/soc/codecs/cs47l15.c                   |  6 ++----
 sound/soc/codecs/cs47l24.c                   |  6 ++----
 sound/soc/codecs/cs47l35.c                   |  6 ++----
 sound/soc/codecs/cs47l85.c                   |  6 ++----
 sound/soc/codecs/cs47l90.c                   |  6 ++----
 sound/soc/codecs/cs47l92.c                   |  6 ++----
 sound/soc/codecs/inno_rk3036.c               |  6 ++----
 sound/soc/codecs/lpass-rx-macro.c            |  6 ++----
 sound/soc/codecs/lpass-tx-macro.c            |  6 ++----
 sound/soc/codecs/lpass-va-macro.c            |  6 ++----
 sound/soc/codecs/lpass-wsa-macro.c           |  6 ++----
 sound/soc/codecs/msm8916-wcd-analog.c        |  6 ++----
 sound/soc/codecs/msm8916-wcd-digital.c       |  6 ++----
 sound/soc/codecs/rk817_codec.c               |  6 ++----
 sound/soc/codecs/wcd938x.c                   |  6 ++----
 sound/soc/codecs/wm5102.c                    |  6 ++----
 sound/soc/codecs/wm5110.c                    |  6 ++----
 sound/soc/codecs/wm8994.c                    |  6 ++----
 sound/soc/codecs/wm8997.c                    |  6 ++----
 sound/soc/codecs/wm8998.c                    |  6 ++----
 sound/soc/dwc/dwc-i2s.c                      |  5 ++---
 sound/soc/fsl/eukrea-tlv320.c                |  6 ++----
 sound/soc/fsl/fsl_asrc.c                     |  6 ++----
 sound/soc/fsl/fsl_aud2htx.c                  |  6 ++----
 sound/soc/fsl/fsl_audmix.c                   |  6 ++----
 sound/soc/fsl/fsl_dma.c                      |  6 ++----
 sound/soc/fsl/fsl_easrc.c                    |  6 ++----
 sound/soc/fsl/fsl_esai.c                     |  6 ++----
 sound/soc/fsl/fsl_mqs.c                      |  5 ++---
 sound/soc/fsl/fsl_rpmsg.c                    |  6 ++----
 sound/soc/fsl/fsl_sai.c                      |  6 ++----
 sound/soc/fsl/fsl_spdif.c                    |  6 ++----
 sound/soc/fsl/fsl_ssi.c                      |  6 ++----
 sound/soc/fsl/fsl_xcvr.c                     |  5 ++---
 sound/soc/fsl/imx-audmux.c                   |  6 ++----
 sound/soc/fsl/imx-pcm-rpmsg.c                |  6 ++----
 sound/soc/fsl/imx-sgtl5000.c                 |  6 ++----
 sound/soc/fsl/mpc5200_psc_ac97.c             |  5 ++---
 sound/soc/fsl/mpc5200_psc_i2s.c              |  5 ++---
 sound/soc/fsl/mpc8610_hpcd.c                 |  6 ++----
 sound/soc/fsl/p1022_ds.c                     |  6 ++----
 sound/soc/fsl/p1022_rdk.c                    |  6 ++----
 sound/soc/fsl/pcm030-audio-fabric.c          |  6 ++----
 sound/soc/generic/test-component.c           |  6 ++----
 sound/soc/img/img-i2s-in.c                   |  6 ++----
 sound/soc/img/img-i2s-out.c                  |  6 ++----
 sound/soc/img/img-parallel-out.c             |  6 ++----
 sound/soc/img/img-spdif-in.c                 |  6 ++----
 sound/soc/img/img-spdif-out.c                |  6 ++----
 sound/soc/img/pistachio-internal-dac.c       |  6 ++----
 sound/soc/intel/atom/sst-mfld-platform-pcm.c |  5 ++---
 sound/soc/intel/atom/sst/sst_acpi.c          |  5 ++---
 sound/soc/intel/boards/bytcht_es8316.c       |  5 ++---
 sound/soc/intel/boards/bytcr_rt5640.c        |  5 ++---
 sound/soc/intel/boards/bytcr_rt5651.c        |  5 ++---
 sound/soc/intel/boards/bytcr_wm5102.c        |  5 ++---
 sound/soc/intel/boards/cht_bsw_max98090_ti.c |  6 ++----
 sound/soc/intel/boards/sof_es8336.c          |  6 ++----
 sound/soc/intel/boards/sof_pcm512x.c         |  6 ++----
 sound/soc/intel/boards/sof_sdw.c             |  6 ++----
 sound/soc/intel/boards/sof_wm8804.c          |  5 ++---
 sound/soc/intel/catpt/device.c               |  6 ++----
 sound/soc/intel/skylake/skl-ssp-clk.c        |  6 ++----
 sound/soc/kirkwood/kirkwood-i2s.c            |  6 ++----
 sound/soc/mediatek/common/mtk-btcvsd.c       |  5 ++---
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c   |  6 ++----
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c   |  6 ++----
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c   |  5 ++---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c   |  6 ++----
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c   |  6 ++----
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c   |  5 ++---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c   |  5 ++---
 sound/soc/meson/aiu.c                        |  6 ++----
 sound/soc/mxs/mxs-sgtl5000.c                 |  6 ++----
 sound/soc/pxa/mmp-sspa.c                     |  7 +++----
 sound/soc/pxa/pxa2xx-ac97.c                  |  5 ++---
 sound/soc/qcom/qdsp6/q6routing.c             |  6 ++----
 sound/soc/rockchip/rockchip_i2s.c            |  6 ++----
 sound/soc/rockchip/rockchip_i2s_tdm.c        |  6 ++----
 sound/soc/rockchip/rockchip_pdm.c            |  6 ++----
 sound/soc/rockchip/rockchip_rt5645.c         |  6 ++----
 sound/soc/rockchip/rockchip_spdif.c          |  6 ++----
 sound/soc/samsung/arndale.c                  |  5 ++---
 sound/soc/samsung/i2s.c                      |  8 +++-----
 sound/soc/samsung/odroid.c                   |  6 ++----
 sound/soc/samsung/pcm.c                      |  6 ++----
 sound/soc/samsung/snow.c                     |  6 ++----
 sound/soc/samsung/spdif.c                    |  6 ++----
 sound/soc/sh/fsi.c                           |  6 ++----
 sound/soc/sh/hac.c                           |  5 ++---
 sound/soc/sh/rcar/core.c                     |  6 ++----
 sound/soc/sh/rz-ssi.c                        |  6 ++----
 sound/soc/sh/siu_dai.c                       |  5 ++---
 sound/soc/sprd/sprd-mcdt.c                   |  6 ++----
 sound/soc/stm/stm32_adfsdm.c                 |  6 ++----
 sound/soc/stm/stm32_i2s.c                    |  6 ++----
 sound/soc/stm/stm32_sai_sub.c                |  6 ++----
 sound/soc/stm/stm32_spdifrx.c                |  6 ++----
 sound/soc/sunxi/sun4i-codec.c                |  6 ++----
 sound/soc/sunxi/sun4i-i2s.c                  |  6 ++----
 sound/soc/sunxi/sun4i-spdif.c                |  6 ++----
 sound/soc/sunxi/sun50i-dmic.c                |  6 ++----
 sound/soc/sunxi/sun8i-codec.c                |  6 ++----
 sound/soc/tegra/tegra186_asrc.c              |  6 ++----
 sound/soc/tegra/tegra186_dspk.c              |  6 ++----
 sound/soc/tegra/tegra20_ac97.c               |  6 ++----
 sound/soc/tegra/tegra20_i2s.c                |  6 ++----
 sound/soc/tegra/tegra210_admaif.c            |  6 ++----
 sound/soc/tegra/tegra210_adx.c               |  6 ++----
 sound/soc/tegra/tegra210_ahub.c              |  6 ++----
 sound/soc/tegra/tegra210_amx.c               |  6 ++----
 sound/soc/tegra/tegra210_dmic.c              |  6 ++----
 sound/soc/tegra/tegra210_i2s.c               |  6 ++----
 sound/soc/tegra/tegra210_mixer.c             |  6 ++----
 sound/soc/tegra/tegra210_mvc.c               |  6 ++----
 sound/soc/tegra/tegra210_ope.c               |  6 ++----
 sound/soc/tegra/tegra210_sfc.c               |  6 ++----
 sound/soc/tegra/tegra30_ahub.c               |  6 ++----
 sound/soc/tegra/tegra30_i2s.c                |  6 ++----
 sound/soc/ti/ams-delta.c                     |  5 ++---
 sound/soc/ti/davinci-i2s.c                   |  6 ++----
 sound/soc/ti/davinci-mcasp.c                 |  6 ++----
 sound/soc/ti/omap-hdmi.c                     |  5 ++---
 sound/soc/ti/omap-mcbsp.c                    |  6 ++----
 sound/soc/uniphier/evea.c                    |  6 ++----
 sound/soc/ux500/mop500.c                     |  6 ++----
 sound/soc/ux500/ux500_msp_dai.c              |  6 ++----
 sound/soc/xilinx/xlnx_formatter_pcm.c        |  5 ++---
 sound/soc/xilinx/xlnx_spdif.c                |  5 ++---
 sound/soc/xtensa/xtfpga-i2s.c                |  5 ++---
 sound/sparc/cs4231.c                         |  6 ++----
 sound/sparc/dbri.c                           |  6 ++----
 171 files changed, 345 insertions(+), 654 deletions(-)

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2

