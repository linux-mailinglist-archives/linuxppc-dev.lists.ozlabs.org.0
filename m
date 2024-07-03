Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCE29267C6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 20:08:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X3bpvJgx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDnny3tbpz3dX0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 04:08:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X3bpvJgx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDnnH3Jnfz3cb1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 04:07:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B6D6623B5;
	Wed,  3 Jul 2024 18:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2346AC2BD10;
	Wed,  3 Jul 2024 18:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720030063;
	bh=7VkdfXXbnQAAagurnl0t1uowHfXXxqv6JWqV5yzvHyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3bpvJgxZPWMXNOzcyielDafYLsorlGeMfGsYxZsE3DcfgNG38u+IpqkFauqV7JBb
	 5vrbm1WYc3A6PpB/BYRkykAD7OTF0Cj7mNGz1MOi0sa5ZMS/EgfduMIqZfBT2ojOEE
	 bFo2aTY3NN6jY868V+Ef+HPG5nwsrIILcL4gaARoEmQ/3VJxlw8KNvls5K1NJbvrcL
	 liQUqmGsYZrzJg5w0kk4/LvcK6Tdp62Zk7+kzOZ/GnWL+VAWuwzwfMk9DNJ/Cy73bN
	 +KSVQC/fntqBgC8EoMj80EdF4hoVvz6Kgpa3QHWVeUvUPp8LsLtGUtLPC5Ip21htEj
	 aLChwBO4AdEcA==
Date: Wed, 3 Jul 2024 12:07:42 -0600
From: Rob Herring <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 00/20] Simplify of_property_for_each_u32()
Message-ID: <20240703180742.GB1245093-robh@kernel.org>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
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
Cc: Richard Leitner <richard.leitner@linux.dev>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pwm@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>, linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Shawn Guo <shawnguo@kernel.org>, linux-sunxi@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 03, 2024 at 12:36:44PM +0200, Luca Ceresoli wrote:
> [Note: to reduce the noise I have trimmed the get_maintainers list
> manually. Should you want to be removed, or someone else added, to future
> versions, just tell me. Sorry for the noise.]
> 
> This series aims at simplifying of_property_for_each_u32() as well as
> making it more difficult to misuse it in the future.
> 
> The long-term goal is changing this pattern:
> 
>   struct property *prop;
>   const __be32 *p;
>   u32 val;
>  
>   of_property_for_each_u32(np, "xyz", prop, p, val) { ... }
> 
> to this:
> 
>   u32 val;
> 
>   of_property_for_each_u32(np, "xyz", val) { ... }
> 
> So, removing the 3rd and 4th arguments which are typically meant to be
> internal. Those two parameters used to be unavoidable until the kernel
> moved to building with the C11 standard unconditionally. Since then, it is
> now possible to get rid of them. However a few users of
> of_property_for_each_u32() do actually use those arguments, which
> complicates the transition. For this reason this series does the following:
> 
>  * Add of_property_for_each_u32_new(), which does not have those two
>    arguments (patch 1)
>  * Convert _almost_ every usage to of_property_for_each_u32_new()
>  * Rename of_property_for_each_u32() to of_property_for_each_u32_old() and
>    deprecate it, as a incentive to code not (yet) in mainline to upgrade
>    to the *_new() version (last patch)

I don't really see the point of introducing the _old variant. Let's get 
this done in one step.

> 
> The plan for the next series is to additionally:
> 
>  * Convert the few remaining of_property_for_each_u32_old() instantes to
>    of_property_for_each_u32_new()
>  * Remove of_property_for_each_u32_old()
>  * Rename of_property_for_each_u32_new() to of_property_for_each_u32()

Honestly, I think there's few enough users we could just convert the 
whole thing in one patch. It's all got to go thru 1 tree anyways. If 
there's new cases in -next, then I'd be happy to send it to Linus at the 
end of the merge window.

Rob
