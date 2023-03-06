Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC0B6AD122
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 23:07:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVt471pXhz3fvl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 09:07:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PsQMxWTN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PsQMxWTN;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVsBD6lJQz3cfB;
	Tue,  7 Mar 2023 08:28:04 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E2CF760C7A;
	Mon,  6 Mar 2023 21:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA102C433A1;
	Mon,  6 Mar 2023 21:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678138079;
	bh=OPscq8j4gixbBXyx4rYRiqcOtug0pajWX+t3LwK0uPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PsQMxWTNyqmjmOyLA6f4aBxEbqjXLjGnQvTHUoE4f6zTvuB0TEbKKoow7O0Bl6lqg
	 gYnqSQeBrO1rJ29HWmn+yvMly1eyD9pru67Ei5XhYPhftQR6cu4eDx5Y2uE63s5KIt
	 s3zsZ4FOYFUkiy7gTDlGyR2DhiXrF2ddTXSUbWfDk94k+YWjCuHsJXdkT6LOyMmw3/
	 OBMkdU9AXHfmpJlFP0bcKZdHq+IuioXEaW+oivplUHjLiBGkJeMjuBmdvu2rgkgh5Q
	 WG7SALFgV1PPXh9MrSvGscl5OUXQrlqRl1aL8dYkfSYDeEvI72A6J1sMyBNHxpS7Fw
	 LxAw7Z0FF0jTA==
Date: Mon, 6 Mar 2023 21:27:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: Re: [PATCH V5 01/15] spi: Replace all spi->chip_select and
 spi->cs_gpiod references with function call
Message-ID: <00684da3-520f-459d-b6bd-55e728e93ebf@sirena.org.uk>
References: <20230306172109.595464-1-amit.kumar-mahapatra@amd.com>
 <20230306172109.595464-2-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RfYQ7lwbbyjtjTUN"
Content-Disposition: inline
In-Reply-To: <20230306172109.595464-2-amit.kumar-mahapatra@amd.com>
X-Cookie: teamwork, n.:
X-Mailman-Approved-At: Tue, 07 Mar 2023 08:51:16 +1100
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
Cc: kursad.oney@broadcom.com, heiko@sntech.de, linus.walleij@linaro.org, eajames@linux.ibm.com, perex@perex.cz, alim.akhtar@samsung.com, miquel.raynal@bootlin.com, rafal@milecki.pl, linux-stm32@st-md-mailman.stormreply.com, stefan@datenfreihafen.org, tmaimon77@gmail.com, linux-samsung-soc@vger.kernel.org, samuel@sholland.org, tiwai@suse.com, haibo.chen@nxp.com, mingo@redhat.com, linux-imx@nxp.com, linux-sunxi@lists.linux.dev, anand.gore@broadcom.com, s.hauer@pengutronix.de, l.stelmach@samsung.com, npiggin@gmail.com, james.schulman@cirrus.com, Sanju.Mehta@amd.com, sbranden@broadcom.com, andrew@aj.id.au, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, yogeshgaur.83@gmail.com, michael@walle.cc, kernel@pengutronix.de, olteanv@gmail.com, linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com, alexandre.belloni@bootlin.com, tanureal@opensource.cirrus.com, david.rhodes@cirrus.com, edumazet@google.com, ldewangan@nvidia.com, jonas.gorski@gmail.com, w
 indhl@126.com, lars@metafoo.de, jonathanh@nvidia.com, linux-rockchip@lists.infradead.org, jbrunet@baylibre.com, andi@etezian.org, Michael.Hennerich@analog.com, martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org, radu_nicolae.pirea@upb.ro, haojian.zhuang@gmail.com, jaswinder.singh@linaro.org, clg@kaod.org, linux-amlogic@lists.infradead.org, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, libertas-dev@lists.infradead.org, mcoquelin.stm32@gmail.com, khilman@baylibre.com, pratyush@kernel.org, linux-rpi-kernel@lists.infradead.org, narmstrong@baylibre.com, linux-iio@vger.kernel.org, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, patches@opensource.cirrus.com, linux-mtd@lists.infradead.org, masahisa.kojima@linaro.org, festevam@gmail.com, linux-aspeed@lists.ozlabs.org, git@amd.com, f.fainelli@gmail.com, benjaminfair@google.com, jernej.skrabec@gmail.com, yuenn@google.com, wens@csie.org, bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au, yangyingliang
 @huawei.com, pabeni@redhat.com, Patrice Chotard <patrice.chotard@foss.st.com>, amitrkcian2002@gmail.com, william.zhang@broadcom.com, rjui@broadcom.com, john.garry@huawei.com, rostedt@goodmis.org, rf@opensource.cirrus.com, tali.perry1@gmail.com, avifishman70@gmail.com, thierry.reding@gmail.com, netdev@vger.kernel.org, shawnguo@kernel.org, davem@davemloft.net, alex.aring@gmail.com, vigneshr@ti.com, konrad.dybcio@somainline.org, alexandre.torgue@foss.st.com, bjorn.andersson@linaro.org, linux-riscv@lists.infradead.org, robert.jarzmik@free.fr, kdasu.kdev@gmail.com, richard@nod.at, chin-ting_kuo@aspeedtech.com, Dhruva Gole <d-gole@ti.com>, agross@kernel.org, kuba@kernel.org, tudor.ambarus@microchip.com, kvalo@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, han.xu@nxp.com, oss@buserror.net, venture@google.com, nicolas.ferre@microchip.com, fancer.lancer@gmail.com, krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, jic23@kernel.org, linuxppc-dev@lists.ozlabs.org, ope
 nbmc@lists.ozlabs.org, daniel@zonque.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--RfYQ7lwbbyjtjTUN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 06, 2023 at 10:50:55PM +0530, Amit Kumar Mahapatra wrote:

>  drivers/spi/spi-omap-100k.c       |  2 +-

This is also not against -rc1, this file was removed in bcace9c4c9270292
("spi: remove omap 100K driver").

--RfYQ7lwbbyjtjTUN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQGWsMACgkQJNaLcl1U
h9C7Fwf+MqZVyi3PlI6YIKPDaaFyWnmjZtweIjxd+4E2eEmTZq9MbcCHS/W56cUk
TPWusPOjIa33XHC376rZpTYGqNTRjvOo8UwttJFAFQFbtMNui8BfC1bnrROwoyUE
AxcOxhCAi3r1P0nRIkS126TepySOo1qXD1gf6YUQydf6/iDxzq7VddVjfqtt3dPF
6rnt0G5xA5O0Z75Kc76h4ePCX7kXMqJhJSaJf7HFcGwD2P5HIeRcRyucD2q4Ddnr
KzkdziV90/s6X7Q9cfiA620jfm8jVdqqN3yC+JX/L2Iu8kpeefFFgD49yG2aMtxv
zgXP6uMpvQm5g7F9e/wo/JMWhjfh8g==
=uJRe
-----END PGP SIGNATURE-----

--RfYQ7lwbbyjtjTUN--
