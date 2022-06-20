Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C702550F75
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 06:43:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRH8j3yKpz3bw7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 14:43:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Af+7C6s3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=viresh.kumar@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Af+7C6s3;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRH861QV3z3bdK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 14:42:59 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id t3-20020a17090a510300b001ea87ef9a3dso9123230pjh.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jun 2022 21:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+qD5oJD5pwRVHMYyuv6dIhRRxn/7fc+uDTelAP64E9M=;
        b=Af+7C6s3YbdNOO9PX23VXIqItWHG7PIQsbq1V1/mALgYLAoAegp3S9AGltjAMh4Nob
         y1BbkJ+P2PIGUAp3IQiraoFt8tzNT5k2YooDlvu+aOhrpJAVXG2rEw9z8sY3CzJOQK8W
         vnWqeGFKGS0x2UaPtv85kuEG1HyhMra2I5ma8waloSHCiUAJ7TqR0Y4KebH7td6b/Z4K
         o8JLAr98kkZt6wOc/MzGfKZguBgv41apjwYxAJp1vVryMhxF19cNmDIas1ftgOlfQrQ7
         MLuzwenqIghXnn0upUwYE8mpa4WVnM3SNLOBdgnZud6GQ1IfFyZuNwMCj4NgJieqynhP
         zByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+qD5oJD5pwRVHMYyuv6dIhRRxn/7fc+uDTelAP64E9M=;
        b=tWJMqygpXckXIMze9I8e5spc2auhulPix8UvqjjvMnz7Wu7PIhNROPWcjyXAw2IMLm
         b34wMj8svhe6MPIiYWCaV/8rN4r5N2ZTvT6mWxqIxAL3Aqua0X70RdjIt8QmADpWhq+o
         bp8PF2R1x/qHGFGYMe1x71ytjGjKyDF9XrS03cLkDH8QahhazutHVapQlIYKQnumi5df
         UUTrTMvoJkVsCaMV0lCNVP6M1cEmLVy6JV4ydOW9vwzR5FVSm3opDCxBkJ2Q0xYmqQme
         grKCRveZn0GX127BCzsQY8ZG4Yb9FT0MuMD2RvkCZOH+HNQ47gLiIkvffnpno8djl4Ju
         hBmA==
X-Gm-Message-State: AJIora9K0ddKUhdxP1/0rtB5NTW8P7oer2wKjLlqUxq1Kp+ShK50V0mg
	Os7mM4H3XS4GJSI/IeC808vEtA==
X-Google-Smtp-Source: AGRyM1szVyxEGnAxt8i/GzxdmN2ytoRk0A1gssQ4uLTVg0Xmw7Tc52+asTsf9l1jW25eQT5VYqm1zg==
X-Received: by 2002:a17:90b:48cf:b0:1e8:789c:4a9c with SMTP id li15-20020a17090b48cf00b001e8789c4a9cmr36207847pjb.98.1655700173208;
        Sun, 19 Jun 2022 21:42:53 -0700 (PDT)
Received: from localhost ([122.162.234.2])
        by smtp.gmail.com with ESMTPSA id ja13-20020a170902efcd00b0016a087cfad8sm5150133plb.264.2022.06.19.21.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 21:42:52 -0700 (PDT)
Date: Mon, 20 Jun 2022 10:12:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Liang He <windhl@126.com>
Subject: Re: [PATCH] cpufreq: pmac32-cpufreq: Fix refcount leak bug
Message-ID: <20220620044242.fbknfhv5uqbrl232@vireshk-i7>
References: <20220618022545.4056299-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220618022545.4056299-1-windhl@126.com>
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
Cc: linux-pm@vger.kernel.org, rafael@kernel.org, linux-kernel@vger.kernel.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18-06-22, 10:25, Liang He wrote:
> In pmac_cpufreq_init_MacRISC3(), we need to add corresponding
> of_node_put() for the three node pointers whose refcount have
> been incremented by of_find_node_by_name().
> 
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  drivers/cpufreq/pmac32-cpufreq.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/cpufreq/pmac32-cpufreq.c b/drivers/cpufreq/pmac32-cpufreq.c
> index 20f64a8b0a35..4b8ee2014da6 100644
> --- a/drivers/cpufreq/pmac32-cpufreq.c
> +++ b/drivers/cpufreq/pmac32-cpufreq.c
> @@ -470,6 +470,10 @@ static int pmac_cpufreq_init_MacRISC3(struct device_node *cpunode)
>  	if (slew_done_gpio_np)
>  		slew_done_gpio = read_gpio(slew_done_gpio_np);
>  
> +	of_node_put(volt_gpio_np);
> +	of_node_put(freq_gpio_np);
> +	of_node_put(slew_done_gpio_np);
> +
>  	/* If we use the frequency GPIOs, calculate the min/max speeds based
>  	 * on the bus frequencies
>  	 */

Applied. Thanks.

-- 
viresh
