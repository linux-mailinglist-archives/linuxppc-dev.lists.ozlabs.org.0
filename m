Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B43E6B4D0D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 17:32:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYBQn28dcz3cfB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Mar 2023 03:32:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IlfuaYSX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IlfuaYSX;
	dkim-atps=neutral
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYBPp62c4z3bfw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Mar 2023 03:31:08 +1100 (AEDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-176eae36feaso6419869fac.6
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 08:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678465861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QypCNI2xqCoN0xaoFVsXgji/AUwaoG1YEw85Z1r0/mI=;
        b=IlfuaYSXwkAWxEL7j8TvdE+63Sskt8XoCMhqfUsEGHsn6v5qRj2PEPKd0B1uqqIBCb
         AIMv/3XMqkjYq5HXn8s8SmCcm8m8ZQxVLh/lvQuUcP7U6HEwnR7aXXyOUyzZHenrT/EV
         4+vgQlIjyLcxAn2qGXL57spa7DIxlwiOWh2NdfpdnfaoeoX5rzbRq5hPEu5IitBUfedW
         dvWxRFBdPNKJ1jOC0aOtyNddHgLXbVN42kHSuigMfCRbA9h6jpd6TN46GhKwu/DthtWp
         +vUKUdPYRQN6uG9YknRpyYwKSzIQn5razXcOHOV8DCz0yOebb00i/KHEPLrKtR/6Kctt
         srsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678465861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QypCNI2xqCoN0xaoFVsXgji/AUwaoG1YEw85Z1r0/mI=;
        b=HaRrYwY0FmPvkrfS+QWrSCq1F9V02C4KyceZy0koXcvneKXIHZp0EPd7uIRzat3Gzb
         zdamouNbhO8jFMzA5qCk8s02ipRIUOhHrBTM2qtKQ+fzFN9p6bWGVtWEkIgh0BJZoEYz
         BPzzJRYHS1KfFM610KkTz8a2ZiFnDhrPRRonh1776swDaH3lRsmAbsq1ZhRWkr5fCNDg
         Q5aftkRjZwzqNjSAtRuTHm2/WH+7cZocuHxNCqDpYTuUFmx5vtqK1vZBKT6mC850UdKW
         s4O1I8LMixPpTGBryjgXHpkszmPP7+LhkYHzN5m6czPBYLque+fzmJae13H76OfNj45w
         UzmA==
X-Gm-Message-State: AO0yUKXwEzcU/Kk9I/w2TkIURk0+YlzbdYJ7vQ2l4ld/OZmy05IwW5Xd
	f85n4UW83vD/6R697Q1Dd5I=
X-Google-Smtp-Source: AK7set/UqV3JOpSMORrqKUDvtpLbjybiIH6IyJL8CUv3QLXGBh/2WpKYvMJ/nXO5UbAEZwsOg/qdYQ==
X-Received: by 2002:a05:6870:3907:b0:172:3d66:c428 with SMTP id b7-20020a056870390700b001723d66c428mr16574711oap.25.1678465861445;
        Fri, 10 Mar 2023 08:31:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c7-20020a4a4f07000000b0051763d6497fsm69564oob.38.2023.03.10.08.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 08:31:01 -0800 (PST)
Date: Fri, 10 Mar 2023 08:30:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] hwmon: Use of_property_present() for testing DT property
 presence
Message-ID: <3fd0857e-8198-4412-9f82-c768207338d2@roeck-us.net>
References: <20230310144706.1542434-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310144706.1542434-1-robh@kernel.org>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 10, 2023 at 08:47:06AM -0600, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/ibmpowernv.c | 4 ++--
>  drivers/hwmon/pwm-fan.c    | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
> index 8e3724728cce..594254d6a72d 100644
> --- a/drivers/hwmon/ibmpowernv.c
> +++ b/drivers/hwmon/ibmpowernv.c
> @@ -456,9 +456,9 @@ static int populate_attr_groups(struct platform_device *pdev)
>  		 */
>  		if (!of_property_read_string(np, "label", &label))
>  			sensor_groups[type].attr_count++;
> -		if (of_find_property(np, "sensor-data-min", NULL))
> +		if (of_property_present(np, "sensor-data-min"))
>  			sensor_groups[type].attr_count++;
> -		if (of_find_property(np, "sensor-data-max", NULL))
> +		if (of_property_present(np, "sensor-data-max"))
>  			sensor_groups[type].attr_count++;
>  	}
>  
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 83a347ca35da..57928d270015 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -427,7 +427,7 @@ static int pwm_fan_of_get_cooling_data(struct device *dev,
>  	struct device_node *np = dev->of_node;
>  	int num, i, ret;
>  
> -	if (!of_find_property(np, "cooling-levels", NULL))
> +	if (!of_property_present(np, "cooling-levels"))
>  		return 0;
>  
>  	ret = of_property_count_u32_elems(np, "cooling-levels");
