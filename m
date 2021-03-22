Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7A5343B8D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 09:19:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3nTw6xRJz30KN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 19:19:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=vbc/hSaV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::c30;
 helo=mail-oo1-xc30.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=vbc/hSaV; dkim-atps=neutral
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3nTV4Bbhz2yjB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 19:19:10 +1100 (AEDT)
Received: by mail-oo1-xc30.google.com with SMTP id
 c12-20020a4ae24c0000b02901bad05f40e4so3888127oot.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 01:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JBfYmKFZfBEnELsahissKGVzgwoqNgBhQO83P0Ky7Zc=;
 b=vbc/hSaV4MuILyTU4P286uzmQVg34MFU7tQUli92lqMnCXWwFUEbXjQIcMpQSlbqpZ
 vCxpSDAOlaKA/4gPzfUIYMOlbCkj45dAwFF9YgyEGe2fyM1jGtbeISW7T3IprN048F3o
 IkmFqA7MYPGDrWaBcerQ8t3/QzjJ3VmbPg9EBw/MyxaInCYzs9kcemcD/YSVOeHmXBe6
 s7cQxiDZCAFmEbHysreQQLCkGqG3LXNGCSsbGwPs6K36c+Kt54OUCzI8ws19WhpYSryf
 lMkMu0YSVCvhS+HK5mLoSOHfRS95+Wi8951HhXuO0m64scpOGKlA0N3ZEv6XHVv2IOwa
 VPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JBfYmKFZfBEnELsahissKGVzgwoqNgBhQO83P0Ky7Zc=;
 b=VrNyC0XisuDfAKbAiMhdLvy97lJhwSnYfC4JdxyJ3nvtVx5Jyf+GYx5YE5wKUCDRK/
 Mg2WR+yGo+1iwm5OTt0mXwT6fpGfJCbRULf/oBvNwrgqa1FfLbODowvYYEz5D41WcOFt
 CcfQmKczEssTnUFCdVCi67fnnnlyMh3NpC8PT/7Ecr1ZAmPnMle3beDRIELYvlTAH6qY
 M0Eqp10je38D44QeJXylaKLJd/kC9UvixflaA+D7aiwY9ovDjNH6D4DNRpvhwizkvp4n
 3skDY8OKYfNeFGpIbL/TszbNwTqCTOmR/6FUFZIL00N87oNAVcWTd0hcw6y+w6NbJ4cS
 125Q==
X-Gm-Message-State: AOAM530z2QM9w3a2JePRhblVo2b2XswLsDkOMc+GclS0QF58TMZmmTcU
 dic3/PQCHR9SvogTvmGXRb4efvjw+WTSOuC5dVzHtQ==
X-Google-Smtp-Source: ABdhPJzOfhULA7o6Ke4gbHHc79cRpiFVd1ZzcejhYH+UmuCFogcw4AsJutpy6ZzMe2Ucj0nst5L5zLnLOTOkGxaY3p0=
X-Received: by 2002:a4a:d0ce:: with SMTP id u14mr10172401oor.36.1616401147100; 
 Mon, 22 Mar 2021 01:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210319144058.772525-1-dja@axtens.net>
 <20210319144058.772525-2-dja@axtens.net>
In-Reply-To: <20210319144058.772525-2-dja@axtens.net>
From: Marco Elver <elver@google.com>
Date: Mon, 22 Mar 2021 09:18:55 +0100
Message-ID: <CANpmjNOygpN7Aifd_+ycvxA+zNvyb9rF7mTA_yCfjbRK9evLGA@mail.gmail.com>
Subject: Re: [PATCH v11 1/6] kasan: allow an architecture to disable inline
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
Cc: aneesh.kumar@linux.ibm.com, LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 kasan-dev <kasan-dev@googlegroups.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 Mar 2021 at 15:41, Daniel Axtens <dja@axtens.net> wrote:
>
> For annoying architectural reasons, it's very difficult to support inline
> instrumentation on powerpc64.
>
> Add a Kconfig flag to allow an arch to disable inline. (It's a bit
> annoying to be 'backwards', but I'm not aware of any way to have
> an arch force a symbol to be 'n', rather than 'y'.)
>
> We also disable stack instrumentation in this case as it does things that
> are functionally equivalent to inline instrumentation, namely adding
> code that touches the shadow directly without going through a C helper.
>
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> ---
>  lib/Kconfig.kasan | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index cffc2ebbf185..7e237dbb6df3 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -12,6 +12,9 @@ config HAVE_ARCH_KASAN_HW_TAGS
>  config HAVE_ARCH_KASAN_VMALLOC
>         bool
>
> +config ARCH_DISABLE_KASAN_INLINE
> +       def_bool n
> +

Does just "bool" work here?

>  config CC_HAS_KASAN_GENERIC
>         def_bool $(cc-option, -fsanitize=kernel-address)
>
> @@ -130,6 +133,7 @@ config KASAN_OUTLINE
>
>  config KASAN_INLINE
>         bool "Inline instrumentation"
> +       depends on !ARCH_DISABLE_KASAN_INLINE
>         help
>           Compiler directly inserts code checking shadow memory before
>           memory accesses. This is faster than outline (in some workloads
> @@ -142,6 +146,7 @@ config KASAN_STACK
>         bool "Enable stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST
>         depends on KASAN_GENERIC || KASAN_SW_TAGS
>         default y if CC_IS_GCC
> +       depends on !ARCH_DISABLE_KASAN_INLINE

Minor, but perhaps this 'depends on' line could be moved up 1 line to
be grouped with the other 'depends on'.


>         help
>           The LLVM stack address sanitizer has a know problem that
>           causes excessive stack usage in a lot of functions, see
> @@ -154,6 +159,9 @@ config KASAN_STACK
>           but clang users can still enable it for builds without
>           CONFIG_COMPILE_TEST.  On gcc it is assumed to always be safe
>           to use and enabled by default.
> +         If the architecture disables inline instrumentation, this is
> +         also disabled as it adds inline-style instrumentation that
> +         is run unconditionally.
>
>  config KASAN_SW_TAGS_IDENTIFY
>         bool "Enable memory corruption identification"
> --
> 2.27.0
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20210319144058.772525-2-dja%40axtens.net.
