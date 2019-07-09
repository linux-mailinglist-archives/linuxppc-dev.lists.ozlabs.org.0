Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC5E62E49
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 04:43:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jRTj22m4zDqVn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 12:43:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=viresh.kumar@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="oQuVf51p"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jRS95WT8zDqMm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 12:42:30 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id f25so8635704pgv.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jul 2019 19:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=N3ZRbdsvjb/D9ul4Io/biNGoMRXfxsqZ68h/ywmeG3w=;
 b=oQuVf51puIsvyNvkx1cQUc0gxF/XXJbXQir1A6N/zGhQ8ZxsvDOE4wU9nDW5TUD+sN
 c7zFsrC//363lNbCHiNN6m5z3e0frziUO4WqR0CZmmNRF87hS+akddpOTWQCFogBwHuP
 jnZIndnU8gtrnd3B+xM9KJ+WaPFc2G4lcbU7l0E44CVObHDIQBnNYAHPYjBhYV0apkSe
 eWrF4V9cAfn/TYGgD29SS2C7A7FEm0arF519pkj3Y3pIAq5CQDBi3yoR+KJ1OkZ0tFoZ
 e4PitwPNZhLrgg1O+tbqmxxUx2yr8yRbjx0KzEYQU0uy2v2rBi4Elr5tpXPoLCmGkjfv
 yAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=N3ZRbdsvjb/D9ul4Io/biNGoMRXfxsqZ68h/ywmeG3w=;
 b=qXP+WytazbnuGQPn4zj0IsLesPqjSUP7PWnY9cXfKuNTEit/6+f1Xw4VPergNMD9DQ
 RHSBP4TBXPk5Kdh5ul+vtKLsYFNbYxkqCxcWdl7epG8mmRoiuQKd1EsYVBRw955rVdQD
 S0bVi+hbpvK1XdLkTx67/0xwzboYAmaujiHjvPk074e0N9xBGHo0fsKzfsh0YuLW1E8R
 S6lcBAEfaZaPQ6JyjE+bT0qxccJJO8WJj/dzjvnLzU8NxkWiiub1X+6weY5GVzc2ErA/
 0B9m2NeBolybUoYLvJO13zBTgrpK/yaQVODvjtKhjRMDh1QNzncxQNVZL2j5zoE8z0G9
 NGZA==
X-Gm-Message-State: APjAAAWbe0oth0QT93Yt3LTOHF+cCElFZQ+go/yQN629+BYO7+GknNbN
 tY1zDYGtaB4K83e923ChdzQhwA==
X-Google-Smtp-Source: APXvYqwXb+lG4wfrVmwIc+3kveiWWNUbdUhgx7Y6Fyih8hmcxfb9FXdcVe7BJVFYRwXkUWHKlhedYg==
X-Received: by 2002:a63:24c1:: with SMTP id
 k184mr28173703pgk.120.1562640147020; 
 Mon, 08 Jul 2019 19:42:27 -0700 (PDT)
Received: from localhost ([122.172.28.117])
 by smtp.gmail.com with ESMTPSA id 81sm11500964pfx.111.2019.07.08.19.42.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 19:42:25 -0700 (PDT)
Date: Tue, 9 Jul 2019 08:12:21 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Wen Yang <wen.yang99@zte.com.cn>
Subject: Re: [PATCH v4] cpufreq/pasemi: fix an use-after-free in
 pas_cpufreq_cpu_init()
Message-ID: <20190709024221.evyukzbis6lnok4f@vireshk-i7>
References: <1562629144-13584-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562629144-13584-1-git-send-email-wen.yang99@zte.com.cn>
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

On 09-07-19, 07:39, Wen Yang wrote:
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
> v4: restore the blank line.

I don't find it restored in the below code.

> v3: fix a leaked reference.
> v2: clean up the code according to the advice of viresh.
> 
>  drivers/cpufreq/pasemi-cpufreq.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
> index 6b1e4ab..f0c98fc 100644
> --- a/drivers/cpufreq/pasemi-cpufreq.c
> +++ b/drivers/cpufreq/pasemi-cpufreq.c
> @@ -128,20 +128,21 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  	int cur_astate, idx;
>  	struct resource res;
>  	struct device_node *cpu, *dn;
> -	int err = -ENODEV;
> +	int err;
>  
>  	cpu = of_get_cpu_node(policy->cpu, NULL);
>  
> -	of_node_put(cpu);
>  	if (!cpu)
> -		goto out;
> +		return -ENODEV;
>  
>  	dn = of_find_compatible_node(NULL, NULL, "1682m-sdc");
>  	if (!dn)
>  		dn = of_find_compatible_node(NULL, NULL,
>  					     "pasemi,pwrficient-sdc");
> -	if (!dn)
> +	if (!dn) {
> +		err = -ENODEV;
>  		goto out;
> +	}
>  	err = of_address_to_resource(dn, 0, &res);
>  	of_node_put(dn);
>  	if (err)
> @@ -196,6 +197,7 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  	policy->cur = pas_freqs[cur_astate].frequency;
>  	ppc_proc_freq = policy->cur * 1000ul;
>  
> +	of_node_put(cpu);
>  	return cpufreq_generic_init(policy, pas_freqs, get_gizmo_latency());
>  
>  out_unmap_sdcpwr:
> @@ -204,6 +206,7 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
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
