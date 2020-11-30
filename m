Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A15622C8D4C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 19:54:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClDst4WGpzDqSH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 05:54:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.67; helo=mail-wr1-f67.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClDr34S5DzDqN5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 05:52:34 +1100 (AEDT)
Received: by mail-wr1-f67.google.com with SMTP id 64so17594262wra.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 10:52:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GEH2GiLihB/we0wTKIA4s4JgPz0UXo9ohOBmB1H6nPM=;
 b=r9c0A4ZQfaCDg0YDcnMBcOqE9dH1wZ37QsrP/KAbeoIKtdRjbcu7QxrXOgoH8eE+W3
 +tOhL0ZRHHRAQi5E5hdj3CvSNWtosAYRt/18uLcemPHctop20YZFlS5/bp7kf5Sb0gd9
 wYHV4yfOQRM0IWKdeddgDcgBbmjJqdf/mekRoq1Y+MsyQH2LJThSRpaAEdpqEw8nJ5lo
 YiVS+e7plpsYjGB/HGQ4aBXY7J+4wak9cmhsPW619TiBbRzX5qkG0Yp7LVz9m/HMQUxx
 tvJCCWG9bueRvkJXKMSPvNG58WqzPGukXMF0Dhp1TrIlvbcPTP67q0SXMJ3/75KLGgai
 FGog==
X-Gm-Message-State: AOAM530+CkpSQ6TChcn+6bEtrbu8KV+JDzf27vdz9atSdj982GwDQ+TG
 G1P7pag1qebh9pMi/qqoEm0=
X-Google-Smtp-Source: ABdhPJz821U/zJI64E/s1m2nEjCfNrUEUrLV+rXCVRdKBs+Xe9IzhenHRej5zcolpGNDRBBoo4I2dA==
X-Received: by 2002:adf:f9c4:: with SMTP id w4mr29689107wrr.64.1606762350398; 
 Mon, 30 Nov 2020 10:52:30 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id q25sm258812wmq.37.2020.11.30.10.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 10:52:29 -0800 (PST)
Date: Mon, 30 Nov 2020 20:52:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Subject: Re: [PATCH 1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
Message-ID: <20201130185227.GA29434@kozik-lap>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130152137.24909-2-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130152137.24909-2-andrey.zhizhikin@leica-geosystems.com>
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
 linux-kernel@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 thierry.reding@gmail.com, paulus@samba.org, sam@ravnborg.org,
 daniel.thompson@linaro.org, linux-omap@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, deller@gmx.de, linux@armlinux.org.uk,
 jonathanh@nvidia.com, ludovic.desroches@microchip.com, catalin.marinas@arm.com,
 linux-mips@vger.kernel.org, will@kernel.org, mripard@kernel.org,
 linux-tegra@vger.kernel.org, lee.jones@linaro.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, jernej.skrabec@siol.net,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 emil.l.velikov@gmail.com, nicolas.ferre@microchip.com,
 Olof Johansson <olof@lixom.net>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 30, 2020 at 03:21:33PM +0000, Andrey Zhizhikin wrote:
> Commit 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> unused") removed geenric_bl driver from the tree, together with
> corresponding config option.
> 
> Remove BACKLIGHT_GENERIC config item from all ARM configurations.
> 
> Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is unused")
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
> ---
>  arch/arm/configs/at91_dt_defconfig        | 1 -
>  arch/arm/configs/cm_x300_defconfig        | 1 -
>  arch/arm/configs/colibri_pxa300_defconfig | 1 -
>  arch/arm/configs/jornada720_defconfig     | 1 -
>  arch/arm/configs/magician_defconfig       | 1 -
>  arch/arm/configs/mini2440_defconfig       | 1 -
>  arch/arm/configs/omap2plus_defconfig      | 1 -
>  arch/arm/configs/pxa3xx_defconfig         | 1 -
>  arch/arm/configs/qcom_defconfig           | 1 -
>  arch/arm/configs/sama5_defconfig          | 1 -
>  arch/arm/configs/sunxi_defconfig          | 1 -
>  arch/arm/configs/tegra_defconfig          | 1 -
>  arch/arm/configs/u8500_defconfig          | 1 -
>  13 files changed, 13 deletions(-)

You need to send it to arm-soc maintainers, otherwise no one might feel
responsible enough to pick it up.
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

+CC Arnd and Olof,

Dear Arnd and Olof,

Maybe it is worth to add arm-soc entry to the MAINTAINERS file?
Otherwise how one could get your email address? Not mentioning the
secret-soc address. :)

Best regards,
Krzysztof
