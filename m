Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B6B76B221
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 12:46:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Oc6zt7+7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFWxJ6R9gz3bT8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 20:46:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Oc6zt7+7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.200; helo=relay7-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFWwR72K1z2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 20:45:26 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 779BD20005;
	Tue,  1 Aug 2023 10:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690886722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZU6BOq2ROWRKKk0qgc0ZNhhDzXJUcmNvZZuf7GrZzjo=;
	b=Oc6zt7+77zObe/f5CmDZ0M8Jgr8PHns5FKzn7jXnxNkGsS0tyLuEFojbJ3/S4jVcncnwQ+
	+3rB0rL37KYriDQYcsbkjQ5hLwCekAnFOcoOb+blf6WeIcv/rf8dAW3VOUVo42pi733dbR
	XTnnmJClvcpQhEraY3Tr2pnqwSWiQtyKeqZB/gZ5AD3NwfW2dfvnoGkvdcw+U9b3vOjWlm
	+jUiku88t+6hEIP3nWtNEIA7dlNnbwYJwe41xd65oL8dJIH442XllAbkqGqP5oBAlSmhq/
	bHRG5FSvDxxcqa5KwbMkOtT7Owd3+1XOrh4Rneg3dl6hIXg6s6SSWxwmAgnjvg==
Date: Tue, 1 Aug 2023 12:45:17 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 26/28] ASoC: codecs: Add support for the framer codec
Message-ID: <20230801124517.6b6009f5@bootlin.com>
In-Reply-To: <2e253048-a36e-4fee-b2f4-22f19230cf54@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-27-herve.codina@bootlin.com>
	<2e253048-a36e-4fee-b2f4-22f19230cf54@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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

On Tue, 1 Aug 2023 12:30:26 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Wed, Jul 26, 2023 at 05:02:22PM +0200, Herve Codina wrote:
> > The framer codec interracts with a framer.
> > It allows to use some of the framer timeslots as audio channels to
> > transport audio data over the framer E1/T1/J1 lines.
> > It also reports line carrier detection events through the ALSA jack
> > detection feature.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  sound/soc/codecs/Kconfig        |  15 ++
> >  sound/soc/codecs/Makefile       |   2 +
> >  sound/soc/codecs/framer-codec.c | 423 ++++++++++++++++++++++++++++++++
> >  3 files changed, 440 insertions(+)
> >  create mode 100644 sound/soc/codecs/framer-codec.c
> > 
> > diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> > index f99203ef9b03..a86cdac39b72 100644
> > --- a/sound/soc/codecs/Kconfig
> > +++ b/sound/soc/codecs/Kconfig
> > @@ -110,6 +110,7 @@ config SND_SOC_ALL_CODECS
> >  	imply SND_SOC_ES8328_I2C
> >  	imply SND_SOC_ES7134
> >  	imply SND_SOC_ES7241
> > +	imply SND_SOC_FRAMER
> >  	imply SND_SOC_GTM601
> >  	imply SND_SOC_HDAC_HDMI
> >  	imply SND_SOC_HDAC_HDA
> > @@ -1043,6 +1044,20 @@ config SND_SOC_ES8328_SPI
> >  	depends on SPI_MASTER
> >  	select SND_SOC_ES8328
> >  
> > +config SND_SOC_FRAMER
> > +	tristate "Framer codec"
> > +	depends on GENERIC_FRAMER
> > +	help
> > +	  Enable support for the framer codec.
> > +	  The framer codec uses the generic framer infrastructure to transport
> > +	  some audio data over an analog E1/T1/J1 line.
> > +	  This codec allows to use some of the time slots available on the TDM
> > +	  bus on which the framer is connected to transport the audio data.
> > +
> > +	  To compile this driver as a module, choose M here: the module
> > +	  will be called snd-soc-framer.
> > +
> > +
> >  config SND_SOC_GTM601
> >  	tristate 'GTM601 UMTS modem audio codec'
> >  
> > diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> > index 32dcc6de58bd..54667274a0f6 100644
> > --- a/sound/soc/codecs/Makefile
> > +++ b/sound/soc/codecs/Makefile
> > @@ -116,6 +116,7 @@ snd-soc-es8326-objs := es8326.o
> >  snd-soc-es8328-objs := es8328.o
> >  snd-soc-es8328-i2c-objs := es8328-i2c.o
> >  snd-soc-es8328-spi-objs := es8328-spi.o
> > +snd-soc-framer-objs := framer-codec.o
> >  snd-soc-gtm601-objs := gtm601.o
> >  snd-soc-hdac-hdmi-objs := hdac_hdmi.o
> >  snd-soc-hdac-hda-objs := hdac_hda.o
> > @@ -499,6 +500,7 @@ obj-$(CONFIG_SND_SOC_ES8326)    += snd-soc-es8326.o
> >  obj-$(CONFIG_SND_SOC_ES8328)	+= snd-soc-es8328.o
> >  obj-$(CONFIG_SND_SOC_ES8328_I2C)+= snd-soc-es8328-i2c.o
> >  obj-$(CONFIG_SND_SOC_ES8328_SPI)+= snd-soc-es8328-spi.o
> > +obj-$(CONFIG_SND_SOC_FRAMER)	+= snd-soc-framer.o
> >  obj-$(CONFIG_SND_SOC_GTM601)    += snd-soc-gtm601.o
> >  obj-$(CONFIG_SND_SOC_HDAC_HDMI) += snd-soc-hdac-hdmi.o
> >  obj-$(CONFIG_SND_SOC_HDAC_HDA) += snd-soc-hdac-hda.o
> > diff --git a/sound/soc/codecs/framer-codec.c b/sound/soc/codecs/framer-codec.c
> > new file mode 100644
> > index 000000000000..52b4546a61ee
> > --- /dev/null
> > +++ b/sound/soc/codecs/framer-codec.c
> > @@ -0,0 +1,423 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// Framer ALSA SoC driver
> > +//
> > +// Copyright 2023 CS GROUP France
> > +//
> > +// Author: Herve Codina <herve.codina@bootlin.com>
> > +
> > +#include <linux/clk.h>
> > +#include <linux/framer/framer.h>
> > +#include <linux/module.h>
> > +#include <linux/notifier.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +#include <sound/jack.h>
> > +#include <sound/pcm_params.h>
> > +#include <sound/soc.h>
> > +#include <sound/tlv.h>
> > +
> > +#define FRAMER_NB_CHANNEL	32
> > +#define FRAMER_JACK_MASK (SND_JACK_LINEIN | SND_JACK_LINEOUT)
> > +
> > +struct framer_codec {
> > +	struct framer *framer;
> > +	struct device *dev;
> > +	struct snd_soc_jack jack;
> > +	struct notifier_block nb;
> > +	struct work_struct carrier_work;
> > +	int max_chan_playback;
> > +	int max_chan_capture;
> > +};
> > +
> > +static int framer_dai_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
> > +				   unsigned int rx_mask, int slots, int width)
> > +{
> > +	struct framer_codec *framer = snd_soc_component_get_drvdata(dai->component);
> > +
> > +	switch (width) {
> > +	case 0:
> > +		/* Not set -> default 8 */
> > +	case 8:
> > +		break;
> > +	default:
> > +		dev_err(dai->dev, "tdm slot width %d not supported\n", width);
> > +		return -EINVAL;
> > +	}
> > +
> > +	framer->max_chan_playback = hweight32(tx_mask);
> > +	if (framer->max_chan_playback > FRAMER_NB_CHANNEL) {
> > +		dev_err(dai->dev, "too much tx slots defined (mask = 0x%x) support max %d\n",  
> 
> "many", not "much".
> 
> Also, "supported".

Yes, will be fixed.

Regards,
Hervé
