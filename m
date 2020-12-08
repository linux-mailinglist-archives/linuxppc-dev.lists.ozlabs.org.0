Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9570F2D3079
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 18:04:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr63L40FNzDqCb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 04:04:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=elvis.franken.de (client-ip=193.175.24.41; helo=elvis.franken.de;
 envelope-from=tsbogend@alpha.franken.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=alpha.franken.de
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Cr5zX0bTMzDqfC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 04:00:46 +1100 (AEDT)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1kmgLm-0006Gx-00; Tue, 08 Dec 2020 18:00:30 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 909BFC0331; Tue,  8 Dec 2020 18:00:21 +0100 (CET)
Date: Tue, 8 Dec 2020 18:00:21 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 0/5] drop unused BACKLIGHT_GENERIC option
Message-ID: <20201208170021.GA6168@alpha.franken.de>
References: <20201201222922.3183-1-andrey.zhizhikin@leica-geosystems.com>
 <160744514229.359082.11487352663734358657.b4-ty@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160744514229.359082.11487352663734358657.b4-ty@arndb.de>
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
Cc: alexandre.belloni@bootlin.com, sam@ravnborg.org, tony@atomide.com,
 linux-kernel@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 wens@csie.org, thierry.reding@gmail.com, paulus@samba.org, will@kernel.org,
 daniel.thompson@linaro.org, deller@gmx.de, linux@armlinux.org.uk,
 krzk@kernel.org, jonathanh@nvidia.com, ludovic.desroches@microchip.com,
 catalin.marinas@arm.com, linux-mips@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, mripard@kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>, soc@kernel.org,
 linux-tegra@vger.kernel.org, lee.jones@linaro.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jernej.skrabec@siol.net,
 linux-parisc@vger.kernel.org, emil.l.velikov@gmail.com,
 nicolas.ferre@microchip.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 08, 2020 at 05:34:46PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> On Tue, 1 Dec 2020 22:29:17 +0000, Andrey Zhizhikin wrote:
> > Since the removal of generic_bl driver from the source tree in commit
> > 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> > unused") BACKLIGHT_GENERIC config option became obsolete as well and
> > therefore subject to clean-up from all configuration files.
> > 
> > This series introduces patches to address this removal, separated by
> > architectures in the kernel tree.
> > 
> > [...]
> 
> While my plan was to only take the arm specific patches, it seems
> nobody else has applied the other architecture specific ones,
> but there have been a lot of Acks. Also, b4 makes it easy to
> merge the entire branch, so I'll just take all of these.
> 
> Applied to arm/defconfig, thanks!
> 
> [1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
>       commit: 0437141b4e2233ae0109a9584e7a003cd05b0a20
> [2/5] arm64: defconfig: drop unused BACKLIGHT_GENERIC option
>       commit: 717c4c8336486781630893508b3347ae18953fae
> [3/5] MIPS: configs: drop unused BACKLIGHT_GENERIC option
>       commit: 2257682282531de45929c6006152f6e2ee881b42

this one is already in mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
