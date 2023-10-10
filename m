Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0147C037D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 20:34:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tLfOxeeD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4l0l540Qz3cFh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 05:33:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tLfOxeeD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4kzp75mVz30PJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:33:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 12CCE61460;
	Tue, 10 Oct 2023 18:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1991C433C8;
	Tue, 10 Oct 2023 18:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696962787;
	bh=mutMKgc4ya+CgA/o70qiNv2LYmv55lohohvj+F3DMi0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tLfOxeeDr3Mw777b1OV5HKBpmCoUSeYUB1seqcT+v5P7be++hBmAZyDEDuyoTfgWL
	 3BLKYc9GGJwsURZHX93GVaDL50IWDK8LRhUKu6dHFsMSCI2Pm7l5knUq9/VQTMOVaq
	 BBFyId1KZMuJ/w2K5oGWrmlWfKG6CTi/JTESk1grIC8pLr09qLpa6meJJetQXiwhm+
	 E3s2XKVJ5q4JRPxyhzBT1BJ0R5hUBQeLC0yeCq5NS6Y5bagM9/HUHeGOZcwbw/zOcm
	 Gwhz5aQXKUQt6X3AhpOalY6jLP+uL6qiG9B/nzHMgJ10i2z3+gihzWslKNsvFNZo4c
	 6jpQ35nWLN+kQ==
From: Mark Brown <broonie@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Peter Rosin <peda@axentia.se>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Oder Chiou <oder_chiou@realtek.com>, 
 Fabio Estevam <festevam@gmail.com>, Kiseok Jo <kiseok.jo@irondevice.com>, 
 Kevin Cernekee <cernekee@chromium.org>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP Linux Team <linux-imx@nxp.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ban Tao <fengzheng923@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Jarkko Nikula <jarkko.nikula@bitmer.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <"r anjani.sridharan"@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>
In-Reply-To: <20231003-dt-asoc-header-cleanups-v1-0-05b5d6447e5a@kernel.org>
References: <20231003-dt-asoc-header-cleanups-v1-0-05b5d6447e5a@kernel.org>
Subject: Re: [PATCH RESEND 0/5] ASoC: DT matching and header cleanups
Message-Id: <169696277523.221758.9535958307548510833.b4-ty@kernel.org>
Date: Tue, 10 Oct 2023 19:32:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 03 Oct 2023 13:13:09 -0500, Rob Herring wrote:
> (Got a bunch of bounces on the first try. Something weird going on with
> the To header best I can tell. Retrying with git-send-email instead of
> b4.)
> 
> This is a series is part of ongoing clean-ups related to device
> matching and DT related implicit includes. Essentially of_device.h has
> a bunch of implicit includes and generally isn't needed any nore except
> for of_match_device(). As we also generally want to get rid of
> of_match_device() as well, I've done that so we're not updating the
> includes twice.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: Explicitly include correct DT includes
      commit: 340d79a14d6ab5066ba40651764db20bd151aea7
[2/5] ASoC: Drop unnecessary of_match_device() calls
      commit: 56c075b2d31c626370481a62d334a0575f751522
[3/5] ASoC: da7218: Use i2c_get_match_data()
      commit: fe26425518862020449cb2c9709e62cc76a56de2
[4/5] ASoC: qcom/lpass: Constify struct lpass_variant
      commit: ec5236c2e6ec1ce62237a2e9345dd2ffc4fc6d56
[5/5] ASoC: Use device_get_match_data()
      commit: 9958d85968ed2df4b704105fd2a9c3669eb9cd97

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

