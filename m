Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A04416735A8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 11:36:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyJvm3Ckhz3fF4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 21:36:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=fC3fckMC;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hvEphYX/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=fC3fckMC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hvEphYX/;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyJsl5Vc3z3fF1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 21:34:51 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 8B85238002;
	Thu, 19 Jan 2023 10:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674124488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vYHPclhiQzMVwKCYvpVGD/Ge/1sAj2seFNT67bApWA4=;
	b=fC3fckMClwX3NNRCLm1z8wmq7HZLuKi7FIkWVJARYfVF0r7NxW3X1p5aCO3f0C0KC7JB5v
	tp2hJ1D0PimjHSFPbJBQTaqml0SqgqrH6dL5qeyWOntqUAN3YSJO4mboeFfCCwzA1rmTQB
	JSkZnui+wTJIZzwyVKTg4obkt45OTM4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674124488;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vYHPclhiQzMVwKCYvpVGD/Ge/1sAj2seFNT67bApWA4=;
	b=hvEphYX/olY074SeyVLYARyiONJ9mUHoF2F5F1+gmtw+ka3ERQI/il+BpzZ0hRRcFM0om2
	zabiMC3pgWJiU+Cw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 1C4892C141;
	Thu, 19 Jan 2023 10:34:47 +0000 (UTC)
Date: Thu, 19 Jan 2023 11:34:46 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] of: Fix of platform build on powerpc due to bad of
 disaply code
Message-ID: <20230119103446.GO16547@kitsune.suse.cz>
References: <20230119095323.4659-1-msuchanek@suse.de>
 <8a9f7ba5-37a4-0927-4ab2-d212f1b098a9@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a9f7ba5-37a4-0927-4ab2-d212f1b098a9@csgroup.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "Erhard F." <erhard_f@mailbox.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Javier Martinez Canillas <javierm@redhat.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Frank Rowand <frowand.list@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, Jan 19, 2023 at 10:24:07AM +0000, Christophe Leroy wrote:
> 
> 
> Le 19/01/2023 à 10:53, Michal Suchanek a écrit :
> > The commit 2d681d6a23a1 ("of: Make of framebuffer devices unique")
> > breaks build because of wrong argument to snprintf. That certainly
> > avoids the runtime error but is not the intended outcome.
> > 
> > Also use standard device name format of-display.N for all created
> > devices.
> > 
> > Fixes: 2d681d6a23a1 ("of: Make of framebuffer devices unique")
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > ---
> > v2: Update the device name format
> > ---
> >   drivers/of/platform.c | 12 ++++++++----
> >   1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > index f2a5d679a324..8c1b1de22036 100644
> > --- a/drivers/of/platform.c
> > +++ b/drivers/of/platform.c
> > @@ -525,7 +525,9 @@ static int __init of_platform_default_populate_init(void)
> >   	if (IS_ENABLED(CONFIG_PPC)) {
> >   		struct device_node *boot_display = NULL;
> >   		struct platform_device *dev;
> > -		int display_number = 1;
> > +		int display_number = 0;
> > +		char buf[14];
> 
> Can you declare that in the for block where it is used instead ?

No, there are two for blocks.

> 
> > +		char *of_display_format = "of-display.%d";
> 
> Should be const ?

Yes, could be.

> 
> >   		int ret;
> >   
> >   		/* Check if we have a MacOS display without a node spec */
> > @@ -556,7 +558,10 @@ static int __init of_platform_default_populate_init(void)
> >   			if (!of_get_property(node, "linux,opened", NULL) ||
> >   			    !of_get_property(node, "linux,boot-display", NULL))
> >   				continue;
> > -			dev = of_platform_device_create(node, "of-display", NULL);
> > +			ret = snprintf(buf, sizeof(buf), of_display_format, display_number++);
> > +			if (ret >= sizeof(buf))
> > +				continue;
> 
> 
> Can you make buf big enough to avoid that ?

It would be a bit fragile that way.

The buffer would have to theoretically accomodate
"of-display.-9223372036854775808", and any change to the format requires
recalculating the length, by hand.

Of course, the memory would run out way before allocating that many
devices so it's kind of pointless to try and accomodate all possible
device numbers.

> 
> And by the way could it be called something else than 'buf' ?
> 
> See exemple here : 
> https://elixir.bootlin.com/linux/v6.1/source/drivers/fsi/fsi-occ.c#L690

Yes, that is quite possible. Nonetheless, just like 'ret' generic
variable names also work.

Thanks

Michal
