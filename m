Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FA0306AB7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 02:52:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR3Pr5P8lzDqJt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 12:52:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.81;
 helo=conssluserg-02.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=IkmWBDfw; 
 dkim-atps=neutral
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR29Y1xwnzDr84
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 11:56:48 +1100 (AEDT)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 10S0u73M029101
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 09:56:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 10S0u73M029101
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611795368;
 bh=C9LObEhixqVjpaN6rdMkGqM2Xyb7MoUJDaq7yjC2Zac=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IkmWBDfwdvX+igh3pETYYFNb85y9N40ugyD2QkIaSl3gCnqt0sA2rbNJW6YUypyS4
 w4JRcmF/UdHxDAmZFKbsN4fgW8UKMP9hKNej5GRQO6ohFyBQ708fW4jl7PX/kJg0J1
 aFVW0TiepmxIdUhSebG33ZVax4jGwL8IVMJsg5Z5VH5JR2E9dhGLcMTrjck5EUjVb4
 XiCDAfCkir9V8MK+oTVxfhcLK95dOXxN5Ef5fxmKmxTP71wObZ000Fy1HFwSXnlaRO
 +aq3Mv6FDhai9Zj9oUzf7ysIQnLv9UV6Ej85eWfexeY4VwcIrqO2XVoKs7JYqApRtv
 FryylukgsGUFA==
X-Nifty-SrcIP: [209.85.216.54]
Received: by mail-pj1-f54.google.com with SMTP id md11so2812755pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 16:56:08 -0800 (PST)
X-Gm-Message-State: AOAM531c1hsQktT05H66mmVdFrOAwMhyFyDeT+/Q9710vvzMhn2ef6I7
 xSey9Qie0IlxyFngTGxQNRmMuSL0z6xrBL3GUYM=
X-Google-Smtp-Source: ABdhPJwmFIMyXfJmPXKSO4OCuw9I1lFcdgtLl0OiQAC91Js/od66SzlBuh+aSGVTk564CYx9AFdfGYYtsXQ2IT70N3I=
X-Received: by 2002:a17:90a:5403:: with SMTP id
 z3mr8591341pjh.198.1611795367433; 
 Wed, 27 Jan 2021 16:56:07 -0800 (PST)
MIME-Version: 1.0
References: <20210128005110.2613902-1-masahiroy@kernel.org>
 <20210128005110.2613902-3-masahiroy@kernel.org>
In-Reply-To: <20210128005110.2613902-3-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 28 Jan 2021 09:55:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNATkX6=FNsMu0X44u0FSYYhW7iGfPq9cY43TReFCSdrsUg@mail.gmail.com>
Message-ID: <CAK7LNATkX6=FNsMu0X44u0FSYYhW7iGfPq9cY43TReFCSdrsUg@mail.gmail.com>
Subject: Re: [PATCH 02/27] x86/syscalls: fix -Wmissing-prototypes warnings
 from COND_SYSCALL()
To: linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, linux-um@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 linux-alpha@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 28, 2021 at 9:52 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Building kernel/sys_ni.c with W=1 omits tons of -Wmissing-prototypes


This is a typo.  "omits" -> "emits"



> warnings.
>
> $ make W=1 kernel/sys_ni.o
>   [ snip ]
>   CC      kernel/sys_ni.o
> In file included from kernel/sys_ni.c:10:
> ./arch/x86/include/asm/syscall_wrapper.h:83:14: warning: no previous prototype for '__x64_sys_io_setup' [-Wmissing-prototypes]
>    83 |  __weak long __##abi##_##name(const struct pt_regs *__unused) \
>       |              ^~
> ./arch/x86/include/asm/syscall_wrapper.h:100:2: note: in expansion of macro '__COND_SYSCALL'
>   100 |  __COND_SYSCALL(x64, sys_##name)
>       |  ^~~~~~~~~~~~~~
> ./arch/x86/include/asm/syscall_wrapper.h:256:2: note: in expansion of macro '__X64_COND_SYSCALL'
>   256 |  __X64_COND_SYSCALL(name)     \
>       |  ^~~~~~~~~~~~~~~~~~
> kernel/sys_ni.c:39:1: note: in expansion of macro 'COND_SYSCALL'
>    39 | COND_SYSCALL(io_setup);
>       | ^~~~~~~~~~~~
> ./arch/x86/include/asm/syscall_wrapper.h:83:14: warning: no previous prototype for '__ia32_sys_io_setup' [-Wmissing-prototypes]
>    83 |  __weak long __##abi##_##name(const struct pt_regs *__unused) \
>       |              ^~
> ./arch/x86/include/asm/syscall_wrapper.h:120:2: note: in expansion of macro '__COND_SYSCALL'
>   120 |  __COND_SYSCALL(ia32, sys_##name)
>       |  ^~~~~~~~~~~~~~
> ./arch/x86/include/asm/syscall_wrapper.h:257:2: note: in expansion of macro '__IA32_COND_SYSCALL'
>   257 |  __IA32_COND_SYSCALL(name)
>       |  ^~~~~~~~~~~~~~~~~~~
> kernel/sys_ni.c:39:1: note: in expansion of macro 'COND_SYSCALL'
>    39 | COND_SYSCALL(io_setup);
>       | ^~~~~~~~~~~~
>   ...
>
> __SYS_STUB0() and __SYS_STUBx() defined a few lines above have forward
> declarations. Let's do likewise for __COND_SYSCALL() to fix the
> warnings.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/x86/include/asm/syscall_wrapper.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/x86/include/asm/syscall_wrapper.h b/arch/x86/include/asm/syscall_wrapper.h
> index a84333adeef2..80c08c7d5e72 100644
> --- a/arch/x86/include/asm/syscall_wrapper.h
> +++ b/arch/x86/include/asm/syscall_wrapper.h
> @@ -80,6 +80,7 @@ extern long __ia32_sys_ni_syscall(const struct pt_regs *regs);
>         }
>
>  #define __COND_SYSCALL(abi, name)                                      \
> +       __weak long __##abi##_##name(const struct pt_regs *__unused);   \
>         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
>         {                                                               \
>                 return sys_ni_syscall();                                \
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
