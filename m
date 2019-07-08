Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1B061AA6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 08:29:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hwWx5BqZzDqTv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 16:29:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=viresh.kumar@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="wHrS2MKg"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hwTy6shZzDqNF
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2019 16:27:12 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id a93so7708832pla.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Jul 2019 23:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PvaTWFd0jIyj/jWh/gLuDIg+Wz9VdaFcROd1jUU6H5M=;
 b=wHrS2MKgp/qpIFuWhyshvwk7x2tGKyT32qYGZauN0EYywHuPJyrg5ulDYUNFbZ4QNO
 58Ztvc5wOabwQGRa4Lv6Rk28SjdXgvagQt6yX931q03CfOsah3bf/t5myrB0Vs1+YgHF
 LY6zSMxF3ql+oh9z3joSHf/Twfb/WwJX+iZrHMK2G+yWniFiHStbYMpn0jI+qzUXlS0T
 9JoAFd849ZRHJeTmodQFaDLNDP3/J46tcyp4vzEXo6BRtWbP5Fu6mwdWymT/DrOSdmUJ
 ZImcGLQkaDli0BPtB5r0kbTt7aoUXMpGefJy2w7ISitK0rrwfC75uthm9iXe6nYU5duR
 9Tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PvaTWFd0jIyj/jWh/gLuDIg+Wz9VdaFcROd1jUU6H5M=;
 b=hwMffequFajZVTOCLrMW6a73KFaUjyTYSG5NM3JfjjIXJ8SNH5zBASyxEKDpDHN8Vp
 2qu9i+H/Xz7X6I15rjMpYxQWQ/feG3HXjFRVdeTlwehyxvVeKBrFm5Q1Rrg4DLUbsjUG
 hfIOxJ8poPzOLRuOwV6lAFnnKoQ7UubAp4HQcMJjbNnYrIy6tGJiwGWSLfrDA++0qme1
 NuAmBDXzZO20C1OibHOvyinp+wfiYv25ECOZ6zRx3zTEpZyA1xAAJb16fWg4RkyCr86a
 DHmgB4uiCucDJ0NdLCHVfyGlSi3k+6dVkfL/08nSk4g/xldVqwPjheBMKjuKOCY8zzOL
 DVdg==
X-Gm-Message-State: APjAAAV50/xPNMHYRgOgLGzd7M1la9YIrraygm5Nk1Yjpwd0yQbevdIs
 nHjzKKSWvPrghG5TTJLYOL7wuA==
X-Google-Smtp-Source: APXvYqwRjKnkWqnGnTkhQ05etsgpHpjlfberNuCPbKjt7IDKyX3jURUFRxp7JkDCe8+PHZdI8BnNTg==
X-Received: by 2002:a17:902:f301:: with SMTP id
 gb1mr21987709plb.292.1562567230900; 
 Sun, 07 Jul 2019 23:27:10 -0700 (PDT)
Received: from localhost ([122.172.28.117])
 by smtp.gmail.com with ESMTPSA id v10sm17791814pfe.163.2019.07.07.23.27.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Jul 2019 23:27:10 -0700 (PDT)
Date: Mon, 8 Jul 2019 11:57:08 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Wen Yang <wen.yang99@zte.com.cn>
Subject: Re: [PATCH] cpufreq/pasemi: fix an use-after-free in
 pas_cpufreq_cpu_init()
Message-ID: <20190708062708.5zufqsmgso436idn@vireshk-i7>
References: <1562566745-7447-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562566745-7447-1-git-send-email-wen.yang99@zte.com.cn>
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

On 08-07-19, 14:19, Wen Yang wrote:
> The cpu variable is still being used in the of_get_property() call
> after the of_node_put() call, which may result in use-after-free.
> 
> Fixes: a9acc26b75f ("cpufreq/pasemi: fix possible object reference leak")
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/cpufreq/pasemi-cpufreq.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

I will suggest some changes here.

> diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
> index 6b1e4ab..d2dd47b 100644
> --- a/drivers/cpufreq/pasemi-cpufreq.c
> +++ b/drivers/cpufreq/pasemi-cpufreq.c
> @@ -132,7 +132,6 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)

Don't initialize "err" anymore.

>  	cpu = of_get_cpu_node(policy->cpu, NULL);
>  
> -	of_node_put(cpu);
>  	if (!cpu)
>  		goto out;

Do return -ENODEV; here.

>  
> @@ -141,15 +140,15 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  		dn = of_find_compatible_node(NULL, NULL,
>  					     "pasemi,pwrficient-sdc");
>  	if (!dn)
> -		goto out;
> +		goto out_put_cpu_node;
>  	err = of_address_to_resource(dn, 0, &res);
>  	of_node_put(dn);
>  	if (err)
> -		goto out;
> +		goto out_put_cpu_node;
>  	sdcasr_mapbase = ioremap(res.start + SDCASR_OFFSET, 0x2000);
>  	if (!sdcasr_mapbase) {
>  		err = -EINVAL;
> -		goto out;
> +		goto out_put_cpu_node;
>  	}

Don't do above changes.

>  
>  	dn = of_find_compatible_node(NULL, NULL, "1682m-gizmo");
> @@ -177,6 +176,7 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  		err = -EINVAL;
>  		goto out_unmap_sdcpwr;
>  	}
> +	of_node_put(cpu);
>  
>  	/* we need the freq in kHz */
>  	max_freq = *max_freqp / 1000;
> @@ -203,6 +203,8 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  
>  out_unmap_sdcasr:
>  	iounmap(sdcasr_mapbase);
> +out_put_cpu_node:

Don't add this label, instead use "out" for also having the below
code.

> +	of_node_put(cpu);
>  out:
>  	return err;
>  }
> -- 
> 2.9.5

-- 
viresh
