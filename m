Return-Path: <linuxppc-dev+bounces-11381-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF6AB3848B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 16:13:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBmht2G50z3bb2;
	Thu, 28 Aug 2025 00:13:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::649"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756303998;
	cv=none; b=IyEaJi/lW6G8xI4lK729/UUA2SxfbaE23/ihKgH193nM0Ux2nIQJBYMSbsWsI6Ic1Drr0qvN9jWj/Q5d3728OWXsu2WM5V300mwgfRJ87tYVglBvF5dPson3fZv7yULpIrtTQk9R7Bt9o3jtxyIA1YFfv82hAiJ/rcJVpS17ohbUTM4nY6fa41hwuwEhjmgt/uPcBBtGp2BZNhHvCLhwIKku7Lx/RuUUS60k7FbKeXXIDaCTDyZhnL/zkwNESScPG/ZzFsiSg7JOJDF0A+CyL/mk3HvF/DqOHS/iYz+NnVPO+eqTHMH6qvdI1cadNEMXXRDPCmJxmnpxjyTAalrw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756303998; c=relaxed/relaxed;
	bh=oT9Qx0pL0526DK73EqyoLYw0wsYmSjn2bOtkKWj9+LI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nivnfkFXnlTs5sfM1z0TAdnbZaKSkSUgPBelsGEdiuCvtLn8sXy2i3P2YoilWzWrNcOR1RBMZFN3kxVNd+7SKsk6XbBRNXfZJ6SZ79ZpszEXclRTLIAV6xboqjFe+GgIYkrF+87St51jc7D5McC+SmHWyUx4fWuaBkgILOqQoADctNK2BX7WynwQFwE5t74ogxeewJPIztOFf+xC/om5NEmnGjZSl+eB4jNziPwtrYtCQXiK/jeLaUcrM+occAgaIxyAQ72cWzz6Ak0YwTz8RVA2UtW0oX4IMIRUONcWQX5hTG4G0PVx/rrtDkIwL0euKpUafnf0QTMFhNm9JLsnhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=MEPh/dWb; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3erkvaaykdkyykgtpimuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=MEPh/dWb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3erkvaaykdkyykgtpimuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBmhr6V2Yz30TY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 00:13:16 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-24636484391so59558435ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 07:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756303993; x=1756908793; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oT9Qx0pL0526DK73EqyoLYw0wsYmSjn2bOtkKWj9+LI=;
        b=MEPh/dWbikuiHmZfUaKGxUgsGcz4nENkpHm48gw6ois5GmNkm7p+D9fNZolFOXDDQP
         xjuZ7UwN6Y2yzbJYmnxQOZrd92RAgYD8ATC9MLFD+ez5idwlM6FUQAozJ8Fir+0GO8Ge
         lMXvWb82z3Vwyd0sSw0ZJbg+w8Hi19lfliLgl1Yz1To/V3AwMO9iEXfuRZTFBvQumgnI
         O3ZP6lhN4TjBGYUQreFCNS1NNE0RFnydyjhRjJ3VLRB66Ihfr8RaEGO4qXPjllKSGdof
         9F/UDfTr1H8wPDHMU+fvBuFvp9fck5PV/Xu/7e56ro3aiVGZvvfdLibqJmhcGm/qqeoa
         jPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756303993; x=1756908793;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oT9Qx0pL0526DK73EqyoLYw0wsYmSjn2bOtkKWj9+LI=;
        b=s3poEYRQEgRQAsHSeKnaaghUARPfn9Us+YCGNVtU82A3FPZdhdNs1zgtcUh1yFQynJ
         wGyjtADXvObBIDBAEB8RdjlZvbTz5JyyJW3F4rRUlSuGgj6uAHdSfwGyID2LqD01Tt9k
         8D002yRkycFKxvlelVTyyAHvJtkMwTaDQnPZNhfKJpL85qev05QgINFnsLKpCP0VdIIw
         Ui9TGNmn7/rXtOD5zdcQb1cjN8tKOBDwf5JlZ7BV2YljGRNhmNtb4LFqs+3zcITCgqXH
         /Cz8EbmMEg+4vAbEBcFK9qBOtb7caEmnUhbSXGMCXwt6bjMcr5Qgr6CLOR1z8XGR/8ho
         NzaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYTxWdbPIvdeBQjpBfnxCQ+0EIoE5wR5yikScr1CFb/Ym7RzYsWl2BMEU9eGeixohICjTO7pqGlW8mZPw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyWvvbCdeWpSX5dGUB+jY+TDHh/Skh48mTrxyJT1HD6HRQJUJRl
	2D4HaECwm1L5aqdPO5uLFsf+DFXCNvnS2rZrnH7bNDMwcLOeTOPzBNyxZx8fVY8tPu9okIFPgnL
	EJjnn+A==
X-Google-Smtp-Source: AGHT+IGTSg2J3odWqRi5DzWDmdBYNRXtpWLMNIy0mlgNYPFM/YLwHCJkE7ruCavXPIcZq+6RDeJTdDhPxa4=
X-Received: from plan10.prod.google.com ([2002:a17:903:404a:b0:248:7792:b8da])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a8e:b0:246:620:a0b9
 with SMTP id d9443c01a7336-2462efcaaa3mr229124795ad.61.1756303993097; Wed, 27
 Aug 2025 07:13:13 -0700 (PDT)
Date: Wed, 27 Aug 2025 07:13:11 -0700
In-Reply-To: <20250827023202.10310-3-zhangzihuan@kylinos.cn>
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
Mime-Version: 1.0
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn> <20250827023202.10310-3-zhangzihuan@kylinos.cn>
Message-ID: <aK8Sd30K64mbN1Nt@google.com>
Subject: Re: [PATCH v2 02/18] KVM: x86: Use __free(put_cpufreq_policy) for
 policy reference
From: Sean Christopherson <seanjc@google.com>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Markus Mayer <mmayer@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	zhenglifeng <zhenglifeng1@huawei.com>, "H . Peter Anvin" <hpa@zytor.com>, Zhang Rui <rui.zhang@intel.com>, 
	Len Brown <lenb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Lukasz Luba <lukasz.luba@arm.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Beata Michalska <beata.michalska@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>, Sumit Gupta <sumitg@nvidia.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org, x86@kernel.org, 
	kvm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Aug 27, 2025, Zihuan Zhang wrote:
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  arch/x86/kvm/x86.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index a1c49bc681c4..2a825f4ec701 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -9492,16 +9492,14 @@ static void kvm_timer_init(void)
>  		max_tsc_khz = tsc_khz;
>  
>  		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
> -			struct cpufreq_policy *policy;
> +			struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  			int cpu;
>  
>  			cpu = get_cpu();
>  			policy = cpufreq_cpu_get(cpu);
> -			if (policy) {
> -				if (policy->cpuinfo.max_freq)
> -					max_tsc_khz = policy->cpuinfo.max_freq;
> -				cpufreq_cpu_put(policy);
> -			}
> +			if (policy && policy->cpuinfo.max_freq)
> +				max_tsc_khz = policy->cpuinfo.max_freq;
> +
>  			put_cpu();

Hmm, this is technically buggy.  __free() won't invoke put_cpufreq_policy() until
policy goes out of scope, and so using __free() means the code is effectively:

		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
			struct cpufreq_policy *policy;
			int cpu;

			cpu = get_cpu();
			policy = cpufreq_cpu_get(cpu);
			if (policy && policy->cpuinfo.max_freq)
				max_tsc_khz = policy->cpuinfo.max_freq;
			put_cpu();

			if (policy)
				cpufreq_cpu_put(policy);
		}

That's "fine" because the policy isn't truly referenced after preemption is
disabled, the lifecycle of the policy doesn't rely on preemption being disabled,
and KVM doesn't actually care which CPU is used to get the max frequency, i.e.
this would technically be "fine" too:

		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
			struct cpufreq_policy *policy;
			int cpu;

			cpu = get_cpu();
			policy = cpufreq_cpu_get(cpu);
			put_cpu();

			if (policy && policy->cpuinfo.max_freq)
				max_tsc_khz = policy->cpuinfo.max_freq;

			if (policy)
				cpufreq_cpu_put(policy);
		}

But given that the code we have today is perfectly readable, I don't see any
reason to switch to __free() given that's it's technically flawed.  So I'm very
strongly inclined to skip this patch and keep things as-is.

