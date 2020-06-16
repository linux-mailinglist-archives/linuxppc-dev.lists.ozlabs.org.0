Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D16D1FA7C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 06:33:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mFhH5JlgzDqlP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 14:33:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EfhXBKtM; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mFdy3qBlzDqY7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 14:31:49 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id s10so8666072pgm.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 21:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yggJLQ1EcUgjHF19yDwrup+mzwUkwfoI6w/Q8w2BPpk=;
 b=EfhXBKtMMpywDdVRa97crf16rSBhJmC9upTtrKRxHjbYQ6vb5dFVW0F6JjwosFOWkY
 6EoRWcAzi6fqfgfosquSl77qy0o7OrBZp1CfljklHXisVRNBXDuNSOnz/qDKBJo4sZAI
 AIJubRaqdZkaJ+BNb46H0OzDMUg4+GeXDIRApMrupAA3f32FYfGS7R5cYoPcXV+kqxrB
 7YtCX7uuyUPpo6iXPtNvbTdQjxNf3K5GZ1W3AmIokh4hfydqgAcyUJnVMyQT5D+lm4lK
 Tanbbi3aIPnGPUGzU2ni0I1dVsAlTlFmVRtE60MvAMuE3YVDSJvaYN5jCxXiotiU5gBD
 ZVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yggJLQ1EcUgjHF19yDwrup+mzwUkwfoI6w/Q8w2BPpk=;
 b=tyjU0weOZXcv4Cnb7yYZTILXPvK6YdXEIxxELdQ2EE8ld1yQ4eKNzE1lKmXoZ4tJJp
 GRQZ9NTAggHRwLMou1uN7pCWa0VRu63ixRkkGzVAXrcIE/QRg0PX8sNAc2eykEbh6YF+
 EjTuUaI1OavXhPHeWT4BWNIHo11U+vymUxq3fMJd907+5Z0DW5vVJem3ByV56YS3bNxi
 dLH5StA5npf/n37OFQbUoRqHeYguDmQHO8PcMmUtabCbtbXHZEHq6OQI5LjIuvdtRS0n
 LylDcxFiQozapzPXBXaZQN0h0RT/BMarrfWKXkJAmDfU1RVG0mYF8ZoWEsJDLrsDslkU
 EvRw==
X-Gm-Message-State: AOAM531dDv+iBX8NZr2E31C/vR4pijnVLdjJxjIbMiLja46brw/y/Rbk
 F0R8i/BHF0y1LyqQEzk0fqWIjg==
X-Google-Smtp-Source: ABdhPJydDW3Q5YoUvXjbkK975S5wvd5Z8OCpB+59uxLDjteoZCSrgET+C2HheXpQubqW97fxpEilUw==
X-Received: by 2002:a63:7c5e:: with SMTP id l30mr697662pgn.276.1592281906422; 
 Mon, 15 Jun 2020 21:31:46 -0700 (PDT)
Received: from localhost ([122.172.119.132])
 by smtp.gmail.com with ESMTPSA id h35sm937737pje.29.2020.06.15.21.31.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jun 2020 21:31:45 -0700 (PDT)
Date: Tue, 16 Jun 2020 10:01:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Quentin Perret <qperret@google.com>
Subject: Re: [PATCH 2/2] cpufreq: Specify default governor on command line
Message-ID: <20200616043143.obk5k3rv737j5dnd@vireshk-i7>
References: <20200615165554.228063-1-qperret@google.com>
 <20200615165554.228063-3-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615165554.228063-3-qperret@google.com>
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
Cc: juri.lelli@redhat.com, kernel-team@android.com, vincent.guittot@linaro.org,
 arnd@arndb.de, rafael@kernel.org, peterz@infradead.org,
 adharmap@codeaurora.org, linux-pm@vger.kernel.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, mingo@redhat.com, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, tkjos@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15-06-20, 17:55, Quentin Perret wrote:
> +static void cpufreq_get_default_governor(void)
> +{
> +	default_governor = cpufreq_parse_governor(cpufreq_param_governor);
> +	if (!default_governor) {
> +		if (*cpufreq_param_governor)
> +			pr_warn("Failed to find %s\n", cpufreq_param_governor);
> +		default_governor = cpufreq_default_governor();

A module_get() never happened for this case and so maybe a
module_put() should never get called.

> +	}
> +}
> +
> +static void cpufreq_put_default_governor(void)
> +{
> +	if (!default_governor)
> +		return;
> +	module_put(default_governor->owner);
> +	default_governor = NULL;
> +}
> +
>  static int cpufreq_init_governor(struct cpufreq_policy *policy)
>  {
>  	int ret;
> @@ -2701,6 +2721,8 @@ int cpufreq_register_driver(struct cpufreq_driver *driver_data)
>  
>  	if (driver_data->setpolicy)
>  		driver_data->flags |= CPUFREQ_CONST_LOOPS;
> +	else
> +		cpufreq_get_default_governor();
>  
>  	if (cpufreq_boost_supported()) {
>  		ret = create_boost_sysfs_file();
> @@ -2769,6 +2791,7 @@ int cpufreq_unregister_driver(struct cpufreq_driver *driver)
>  	subsys_interface_unregister(&cpufreq_interface);
>  	remove_boost_sysfs_file();
>  	cpuhp_remove_state_nocalls_cpuslocked(hp_online);
> +	cpufreq_put_default_governor();
>  
>  	write_lock_irqsave(&cpufreq_driver_lock, flags);
>  
> @@ -2792,4 +2815,5 @@ static int __init cpufreq_core_init(void)
>  	return 0;
>  }

And since this is a per boot thing, there is perhaps no need of doing
these at driver register/unregister, I would rather do it at:
cpufreq_core_init() time itself and so we will never need to run
cpufreq_put_default_governor() and so can be removed.

And another thing I am not able to understand (despite you commenting
about that in the commit log) is what happens if the default governor
chosen is built as a module ?

-- 
viresh
