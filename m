Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CACB08A0395
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 00:48:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=fCiUu5BC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFHzg3rKcz3vXf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 08:48:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=fCiUu5BC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFHys4wG0z2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 08:47:33 +1000 (AEST)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5aa17c29ba0so2684049eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 15:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712789250; x=1713394050; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jexQJX0oM9fCmEvziBSolme7TKZ0EEYhwHpwJAChgvs=;
        b=fCiUu5BC1Wjpx6dIiCw/igd5R0omTTPHgm8+2m9+sdNDefRYgYBm0/NUMOUrTCFoVl
         SpGEXyFkNWIxQitLECg6KceoFzMdUB7B5upmOO18xiCkhFVbn+Ggimcpf+JtDeUum0wC
         3qpb+UMIHEJxI6Bg0rQV/q9j+qo8YoQ6kvECN/DS5POwKJXx4NOIYlGNwWRaZyEBqjEu
         V5TG+18aSPkXQVLpPiTULhunONOVCs8UzVTIKAg3uEqUc5fkZbviLKN64mD8xv7ON09j
         zl6FqiT8kYbp2lq3lQ3W7/4vKBF4JxeZSIF+7n+zBeYLEIyijX+DdavYlvGeDV4vH87v
         zwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712789250; x=1713394050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jexQJX0oM9fCmEvziBSolme7TKZ0EEYhwHpwJAChgvs=;
        b=PGAbCQF+VjoNYaNec0q/XgAAo1/Xfq6/EL2GlTYxSDjBfBgyquFyTt84xmy570AnS5
         X4qEfHnC4d+gb/ab4O6f/QkKD+L3OIeFpVIGYCyHyC555AYQeDBAJ3Iin7PTITalIG8Z
         pVCj9f0pAjqlIYLA8ryXtn4KzJCp1tavFnwxeL58fYuD6v7/fq6dpnx2AeEqrvJuMSoW
         y4HSQAVDi8auACb3CMHYf3YXaYEtTJiXGbfAJIQaksNQEYn0GsBEviFa/iqHayPzTRjx
         AgQjPhrrt3DgBcaOvHp0nRDy719787B5WSttimZwQUV4Z640WDfN5nvS6EpOtBY+JW0U
         Cj+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFIAqIMpJivA7GBabjXuRR4Qu5FmQ4E3v4Gu/1Z22nbtfDQOvc2MoQf8CF3gypbOymhleNMp1lJiuiT0CaYQDWWwiSGtnvy712RR57fA==
X-Gm-Message-State: AOJu0YzX92XbwgjciXly1r/ukyY5haGGWPwE9wH8cDM+Geg1JgUe9qxO
	S3ZbZlePV5iOa4yLd4VAv9EXUXRXRRcGNtpb4z5ECrklvM3Jq9Xub2+Vl5WykRQ=
X-Google-Smtp-Source: AGHT+IHLiKUoeBUB4OwLHReX4a7dcUh2Eqxld9pK8ip3FgSpidJgLmLzuSWt1Fnkq1wrPVQWu86Qjg==
X-Received: by 2002:a05:6871:80a:b0:22d:f859:2225 with SMTP id q10-20020a056871080a00b0022df8592225mr3914938oap.6.1712789249782;
        Wed, 10 Apr 2024 15:47:29 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.167])
        by smtp.gmail.com with ESMTPSA id lf3-20020a0568700c4300b0022eba51882fsm75970oab.53.2024.04.10.15.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 15:47:29 -0700 (PDT)
Message-ID: <75a37a4b-f516-40a3-b6b5-4aa1636f9b60@sifive.com>
Date: Wed, 10 Apr 2024 17:47:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
To: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com>
 <87wmp4oo3y.fsf@linaro.org>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <87wmp4oo3y.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thiago,

On 2024-04-10 5:21 PM, Thiago Jung Bauermann wrote:
> Samuel Holland <samuel.holland@sifive.com> writes:
> 
>> Now that all previously-supported architectures select
>> ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol instead
>> of the existing list of architectures. It can also take advantage of the
>> common kernel-mode FPU API and method of adjusting CFLAGS.
>>
>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> 
> Unfortunately this patch causes build failures on arm with allyesconfig
> and allmodconfig. Tested with next-20240410.
> 
> Error with allyesconfig:
> 
> $ make -j 8 \
>     O=$HOME/.cache/builds/linux-cross-arm \
>     ARCH=arm \
>     CROSS_COMPILE=arm-linux-gnueabihf-
> make[1]: Entering directory '/home/bauermann/.cache/builds/linux-cross-arm'
>     ⋮
> arm-linux-gnueabihf-ld: drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.o: in function `dcn20_populate_dml_pipes_from_context':
> dcn20_fpu.c:(.text+0x20f4): undefined reference to `__aeabi_l2d'
> arm-linux-gnueabihf-ld: dcn20_fpu.c:(.text+0x210c): undefined reference to `__aeabi_l2d'
> arm-linux-gnueabihf-ld: dcn20_fpu.c:(.text+0x2124): undefined reference to `__aeabi_l2d'
> arm-linux-gnueabihf-ld: dcn20_fpu.c:(.text+0x213c): undefined reference to `__aeabi_l2d'
> arm-linux-gnueabihf-ld: drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.o: in function `pipe_ctx_to_e2e_pipe_params':
> dcn_calcs.c:(.text+0x390): undefined reference to `__aeabi_l2d'
> arm-linux-gnueabihf-ld: drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.o:dcn_calcs.c:(.text+0x3a4): more undefined references to `__aeabi_l2d' follow
> arm-linux-gnueabihf-ld: drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.o: in function `optimize_configuration':
> dml2_wrapper.c:(.text+0xcbc): undefined reference to `__aeabi_d2ulz'
> arm-linux-gnueabihf-ld: drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.o: in function `populate_dml_plane_cfg_from_plane_state':
> dml2_translation_helper.c:(.text+0x9e4): undefined reference to `__aeabi_l2d'
> arm-linux-gnueabihf-ld: dml2_translation_helper.c:(.text+0xa20): undefined reference to `__aeabi_l2d'
> arm-linux-gnueabihf-ld: dml2_translation_helper.c:(.text+0xa58): undefined reference to `__aeabi_l2d'
> arm-linux-gnueabihf-ld: dml2_translation_helper.c:(.text+0xa90): undefined reference to `__aeabi_l2d'
> make[3]: *** [/home/bauermann/src/linux/scripts/Makefile.vmlinux:37: vmlinux] Error 1
> make[2]: *** [/home/bauermann/src/linux/Makefile:1165: vmlinux] Error 2
> make[1]: *** [/home/bauermann/src/linux/Makefile:240: __sub-make] Error 2
> make[1]: Leaving directory '/home/bauermann/.cache/builds/linux-cross-arm'
> make: *** [Makefile:240: __sub-make] Error 2
> 
> The error with allmodconfig is slightly different:
> 
> $ make -j 8 \
>     O=$HOME/.cache/builds/linux-cross-arm \
>     ARCH=arm \
>     CROSS_COMPILE=arm-linux-gnueabihf-
> make[1]: Entering directory '/home/bauermann/.cache/builds/linux-cross-arm'
>     ⋮
> ERROR: modpost: "__aeabi_d2ulz" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "__aeabi_l2d" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> make[3]: *** [/home/bauermann/src/linux/scripts/Makefile.modpost:145: Module.symvers] Error 1
> make[2]: *** [/home/bauermann/src/linux/Makefile:1876: modpost] Error 2
> make[1]: *** [/home/bauermann/src/linux/Makefile:240: __sub-make] Error 2
> make[1]: Leaving directory '/home/bauermann/.cache/builds/linux-cross-arm'
> make: *** [Makefile:240: __sub-make] Error 2

In both cases, the issue is that the toolchain requires runtime support to
convert between `unsigned long long` and `double`, even when hardware FP is
enabled. There was some past discussion about GCC inlining some of these
conversions[1], but that did not get implemented.

The short-term fix would be to drop the `select ARCH_HAS_KERNEL_FPU_SUPPORT` for
32-bit arm until we can provide these runtime library functions.

Regards,
Samuel

[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91970
