Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F672C8FCA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 22:17:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClJ3Z4pSmzDqgP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 08:17:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ravnborg.org
 (client-ip=109.247.116.14; helo=asavdk3.altibox.net;
 envelope-from=sam@ravnborg.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ravnborg.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClJ1n3Yd5zDqdX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 08:16:11 +1100 (AEDT)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 9E5652001F;
 Mon, 30 Nov 2020 22:16:01 +0100 (CET)
Date: Mon, 30 Nov 2020 22:16:00 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 0/5] drop unused BACKLIGHT_GENERIC option
Message-ID: <20201130211600.GA1779005@ravnborg.org>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130191133.GA1565464@ravnborg.org>
 <20201130202501.GA32878@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130202501.GA32878@kozik-lap>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=Yxuugev4iBag0mAJ72kA:9 a=CjuIK1q_8ugA:10
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
Cc: alexandre.belloni@bootlin.com, tony@atomide.com,
 linux-kernel@vger.kernel.org, James.Bottomley@hansenpartnership.com,
 thierry.reding@gmail.com, paulus@samba.org, lee.jones@linaro.org,
 daniel.thompson@linaro.org, linux-omap@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, deller@gmx.de, linux@armlinux.org.uk,
 jonathanh@nvidia.com, ludovic.desroches@microchip.com, catalin.marinas@arm.com,
 linux-mips@vger.kernel.org, will@kernel.org, mripard@kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 linux-tegra@vger.kernel.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, jernej.skrabec@siol.net,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 emil.l.velikov@gmail.com, nicolas.ferre@microchip.com,
 Olof Johansson <olof@lixom.net>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,
On Mon, Nov 30, 2020 at 10:25:01PM +0200, Krzysztof Kozlowski wrote:
> On Mon, Nov 30, 2020 at 08:11:33PM +0100, Sam Ravnborg wrote:
> > On Mon, Nov 30, 2020 at 03:21:32PM +0000, Andrey Zhizhikin wrote:
> > > Since the removal of generic_bl driver from the source tree in commit
> > > 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> > > unused") BACKLIGHT_GENERIC config option became obsolete as well and
> > > therefore subject to clean-up from all configuration files.
> > > 
> > > This series introduces patches to address this removal, separated by
> > > architectures in the kernel tree.
> > > 
> > > Andrey Zhizhikin (5):
> > >   ARM: configs: drop unused BACKLIGHT_GENERIC option
> > >   arm64: defconfig: drop unused BACKLIGHT_GENERIC option
> > >   MIPS: configs: drop unused BACKLIGHT_GENERIC option
> > >   parisc: configs: drop unused BACKLIGHT_GENERIC option
> > >   powerpc/configs: drop unused BACKLIGHT_GENERIC option
> > 
> > For defconfigs I expect arch maintainers to do a make xxxdefconfig / make
> > savedefconfig / cp defconfig ... run now and then - this will remove
> > all such symbols.
> 
> savedefconfig can be tricky because of risk of loosing options:
> 1. it will remove options which became the default or became selected,
> 2. later when the default is changed or selecting option is removed, the
>    first option from #1 will not be brought back.
> 
> This was already for example with DEBUG_FS and the conclusion that time
> was - do not run savedefconfig automatically.
> 
> Therefore if some symbol(s) can be safely removed, patch is welcomed.

Thanks for letting me know, I have missed that discussion and
was obviously not aware.
I already acked'ed the patches and hope the soc people will pick them
up.

	Sam
