Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1303BF021
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 21:18:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKq3320tzz3blL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 05:18:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=GhGgdo1u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c29;
 helo=mail-oo1-xc29.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GhGgdo1u; dkim-atps=neutral
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GKq2Y1lBHz307r
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jul 2021 05:18:12 +1000 (AEST)
Received: by mail-oo1-xc29.google.com with SMTP id
 128-20020a4a11860000b029024b19a4d98eso767267ooc.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jul 2021 12:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=Y7Q51/7FLsCms66glLj41BP5mqecTdjNWpQEsIZ8maA=;
 b=GhGgdo1uZFPwlJDhrxzSSKETzBZEfVoXMQ3Ml4ZKUlafAZUF4OHN0xRl5PnsgDfxFq
 1jGcfEat3uGzVNqztVDKGxfT5VJXWYgroBb86qiN71d63McvKGeGGaBTphuvzI9JRRVT
 +zkEuUnlZz9XlhMPlhTuA5lOC0NIxmRfNTd4MjWU7osgUy6IjX9ihL6S77qRBnzlkN23
 0O4qjM/uhD+wxl4nKCLRGkT2MUyCA/tgWdiUSbCYNTPfNdUfaFO/+Y8IZxC4cisUn2BU
 FJIwsnKM8W5jUkSiT7Vc8QZzWNg/BygY0M64pesU7o+j2b3HeBqmmV0Im1uw6z/6n69e
 M3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mime-version:content-disposition;
 bh=Y7Q51/7FLsCms66glLj41BP5mqecTdjNWpQEsIZ8maA=;
 b=R06jGlguwqRnZYtCVD8B9ogLMS9Qka88b3IXeG58tljecDSH/SyOqTvDX8PtErPYOB
 0h4QIuhBdUjLoc+r8HKgFKckKwdn7FKGHkZ0l5MMx7XMeHxbiev/70ZAXMXXYjWKzxM+
 wpvQvUaFCm5oiYMvmcaNHuYYUbTK6AzL80qsRQC5EemrKNJoY8sR1+c1IQP19Bfzb14s
 yDGZ/6Wu4EWdr4xTvINVVK/pkFSqPwA51WnV9AYU3uUUWf7Oh0C/i/rmAiYOGBqE2MbU
 Z8e7lJkcshT/U/m1UUB/DhTTU3FsyKdZoWzOJJ8CIcXZQLrOMKF1Cus1r7jB50AOKFfE
 ueuQ==
X-Gm-Message-State: AOAM5302efg8G25JYsQ8cKn52klAXH47ZgGVHaMp7Op62Q9cDp3Zr7A1
 XA2F6IKeUz8A+pllM+f0Teg=
X-Google-Smtp-Source: ABdhPJxhpgZtFpXxgiq4iFjsks77cNfTgE5hakcSlpkJO0GiSRepWq4Fn3wdns7pp1X2Xlw/4ENwVw==
X-Received: by 2002:a4a:8687:: with SMTP id x7mr19627528ooh.46.1625685488815; 
 Wed, 07 Jul 2021 12:18:08 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id h25sm990890oop.15.2021.07.07.12.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 12:18:08 -0700 (PDT)
Date: Wed, 7 Jul 2021 12:18:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH] powerpc: preempt: Don't touch the idle task's
 preempt_count during hotplug
Message-ID: <20210707191806.GA2205122@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 07, 2021 at 07:38:31PM +0100, Valentin Schneider wrote:
> Powerpc currently resets a CPU's idle task preempt_count to 0 before said
> task starts executing the secondary startup routine (and becomes an idle
> task proper).
> 
> This conflicts with commit
> 
>   f1a0a376ca0c ("sched/core: Initialize the idle task with preemption disabled")
> 
> which initializes all of the idle tasks' preempt_count to PREEMPT_DISABLED
> during smp_init(). Note that this was superfluous before said commit, as
> back then the hotplug machinery would invoke init_idle() via
> idle_thread_get(), which would have already reset the CPU's idle task's
> preempt_count to PREEMPT_ENABLED.
> 
> Get rid of this preempt_count write.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Fixes: f1a0a376ca0c ("sched/core: Initialize the idle task with preemption disabled")
> Reported-by: Bharata B Rao <bharata@linux.ibm.com>
> Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/powerpc/platforms/cell/smp.c    | 3 ---
>  arch/powerpc/platforms/pseries/smp.c | 5 +----
>  2 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/cell/smp.c b/arch/powerpc/platforms/cell/smp.c
> index c855a0aeb49c..d7ab868aab54 100644
> --- a/arch/powerpc/platforms/cell/smp.c
> +++ b/arch/powerpc/platforms/cell/smp.c
> @@ -78,9 +78,6 @@ static inline int smp_startup_cpu(unsigned int lcpu)
>  
>  	pcpu = get_hard_smp_processor_id(lcpu);
>  
> -	/* Fixup atomic count: it exited inside IRQ handler. */
> -	task_thread_info(paca_ptrs[lcpu]->__current)->preempt_count	= 0;
> -
>  	/*
>  	 * If the RTAS start-cpu token does not exist then presume the
>  	 * cpu is already spinning.
> diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
> index 096629f54576..7ebf3382816a 100644
> --- a/arch/powerpc/platforms/pseries/smp.c
> +++ b/arch/powerpc/platforms/pseries/smp.c
> @@ -105,10 +105,7 @@ static inline int smp_startup_cpu(unsigned int lcpu)
>  		return 1;
>  	}
>  
> -	/* Fixup atomic count: it exited inside IRQ handler. */
> -	task_thread_info(paca_ptrs[lcpu]->__current)->preempt_count	= 0;
> -
> -	/* 
> +	/*
>  	 * If the RTAS start-cpu token does not exist then presume the
>  	 * cpu is already spinning.
>  	 */
> -- 
> 2.25.1
> 
