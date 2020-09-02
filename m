Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB90225A5BC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 08:48:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhDzX2TSdzDqQK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 16:48:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhDxz4f08zDqf1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 16:47:01 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BhDxr6VGJz9tybc;
 Wed,  2 Sep 2020 08:46:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id iEERQsHpL4eE; Wed,  2 Sep 2020 08:46:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BhDxr5Sfgz9tybb;
 Wed,  2 Sep 2020 08:46:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B9D0E8B788;
 Wed,  2 Sep 2020 08:46:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cHWP0PZXhRVt; Wed,  2 Sep 2020 08:46:57 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [10.25.210.31])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 18CA78B784;
 Wed,  2 Sep 2020 08:46:57 +0200 (CEST)
Subject: Re: [PATCH 2/2] powerpc/vdso32: link vdso64 with linker
To: Nick Desaulniers <ndesaulniers@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <20200901222523.1941988-1-ndesaulniers@google.com>
 <20200901222523.1941988-3-ndesaulniers@google.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <b2066ccd-2b81-6032-08e3-41105b400f75@csgroup.eu>
Date: Wed, 2 Sep 2020 06:46:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20200901222523.1941988-3-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Joe Lawrence <joe.lawrence@redhat.com>, Kees Cook <keescook@chromium.org>,
 Fangrui Song <maskray@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 09/01/2020 10:25 PM, Nick Desaulniers wrote:
> Rather than invoke the compiler as the driver, use the linker. That way
> we can check --orphan-handling=warn support correctly, as cc-ldoption
> was removed in
> commit 055efab3120b ("kbuild: drop support for cc-ldoption").
> 
> Requires dropping the .got section.  I couldn't find how it was used in
> the vdso32.

ld crashes:

   LD      arch/powerpc/kernel/vdso32/vdso32.so.dbg
/bin/sh: line 1: 23780 Segmentation fault      (core dumped) 
ppc-linux-ld -EB -m elf32ppc -shared -soname linux-vdso32.so.1 
--eh-frame-hdr --orphan-handling=warn -T 
arch/powerpc/kernel/vdso32/vdso32.lds 
arch/powerpc/kernel/vdso32/sigtramp.o 
arch/powerpc/kernel/vdso32/gettimeofday.o 
arch/powerpc/kernel/vdso32/datapage.o 
arch/powerpc/kernel/vdso32/cacheflush.o 
arch/powerpc/kernel/vdso32/note.o arch/powerpc/kernel/vdso32/getcpu.o -o 
arch/powerpc/kernel/vdso32/vdso32.so.dbg
make[4]: *** [arch/powerpc/kernel/vdso32/vdso32.so.dbg] Error 139


[root@localhost linux-powerpc]# ppc-linux-ld --version
GNU ld (GNU Binutils) 2.26.20160125


Christophe

> 
> Fixes: commit f2af201002a8 ("powerpc/build: vdso linker warning for orphan sections")
> Link: https://lore.kernel.org/lkml/CAKwvOdnn3wxYdJomvnveyD_njwRku3fABWT_bS92duihhywLJQ@mail.gmail.com/
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Not sure removing .got is a good idea or not.  Otherwise I observe the
> following link error:
> powerpc-linux-gnu-ld: warning: orphan section `.got' from `arch/powerpc/kernel/vdso32/sigtramp.o' being placed in section `.got'
> powerpc-linux-gnu-ld: _GLOBAL_OFFSET_TABLE_ not defined in linker created .got
> powerpc-linux-gnu-ld: final link failed: bad value
> 
> sigtramp.c doesn't mention anything from the GOT AFAICT, and doesn't
> look like it contains relocations that do, so I'm not sure where
> references to _GLOBAL_OFFSET_TABLE_ are coming from.
> 
>   arch/powerpc/kernel/vdso32/Makefile     | 7 +++++--
>   arch/powerpc/kernel/vdso32/vdso32.lds.S | 3 ++-
>   2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
> index 87ab1152d5ce..611a5951945a 100644
> --- a/arch/powerpc/kernel/vdso32/Makefile
> +++ b/arch/powerpc/kernel/vdso32/Makefile
> @@ -27,6 +27,9 @@ UBSAN_SANITIZE := n
>   ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
>   	-Wl,-soname=linux-vdso32.so.1 -Wl,--hash-style=both
>   asflags-y := -D__VDSO32__ -s
> +ldflags-y := -shared -soname linux-vdso32.so.1 \
> +	$(call ld-option, --eh-frame-hdr) \
> +	$(call ld-option, --orphan-handling=warn) -T
>   
>   obj-y += vdso32_wrapper.o
>   extra-y += vdso32.lds
> @@ -49,8 +52,8 @@ $(obj-vdso32): %.o: %.S FORCE
>   	$(call if_changed_dep,vdso32as)
>   
>   # actual build commands
> -quiet_cmd_vdso32ld = VDSO32L $@
> -      cmd_vdso32ld = $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ $(call cc-ldoption, -Wl$(comma)--orphan-handling=warn) -Wl,-T$(filter %.lds,$^) $(filter %.o,$^)
> +quiet_cmd_vdso32ld = LD      $@
> +      cmd_vdso32ld = $(cmd_ld)
>   quiet_cmd_vdso32as = VDSO32A $@
>         cmd_vdso32as = $(VDSOCC) $(a_flags) $(CC32FLAGS) -c -o $@ $<
>   
> diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/vdso32/vdso32.lds.S
> index 4c985467a668..0ccdebad18b8 100644
> --- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
> +++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
> @@ -61,7 +61,6 @@ SECTIONS
>   	.fixup		: { *(.fixup) }
>   
>   	.dynamic	: { *(.dynamic) }		:text	:dynamic
> -	.got		: { *(.got) }			:text
>   	.plt		: { *(.plt) }
>   
>   	_end = .;
> @@ -108,7 +107,9 @@ SECTIONS
>   	.debug_varnames  0 : { *(.debug_varnames) }
>   
>   	/DISCARD/	: {
> +		*(.got)
>   		*(.note.GNU-stack)
> +		*(.branch_lt)
>   		*(.data .data.* .gnu.linkonce.d.* .sdata*)
>   		*(.bss .sbss .dynbss .dynsbss)
>   		*(.glink .iplt .plt .rela*)
> 
