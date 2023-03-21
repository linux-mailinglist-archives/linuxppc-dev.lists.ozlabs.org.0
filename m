Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F916C3C6F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 22:07:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ph4236gP5z3bgX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 08:07:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PpNv9a2O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PpNv9a2O;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgyKk0k6kz30Kr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 03:51:06 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A8135B818DF;
	Tue, 21 Mar 2023 16:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AD3C433D2;
	Tue, 21 Mar 2023 16:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679417461;
	bh=fp9G8SpTl+MrJ2z7YNOSWhwSVgIP0kvj9XT4UtSCbkc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PpNv9a2Ofl1hukgcLZ9WjlVvLUhKsLU8eSz57YifyKoL6r7NcnlDda6/pngKyhKDz
	 PzuDn+ez4I23nJWg2On0BHIyTvjUm+MMbJqgk1JKDTP+ZZVDNDhNHRXtwoKWkT9OhE
	 ofYcZ3HT2NdmIt+FQf7Gmu1pDGnQc5LXBdZ0ylfIj2NeXnXcmQg6CM33JJvFwUl3Fu
	 zgkEkzDKK4anIdcL/JHPdoZLsvc4UtbAS50KX1wrHAFLrcvH053zD8a7HD/IQZQU1q
	 cV7Q/yFRRY3WQtMSMHiQeWEdxqDNjWFTy6GmmJMSeJ8a6aTFMKlZlVAd/pgk1fxI8z
	 mzLnmTGEs3aAw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>, 
 Gaosheng Cui <cuigaosheng1@huawei.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>, 
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
 Peter Rosin <peda@axentia.se>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Allison Randal <allison@lohutok.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Lucas Tanure <tanureal@opensource.cirrus.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Miaoqian Lin <linmq006@gmail.com>, 
 Colin Ian King <colin.i.king@gmail.com>, 
 Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, 
 Zhang Qilong <zhangqilong3@huawei.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Liang He <windhl@126.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
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
 Moises Cardona <moisesmcardona@gmail.com>, Zhen Ni <nizhen@uniontech.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Andrey Turkin <andrey.turkin@gmail.com>, 
 Muralidhar Reddy <muralidhar.reddy@intel.com>, 
 Zhu Ning <zhuning0077@gmail.com>, Gongjun Song <gongjun.song@intel.com>, 
 Shuming Fan <shumingf@realtek.com>, Yong Zhi <yong.zhi@intel.com>, 
 Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, 
 Hezi Shahmoon <hezi@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, 
 Marcin Wojtas <mw@semihalf.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, 
 Ricardo Ribalda <ribalda@chromium.org>, Trevor Wu <trevor.wu@mediatek.com>, 
 Dan Carpenter <error27@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linh Phung <linh.phung.jy@renesas.com>, 
 Shang XiaoJing <shangxiaojing@huawei.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, Li Chen <lchen@ambarella.com>, 
 Ban Tao <fengzheng923@gmail.com>, Sameer Pujar <spujar@nvidia.com>, 
 YueHaibing <yuehaibing@huawei.com>, 
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, 
 Li kunyu <kunyu@nfschina.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Jarkko Nikula <jarkko.nikula@bitmer.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, 
 Michal Simek <michal.simek@xilinx.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
Subject: Re: (subset) [PATCH 000/173] ALSA/ASoC: Convert to platform remove
 callback returning void
Message-Id: <167941743516.67241.15943142049856548526.b4-ty@kernel.org>
Date: Tue, 21 Mar 2023 16:50:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-bd1bf
X-Mailman-Approved-At: Wed, 22 Mar 2023 08:07:11 +1100
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

On Wed, 15 Mar 2023 16:04:52 +0100, Uwe Kleine-König wrote:
> this series adapts the platform drivers below sound/ to use the .remove_new()
> callback. Compared to the traditional .remove() callback .remove_new() returns
> no value. This is a good thing because the driver core doesn't (and cannot)
> cope for errors during remove. The only effect of a non-zero return value in
> .remove() is that the driver core emits a warning. The device is removed anyhow
> and an early return from .remove() usually yields a resource leak.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[001/173] ALSA: sh: aica: Drop if blocks with always false condition
          commit: e3a8459d726532be70fa917e39812570618b857e
[002/173] ASoC: amd: acp: rembrandt: Drop if blocks with always false condition
          commit: 9ac0d69ee5891c2d0f0425acbb13993ceef9cd12
[003/173] ALSA: pxa2xx: Convert to platform remove callback returning void
          commit: 3210e62ab2f63b3ecdacc2c06ca8c8a91d1bf656
[004/173] ALSA: atmel: ac97: Convert to platform remove callback returning void
          commit: 45cc35e81322117dfc27fbfded2e0263018175a0
[005/173] ALSA: mts64: Convert to platform remove callback returning void
          commit: 5909d9e5b6c927ea91ace61365049a2f365a7d7e
[006/173] ALSA: portman2x4: Convert to platform remove callback returning void
          commit: 962bdc9645036b1300c4930e147b5e9a0c587c81
[007/173] ALSA: mips/hal2: Convert to platform remove callback returning void
          commit: b54a2377ec02d52b7bb5dab381e9a45ba0bc617a
[008/173] ALSA: mips/sgio2audio: Convert to platform remove callback returning void
          commit: 0505c87c00e8e0adb64c9cfb97ea4882899bea3e
[009/173] ALSA: hda/tegra: Convert to platform remove callback returning void
          commit: d8a3441b53682883c16d6997d059e1cc2ac739c8
[010/173] ALSA: ppc/powermac: Convert to platform remove callback returning void
          commit: c3d8cb1929fc64e8c3d14f27e9540e72aee8ed08
[011/173] ALSA: sh: aica: Convert to platform remove callback returning void
          commit: de0f49b86d12384e8f3ddf7dc651a93c2c0c551b
[012/173] ALSA: sh_dac_audio: Convert to platform remove callback returning void
          commit: a0f4aa0a9f841693a6487315751c12a2f5773574
[013/173] ASoC: adi: axi-i2s: Convert to platform remove callback returning void
          commit: 711c5b4e36a3345cd0de597a9c5b7f5911abfd51
[014/173] ASoC: adi: axi-spdif: Convert to platform remove callback returning void
          commit: a0d18db09ca5b43e832c913b2375f3f6d124cc3b
[015/173] ASoC: amd: acp-pcm-dma: Convert to platform remove callback returning void
          commit: 6bbbbc24eb02518e3c5140b80144ec000bfa5bf7
[016/173] ASoC: amd: acp: rembrandt: Convert to platform remove callback returning void
          commit: 37846af6d08ccdca8308e3d4bfec9f6d97e8eec2
[017/173] ASoC: amd: acp: renoir: Convert to platform remove callback returning void
          commit: da8a3ceb45be5d711f109df5bb12261adb790391
[018/173] ASoC: amd: ps: Convert to platform remove callback returning void
          commit: 5b6bacfa1a7bc353d14189a628d8617a26e8381b
[019/173] ASoC: amd: raven: acp3x-pcm-dma: Convert to platform remove callback returning void
          commit: 599914e146a772f7ceb39912a73565d90336e5e3
[020/173] ASoC: amd: raven: acp3x-pdm-dma: Convert to platform remove callback returning void
          commit: 725d4edfa528f07acfda3e080bf1827e5eea0399
[021/173] ASoC: amd: vangogh: acp5x-pcm-dma: Convert to platform remove callback returning void
          commit: 8564d4f22ce7cbf989af4ba004b44b1878d1b984
[022/173] ASoC: amd: yc: acp6x-pdm-dma: Convert to platform remove callback returning void
          commit: 0e940c75e307f61fdf049ee7ac21d672f91883f3
[023/173] ASoC: apple: mca: Convert to platform remove callback returning void
          commit: eb5a9cf29f1e5b6290e168d405eef98b42f158a4
[024/173] ASoC: atmel: atmel-i2s: Convert to platform remove callback returning void
          commit: d0486266a6ba028fe0197c721994f3de5d21550a
[025/173] ASoC: atmel: atmel_wm8904: Convert to platform remove callback returning void
          commit: 0278eb3275df6121ecbab848269495f9ca7f5c7a
[026/173] ASoC: atmel: mchp-i2s-mcc: Convert to platform remove callback returning void
          commit: b0570709d123ee8bfed32f968d665366fb1a6d2d
[027/173] ASoC: atmel: mchp-pdmc: Convert to platform remove callback returning void
          commit: 86fdd4825459db4ec831d2d41a5e27d45dff2641
[028/173] ASoC: atmel: mchp-spdifrx: Convert to platform remove callback returning void
          commit: 879f2ce0a95701695f2b7648ca81aff543631b1d
[029/173] ASoC: atmel: mchp-spdiftx: Convert to platform remove callback returning void
          commit: c1d51c27d22af56e53e2d739cf533182c2a3fca3
[030/173] ASoC: atmel: mikroe-proto: Convert to platform remove callback returning void
          commit: 2328c4871bd33ce3be5c56a413a79c6b23535217
[031/173] ASoC: atmel: sam9g20_wm8731: Convert to platform remove callback returning void
          commit: a186762b817329d6d55fb94419b534cb06aca3a7
[032/173] ASoC: atmel: sam9x5_wm8731: Convert to platform remove callback returning void
          commit: c79ddc74c50979665d95382137aec0b4c81a61d8
[033/173] ASoC: atmel: tse850-pcm5142: Convert to platform remove callback returning void
          commit: d2679d8529096d7e6af2e3a36086075343b586dd
[034/173] ASoC: au1x: ac97c: Convert to platform remove callback returning void
          commit: a69f0329d49be4b3a46f2e7b4b241f67be73d831
[035/173] ASoC: au1x: i2sc: Convert to platform remove callback returning void
          commit: ea7f61db28e24d328d0dcf28a07b6251f7beae26
[036/173] ASoC: au1x: psc-ac97: Convert to platform remove callback returning void
          commit: c167a43dce9426bb244ca0be50d8e71b94b70532
[037/173] ASoC: au1x: psc-i2s: Convert to platform remove callback returning void
          commit: 045b9b33d5614b83150d33db688c9238bf370521
[038/173] ASoC: bcm: bcm63xx-i2s-whistler: Convert to platform remove callback returning void
          commit: ee357de34391b4d1a926c7ef736f1723d07feb9e
[039/173] ASoC: bcm: cygnus-ssp: Convert to platform remove callback returning void
          commit: cf004d9a2abaa70f36194274424031dd7c8b71c7
[040/173] ASoC: cirrus: edb93xx: Convert to platform remove callback returning void
          commit: e711b0fd45d861cb8a19fb5ce0dfc2d21eaefc3f
[041/173] ASoC: cirrus: ep93xx-i2s: Convert to platform remove callback returning void
          commit: 4b1bb8fd7ba5ddcf54cfc9e5568236a734e07f6e
[042/173] ASoC: codecs: cs47l15: Convert to platform remove callback returning void
          commit: f57c2cf8d3bd4023347303f195b0ff991324ee2c
[043/173] ASoC: codecs: cs47l24: Convert to platform remove callback returning void
          commit: 90fc2cd0c12535462fe7f71db909b6139a012b95
[044/173] ASoC: codecs: cs47l35: Convert to platform remove callback returning void
          commit: b9cc4f89852811c6af6de7653e68ee99cf4e524e
[045/173] ASoC: codecs: cs47l85: Convert to platform remove callback returning void
          commit: f71d98e5c6a979476bcf366b9764573c3fe578cf
[046/173] ASoC: codecs: cs47l90: Convert to platform remove callback returning void
          commit: acd39a3729829587128a0d58dbd13c1b23066259
[047/173] ASoC: codecs: cs47l92: Convert to platform remove callback returning void
          commit: 516ef43d40e976e16b4eb1c51a7b96e579a297bb
[048/173] ASoC: codecs: inno_rk3036: Convert to platform remove callback returning void
          commit: 8756b2ecbd2aa22d6981f6a48a804f0d2cec68a8
[049/173] ASoC: codecs: lpass-rx-macro: Convert to platform remove callback returning void
          commit: 5b06877205882a92aaf5ced177476697849fd1fe
[050/173] ASoC: codecs: lpass-tx-macro: Convert to platform remove callback returning void
          commit: 10b4f1ed0499bb1cf8335d3956bd82da59314534
[051/173] ASoC: codecs: lpass-va-macro: Convert to platform remove callback returning void
          commit: b84affc1b4e2a9cec0720eea729c0f4d0490a0c2
[052/173] ASoC: codecs: lpass-wsa-macro: Convert to platform remove callback returning void
          commit: 23a3ef6545a91abc78249e72107a13b43a68d4f9
[053/173] ASoC: codecs: msm8916-wcd-analog: Convert to platform remove callback returning void
          commit: 22b27fafbfaf398c1014726b679d5d1e8389d704
[054/173] ASoC: codecs: msm8916-wcd-digital: Convert to platform remove callback returning void
          commit: 004967ba3e8820ef8c48779ae9491cc1c6729b7c
[055/173] ASoC: codecs: rk817_codec: Convert to platform remove callback returning void
          commit: 68dadf3eceb2d3d60d3364006a5b72da4050bdcf
[056/173] ASoC: codecs: wcd938x: Convert to platform remove callback returning void
          commit: 7cd686a59b36860511965882dad1f76df2c25766
[057/173] ASoC: codecs: wm5102: Convert to platform remove callback returning void
          commit: 25a4c2697c1cb3ed1f1395f9fee4de4aed8d7503
[058/173] ASoC: codecs: wm5110: Convert to platform remove callback returning void
          commit: d1535277bf69de5e72e76a2fef15ff6ccd0ea1f7
[059/173] ASoC: codecs: wm8994: Convert to platform remove callback returning void
          commit: 63d3f580d95901e5b250105f3637b8e865219864
[060/173] ASoC: codecs: wm8997: Convert to platform remove callback returning void
          commit: e1df73df807721ce0f7be9c58ef6c751112f2aab
[061/173] ASoC: codecs: wm8998: Convert to platform remove callback returning void
          commit: 52675c1e9bfaaecc9999b39caf1305a2688df6dd
[062/173] ASoC: dwc: dwc-i2s: Convert to platform remove callback returning void
          commit: db3a56667e84503a7908a307cf74bf7f4e3f4fa5
[063/173] ASoC: fsl: eukrea-tlv320: Convert to platform remove callback returning void
          commit: 01192ad23b06216c9abdca07ef9e7add33c69a72
[064/173] ASoC: fsl: fsl_asrc: Convert to platform remove callback returning void
          commit: 7a2d15b9322b4233cfe6bd7f747ec89672d17889
[065/173] ASoC: fsl: fsl_aud2htx: Convert to platform remove callback returning void
          commit: 2a41b19201c8f22e10eebc6fc016cef5e6915ffb
[066/173] ASoC: fsl: fsl_audmix: Convert to platform remove callback returning void
          commit: fd24dfc35b49ee029ac8d3cc45cd4420ae1b455b
[067/173] ASoC: fsl: fsl_dma: Convert to platform remove callback returning void
          commit: 2c8a5de60d210093dd4b98fb4d8cdbd637450bac
[068/173] ASoC: fsl: fsl_easrc: Convert to platform remove callback returning void
          commit: 0c880ae7c01402e09a62d34356da3b03933c6603
[069/173] ASoC: fsl: fsl_esai: Convert to platform remove callback returning void
          commit: 0c85719ee2c6320ab2fdea7852a1008ac51a05f1
[070/173] ASoC: fsl: fsl_mqs: Convert to platform remove callback returning void
          commit: 4ff299cb33ae40367d38e66c5cba15242cbbe33c
[071/173] ASoC: fsl: fsl_rpmsg: Convert to platform remove callback returning void
          commit: 126ce4328be219c12458e308feade8168dff588d
[072/173] ASoC: fsl: fsl_sai: Convert to platform remove callback returning void
          commit: 78c2698dd557e2c69d1ecfc2f458eeaff0adfed3
[073/173] ASoC: fsl: fsl_spdif: Convert to platform remove callback returning void
          commit: c8c0bd47cf83c48d422b68b3cfb808f569d7453d
[074/173] ASoC: fsl: fsl_ssi: Convert to platform remove callback returning void
          commit: 2d1c82c460f2602282749825d5599688a46363ad
[075/173] ASoC: fsl: fsl_xcvr: Convert to platform remove callback returning void
          commit: aefe902ea8d538a86d9eb7128d5878e0b838241f
[076/173] ASoC: fsl: imx-audmux: Convert to platform remove callback returning void
          commit: 51451f46d1f3134235f3a332f919e2b7af87fd49
[077/173] ASoC: fsl: imx-pcm-rpmsg: Convert to platform remove callback returning void
          commit: a064945698110e2aa283026bd4f31e3c34e00e93
[078/173] ASoC: fsl: imx-sgtl5000: Convert to platform remove callback returning void
          commit: b8a148daa7969839c6bfbdd223dffa476dee4325
[079/173] ASoC: fsl: mpc5200_psc_ac97: Convert to platform remove callback returning void
          commit: 5ccf4bee004073af36e454c3f263a03d7a6ac72b
[080/173] ASoC: fsl: mpc5200_psc_i2s: Convert to platform remove callback returning void
          commit: 295dc79cfc05959f252546e34f0bddcc52aa7d8a
[081/173] ASoC: fsl: mpc8610_hpcd: Convert to platform remove callback returning void
          commit: 9c4d8f48ac4f38dbb23a546b8a5489d37f04f926
[082/173] ASoC: fsl: p1022_ds: Convert to platform remove callback returning void
          commit: 6a442e72940039bd69081320acdd4d7666f30a36
[083/173] ASoC: fsl: p1022_rdk: Convert to platform remove callback returning void
          commit: ca4957d3b1f08c04e3ea510ebb419feda7b959c9
[084/173] ASoC: fsl: pcm030-audio-fabric: Convert to platform remove callback returning void
          commit: b7f036b9ff7f6accced758b21d4194d184709d95
[085/173] ASoC: generic: test-component: Convert to platform remove callback returning void
          commit: 53946256cb7e9b4093f533fd42118cb6eda9ebb7
[086/173] ASoC: img: img-i2s-in: Convert to platform remove callback returning void
          commit: 4c9c73d88f927e7549852136ac82b8eb9978ceeb
[087/173] ASoC: img: img-i2s-out: Convert to platform remove callback returning void
          commit: 3573bca8286daaaf191aece525e617415b88dfcb
[088/173] ASoC: img: img-parallel-out: Convert to platform remove callback returning void
          commit: 6a5e4aafe0fd1523f75974af1aec50c35a17dbb5
[089/173] ASoC: img: img-spdif-in: Convert to platform remove callback returning void
          commit: 029a00ae9718571520f18ebdfb9ac5a633205d16
[090/173] ASoC: img: img-spdif-out: Convert to platform remove callback returning void
          commit: 4e894b2ec67c5c11cf9aa3d7c758102f02a3d08a
[091/173] ASoC: img: pistachio-internal-dac: Convert to platform remove callback returning void
          commit: ab44348955bfc3b9ca127dfb36d0c3231adacf07
[092/173] ASoC: Intel: sst-mfld-platform-pcm: Convert to platform remove callback returning void
          commit: 0d31e8adf3e01cd344070ca33e51dac61b833bd0
[093/173] ASoC: Intel: sst: Convert to platform remove callback returning void
          commit: c524f1674fc765b4adffd9329e89591169922269
[094/173] ASoC: Intel: bytcht_es8316: Convert to platform remove callback returning void
          commit: 9c5b13d50b2eb039a43af2d06a31813bff717fa7
[095/173] ASoC: Intel: bytcr_rt5640: Convert to platform remove callback returning void
          commit: 2dc1d3c55d96973ded9c7fab8a22b7e323ae43e3
[096/173] ASoC: Intel: boards: bytcr_rt5651: Convert to platform remove callback returning void
          commit: 00f2ac22d63c54fbe2cc0a98a4f25c640b224b44
[097/173] ASoC: Intel: bytcr_wm5102: Convert to platform remove callback returning void
          commit: 2cd3f347aa0b82ab1c7ed8afe7e22234ac1b06f2
[098/173] ASoC: Intel: cht_bsw_max98090_ti: Convert to platform remove callback returning void
          commit: 76a32d30dce2b101592ac76b4d74ae9fc9b9309b
[099/173] ASoC: Intel: sof_es8336: Convert to platform remove callback returning void
          commit: c1f0f19e3f206354c7f5759456f0789776394d17
[100/173] ASoC: Intel: sof_pcm512x: Convert to platform remove callback returning void
          commit: b6c85e141938c353ff390c112d7b226872712429
[101/173] ASoC: Intel: sof_sdw: Convert to platform remove callback returning void
          commit: 51a4a7ecd85f9a714b47caa4d8c2ee7ea1e5b81f
[102/173] ASoC: Intel: sof_wm8804: Convert to platform remove callback returning void
          commit: 674dd2c5f2b9466d9e8dfcd5e6f7a68d26fbc923
[103/173] ASoC: Intel: catpt: Convert to platform remove callback returning void
          commit: 4b6f92559390e016b6264b5f6d25f192ea83acba
[104/173] ASoC: Intel: skl-ssp-clk: Convert to platform remove callback returning void
          commit: 394b2a11d9c238eb23e4fc087cc69f797b365f4b
[105/173] ASoC: kirkwood: kirkwood-i2s: Convert to platform remove callback returning void
          commit: 8c078706e9862c7cd8bcb22d34133262024c26bf
[106/173] ASoC: mediatek: mtk-btcvsd: Convert to platform remove callback returning void
          commit: 09f8cf0495b03dee0d567cebd4f47294c6293cd4
[107/173] ASoC: mediatek: mt2701-afe-pcm: Convert to platform remove callback returning void
          commit: b3dff59e57a2d7c319590afe127a541917a06e1f
[108/173] ASoC: mediatek: mt6797-afe-pcm: Convert to platform remove callback returning void
          commit: edd8a5cde6c73d436b7970635b14a974b9a6e45c
[109/173] ASoC: mediatek: mt8173-afe-pcm: Convert to platform remove callback returning void
          commit: 98a11bf9e7d904803fd4d91b909e3cad43719fba
[110/173] ASoC: mediatek: mt8183-afe-pcm: Convert to platform remove callback returning void
          commit: 718041d46c4c69f86135f3e38c7295a41523d7bf
[111/173] ASoC: mediatek: mt8188-afe-pcm: Convert to platform remove callback returning void
          commit: bb5ba5fe26ac53de23f1c85e97cb8cef31df343f
[112/173] ASoC: mediatek: mt8192-afe-pcm: Convert to platform remove callback returning void
          commit: 26530339aca3e55cf44895303344ea6a91fa8bb1
[113/173] ASoC: mediatek: mt8195-afe-pcm: Convert to platform remove callback returning void
          commit: 6461fee68064ba970e3ba90241fe5f5e038aa9d4
[114/173] ASoC: meson: aiu: Convert to platform remove callback returning void
          commit: ed354c69dd370ebac8c438d3570aade296afce05
[115/173] ASoC: mxs: mxs-sgtl5000: Convert to platform remove callback returning void
          commit: 75c1ed916145ecb5ae8a5e4a282aaea84fa9724e
[116/173] ASoC: pxa: mmp-sspa: Convert to platform remove callback returning void
          commit: 15c71a4c84ba66f95c49b50fa934ab0395a1010f
[117/173] ASoC: pxa: pxa2xx-ac97: Convert to platform remove callback returning void
          commit: acb6a6982d6b83c08014f5110b443f4e8bca459b
[118/173] ASoC: qcom: qdsp6: Convert to platform remove callback returning void
          commit: 60835c5c7d014cdb73166ee9e1b678d53562e3e1
[119/173] ASoC: rockchip: rockchip_i2s: Convert to platform remove callback returning void
          commit: f348dd337e20e2e82b655062e613dbc63a6d4d01
[121/173] ASoC: rockchip: rockchip_pdm: Convert to platform remove callback returning void
          commit: 61785600e2b9513fe782857dd53ae9f920d6ff85
[122/173] ASoC: rockchip: rockchip_rt5645: Convert to platform remove callback returning void
          commit: ed1e0f5a273c2dcbfede81831aa14c1039ad6930
[123/173] ASoC: rockchip: rockchip_spdif: Convert to platform remove callback returning void
          commit: cdce778344bc7f6c8b52027deab3f35cc05c4b3b
[124/173] ASoC: samsung: arndale: Convert to platform remove callback returning void
          commit: 2149a1afa7f0d24164c7ae4ef66fdb98c607325c
[125/173] ASoC: samsung: i2s: Convert to platform remove callback returning void
          commit: 0b309358b8e461f3d99235d6b8b75cbffb61de57
[126/173] ASoC: samsung: odroid: Convert to platform remove callback returning void
          commit: d530e675e0189f68fc644668209eafc835d50efb
[127/173] ASoC: samsung: pcm: Convert to platform remove callback returning void
          commit: 9f82db9dbb53567fc4c8de7a9fb41a8b6b4ea0e1
[128/173] ASoC: samsung: snow: Convert to platform remove callback returning void
          commit: 3224f4407d67c9504d9c779ebe79cd90be887cec
[129/173] ASoC: samsung: spdif: Convert to platform remove callback returning void
          commit: 7695582fd463ef3158d21253130cd2f1510c4e9a
[130/173] ASoC: sh: fsi: Convert to platform remove callback returning void
          commit: 08719f469b638c09c642896878a1e7c2b7e046c4
[131/173] ASoC: sh: hac: Convert to platform remove callback returning void
          commit: 9baee32e889a646bba175fd365c4f807e42c4123
[132/173] ASoC: sh: rcar: Convert to platform remove callback returning void
          commit: 5310f0a3315b7c7c6757b0d4b01733efd537049e
[133/173] ASoC: sh: rz-ssi: Convert to platform remove callback returning void
          commit: b89438c71d72a9afbf72836630bfc995fed59e68
[134/173] ASoC: sh: siu_dai: Convert to platform remove callback returning void
          commit: 4136b45d25b2120355bbb8f35cc5102ec7e5b428
[135/173] ASoC: sprd: sprd-mcdt: Convert to platform remove callback returning void
          commit: ed771e2beafa5687eba623fbde24d88ec61aa9aa
[136/173] ASoC: stm: stm32_adfsdm: Convert to platform remove callback returning void
          commit: 6cd293d206ad4b3c42854685a00b5e5d10a10aee
[137/173] ASoC: stm: stm32_i2s: Convert to platform remove callback returning void
          commit: 607e4cf57396ebd5d4f45dfdf18933207704b1e5
[138/173] ASoC: stm: stm32_sai_sub: Convert to platform remove callback returning void
          commit: a3bd37e2e2bce4fb1757a940fa985d556662ba80
[139/173] ASoC: stm: stm32_spdifrx: Convert to platform remove callback returning void
          commit: c4d4ce48f8f59a464e4351258d2160a5215bb350
[140/173] ASoC: sunxi: sun4i-codec: Convert to platform remove callback returning void
          commit: f56a1b1026ff2e04d6f8ac83d31be3bf163888ed
[141/173] ASoC: sunxi: sun4i-i2s: Convert to platform remove callback returning void
          commit: 5423c00ee28f6cc3013b74bd1ac4090c625e91c2
[142/173] ASoC: sunxi: sun4i-spdif: Convert to platform remove callback returning void
          commit: b9d01c8254899d176ef4a387232bd8166ff769b6
[143/173] ASoC: sunxi: sun50i-dmic: Convert to platform remove callback returning void
          commit: 116d6c70fa3da6123e1529c071b521ad16af3fa5
[144/173] ASoC: sunxi: sun8i-codec: Convert to platform remove callback returning void
          commit: a594f423aed833bbc1d8d25dc1f9e387d2c7fddb
[145/173] ASoC: tegra: tegra186_asrc: Convert to platform remove callback returning void
          commit: 1e482d82b813ab0ec1fb4c28f54f8728580eb515
[146/173] ASoC: tegra: tegra186_dspk: Convert to platform remove callback returning void
          commit: e04913cba6a651f9fbdfec397735a6df53ec0212
[147/173] ASoC: tegra: tegra20_ac97: Convert to platform remove callback returning void
          commit: 41067828420de3250df957b2b0c50a33ba8e569e
[148/173] ASoC: tegra: tegra20_i2s: Convert to platform remove callback returning void
          commit: 81ab73dbfe6864efbcf2c7d8effff0225cac286e
[149/173] ASoC: tegra: tegra210_admaif: Convert to platform remove callback returning void
          commit: 8097e8afb9f6ec2a5c47a325f66e0163eadcdd5a
[150/173] ASoC: tegra: tegra210_adx: Convert to platform remove callback returning void
          commit: f129152cbce6ea54ff4a4cc05a263c2c2f105c06
[151/173] ASoC: tegra: tegra210_ahub: Convert to platform remove callback returning void
          commit: f1790c464b21c42cbf5d56138c4f8791b25193f1
[152/173] ASoC: tegra: tegra210_amx: Convert to platform remove callback returning void
          commit: f3ac69d50c58340640b4e15466cbf32c0f040f67
[153/173] ASoC: tegra: tegra210_dmic: Convert to platform remove callback returning void
          commit: 7ffba01bcd3e5e4e6ebb13348b6d9975015ab9e2
[154/173] ASoC: tegra: tegra210_i2s: Convert to platform remove callback returning void
          commit: e29df600149b08dc4b045da5c05df49c48b99436
[155/173] ASoC: tegra: tegra210_mixer: Convert to platform remove callback returning void
          commit: e0d782fad1f23dfa9d5b2e7144a433d502fd5845
[156/173] ASoC: tegra: tegra210_mvc: Convert to platform remove callback returning void
          commit: f94195ff022e5f39b6a1d4e2bcfa6f49dc32b4b7
[157/173] ASoC: tegra: tegra210_ope: Convert to platform remove callback returning void
          commit: 37831f8c144136ddb5a9f8794a5581bc8030f3f5
[158/173] ASoC: tegra: tegra210_sfc: Convert to platform remove callback returning void
          commit: 0e25bed50aafe5d7fe46671f9bd4f3480ef19e10
[159/173] ASoC: tegra: tegra30_ahub: Convert to platform remove callback returning void
          commit: b17cf43d704bd556f866057af9e8c227e0c382ee
[160/173] ASoC: tegra: tegra30_i2s: Convert to platform remove callback returning void
          commit: d148a8d46583590166711ff7c3f3644242b7563a
[161/173] ASoC: ti: ams-delta: Convert to platform remove callback returning void
          commit: 2ade2cf2b00c8746f26ed64cb9bb32daa5efbed0
[162/173] ASoC: ti: davinci-i2s: Convert to platform remove callback returning void
          commit: a4d121f6f7e9d46a54abd7efed46112cee28188f
[163/173] ASoC: ti: davinci-mcasp: Convert to platform remove callback returning void
          commit: 09382b0150f0ced1d70330a11fe23c42137c0bd4
[164/173] ASoC: ti: omap-hdmi: Convert to platform remove callback returning void
          commit: f12b0d036382dec00815780a3c2d998c1c92a422
[165/173] ASoC: ti: omap-mcbsp: Convert to platform remove callback returning void
          commit: 9b6818bb3c58de41f987554bf27db3058c5e6838
[166/173] ASoC: uniphier: evea: Convert to platform remove callback returning void
          commit: 048d658978107f1a6b517297acb2eb08dd70b4c7
[167/173] ASoC: ux500: mop500: Convert to platform remove callback returning void
          commit: d2b6d5b85a651f4678e7c8343df4d93cc736489b
[168/173] ASoC: ux500: ux500_msp_dai: Convert to platform remove callback returning void
          commit: 316a6bbfb878b710cd0c28c4fcce47a299bbd64c
[169/173] ASoC: xilinx: xlnx_formatter_pcm: Convert to platform remove callback returning void
          commit: bf6b5ced96cdaec0af1621ecd4f245a907ed3b06
[170/173] ASoC: xilinx: xlnx_spdif: Convert to platform remove callback returning void
          commit: 407a27b72e168aac1c192c4b977cc3ad6b41caa2
[171/173] ASoC: xtensa: xtfpga-i2s: Convert to platform remove callback returning void
          commit: cbde81bc5573ddade3d2560fe7b5e4fa80db8f7b
[172/173] ALSA: sparc/cs4231: Convert to platform remove callback returning void
          commit: 44e4b6ee0486e301bfd8f4b2948905893bcf1314
[173/173] ALSA: sparc/dbri: Convert to platform remove callback returning void
          commit: 9fa6137d0c7843209472bb07277f9fcffa80847a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

