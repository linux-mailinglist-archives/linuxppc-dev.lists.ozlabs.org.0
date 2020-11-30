Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3632C8DE8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 20:20:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClFSR2WMrzDqc5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 06:20:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ravnborg.org
 (client-ip=109.247.116.14; helo=asavdk3.altibox.net;
 envelope-from=sam@ravnborg.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ravnborg.org
X-Greylist: delayed 436 seconds by postgrey-1.36 at bilbo;
 Tue, 01 Dec 2020 06:19:07 AEDT
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClFQg1ZVwzDqbx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 06:19:07 +1100 (AEDT)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D0E7B2001F;
 Mon, 30 Nov 2020 20:11:34 +0100 (CET)
Date: Mon, 30 Nov 2020 20:11:33 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Subject: Re: [PATCH 0/5] drop unused BACKLIGHT_GENERIC option
Message-ID: <20201130191133.GA1565464@ravnborg.org>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=RN8nFXG3PNPgSL11oioA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
 krzk@kernel.org, jonathanh@nvidia.com, ludovic.desroches@microchip.com,
 catalin.marinas@arm.com, linux-mips@vger.kernel.org, will@kernel.org,
 mripard@kernel.org, linux-tegra@vger.kernel.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, jernej.skrabec@siol.net,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 emil.l.velikov@gmail.com, nicolas.ferre@microchip.com,
 Olof Johansson <olof@lixom.net>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 30, 2020 at 03:21:32PM +0000, Andrey Zhizhikin wrote:
> Since the removal of generic_bl driver from the source tree in commit
> 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> unused") BACKLIGHT_GENERIC config option became obsolete as well and
> therefore subject to clean-up from all configuration files.
> 
> This series introduces patches to address this removal, separated by
> architectures in the kernel tree.
> 
> Andrey Zhizhikin (5):
>   ARM: configs: drop unused BACKLIGHT_GENERIC option
>   arm64: defconfig: drop unused BACKLIGHT_GENERIC option
>   MIPS: configs: drop unused BACKLIGHT_GENERIC option
>   parisc: configs: drop unused BACKLIGHT_GENERIC option
>   powerpc/configs: drop unused BACKLIGHT_GENERIC option

For defconfigs I expect arch maintainers to do a make xxxdefconfig / make
savedefconfig / cp defconfig ... run now and then - this will remove
all such symbols.

If the patches goes in like they are submitted then:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> 
>  arch/arm/configs/at91_dt_defconfig          | 1 -
>  arch/arm/configs/cm_x300_defconfig          | 1 -
>  arch/arm/configs/colibri_pxa300_defconfig   | 1 -
>  arch/arm/configs/jornada720_defconfig       | 1 -
>  arch/arm/configs/magician_defconfig         | 1 -
>  arch/arm/configs/mini2440_defconfig         | 1 -
>  arch/arm/configs/omap2plus_defconfig        | 1 -
>  arch/arm/configs/pxa3xx_defconfig           | 1 -
>  arch/arm/configs/qcom_defconfig             | 1 -
>  arch/arm/configs/sama5_defconfig            | 1 -
>  arch/arm/configs/sunxi_defconfig            | 1 -
>  arch/arm/configs/tegra_defconfig            | 1 -
>  arch/arm/configs/u8500_defconfig            | 1 -
>  arch/arm64/configs/defconfig                | 1 -
>  arch/mips/configs/gcw0_defconfig            | 1 -
>  arch/mips/configs/gpr_defconfig             | 1 -
>  arch/mips/configs/lemote2f_defconfig        | 1 -
>  arch/mips/configs/loongson3_defconfig       | 1 -
>  arch/mips/configs/mtx1_defconfig            | 1 -
>  arch/mips/configs/rs90_defconfig            | 1 -
>  arch/parisc/configs/generic-64bit_defconfig | 1 -
>  arch/powerpc/configs/powernv_defconfig      | 1 -
>  22 files changed, 22 deletions(-)
> 
> 
> base-commit: b65054597872ce3aefbc6a666385eabdf9e288da
> prerequisite-patch-id: bfd382cf1dc021d20204f10ea9403319c1c32b12
> prerequisite-patch-id: 5397c0c8648bb3e0b830207ea867138c11c6e644
> prerequisite-patch-id: a3c284dff5fe6d02828918a886db6a8ed3197e20
> -- 
> 2.17.1
