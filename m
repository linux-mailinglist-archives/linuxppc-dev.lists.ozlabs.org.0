Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1013E6B8515
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 23:44:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbBXx75LKz3cMw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 09:44:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a2JoV3Ky;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a2JoV3Ky;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb2gv5Z7yz2xHJ;
	Tue, 14 Mar 2023 03:49:47 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D7852B811A0;
	Mon, 13 Mar 2023 16:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD418C433EF;
	Mon, 13 Mar 2023 16:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678726182;
	bh=8KYXMoHAD5Z4NBIseAq6bsT/0yPZHnSTiR9g+F3H6mQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a2JoV3Ky1b2rAYHvjxOxSJk1TNI3heElPwvSF5YrOvneNeV0VdzwNhQXiUrffvmto
	 JA7P0WeiStnDt/6J8n1J9O5jnVgObXfH8lS4KXLMLBqO4DJUKBDJIvP6ivTa/Y09Sn
	 HR1pOKRuwrPDI/baAtt5wUZ6Gocqmmqr2buMgjA/aCshs3yaJSkT/BdMx60/VeJQN4
	 dkvphu6x3RN4fI6sEcajBAho9BdeW92stv1wsZ7bHVNaqIqINFZydvDFvpdEiWiF0m
	 eG/X/a/XjC1FXr2cscVZU8Cm2pQpTkDOWTAiQQum9/Cqx4Qc/c+wOmHVG5htVbTJPc
	 eI6rbG1xa4RhQ==
From: Mark Brown <broonie@kernel.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
 jic23@kernel.org, pratyush@kernel.org, Sanju.Mehta@amd.com, 
 chin-ting_kuo@aspeedtech.com, clg@kaod.org, kdasu.kdev@gmail.com, 
 f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, 
 eajames@linux.ibm.com, olteanv@gmail.com, han.xu@nxp.com, 
 john.garry@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 khilman@baylibre.com, matthias.bgg@gmail.com, haibo.chen@nxp.com, 
 linus.walleij@linaro.org, daniel@zonque.org, haojian.zhuang@gmail.com, 
 robert.jarzmik@free.fr, agross@kernel.org, heiko@sntech.de, 
 krzysztof.kozlowski@linaro.org, andi@etezian.org, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com, 
 samuel@sholland.org, masahisa.kojima@linaro.org, jaswinder.singh@linaro.org, 
 rostedt@goodmis.org, mingo@redhat.com, l.stelmach@samsung.com, 
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
 pabeni@redhat.com, alex.aring@gmail.com, stefan@datenfreihafen.org, 
 kvalo@kernel.org, james.schulman@cirrus.com, david.rhodes@cirrus.com, 
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com, perex@perex.cz, 
 tiwai@suse.com, npiggin@gmail.com, christophe.leroy@csgroup.eu, 
 mpe@ellerman.id.au, oss@buserror.net, windhl@126.com, 
 yangyingliang@huawei.com, william.zhang@broadcom.com, 
 kursad.oney@broadcom.com, jonas.gorski@gmail.com, anand.gore@broadcom.com, 
 rafal@milecki.pl, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
In-Reply-To: <20230306172109.595464-1-amit.kumar-mahapatra@amd.com>
References: <20230306172109.595464-1-amit.kumar-mahapatra@amd.com>
Subject: Re: (subset) [PATCH V5 00/15] spi: Add support for
 stacked/parallel memories
Message-Id: <167872615942.75015.12960472969249845825.b4-ty@kernel.org>
Date: Mon, 13 Mar 2023 16:49:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
X-Mailman-Approved-At: Tue, 14 Mar 2023 09:43:32 +1100
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
Cc: alexandre.belloni@bootlin.com, tmaimon77@gmail.com, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, konrad.dybcio@somainline.org, alsa-devel@alsa-project.org, tali.perry1@gmail.com, ldewangan@nvidia.com, linux-mtd@lists.infradead.org, alim.akhtar@samsung.com, linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com, git@amd.com, linux-samsung-soc@vger.kernel.org, benjaminfair@google.com, yogeshgaur.83@gmail.com, openbmc@lists.ozlabs.org, jonathanh@nvidia.com, yuenn@google.com, bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-imx@nxp.com, amitrkcian2002@gmail.com, Michael.Hennerich@analog.com, martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org, radu_nicolae.pirea@upb.ro, linuxppc-dev@lists.ozlabs.org, lars@metafoo.de, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux
 -tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, avifishman70@gmail.com, venture@google.com, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, nicolas.ferre@microchip.com, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, andrew@aj.id.au, michael@walle.cc, thierry.reding@gmail.com, palmer@dabbelt.com, kernel@pengutronix.de, netdev@vger.kernel.org, patches@opensource.cirrus.com, linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 06 Mar 2023 22:50:54 +0530, Amit Kumar Mahapatra wrote:
> This patch is in the continuation to the discussions which happened on
> 'commit f89504300e94 ("spi: Stacked/parallel memories bindings")' for
> adding dt-binding support for stacked/parallel memories.
> 
> This patch series updated the spi-nor, spi core and the spi drivers
> to add stacked and parallel memories support.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[01/15] spi: Replace all spi->chip_select and spi->cs_gpiod references with function call
        commit: 9e264f3f85a56cc109cc2d6010a48aa89d5c1ff1

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

