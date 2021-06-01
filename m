Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA2A397A05
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 20:23:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvgXN688zz3090
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 04:23:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=J3WL8E4q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12c;
 helo=mail-lf1-x12c.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=J3WL8E4q; dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvgWy3vVvz2yXX
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 04:23:24 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id i9so23231140lfe.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Jun 2021 11:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g4HQ0zyETBbXwypfTphsYhXQU5jUVi5BzIgs/sw7Qr8=;
 b=J3WL8E4quXYSmlALpA4XqSbRNMkkryxgkK8Ptt0YOOdNVi1/KYdNDnaoduKS8LK9Ge
 +8hEjlbbF6PZpEHEiW6QJQ8UjotEyliXvpGLMrsAVg+d3vsHVhmPK2Dbx6YqMlLN/jqk
 KNjQ2W2p7bXOzJt1psL/Gdw+VOxgShKjU5eB+tDUJMFNw51HL5vvDlU0rMkx8lyK9KPS
 2OOZOf1DCbA6rQHNGOiChXxGknvervBMVdMqENHWVGUMjPOOMxZxeorJAj42uQAoHF8H
 QzoTeHaAgktEa1mDkQ2VxhcU1edRIO970jXe9XT4qv4Or1wYiSBAEvGtg5CS2XforJBA
 z2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g4HQ0zyETBbXwypfTphsYhXQU5jUVi5BzIgs/sw7Qr8=;
 b=RsScSAT5AugnA40LrZ8HhE2Iwvi0sEHyfl6S2LA1bHfEZdJl0Qjer63KsFILw0FFqR
 ZG4r+0lTAK0i5aSRQyjq5LgQMN8Kf/iSdFAxsswYsM5kdcF1McQUd9fd6CGCNioEnyXa
 WNEsniSNU3nk/Yda0UELgwCBZC6c11BB8NW/ulRjjRBaD4ghFuk0Fb4spvxQ8PIIBWmF
 VWMIcONKzLJgukvGIEYKi9Gux/IRq0wdQW1FNIuHel1RznHt/2+04q1/aflJi06QS3Sc
 DkTRkvyvmbTBG5ionf5jUp56DEJsKW1uJgCiKXFDq9Et4jpi+26C+wIWcMq/DUDPkfwP
 zlzQ==
X-Gm-Message-State: AOAM532/TH13+K06jPNnhfctUIUE4izcWCkFWhWvASBhPnMfm/6PVWny
 LgnlHTlaiZkoGSJrJMDfNx84TiJysB1bKTpXu0eraw==
X-Google-Smtp-Source: ABdhPJy/zOQjCtEcLcO5Uub6Z8ldJ7DPIhoekfBkdbkETLyqUfALtfTlQTl8mT1jH8Rq5WPnu6ej7VpO/dwlwsmRPc0=
X-Received: by 2002:a05:6512:220c:: with SMTP id
 h12mr20429141lfu.374.1622571795265; 
 Tue, 01 Jun 2021 11:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210528182752.1852002-1-nathan@kernel.org>
In-Reply-To: <20210528182752.1852002-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Jun 2021 11:23:03 -0700
Message-ID: <CAKwvOd=Z60pm4rZw5yhpq-vCKb_xqxKa9xtgsCoknzD4VNj2wQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc/barrier: Avoid collision with clang's __lwsync
 macro
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: LKML <linux-kernel@vger.kernel.org>, "# 3.4.x" <stable@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 28, 2021 at 11:29 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> A change in clang 13 results in the __lwsync macro being defined as
> __builtin_ppc_lwsync, which emits 'lwsync' or 'msync' depending on what
> the target supports.

Indeed,
$ clang --target=powerpc64le-linux-gnu -mcpu=e500 -m32
for example.

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> This breaks the build because of -Werror in
> arch/powerpc, along with thousands of warnings:
>
>  In file included from arch/powerpc/kernel/pmc.c:12:
>  In file included from include/linux/bug.h:5:
>  In file included from arch/powerpc/include/asm/bug.h:109:
>  In file included from include/asm-generic/bug.h:20:
>  In file included from include/linux/kernel.h:12:
>  In file included from include/linux/bitops.h:32:
>  In file included from arch/powerpc/include/asm/bitops.h:62:
>  arch/powerpc/include/asm/barrier.h:49:9: error: '__lwsync' macro redefined [-Werror,-Wmacro-redefined]
>  #define __lwsync()      __asm__ __volatile__ (stringify_in_c(LWSYNC) : : :"memory")
>         ^
>  <built-in>:308:9: note: previous definition is here
>  #define __lwsync __builtin_ppc_lwsync
>         ^
>  1 error generated.
>
> Undefine this macro so that the runtime patching introduced by
> commit 2d1b2027626d ("powerpc: Fixup lwsync at runtime") continues to
> work properly with clang and the build no longer breaks.
>
> Cc: stable@vger.kernel.org
> Link: https://github.com/ClangBuiltLinux/linux/issues/1386
> Link: https://github.com/llvm/llvm-project/commit/62b5df7fe2b3fda1772befeda15598fbef96a614
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/powerpc/include/asm/barrier.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
> index 7ae29cfb06c0..f0e687236484 100644
> --- a/arch/powerpc/include/asm/barrier.h
> +++ b/arch/powerpc/include/asm/barrier.h
> @@ -46,6 +46,8 @@
>  #    define SMPWMB      eieio
>  #endif
>
> +/* clang defines this macro for a builtin, which will not work with runtime patching */
> +#undef __lwsync
>  #define __lwsync()     __asm__ __volatile__ (stringify_in_c(LWSYNC) : : :"memory")
>  #define dma_rmb()      __lwsync()
>  #define dma_wmb()      __asm__ __volatile__ (stringify_in_c(SMPWMB) : : :"memory")
>
> base-commit: 97e5bf604b7a0d6e1b3e00fe31d5fd4b9bffeaae
> --
> 2.32.0.rc0
>


-- 
Thanks,
~Nick Desaulniers
