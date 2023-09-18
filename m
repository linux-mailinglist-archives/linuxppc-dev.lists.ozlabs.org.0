Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABF97A44DC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 10:36:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=odhYABxa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rpynj6C7gz300q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 18:36:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=odhYABxa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.200; helo=relay7-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rpymn057lz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 18:35:50 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 447DF20004;
	Mon, 18 Sep 2023 08:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695026146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PIpUMSw/2404AMS4Yo5lxieSUrVtp4AW1CJFXc7BrJs=;
	b=odhYABxaRFjWsbpVj+xwjaWnzsTPysdiTFLNxA143gxz1iv0ARdos2si28g0FvPNRJfsf0
	igTTeSj9hOhAqT6WSZud7AhrNda9CqPeN5PToxzt17WLYZqrS7tcAk8lFN57RUn3qpNRhE
	axfLCMiY3kNHK6sZsERj4OZGA3JB2nhfkCfqOQC+MpQw43+dglF1J/3dgc4hzlfWktvcWT
	YpEl/Xnb2C0XOfhwkDTsXYka/KFGolot4npq0MbCNCidMtsN0Z0yYsupn3/3Xbc+g6cEOQ
	xEMnYzwq1m+uwdoUDuMZ5gO7ubkRx5I7/tiJ126KShCLAKMDSrnEnITmLJj8Rw==
Date: Mon, 18 Sep 2023 10:35:40 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 28/31] pinctrl: Add support for the Lantic PEF2256
 pinmux
Message-ID: <20230918103540.5902af4c@bootlin.com>
In-Reply-To: <CACRpkdbxdMZt4E1SF1v9as-jw=TpvS1mk2TQqAgywMBLbKaNoA@mail.gmail.com>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
	<20230912101505.225899-1-herve.codina@bootlin.com>
	<CACRpkdbxdMZt4E1SF1v9as-jw=TpvS1mk2TQqAgywMBLbKaNoA@mail.gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@kernel.org>, linuxppc-de
 v@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 12 Sep 2023 13:04:56 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> Hi Herve,
> 
> thanks for your patch!
> 
> On Tue, Sep 12, 2023 at 12:15 PM Herve Codina <herve.codina@bootlin.com> wrote:
> 
> > The Lantiq PEF2256 is a framer and line interface component designed to
> > fulfill all required interfacing between an analog E1/T1/J1 line and the
> > digital PCM system highway/H.100 bus.
> >
> > This kind of component can be found in old telecommunication system.
> > It was used to digital transmission of many simultaneous telephone calls
> > by time-division multiplexing. Also using HDLC protocol, WAN networks
> > can be reached through the framer.
> >
> > This pinmux support handles the pin muxing part (pins RP(A..D) and pins
> > XP(A..D)) of the PEF2256.
> >
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>  
> 
> Nice to see this as a proper pin control driver!
> 
> >  drivers/pinctrl/pinctrl-pef2256-regs.h |  65 ++++++
> >  drivers/pinctrl/pinctrl-pef2256.c      | 308 +++++++++++++++++++++++++  
> 
> Do you really need a separate header just for some registers?
> But it's a matter of taste so I'm not gonna complain if you want
> it this way.

Will be move to the .c file in the next iteration.

> 
> > +config PINCTRL_PEF2256
> > +       tristate "Lantiq PEF2256 (FALC56) pin controller driver"
> > +       depends on OF && FRAMER_PEF2256
> > +       select PINMUX  
> 
> select PINCONF

Will be added in the next iteration.

> 
> > +       select GENERIC_PINCONF  
> 
> This brings it in implicitly but I prefer that you just select it.
> 
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*  
> 
> I think SPDX mandates that you start the tag with C99 comments

Already replied by Mark, C style comment is correct -> No change.

> 
> // SPDX-License-Identifier: GPL-2.0-only
> 
> > +       /* We map 1 group <-> 1 pin */  
> 
> Also known as "the qualcomm trick", but hey: it's fine.
> 
> > +static int pef2256_register_pinctrl(struct pef2256_pinctrl *pef2256)
> > +{
> > +       struct pinctrl_dev      *pctrl;
> > +
> > +       pef2256->pctrl_desc.name    = dev_name(pef2256->dev);
> > +       pef2256->pctrl_desc.owner   = THIS_MODULE;
> > +       pef2256->pctrl_desc.pctlops = &pef2256_pctlops;
> > +       pef2256->pctrl_desc.pmxops  = &pef2256_pmxops;
> > +       if (pef2256->version == PEF2256_VERSION_1_2) {
> > +               pef2256->pctrl_desc.pins  = pef2256_v12_pins;
> > +               pef2256->pctrl_desc.npins = ARRAY_SIZE(pef2256_v12_pins);
> > +               pef2256->functions  = pef2256_v12_functions;
> > +               pef2256->nfunctions = ARRAY_SIZE(pef2256_v12_functions);
> > +       } else {
> > +               pef2256->pctrl_desc.pins  = pef2256_v2x_pins;
> > +               pef2256->pctrl_desc.npins = ARRAY_SIZE(pef2256_v2x_pins);
> > +               pef2256->functions  = pef2256_v2x_functions;
> > +               pef2256->nfunctions = ARRAY_SIZE(pef2256_v2x_functions);
> > +       }
> > +
> > +       pctrl = devm_pinctrl_register(pef2256->dev, &pef2256->pctrl_desc, pef2256);
> > +       if (IS_ERR(pctrl)) {
> > +               dev_err(pef2256->dev, "pinctrl driver registration failed\n");
> > +               return PTR_ERR(pctrl);
> > +       }
> > +
> > +       return 0;  
> 
> You could use
> return dev_err_probe(...);

Indeed, I will change.

> 
> > +       pef2256_reset_pinmux(pef2256_pinctrl);
> > +       ret = pef2256_register_pinctrl(pef2256_pinctrl);
> > +       if (ret)
> > +               return ret;  
> 
> Or you could use it down here.
> 
> With or without these changes (because they are nitpicks)
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Yours,
> Linus Walleij

Thanks for your comment.

Best regards,
Hervé
