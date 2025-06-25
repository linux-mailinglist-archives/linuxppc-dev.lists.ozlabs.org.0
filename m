Return-Path: <linuxppc-dev+bounces-9793-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD81AE915A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 00:53:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSHD73j8Zz2xYl;
	Thu, 26 Jun 2025 08:53:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750892007;
	cv=none; b=Y+U5EPTMk8pt3Wsps2WI+w25gFNykp1MP48yc4qkSx2jyLbic4WdGfR1kkOG8qiRSIuu9kLL6ExVPRqk8C7zJUap7ovWAQmMeVCWpy1bnYVV47C/a644o+Cg2TCF+C7FtNGgoK5db7LdoBAcJUYsqfJTDsPukfLv4b6/q2heD9n4OBqhS7RS4tQvlkCDTT+vww3E4IH7uUzIDt9AvAZKYPI8R9gy45TD/fOAvZL982HY5NaduQ98CcNbHUeE9DYgTufluoEMqOpTrhkP5YuFVVTCkFcml9AG8cEXeeNukFJUuMKJizOj89fMp4DcwUh2BXR4HYjqWfjrR4Vv0/dpSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750892007; c=relaxed/relaxed;
	bh=yjVZNJVj1VyecmvfQv75DLyG9gWL1xdoouzFtGiwWo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iU4g6FTRWrFA4X+yECZF/sf0BDKSlPWoWOUK7qUWdvsZjnLCPdC0LRlNrqngibxfMZEZRJXIwnYwWLr0tcXaxThZ6LBERVlB3913utBWibqDvGaBzajpXw41P0AvTbz+YhrQUfhLcz4Se4bF3rz86CZJP0A341T+D4N5nOWzv4idsAuNNsQ/dMsskGtbsgvaZEAoIqPubeqQTiRwLl9syExDzLokt9RCjzWHlHB1HKJINRMMrIwUoOR8EBvtT+v4FIH02nMmKmgPejC3I7Yu/ChQ0tDWCQQWxpTJn+/jOSjCRHRbIMX7XkUjwy4U7PG8cErVzb+cMo9LRFh6eWaiuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Sxcwmnda; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Sxcwmnda;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSHD64F0vz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 08:53:25 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-742c7a52e97so505275b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 15:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750892003; x=1751496803; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yjVZNJVj1VyecmvfQv75DLyG9gWL1xdoouzFtGiwWo8=;
        b=SxcwmndanX1raiv6x5TDW1HsSFSbyAViTLM7GAmTgf4AxvB6l0EWmbtQNpGPMYlBAK
         A/pzB2VIrH8SYPBv3/yqaD0X/qqXi+umx+sUI0v8XFSyv3W9ubBamAuixUanBWVtdkZa
         KOH9+zaJwEl9oFK3blagNsRnEOKTt6S4PC/HsUYIQtnOkFW0LZkcj0JCMR4gIhkHUIYg
         YB/EcRgwf0NDlIyNQbernZrs+jiyWq+463Ib+RsKOLmc7wPWuGZlKYCnyI0xPuzBGTnt
         9X+tSFJcWlwoPOqCJRHQnBTvqAopiheQ3NPBb3OuxRQSJ2Eov6LlyhuxAWhS9MOVcOi7
         +B5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750892003; x=1751496803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjVZNJVj1VyecmvfQv75DLyG9gWL1xdoouzFtGiwWo8=;
        b=FXVGlEpzkvT6XNe6u8e3gMPTXit86RoVKt993MUDI/AfMf23a9s9RGWgy0k+jYut3o
         JbG5NkHLd56MxJ7rtV12KGiInYTfGkmS5nMEAgQrfXYSR0WwywkeoM5umEkYR174ojc+
         FFTIz7xbNg5zeIUeNU0v7f+A6zWieYzqKb/qtwcdFKPcCB1RGJs0vj3NLN2seMdB8x8Q
         rPepqFNdzUiyq7jMjR3Bdq4e/I84U6jO9fSmO1LU+C4w9Z5tMMrEmf20XnZncWdzFW+L
         F1a6wNTHEhn3iNZ/c1WKorVhC5r9xC1cMgRzPo/YlzX9mXDmaq6F7ff9VPRdb2YTWEta
         YAfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHVTROuRk1AOUvlxClEtzqcahs04PYNd+s5kiUINacbqTuJelzLwEAokGJkiXTJWit+tiho9GePnqskG4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw48DPK0NJ+CqiMGETsfOWQUuwg6q5vpbOLoP6bcy11TtCVSpT+
	tx2culVc4bstgTDAw23KUzId7kzJOfCvgC6bGuATjoCCA0fzwozJAEQr
X-Gm-Gg: ASbGnctnVPHMLmf9o6J/q5kfz93rDcAIlcDwfjMgwh0XAJfPviKZn5A3V21ueUbu8/4
	lDFHk//bkKg4UIoCEH7yO9nx1/KVLZqb55VaVxd2OdtAsJnrTOyMlWvfB8rWHvAH95cJmiHbnR+
	BCeg1ftKuvegsi67p6zaSvFmTkiSrlJmb6ZqxrbQeH0IWXAGSqAGbso8wkVgwvEDrE8qqmW3OgV
	M2D9v11otT8AN/C9KvUZ83u1QOc7GCGHkZjkbusXDFNCSHIyy8pudnMNoclWML78ZdaeFb8okBj
	oBBVSMHDo22D5LlCR5htKpLwlEYXWIz+wTZSLOrqz9oEUsVFIazhRHG36W+Ui0Jrau9phEOv
X-Google-Smtp-Source: AGHT+IE88beKHh6OBkAbtxFt7Nvsoy5yyN1uxp5998LeU3T9z5d9GIj7QrS9GiVPtDjcAz7GT8jNfQ==
X-Received: by 2002:a05:6a00:2185:b0:747:ab61:e4fa with SMTP id d2e1a72fcca58-74ad456a27emr6990406b3a.14.1750892003065;
        Wed, 25 Jun 2025 15:53:23 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8850c9fsm5735950b3a.109.2025.06.25.15.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 15:53:22 -0700 (PDT)
Date: Wed, 25 Jun 2025 18:53:20 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tglx@linutronix.de, maddy@linux.ibm.com,
	vschneid@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	kprateek.nayak@amd.com, huschle@linux.ibm.com, srikar@linux.ibm.com,
	linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu,
	linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
Subject: Re: [RFC v2 9/9] [DEBUG] powerpc: add debug file for set/unset cpu
 avoid
Message-ID: <aFx94BDKk_WJ48pK@yury>
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
 <20250625191108.1646208-10-sshegde@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625191108.1646208-10-sshegde@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 26, 2025 at 12:41:08AM +0530, Shrikanth Hegde wrote:
> Reference patch for how an architecture can make use of this infra. 
> 
> This is not meant to be merged. Instead the vp_manual_hint should either
> come from hardware or could be derived using steal time. 

If you don't add any code that manages the 'avoid' mask on the host
side, all this becomes a dead code.
 
> When the provided hint is less than the total CPUs in the system, it
> will enable the cpu avoid static key and set those CPUs as avoid. 
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/paravirt.h |  2 ++
>  arch/powerpc/kernel/smp.c           | 50 +++++++++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
> index b78b82d66057..b6497e0b60d8 100644
> --- a/arch/powerpc/include/asm/paravirt.h
> +++ b/arch/powerpc/include/asm/paravirt.h
> @@ -10,6 +10,8 @@
>  #include <asm/hvcall.h>
>  #endif
>  
> +DECLARE_STATIC_KEY_FALSE(paravirt_cpu_avoid_enabled);
> +
>  #ifdef CONFIG_PPC_SPLPAR
>  #include <linux/smp.h>
>  #include <asm/kvm_guest.h>
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 5ac7084eebc0..e00cdc4de441 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -64,6 +64,7 @@
>  #include <asm/systemcfg.h>
>  
>  #include <trace/events/ipi.h>
> +#include <linux/debugfs.h>
>  
>  #ifdef DEBUG
>  #include <asm/udbg.h>
> @@ -82,6 +83,7 @@ bool has_big_cores __ro_after_init;
>  bool coregroup_enabled __ro_after_init;
>  bool thread_group_shares_l2 __ro_after_init;
>  bool thread_group_shares_l3 __ro_after_init;
> +static int vp_manual_hint = NR_CPUS;
>  
>  DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
>  DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
> @@ -1727,6 +1729,7 @@ static void __init build_sched_topology(void)
>  	BUG_ON(i >= ARRAY_SIZE(powerpc_topology) - 1);
>  
>  	set_sched_topology(powerpc_topology);
> +	vp_manual_hint = num_present_cpus();
>  }
>  
>  void __init smp_cpus_done(unsigned int max_cpus)
> @@ -1807,4 +1810,51 @@ void __noreturn arch_cpu_idle_dead(void)
>  	start_secondary_resume();
>  }
>  
> +/*
> + * sysfs hint to mark CPUs as Avoid. This will help in restricting
> + * the workload to specified number of CPUs.
> + * For example 40 > vp_manual_hint means, workload will run on
> + * 0-39 CPUs.
> + */
> +
> +static int pv_vp_manual_hint_set(void *data, u64 val)
> +{
> +	int cpu;
> +
> +	if (val == 0 || vp_manual_hint > num_present_cpus())
> +		vp_manual_hint = num_present_cpus();
> +
> +	if (val != vp_manual_hint)
> +		vp_manual_hint = val;

This all is effectively just:

	vp_manual_hint = val;

Isn't?

> +	if (vp_manual_hint < num_present_cpus())
> +		static_branch_enable(&paravirt_cpu_avoid_enabled);
> +	else
> +		static_branch_disable(&paravirt_cpu_avoid_enabled);
> +
> +	for_each_present_cpu(cpu) {
> +		if (cpu >= vp_manual_hint)
> +			set_cpu_avoid(cpu, true);
> +		else
> +			set_cpu_avoid(cpu, false);
> +	}
> +	return 0;
> +}
> +
> +static int pv_vp_manual_hint_get(void *data, u64 *val)
> +{
> +	*val = vp_manual_hint;
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(fops_pv_vp_manual_hint, pv_vp_manual_hint_get, pv_vp_manual_hint_set, "%llu\n");
> +
> +static __init int paravirt_debugfs_init(void)
> +{
> +	if (is_shared_processor())
> +		debugfs_create_file("vp_manual_hint", 0600, arch_debugfs_dir, NULL, &fops_pv_vp_manual_hint);
> +	return 0;
> +}
> +
> +device_initcall(paravirt_debugfs_init)
>  #endif
> -- 
> 2.43.0

