Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D5F7B8E02
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 22:29:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h1x1dXpx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S15rN4Lb7z3cb2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 07:29:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h1x1dXpx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S15qT5Nh8z2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 07:28:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C357261712
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 20:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DA3C433CB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 20:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696451297;
	bh=ESQvJZctYiv8lN6ltsro47C1eNao1M4P8HhyGWJi1h4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h1x1dXpxsW0znEXAMg1TsOxUEQAeL4mameKwEflZkI3ud72E4SfSnMLv4MTyPJOGK
	 91xKEos+lnRlsdOawtcs1w7xjj/NrHk6TkQun8DsZU6AEJZ9kq8yvqhWsCcAP7ToV0
	 3GMHy78dDOOJgAnAvr2ii/YekvQwjb2tiYwKcj8h+qj46tO8durP9jmgOwujcb89DT
	 1Fcvt0BdxthkDKsconPNNWQjko1VboNg1Q5AJwRe7Wl23lo/dozWL04bt+Kplgmc+I
	 i/sX6rb9bwFGm0GxmpG+U6qFYRmMILtd8DUJKRvdgDyKyyQ3S4+2RbKVtrvmaizWbG
	 91yqWlSOeijRA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2bfea381255so3116611fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Oct 2023 13:28:17 -0700 (PDT)
X-Gm-Message-State: AOJu0YyaXiQRURMXytXrpyp0Cd4fAzk/zYE+IqwE/440Gl4MlyunwLal
	ICiEw/oZKBYZWFkV6DLYpCeYa8uuuejeDtYjFg==
X-Google-Smtp-Source: AGHT+IFXJfh8tz1TfG4klEB0mQGxX4Kz28T+ev5c9ShobOxqcsUhL+MV/lbeEpe9jSwPaddrVVnL759EryfLJI5QK0U=
X-Received: by 2002:a05:6512:605:b0:503:1ca6:c590 with SMTP id
 b5-20020a056512060500b005031ca6c590mr2798624lfe.22.1696451275113; Wed, 04 Oct
 2023 13:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231004-dt-asoc-header-cleanups-v2-0-e77765080cbc@kernel.org>
 <20231004-dt-asoc-header-cleanups-v2-1-e77765080cbc@kernel.org> <72f8f521-93f0-4e3d-929c-f7478622ddb3@sirena.org.uk>
In-Reply-To: <72f8f521-93f0-4e3d-929c-f7478622ddb3@sirena.org.uk>
From: Rob Herring <robh@kernel.org>
Date: Wed, 4 Oct 2023 15:27:42 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLw6TKBsTee6U5Yfiz_T7WDt+1LZZNWzW1pL+z9bK5R0w@mail.gmail.com>
Message-ID: <CAL_JsqLw6TKBsTee6U5Yfiz_T7WDt+1LZZNWzW1pL+z9bK5R0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] ASoC: Explicitly include correct DT includes
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Oct 4, 2023 at 12:39=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Oct 04, 2023 at 10:58:05AM -0500, Rob Herring wrote:
> > The DT of_device.h and of_platform.h date back to the separate
> > of_platform_bus_type before it was merged into the regular platform bus=
.
> > As part of that merge prepping Arm DT support 13 years ago, they
> > "temporarily" include each other. They also include platform_device.h
> > and of.h. As a result, there's a pretty much random mix of those includ=
e
> > files used throughout the tree. In order to detangle these headers and
> > replace the implicit includes with struct declarations, users need to
> > explicitly include the correct includes.
>
> This is breaking various builds for me, for example arm64 defconfig:

I believe I got some of the include changes in the wrong place. They
should go into patch 5.

Rob
