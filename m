Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 475FB27668A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 04:36:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxfM40TB6zDqJg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 12:36:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=nMOilMQA; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxfKG1PFVzDq97
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 12:35:12 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id v14so775515pjd.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 19:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=E3hzNOlv1EP95890wmnfMkV4k9D4ny9aKGSYsEXtBUw=;
 b=nMOilMQAZKbI4kE3ovsgZ2cjn+wn8nSGubG53jYjG18lksT/j/9v4F8y3yPPXcx91l
 L24AaUb3QK4MBYDi4xzDSVdOfy6Y1ExvIcqZXl5zx8pDnExTEB/5PZo7n43IDouE7M6S
 g+LCj4kt0VMqg7u/hJTOhtOSBcNPNktZx3usI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=E3hzNOlv1EP95890wmnfMkV4k9D4ny9aKGSYsEXtBUw=;
 b=THsifRkoRwTh6IwYxJmEZQF07Ogx5sotlTUr4al5BaWxdDJCHrSFM9CmXMCdsXuc9y
 ggpOHQUOCZNHykmM6KXuTa3376NYZzgBGAHA0aKiggNmoRUTpXUlHMxDkvqSgj/4Jbve
 lyxpUmE6tycYIbuxc0oEq92veS4nmwPmY/L7K+DK7BI2+PIC3qwBj5VsWkPIQYKZW0wg
 V5ZzI6YiuEU5GF3SHPncEUzSK6cPG0F5+WPbAXGC8o8d6mTNTJlf5qRDX0edyz32px4x
 AoGl880F3W9ru6Tu3XVkNv3GMAxPF14OHg7agzEUuPzfSFId/hDZCnkKDaAnBOF1PFcH
 BF4w==
X-Gm-Message-State: AOAM533Yf43XS9PWXugdVNJOoj2xofLEv1vsIVHQeo3ZbOi4ipmBBQbL
 lmLNSJ3Q2qiIm+3eq5De7GPUTg==
X-Google-Smtp-Source: ABdhPJz47+LNvgUyuIaJJL9T1IlY9xTaaWtnaJD2kJnJAzXshGQvgBuria81Opcd/bD/Bdq2d1E+Pw==
X-Received: by 2002:a17:902:bc8a:b029:d2:2a0b:f09e with SMTP id
 bb10-20020a170902bc8ab02900d22a0bf09emr2568344plb.33.1600914909276; 
 Wed, 23 Sep 2020 19:35:09 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-b45d-1a4b-2a15-d1fa.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:b45d:1a4b:2a15:d1fa])
 by smtp.gmail.com with ESMTPSA id 11sm999724pgp.21.2020.09.23.19.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 19:35:08 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] cpufreq: powernv: Fix frame-size-overflow in
 powernv_cpufreq_reboot_notifier
In-Reply-To: <20200922080254.41497-1-srikar@linux.vnet.ibm.com>
References: <20200922080254.41497-1-srikar@linux.vnet.ibm.com>
Date: Thu, 24 Sep 2020 12:35:05 +1000
Message-ID: <87wo0joqau.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Pratik Rajesh Sampat <psampat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Srikar,

> The patch avoids allocating cpufreq_policy on stack hence fixing frame
> size overflow in 'powernv_cpufreq_reboot_notifier'
>
> ./drivers/cpufreq/powernv-cpufreq.c: In function _powernv_cpufreq_reboot_notifier_:
> ./drivers/cpufreq/powernv-cpufreq.c:906:1: error: the frame size of 2064 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
>  }
>  ^
> cc1: all warnings being treated as errors
> make[3]: *** [./scripts/Makefile.build:316: drivers/cpufreq/powernv-cpufreq.o] Error 1
> make[2]: *** [./scripts/Makefile.build:556: drivers/cpufreq] Error 2
> make[1]: *** [./Makefile:1072: drivers] Error 2
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:157: sub-make] Error 2
>

This looks a lot like commit d95fe371ecd2 ("cpufreq: powernv: Fix frame-size-overflow in powernv_cpufreq_work_fn").

As with that patch, I have checked for matching puts/gets and that all
uses of '&' check out.

I tried to look at the snowpatch tests: they apparently reported a
checkpatch warning but the file has since disappeared so I can't see
what it was. Running checkpatch locally:

$ scripts/checkpatch.pl -g HEAD -strict
WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#15: 
make[3]: *** [./scripts/Makefile.build:316: drivers/cpufreq/powernv-cpufreq.o] Error 1

This is benign and you shouldn't wrap that line anyway.

On that basis:

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

> Fixes: cf30af76 ("cpufreq: powernv: Set the cpus to nominal frequency during reboot/kexec")
> Cc: Pratik Rajesh Sampat <psampat@linux.ibm.com>
> Cc: Daniel Axtens <dja@axtens.net>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  drivers/cpufreq/powernv-cpufreq.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
> index a9af15e..e439b43 100644
> --- a/drivers/cpufreq/powernv-cpufreq.c
> +++ b/drivers/cpufreq/powernv-cpufreq.c
> @@ -885,12 +885,15 @@ static int powernv_cpufreq_reboot_notifier(struct notifier_block *nb,
>  				unsigned long action, void *unused)
>  {
>  	int cpu;
> -	struct cpufreq_policy cpu_policy;
> +	struct cpufreq_policy *cpu_policy;
>  
>  	rebooting = true;
>  	for_each_online_cpu(cpu) {
> -		cpufreq_get_policy(&cpu_policy, cpu);
> -		powernv_cpufreq_target_index(&cpu_policy, get_nominal_index());
> +		cpu_policy = cpufreq_cpu_get(cpu);
> +		if (!cpu_policy)
> +			continue;
> +		powernv_cpufreq_target_index(cpu_policy, get_nominal_index());
> +		cpufreq_cpu_put(cpu_policy);
>  	}
>  
>  	return NOTIFY_DONE;
> -- 
> 1.8.3.1
