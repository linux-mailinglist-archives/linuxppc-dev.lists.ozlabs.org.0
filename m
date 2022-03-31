Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 114DD4ED183
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 04:06:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTRVN0DsNz2yp0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 13:06:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lODsWBk0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22d;
 helo=mail-oi1-x22d.google.com; envelope-from=mopsfelder@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lODsWBk0; dkim-atps=neutral
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTRTg43mKz2xrv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 13:05:26 +1100 (AEDT)
Received: by mail-oi1-x22d.google.com with SMTP id i7so9848049oie.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 19:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=2KZB9O9VaEuIRPzk59nDfe3jgou6nPZYFwgpKjxjEgQ=;
 b=lODsWBk02vcg0ELZaK9hFS2dR4t6UDV42MBqaQJt552nqu0BoEQ3HnbMAAcsCrEUIy
 On0YexEbi5ALpwrsjc86IxCAoTzx/UHvbzLn4Dfc9huUXL3QGlbNx9v6XQPsbDVDV8N5
 orGvUXu5cqqj6qcUr3a7tH+0ULrgVwe98Wbsax5GXO+iyp+0fOO+J2EBCSaCWIFHtptQ
 Z9nautidgk4hNputsFOOjqBc4tpx9nVyPnGK0B7+6hp6SUuuDjXtZZRXExunUzvhEg50
 JwGW6TwEvyE9y4GcMno76HzWxdacw+CELDFyNXQOYXBGFJTy/clHohxYVqQmw1tY4zn9
 YF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2KZB9O9VaEuIRPzk59nDfe3jgou6nPZYFwgpKjxjEgQ=;
 b=i7B+tuJDiBhIN0/yqry7MYOT5GaXCuFsCDQoKnYfppYiof+V4RDCClhWN5mk2lMtGc
 cVDhLqnw3IRabCdNG+ui4NxuFWLktUbCvkdpjU3G9AZWG2lVWS6dzJ1HiIIa5B1IwYeD
 V546LJ4MErY2OWh62JVHxFeLinLL+PfmOFsR7bH5RBGgrTbPvzz1EF5Q0m9dogTVzWQ2
 EnBUdObpkguBaStSru7pZaUFthvSUbnEtbnfIAK4en7IEeCdPuqhHXBfFRQH6FEpKmI+
 TPBJfAZ/VxJWG9xQN93tjwqTNTdQxgYQsyUQ3SZ6q8ROWA4OkCZW2gNsYSZyKI5xOvNJ
 OwTQ==
X-Gm-Message-State: AOAM532WL9KjjzJttvKJM1UB+d3boT69ToVFh/mMdysJF6sAAmeP0Z0P
 U+BzsZ3Dc2IiB0erXHkJQdo=
X-Google-Smtp-Source: ABdhPJyn7tswaZjZGn7aSSec6HWKvw3KWbxiODBh4o0ITBYDd5JDG/o1jW9mjfWmH2mabZLubzWxZA==
X-Received: by 2002:a05:6808:2083:b0:2f7:5d2e:15f8 with SMTP id
 s3-20020a056808208300b002f75d2e15f8mr1713334oiw.66.1648692322812; 
 Wed, 30 Mar 2022 19:05:22 -0700 (PDT)
Received: from ?IPV6:2804:2230:8010:16c0::2? ([2804:2230:8010:16c0::2])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a056830121300b005cdb11a7b85sm11326765otp.29.2022.03.30.19.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 19:05:22 -0700 (PDT)
Message-ID: <815770fb-3247-baab-f8ca-eed7b99213d1@gmail.com>
Date: Wed, 30 Mar 2022 23:05:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH] powerpc/boot: Build wrapper for an appropriate CPU
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20220330112437.540214-1-joel@jms.id.au>
From: =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <mopsfelder@gmail.com>
In-Reply-To: <20220330112437.540214-1-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Joel.

On 3/30/22 08:24, Joel Stanley wrote:
> Currently the boot wrapper lacks a -mcpu option, so it will be built for
> the toolchain's default cpu. This is a problem if the toolchain defaults
> to a cpu with newer instructions.
> 
> We could wire in TARGET_CPU but instead use the oldest supported option
> so the wrapper runs anywhere.
> 
> The GCC documentation stays that -mcpu=powerpc64le will give us a
> generic 64 bit powerpc machine:
> 
>   -mcpu=powerpc, -mcpu=powerpc64, and -mcpu=powerpc64le specify pure
>   32-bit PowerPC (either endian), 64-bit big endian PowerPC and 64-bit
>   little endian PowerPC architecture machine types, with an appropriate,
>   generic processor model assumed for scheduling purposes.
> 
> So do that for each of the three machines.
> 
> This bug was found when building the kernel with a toolchain that
> defaulted to powre10, resulting in a pcrel enabled wrapper which fails
> to link:
> 
>   arch/powerpc/boot/wrapper.a(crt0.o): in function `p_base':
>   (.text+0x150): call to `platform_init' lacks nop, can't restore toc; (toc save/adjust stub)
>   (.text+0x154): call to `start' lacks nop, can't restore toc; (toc save/adjust stub)
>   powerpc64le-buildroot-linux-gnu-ld: final link failed: bad value
> 
> Even with tha bug worked around the resulting kernel would crash on a
> power9 box:
> 
>   $ qemu-system-ppc64 -nographic -nodefaults -M powernv9 -kernel arch/powerpc/boot/zImage.epapr -serial mon:stdio
>   [    7.069331356,5] INIT: Starting kernel at 0x20010020, fdt at 0x3068c628 25694 bytes
>   [    7.130374661,3] ***********************************************
>   [    7.131072886,3] Fatal Exception 0xe40 at 00000000200101e4    MSR 9000000000000001
>   [    7.131290613,3] CFAR : 000000002001027c MSR  : 9000000000000001
>   [    7.131433759,3] SRR0 : 0000000020010050 SRR1 : 9000000000000001
>   [    7.131577775,3] HSRR0: 00000000200101e4 HSRR1: 9000000000000001
>   [    7.131733687,3] DSISR: 00000000         DAR  : 0000000000000000
>   [    7.131905162,3] LR   : 0000000020010280 CTR  : 0000000000000000
>   [    7.132068356,3] CR   : 44002004         XER  : 00000000
> 
> Link: https://github.com/linuxppc/issues/issues/400
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> Tested:
> 
>   - ppc64le_defconfig
>   - pseries and powernv qemu, for power8, power9, power10 cpus
>   - buildroot compiler that defaults to -mcpu=power10 (gcc 10.3.0, ld 2.36.1)
>   -  RHEL9 cross compilers (gcc 11.2.1-1, ld 2.35.2-17.el9)
> 
> All decompressed and made it into the kernel ok.
> 
> ppc64_defconfig did not work, as we've got a regression when the wrapper
> is built for big endian. It hasn't worked for zImage.pseries for a long
> time (at least v4.14), and broke some time between v5.4 and v5.17 for
> zImage.epapr.
> 
>   arch/powerpc/boot/Makefile | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 9993c6256ad2..1f5cc401bfc0 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -38,9 +38,13 @@ BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
>   		 $(LINUXINCLUDE)
>   
>   ifdef CONFIG_PPC64_BOOT_WRAPPER
> -BOOTCFLAGS	+= -m64
> +ifdef CONFIG_CPU_LITTLE_ENDIAN
> +BOOTCFLAGS	+= -m64 -mcpu=powerpc64le
>   else
> -BOOTCFLAGS	+= -m32
> +BOOTCFLAGS	+= -m64 -mcpu=powerpc64
> +endif
> +else
> +BOOTCFLAGS	+= -m32 -mcpu=powerpc
>   endif
>   
>   BOOTCFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)

I think it was a fortunate coincidence that the default cpu type of your gcc is
compatible with your system.  If the distro gcc moves its default to a newer cpu
type than your system, this bug would happen again.

The command "gcc -v |& grep with-cpu" will show you the default cpu type for 32
and 64-bit that gcc was configured.

Considering the CONFIG_TARGET_CPU for BOOTCFLAGS would bring some level of
consistency between CFLAGS and BOOTCFLAGS regarding -mcpu value.

We could mimic the behaviour from arch/powerpc/Makefile:

     166 ifdef config_ppc_book3s_64
     167 ifdef config_cpu_little_endian
     168 cflags-$(config_generic_cpu) += -mcpu=power8
     169 cflags-$(config_generic_cpu) += $(call cc-option,-mtune=power9,-mtune=power8)
     170 else
     171 cflags-$(config_generic_cpu) += $(call cc-option,-mtune=power7,$(call cc-option,-mtune=power5))
     172 cflags-$(config_generic_cpu) += $(call cc-option,-mcpu=power5,-mcpu=power4)
     173 endif
     174 else ifdef config_ppc_book3e_64
     175 cflags-$(config_generic_cpu) += -mcpu=powerpc64
     176 endif
     ...
     185 CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))

Cheers!

-- 
Murilo
