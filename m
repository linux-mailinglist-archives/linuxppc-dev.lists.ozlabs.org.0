Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A89954CAAB8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 17:48:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K80Rv5378z3c5g
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 03:48:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K80RV6WRlz3bpX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 03:48:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K80RQ4bLwz9sSR;
 Wed,  2 Mar 2022 17:48:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ojv3flF-hEnn; Wed,  2 Mar 2022 17:48:02 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K80RP3v1Kz9sSN;
 Wed,  2 Mar 2022 17:48:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 208A88B76D;
 Wed,  2 Mar 2022 17:48:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id O_1AzIOzJJwo; Wed,  2 Mar 2022 17:48:01 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CB7358B763;
 Wed,  2 Mar 2022 17:48:00 +0100 (CET)
Message-ID: <a120fa0c-4d00-ed4c-cffa-0df1fb5abb2b@csgroup.eu>
Date: Wed, 2 Mar 2022 17:48:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] powerpc/vdso64: link vdso64 with linker
Content-Language: fr-FR
To: Nick Desaulniers <ndesaulniers@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <20200901222523.1941988-1-ndesaulniers@google.com>
 <20200901222523.1941988-2-ndesaulniers@google.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20200901222523.1941988-2-ndesaulniers@google.com>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Joe Lawrence <joe.lawrence@redhat.com>, Kees Cook <keescook@chromium.org>,
 Fangrui Song <maskray@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/09/2020 à 00:25, Nick Desaulniers a écrit :
> Rather than invoke the compiler as the driver, use the linker. That way
> we can check --orphan-handling=warn support correctly, as cc-ldoption
> was removed in
> commit 055efab3120b ("kbuild: drop support for cc-ldoption").
> 
> Painstakingly compared the output between `objdump -a` before and after
> this change. Now function symbols have the correct type of FUNC rather
> than NONE, and the entry is slightly different (which doesn't matter for
> the vdso). Binary size is the same.
> 
> Fixes: commit f2af201002a8 ("powerpc/build: vdso linker warning for orphan sections")
> Link: https://lore.kernel.org/lkml/CAKwvOdnn3wxYdJomvnveyD_njwRku3fABWT_bS92duihhywLJQ@mail.gmail.com/
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Is this change still necessary ? If so please rebase as we have changed 
the structure of VDSO source files (Only one directory common to 32 and 64).

Christophe

> ---
>   arch/powerpc/include/asm/vdso.h         | 17 ++---------------
>   arch/powerpc/kernel/vdso64/Makefile     |  8 ++++++--
>   arch/powerpc/kernel/vdso64/vdso64.lds.S |  1 -
>   3 files changed, 8 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/vdso.h b/arch/powerpc/include/asm/vdso.h
> index 2ff884853f97..11b2ecf49f79 100644
> --- a/arch/powerpc/include/asm/vdso.h
> +++ b/arch/powerpc/include/asm/vdso.h
> @@ -24,19 +24,7 @@ int vdso_getcpu_init(void);
>   
>   #else /* __ASSEMBLY__ */
>   
> -#ifdef __VDSO64__
> -#define V_FUNCTION_BEGIN(name)		\
> -	.globl name;			\
> -	name:				\
> -
> -#define V_FUNCTION_END(name)		\
> -	.size name,.-name;
> -
> -#define V_LOCAL_FUNC(name) (name)
> -#endif /* __VDSO64__ */
> -
> -#ifdef __VDSO32__
> -
> +#if defined(__VDSO32__) || defined (__VDSO64__)
>   #define V_FUNCTION_BEGIN(name)		\
>   	.globl name;			\
>   	.type name,@function; 		\
> @@ -46,8 +34,7 @@ int vdso_getcpu_init(void);
>   	.size name,.-name;
>   
>   #define V_LOCAL_FUNC(name) (name)
> -
> -#endif /* __VDSO32__ */
> +#endif /* __VDSO{32|64}__ */
>   
>   #endif /* __ASSEMBLY__ */
>   
> diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
> index 38c317f25141..7ea3ce537d0a 100644
> --- a/arch/powerpc/kernel/vdso64/Makefile
> +++ b/arch/powerpc/kernel/vdso64/Makefile
> @@ -32,9 +32,13 @@ $(obj)/%.so: OBJCOPYFLAGS := -S
>   $(obj)/%.so: $(obj)/%.so.dbg FORCE
>   	$(call if_changed,objcopy)
>   
> +ldflags-y := -shared -soname linux-vdso64.so.1 \
> +	$(call ld-option, --eh-frame-hdr) \
> +	$(call ld-option, --orphan-handling=warn) -T
> +
>   # actual build commands
> -quiet_cmd_vdso64ld = VDSO64L $@
> -      cmd_vdso64ld = $(CC) $(c_flags) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) $(call cc-ldoption, -Wl$(comma)--orphan-handling=warn)
> +quiet_cmd_vdso64ld = LD      $@
> +      cmd_vdso64ld = $(cmd_ld)
>   
>   # install commands for the unstripped file
>   quiet_cmd_vdso_install = INSTALL $@
> diff --git a/arch/powerpc/kernel/vdso64/vdso64.lds.S b/arch/powerpc/kernel/vdso64/vdso64.lds.S
> index 4e3a8d4ee614..58c33b704b6a 100644
> --- a/arch/powerpc/kernel/vdso64/vdso64.lds.S
> +++ b/arch/powerpc/kernel/vdso64/vdso64.lds.S
> @@ -11,7 +11,6 @@ OUTPUT_FORMAT("elf64-powerpcle", "elf64-powerpcle", "elf64-powerpcle")
>   OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc", "elf64-powerpc")
>   #endif
>   OUTPUT_ARCH(powerpc:common64)
> -ENTRY(_start)
>   
>   SECTIONS
>   {
