Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0F7F508A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 17:05:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478lV932tZzF68Y
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 03:05:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.178.242;
 helo=mslow2.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=bootlin.com
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478l0J1937zF145
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 02:42:54 +1100 (AEDT)
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id E93013B5C74
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2019 15:21:15 +0000 (UTC)
Received: from localhost (alyon-657-1-975-54.w92-137.abo.wanadoo.fr
 [92.137.17.54]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 01487100008;
 Fri,  8 Nov 2019 15:17:20 +0000 (UTC)
Date: Fri, 8 Nov 2019 16:17:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] soc: fsl: Enable COMPILE_TEST
Message-ID: <20191108151720.GB216543@piout.net>
References: <20191108130213.23684-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108130213.23684-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, leoyang.li@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 08/11/2019 21:02:13+0800, YueHaibing wrote:
> When do COMPILE_TEST buiding for RTC_DRV_FSL_FTM_ALARM,
> we get this warning:
> 
> WARNING: unmet direct dependencies detected for FSL_RCPM
>   Depends on [n]: PM_SLEEP [=y] && (ARM || ARM64)
>   Selected by [m]:
>   - RTC_DRV_FSL_FTM_ALARM [=m] && RTC_CLASS [=y] && (ARCH_LAYERSCAPE || SOC_LS1021A || COMPILE_TEST [=y])
> 
> This enable COMPILE_TEST for FSL_RCPM to fix the issue.
> 
> Fixes: e1c2feb1efa2 ("rtc: fsl-ftm-alarm: allow COMPILE_TEST")

I've removed that patch until the fsl maintainers apply this one.

> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> In commit c6c2d36bc46f ("rtc: fsl-ftm-alarm: Fix build error without PM_SLEEP")
> I posted a wrong kconfig warning(which PM_SLEEP is n), sorry for confusion.
> ---
>  drivers/soc/fsl/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/fsl/Kconfig b/drivers/soc/fsl/Kconfig
> index 4df32bc..e142662 100644
> --- a/drivers/soc/fsl/Kconfig
> +++ b/drivers/soc/fsl/Kconfig
> @@ -43,7 +43,7 @@ config DPAA2_CONSOLE
>  
>  config FSL_RCPM
>  	bool "Freescale RCPM support"
> -	depends on PM_SLEEP && (ARM || ARM64)
> +	depends on PM_SLEEP && (ARM || ARM64 || COMPILE_TEST)
>  	help
>  	  The NXP QorIQ Processors based on ARM Core have RCPM module
>  	  (Run Control and Power Management), which performs all device-level
> -- 
> 2.7.4
> 
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
