Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AD73EAC23
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 22:54:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlzSx2hjGz3cMX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 06:54:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=na6Fi0rS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=na6Fi0rS; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlzSG4hRDz2xKP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 06:53:49 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id p38so16008691lfa.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 13:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9RfJTrGHwJUwvzLhHrIbGQA08huI6dzioQ3vdmozHz8=;
 b=na6Fi0rSI2rLLK64yvV6CbdZqt7hkfyYZAYj0AwXG3vJy5/HfjDhtg9nXxK8j95c7T
 dWfG6/cghm+y3wG5foWV0MC8XuwoBlAsTmNK4ysMaiCFDZnoNaX9edYR/Omz9goAIBaQ
 LudzJ3LBHt659vx78zb3ru+03UAYUjVXr+fTY+xlrYlKDuKZrFGqQmNM5Yy7kMIVcHxK
 1AyQivcokhPLzvOuqg+CwM1+S5AtOtHkuoMajCB/xbrsC+XyRn2XxlFFNFgX7IfKjCJU
 s4333A5bIHbLDYq+5H8X7Ifs0grku54xMo96dRdUWBA4DU6t9kTOXZMUAhhcxXf6C9x9
 PDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9RfJTrGHwJUwvzLhHrIbGQA08huI6dzioQ3vdmozHz8=;
 b=k18QjnujAMXsqbpDVXZzUIUG+3N/fnKQyYLBfsPh+uCOiY1toCwHQr+uJY784aAOIO
 w8XWC8P0vPrSIi7frMxs1II4sbIO/w1A1Wv4ysR5+UBrFL+Tqn03AbFmJHDsPrskzI8d
 AiKnAqfj4ngMmTdCtt6D4nbbL9Zs2JmYbx/eI3ZDxlc3UVTd5l8bqXIkv0HDCQfyVPXl
 SQUAL4xWTMJokskOtIMvavKmdRkzkCBJ5iwYb5e98II2wc3IJCIyYY2nxGtjvylYS3Kw
 p6zLmjU5BKQ4X6RBypIaGD3dm761DMlpgT5lvGDv6UleqSMjMCCva7pkR8U04c1z7Wjf
 bT+g==
X-Gm-Message-State: AOAM5328VE4c/6HYZCLYldn6htvcqnQieHEaFIjxv/GitWsPY2J4HnoX
 b1ciy8wfBBHf0FNqvBdMO4z2B0JoOscTC45XD8mrqw==
X-Google-Smtp-Source: ABdhPJzSfb2zL6p4h6mr9zvtdf09aJL2UzLWyGpzFgoKtJP4f7uX8Ov4OP5v83ZcsQUbgZX+2v47ZLMJi3WTEJ2itIw=
X-Received: by 2002:a05:6512:3989:: with SMTP id
 j9mr3957811lfu.73.1628801624318; 
 Thu, 12 Aug 2021 13:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210812204951.1551782-1-morbo@google.com>
In-Reply-To: <20210812204951.1551782-1-morbo@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 12 Aug 2021 13:53:32 -0700
Message-ID: <CAKwvOdm8R1zh-NPCRZX=_BZhUEey5v=0jjz=ca82tzMn2kFqYg@mail.gmail.com>
Subject: Re: [PATCH] ppc: add "-z notext" flag to disable diagnostic
To: Bill Wendling <morbo@google.com>
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
Cc: itaru.kitayama@riken.jp, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 12, 2021 at 1:49 PM Bill Wendling <morbo@google.com> wrote:
>
> The "-z notext" flag disables reporting an error if DT_TEXTREL is set on
> PPC with CONFIG=kdump:
>
>   ld.lld: error: can't create dynamic relocation R_PPC64_ADDR64 against
>     local symbol in readonly segment; recompile object files with -fPIC
>     or pass '-Wl,-z,notext' to allow text relocations in the output
>   >>> defined in built-in.a(arch/powerpc/kernel/misc.o)
>   >>> referenced by arch/powerpc/kernel/misc.o:(.text+0x20) in archive
>       built-in.a
>
> The BFD linker disables this by default (though it's configurable in
> current versions). LLD enables this by default. So we add the flag to
> keep LLD from emitting the error.
>
> Signed-off-by: Bill Wendling <morbo@google.com>

Link: https://github.com/ClangBuiltLinux/linux/issues/811
Reported-by: Itaru Kitayama <itaru.kitayama@riken.jp>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> ---
> The output of the "get_maintainer.pl" run just in case no one believes me. :-)

LOL!

>
> $ ./scripts/get_maintainer.pl arch/powerpc/Makefile
> Michael Ellerman <mpe@ellerman.id.au> (supporter:LINUX FOR POWERPC (32-BIT AND 64-BIT))
> Benjamin Herrenschmidt <benh@kernel.crashing.org> (reviewer:LINUX FOR POWERPC (32-BIT AND 64-BIT))
> Paul Mackerras <paulus@samba.org> (reviewer:LINUX FOR POWERPC (32-BIT AND 64-BIT))
> Nathan Chancellor <nathan@kernel.org> (supporter:CLANG/LLVM BUILD SUPPORT)
> Nick Desaulniers <ndesaulniers@google.com> (supporter:CLANG/LLVM BUILD SUPPORT)
> linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT))
> linux-kernel@vger.kernel.org (open list)
> clang-built-linux@googlegroups.com (open list:CLANG/LLVM BUILD SUPPORT)
> ---
>  arch/powerpc/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 6505d66f1193..17a9fbf9b789 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -122,6 +122,7 @@ endif
>
>  LDFLAGS_vmlinux-y := -Bstatic
>  LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie
> +LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) += -z notext
>  LDFLAGS_vmlinux        := $(LDFLAGS_vmlinux-y)
>
>  ifdef CONFIG_PPC64
> --
> 2.33.0.rc1.237.g0d66db33f3-goog
>


-- 
Thanks,
~Nick Desaulniers
