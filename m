Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF757650CB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 12:19:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=LGBKo4DD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBRZv3Rr1z3cHH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 20:19:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=LGBKo4DD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBRZ13L4kz3c6H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 20:18:46 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC9DF240009;
	Thu, 27 Jul 2023 10:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690453120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LVq3Vc2yDzDKpJTcAR2jA40+zkxL5sFVNMLQL+uihyc=;
	b=LGBKo4DDE6TlLK+r5fTDq47Or6GsDCPWtkuzd8m01djTnntuS1whrhZ2QA3u0laO3aepgx
	rqvLj+Dz26tpJXrON2TF+vdJS7VEZAS6u+braSD1zItS8ACXGXCV/HJOaMNzrJensddzRn
	vLkeJfbV+0di+euOuaVZ9CDsqgncSuKL4pqV/LzInvwOK9eMrHE2IPGs6TpoFGMtc3Dz9B
	NAq27nwXNI7xm0DLU67stWHWnZaGSrDO6Ja3XiR87FCrQfmbtK1KH4XzlWa31FCWcSeyP1
	ZOqjOi2BM6kZns8uVQmjpT0xj014mQnM1O+zGWPTUXUApK/CTHrOu0cc7swVyA==
Date: Thu, 27 Jul 2023 12:18:34 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 22/28] mfd: core: Ensure disabled devices are skiped
 without aborting
Message-ID: <20230727121834.475541d0@bootlin.com>
In-Reply-To: <20230727092209.GA8175@google.com>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-23-herve.codina@bootlin.com>
	<20230727092209.GA8175@google.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Takashi Iwai <tiwai@suse.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Lee,

On Thu, 27 Jul 2023 10:22:09 +0100
Lee Jones <lee@kernel.org> wrote:

> On Wed, 26 Jul 2023, Herve Codina wrote:
> 
> > The loop searching for a matching device based on its compatible
> > string is aborted when a matching disabled device is found.
> > This abort avoid to add devices as soon as one disabled device
> > is found.
> > 
> > Continue searching for an other device instead of aborting on the
> > first disabled one fixes the issue.
> > 
> > Fixes: 22380b65dc70 ("mfd: mfd-core: Ensure disabled devices are ignored without error")
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  drivers/mfd/mfd-core.c | 18 +++++++++++++-----
> >  1 file changed, 13 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
> > index 0ed7c0d7784e..bcc26e64639a 100644
> > --- a/drivers/mfd/mfd-core.c
> > +++ b/drivers/mfd/mfd-core.c
> > @@ -146,6 +146,7 @@ static int mfd_add_device(struct device *parent, int id,
> >  	struct platform_device *pdev;
> >  	struct device_node *np = NULL;
> >  	struct mfd_of_node_entry *of_entry, *tmp;
> > +	bool disabled;
> >  	int ret = -ENOMEM;
> >  	int platform_id;
> >  	int r;
> > @@ -181,13 +182,13 @@ static int mfd_add_device(struct device *parent, int id,
> >  		goto fail_res;
> >  
> >  	if (IS_ENABLED(CONFIG_OF) && parent->of_node && cell->of_compatible) {
> > +		disabled = false;  
> 
> This does not appear to reside in a loop.
> 
> Why not set it to false on declaration?

Indeed, I will change in the next iteration and set the value to false at
the declaration.

> 
> >  		for_each_child_of_node(parent->of_node, np) {
> >  			if (of_device_is_compatible(np, cell->of_compatible)) {
> > -				/* Ignore 'disabled' devices error free */
> > +				/* Skip 'disabled' devices */
> >  				if (!of_device_is_available(np)) {
> > -					of_node_put(np);  
> 
> Doesn't this result in a resource leak?

No because we change from 'goto fail_alias' to 'continue' and so we don't
exit from the for_each_child_of_node().
The for_each_child_of_node() calls of_get_next_child() and, in turn, calls
of_node_put().

Regards,
Hervé

> 
> > -					ret = 0;
> > -					goto fail_alias;
> > +					disabled = true;
> > +					continue;
> >  				}
> >  
> >  				ret = mfd_match_of_node_to_dev(pdev, np, cell);
> > @@ -197,10 +198,17 @@ static int mfd_add_device(struct device *parent, int id,
> >  				if (ret)
> >  					goto fail_alias;
> >  
> > -				break;
> > +				goto match;
> >  			}
> >  		}
> >  
> > +		if (disabled) {
> > +			/* Ignore 'disabled' devices error free */
> > +			ret = 0;
> > +			goto fail_alias;
> > +		}
> > +
> > +match:
> >  		if (!pdev->dev.of_node)
> >  			pr_warn("%s: Failed to locate of_node [id: %d]\n",
> >  				cell->name, platform_id);
> > -- 
> > 2.41.0
> >   
> 

