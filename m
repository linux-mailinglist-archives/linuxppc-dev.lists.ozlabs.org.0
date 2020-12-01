Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF812CA755
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 16:43:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Clmbb60GyzDqGk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 02:43:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=bootlin.com
X-Greylist: delayed 86639 seconds by postgrey-1.36 at bilbo;
 Wed, 02 Dec 2020 02:42:01 AEDT
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClmYj0Z14zDqB4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 02:41:51 +1100 (AEDT)
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr
 [86.194.74.19]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 533AA240006;
 Tue,  1 Dec 2020 15:41:39 +0000 (UTC)
Date: Tue, 1 Dec 2020 16:41:39 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
Message-ID: <20201201154139.GF2401593@piout.net>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130152137.24909-2-andrey.zhizhikin@leica-geosystems.com>
 <20201130185227.GA29434@kozik-lap>
 <AM6PR06MB4691EC52BA41B86AB16EE14FA6F50@AM6PR06MB4691.eurprd06.prod.outlook.com>
 <20201201144052.GE31404@gaia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201144052.GE31404@gaia>
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
Cc: "tony@atomide.com" <tony@atomide.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@hansenpartnership.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "paulus@samba.org" <paulus@samba.org>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "deller@gmx.de" <deller@gmx.de>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 arm@kernel.org, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "will@kernel.org" <will@kernel.org>, "mripard@kernel.org" <mripard@kernel.org>,
 ZHIZHIKIN Andrey <andrey.zhizhikin@leica-geosystems.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>, "wens@csie.org" <wens@csie.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 Olof Johansson <olof@lixom.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/12/2020 14:40:53+0000, Catalin Marinas wrote:
> On Mon, Nov 30, 2020 at 07:50:25PM +0000, ZHIZHIKIN Andrey wrote:
> > From Krzysztof Kozlowski <krzk@kernel.org>:
> > > On Mon, Nov 30, 2020 at 03:21:33PM +0000, Andrey Zhizhikin wrote:
> > > > Commit 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> > > > unused") removed geenric_bl driver from the tree, together with
> > > > corresponding config option.
> > > >
> > > > Remove BACKLIGHT_GENERIC config item from all ARM configurations.
> > > >
> > > > Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it
> > > > is unused")
> > > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > > Signed-off-by: Andrey Zhizhikin
> > > > <andrey.zhizhikin@leica-geosystems.com>
> > > > ---
> > > >  arch/arm/configs/at91_dt_defconfig        | 1 -
> > > >  arch/arm/configs/cm_x300_defconfig        | 1 -
> > > >  arch/arm/configs/colibri_pxa300_defconfig | 1 -
> > > >  arch/arm/configs/jornada720_defconfig     | 1 -
> > > >  arch/arm/configs/magician_defconfig       | 1 -
> > > >  arch/arm/configs/mini2440_defconfig       | 1 -
> > > >  arch/arm/configs/omap2plus_defconfig      | 1 -
> > > >  arch/arm/configs/pxa3xx_defconfig         | 1 -
> > > >  arch/arm/configs/qcom_defconfig           | 1 -
> > > >  arch/arm/configs/sama5_defconfig          | 1 -
> > > >  arch/arm/configs/sunxi_defconfig          | 1 -
> > > >  arch/arm/configs/tegra_defconfig          | 1 -
> > > >  arch/arm/configs/u8500_defconfig          | 1 -
> > > >  13 files changed, 13 deletions(-)
> > > 
> > > You need to send it to arm-soc maintainers, otherwise no one might feel
> > > responsible enough to pick it up.
> > 
> > Good point, thanks a lot!
> > 
> > I was not aware of the fact that there is a separate ML that should
> > receive patches targeted ARM SOCs. Can you (or anyone else) please
> > share it, so I can re-send it there as well?
> 
> It's not a mailing list as such (with archives etc.), just an alias to
> the arm-soc maintainers: arm@kernel.org.
> 
> > > Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > 
> > > +CC Arnd and Olof,
> > > 
> > > Dear Arnd and Olof,
> > > 
> > > Maybe it is worth to add arm-soc entry to the MAINTAINERS file?
> > > Otherwise how one could get your email address? Not mentioning the
> > > secret-soc address. :)
> 
> I tried to convince them before, it didn't work. I guess they don't like
> to be spammed ;).

The first rule of arm-soc is: you do not talk about arm@ and soc@

> Or rather, SoC-specific patches, even to defconfig,
> should go through the specific SoC maintainers. However, there are
> occasional defconfig patches which are more generic or affecting
> multiple SoCs. I just ignore them as the arm64 defconfig is usually
> handled by the arm-soc folk (when I need a defconfig change, I go for
> arch/arm64/Kconfig directly ;)).
> 

IIRC, the plan was indeed to get defconfig changes through the platform
sub-trees. It is also supposed to be how multi_v5 and multi_v7 are
handled and they will take care of the merge.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
