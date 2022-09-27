Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F975ED247
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 02:55:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McdMl1d0tz3c65
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 10:55:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=oDLkAAZA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=oDLkAAZA;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McK2s1lNXz3bm6;
	Tue, 27 Sep 2022 22:40:03 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C8C1BB81BBB;
	Tue, 27 Sep 2022 12:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15663C433C1;
	Tue, 27 Sep 2022 12:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664282397;
	bh=37yDCTtTXKSMe/LNxUNskIHnOhgXH3MxP0BfzMXipSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oDLkAAZAK9fwuZt7LKXM8ftnzMYuqEX16TQ7tEzyFmrIv30ofSaafC4Y6LcrceyD7
	 V+zHm07PGvSaenwVeBW7ozfKT0qc6eaS4RIQDezd00apiD/wzViERNkpjWxNMuSu3T
	 TKNCo/J23ajBzpoO84jGyHvI9aryn0jwbsbvfsIQ=
Date: Tue, 27 Sep 2022 14:39:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 0/2] Fix console probe delay when stdout-path isn't set
Message-ID: <YzLvGXjP8+W0X/1s@kroah.com>
References: <20220701012647.2007122-1-saravanak@google.com>
 <YwS5J3effuHQJRZ5@kroah.com>
 <CAOesGMivJ5Q-jdeGKw32yhjmNiYctHjpEAnoMMRghYqWD2m2tw@mail.gmail.com>
 <YygsEtxKz8dsEstc@kroah.com>
 <CAOesGMh5GHCONTQ9M1Ro7zW-hkL_1F7Xt=xRV0vYSfPY=7LYkQ@mail.gmail.com>
 <CAL_JsqK7auA8coB3DCqSDKw1ept_yQihVs-Me3bvU923os23xg@mail.gmail.com>
 <YzLp9yXgoJmy5YU8@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzLp9yXgoJmy5YU8@smile.fi.intel.com>
X-Mailman-Approved-At: Wed, 28 Sep 2022 10:50:40 +1000
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
Cc: andrew lunn <andrew@lunn.ch>, peng fan <peng.fan@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linus walleij <linus.walleij@linaro.org>, Paul Mackerras <paulus@samba.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Korsgaard <jacmet@sunsite.dk>, linux-stm32@st-md-mailman.stormreply.com, Karol Gugala <kgugala@antmicro.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, Hammer Hsieh <hammerh0314@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Vineet Gupta <vgupta@kernel.org>, len brown <len.brown@intel.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org, Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Claudiu Beznea <claudiu.beznea
 @microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, pavel machek <pavel@ucw.cz>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, eric dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>, sascha hauer <sha@pengutronix.de>, Saravana Kannan <saravanak@google.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>, Tobias Klauser <tklauser@distanz.ch>, linux-mips@vger.kernel.org, kernel-team@android.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, Olof Johansson <olof@lixom.net>, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Andreas Farber <afaerber@suse.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Pali Rohar <pali@kernel.org>, heiner kallweit <hkallweit1@gmail.com>, ulf hanss
 on <ulf.hansson@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Al Cooper <alcooperx@gmail.com>, linux-tegra@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>, Jiri Slaby <jirislaby@kernel.org>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Mateusz Holenko <mholenko@antmicro.com>, Alexander Shiyan <shc_work@mail.ru>, kevin hilman <khilman@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>, paolo abeni <pabeni@redhat.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-snps-arc@lists.infradead.org, Timur Tabi <timur@kernel.org>, hideaki yoshifuji <yoshfuji@linux-ipv6.org>, iommu@lists.linux-foundation.org, Laxman Dewangan <ldewangan@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>, Baolin Wang <baolin
 .wang7@gmail.com>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Baruch Siach <baruch@tkos.co.il>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Paul Cercueil <paul@crapouillou.net>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, joerg roedel <joro@8bytes.org>, Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>, linux-serial@vger.kernel.org, jakub kicinski <kuba@kernel.org>, will deacon <will@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Taichi Sugaya <sugaya.taichi@socionext.com>, netdev@vger.kernel.org, david ahern <dsahern@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, P
 almer Dabbelt <palmer@dabbelt.com>, Takao Orito <orito.takao@socionext.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 27, 2022 at 03:17:59PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 26, 2022 at 01:25:05PM -0500, Rob Herring wrote:
> > On Mon, Sep 19, 2022 at 5:56 PM Olof Johansson <olof@lixom.net> wrote:
> > >
> > > On Mon, Sep 19, 2022 at 1:44 AM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Sun, Sep 18, 2022 at 08:44:27PM -0700, Olof Johansson wrote:
> > > > > On Tue, Aug 23, 2022 at 8:37 AM Greg Kroah-Hartman
> > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Thu, Jun 30, 2022 at 06:26:38PM -0700, Saravana Kannan wrote:
> > > > > > > These patches are on top of driver-core-next.
> > > > > > >
> > > > > > > Even if stdout-path isn't set in DT, this patch should take console
> > > > > > > probe times back to how they were before the deferred_probe_timeout
> > > > > > > clean up series[1].
> > > > > >
> > > > > > Now dropped from my queue due to lack of a response to other reviewer's
> > > > > > questions.
> > > > >
> > > > > What happened to this patch? I have a 10 second timeout on console
> > > > > probe on my SiFive Unmatched, and I don't see this flag being set for
> > > > > the serial driver. In fact, I don't see it anywhere in-tree. I can't
> > > > > seem to locate another patchset from Saravana around this though, so
> > > > > I'm not sure where to look for a missing piece for the sifive serial
> > > > > driver.
> > > > >
> > > > > This is the second boot time regression (this one not fatal, unlike
> > > > > the Layerscape PCIe one) from the fw_devlink patchset.
> > > > >
> > > > > Greg, can you revert the whole set for 6.0, please? It's obviously
> > > > > nowhere near tested enough to go in and I expect we'll see a bunch of
> > > > > -stable fixups due to this if we let it remain in.
> > > >
> > > > What exactly is "the whole set"?  I have the default option fix queued
> > > > up and will send that to Linus later this week (am traveling back from
> > > > Plumbers still), but have not heard any problems about any other issues
> > > > at all other than your report.
> > >
> > > I stand corrected in this case, the issue on the Hifive Unmatched was
> > > a regression due to a PWM clock change -- I just sent a patch for that
> > > (serial driver fix).
> > >
> > > So it seems like as long as the fw_devlink.strict=1 patch is reverted,
> > > things are back to a working state here.
> > >
> > > I still struggle with how the fw_devlink patchset is expected to work
> > > though, since DT is expected to describe the hardware configuration,
> > > and it has no knowledge of whether there are drivers that will be
> > > bound to any referenced supplier devnodes. It's not going to work well
> > > to assume that they will always be bound, and to add 10 second
> > > timeouts for those cases isn't a good solution. Seems like the number
> > > of special cases will keep adding up.
> > 
> > Since the introduction of deferred probe, the kernel has always
> > assumed if there is a device described, then there is or will be a
> > driver for it. The result is you can't use new DTs (if they add
> > providers) with older kernels.
> > 
> > We've ended up with a timeout because no one has come up with a better
> > way to handle it. What the kernel needs is userspace saying "I'm done
> > loading modules", but it's debatable whether that's a good solution
> > too.
> 
> In my opinion the deferred probe is a big hack and that is the root
> cause of the issues we have here and there. It has to be redesigned
> to be mathematically robust. It was an attempt by Andrzej Hajda to
> solve this [1].
> 
> [1]: https://events19.linuxfoundation.org/wp-content/uploads/2017/12/Deferred-Problem-Issues-With-Complex-Dependencies-Between-Devices-in-Linux-Kernel-Andrzej-Hajda-Samsung.pdf

deferred probe has _ALWAYS_ been known to be a hack, way back when we
accepted it, but it was the best hack we had to solve a real problem
that we had, so it was accepted.

It's been polished over the years, but yes, it does break down at times,
due to the crazy complexity of hardware systems that we have no control
over.

If you have concrete solutions for how to solve the issue, wonderful,
please submit patches :)

thanks,

greg k-h
