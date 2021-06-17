Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FD63AACFC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 09:07:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5CmK3cZqz3btf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:07:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=TUHB1N3e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=TUHB1N3e; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5Cll5yWFz3bty
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 17:06:43 +1000 (AEST)
Received: by mail-oi1-x229.google.com with SMTP id u11so5463269oiv.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 00:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x3f7kXNEAio7wn8rN5Q4qZlH4cBywzmH0Nokkyx4dn0=;
 b=TUHB1N3eQfQ+/6r1GQXAlEPc8aNokCkZd1BTVoHNgFnFfyyaHuQ8Tf7NNKqMlBvak5
 YbMSSm+I9FLnG6TB8exQz/e5/DYGCNOU/HrQl7W9jHCTKMaPj48hgCrwO9HAqgsa6PUU
 LgzrPRiShRHFjIi0iMpIAfWuzyxY+yn074UknITQ6pWASp1mjiJ0xWYaLULgti2EgPfe
 CFsnD12vzglyKQp2quLeZjsZzcUBopxr/0CtrPKM2M5H+yt81jGEmvHjQ1GSTNFrUFim
 x4jAoOqmxpNRbiiJmDV+4C3HGdD1V9gQCdcX2DPFH21+kPNkDgzSy0vHY/OkTpHX6gs3
 BhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x3f7kXNEAio7wn8rN5Q4qZlH4cBywzmH0Nokkyx4dn0=;
 b=t5WeWcLxK93jcsq3rNgW/Id3/wGR+5/1LWzQ2lQHgdgSjg8KIR0MHVO9FKUvfi36M3
 ZPY2AFi4Y1bAuXsezN+sqGOaSfDmlTIKfP9arT9ShvX2vzsqV54eNjIU9vCJQ7OSw4jJ
 3bbz0tHTFpVo2hSDyx6JnoR5g5oYzdxft+YOl4+w7JCk6Y5p76WmYdKvp+NaCnXxDddS
 khGwYM50fSdfMow+9yNtPr/6wj5IpeHozGFqXem3xPvNtrGyFP/gh776w9b7l630JgKD
 yVj20Hp8NIrxXGBYyB+xzQ3OqKBDkumrrY28nPgFNxoPodBFeeph3ZvCepJqH1bj3JBN
 kDhg==
X-Gm-Message-State: AOAM531/cFWh2k6CvkQnVeUWTjYUTclFogCveaXBI3BDsUFe70kMvrfS
 JebpAAAN76mVHI7HbSbEFpBnABpjM4IJ7Yit8Ao7jw==
X-Google-Smtp-Source: ABdhPJyZGKvGnxD2CIdMiQREsVQ1HcwtZM1JRfUu9L6kEngXp5CZ452oDL3g8DnPzot/p3uA3kuCYblnTqzbZUjMv6k=
X-Received: by 2002:a05:6808:bd5:: with SMTP id
 o21mr2268625oik.172.1623913599850; 
 Thu, 17 Jun 2021 00:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210617063956.94061-1-dja@axtens.net>
 <20210617063956.94061-2-dja@axtens.net>
In-Reply-To: <20210617063956.94061-2-dja@axtens.net>
From: Marco Elver <elver@google.com>
Date: Thu, 17 Jun 2021 09:06:28 +0200
Message-ID: <CANpmjNPw2_Av0HVSBMP0nj0a2dwqKxMopWwvsyQF1vv5hN0zzA@mail.gmail.com>
Subject: Re: [PATCH v14 1/4] kasan: allow an architecture to disable inline
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
 kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Andrey Konovalov <andreyknvl@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 17 Jun 2021 at 08:40, Daniel Axtens <dja@axtens.net> wrote:
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
> Signed-off-by: Daniel Axtens <dja@axtens.net>

Reviewed-by: Marco Elver <elver@google.com>


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
> +
> +
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
> +         also disabled as it adds inline-style instrumentation that
> +         is run unconditionally.
>
>  config KASAN_SW_TAGS_IDENTIFY
>         bool "Enable memory corruption identification"
> --
> 2.30.2
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20210617063956.94061-2-dja%40axtens.net.
