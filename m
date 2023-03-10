Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9E66B50BD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 20:11:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYFyY1pbJz3f4r
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Mar 2023 06:11:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=SM3O0AGa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=maskray@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=SM3O0AGa;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYFxf1C7cz3chD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Mar 2023 06:10:29 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id a9so6661818plh.11
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 11:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678475426;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ZGDv5DIYIxsnE885FfpP47ttfnvxSWFDU6bB1hvtRM=;
        b=SM3O0AGaHw4g2GV96u4cTK6Tpc6Elev94rU1WSnz6dEk7mnnAQwWdN1tW7EILcJ341
         DWcfezFDow6lmCagtiwzRHZDBT0QpiWThRbybIdeeeP4eTP7eZotF9PfL4eraydzAtL5
         K5Iit5j9g6fy3Uc64mkZypeF8BA0HsgfQf31h7iSpQzmBabxGGETmiz8znYMC+Izl0MG
         T9TvguHRM2xzVnv3rMkXtSS4Lf4C+ZNnx4PIy/w8t7QMD3sM5Bwn4m1yvxjxb5MnW/qI
         KfoEtbzF+NvUILwpeZc63uONvGbouRT1wJQzF0BEbG8e0QnbCKpF6BxWNAWVcUbOEYZx
         UTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678475426;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZGDv5DIYIxsnE885FfpP47ttfnvxSWFDU6bB1hvtRM=;
        b=NW8zt9In5lrYnKW2ybqGUJnlqdqYYd7VKyRIf3baljhZORYFdP5FuFKAB/mErtEw1O
         jqRqqVGSb/bVJbfUGhAiph8vxJIw57EL3wnFKU8KuEQnG3UPQx278Y4RMMXe2vaE2016
         P6unRGaoTuDWSBVjRdan4Gwr5vTJwPDAYncezpPNIA+97r76ObGDor+3yA0upMwYz5Q4
         lym1n1Yg4gN/F+k5+Z+Q9MO5rdu0eLlp6xaeK0fp/huZzZQ9J1axUKOSEqUEKOrKZM2w
         4h/zslu5uM4rzaJ45IJLJjH+yPJiMyP5x+duqracj+s66E06k7y/yVjMvvECII3ZjYk4
         xPTg==
X-Gm-Message-State: AO0yUKUqYe4PKBYenwmaxeoei2XEur5rqeK8sJt97rNTYTwhUIqvYk2U
	CmM3iwY8/3Zbz+IJLCto3h7nnQ==
X-Google-Smtp-Source: AK7set+VmSF9aMozDA/zTApnsLW/h0LbKWWDE3MjBMjenGf4VotI5Cgco4B/N63Va2NujYg8V1UOdQ==
X-Received: by 2002:a17:902:c3c5:b0:19c:c5d4:afd2 with SMTP id j5-20020a170902c3c500b0019cc5d4afd2mr283201plj.11.1678475426123;
        Fri, 10 Mar 2023 11:10:26 -0800 (PST)
Received: from google.com (25.11.145.34.bc.googleusercontent.com. [34.145.11.25])
        by smtp.gmail.com with ESMTPSA id a14-20020aa7864e000000b005a84de344a6sm183124pfo.14.2023.03.10.11.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 11:10:25 -0800 (PST)
Date: Fri, 10 Mar 2023 19:10:23 +0000
From: Fangrui Song <maskray@google.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: Re: [PATCH v2] vdso: Improve cmd_vdso_check to check all dynamic
 relocations
Message-ID: <20230310191023.p25brljzyojtmn7e@google.com>
References: <20220830193701.1702962-1-maskray@google.com>
 <20220910075316.no72fdyqjvunomwm@google.com>
 <CAFP8O3+OwanSJdzd5V3oGJ_MOJOSVdbn+4iBJJKm2LCR8mCA0Q@mail.gmail.com>
 <9ce45cd2-dcd8-11f8-e496-7efe3649e241@csgroup.eu>
 <20221115004625.x4wl6zbg4iiuxl5t@google.com>
 <CAFP8O3LdSJCChGEwT57e=iZopceYkBFuW9XD=yhO1ZszVZGm4g@mail.gmail.com>
 <3ec9737e-3d1a-c014-b91a-0e2d406a3b3d@csgroup.eu>
 <CAFP8O3KZTkSbxXJ2yWt4w-F3xWHY_owCs03wN3Bhss57O-E_JQ@mail.gmail.com>
 <20221221235147.45lkqmosndritfpe@google.com>
 <ecd41da2-d986-8890-a519-3dfc83019593@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ecd41da2-d986-8890-a519-3dfc83019593@arm.com>
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2023-03-10, Vincenzo Frascino wrote:
>Hi Fangrui,
>
>Apologize for the delay, I totally missed that you had a new version of your
>patch since it was threaded with the old one.

Thank you! No worries.

>On 12/21/22 23:51, Fangrui Song wrote:
>> The actual intention is that no dynamic relocation exists. However, some
>> GNU ld ports produce unneeded R_*_NONE. (If a port fails to determine
>> the exact .rel[a].dyn size, the trailing zeros become R_*_NONE
>> relocations. E.g. ld's powerpc port recently fixed
>> https://sourceware.org/bugzilla/show_bug.cgi?id=29540) R_*_NONE are
>> generally no-op in the dynamic loaders. So just ignore them.
>>
>> With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_ABS is a
>> bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT which are
>> not called "absolute relocations". (The patch is motivated by the arm64
>> port missing R_AARCH64_RELATIVE.)
>
>It makes sense to update the name, it started as "absolute relocations" but then
>it evolved into something else.
>
>A part that, did you perform any testing with the generated vDSO libraries?

I checked that the built vdso did not change (the patch just changes
some post-link verification). 

To be more sure, I used commands like
https://github.com/ClangBuiltLinux/tc-build/blob/main/kernel/build.sh#L305
to build a kernel and commands like

     ~/Dev/ClangBuiltLinux/boot-utils/boot-qemu.py -a arm64 -k /tmp/linux/arm64

to run an image for a couple of architectures.

The initrd images run some init scripts along with

   # buildroot/overlay-poweroff/etc/init.d/S50yolo
   cat /proc/version
   poweroff

I think these have exercised vdso.

>>
>> Signed-off-by: Fangrui Song <maskray@google.com>
>> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> Change from v1:
>> * rebase after 8ac3b5cd3e0521d92f9755e90d140382fc292510 (lib/vdso: use "grep -E"
>> instead of "egrep")
>> * change the commit message to mention an example GNU ld bug; no longer say the
>> patch fixes a deprecated egrep use
>> ---
>>  arch/arm/vdso/Makefile            |  3 ---
>>  arch/arm64/kernel/vdso/Makefile   |  3 ---
>>  arch/arm64/kernel/vdso32/Makefile |  3 ---
>>  arch/csky/kernel/vdso/Makefile    |  3 ---
>>  arch/loongarch/vdso/Makefile      |  3 ---
>>  arch/mips/vdso/Makefile           |  3 ---
>>  arch/powerpc/kernel/vdso/Makefile |  1 -
>>  arch/riscv/kernel/vdso/Makefile   |  3 ---
>>  arch/s390/kernel/vdso32/Makefile  |  2 --
>>  arch/s390/kernel/vdso64/Makefile  |  2 --
>>  arch/x86/entry/vdso/Makefile      |  4 ----
>>  lib/vdso/Makefile                 | 13 ++++---------
>>  12 files changed, 4 insertions(+), 39 deletions(-)
>>
>> diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
>> index a7ec06ce3785..e58197bba776 100644
>> --- a/arch/arm/vdso/Makefile
>> +++ b/arch/arm/vdso/Makefile
>> @@ -1,8 +1,5 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  
>> -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
>> -# the inclusion of generic Makefile.
>> -ARCH_REL_TYPE_ABS := R_ARM_JUMP_SLOT|R_ARM_GLOB_DAT|R_ARM_ABS32
>
>I would still add a comment here to say why we are including the generic
>Makefile to prevent that it gets accidentally removed (similar thing for every
>architecture touched by this patch).
>
>With that:
>
>Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com> # for vDSO, aarch64
>Tested-by: Vincenzo Frascino <vincenzo.frascino@arm.com> # for aarch64
>

Just sent v3
(https://lore.kernel.org/all/20230310190750.3323802-1-maskray@google.com/)
with the comment changes. Thanks!

>>  include $(srctree)/lib/vdso/Makefile
>>  
>>  hostprogs := vdsomunge
>> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
>> index beaf9586338f..1f2427b13410 100644
>> --- a/arch/arm64/kernel/vdso/Makefile
>> +++ b/arch/arm64/kernel/vdso/Makefile
>> @@ -6,9 +6,6 @@
>>  # Heavily based on the vDSO Makefiles for other archs.
>>  #
>>  
>> -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
>> -# the inclusion of generic Makefile.
>> -ARCH_REL_TYPE_ABS := R_AARCH64_JUMP_SLOT|R_AARCH64_GLOB_DAT|R_AARCH64_ABS64
>>  include $(srctree)/lib/vdso/Makefile
>>  
>>  obj-vdso := vgettimeofday.o note.o sigreturn.o
>> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
>> index f59bd1a4ead6..d014162c5c71 100644
>> --- a/arch/arm64/kernel/vdso32/Makefile
>> +++ b/arch/arm64/kernel/vdso32/Makefile
>> @@ -3,9 +3,6 @@
>>  # Makefile for vdso32
>>  #
>>  
>> -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
>> -# the inclusion of generic Makefile.
>> -ARCH_REL_TYPE_ABS := R_ARM_JUMP_SLOT|R_ARM_GLOB_DAT|R_ARM_ABS32
>>  include $(srctree)/lib/vdso/Makefile
>>  
>>  # Same as cc-*option, but using CC_COMPAT instead of CC
>> diff --git a/arch/csky/kernel/vdso/Makefile b/arch/csky/kernel/vdso/Makefile
>> index 0b6909f10667..86c8c4de1b0f 100644
>> --- a/arch/csky/kernel/vdso/Makefile
>> +++ b/arch/csky/kernel/vdso/Makefile
>> @@ -1,8 +1,5 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  
>> -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
>> -# the inclusion of generic Makefile.
>> -ARCH_REL_TYPE_ABS := R_CKCORE_ADDR32|R_CKCORE_JUMP_SLOT
>>  include $(srctree)/lib/vdso/Makefile
>>  
>>  # Symbols present in the vdso
>> diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
>> index d89e2ac75f7b..1b2e0f149f55 100644
>> --- a/arch/loongarch/vdso/Makefile
>> +++ b/arch/loongarch/vdso/Makefile
>> @@ -1,9 +1,6 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  # Objects to go into the VDSO.
>>  
>> -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
>> -# the inclusion of generic Makefile.
>> -ARCH_REL_TYPE_ABS := R_LARCH_32|R_LARCH_64|R_LARCH_MARK_LA|R_LARCH_JUMP_SLOT
>>  include $(srctree)/lib/vdso/Makefile
>>  
>>  obj-vdso-y := elf.o vgetcpu.o vgettimeofday.o sigreturn.o
>> diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
>> index 1f7d5c6c10b0..c060f3596304 100644
>> --- a/arch/mips/vdso/Makefile
>> +++ b/arch/mips/vdso/Makefile
>> @@ -4,9 +4,6 @@
>>  # Sanitizer runtimes are unavailable and cannot be linked here.
>>   KCSAN_SANITIZE            := n
>>  
>> -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
>> -# the inclusion of generic Makefile.
>> -ARCH_REL_TYPE_ABS := R_MIPS_JUMP_SLOT|R_MIPS_GLOB_DAT
>>  include $(srctree)/lib/vdso/Makefile
>>  
>>  obj-vdso-y := elf.o vgettimeofday.o sigreturn.o
>> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
>> index 6a977b0d8ffc..83c347e9136f 100644
>> --- a/arch/powerpc/kernel/vdso/Makefile
>> +++ b/arch/powerpc/kernel/vdso/Makefile
>> @@ -2,7 +2,6 @@
>>  
>>  # List of files in the vdso, has to be asm only for now
>>  
>> -ARCH_REL_TYPE_ABS :=
>> R_PPC_JUMP_SLOT|R_PPC_GLOB_DAT|R_PPC_ADDR32|R_PPC_ADDR24|R_PPC_ADDR16|R_PPC_ADDR16_LO|R_PPC_ADDR16_HI|R_PPC_ADDR16_HA|R_PPC_ADDR14|R_PPC_ADDR14_BRTAKEN|R_PPC_ADDR14_BRNTAKEN|R_PPC_REL24
>>  include $(srctree)/lib/vdso/Makefile
>>  
>>  obj-vdso32 = sigtramp32-32.o gettimeofday-32.o datapage-32.o cacheflush-32.o
>> note-32.o getcpu-32.o
>> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
>> index 06e6b27f3bcc..d85c37e11b21 100644
>> --- a/arch/riscv/kernel/vdso/Makefile
>> +++ b/arch/riscv/kernel/vdso/Makefile
>> @@ -1,9 +1,6 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  # Copied from arch/tile/kernel/vdso/Makefile
>>  
>> -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
>> -# the inclusion of generic Makefile.
>> -ARCH_REL_TYPE_ABS := R_RISCV_32|R_RISCV_64|R_RISCV_JUMP_SLOT
>>  include $(srctree)/lib/vdso/Makefile
>>  # Symbols present in the vdso
>>  vdso-syms  = rt_sigreturn
>> diff --git a/arch/s390/kernel/vdso32/Makefile b/arch/s390/kernel/vdso32/Makefile
>> index 245bddfe9bc0..e795fdbbf484 100644
>> --- a/arch/s390/kernel/vdso32/Makefile
>> +++ b/arch/s390/kernel/vdso32/Makefile
>> @@ -2,8 +2,6 @@
>>  # List of files in the vdso
>>  
>>  KCOV_INSTRUMENT := n
>> -ARCH_REL_TYPE_ABS := R_390_COPY|R_390_GLOB_DAT|R_390_JMP_SLOT|R_390_RELATIVE
>> -ARCH_REL_TYPE_ABS += R_390_GOT|R_390_PLT
>>  
>>  include $(srctree)/lib/vdso/Makefile
>>  obj-vdso32 = vdso_user_wrapper-32.o note-32.o
>> diff --git a/arch/s390/kernel/vdso64/Makefile b/arch/s390/kernel/vdso64/Makefile
>> index 9e2b95a222a9..47dbbfdfad68 100644
>> --- a/arch/s390/kernel/vdso64/Makefile
>> +++ b/arch/s390/kernel/vdso64/Makefile
>> @@ -2,8 +2,6 @@
>>  # List of files in the vdso
>>  
>>  KCOV_INSTRUMENT := n
>> -ARCH_REL_TYPE_ABS := R_390_COPY|R_390_GLOB_DAT|R_390_JMP_SLOT|R_390_RELATIVE
>> -ARCH_REL_TYPE_ABS += R_390_GOT|R_390_PLT
>>  
>>  include $(srctree)/lib/vdso/Makefile
>>  obj-vdso64 = vdso_user_wrapper.o note.o
>> diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
>> index 838613ac15b8..b292c24acb8e 100644
>> --- a/arch/x86/entry/vdso/Makefile
>> +++ b/arch/x86/entry/vdso/Makefile
>> @@ -3,10 +3,6 @@
>>  # Building vDSO images for x86.
>>  #
>>  
>> -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
>> -# the inclusion of generic Makefile.
>> -ARCH_REL_TYPE_ABS := R_X86_64_JUMP_SLOT|R_X86_64_GLOB_DAT|R_X86_64_RELATIVE|
>> -ARCH_REL_TYPE_ABS += R_386_GLOB_DAT|R_386_JMP_SLOT|R_386_RELATIVE
>>  include $(srctree)/lib/vdso/Makefile
>>  
>>  # Sanitizer runtimes are unavailable and cannot be linked here.
>> diff --git a/lib/vdso/Makefile b/lib/vdso/Makefile
>> index e814061d6aa0..9f031eafc465 100644
>> --- a/lib/vdso/Makefile
>> +++ b/lib/vdso/Makefile
>> @@ -5,18 +5,13 @@ GENERIC_VDSO_DIR := $(dir $(GENERIC_VDSO_MK_PATH))
>>  
>>  c-gettimeofday-$(CONFIG_GENERIC_GETTIMEOFDAY) := $(addprefix
>> $(GENERIC_VDSO_DIR), gettimeofday.c)
>>  
>> -# This cmd checks that the vdso library does not contain absolute relocation
>> +# This cmd checks that the vdso library does not contain dynamic relocations.
>>  # It has to be called after the linking of the vdso library and requires it
>>  # as a parameter.
>>  #
>> -# $(ARCH_REL_TYPE_ABS) is defined in the arch specific makefile and corresponds
>> -# to the absolute relocation types printed by "objdump -R" and accepted by the
>> -# dynamic linker.
>> -ifndef ARCH_REL_TYPE_ABS
>> -$(error ARCH_REL_TYPE_ABS is not set)
>> -endif
>> -
>> +# As a workaround for some GNU ld ports which produce unneeded R_*_NONE
>> +# dynamic relocations, ignore R_*_NONE.
>>  quiet_cmd_vdso_check = VDSOCHK $@
>> -      cmd_vdso_check = if $(OBJDUMP) -R $@ | grep -E -h "$(ARCH_REL_TYPE_ABS)"; \
>> +      cmd_vdso_check = if $(READELF) -rW $@ | grep -v _NONE | grep -q " R_\w*_"; \
>>                 then (echo >&2 "$@: dynamic relocations are not supported"; \
>>                   rm -f $@; /bin/false); fi
>
>-- 
>Regards,
>Vincenzo
