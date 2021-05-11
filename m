Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF3037A5B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 13:25:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfbDz0zVVz308G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 21:25:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FfbDY1scRz2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 21:24:44 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 14BBKWcY002034;
 Tue, 11 May 2021 06:20:32 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 14BBKKjC002001;
 Tue, 11 May 2021 06:20:20 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 11 May 2021 06:20:19 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v2] powerpc/makefile: Do not redefine $(CPP) for
 preprocessor
Message-ID: <20210511112019.GK10366@gate.crashing.org>
References: <20210511044812.267965-1-aik@ozlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511044812.267965-1-aik@ozlabs.ru>
User-Agent: Mutt/1.4.2.3i
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Tue, May 11, 2021 at 02:48:12PM +1000, Alexey Kardashevskiy wrote:
> --- a/arch/powerpc/kernel/vdso32/Makefile
> +++ b/arch/powerpc/kernel/vdso32/Makefile
> @@ -44,7 +44,7 @@ asflags-y := -D__VDSO32__ -s
>  
>  obj-y += vdso32_wrapper.o
>  targets += vdso32.lds
> -CPPFLAGS_vdso32.lds += -P -C -Upowerpc
> +CPPFLAGS_vdso32.lds += -C
>  
>  # link rule for the .so file, .lds has to be first
>  $(obj)/vdso32.so.dbg: $(src)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday.o FORCE

> --- a/arch/powerpc/kernel/vdso64/Makefile
> +++ b/arch/powerpc/kernel/vdso64/Makefile
> @@ -30,7 +30,7 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
>  asflags-y := -D__VDSO64__ -s
>  
>  targets += vdso64.lds
> -CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
> +CPPFLAGS_vdso64.lds += -C
>  
>  # link rule for the .so file, .lds has to be first
>  $(obj)/vdso64.so.dbg: $(src)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday.o FORCE

Why are you removing -P and -Upowerpc here?  "powerpc" is a predefined
macro on powerpc-linux (no underscores or anything, just the bareword).
This is historical, like "unix" and "linux".  If you use the C
preprocessor for things that are not C code (like the kernel does here)
you need to undefine these macros, if anything in the files you run
through the preprocessor contains those words, or funny / strange / bad
things will happen.  Presumably at some time in the past it did contain
"powerpc" somewhere.

-P is to inhibit line number output.  Whatever consumes the
preprocessor output will have to handle line directives if you remove
this flag.  Did you check if this will work for everything that uses
$(CPP)?

In any case, please mention the reasoning (and the fact that you are
removing these flags!) in the commit message.  Thanks!


Segher
