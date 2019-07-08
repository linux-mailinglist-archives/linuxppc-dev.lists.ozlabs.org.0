Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A28861B5C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 09:46:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hyFR59HdzDqW5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 17:46:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=viresh.kumar@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="jrhAt7QH"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hyCH5vWMzDqPj
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2019 17:44:40 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id i189so7160213pfg.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jul 2019 00:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6yYLvyLEBI35unTfoBpTYZgBgYmEeKFbJbiIi6+Pm18=;
 b=jrhAt7QHn1hfUTP3COeeH51Er61boYoW+oDIVMrr9COFzd9Upo4q27t48s4EWqhesa
 KU35Ls9UQB0G45UVMerTSq1UJtXZFQ0YLdfSQ85nM3K3OTu4UzbX3fAjwNHPwxiF6i22
 VWG+UdqpRCKTCF9pdkdySwfX2u8PuvZQNWb46wVpftzUmWNaBcyYsyf345kYKJBb/m28
 FzLoPFg2ZkEOGzujoHE7dbijdRbLwq5RDamzdQv7GxV1z1Bbw2MxdeLiX9zp2SJpSxb+
 1rNtxFARtLOqF4CLByMmOpiZIC/Ax2w4yn8VwnjE6QtO5m/DWsujGLML9vga4AY+jYyd
 YXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6yYLvyLEBI35unTfoBpTYZgBgYmEeKFbJbiIi6+Pm18=;
 b=KWPKAz7IOgjr6ZzopLxAPkip5G11ndX0BElOBv0vutWhcVWHkXtY+wsjd1ohoeu0sc
 xER1BpvAcRm9EEzKUrENS0jZPACCGdHbAl1lIkjtTG++7k++KGP1L8SWumXdcaDvQkXu
 RH2IYza0tTA6Psgo9EBpT4VMfVWr6rDQ+PLGvOKvuzjrmcA2JoWL21OniBqLUDQMiL/5
 aMDRs9Q2kBC9SZWBY0qgyb/ksL6FJ23r+dxIeB2CT+YMTEvdZVYMvzBW+rG1VbBe1FkO
 nQvJYLReNyMfWs5BZnk23o74BU7qQpjLr4ifW8oARAp+LP/m+VXmKGyQcdpaFXDUC9HC
 wtGg==
X-Gm-Message-State: APjAAAW4+Q4vyGqEvBlebgNYkFT5mwaBNX/eb44DcRXGZJLTVT7yVLHw
 dg8Wuj2kEUQ5GW5kUQ9oG292dA==
X-Google-Smtp-Source: APXvYqwZWf9LLc+ir3bbSRqwnYrobSk3zS9QKp8UXA6ZaA547Hc+q9BjEik4iR2j0FZUtVmgXY79Og==
X-Received: by 2002:a65:42c3:: with SMTP id l3mr21652248pgp.372.1562571875771; 
 Mon, 08 Jul 2019 00:44:35 -0700 (PDT)
Received: from localhost ([122.172.28.117])
 by smtp.gmail.com with ESMTPSA id p13sm46332015pjb.30.2019.07.08.00.44.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 00:44:34 -0700 (PDT)
Date: Mon, 8 Jul 2019 13:14:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Wen Yang <wen.yang99@zte.com.cn>
Subject: Re: [PATCH v2] cpufreq/pasemi: fix an use-after-free in
 pas_cpufreq_cpu_init()
Message-ID: <20190708074432.56q2e3ig5ehiee5f@vireshk-i7>
References: <1562570393-8684-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562570393-8684-1-git-send-email-wen.yang99@zte.com.cn>
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

On 08-07-19, 15:19, Wen Yang wrote:
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
> v2: clean up the code according to the advice of viresh.
> 
>  drivers/cpufreq/pasemi-cpufreq.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
> index 6b1e4ab..c6d464b 100644
> --- a/drivers/cpufreq/pasemi-cpufreq.c
> +++ b/drivers/cpufreq/pasemi-cpufreq.c
> @@ -128,20 +128,18 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  	int cur_astate, idx;
>  	struct resource res;
>  	struct device_node *cpu, *dn;
> -	int err = -ENODEV;
> +	int err;
>  
>  	cpu = of_get_cpu_node(policy->cpu, NULL);
> -
> -	of_node_put(cpu);
>  	if (!cpu)
> -		goto out;
> +		return -ENODEV;
>  


>  	dn = of_find_compatible_node(NULL, NULL, "1682m-sdc");
>  	if (!dn)
>  		dn = of_find_compatible_node(NULL, NULL,
>  					     "pasemi,pwrficient-sdc");
>  	if (!dn)
> -		goto out;
> +		return -ENODEV;

This change looks incorrect. You still need to drop reference to cpu ?

>  	err = of_address_to_resource(dn, 0, &res);
>  	of_node_put(dn);
>  	if (err)
> @@ -196,6 +194,7 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  	policy->cur = pas_freqs[cur_astate].frequency;
>  	ppc_proc_freq = policy->cur * 1000ul;
>  
> +	of_node_put(cpu);
>  	return cpufreq_generic_init(policy, pas_freqs, get_gizmo_latency());
>  
>  out_unmap_sdcpwr:
> @@ -204,6 +203,7 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  out_unmap_sdcasr:
>  	iounmap(sdcasr_mapbase);
>  out:
> +	of_node_put(cpu);
>  	return err;
>  }
>  
> -- 
> 2.9.5

-- 
viresh
