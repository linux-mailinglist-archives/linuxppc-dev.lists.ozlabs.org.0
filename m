Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD46B3B44B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 15:45:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBJDg34Txz3bv1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 23:45:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=kiJfd8p4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::533;
 helo=mail-ed1-x533.google.com; envelope-from=andreyknvl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kiJfd8p4; dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBJDC2PdRz3bs2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 23:45:30 +1000 (AEST)
Received: by mail-ed1-x533.google.com with SMTP id i5so13518760eds.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 06:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iL+ONoFlGB91h/2MUDT1aNEjicjs7hNRvFGJskZUmDk=;
 b=kiJfd8p4xmlfbbZeSAn7Lzj+f+Dlybzapab68m2GbQ4GvW+A/165hn6+a7u63+lL5M
 fmiLROxHMEoHu+rgaB8iM+cA7KHd25HadOrD0bN+0W8TumCO/d3Y897stl/sl9kr1Ji4
 lIZ0EYrGQk2nvmZKHixDg2iWcBGDsiGaql1sDyCuc1bKIFm5Avth0s+MgpnNAV9GJftx
 WJhC+gEsldsGSxaUb4snna01s+M1LtJb5Sbs2NGlahU1QE4mwG7MTczxaOcuCMdvhdVg
 vX6FUgy2TMfumXgLOfXFWl+5wTxxmMewDH7X/QET8Kut41gxOLuanOpo3n3TZqTwzrK6
 wWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iL+ONoFlGB91h/2MUDT1aNEjicjs7hNRvFGJskZUmDk=;
 b=DGMiA/rbRnQxx2fhZMBjfKzodmkqRj+z4FUXgJ/r/pkSKQp+S5YdWwdZ7Co1TV8Egq
 FMtSHntZQBedvqTwI/FE5okdpn6fYUwz6JYjavMJSVBynkvKRrsDLQgIy1W0pS9mU8+0
 amb/pbujrPZPJAxh31njCS/zzvqNI1Nlzvv2iZQWsAska2/gDZ61v74+MB3kMxPbThRg
 ORXxTF9K8icEXzMisB+xABdTnVDjCnHbyEAjAXGkngyo69bO2y4iFJXYqlVSbyWi98uy
 DLKuLkfqpkkTUbFEFtjRTDqSSK7+eDPoRjq0anu6cYO1QPPYZdyIpj7Y++1PIkLZG9BY
 D0Lg==
X-Gm-Message-State: AOAM533eVnin02d6T26rNwvbX5A2nxrSYLqiYD4r8vywkaEJnI26GEwe
 d9T2m5A4aJ29nPBas065QDkee12Kmfhb4KNr9l0=
X-Google-Smtp-Source: ABdhPJx/7wjtLCAR6FYQikOX37FFylP8a7qQdtDOPEXfXKCSIS4vRYSHLyq4FbUNXPoqlm8HtjDFpeUqLxV3DCkiGxE=
X-Received: by 2002:a05:6402:4408:: with SMTP id
 y8mr14915135eda.55.1624628724627; 
 Fri, 25 Jun 2021 06:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210624034050.511391-1-dja@axtens.net>
 <20210624034050.511391-2-dja@axtens.net>
In-Reply-To: <20210624034050.511391-2-dja@axtens.net>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 25 Jun 2021 16:45:02 +0300
Message-ID: <CA+fCnZeLFoqm6_bxVgwG3teP6688rvQ1vBJyor1dCfj6F7kLUQ@mail.gmail.com>
Subject: Re: [PATCH v16 1/4] kasan: allow an architecture to disable inline
 instrumentation
To: Daniel Axtens <dja@axtens.net>
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
Cc: Marco Elver <elver@google.com>, aneesh.kumar@linux.ibm.com,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 24, 2021 at 6:41 AM Daniel Axtens <dja@axtens.net> wrote:
>
> For annoying architectural reasons, it's very difficult to support inline
> instrumentation on powerpc64.*
>
> Add a Kconfig flag to allow an arch to disable inline. (It's a bit
> annoying to be 'backwards', but I'm not aware of any way to have
> an arch force a symbol to be 'n', rather than 'y'.)
>
> We also disable stack instrumentation in this case as it does things that
> are functionally equivalent to inline instrumentation, namely adding
> code that touches the shadow directly without going through a C helper.
>
> * on ppc64 atm, the shadow lives in virtual memory and isn't accessible in
> real mode. However, before we turn on virtual memory, we parse the device
> tree to determine which platform and MMU we're running under. That calls
> generic DT code, which is instrumented. Inline instrumentation in DT would
> unconditionally attempt to touch the shadow region, which we won't have
> set up yet, and would crash. We can make outline mode wait for the arch to
> be ready, but we can't change what the compiler inserts for inline mode.
>
> Reviewed-by: Marco Elver <elver@google.com>
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> ---
>  lib/Kconfig.kasan | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index cffc2ebbf185..c3b228828a80 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -12,6 +12,13 @@ config HAVE_ARCH_KASAN_HW_TAGS
>  config HAVE_ARCH_KASAN_VMALLOC
>         bool
>
> +config ARCH_DISABLE_KASAN_INLINE
> +       bool
> +       help
> +         An architecture might not support inline instrumentation.
> +         When this option is selected, inline and stack instrumentation are
> +         disabled.
> +
>  config CC_HAS_KASAN_GENERIC
>         def_bool $(cc-option, -fsanitize=kernel-address)
>
> @@ -130,6 +137,7 @@ config KASAN_OUTLINE
>
>  config KASAN_INLINE
>         bool "Inline instrumentation"
> +       depends on !ARCH_DISABLE_KASAN_INLINE
>         help
>           Compiler directly inserts code checking shadow memory before
>           memory accesses. This is faster than outline (in some workloads
> @@ -141,6 +149,7 @@ endchoice
>  config KASAN_STACK
>         bool "Enable stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST
>         depends on KASAN_GENERIC || KASAN_SW_TAGS
> +       depends on !ARCH_DISABLE_KASAN_INLINE
>         default y if CC_IS_GCC
>         help
>           The LLVM stack address sanitizer has a know problem that
> @@ -154,6 +163,9 @@ config KASAN_STACK
>           but clang users can still enable it for builds without
>           CONFIG_COMPILE_TEST.  On gcc it is assumed to always be safe
>           to use and enabled by default.
> +         If the architecture disables inline instrumentation, stack
> +         instrumentation is also disabled as it adds inline-style
> +         instrumentation that is run unconditionally.
>
>  config KASAN_SW_TAGS_IDENTIFY
>         bool "Enable memory corruption identification"
> --
> 2.30.2
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

Thanks, Daniel!
