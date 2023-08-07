Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D77F77727B3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 16:28:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=LywQYvYZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKJZw1X7Fz3bcS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 00:28:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=LywQYvYZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.199; helo=relay9-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKJYz5L29z2xVn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 00:27:32 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A286EFF808;
	Mon,  7 Aug 2023 14:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691418448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nSKlAqEgzEsFnBW7d8u/9h1ZprRRwuRKRLFQ+P/wUY8=;
	b=LywQYvYZoJqcYSSsOLGqNNJCC9NtdSGpEXpSP7h89QnexEqHiRwsI7y1Fopm8khwM4Jado
	UYh+3ucNoG1TlHOxwycpd6wl86Ww1bH1aU60cma+N9WOR0OpLat30VEL6CeBvM4lykiuLw
	YTsewxWRSsSjNtpcSTDCC/w5lLkMGaNv7Xw1yRiyjXwkVqDQrnGE9qAK5QvgIhhrsRkXmb
	mp7wMTZO2Ss/rYbZR46XbfqZndue72KIO/PVTyaSLyZCXcr1LoUkH4LYGHzC6pgv3/FZsS
	y1yxUPZoU8Fr9gDi5km21Xjd+hZnD+9mY+D/84flAYhqMYAgZ0XHWK6gTENonw==
Date: Mon, 7 Aug 2023 16:27:21 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 24/28] pinctrl: Add support for the Lantic PEF2256
 pinmux
Message-ID: <20230807162721.56318743@bootlin.com>
In-Reply-To: <CACRpkdYXCQRd3ZXNGHwMaQYiJc7tGtAJnBaSh5O-8ruDAJVdiA@mail.gmail.com>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-25-herve.codina@bootlin.com>
	<CACRpkdYXCQRd3ZXNGHwMaQYiJc7tGtAJnBaSh5O-8ruDAJVdiA@mail.gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Linus,

On Mon, 7 Aug 2023 15:05:15 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> Hi Herve,
> 
> thanks for your patch!
> 
> First: is this patch something we could merge separately? I don't see
> any dependency on the other patches.

It depends on pef2256:
in drivers/pinctrl/Kconfig:
--- 8< ---
+config PINCTRL_PEF2256
+	tristate "Lantiq PEF2256 (FALC56) pin controller driver"
+	depends on OF && FRAMER_PEF2256
--- 8< ---
in drivers/pinctrl/pinctrl-pef2256.c
--- 8< ---
+#include <linux/framer/pef2256.h>
--- 8< ---

All the pef2256 it depends on is provided by
 path 23/28 "net: wan: framer: Add support for the Lantiq PEF2256 framer"

> 
> On Wed, Jul 26, 2023 at 5:04 PM Herve Codina <herve.codina@bootlin.com> wrote:
> 
> > The Lantiq PEF2256 is a framer and line interface component designed to
> > fulfill all required interfacing between an analog E1/T1/J1 line and the
> > digital PCM system highway/H.100 bus.
> >
> > This pinmux support handles the pin muxing part (pins RP(A..D) and pins
> > XP(A..D)) of the PEF2256.
> >
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> So it is a bridge chip? Please use that terminology since Linux
> DRM often talks about bridges.
> 
> > +++ b/drivers/pinctrl/pinctrl-pef2256-regs.h  
> (...)
> > +#include "linux/bitfield.h"  
> 
> Really? I don't think there is such a file there.
> 
> Do you mean <linux/bitfield.h> and does this even compile?

Yes and it compiles (even with quoted included file).
I will be changed to <linux/bitfield.h> in the next interation.

> 
> > diff --git a/drivers/pinctrl/pinctrl-pef2256.c b/drivers/pinctrl/pinctrl-pef2256.c  
> (...)
> > +struct pef2256_pinctrl {
> > +       struct device *dev;
> > +       struct regmap *regmap;
> > +       enum pef2256_version version;
> > +       struct {
> > +               struct pinctrl_desc pctrl_desc;
> > +               const struct pef2256_function_desc *functions;
> > +               unsigned int nfunctions;
> > +       } pinctrl;  
> 
> Uh anonymous struct... can't you just define the struct separately
> with a name? Or fold it into struct pef2256_pinctrl without the
> additional struct? Thanks.

I will fold it into struct pef2256_pinctrl in the next iteration.

Thanks
Hervé

> 
> Otherwise it looks neat!
> 
> Yours,
> Linus Walleij
