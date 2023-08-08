Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7CA77393B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 11:07:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=flZfpRXq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKnPr3fgRz3c2r
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 19:07:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=flZfpRXq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.197; helo=relay5-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKnNv58QSz2yst
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 19:06:22 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 167A31C000E;
	Tue,  8 Aug 2023 09:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691485578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yV4jZ6QrskrDU/HVotl7NEUNo5CW4ftnk7BIqgEB1+w=;
	b=flZfpRXqaC4cOa0lUVXQGmj6OEssvWZubCe2w5MHqI8U2vWQwtOj0FQFAqgAJBxJ8I75XZ
	I0TZlmNSRmqSWR5xLTIKJ/1FDCZ4stZY0pIriPzLH17o1+eZR+fqsAFgkHhfKw1IeHA6F/
	BRImFTSpS5Rv0R1y0afDagZYKTek8UGg0TZs9w8hjDyqKGA3Umv42FjNTa+dNkNUSu3Gue
	Tx2D6FfesdOvac81rHxEHFQ6xKJfocvJHBN0OnBZAPqs83Owy9ptNTQG7K7UjxPB67/rcA
	8c/v/aUZh+TVfJDMed/1Ph30nJadiv+LXoAjitpDUEWw4zjs+hG26YAH/4HjPQ==
Date: Tue, 8 Aug 2023 11:06:13 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 26/28] ASoC: codecs: Add support for the framer codec
Message-ID: <20230808110613.07e222a3@bootlin.com>
In-Reply-To: <a1b5120b-feb0-5c87-0605-e1e170d9268d@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-27-herve.codina@bootlin.com>
	<a1b5120b-feb0-5c87-0605-e1e170d9268d@csgroup.eu>
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
Cc: Andrew Lunn <andrew@lunn.ch>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org
 >, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 8 Aug 2023 08:26:16 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Le 26/07/2023 à 17:02, Herve Codina a écrit :
> > The framer codec interracts with a framer.
> > It allows to use some of the framer timeslots as audio channels to
> > transport audio data over the framer E1/T1/J1 lines.
> > It also reports line carrier detection events through the ALSA jack
> > detection feature.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> See below
> 
> > +static int framer_dai_hw_rule_channels_by_format(struct snd_soc_dai *dai,
> > +						 struct snd_pcm_hw_params *params,
> > +						 unsigned int nb_ts)
> > +{
> > +	struct snd_interval *c = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
> > +	snd_pcm_format_t format = params_format(params);
> > +	struct snd_interval ch = {0};
> > +
> > +	switch (snd_pcm_format_physical_width(format)) {
> > +	case 8:
> > +		ch.max = nb_ts;
> > +		break;
> > +	case 16:
> > +		ch.max = nb_ts / 2;
> > +		break;
> > +	case 32:
> > +		ch.max = nb_ts / 4;
> > +		break;
> > +	case 64:
> > +		ch.max = nb_ts / 8;
> > +		break;
> > +	default:
> > +		dev_err(dai->dev, "format physical width %u not supported\n",
> > +			snd_pcm_format_physical_width(format));
> > +		return -EINVAL;
> > +	}  
> 
> What about
> 
> 	width = snd_pcm_format_physical_width(format);
> 
> 	if (width == 8 || width == 16 || width == 32 || width == 64) {
> 		ch.max = nb_ts * 8 / width;
> 	} else {
> 		dev_err(dai->dev, "format physical width %u not supported\n", width);
> 		return -EINVAL;
> 	}
> 

Yes, indeed.
Will be changed in the next iteration.

Regards,
Hervé
