Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 666347B86BF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 19:40:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OeKoTfCe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S126523tWz3cfT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 04:40:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OeKoTfCe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S125852Ykz307y
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 04:39:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F1C3061635;
	Wed,  4 Oct 2023 17:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D07C433C7;
	Wed,  4 Oct 2023 17:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696441193;
	bh=K/tg8/w4CVZM+MMZbqiJI4I0lw8Qwa2sMwfhdev7ubQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OeKoTfCewQffVeEdL4VkIXNCVSD9d9NunmbLsCQ4KZkE5fGE3EzF5s2CJMEFTkFUR
	 9+Rp0Lnw0r+oc+Gh5cs7EiGtRjCli4Pt6URVlEReTs6A8YRyKnMlwZuVSsvN5yl8ae
	 nXnm9skgJdM3YBXLd0m7/YSlo87hzvKhk8PwH4P4i+Th69UGbjXYVgi82wU+QW8gDS
	 TI0fbqAPstYUmGmbBYwsdfYqwZqe7LynkAtCAyxbEKu53rOqqPRSC9TsSL7q66drdJ
	 IeRPQWuLX595ZGXfia1I+HXaRR8rGBrwp321J0JJdtnGTVTOmuXonAq7ANk6wMljxf
	 w1+um5izaFBhA==
Date: Wed, 4 Oct 2023 18:39:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/5] ASoC: Explicitly include correct DT includes
Message-ID: <72f8f521-93f0-4e3d-929c-f7478622ddb3@sirena.org.uk>
References: <20231004-dt-asoc-header-cleanups-v2-0-e77765080cbc@kernel.org>
 <20231004-dt-asoc-header-cleanups-v2-1-e77765080cbc@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K1Dh/zQH53UxpeTH"
Content-Disposition: inline
In-Reply-To: <20231004-dt-asoc-header-cleanups-v2-1-e77765080cbc@kernel.org>
X-Cookie: I thought YOU silenced the guard!
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, nuno.sa@analog.com, Kevin Lu <kevin-lu@ti.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Ban Tao <fengzheng923@gmail.com>, Fabio Estevam <festevam@gmail.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Baojun Xu <baojun.xu@ti.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, alsa-devel@als
 a-project.org, Shenghao Ding <shenghao-ding@ti.com>, James Schulman <james.schulman@cirrus.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Kevin Cernekee <cernekee@chromium.org>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Oder Chiou <oder_chiou@realtek.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Kiseok Jo <kiseok.jo@irondevice.com>, linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Banajit Goswami <bgoswami@quicinc.com>, David Rhodes <david.rhodes@cirrus.com>, Peter Rosin <peda@axentia.se>, Jarkko Nikula <jarkko.nikula@bitmer.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--K1Dh/zQH53UxpeTH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 04, 2023 at 10:58:05AM -0500, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.

This is breaking various builds for me, for example arm64 defconfig:

/build/stage/linux/sound/soc/rockchip/rockchip_i2s_tdm.c: In function =E2=
=80=98rockchip_i2s_tdm_probe=E2=80=99:
/build/stage/linux/sound/soc/rockchip/rockchip_i2s_tdm.c:1557:17: error: im=
plicit declaration of function =E2=80=98of_match_device=E2=80=99; did you m=
ean =E2=80=98of_match_node=E2=80=99? [-Werror=3Dimplicit-function-declarati=
on]
 1557 |         of_id =3D of_match_device(rockchip_i2s_tdm_match, &pdev->de=
v);
      |                 ^~~~~~~~~~~~~~~
      |                 of_match_node
/build/stage/linux/sound/soc/rockchip/rockchip_i2s_tdm.c:1557:15: warning: =
assignment to =E2=80=98const struct of_device_id *=E2=80=99 from =E2=80=98i=
nt=E2=80=99 makes pointer from integer without a cast [-Wint-conversion]
 1557 |         of_id =3D of_match_device(rockchip_i2s_tdm_match, &pdev->de=
v);
      |               ^
/build/stage/linux/sound/soc/tegra/tegra210_amx.c: In function =E2=80=98teg=
ra210_amx_platform_probe=E2=80=99:
/build/stage/linux/sound/soc/tegra/tegra210_amx.c:541:17: error: implicit d=
eclaration of function =E2=80=98of_match_device=E2=80=99; did you mean =E2=
=80=98of_match_node=E2=80=99? [-Werror=3Dimplicit-function-declaration]
  541 |         match =3D of_match_device(tegra210_amx_of_match, dev);
      |                 ^~~~~~~~~~~~~~~
      |                 of_match_node
/build/stage/linux/sound/soc/tegra/tegra210_amx.c:541:15: warning: assignme=
nt to =E2=80=98const struct of_device_id *=E2=80=99 from =E2=80=98int=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]
  541 |         match =3D of_match_device(tegra210_amx_of_match, dev);
      |               ^
cc1: some warnings being treated as errors

multi_v7_defconfig is also broken.

--K1Dh/zQH53UxpeTH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUdo10ACgkQJNaLcl1U
h9Cx8gf/XCPMEtGS0YkOT48jnbRA+1YlgQJR8uZlu9+gze7VMTlA1QqBf04fiiA9
I6p4yAWbk8inm8rqWm9T75tCz/xi0cZrcoQHPEFGYgneMyXkkoapTGe/PQbR9ZIT
grUfha4+oIa2oZXQjYL1tV3U/hfjGjRG6dPR9n+92qlgwLfwdMUhOy7Nn752+xHF
f6Igs59sXl5kvZTQVUb7Hkt9jfkBRz3QfUWiYcp9bJCblkEv9tWhi1YgLua+fUQY
VjxE2e4zNB+Z2z3A9zlFKhTB/9yBIaRma+Qp3PElEYmsQQry9nRssA/aXS5Jccon
7fWLNWj6wDBzZjKCwf69j2cORg/HHw==
=RFjB
-----END PGP SIGNATURE-----

--K1Dh/zQH53UxpeTH--
