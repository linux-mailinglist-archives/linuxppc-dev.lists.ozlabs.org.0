Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 179506AD119
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 23:07:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVt376HNvz3fsx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 09:06:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=o6hZefnQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=jonas.gorski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=o6hZefnQ;
	dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVqFm1BW6z3c4x;
	Tue,  7 Mar 2023 07:00:59 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id u5so11701204plq.7;
        Mon, 06 Mar 2023 12:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678132856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uXR1hBuNmG/TwC91AeVvsW1UVH/MwkAfhUSEnuvNaoY=;
        b=o6hZefnQYEnFw3COvoTdyyoXo9Zv4P0LTShB301lkw0/gGr+x1ou0XeYCSdcXXLXoz
         Ie/lwSIsRhh9vBh4c56fFPeCbh1Mg/u0f+SLHuOsNnA01L3iQxuD6tKvCodPDyUeqcUA
         ipzyAtvRXWR1nR5U0W8m7xh6fPIYtpAYIZVYRkCJb0GTxixFtDSEeec8W6O4TIR9SFvb
         8TyLwk+heXtYmzhntJcZ54SphmylZPrikYFa1PRdJ8V5j+VefclzJKcG1hcN/EBRiJ2z
         A5LjdstbOHhVHAVRXA7o2dTcBNuVBc27QoVtU1tjX+Yepbtmilj428R4Os2Xd6WiLWnA
         Of4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678132856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXR1hBuNmG/TwC91AeVvsW1UVH/MwkAfhUSEnuvNaoY=;
        b=fXwdtuICrRb7QdGihNKOcHMoN/1DU1XU0KgKqBNYQyWrb2eHpNDziTHLXC58xzON5l
         L3Yn1BPxRMNDnOAWAHN/kVy5DubQKFyqqMg0v6QHMq5TklnCueR4VXj6p3HUb6IgHFvk
         dRNiKWAlB5dhXq8iyfLnXzKv4wz1dmS/cHpQIGopiHD7R/PaKHjJJLnIvDx2W5NppSUz
         SZ/vWHVoyrbPpZqIVkcVwa1rk1Q2Vy2RLbj+gVdEMGcHZMKdJ7C9kAnmSBvG1NCmizdi
         wV56rfc4m/L2oEkq5mz7ZNvtrzELIyZpiNee0co3KUpuL0jrKhmiR/QV+gzbfqff0xTt
         FOBg==
X-Gm-Message-State: AO0yUKWbC5S3Z3SDAtIfZHKT/Szfu76O/87Cj3nOBwuyuF39/6B614Sl
	9VspkdMwYmwPuYveOTbW0vD4ZBF11k9oNezzYt0=
X-Google-Smtp-Source: AK7set/DxZtiZhO+z+A0Is7yokDniYYkETavBEcleYa7IPSvIEQBIV7zty9Y+UWe1CWFM73JZ5CBgh34wQSFC4iK+eg=
X-Received: by 2002:a17:90a:5993:b0:233:b520:1544 with SMTP id
 l19-20020a17090a599300b00233b5201544mr6625621pji.0.1678132856231; Mon, 06 Mar
 2023 12:00:56 -0800 (PST)
MIME-Version: 1.0
References: <20230306172109.595464-1-amit.kumar-mahapatra@amd.com> <20230306172109.595464-10-amit.kumar-mahapatra@amd.com>
In-Reply-To: <20230306172109.595464-10-amit.kumar-mahapatra@amd.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 6 Mar 2023 21:00:44 +0100
Message-ID: <CAOiHx=nmsAh3ADL3s0eZKpEZJqCB_POi=8YjfxrHYLEbjRfwHg@mail.gmail.com>
Subject: Re: [PATCH V5 09/15] spi: Add stacked and parallel memories support
 in SPI core
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kursad.oney@broadcom.com, heiko@sntech.de, linus.walleij@linaro.org, eajames@linux.ibm.com, perex@perex.cz, alim.akhtar@samsung.com, miquel.raynal@bootlin.com, rafal@milecki.pl, linux-stm32@st-md-mailman.stormreply.com, stefan@datenfreihafen.org, tmaimon77@gmail.com, linux-samsung-soc@vger.kernel.org, samuel@sholland.org, tiwai@suse.com, haibo.chen@nxp.com, mingo@redhat.com, linux-imx@nxp.com, linux-sunxi@lists.linux.dev, anand.gore@broadcom.com, s.hauer@pengutronix.de, l.stelmach@samsung.com, npiggin@gmail.com, james.schulman@cirrus.com, Sanju.Mehta@amd.com, sbranden@broadcom.com, andrew@aj.id.au, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, yogeshgaur.83@gmail.com, michael@walle.cc, kernel@pengutronix.de, olteanv@gmail.com, linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com, alexandre.belloni@bootlin.com, tanureal@opensource.cirrus.com, david.rhodes@cirrus.com, edumazet@google.com, ldewangan@nvidia.com, windhl@126.com, lars@meta
 foo.de, jonathanh@nvidia.com, linux-rockchip@lists.infradead.org, jbrunet@baylibre.com, andi@etezian.org, Michael.Hennerich@analog.com, martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org, radu_nicolae.pirea@upb.ro, haojian.zhuang@gmail.com, jaswinder.singh@linaro.org, clg@kaod.org, linux-amlogic@lists.infradead.org, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, libertas-dev@lists.infradead.org, mcoquelin.stm32@gmail.com, khilman@baylibre.com, jic23@kernel.org, linux-rpi-kernel@lists.infradead.org, narmstrong@baylibre.com, linux-iio@vger.kernel.org, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, patches@opensource.cirrus.com, linux-mtd@lists.infradead.org, masahisa.kojima@linaro.org, festevam@gmail.com, linux-aspeed@lists.ozlabs.org, git@amd.com, f.fainelli@gmail.com, benjaminfair@google.com, jernej.skrabec@gmail.com, yuenn@google.com, wens@csie.org, bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au, yangyingliang@huawei.com, pabeni@redhat.
 com, amitrkcian2002@gmail.com, william.zhang@broadcom.com, rjui@broadcom.com, john.garry@huawei.com, rostedt@goodmis.org, rf@opensource.cirrus.com, broonie@kernel.org, tali.perry1@gmail.com, avifishman70@gmail.com, thierry.reding@gmail.com, netdev@vger.kernel.org, shawnguo@kernel.org, davem@davemloft.net, alex.aring@gmail.com, vigneshr@ti.com, konrad.dybcio@somainline.org, alexandre.torgue@foss.st.com, bjorn.andersson@linaro.org, linux-riscv@lists.infradead.org, robert.jarzmik@free.fr, kdasu.kdev@gmail.com, richard@nod.at, chin-ting_kuo@aspeedtech.com, agross@kernel.org, kuba@kernel.org, tudor.ambarus@microchip.com, kvalo@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, han.xu@nxp.com, oss@buserror.net, venture@google.com, nicolas.ferre@microchip.com, fancer.lancer@gmail.com, krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, pratyush@kernel.org, linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org, daniel@zonque.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Mon, 6 Mar 2023 at 18:26, Amit Kumar Mahapatra
<amit.kumar-mahapatra@amd.com> wrote:
>
> For supporting multiple CS the SPI device need to be aware of all the CS
> values. So, the "chip_select" member in the spi_device structure is now an
> array that holds all the CS values.
>
> spi_device structure now has a "cs_index_mask" member. This acts as an
> index to the chip_select array. If nth bit of spi->cs_index_mask is set
> then the driver would assert spi->chip_select[n].
>
> In parallel mode all the chip selects are asserted/de-asserted
> simultaneously and each byte of data is stored in both devices, the even
> bits in one, the odd bits in the other. The split is automatically handled
> by the GQSPI controller. The GQSPI controller supports a maximum of two
> flashes connected in parallel mode. A "multi-cs-cap" flag is added in the
> spi controntroller data, through ctlr->multi-cs-cap the spi core will make
> sure that the controller is capable of handling multiple chip selects at
> once.
>
> For supporting multiple CS via GPIO the cs_gpiod member of the spi_device
> structure is now an array that holds the gpio descriptor for each
> chipselect.
>
> Multi CS support using GPIO is not tested due to unavailability of
> necessary hardware setup.
>
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>  drivers/spi/spi.c       | 213 +++++++++++++++++++++++++++-------------
>  include/linux/spi/spi.h |  34 +++++--
>  2 files changed, 173 insertions(+), 74 deletions(-)
>
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 5866bf5813a4..8ec7f58fa111 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -613,7 +613,8 @@ static int spi_dev_check(struct device *dev, void *data)
>         struct spi_device *new_spi = data;
>
>         if (spi->controller == new_spi->controller &&
> -           spi_get_chipselect(spi, 0) == spi_get_chipselect(new_spi, 0))
> +           spi_get_chipselect(spi, 0) == spi_get_chipselect(new_spi, 0) &&
> +           spi_get_chipselect(spi, 1) == spi_get_chipselect(new_spi, 1))
>                 return -EBUSY;

This will only reject new devices if both chip selects are identical,
but not if they only share one, e.g. CS 1 + 2 vs 1 + 3, or 1 + 2 vs
only 2, or if the order is different (1 + 2 vs 2 + 1 - haven't read
the code too close to know if this is allowed/possible).

Regards,
Jonas
