Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9AC927E96
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 23:33:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=S0JEVBhI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFVHb21wwz3cWN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2024 07:32:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=S0JEVBhI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.199; helo=relay9-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFVGr5Qrrz3c4W
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2024 07:32:17 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD86AFF802;
	Thu,  4 Jul 2024 21:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720128729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rey18xTlnMgOgIPL25ImB7B15sMWYzxAsvnHNthV5S0=;
	b=S0JEVBhI3tfc5ntPMObRrKKeyUXsGRrO+dmrSHHiA/CXiaTrDzUnuWN/8RLan/W8yEPBYy
	WTaC4P67s78ijbrvczP1KnuPtKQbrRcwlYEqUPZPpZW0nhX/siqNP/GhziUB79nYOQPi8r
	PhP0fpq9va52mSjevxSqg9gaf/S2Ukug9XtKh8mzSUYLpNZp80MAwL96mMkrYY7WNzzmay
	5AT/X7DCWHP8tVhsE6o3C1PHb0Q9g3z2DXN4uHMidHU5Rwoaz4Y/LepANuZA6Uuvs21L3L
	95mP/Ounvba0aITTStBPv4Esd+fhuzK/5YdBxhSIiG700JAP0NMtF9NGxcnshQ==
Date: Thu, 4 Jul 2024 23:31:55 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 00/20] Simplify of_property_for_each_u32()
Message-ID: <20240704233155.61b5323c@booty>
In-Reply-To: <20240703180742.GB1245093-robh@kernel.org>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
	<20240703180742.GB1245093-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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
Cc: Richard Leitner <richard.leitner@linux.dev>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pwm@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>, Uwe =?UTF-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Emilio =?UTF-8?Q?L=C3=B3pez?= <emilio@elopez.com.ar>, Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, "Peng
 Fan \(OSS\)" <peng.fan@oss.nxp.com>, linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Shawn Guo <shawnguo@kernel.org>, linux-sunxi@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Rob,

On Wed, 3 Jul 2024 12:07:42 -0600
Rob Herring <robh@kernel.org> wrote:

> On Wed, Jul 03, 2024 at 12:36:44PM +0200, Luca Ceresoli wrote:
> > [Note: to reduce the noise I have trimmed the get_maintainers list
> > manually. Should you want to be removed, or someone else added, to future
> > versions, just tell me. Sorry for the noise.]
> > 
> > This series aims at simplifying of_property_for_each_u32() as well as
> > making it more difficult to misuse it in the future.
> > 
> > The long-term goal is changing this pattern:
> > 
> >   struct property *prop;
> >   const __be32 *p;
> >   u32 val;
> >  
> >   of_property_for_each_u32(np, "xyz", prop, p, val) { ... }
> > 
> > to this:
> > 
> >   u32 val;
> > 
> >   of_property_for_each_u32(np, "xyz", val) { ... }
> > 
> > So, removing the 3rd and 4th arguments which are typically meant to be
> > internal. Those two parameters used to be unavoidable until the kernel
> > moved to building with the C11 standard unconditionally. Since then, it is
> > now possible to get rid of them. However a few users of
> > of_property_for_each_u32() do actually use those arguments, which
> > complicates the transition. For this reason this series does the following:
> > 
> >  * Add of_property_for_each_u32_new(), which does not have those two
> >    arguments (patch 1)
> >  * Convert _almost_ every usage to of_property_for_each_u32_new()
> >  * Rename of_property_for_each_u32() to of_property_for_each_u32_old() and
> >    deprecate it, as a incentive to code not (yet) in mainline to upgrade
> >    to the *_new() version (last patch)  
> 
> I don't really see the point of introducing the _old variant. Let's get 
> this done in one step.
> 
> > 
> > The plan for the next series is to additionally:
> > 
> >  * Convert the few remaining of_property_for_each_u32_old() instantes to
> >    of_property_for_each_u32_new()
> >  * Remove of_property_for_each_u32_old()
> >  * Rename of_property_for_each_u32_new() to of_property_for_each_u32()  
> 
> Honestly, I think there's few enough users we could just convert the 
> whole thing in one patch. It's all got to go thru 1 tree anyways. If 
> there's new cases in -next, then I'd be happy to send it to Linus at the 
> end of the merge window.

Sure, make sense. I'll need to convert the few remaining users, then
I'm sending a squashed v2.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
