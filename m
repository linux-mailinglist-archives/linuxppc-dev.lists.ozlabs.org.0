Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DAB1CAA5E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 14:12:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JTjy4x61zDr42
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 22:12:54 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JTcF1LxhzDr3Y
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 22:07:55 +1000 (AEST)
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id C0A903AB0B9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 11:50:25 +0000 (UTC)
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr
 [86.202.105.35])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 92B6220000C;
 Fri,  8 May 2020 11:49:48 +0000 (UTC)
Date: Fri, 8 May 2020 13:49:47 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Biwen Li <biwen.li@oss.nxp.com>
Subject: Re: [PATCH 1/3] rtc: ds1374: add uie_unsupported property to drop
 warning
Message-ID: <20200508114947.GK34497@piout.net>
References: <20200508054925.48237-1-biwen.li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508054925.48237-1-biwen.li@oss.nxp.com>
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

Hi,

On 08/05/2020 13:49:23+0800, Biwen Li wrote:
> From: Biwen Li <biwen.li@nxp.com>
> 
> Add uie_unsupported property to drop warning as follows:
>     - $ hwclock.util-linux
>       hwclock.util-liux: select() /dev/rtc0
>       to wait for clock tick timed out
> 
> My case:
>     - RTC ds1374's INT pin is connected to VCC on T4240RDB,
>       then the RTC cannot inform cpu about the alarm
>       interrupt
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
>  drivers/rtc/rtc-ds1374.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
> index 9c51a12cf70f..e530e887a17e 100644
> --- a/drivers/rtc/rtc-ds1374.c
> +++ b/drivers/rtc/rtc-ds1374.c
> @@ -651,6 +651,10 @@ static int ds1374_probe(struct i2c_client *client,
>  	if (ret)
>  		return ret;
>  
> +	if (of_property_read_bool(client->dev.of_node,
> +						 "uie_unsupported"))
> +		ds1374->rtc->uie_unsupported = true;
> +

This is not how this is supposed to work, either the RTC support uie or
don't, it is not board dependent and certainly doesn't require an
(undocumented) DT property.

>  #ifdef CONFIG_RTC_DRV_DS1374_WDT
>  	save_client = client;
>  	ret = misc_register(&ds1374_miscdev);
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
