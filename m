Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 862C9E946
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 19:36:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tBfn05hrzDqSV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 03:36:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dh5XugVN"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tBcy4gbLzDqBr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 03:35:08 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id t22so2472891pgi.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 10:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3kM8XyTuKXCw/0VhDx0EpsJTgk6kLql0lEsb7+DZlns=;
 b=dh5XugVNe0puvkDeCqwzeG18FWp/5XbFOyuGLNw7+8E5AlJh2gujXqo27m2hlqbeMN
 aoQ3qFCgsNieB+uvlBChFOzwnZVpe+8lrSo4Rduy65FMiHqKULm+FBSzYeKhlkKHJhiV
 8EXCznDKlX8MdjQ5/ajab1o0SyffoXlFNQufQrze+Odf7mAiydHdYBAl1/+IrrdtGqJJ
 hTHe3RmvTYudiA30jwC+5MzvoQNXpoPu9ws7whaO1jpD+fa59TdaZLw8DbQwkUFUEgDM
 3nj1Ci0MnWIZ40WUwPsdanhHbGxSEOzZbJ34vFkEp4+aRu44pwQUvzc5+EoN08dtXvIS
 YOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3kM8XyTuKXCw/0VhDx0EpsJTgk6kLql0lEsb7+DZlns=;
 b=IYRFU6iRb3zt2bwaPEvPPKJA4ZSf2LsgOmq5bBEGlv11vncGrd5c7trLnFroEL3P2h
 8Syau65ZEK/syLTpTfTXYZHYOXIEme7caF3bGb/K67sAN8syGg1ipkEYLrxGoI/FurIc
 8WUHO6ewLn7eKG/blUK0vKpLIxOAqCj+EmGzdJ+Ly465EUQ8QxVlTw0mQObm9BYKgw4O
 az+OrfFEi/p+NXXr8JK9rxllmf1+BrneTflZb+GpF7juiEYg5heinVb+DAISx/YYQzeL
 sBJgxzpqQKXy63Ppko5jOscxaWNFVtyT28xWGNSRWQSD50QmG4VhtQUP2/Vo/s1H6Khn
 Hd0w==
X-Gm-Message-State: APjAAAXouAA2Bfbm1e/HzelIZaNtHQDmSMeKOoXZl/Di2zYlkvN3ZjoB
 JAffR+tnrehOe550hO/G/SOOlvL4PqCDG7VycgcGzQ==
X-Google-Smtp-Source: APXvYqyF4Z7BwUGF0kVmWLTqE2/dQ7UhZFi3PwcdVX7M6ya+BIelyPKfjymosKZyj06QgDVvgqPAS6PdbSbMbNTt5n0=
X-Received: by 2002:a63:c702:: with SMTP id n2mr21522880pgg.255.1556559304964; 
 Mon, 29 Apr 2019 10:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190426130015.GA12483@archlinux-i9>
 <20190426190603.5982-1-linux@rasmusvillemoes.dk>
 <20190426190603.5982-2-linux@rasmusvillemoes.dk>
In-Reply-To: <20190426190603.5982-2-linux@rasmusvillemoes.dk>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 29 Apr 2019 10:34:53 -0700
Message-ID: <CAKwvOdm95LvKXFw3fartoAh0JFMJsHi5Nm1n9400L8gKgk4-Yw@mail.gmail.com>
Subject: Re: [PATCH 12/10] powerpc: unbreak DYNAMIC_DEBUG=y build with clang
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
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
Cc: Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>,
 Jason Baron <jbaron@akamai.com>, Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 26, 2019 at 12:06 PM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> Current versions of clang does not like the %c modifier in inline
> assembly for targets other than x86, so any DYNAMIC_DEBUG=y build
> fails on ppc64. A fix is likely to land in 9.0 (see
> https://github.com/ClangBuiltLinux/linux/issues/456), but unbreak the
> build for older versions.
>
> Fixes: powerpc: select DYNAMIC_DEBUG_RELATIVE_POINTERS for PPC64
> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

Thanks for fixing the build.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> Andrew, please apply and/or fold into 10/10.
>
>  arch/powerpc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 6821c8ae1d62..8511137ab963 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -155,7 +155,7 @@ config PPC
>         select BUILDTIME_EXTABLE_SORT
>         select CLONE_BACKWARDS
>         select DCACHE_WORD_ACCESS               if PPC64 && CPU_LITTLE_ENDIAN
> -       select DYNAMIC_DEBUG_RELATIVE_POINTERS  if PPC64
> +       select DYNAMIC_DEBUG_RELATIVE_POINTERS  if PPC64 && (CC_IS_GCC || CLANG_VERSION >= 90000)
>         select DYNAMIC_FTRACE                   if FUNCTION_TRACER
>         select EDAC_ATOMIC_SCRUB
>         select EDAC_SUPPORT
> --
> 2.20.1
>


-- 
Thanks,
~Nick Desaulniers
