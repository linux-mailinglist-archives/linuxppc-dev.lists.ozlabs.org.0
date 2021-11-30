Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F30546422D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 00:20:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3dVG2WP1z3cQ4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 10:20:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1389 seconds by postgrey-1.36 at boromir;
 Wed, 01 Dec 2021 10:19:41 AEDT
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3dTn5hpGz2xY5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 10:19:40 +1100 (AEDT)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id EC8C3CE321
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 22:45:48 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 11BBE1C0002;
 Tue, 30 Nov 2021 22:45:19 +0000 (UTC)
Date: Tue, 30 Nov 2021 23:45:18 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Subject: Re: [PATCH v2 2/5] rtc: gamecube: Report low battery as invalid data
Message-ID: <YaapfmykL0BOHHhF@piout.net>
References: <20211014220524.9988-1-linkmauve@linkmauve.fr>
 <20211027223516.2031-1-linkmauve@linkmauve.fr>
 <20211027223516.2031-3-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211027223516.2031-3-linkmauve@linkmauve.fr>
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 devicetree@vger.kernel.org, rw-r-r-0644 <r.r.qwertyuiop.r.r@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Ash Logan <ash@heyquark.com>,
 linuxppc-dev@lists.ozlabs.org,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On 28/10/2021 00:35:12+0200, Emmanuel Gil Peyrot wrote:
> I haven’t been able to test this patch as all of my consoles have a
> working RTC battery, but according to the documentation it should work
> like that.
> 
> Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> ---
>  drivers/rtc/rtc-gamecube.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-gamecube.c b/drivers/rtc/rtc-gamecube.c
> index e8260c82c07d..1932c6fe1301 100644
> --- a/drivers/rtc/rtc-gamecube.c
> +++ b/drivers/rtc/rtc-gamecube.c
> @@ -83,6 +83,10 @@
>  #define RTC_CONTROL0	0x21000c
>  #define RTC_CONTROL1	0x21000d
>  
> +/* RTC flags */
> +#define RTC_CONTROL0_UNSTABLE_POWER	0x00000800
> +#define RTC_CONTROL0_LOW_BATTERY	0x00000200
> +
>  struct priv {
>  	struct regmap *regmap;
>  	void __iomem *iob;
> @@ -182,9 +186,35 @@ static int gamecube_rtc_set_time(struct device *dev, struct rtc_time *t)
>  	return regmap_write(d->regmap, RTC_COUNTER, timestamp - d->rtc_bias);
>  }
>  
> +static int gamecube_rtc_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
> +{
> +	struct priv *d = dev_get_drvdata(dev);
> +	int value;
> +	int control0;
> +	int ret;
> +
> +	switch (cmd) {
> +	case RTC_VL_READ:
> +		ret = regmap_read(d->regmap, RTC_CONTROL0, &control0);
> +		if (ret)
> +			return ret;
> +
> +		value = 0;
> +		if (control0 & RTC_CONTROL0_UNSTABLE_POWER)
> +			value |= RTC_VL_DATA_INVALID;
> +		if (control0 & RTC_CONTROL0_LOW_BATTERY)
> +			value |= RTC_VL_DATA_INVALID;

Shouldn't that one be RTC_VL_BACKUP_LOW?

Else, the driver is great, I'm ready to apply it.

> +		return put_user(value, (unsigned int __user *)arg);
> +
> +	default:
> +		return -ENOIOCTLCMD;
> +	}
> +}
> +
>  static const struct rtc_class_ops gamecube_rtc_ops = {
>  	.read_time	= gamecube_rtc_read_time,
>  	.set_time	= gamecube_rtc_set_time,
> +	.ioctl		= gamecube_rtc_ioctl,
>  };
>  
>  static int gamecube_rtc_read_offset_from_sram(struct priv *d)
> -- 
> 2.33.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
