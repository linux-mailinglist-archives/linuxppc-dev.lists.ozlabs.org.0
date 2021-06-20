Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F653ADE2D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 13:46:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G79q63vqmz307L
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 21:46:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jN/BusFB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::533;
 helo=mail-ed1-x533.google.com; envelope-from=andreyknvl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jN/BusFB; dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G798L2wv2z2yyG
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jun 2021 21:16:16 +1000 (AEST)
Received: by mail-ed1-x533.google.com with SMTP id h2so1412493edt.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jun 2021 04:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V5/7gChl8XVHJy56wbmIvB0M6WNYjYtPIXj58muV060=;
 b=jN/BusFBAy0H0K8XICbKokRtXvE46Jg9wWHv6C3yKJ4ltpqDJcQGhZ1eGePUBuJpcD
 GVxy6L/KfghmPpoSd2s77Z8Zw2PNKoXTFC7Vc4efp7591Uwv6OKlhUDLZI9OodjSCUpE
 MolIufzAU533+EeMqNY33zlNltq8XndJxXofqolSSAyJP8+RQPEm54nwOhapMtA9d7bX
 MEBe4KrOtHSXD25IZkebvvqyDUw++ST0DGBen5Hg4H7v8bUWgx9ebTGF9Hu/m7OB7aKy
 szK7be9Uymxn+Z94tuUlyy6luSg1iXknyktYtOcMD7rRST/QhbxXSU4EOWhld50Zga9y
 DFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V5/7gChl8XVHJy56wbmIvB0M6WNYjYtPIXj58muV060=;
 b=Mq9tgQ41CaE3fHrMDhhbvbX3Zphh+dZie81siO+Bfdjfet283vzSnCf0vunVkGtYeq
 mia6YNrZVBIqqsktnMQWxcj5XtD6U7E28nuwxi87mhBevQTMnya9UIqcgKpG3HFq0iXJ
 rMQGw2chA+fqLiMNkjo/c6GxFmFO/kc2rShJzXbTfwq8SS6nUpYzlkrwcutY/5EvPK88
 2Ev0rIEp9HJ6v4vqomwC6abCnTQ/H5Dn9O90l9S7DL+SDutXedGZK+TA39aN9MU7Wxxx
 U0I9oSCIEQvgcTLTW3n2GXWbsPQgNt0jnRWlHtVFtib2aMuvOlSzGZVt4HoZhwuUP2PF
 91Jw==
X-Gm-Message-State: AOAM533TxCCNli4UypZm28W3BEWWgnFzYsN3nkRE7DjdUmqNDnxvyhpM
 2UTzdub/x5aS24lmPcjh1hfK1SrCNH6zGOfXnyw=
X-Google-Smtp-Source: ABdhPJz937pStinuTEs3ZLpQqCjCRjkm2e7k2G+o2w9JlMneIbvvO44fP0ffJTE/fw1xSG2QWrOyaAGXJfP/zvvi5Rc=
X-Received: by 2002:a05:6402:42d2:: with SMTP id
 i18mr15359424edc.168.1624187767478; 
 Sun, 20 Jun 2021 04:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210617093032.103097-1-dja@axtens.net>
 <20210617093032.103097-2-dja@axtens.net>
In-Reply-To: <20210617093032.103097-2-dja@axtens.net>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sun, 20 Jun 2021 14:15:47 +0300
Message-ID: <CA+fCnZecs6jVgMmVq0N1iGRO4Cm+rbm5xyj_sMdKkxhX6-nvaA@mail.gmail.com>
Subject: Re: [PATCH v15 1/4] kasan: allow an architecture to disable inline
 instrumentation
To: Daniel Axtens <dja@axtens.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 20 Jun 2021 21:46:05 +1000
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

On Thu, Jun 17, 2021 at 12:30 PM Daniel Axtens <dja@axtens.net> wrote:
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
>  lib/Kconfig.kasan | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index cffc2ebbf185..cb5e02d09e11 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -12,6 +12,15 @@ config HAVE_ARCH_KASAN_HW_TAGS
>  config HAVE_ARCH_KASAN_VMALLOC
>         bool
>
> +config ARCH_DISABLE_KASAN_INLINE
> +       bool
> +       help
> +         Sometimes an architecture might not be able to support inline
> +         instrumentation but might be able to support outline instrumentation.
> +         This option allows an architecture to prevent inline and stack
> +         instrumentation from being enabled.

This seems too wordy.

How about: "An architecture might not support inline instrumentation.
When this option is selected, inline and stack instrumentation are
disabled."

> +
> +

Drop the extra empty line.

>  config CC_HAS_KASAN_GENERIC
>         def_bool $(cc-option, -fsanitize=kernel-address)
>
> @@ -130,6 +139,7 @@ config KASAN_OUTLINE
>
>  config KASAN_INLINE
>         bool "Inline instrumentation"
> +       depends on !ARCH_DISABLE_KASAN_INLINE
>         help
>           Compiler directly inserts code checking shadow memory before
>           memory accesses. This is faster than outline (in some workloads
> @@ -141,6 +151,7 @@ endchoice
>  config KASAN_STACK
>         bool "Enable stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST
>         depends on KASAN_GENERIC || KASAN_SW_TAGS
> +       depends on !ARCH_DISABLE_KASAN_INLINE
>         default y if CC_IS_GCC
>         help
>           The LLVM stack address sanitizer has a know problem that
> @@ -154,6 +165,9 @@ config KASAN_STACK
>           but clang users can still enable it for builds without
>           CONFIG_COMPILE_TEST.  On gcc it is assumed to always be safe
>           to use and enabled by default.
> +         If the architecture disables inline instrumentation, this is

this => stack instrumentation



> +         also disabled as it adds inline-style instrumentation that
> +         is run unconditionally.
>
>  config KASAN_SW_TAGS_IDENTIFY
>         bool "Enable memory corruption identification"
> --
> 2.30.2
>
