Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AF676B1D6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 12:31:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=eiy6XJ1+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFWcB51sRz3bWW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 20:31:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=eiy6XJ1+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFWbM1Phyz2yDd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 20:30:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KeOeZN8j1Kv4rdUg/08Xyr1q7VbFfZ43LqMnjplQud8=; b=eiy6XJ1+OayMv3ZjecdJgWMT9C
	Uv5GOK/vQES7nI9CpL7KwfXjXVd5FKQnbNysWgmJl1slR3hFYDF+ttduAxM75xNKTR3wYVnCt6KOh
	oJmD9ziJMqaYZvpmHWHL2O+EqtZWvujJfqSoTNm77Ddkj4YFYzYuus4k8aBdjREqinVo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qQme2-002n9O-R9; Tue, 01 Aug 2023 12:30:26 +0200
Date: Tue, 1 Aug 2023 12:30:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 26/28] ASoC: codecs: Add support for the framer codec
Message-ID: <2e253048-a36e-4fee-b2f4-22f19230cf54@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-27-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726150225.483464-27-herve.codina@bootlin.com>
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
Cc: alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 26, 2023 at 05:02:22PM +0200, Herve Codina wrote:
> The framer codec interracts with a framer.
> It allows to use some of the framer timeslots as audio channels to
> transport audio data over the framer E1/T1/J1 lines.
> It also reports line carrier detection events through the ALSA jack
> detection feature.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  sound/soc/codecs/Kconfig        |  15 ++
>  sound/soc/codecs/Makefile       |   2 +
>  sound/soc/codecs/framer-codec.c | 423 ++++++++++++++++++++++++++++++++
>  3 files changed, 440 insertions(+)
>  create mode 100644 sound/soc/codecs/framer-codec.c
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index f99203ef9b03..a86cdac39b72 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -110,6 +110,7 @@ config SND_SOC_ALL_CODECS
>  	imply SND_SOC_ES8328_I2C
>  	imply SND_SOC_ES7134
>  	imply SND_SOC_ES7241
> +	imply SND_SOC_FRAMER
>  	imply SND_SOC_GTM601
>  	imply SND_SOC_HDAC_HDMI
>  	imply SND_SOC_HDAC_HDA
> @@ -1043,6 +1044,20 @@ config SND_SOC_ES8328_SPI
>  	depends on SPI_MASTER
>  	select SND_SOC_ES8328
>  
> +config SND_SOC_FRAMER
> +	tristate "Framer codec"
> +	depends on GENERIC_FRAMER
> +	help
> +	  Enable support for the framer codec.
> +	  The framer codec uses the generic framer infrastructure to transport
> +	  some audio data over an analog E1/T1/J1 line.
> +	  This codec allows to use some of the time slots available on the TDM
> +	  bus on which the framer is connected to transport the audio data.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called snd-soc-framer.
> +
> +
>  config SND_SOC_GTM601
>  	tristate 'GTM601 UMTS modem audio codec'
>  
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index 32dcc6de58bd..54667274a0f6 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -116,6 +116,7 @@ snd-soc-es8326-objs := es8326.o
>  snd-soc-es8328-objs := es8328.o
>  snd-soc-es8328-i2c-objs := es8328-i2c.o
>  snd-soc-es8328-spi-objs := es8328-spi.o
> +snd-soc-framer-objs := framer-codec.o
>  snd-soc-gtm601-objs := gtm601.o
>  snd-soc-hdac-hdmi-objs := hdac_hdmi.o
>  snd-soc-hdac-hda-objs := hdac_hda.o
> @@ -499,6 +500,7 @@ obj-$(CONFIG_SND_SOC_ES8326)    += snd-soc-es8326.o
>  obj-$(CONFIG_SND_SOC_ES8328)	+= snd-soc-es8328.o
>  obj-$(CONFIG_SND_SOC_ES8328_I2C)+= snd-soc-es8328-i2c.o
>  obj-$(CONFIG_SND_SOC_ES8328_SPI)+= snd-soc-es8328-spi.o
> +obj-$(CONFIG_SND_SOC_FRAMER)	+= snd-soc-framer.o
>  obj-$(CONFIG_SND_SOC_GTM601)    += snd-soc-gtm601.o
>  obj-$(CONFIG_SND_SOC_HDAC_HDMI) += snd-soc-hdac-hdmi.o
>  obj-$(CONFIG_SND_SOC_HDAC_HDA) += snd-soc-hdac-hda.o
> diff --git a/sound/soc/codecs/framer-codec.c b/sound/soc/codecs/framer-codec.c
> new file mode 100644
> index 000000000000..52b4546a61ee
> --- /dev/null
> +++ b/sound/soc/codecs/framer-codec.c
> @@ -0,0 +1,423 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Framer ALSA SoC driver
> +//
> +// Copyright 2023 CS GROUP France
> +//
> +// Author: Herve Codina <herve.codina@bootlin.com>
> +
> +#include <linux/clk.h>
> +#include <linux/framer/framer.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <sound/jack.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/tlv.h>
> +
> +#define FRAMER_NB_CHANNEL	32
> +#define FRAMER_JACK_MASK (SND_JACK_LINEIN | SND_JACK_LINEOUT)
> +
> +struct framer_codec {
> +	struct framer *framer;
> +	struct device *dev;
> +	struct snd_soc_jack jack;
> +	struct notifier_block nb;
> +	struct work_struct carrier_work;
> +	int max_chan_playback;
> +	int max_chan_capture;
> +};
> +
> +static int framer_dai_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
> +				   unsigned int rx_mask, int slots, int width)
> +{
> +	struct framer_codec *framer = snd_soc_component_get_drvdata(dai->component);
> +
> +	switch (width) {
> +	case 0:
> +		/* Not set -> default 8 */
> +	case 8:
> +		break;
> +	default:
> +		dev_err(dai->dev, "tdm slot width %d not supported\n", width);
> +		return -EINVAL;
> +	}
> +
> +	framer->max_chan_playback = hweight32(tx_mask);
> +	if (framer->max_chan_playback > FRAMER_NB_CHANNEL) {
> +		dev_err(dai->dev, "too much tx slots defined (mask = 0x%x) support max %d\n",

"many", not "much".

Also, "supported".

      Andrew
