Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEBFDBBEF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 06:29:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vY2S35vvzDqVd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 15:29:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="XEk+TXgF"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vY0c0CThzDqSV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 15:27:23 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id q5so3012699pfg.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 21:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FUYBDax7NE3CDwWsYLZOhPAtyneP9Q/Jy0zNmRGZwqk=;
 b=XEk+TXgFbeAE3e37n2OZJ2gc7DQz2UgSVuKwMUCPB2WRmo4ZEUyFBRhanr7tQGVC9X
 qcOGvaw04wTYnk45J4bCBIcwnn6fx7r/2v6wIVQQrsNQ1iIw+v8h94s9XUgVWug4aA6O
 qD8xN/3mgtupJyvN1mFLQzjJ8+J9zeamLEoam6KnRYkgKSMDMvt18aS7XAvqvZuy2o4E
 9EVmvS3JmM21cgRhd4/8ObOSiFvEpeBIJqLHBMJb6kBIilkuoxPvkA7UpE4Kpld/aPl2
 HV1zUNsO6vCMZ2rE8TS0bEtnoi9IMLjHZ/hW61XLGt5k6q22OPcDcp9ewwTgTLi3sz/z
 HUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FUYBDax7NE3CDwWsYLZOhPAtyneP9Q/Jy0zNmRGZwqk=;
 b=es5SmXhQNX7TXkj1NCIx6N3dGbrvuJZp98waJibsZyxq2f7oZvveg1hv5dLsp6261I
 RClA1IeHAcBqIB3Q52bjlLHbS6fkdo891tYaVtr/3FVlAkc+fIx7YBzSzSxKGN0CmLmE
 9KAwIR8qm1/uzbUNBIdDI2YBtY35FADqyVphRrVNWb4hehwfegn2ebEB7MvWXBQE0HPr
 FaFAXY8qm1N54Vgcr+tkuH23NaVHZSVZiWlTz4kcG3TMM0synMKjIbIm7h2JCqiyo0wZ
 /8IOCXvOptTK7eU3iojC1o7kyYELm0PSCp0KsH/9CkMft39MMZqAVNxJd/v7ma/PVZCw
 nY6g==
X-Gm-Message-State: APjAAAVYErCyriflD7TYRtsYJN5mmlZBC3C5s+ADthIcpYqsqc8nlfIs
 aTe/sr8ySku+iO1t/TQ5vprsEQ==
X-Google-Smtp-Source: APXvYqwu8XgdnF2JM+MIZ5+YJ18wqOQAMwBOQsDC97X7zyp+1ufZ3YNe9XktzUrdJo31658oXdc7GA==
X-Received: by 2002:a17:90a:17c4:: with SMTP id
 q62mr8306937pja.83.1571372840048; 
 Thu, 17 Oct 2019 21:27:20 -0700 (PDT)
Received: from localhost ([122.172.151.112])
 by smtp.gmail.com with ESMTPSA id q6sm6160453pgn.44.2019.10.17.21.27.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Oct 2019 21:27:18 -0700 (PDT)
Date: Fri, 18 Oct 2019 09:57:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH] cpufreq: powernv: fix stack bloat and NR_CPUS limitation
Message-ID: <20191018042715.f76bawmoyk66isap@vireshk-i7>
References: <20191018000431.1675281-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018000431.1675281-1-jhubbard@nvidia.com>
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
Cc: linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 LKML <linux-kernel@vger.kernel.org>,
 Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>,
 Preeti U Murthy <preeti@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17-10-19, 17:04, John Hubbard wrote:
> The following build warning occurred on powerpc 64-bit builds:
> 
> drivers/cpufreq/powernv-cpufreq.c: In function 'init_chip_info':
> drivers/cpufreq/powernv-cpufreq.c:1070:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]

How come we are catching this warning after 4 years ?

> 
> This is due to putting 1024 bytes on the stack:
> 
>     unsigned int chip[256];
> 
> ...and while looking at this, it also has a bug: it fails with a stack
> overrun, if CONFIG_NR_CPUS > 256.
> 
> Fix both problems by dynamically allocating based on CONFIG_NR_CPUS.
> 
> Fixes: 053819e0bf840 ("cpufreq: powernv: Handle throttling due to Pmax capping at chip level")
> Cc: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
> Cc: Preeti U Murthy <preeti@linux.vnet.ibm.com>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Rafael J. Wysocki <rjw@rjwysocki.net>
> Cc: linux-pm@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
> 
> Hi,
> 
> I have only compile-tested this, so I would appreciate if anyone
> could do a basic runtime test on it. But (famous last words) it
> seems simple enough that I'm confident it's correct. oh boy. :)
> 
> thanks,
> John Hubbard
> NVIDIA
> 
>  drivers/cpufreq/powernv-cpufreq.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
> index 6061850e59c9..78e04402125f 100644
> --- a/drivers/cpufreq/powernv-cpufreq.c
> +++ b/drivers/cpufreq/powernv-cpufreq.c
> @@ -1041,9 +1041,14 @@ static struct cpufreq_driver powernv_cpufreq_driver = {
>  
>  static int init_chip_info(void)
>  {
> -	unsigned int chip[256];
> +	unsigned int *chip;
>  	unsigned int cpu, i;
>  	unsigned int prev_chip_id = UINT_MAX;
> +	int ret = 0;
> +
> +	chip = kcalloc(CONFIG_NR_CPUS, sizeof(int), GFP_KERNEL);

                                       sizeof(*chip)

> +	if (!chips)

           (!chip)

> +		return -ENOMEM;
>  
>  	for_each_possible_cpu(cpu) {
>  		unsigned int id = cpu_to_chip_id(cpu);
> @@ -1055,8 +1060,10 @@ static int init_chip_info(void)
>  	}
>  
>  	chips = kcalloc(nr_chips, sizeof(struct chip), GFP_KERNEL);
> -	if (!chips)
> -		return -ENOMEM;
> +	if (!chips) {
> +		ret = -ENOMEM;
> +		goto free_and_return;
> +	}
>  
>  	for (i = 0; i < nr_chips; i++) {
>  		chips[i].id = chip[i];
> @@ -1066,7 +1073,9 @@ static int init_chip_info(void)
>  			per_cpu(chip_info, cpu) =  &chips[i];
>  	}
>  
> -	return 0;
> +free_and_return:
> +	kfree(chip);
> +	return ret;
>  }
>  
>  static inline void clean_chip_info(void)
> -- 
> 2.23.0

-- 
viresh
