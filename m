Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8467134FC16
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 11:03:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9L2j3vgJz3c6f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 20:03:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9L2M1Yp0z3bp4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 20:03:19 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F9L2C0l3Fz9v07Q;
 Wed, 31 Mar 2021 11:03:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id oA7kk_XuadgY; Wed, 31 Mar 2021 11:03:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F9L2B5WKFz9v06x;
 Wed, 31 Mar 2021 11:03:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9A9AE8B7F8;
 Wed, 31 Mar 2021 11:03:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id F0uHUOqvisPa; Wed, 31 Mar 2021 11:03:15 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BA3BD8B75B;
 Wed, 31 Mar 2021 11:03:14 +0200 (CEST)
Subject: Re: [PATCH 1/2] powerpc/vdso: fix unnecessary rebuilds of
 vgettimeofday.o
To: Masahiro Yamada <masahiroy@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20201223171142.707053-1-masahiroy@kernel.org>
 <CAK7LNASEVM8e5hohV4jbXOvMxSJ_Prm3es+fhezPkRc6UL=vdw@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <07ee85bb-e6d6-d66e-1282-591716037625@csgroup.eu>
Date: Wed, 31 Mar 2021 11:03:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNASEVM8e5hohV4jbXOvMxSJ_Prm3es+fhezPkRc6UL=vdw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Oliver O'Halloran <oohall@gmail.com>,
 Greentime Hu <green.hu@gmail.com>, Michal Suchanek <msuchanek@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 28/01/2021 à 05:01, Masahiro Yamada a écrit :
> On Thu, Dec 24, 2020 at 2:12 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>> vgettimeofday.o is unnecessarily rebuilt. Adding it to 'targets' is not
>> enough to fix the issue. Kbuild is correctly rebuilding it because the
>> command line is changed.
>>
>> PowerPC builds each vdso directory twice; first in vdso_prepare to
>> generate vdso{32,64}-offsets.h, second as part of the ordinary build
>> process to embed vdso{32,64}.so.dbg into the kernel.
>>
>> The problem shows up when CONFIG_PPC_WERROR=y due to the following line
>> in arch/powerpc/Kbuild:
>>
>>    subdir-ccflags-$(CONFIG_PPC_WERROR) := -Werror
>>
>> In the preparation stage, Kbuild directly visits the vdso directories,
>> hence it does not inherit subdir-ccflags-y. In the second descend,
>> Kbuild adds -Werror, which results in the command line flipping
>> with/without -Werror.
>>
>> It implies a potential danger; if a more critical flag that would impact
>> the resulted vdso, the offsets recorded in the headers might be different
>> from real offsets in the embedded vdso images.
>>
>> Removing the unneeded second descend solves the problem.
>>
>> Link: https://lore.kernel.org/linuxppc-dev/87tuslxhry.fsf@mpe.ellerman.id.au/
>> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>> ---
> 
> 
> Michael, please take a  look at this.
> 
> The unneeded rebuild problem is still remaining.

Seems like with this patch, vdso32_wrapper.o is not rebuilt when vdso32.so.dbg is rebuilt.

Leading to ... disasters.

I'll send a patch


> 
> 
>>
>>   arch/powerpc/kernel/Makefile                      | 4 ++--
>>   arch/powerpc/kernel/vdso32/Makefile               | 5 +----
>>   arch/powerpc/kernel/{vdso32 => }/vdso32_wrapper.S | 0
>>   arch/powerpc/kernel/vdso64/Makefile               | 6 +-----
>>   arch/powerpc/kernel/{vdso64 => }/vdso64_wrapper.S | 0
>>   5 files changed, 4 insertions(+), 11 deletions(-)
>>   rename arch/powerpc/kernel/{vdso32 => }/vdso32_wrapper.S (100%)
>>   rename arch/powerpc/kernel/{vdso64 => }/vdso64_wrapper.S (100%)
>>
>> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
>> index fe2ef598e2ea..79ee7750937d 100644
>> --- a/arch/powerpc/kernel/Makefile
>> +++ b/arch/powerpc/kernel/Makefile
>> @@ -51,7 +51,7 @@ obj-y                         += ptrace/
>>   obj-$(CONFIG_PPC64)            += setup_64.o \
>>                                     paca.o nvram_64.o note.o syscall_64.o
>>   obj-$(CONFIG_COMPAT)           += sys_ppc32.o signal_32.o
>> -obj-$(CONFIG_VDSO32)           += vdso32/
>> +obj-$(CONFIG_VDSO32)           += vdso32_wrapper.o
>>   obj-$(CONFIG_PPC_WATCHDOG)     += watchdog.o
>>   obj-$(CONFIG_HAVE_HW_BREAKPOINT)       += hw_breakpoint.o
>>   obj-$(CONFIG_PPC_DAWR)         += dawr.o
>> @@ -60,7 +60,7 @@ obj-$(CONFIG_PPC_BOOK3S_64)   += cpu_setup_power.o
>>   obj-$(CONFIG_PPC_BOOK3S_64)    += mce.o mce_power.o
>>   obj-$(CONFIG_PPC_BOOK3E_64)    += exceptions-64e.o idle_book3e.o
>>   obj-$(CONFIG_PPC_BARRIER_NOSPEC) += security.o
>> -obj-$(CONFIG_PPC64)            += vdso64/
>> +obj-$(CONFIG_PPC64)            += vdso64_wrapper.o
>>   obj-$(CONFIG_ALTIVEC)          += vecemu.o
>>   obj-$(CONFIG_PPC_BOOK3S_IDLE)  += idle_book3s.o
>>   procfs-y                       := proc_powerpc.o
>> diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
>> index 59aa2944ecae..42fc3de89b39 100644
>> --- a/arch/powerpc/kernel/vdso32/Makefile
>> +++ b/arch/powerpc/kernel/vdso32/Makefile
>> @@ -30,7 +30,7 @@ CC32FLAGS += -m32
>>   KBUILD_CFLAGS := $(filter-out -mcmodel=medium,$(KBUILD_CFLAGS))
>>   endif
>>
>> -targets := $(obj-vdso32) vdso32.so.dbg
>> +targets := $(obj-vdso32) vdso32.so.dbg vgettimeofday.o
>>   obj-vdso32 := $(addprefix $(obj)/, $(obj-vdso32))
>>
>>   GCOV_PROFILE := n
>> @@ -46,9 +46,6 @@ obj-y += vdso32_wrapper.o
>>   targets += vdso32.lds
>>   CPPFLAGS_vdso32.lds += -P -C -Upowerpc
>>
>> -# Force dependency (incbin is bad)
>> -$(obj)/vdso32_wrapper.o : $(obj)/vdso32.so.dbg
>> -
>>   # link rule for the .so file, .lds has to be first
>>   $(obj)/vdso32.so.dbg: $(src)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday.o FORCE
>>          $(call if_changed,vdso32ld_and_check)
>> diff --git a/arch/powerpc/kernel/vdso32/vdso32_wrapper.S b/arch/powerpc/kernel/vdso32_wrapper.S
>> similarity index 100%
>> rename from arch/powerpc/kernel/vdso32/vdso32_wrapper.S
>> rename to arch/powerpc/kernel/vdso32_wrapper.S
>> diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
>> index d365810a689a..b50b39fedf74 100644
>> --- a/arch/powerpc/kernel/vdso64/Makefile
>> +++ b/arch/powerpc/kernel/vdso64/Makefile
>> @@ -17,7 +17,7 @@ endif
>>
>>   # Build rules
>>
>> -targets := $(obj-vdso64) vdso64.so.dbg
>> +targets := $(obj-vdso64) vdso64.so.dbg vgettimeofday.o
>>   obj-vdso64 := $(addprefix $(obj)/, $(obj-vdso64))
>>
>>   GCOV_PROFILE := n
>> @@ -29,15 +29,11 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
>>          -Wl,-soname=linux-vdso64.so.1 -Wl,--hash-style=both
>>   asflags-y := -D__VDSO64__ -s
>>
>> -obj-y += vdso64_wrapper.o
>>   targets += vdso64.lds
>>   CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
>>
>>   $(obj)/vgettimeofday.o: %.o: %.c FORCE
>>
>> -# Force dependency (incbin is bad)
>> -$(obj)/vdso64_wrapper.o : $(obj)/vdso64.so.dbg
>> -
>>   # link rule for the .so file, .lds has to be first
>>   $(obj)/vdso64.so.dbg: $(src)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday.o FORCE
>>          $(call if_changed,vdso64ld_and_check)
>> diff --git a/arch/powerpc/kernel/vdso64/vdso64_wrapper.S b/arch/powerpc/kernel/vdso64_wrapper.S
>> similarity index 100%
>> rename from arch/powerpc/kernel/vdso64/vdso64_wrapper.S
>> rename to arch/powerpc/kernel/vdso64_wrapper.S
>> --
>> 2.27.0
>>
> 
> 
