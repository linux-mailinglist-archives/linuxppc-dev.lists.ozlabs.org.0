Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69392189188
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 23:36:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hp1157CqzDqvd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 09:36:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=a4AYWaPY; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hntv1cGrzDqBY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 09:30:46 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id m15so12495904pgv.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 15:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=wPJg6k1Sfn4B+Mn0ckVM+kQDp/J12ZPy70SP4OqLIKc=;
 b=a4AYWaPYTV1Ov4C4bMzAohMy1SC9tLz+W2ucVsXcKXrISG2pEufjEu65pVsU1Ulzxc
 SIInJL8CAWvEzvc4bd9aGw48Zr0Q1cHy+J5QxTenCh7Wo/xUBrzI0zUgcp71syQ4Ud38
 jykLe4l8oLtY3FBM1DHX2IV9hs8tkHyakVKQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=wPJg6k1Sfn4B+Mn0ckVM+kQDp/J12ZPy70SP4OqLIKc=;
 b=N9n7Gy7yoG8nev8b1645dorGEXzlG5kN+CQAqcw9rzEWKDe5LkGL75cxCg57aNfGl/
 pR2y/obz+D2dQEgUgoDtqKpMwT0dPlrOgnB0kpXy27KmtlMAVuqJ7qE1s5p6eLZ4RNj5
 Be2NebwuKrsrFjtvf464TIHoh+KYtlxnTTRG0ae3BBwET9WDNq1vdJnPWlh/++0JFCgC
 pTW4VDGAX8BxNPU1n/iB7YYZx2Q/5jZIOqIbItyw27M2h32KmM5Ky89zsB/zI+prWTOV
 JEO+PriK5tc/8QxzTqB8b37alyYRKJYYOvZoRypPa/H5v7pjED9jIamVmVTpcL7iUG03
 Z3bQ==
X-Gm-Message-State: ANhLgQ3LJCA3aM0AOHwwzROuxcc9QZfgT+LTre5TiFiuGZ1yHBU+xK/7
 1tyWN2wxGl0Fh8b64+3FVqbJqQ==
X-Google-Smtp-Source: ADFU+vtJ/d67T1c/j3elk3aQsSMEmbYNSCFaYEz7RmgX8uPiCI1o36kNu92JJiiS8LO+Qa1lkIqiog==
X-Received: by 2002:a63:741c:: with SMTP id p28mr1255502pgc.402.1584484243489; 
 Tue, 17 Mar 2020 15:30:43 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-11e1-e7cb-3c10-05d6.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:11e1:e7cb:3c10:5d6])
 by smtp.gmail.com with ESMTPSA id a2sm348002pjq.20.2020.03.17.15.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 15:30:42 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Pratik Rajesh Sampat <psampat@linux.ibm.com>, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 psampat@linux.ibm.com, pratik.r.sampat@gmail.com, ego@linux.vnet.ibm.com
Subject: Re: [PATCH] cpufreq: powernv: Fix frame-size-overflow in
 powernv_cpufreq_work_fn
In-Reply-To: <20200316135743.57735-1-psampat@linux.ibm.com>
References: <20200316135743.57735-1-psampat@linux.ibm.com>
Date: Wed, 18 Mar 2020 09:30:39 +1100
Message-ID: <87fte6obqo.fsf@dja-thinkpad.axtens.net>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Pratik,

Thanks.

I have checked:

 - for matching puts/gets
 - that all the '.' to '->' conversions, aud uses of '&' check out
 - that the Snowpatch checks pass (https://patchwork.ozlabs.org/patch/1255580/)

On that basis:

Reviewed-by: Daniel Axtens <dja@axtens.net>

Regards,
Daniel

> The patch avoids allocating cpufreq_policy on stack hence fixing frame
> size overflow in 'powernv_cpufreq_work_fn'
>
> Fixes: 227942809b52 ("cpufreq: powernv: Restore cpu frequency to policy->cur on unthrottling")
> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
> ---
>  drivers/cpufreq/powernv-cpufreq.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
> index 56f4bc0d209e..20ee0661555a 100644
> --- a/drivers/cpufreq/powernv-cpufreq.c
> +++ b/drivers/cpufreq/powernv-cpufreq.c
> @@ -902,6 +902,7 @@ static struct notifier_block powernv_cpufreq_reboot_nb = {
>  void powernv_cpufreq_work_fn(struct work_struct *work)
>  {
>  	struct chip *chip = container_of(work, struct chip, throttle);
> +	struct cpufreq_policy *policy;
>  	unsigned int cpu;
>  	cpumask_t mask;
>  
> @@ -916,12 +917,14 @@ void powernv_cpufreq_work_fn(struct work_struct *work)
>  	chip->restore = false;
>  	for_each_cpu(cpu, &mask) {
>  		int index;
> -		struct cpufreq_policy policy;
>  
> -		cpufreq_get_policy(&policy, cpu);
> -		index = cpufreq_table_find_index_c(&policy, policy.cur);
> -		powernv_cpufreq_target_index(&policy, index);
> -		cpumask_andnot(&mask, &mask, policy.cpus);
> +		policy = cpufreq_cpu_get(cpu);
> +		if (!policy)
> +			continue;
> +		index = cpufreq_table_find_index_c(policy, policy->cur);
> +		powernv_cpufreq_target_index(policy, index);
> +		cpumask_andnot(&mask, &mask, policy->cpus);
> +		cpufreq_cpu_put(policy);
>  	}
>  out:
>  	put_online_cpus();
> -- 
> 2.24.1
