Return-Path: <linuxppc-dev+bounces-1725-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBB298D05D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2024 11:44:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJVJX4g2Qz2yNs;
	Wed,  2 Oct 2024 19:44:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727862267;
	cv=none; b=JixslhgjhiNJYbOq1k5gRLagV4yenUWkhEBurxsi1rlACUlEueTPoXews8X/FBGDj3m1TMcFyrpd0Rn9ZuHxNGfuh1DASsl6Ul6ul9k4s4BuqR92+7h5YnOyOMDsxBNX9QhKxVnt2PyWjEFMPn7W0b2bVkDJ5R4oNBANg+N56d5xuJBFS1Yev9UlZbTbQ3oQRYMJFzWK74QCAiy/pjiYZyTnJPXGUsExIvlpM4gDHrMl7YfATlUqc3yD0lbYh2+S/85BhNxmmiijl4yOnseZFlrt9ny/1NQXAyKV275Jm5pYoNjUkKOXfeMkoUger24l3DNDqlG4Zfaf4eaXBbfggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727862267; c=relaxed/relaxed;
	bh=KbNeEOBRlBQ4W4QTFBiGzbZCYE8gT06BwQpa9ZprJWg=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ULHLCFiaX6WgYl5qjBXmVcrR2ywuZEzsJlUP8dnoylFnGr7C4A4j7yoPm4UVDmO9Trp28bfsnXUQkPO8YiYblzMif1zUoSQXQ+sx98u88fiHMpxgeCCtyKf4Bs8ClUijE/OwGDOgUPAt8+9uyrD0jcx/eHA+aTnD1ANejE2an4i6PlHWKBi83Xcuq3XU9MXWx60MfKcOihWYLNLYoVhGmAW0OKtrDbVm5pc48waZWKSh/7lsTM5p7aGXGO/9EVDDUyvewkFTjaiM0FRrMnWpmyW0eR4YHYgYP8f4Gkyre9CioFpA3+nrhwteCFCEURw3F351hWVtfX8lDipukNSQow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WfstEY9P; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=E1m6jm20; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WfstEY9P;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=E1m6jm20;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJVJW478cz2xpf
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2024 19:44:27 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727862262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KbNeEOBRlBQ4W4QTFBiGzbZCYE8gT06BwQpa9ZprJWg=;
	b=WfstEY9PzoFots3K8sjQFzkfjgmJ36EbTbOY3KCsRX+I7jfyn9lhennyOmf6CaW/WnN/Mp
	ypz0utH0oCVCkl9xAoZzh+i1EZKgqkmrbtjFGWGCWCRK4ifaPzxdy9+Wro3hPywAyS1EdN
	kalyXkjMAiE3CTYq6CNxpYsAD+/dyZP9KZ/zSjlDOEiaOLZKlbHpyKHe4pgafIIvGOsJJA
	hVRvlXFWudfM6XMYkAIJKLdedfA7S9QR1EypbppSzpJGrNafiOrpsDAL5OX5BfAa3ex6Tt
	ijt+DkUulNHeEzOWa9Q17JYhb1dUKrrcrQn6wy8PPfaOCOvmiYUgM77Viv+rng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727862262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KbNeEOBRlBQ4W4QTFBiGzbZCYE8gT06BwQpa9ZprJWg=;
	b=E1m6jm20jqxHfOCJ/Xt2T2iLoTRcMbXtWawTfdP8xBkMd/MowmPhKLCziAKxbsFzBr/BDr
	lgV66gndQLwT+vDw==
To: Costa Shulyupin <costa.shul@redhat.com>, longman@redhat.com,
 ming.lei@redhat.com, pauld@redhat.com, juri.lelli@redhat.com,
 vschneid@redhat.com, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Zefan Li
 <lizefan.x@bytedance.com>, Tejun Heo <tj@kernel.org>, Johannes Weiner
 <hannes@cmpxchg.org>, Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
 Ingo Molnar
 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Costa Shulyupin <costa.shul@redhat.com>, Bjorn
 Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, cgroups@vger.kernel.org
Subject: Re: [RFC PATCH v3 1/3] sched/isolation: Add infrastructure for
 dynamic CPU isolation
In-Reply-To: <20240916122044.3056787-2-costa.shul@redhat.com>
References: <20240916122044.3056787-1-costa.shul@redhat.com>
 <20240916122044.3056787-2-costa.shul@redhat.com>
Date: Wed, 02 Oct 2024 11:44:22 +0200
Message-ID: <87jzeqyh3d.ffs@tglx>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Sep 16 2024 at 15:20, Costa Shulyupin wrote:
> +/*
> + * housekeeping_update - change housekeeping.cpumasks[type] and propagate the
> + * change.
> + */
> +static int housekeeping_update(enum hk_type type, const struct cpumask *update)
> +{
> +	struct {
> +		struct cpumask changed;
> +		struct cpumask enable;
> +		struct cpumask disable;
> +	} *masks;
> +
> +	masks = kmalloc(sizeof(*masks), GFP_KERNEL);
> +	if (!masks)
> +		return -ENOMEM;
> +
> +	lockdep_assert_cpus_held();
> +	cpumask_xor(&masks->changed, housekeeping_cpumask(type), update);
> +	cpumask_and(&masks->enable, &masks->changed, update);
> +	cpumask_andnot(&masks->disable, &masks->changed, update);
> +	cpumask_copy(housekeeping.cpumasks[type], update);
> +	WRITE_ONCE(housekeeping.flags, housekeeping.flags | BIT(type));

So this sets the bit for the type

> +	if (!static_branch_unlikely(&housekeeping_overridden))
> +		static_key_enable_cpuslocked(&housekeeping_overridden.key);

What's the point of doing this on every iteration?

> +	kfree(masks);
> +
> +	return 0;
> +}
> +
>  static int __init housekeeping_setup(char *str, unsigned long flags)
>  {
>  	cpumask_var_t non_housekeeping_mask, housekeeping_staging;
> @@ -327,8 +357,11 @@ int housekeeping_exlude_isolcpus(const struct cpumask *isolcpus, unsigned long f
>  		/*
>  		 * Reset housekeeping to bootup default
>  		 */
> +
> +		for_each_clear_bit(type, &boot_hk_flags, HK_TYPE_MAX)
> +			housekeeping_update(type, cpu_possible_mask);

Even for those which are clear

>  		for_each_set_bit(type, &boot_hk_flags, HK_TYPE_MAX)
> -			cpumask_copy(housekeeping.cpumasks[type], boot_hk_cpumask);
> +			housekeeping_update(type, boot_hk_cpumask);
>  
>  		WRITE_ONCE(housekeeping.flags, boot_hk_flags);

Just to overwrite them with boot_hk_flags afterwards. That does not make
any sense at all.

Thanks,

        tglx

