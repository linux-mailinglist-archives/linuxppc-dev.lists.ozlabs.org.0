Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F6B1B823D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 00:52:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4988Zd0Y7RzDr8s
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 08:52:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gE6QfX8j; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4988Xg4RJczDqJL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 08:50:56 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id v4so11039850wme.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 15:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8BEWtePU0v+uCkRcc3GIp/GMZ9QgxqSp8s6Ot/Xv/J8=;
 b=gE6QfX8jdwHdzM2OKoa61axS+BEzh2mnzlBOQiaMSUx6+mcARvAE63aFVlvmDDdY3e
 4oSJ8POMDh7O/Fk0JxCs+xSn60sb1Z+HWcFu4UxQ4H4hJ0vf/8WmX8jzoO/p15XF2NAe
 qIOosX0VqZ2XlrPwUXPEnvEZCIOnpFn8KnjTq36hK/BpD9IGvGuHlFqyFpJ4ob/ZlTnp
 CI2ew0Igx+0qCy7Ws7+xejiww+yHAxqiDAXwEZNfEdRqOGhYGHQXop0yXADsuSQT08Bj
 WuBnEngk5SmBMzLNR6o4N2QjclSSbZyOcmz7q4AlidrrsIIhDrfKnffqHD10HQ0Bim84
 pWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8BEWtePU0v+uCkRcc3GIp/GMZ9QgxqSp8s6Ot/Xv/J8=;
 b=nzP0mA5oyegxrbeI3vMnnrAQKAfJbjGdIF84bzYGRdoFN8uuWLI8bxY7AJ/M0y5OKv
 s5vwMZZFMfRPzfjoHq0F/dJ7xVLeTXezdUHYSrZQIugPIgy5Vv3AGfCVeESYZPSuBkY5
 XcUSJP8jl7rFOQbmlMq1OIYn6ZS+caSrYZIo08C+RuKH3rCZryWcpkPPKT8/BmzGk5RB
 PzdYVdyEk8Ze4xPK3RYxuaGtHu6yUdHiMAek+H0TtWY9QQDrbixqbx2yt9rVMzCJa9PI
 D53Yoiu+XlghDHRq5JIn10clqXG7CjAT0ZosPtRZ8tWgMnHl/8FiTeaCl5xOUt/VYk8w
 2Rkw==
X-Gm-Message-State: AGi0PuYVDGtjhryB4hQ3NXzQHiC8RXN7dqR9sHaUJnukG1VbMhl/IyLL
 4OC/4z3lz2q+BTxm+4VhKejfMlOs
X-Google-Smtp-Source: APiQypKSKb4f+JqrpmRZK6KQvjMLL5I49S+UcN/Tau4eDG7d6B4rjLXGXF7IhNdcajcET5SiA3J5bQ==
X-Received: by 2002:a1c:2392:: with SMTP id
 j140mr12516372wmj.136.1587768650953; 
 Fri, 24 Apr 2020 15:50:50 -0700 (PDT)
Received: from [10.230.188.26] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id r18sm7038927wrj.70.2020.04.24.15.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2020 15:50:50 -0700 (PDT)
Subject: Re: [RFC PATCH dpss_eth] Don't initialise ports with no PHY
To: Darren Stevens <darren@stevens-zone.net>, madalin.bacur@nxp.com,
 netdev@vger.kernel.org
References: <20200424232938.1a85d353@Cyrus.lan>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <b6d84c65-a75a-a64d-463f-b0646862e322@gmail.com>
Date: Fri, 24 Apr 2020 15:50:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424232938.1a85d353@Cyrus.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: oss@buserror.net, linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/24/2020 3:29 PM, Darren Stevens wrote:
> Since cbb961ca271e ("Use random MAC address when none is given")
> Varisys Cyrus P5020 boards have been listing 5 ethernet ports instead of
> the 2 the board has.This is because we were preventing the adding of the
> unused ports by not suppling them a MAC address, which this patch now
> supplies.
> 
> Prevent them from appearing in the net devices list by checking for a
> 'status="disabled"' entry during probe and skipping the port if we find
> it. 
> 
> Signed-off-by: Darren Stevens <Darren@stevens-zone.net>
> 
> ---
> 
>  drivers/net/ethernet/freescale/fman/mac.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/net/ethernet/freescale/fman/mac.c b/drivers/net/ethernet/freescale/fman/mac.c
> index 43427c5..c9ed411 100644
> --- a/drivers/net/ethernet/freescale/fman/mac.c
> +++ b/drivers/net/ethernet/freescale/fman/mac.c
> @@ -606,6 +606,7 @@ static int mac_probe(struct platform_device *_of_dev)
>  	struct resource		 res;
>  	struct mac_priv_s	*priv;
>  	const u8		*mac_addr;
> +	const char 		*prop;
>  	u32			 val;
>  	u8			fman_id;
>  	phy_interface_t          phy_if;
> @@ -628,6 +629,16 @@ static int mac_probe(struct platform_device *_of_dev)
>  	mac_dev->priv = priv;
>  	priv->dev = dev;
>  
> +	/* check for disabled devices and skip them, as now a missing
> +	 * MAC address will be replaced with a Random one rather than
> +	 * disabling the port
> +	 */
> +	prop = of_get_property(mac_node, "status", NULL);
> +	if (prop && !strncmp(prop, "disabled", 8) {
> +		err = -ENODEV;
> +		goto _return
> +	}

There is a sorter version: of_device_is_available(mac_node) which will
do the same thing.

> +
>  	if (of_device_is_compatible(mac_node, "fsl,fman-dtsec")) {
>  		setup_dtsec(mac_dev);
>  		priv->internal_phy_node = of_parse_phandle(mac_node,
> 

-- 
Florian
