Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C081812443
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 02:04:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=NdDHrqNw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrDdS0Gwyz3cRp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 12:04:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=NdDHrqNw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrDcb6wB1z2yN8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 12:03:27 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-77f552d4179so350543385a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 17:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702515802; x=1703120602; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kotqopmhql9RPm3S4FTj2FqpufLgCsxyuc5LZys4ifw=;
        b=NdDHrqNw9IML3sChjyEIjM7VbVpl2/1AU+/X5AqbZ4rdWyz7ihW5xrLITQMCvl3vOT
         vIIhagGO2Rn+pxD3JmQnAgcjAG9wkdOhsYaAslirWvOT6n9bQLro+6bqoh1ttSB0AzGF
         Qrwwv04v9MKNO0w0b9zAPLW+pnRvXyUU6HD5g0XxC7vSEMzPazzjUliSZwEsx46dRFvn
         IKxteMUToAQyweSG1+jtyJldQl1WW8a6ukEwXZQVsvCg/snVBIaKbvxv5LX1OAansr9I
         jRtG8+yhlOv38Zgk4wPyqXQ+4QYVHhC0zYUh73lYHUAWljsp5JRYtvYfhl8rTkiSggLk
         mVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702515802; x=1703120602;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kotqopmhql9RPm3S4FTj2FqpufLgCsxyuc5LZys4ifw=;
        b=APxlV3aMK8QUJUlGdt8JSxX0VcOg9G8GDgpVABUaMI/7Xzdt+5KijIHjkowGSZ9WGL
         CFan+yGb4n+dB0IWoSSFfFh5GxSidcfHgr/p+7CbruqsDSK0SxZAVtPE7F4TOjxDQ1F0
         cTqK3d89epzQvyYHwvP4mNh6ul2hZqFhjatF6o4SZDHmmV1jY8+W+AKyfaUHz+1PbVfY
         PMXhAJNeCx8XveP4oG6fIwrwNg7XVfd3qazTgXq05y4ffSctkd2saeaQ8lqeX10HKMXi
         jFLV4ADNODJ8ScVjMaZrSb8oxVtzXJriofckczBE5tq5pflVCWPJQH1InaEKmc4HX3hQ
         aPdA==
X-Gm-Message-State: AOJu0YxJJF93vE4/MJD2x7MQSd23A2LnsdzflWHwnhxkgvD0c5O2dq0r
	e0Rdi2xoalL/ThYg2EkauzRH3w==
X-Google-Smtp-Source: AGHT+IFjYn4/wlSclY9FQAk7x1h05GKodk6C3zlVMTJ3BbOMNQ8WP5BrWLxO1hQ2sob52mgNqAJxdQ==
X-Received: by 2002:a05:620a:1034:b0:77f:2734:4c5d with SMTP id a20-20020a05620a103400b0077f27344c5dmr9834012qkk.130.1702515801849;
        Wed, 13 Dec 2023 17:03:21 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:a1d1:dd74:a6de:fdf? ([2600:1700:2000:b002:a1d1:dd74:a6de:fdf])
        by smtp.gmail.com with ESMTPSA id ul9-20020a05620a6d0900b0077f0d3bac3bsm4896980qkn.76.2023.12.13.17.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 17:03:21 -0800 (PST)
Message-ID: <7ed20fcf-8a9d-40d5-b913-b5d2da443cd6@sifive.com>
Date: Wed, 13 Dec 2023 19:03:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/12] drm/amd/display: Use
 ARCH_HAS_KERNEL_FPU_SUPPORT
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-11-samuel.holland@sifive.com>
 <87h6kpdj20.fsf@mail.lhotse>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <87h6kpdj20.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>, Timothy Pearson <tpearson@raptorengineering.com>, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-12-11 6:23 AM, Michael Ellerman wrote:
> Hi Samuel,
> 
> Thanks for trying to clean all this up.
> 
> One problem below.
> 
> Samuel Holland <samuel.holland@sifive.com> writes:
>> Now that all previously-supported architectures select
>> ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol instead
>> of the existing list of architectures. It can also take advantage of the
>> common kernel-mode FPU API and method of adjusting CFLAGS.
>>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ...
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>> index 4ae4720535a5..b64f917174ca 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>> @@ -87,20 +78,9 @@ void dc_fpu_begin(const char *function_name, const int line)
>>  	WARN_ON_ONCE(!in_task());
>>  	preempt_disable();
>>  	depth = __this_cpu_inc_return(fpu_recursion_depth);
>> -
>>  	if (depth == 1) {
>> -#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>> +		BUG_ON(!kernel_fpu_available());
>>  		kernel_fpu_begin();
>> -#elif defined(CONFIG_PPC64)
>> -		if (cpu_has_feature(CPU_FTR_VSX_COMP))
>> -			enable_kernel_vsx();
>> -		else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP))
>> -			enable_kernel_altivec();
>  
> Note altivec.
> 
>> -		else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
>> -			enable_kernel_fp();
>> -#elif defined(CONFIG_ARM64)
>> -		kernel_neon_begin();
>> -#endif
>>  	}
>>  
>>  	TRACE_DCN_FPU(true, function_name, line, depth);
>> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> index ea7d60f9a9b4..5aad0f572ba3 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> @@ -25,40 +25,8 @@
>>  # It provides the general basic services required by other DAL
>>  # subcomponents.
>>  
>> -ifdef CONFIG_X86
>> -dml_ccflags-$(CONFIG_CC_IS_GCC) := -mhard-float
>> -dml_ccflags := $(dml_ccflags-y) -msse
>> -endif
>> -
>> -ifdef CONFIG_PPC64
>> -dml_ccflags := -mhard-float -maltivec
>> -endif
> 
> And altivec is enabled in the flags there.
> 
> That doesn't match your implementation for powerpc in patch 7, which
> only deals with float.
> 
> I suspect the AMD driver actually doesn't need altivec enabled, but I
> don't know that for sure. It compiles without it, but I don't have a GPU
> to actually test. I've added Timothy on Cc who added the support for
> powerpc to the driver originally, hopefully he has a test system.

I tested this series on a POWER9 system with an AMD Radeon RX 6400 GPU (which
requires this FPU code to initialize), and got functioning graphics output.

> Anyway if that's true that it doesn't need altivec we should probably do
> a lead-up patch that drops altivec from the AMD driver explicitly, eg.
> as below.

That makes sense to me. Do you want to provide your Signed-off-by so I can send
this patch with your authorship?

Regards,
Samuel

> cheers
> 
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> index 4ae4720535a5..0de16796466b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> @@ -92,11 +92,7 @@ void dc_fpu_begin(const char *function_name, const int line)
>  #if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>  		kernel_fpu_begin();
>  #elif defined(CONFIG_PPC64)
> -		if (cpu_has_feature(CPU_FTR_VSX_COMP))
> -			enable_kernel_vsx();
> -		else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP))
> -			enable_kernel_altivec();
> -		else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
> +		if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
>  			enable_kernel_fp();
>  #elif defined(CONFIG_ARM64)
>  		kernel_neon_begin();
> @@ -125,11 +121,7 @@ void dc_fpu_end(const char *function_name, const int line)
>  #if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>  		kernel_fpu_end();
>  #elif defined(CONFIG_PPC64)
> -		if (cpu_has_feature(CPU_FTR_VSX_COMP))
> -			disable_kernel_vsx();
> -		else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP))
> -			disable_kernel_altivec();
> -		else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
> +		if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
>  			disable_kernel_fp();
>  #elif defined(CONFIG_ARM64)
>  		kernel_neon_end();
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index 6042a5a6a44f..554c39024a40 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -31,7 +31,7 @@ dml_ccflags := $(dml_ccflags-y) -msse
>  endif
>  
>  ifdef CONFIG_PPC64
> -dml_ccflags := -mhard-float -maltivec
> +dml_ccflags := -mhard-float
>  endif
>  
>  ifdef CONFIG_ARM64
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> index acff3449b8d7..7b51364084b5 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> @@ -30,7 +30,7 @@ dml2_ccflags := $(dml2_ccflags-y) -msse
>  endif
>  
>  ifdef CONFIG_PPC64
> -dml2_ccflags := -mhard-float -maltivec
> +dml2_ccflags := -mhard-float
>  endif
>  
>  ifdef CONFIG_ARM64

