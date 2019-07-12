Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F87D6656B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 06:00:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lK2s5q69zDqGc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 14:00:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=viresh.kumar@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="om4dUHnr"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lJgy1Y88zDqQN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 13:44:13 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id w10so3890371pgj.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 20:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FJEg1PSZtBDvEUaB1tANRkyXMe9y2BhABHvlVqK15CM=;
 b=om4dUHnrAVTcB6VZSX3QaRGG8cW4pe28ysXcQAfegtJ9471WnmQy48pbF/6w4twSkP
 g9C0CVRJtW+e4mKQ9V6wimOpulHkGb76sMC5DttiDZD22y2T60DwP/IUSYghEFaRj5ZM
 gLtjjXwnDsEdq4Qtn44XjgYZPKez0Z3HjMw8mbzgaZ8WDnLepMfeX/+tVUp8ehaxdI2q
 Du90ZLjjAGk//30F6fGpSGHt3jsHLnNtKHLwSgw50p019+YT7qel+pJid5MwWqap7MfP
 VrCNXES1a3iO02buE5VDyxiA3wv7mC6iAeYra06n4kss0+U81cJ7sGedf7kn6BhBM8cQ
 ZDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FJEg1PSZtBDvEUaB1tANRkyXMe9y2BhABHvlVqK15CM=;
 b=YmxbLw1IGkjjes1/T8omtAKMcvL+U+SQuobyKGpY2SijL9VvXzuITjWL66z3FgUl/9
 DiM3jJlSwoHgyQp9TaBbHQS58Vp0LcRueLhosNqrJPmz3Ef+PYoOVUpn183AkGayyhg1
 yKV8xoLQwn4AdwVmGKfrvcZiRZ/9dHXelh6+fCKqNyN6od1vNrR+Y16M8B8S1AzziBGt
 AZfapLfOrj9fGMw26EDTL3jkuyk7Pi5snRaK8WXdWxdsYNqsnM9aJcCa/VghyN2BJOLt
 UU/ESr0IuRPlVkvIH1K2gCOt0uE98z7YTFbnUZuxWymmyzt5ibqbukncAr2gBqyYxZNY
 D1xw==
X-Gm-Message-State: APjAAAWjxF5pVkwb2J6L6fAvbibrKcBb7jlMKCqm/LosurUzFn7Qygi2
 zgoBs4wrg38UXolWz9peKUlmEw==
X-Google-Smtp-Source: APXvYqy9857Wgh/Qw5sD0c6p/uGpEMX3EoZjvjany601DZQGRDvfT7z/hTLtd+HWVqwjoJjgYV9amw==
X-Received: by 2002:a63:c342:: with SMTP id e2mr8105277pgd.79.1562903052070;
 Thu, 11 Jul 2019 20:44:12 -0700 (PDT)
Received: from localhost ([122.172.28.117])
 by smtp.gmail.com with ESMTPSA id 201sm9836656pfz.24.2019.07.11.20.44.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 20:44:11 -0700 (PDT)
Date: Fri, 12 Jul 2019 09:14:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Wen Yang <wen.yang99@zte.com.cn>
Subject: Re: [PATCH v6] cpufreq/pasemi: fix an use-after-free in
 pas_cpufreq_cpu_init()
Message-ID: <20190712034409.zyl6sskrr6ra5nd3@vireshk-i7>
References: <1562899461-24045-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562899461-24045-1-git-send-email-wen.yang99@zte.com.cn>
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
Cc: wang.yi59@zte.com.cn, linux-pm@vger.kernel.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, xue.zhihong@zte.com.cn, cheng.shengyu@zte.com.cn,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12-07-19, 10:44, Wen Yang wrote:
> The cpu variable is still being used in the of_get_property() call
> after the of_node_put() call, which may result in use-after-free.
> 
> Fixes: a9acc26b75f6 ("cpufreq/pasemi: fix possible object reference leak")
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
> v6: keep the blank line and fix warning: label 'out_unmap_sdcpwr' defined but not used.
> v5: put together the code to get, use, and release cpu device_node.
> v4: restore the blank line.
> v3: fix a leaked reference.
> v2: clean up the code according to the advice of viresh.
> 
>  drivers/cpufreq/pasemi-cpufreq.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
> index 6b1e4ab..7d557f9 100644
> --- a/drivers/cpufreq/pasemi-cpufreq.c
> +++ b/drivers/cpufreq/pasemi-cpufreq.c
> @@ -131,10 +131,18 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  	int err = -ENODEV;
>  
>  	cpu = of_get_cpu_node(policy->cpu, NULL);
> +	if (!cpu)
> +		goto out;
>  
> +	max_freqp = of_get_property(cpu, "clock-frequency", NULL);
>  	of_node_put(cpu);
> -	if (!cpu)
> +	if (!max_freqp) {
> +		err = -EINVAL;
>  		goto out;
> +	}
> +
> +	/* we need the freq in kHz */
> +	max_freq = *max_freqp / 1000;
>  
>  	dn = of_find_compatible_node(NULL, NULL, "1682m-sdc");
>  	if (!dn)
> @@ -171,16 +179,6 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
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
>  
> @@ -196,7 +194,11 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  	policy->cur = pas_freqs[cur_astate].frequency;
>  	ppc_proc_freq = policy->cur * 1000ul;
>  
> -	return cpufreq_generic_init(policy, pas_freqs, get_gizmo_latency());
> +	err = cpufreq_generic_init(policy, pas_freqs, get_gizmo_latency());

So you are trying to fix an earlier issue here with this. Should have
been a separate patch. Over that I have just sent a patch now to make
this routine return void.

https://lore.kernel.org/lkml/ee8cf5fb4b4a01fdf9199037ff6d835b935cfd13.1562902877.git.viresh.kumar@linaro.org/

So all you need to do is to remove the label out_unmap_sdcpwr instead.

> +	if (err)
> +		goto out_unmap_sdcpwr;
> +
> +	return 0;
>  
>  out_unmap_sdcpwr:
>  	iounmap(sdcpwr_mapbase);
> -- 
> 2.9.5

-- 
viresh
