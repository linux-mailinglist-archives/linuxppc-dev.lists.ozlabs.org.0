Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 837B66951BD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 21:18:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFwdH3083z3c3w
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 07:18:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WPZqmvff;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WPZqmvff;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFwcN1PHhz3Wtr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 07:17:24 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EB6B1B81909;
	Mon, 13 Feb 2023 20:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F11C4339C;
	Mon, 13 Feb 2023 20:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676319438;
	bh=+ov1IKoCTOaJSuscjijW4FneyMOAtU2ocacidL8uLO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WPZqmvffbWatcePstvpSuvWBpKutSLY0XVmjxuNZJe02BL4L9Pn0cm/lA4Nzb3BW+
	 3Pl0sKhpgfPfj8SzouF/F3eN93k69UnQId0rHT420HItVyuY1SJYJpiUITtc//q+Yj
	 9WUH7QTC7lVB+d7B2XH+jlvjswLqpP7AEi7YGSmYkpeMEPS1Dt5fWMuFQyi4ZVO/Uf
	 Cu9WSvpk81emKbYzaBoMO0dkDPv7kJZ63Gb+yBZsOuS8HLs7sm1Vp7ZH8WEoEoVhfu
	 1is5S1K7oNwUgaVB1ZKN/74FQhQNZ+/tM96CTMlyv4kjqVZkDnT57arizFZxy3czo2
	 dgBLbA5oS5IUA==
Received: by pali.im (Postfix)
	id E7EA8687; Mon, 13 Feb 2023 21:17:15 +0100 (CET)
Date: Mon, 13 Feb 2023 21:17:15 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 4/8] powerpc/85xx: p2020: Move i8259 code into own
 function
Message-ID: <20230213201715.at64fowda2xgertt@pali>
References: <20221224211425.14983-1-pali@kernel.org>
 <20221224211425.14983-5-pali@kernel.org>
 <0953ffd2-dddc-2706-66ab-d6913eff19df@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0953ffd2-dddc-2706-66ab-d6913eff19df@csgroup.eu>
User-Agent: NeoMutt/20180716
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
Cc: Sinan Akman <sinan@writeme.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Scott Wood <oss@buserror.net>, Martin Kennedy <hurricos@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 13 February 2023 20:06:27 Christophe Leroy wrote:
> 
> 
> Le 24/12/2022 à 22:14, Pali Rohár a écrit :
> > Splits mpic and i8259 initialization codes into separate functions.
> > 
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > ---
> >   arch/powerpc/platforms/85xx/p2020.c | 37 ++++++++++++++++-------------
> >   1 file changed, 21 insertions(+), 16 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/85xx/p2020.c b/arch/powerpc/platforms/85xx/p2020.c
> > index d65d4c88ac47..b8584bf307b0 100644
> > --- a/arch/powerpc/platforms/85xx/p2020.c
> > +++ b/arch/powerpc/platforms/85xx/p2020.c
> > @@ -45,6 +45,7 @@
> >   #ifdef CONFIG_MPC85xx_DS
> >   
> >   #ifdef CONFIG_PPC_I8259
> > +
> >   static void mpc85xx_8259_cascade(struct irq_desc *desc)
> >   {
> >   	struct irq_chip *chip = irq_desc_get_chip(desc);
> > @@ -55,27 +56,13 @@ static void mpc85xx_8259_cascade(struct irq_desc *desc)
> >   	}
> >   	chip->irq_eoi(&desc->irq_data);
> >   }
> > -#endif	/* CONFIG_PPC_I8259 */
> >   
> > -static void __init mpc85xx_ds_pic_init(void)
> > +static void __init mpc85xx_8259_init(void)
> >   {
> > -	struct mpic *mpic;
> > -#ifdef CONFIG_PPC_I8259
> >   	struct device_node *np;
> >   	struct device_node *cascade_node = NULL;
> >   	int cascade_irq;
> > -#endif
> > -
> > -	mpic = mpic_alloc(NULL, 0,
> > -		  MPIC_BIG_ENDIAN |
> > -		  MPIC_SINGLE_DEST_CPU,
> > -		0, 256, " OpenPIC  ");
> > -
> > -	BUG_ON(mpic == NULL);
> > -	mpic_init(mpic);
> >   
> > -#ifdef CONFIG_PPC_I8259
> > -	/* Initialize the i8259 controller */
> >   	for_each_node_by_type(np, "interrupt-controller")
> >   	    if (of_device_is_compatible(np, "chrp,iic")) {
> >   		cascade_node = np;
> > @@ -93,13 +80,31 @@ static void __init mpc85xx_ds_pic_init(void)
> >   		return;
> >   	}
> >   
> > -	DBG("mpc85xxds: cascade mapped to irq %d\n", cascade_irq);
> > +	DBG("i8259: cascade mapped to irq %d\n", cascade_irq);
> >   
> >   	i8259_init(cascade_node, 0);
> >   	of_node_put(cascade_node);
> >   
> >   	irq_set_chained_handler(cascade_irq, mpc85xx_8259_cascade);
> > +}
> > +
> >   #endif	/* CONFIG_PPC_I8259 */
> > +
> > +static void __init mpc85xx_ds_pic_init(void)
> > +{
> > +	struct mpic *mpic;
> > +
> > +	mpic = mpic_alloc(NULL, 0,
> > +		  MPIC_BIG_ENDIAN |
> > +		  MPIC_SINGLE_DEST_CPU,
> > +		0, 256, " OpenPIC  ");
> > +
> > +	BUG_ON(mpic == NULL);
> > +	mpic_init(mpic);
> > +
> > +#ifdef CONFIG_PPC_I8259
> 
> Ca we minimise number of #ifdef CONFIG_PPC_I8259 by using 
> IS_ENABLED(CONFIG_PPC_I8259) inside if/else ?
> 
> > +	mpc85xx_8259_init();
> > +#endif

Ok, I can change code to:

+if (IS_ENABLED(CONFIG_PPC_I8259))
+    mpc85xx_8259_init();

I guess it should be equivalent.

> >   }
> >   
> >   #ifdef CONFIG_PCI
