Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FACF4EDCA3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 17:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTn7735SNz300Q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 02:20:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qlWLqKJv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=mopsfelder@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qlWLqKJv; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTn6S2yxTz2yPv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Apr 2022 02:19:59 +1100 (AEDT)
Received: by mail-qt1-x831.google.com with SMTP id 10so21661805qtz.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 08:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xPXri5kF6iCDbbJepC3htBqp2TLCdXkND2seQjYvKtI=;
 b=qlWLqKJvey8D5ANCKGmO2KZoH5TmCyfRXVgCwBj9MqaxNxdRb9UvLXtuI9F70cmikQ
 c9qi9OwEBsnsVAjJQ/6taRqFWYIdzSvIZLQaXdsHDmwPlRtrUI+JehXWXVZGkgxRA98R
 wFNtVwXsROEoht5ZdNlO1H7OVwP5NvzQwLYyCsfsstZg+JcSD21AL9/kVodgSCzp2A39
 UU0wXzyG/SbK/jbiwXmoV7zA+xQokINS9WRvbEServZN9ucSDtIOFGKv6YJuEZqHiW44
 TFqmlu9efNdrH+z+GS27JzccweWvSP1aWyZWCsg6AdAYFl9MZWHWbqwEhwmQPs0RfQBE
 XF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xPXri5kF6iCDbbJepC3htBqp2TLCdXkND2seQjYvKtI=;
 b=VsekXDwtUSKU5kDwBt96b4tCRP2Kmhex82gzfh5Ic8awq3wrSc2Fj4uFJsxIgq/6Ux
 +PfvLwlla98aERN/PyRMhUbKymwhlCBaaOQPbDdrp45ObUk182kiHkt++DLaKTV+uS9s
 /ofVanoZR41ftljXVTu51Ylp5LjN4T8hWGyDgQBgw8MRD9v5bpwXSKMXJo2zhYCCwNuQ
 R2QpMhMyJwHN9tBeqlsuKlGi3MEsDOU2grRrErlGL6e4KqbIvcqC5FU5c8ZkdlWiSCe6
 SVKgYAQt5JkY+dPQrxTm5wugI9YgNs3OlHXUFo3uxQL9iUMN9M2k2o/MfWEbBoiAFpiD
 MPGw==
X-Gm-Message-State: AOAM531nMnwLZbzBAfxp4OLSRqQOhg5m6SeJmrs192UArnl1ZmJ3YzgS
 7rgFnzCQQt3Vw/5kMxUUWKQ=
X-Google-Smtp-Source: ABdhPJxroLD1VG05Kgd2An2lKYLevdzhRCQEadZvP9PVLDW5wgGNYY7JNv629xr69Pcw1fPiRoh9qw==
X-Received: by 2002:a05:622a:1819:b0:2e0:6932:a249 with SMTP id
 t25-20020a05622a181900b002e06932a249mr4781407qtc.249.1648739995344; 
 Thu, 31 Mar 2022 08:19:55 -0700 (PDT)
Received: from ?IPV6:2804:2230:8010:16c0::2? ([2804:2230:8010:16c0::2])
 by smtp.gmail.com with ESMTPSA id
 11-20020ac8590b000000b002e1e5c5c866sm20753468qty.42.2022.03.31.08.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 08:19:54 -0700 (PDT)
Message-ID: <167db0bd-4f10-7751-36a2-fb9ec5b136a7@gmail.com>
Date: Thu, 31 Mar 2022 12:19:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH] powerpc/boot: Build wrapper for an appropriate CPU
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220330112437.540214-1-joel@jms.id.au>
 <815770fb-3247-baab-f8ca-eed7b99213d1@gmail.com>
 <CACPK8XdremqtJBKycbFZauky9C9yCb2S7+aZDxRtZ8fU41L=Ew@mail.gmail.com>
From: =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <mopsfelder@gmail.com>
In-Reply-To: <CACPK8XdremqtJBKycbFZauky9C9yCb2S7+aZDxRtZ8fU41L=Ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Joel.

On 3/31/22 02:01, Joel Stanley wrote:
> On Thu, 31 Mar 2022 at 02:05, Murilo Opsfelder Araújo
> <mopsfelder@gmail.com> wrote:
>>
>> Hi, Joel.
>>
>> On 3/30/22 08:24, Joel Stanley wrote:
>>> Currently the boot wrapper lacks a -mcpu option, so it will be built for
>>> the toolchain's default cpu. This is a problem if the toolchain defaults
>>> to a cpu with newer instructions.
>>>
>>> We could wire in TARGET_CPU but instead use the oldest supported option
>>> so the wrapper runs anywhere.
>>>
>>> The GCC documentation stays that -mcpu=powerpc64le will give us a
>>> generic 64 bit powerpc machine:
>>>
>>>    -mcpu=powerpc, -mcpu=powerpc64, and -mcpu=powerpc64le specify pure
>>>    32-bit PowerPC (either endian), 64-bit big endian PowerPC and 64-bit
>>>    little endian PowerPC architecture machine types, with an appropriate,
>>>    generic processor model assumed for scheduling purposes.
>>>
>>> So do that for each of the three machines.
>>>
>>> This bug was found when building the kernel with a toolchain that
>>> defaulted to powre10, resulting in a pcrel enabled wrapper which fails
>>> to link:
>>>
>>>    arch/powerpc/boot/wrapper.a(crt0.o): in function `p_base':
>>>    (.text+0x150): call to `platform_init' lacks nop, can't restore toc; (toc save/adjust stub)
>>>    (.text+0x154): call to `start' lacks nop, can't restore toc; (toc save/adjust stub)
>>>    powerpc64le-buildroot-linux-gnu-ld: final link failed: bad value
>>>
>>> Even with tha bug worked around the resulting kernel would crash on a
>>> power9 box:
>>>
>>>    $ qemu-system-ppc64 -nographic -nodefaults -M powernv9 -kernel arch/powerpc/boot/zImage.epapr -serial mon:stdio
>>>    [    7.069331356,5] INIT: Starting kernel at 0x20010020, fdt at 0x3068c628 25694 bytes
>>>    [    7.130374661,3] ***********************************************
>>>    [    7.131072886,3] Fatal Exception 0xe40 at 00000000200101e4    MSR 9000000000000001
>>>    [    7.131290613,3] CFAR : 000000002001027c MSR  : 9000000000000001
>>>    [    7.131433759,3] SRR0 : 0000000020010050 SRR1 : 9000000000000001
>>>    [    7.131577775,3] HSRR0: 00000000200101e4 HSRR1: 9000000000000001
>>>    [    7.131733687,3] DSISR: 00000000         DAR  : 0000000000000000
>>>    [    7.131905162,3] LR   : 0000000020010280 CTR  : 0000000000000000
>>>    [    7.132068356,3] CR   : 44002004         XER  : 00000000
>>>
>>> Link: https://github.com/linuxppc/issues/issues/400
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>> ---
>>> Tested:
>>>
>>>    - ppc64le_defconfig
>>>    - pseries and powernv qemu, for power8, power9, power10 cpus
>>>    - buildroot compiler that defaults to -mcpu=power10 (gcc 10.3.0, ld 2.36.1)
>>>    -  RHEL9 cross compilers (gcc 11.2.1-1, ld 2.35.2-17.el9)
>>>
>>> All decompressed and made it into the kernel ok.
>>>
>>> ppc64_defconfig did not work, as we've got a regression when the wrapper
>>> is built for big endian. It hasn't worked for zImage.pseries for a long
>>> time (at least v4.14), and broke some time between v5.4 and v5.17 for
>>> zImage.epapr.
>>>
>>>    arch/powerpc/boot/Makefile | 8 ++++++--
>>>    1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
>>> index 9993c6256ad2..1f5cc401bfc0 100644
>>> --- a/arch/powerpc/boot/Makefile
>>> +++ b/arch/powerpc/boot/Makefile
>>> @@ -38,9 +38,13 @@ BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
>>>                 $(LINUXINCLUDE)
>>>
>>>    ifdef CONFIG_PPC64_BOOT_WRAPPER
>>> -BOOTCFLAGS   += -m64
>>> +ifdef CONFIG_CPU_LITTLE_ENDIAN
>>> +BOOTCFLAGS   += -m64 -mcpu=powerpc64le
>>>    else
>>> -BOOTCFLAGS   += -m32
>>> +BOOTCFLAGS   += -m64 -mcpu=powerpc64
>>> +endif
>>> +else
>>> +BOOTCFLAGS   += -m32 -mcpu=powerpc
>>>    endif
>>>
>>>    BOOTCFLAGS  += -isystem $(shell $(BOOTCC) -print-file-name=include)
>>
>> I think it was a fortunate coincidence that the default cpu type of your gcc is
>> compatible with your system.  If the distro gcc moves its default to a newer cpu
>> type than your system, this bug would happen again.
> 
> Perhaps I needed to be clear in my commit message: that's the exact
> bug I'm looking to avoid. I have a buildroot toolchain that was built
> for -mcpu=power10.
> 
> I think you're suggesting the -mcpu=powerpc64 option will change it 's
> behavior depending on the default. From my reading of the man page, I
> don't think that's true.

Looking at GCC source code (gcc/config/rs6000/rs6000.h:287), -mcpu=powerpc64 seems
to select "rs64" as the default cpu type.

     284 /* Define generic processor types based upon current deployment.  */
     285 #define PROCESSOR_COMMON    PROCESSOR_PPC601
     286 #define PROCESSOR_POWERPC   PROCESSOR_PPC604
     287 #define PROCESSOR_POWERPC64 PROCESSOR_RS64A

Then in gcc/config/rs6000/linux64.h:77 it sets the 64-bit default with power8.

     74 #undef  PROCESSOR_DEFAULT
     75 #define PROCESSOR_DEFAULT PROCESSOR_POWER7
     76 #undef  PROCESSOR_DEFAULT64
     77 #define PROCESSOR_DEFAULT64 PROCESSOR_POWER8

My understanding is that the default cpu type for -mcpu=powerpc64 can change.
If that change is unlikely to happen, that's a separate discussion.

> 
> I did a little test using my buildroot compiler which has
> with-cpu=power10. I used the presence of PCREL relocations as evidence
> that it was build for power10.
> 
> $ powerpc64le-buildroot-linux-gnu-gcc -mcpu=power10 -c test.c
> $ readelf -r test.o |grep -c PCREL
> 24

It respected the -mcpu=power10 you provided.

> $ powerpc64le-buildroot-linux-gnu-gcc -c test.c
> $ readelf -r test.o |grep -c PCREL
> 24

You didn't provide -mcpu, the default --with-cpu=power10 was used.

> $ powerpc64le-buildroot-linux-gnu-gcc -mcpu=powerpc64le -c test.c
> $ readelf -r test.o |grep -c PCREL
> 0

It likely defaulted to power8.

And that's my concern.  We're relying on the compiler default cpu type.

If gcc defaults -mcpu=powerpc64le to power10, you're going to have
the same problem again.  It happens that the power8 default cpu type
is compatible to your system by coincidence.

> 
>>
>> The command "gcc -v |& grep with-cpu" will show you the default cpu type for 32
>> and 64-bit that gcc was configured.
> 
> Just a headss up: this gives me no output for the 64 bit compilers on my laptop:
> 
> $ powerpc64le-linux-gnu-gcc -v |& grep  with-cpu
> $ echo $?
> 1
> 
> $ powerpc64-linux-gnu-gcc -v |& grep  with-cpu
> $ echo $?
> 1
> 
> It reports --with-cpu=default32 for the 32 bit compiler.
> 

This is what native gcc version 11.2.1 reports on Fedora 35 ppc64le:

     --with-cpu-32=power8 --with-cpu-64=power8

>>
>> Considering the CONFIG_TARGET_CPU for BOOTCFLAGS would bring some level of
>> consistency between CFLAGS and BOOTCFLAGS regarding -mcpu value.
>>
>> We could mimic the behaviour from arch/powerpc/Makefile:
> 
> This was the inspiration for my change. I first took it verbatim, and
> then did a bit of reading about what -mcpu actually sets. Reading the
> GCC source it seems powerpc64le is equivalent to power8. powerpc64 is
> less clear.

In gcc/config/rs6000/rs6000-cpus.def, they are set to different processors:

     254 RS6000_CPU ("powerpc64", PROCESSOR_POWERPC64, MASK_PPC_GFXOPT | MASK_POWERPC64)
     255 RS6000_CPU ("powerpc64le", PROCESSOR_POWER8, MASK_POWERPC64 | ISA_2_7_MASKS_SERVER

> 
> So I a agree with your suggestion. Hopefully my patch has the equivalent result.

My suggestion was to explicitly set -mcpu=power8 instead of -mcpu=powerpc64le.

We can set -mcpu=power8 for generic cpu, and then override it with target cpu.

That would be consistent with arch/powerpc/Makefile.

> 
> 
>>
>>       166 ifdef config_ppc_book3s_64
>>       167 ifdef config_cpu_little_endian
>>       168 cflags-$(config_generic_cpu) += -mcpu=power8
>>       169 cflags-$(config_generic_cpu) += $(call cc-option,-mtune=power9,-mtune=power8)
>>       170 else
>>       171 cflags-$(config_generic_cpu) += $(call cc-option,-mtune=power7,$(call cc-option,-mtune=power5))
>>       172 cflags-$(config_generic_cpu) += $(call cc-option,-mcpu=power5,-mcpu=power4)
>>       173 endif
>>       174 else ifdef config_ppc_book3e_64
>>       175 cflags-$(config_generic_cpu) += -mcpu=powerpc64
>>       176 endif
>>       ...
>>       185 CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
>>
>> Cheers!
>>
>> --
>> Murilo

Cheers!

-- 
Murilo
