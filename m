Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8601A5FE623
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 02:19:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpRpS0hwNz3dsk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 11:19:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Hqw7LX+M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Hqw7LX+M;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpRmg1rWFz3cf2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 11:17:55 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id n18-20020a17090ade9200b0020b0012097cso6854487pjv.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 17:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wrslMZ2QYGwlTjkSjOE53DFE17yfkkz5/a3RIe7cfhw=;
        b=Hqw7LX+MQulLhDgnWbwN49dFqjIQFiqstB5kc/ardcXUaCn0i8nvkXft80HPDKU12a
         si09fOpIrdKle00c+sAlMzdt04gu102T8wZPIUBTssmZ9VHpKZ19vJmdXims4Uc1UaP1
         JL37SD6yEBsQiaofdyI7SZrJjDwBSuKwMuZc1KFDhXzixby71lQOsrWJTAgucrefpOO0
         1lbNyYELYgQXPGAkBbaSGYNJrUjGL6QAzqn099cUyQ7U0G5fPtGiBOXcRpA90Xubt4Re
         XGyxFtLdfUAQR/BDzc9XXkhRxD2u8orUWmpTny8F5iRtb6ZUL9JPNrvGVvMPeBtlSO2C
         9RwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrslMZ2QYGwlTjkSjOE53DFE17yfkkz5/a3RIe7cfhw=;
        b=bH1MmryXZRsGwxzFGX6oZAkqjLosul8uUfm4c3wk1roTCzGDhiV6COHFyqHL8MxKT3
         mO7Vhgi7EcGqOryhOcHss6uvX2iittP3BIV/AVxJXefR7V93Q2Qy8zg9l8Pl2JoIWg+0
         sZgrdUIQuDXkMhm1z9tyDJi1vNIlB4BC5mzHbJZQ2nOMCPi4RLR+iK97tRzw6LI5cElT
         eFuN/d68yt+0j/lTcLBu9PVCwW54fqkDGHb7C/wu8X9vm4F7Sg/YiPiiNgBlUFNlPEmy
         fV48E5OLWgO+oW2xvZXd19tZk1TwiaMqccJUK5ANeZLXZr+3mEEfi3+D0dvefzF0bVMu
         NtLQ==
X-Gm-Message-State: ACrzQf2gaB5Br7wudExr+efhQksNyUcRvf1Owkjty9iZZfg+84YmRjWY
	gYmNZxa3T+HFVetYspMxtC+kfJtZ5rY=
X-Google-Smtp-Source: AMsMyM76TJWPD7z1UsBl1Ne6us7NXJus+Y8qEbxuulIfVmyshbhW3S1k4gKSohVOE2k+IdK37WL2Bg==
X-Received: by 2002:a17:903:2402:b0:184:29:8ac0 with SMTP id e2-20020a170903240200b0018400298ac0mr2495074plo.174.1665706673447;
        Thu, 13 Oct 2022 17:17:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b5-20020a63cf45000000b0044e8d66ae05sm284970pgj.22.2022.10.13.17.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 17:17:53 -0700 (PDT)
Date: Thu, 13 Oct 2022 17:17:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] powerpc/64s: Fix hash__change_memory_range
 preemption warning
Message-ID: <20221014001752.GB412544@roeck-us.net>
References: <20221013151647.1857994-1-npiggin@gmail.com>
 <20221013151647.1857994-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013151647.1857994-2-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 14, 2022 at 01:16:46AM +1000, Nicholas Piggin wrote:
> stop_machine_cpuslocked takes a mutex so it must be called in a
> preemptible context, so it can't simply be fixed by disabling
> preemption.
> 
> This is not a bug, because CPU hotplug is locked, so this processor will
> call in to the stop machine function. So raw_smp_processor_id() could be
> used. This leaves a small chance that this thread will be migrated to
> another CPU, so the master work would be done by a CPU from a different
> context. Better for test coverage to make that a common case by just
> having the first CPU to call in become the master.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/powerpc/mm/book3s64/hash_pgtable.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
> index 747492edb75a..51f48984abca 100644
> --- a/arch/powerpc/mm/book3s64/hash_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
> @@ -404,7 +404,8 @@ EXPORT_SYMBOL_GPL(hash__has_transparent_hugepage);
>  
>  struct change_memory_parms {
>  	unsigned long start, end, newpp;
> -	unsigned int step, nr_cpus, master_cpu;
> +	unsigned int step, nr_cpus;
> +	atomic_t master_cpu;
>  	atomic_t cpu_counter;
>  };
>  
> @@ -478,7 +479,8 @@ static int change_memory_range_fn(void *data)
>  {
>  	struct change_memory_parms *parms = data;
>  
> -	if (parms->master_cpu != smp_processor_id())
> +	// First CPU goes through, all others wait.
> +	if (atomic_xchg(&parms->master_cpu, 1) == 1)
>  		return chmem_secondary_loop(parms);
>  
>  	// Wait for all but one CPU (this one) to call-in
> @@ -516,7 +518,7 @@ static bool hash__change_memory_range(unsigned long start, unsigned long end,
>  		chmem_parms.end = end;
>  		chmem_parms.step = step;
>  		chmem_parms.newpp = newpp;
> -		chmem_parms.master_cpu = smp_processor_id();
> +		atomic_set(&chmem_parms.master_cpu, 0);
>  
>  		cpus_read_lock();
>  
> -- 
> 2.37.2
> 
