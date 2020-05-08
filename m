Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5801CAA5F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 14:15:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JTmK74zLzDr5L
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 22:14:57 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JTcN5qw4zDr3F
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 22:08:04 +1000 (AEST)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 2C6163AC74B
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 11:51:23 +0000 (UTC)
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr
 [86.202.105.35])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 100E8FF808;
 Fri,  8 May 2020 11:50:52 +0000 (UTC)
Date: Fri, 8 May 2020 13:50:52 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Biwen Li <biwen.li@oss.nxp.com>
Subject: Re: [PATCH 2/3] dts: ppc: t4240rdb: add uie_unsupported property to
 drop warning
Message-ID: <20200508115052.GL34497@piout.net>
References: <20200508054925.48237-1-biwen.li@oss.nxp.com>
 <20200508054925.48237-2-biwen.li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508054925.48237-2-biwen.li@oss.nxp.com>
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, devicetree@vger.kernel.org,
 Biwen Li <biwen.li@nxp.com>, linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 robh+dt@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/05/2020 13:49:24+0800, Biwen Li wrote:
> From: Biwen Li <biwen.li@nxp.com>
> 
> This adds uie_unsupported property to drop warning as follows:
>     - $ hwclock.util-linux
>       hwclock.util-linux: select() to /dev/rtc0
>       to wait for clock tick timed out
> 
> My case:
>     - RTC ds1374's INT pin is connected to VCC on T4240RDB,
>       then the RTC cannot inform cpu about the alarm interrupt
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
>  arch/powerpc/boot/dts/fsl/t4240rdb.dts | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/boot/dts/fsl/t4240rdb.dts b/arch/powerpc/boot/dts/fsl/t4240rdb.dts
> index a56a705d41f7..ccdd10202e56 100644
> --- a/arch/powerpc/boot/dts/fsl/t4240rdb.dts
> +++ b/arch/powerpc/boot/dts/fsl/t4240rdb.dts
> @@ -144,7 +144,11 @@
>  			rtc@68 {
>  				compatible = "dallas,ds1374";
>  				reg = <0x68>;
> -				interrupts = <0x1 0x1 0 0>;

removing the interrupt should be enough to solve your issue

> +				// The ds1374's INT pin isn't
> +				// connected to cpu's INT pin,
> +				// so the rtc cannot synchronize
> +				// clock tick per second.
> +				uie_unsupported;
>  			};
>  		};
>  
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
