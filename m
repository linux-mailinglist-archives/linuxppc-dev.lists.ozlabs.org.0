Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01343632BC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 10:13:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jZpC1QSWzDqS8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 18:13:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=viresh.kumar@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="p0sVP6ul"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jZmW6BHYzDqLH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 18:12:11 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id t14so6588910plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jul 2019 01:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eOuvT6Cckl+GniRg64y9AJ/5rozkkhx3polgR2aQ1Gg=;
 b=p0sVP6ulMvod/W51H37xuLg53Fl+A7Bh19Wz2kvDNDJCRba5OeflOxKLz4VCwk3vBH
 OxhobdOmtfIck0hPhXEgusq0pIkl8iHdl3N3nWWSmB40YunTxHNbS4db/5b7aaZ3LxbL
 6JtBhD4FbnUAb89fDssoCeREhxfNP3HWrxsgayq0PHlA29aKvfj+q3TTRAbdc3E937/U
 tsTDMgouPDMrh5g068LzbdDu/x4kmIbgBkwaietOvRfW5FuuLm5214ZWY6nz688PSwMR
 7btjap/Xfck/KXDQiNfrSAT2G6zkJGnWmJJ5QGFcQuCb2AJ3oz5EvM46B1V2V+3mqOf/
 rP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eOuvT6Cckl+GniRg64y9AJ/5rozkkhx3polgR2aQ1Gg=;
 b=cuGabymEt95YNWv9B0+TCjk7t+gZGuqz98S+Zea8LpFw0fy2BH1zNlKBYpxdpRYxWe
 1lfCFjFiKzlAzBuK9QylFUU5S5kJT86Ztu1VPro7SvKKFVoZ5/YGeiijEavKLucL/QFk
 o8EFPZRmNXzyXYMrKpCPMYWduW4Fu5QF3Dtb17DC6Q3XDKANR+iOQcd64YpXA4NEG1QP
 /Ydejj2v6thwL1KdSpBo6WLkw/QlVq3dFDy21xQJiFCEcWnLWXxRPTFGxBDJQdYfhdkN
 oKQwDvh8ZJM6PdeUAR5X07HnKubQ5Xv9H/SYSESfKaBbZVs7914mBbvIjtVu1KEn7J2H
 EwBQ==
X-Gm-Message-State: APjAAAWZSTXeRsIXuOEVKpXLz0OdaXuu3cmYrRaqGvs/UtWi7ydSnG8u
 6Zm25EGklZTDycHSUAnJs4DWwQ==
X-Google-Smtp-Source: APXvYqyba7DGNCtta2YQmlEVmhFZ7couczowCm4W1ouKSK5ZaSHTVWK5GxIV6Rk69Zyj4e8ga2Xfsg==
X-Received: by 2002:a17:902:8207:: with SMTP id
 x7mr30445929pln.63.1562659928360; 
 Tue, 09 Jul 2019 01:12:08 -0700 (PDT)
Received: from localhost ([122.172.28.117])
 by smtp.gmail.com with ESMTPSA id l1sm22620240pfl.9.2019.07.09.01.12.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 01:12:07 -0700 (PDT)
Date: Tue, 9 Jul 2019 13:42:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Wen Yang <wen.yang99@zte.com.cn>
Subject: Re: [PATCH v5] cpufreq/pasemi: fix an use-after-free in
 pas_cpufreq_cpu_init()
Message-ID: <20190709081205.a5sjsqo2el6zt24b@vireshk-i7>
References: <1562659447-39989-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562659447-39989-1-git-send-email-wen.yang99@zte.com.cn>
User-Agent: NeoMutt/20180716-391-311a52
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
Cc: wang.yi59@zte.com.cn, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 xue.zhihong@zte.com.cn, cheng.shengyu@zte.com.cn,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09-07-19, 16:04, Wen Yang wrote:
> The cpu variable is still being used in the of_get_property() call
> after the of_node_put() call, which may result in use-after-free.
> 
> Fixes: a9acc26b75f ("cpufreq/pasemi: fix possible object reference leak")
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
> v5: put together the code to get, use, and release cpu device_node.
> v4: restore the blank line.
> v3: fix a leaked reference.
> v2: clean up the code according to the advice of viresh.
> 
>  drivers/cpufreq/pasemi-cpufreq.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
> index 6b1e4ab..1f0beb7 100644
> --- a/drivers/cpufreq/pasemi-cpufreq.c
> +++ b/drivers/cpufreq/pasemi-cpufreq.c
> @@ -131,10 +131,17 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  	int err = -ENODEV;
>  
>  	cpu = of_get_cpu_node(policy->cpu, NULL);
> -
> -	of_node_put(cpu);
>  	if (!cpu)
>  		goto out;

I would have loved a blank line here :)

> +	max_freqp = of_get_property(cpu, "clock-frequency", NULL);
> +	of_node_put(cpu);
> +	if (!max_freqp) {
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	/* we need the freq in kHz */
> +	max_freq = *max_freqp / 1000;
>  
>  	dn = of_find_compatible_node(NULL, NULL, "1682m-sdc");
>  	if (!dn)
> @@ -171,16 +178,6 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  	}
>  
>  	pr_debug("init cpufreq on CPU %d\n", policy->cpu);
> -
> -	max_freqp = of_get_property(cpu, "clock-frequency", NULL);
> -	if (!max_freqp) {
> -		err = -EINVAL;
> -		goto out_unmap_sdcpwr;
> -	}
> -
> -	/* we need the freq in kHz */
> -	max_freq = *max_freqp / 1000;
> -
>  	pr_debug("max clock-frequency is at %u kHz\n", max_freq);
>  	pr_debug("initializing frequency table\n");

Though, enough versions have happened now.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
