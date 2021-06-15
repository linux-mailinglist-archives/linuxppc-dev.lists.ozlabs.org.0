Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D42BE3A783C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:47:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G40l730trz3btl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 17:46:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=Ma5dk7dw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Ma5dk7dw; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G40kg0kNnz301L
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 17:46:32 +1000 (AEST)
Received: by mail-ot1-x32e.google.com with SMTP id
 7-20020a9d0d070000b0290439abcef697so7974491oti.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 00:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iSVyAacN7l8MRU6+yXnglhfZd0yPT6M71q0qhoSn658=;
 b=Ma5dk7dw0py0KMSezsjczrNLk2CqZKg10JsIjyEe3U1pEvt5ydu0bUCARaRJ4qeU5L
 IWbS57fwsWyMAKpwDOsj0Al0AZWttPfUdRJkX/g9LsxM8DhlXrWVFVngFvAlaFRPd+bM
 wCI3fJ8zFZDal4fw1RhxmNpYqgXqmsSz+hIfI6J/WkJcINCWTgPji8QxdTaE4ViYxLab
 X9cpI1EvtyDDoAgzipck4FVqQrEau2v5WXDpkNVBzo0kBpK8oVI+qy+O0otdYEFni1Ba
 rYtoVW/wNEsmiX0tg4zEatuiCYZw8BMmHJwXeSBCbG85/X43XF0gkIYlWj4u4EreqbZ4
 CrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iSVyAacN7l8MRU6+yXnglhfZd0yPT6M71q0qhoSn658=;
 b=GYlVPgefw2OM7L/XMPTg+nM3A4w0LZ3RjRF+DTj9oBTdkXHizPD1dvqld7MqvIG66w
 XkxNracWpnBM/miTpcaiZb/5WDcnFyRboB6BQRE9yWPr6BzexjRKLULtMz1LqUvfAnYx
 gNqw7ErMV2KLi2WlSLdwTsDWME739hxhpExDKpPC2X4MvlPZ8ay5O9TTptyeYAZnsFGh
 kjQi3zVmN7tY9CcsjTBKo3jjW8E6ahs16rxipQwKbdr7L1q9yejljl7DrSCANyBoHEXT
 ViBQJ6sFOG+Zh4nr20SMynRrmDogrUGdayhDfupp5RcfcY5ZYcK6PrCUcikEZP/jkJwH
 a0Xg==
X-Gm-Message-State: AOAM530n755/UTAOct04cskshzDUvmHc5Hh5maUmyiFaDej3J+H+0Nv0
 Z8WVMhK252H+tTuIAr5oMMRlBlVf7MBJ91ODZ86oUA==
X-Google-Smtp-Source: ABdhPJxTwVuYpOsUHB/zZCmNgAEl0R34kaWfPaSAc5XQzSsCOzmFbbJ5xQFNjbnBZfWDTPH1mExgV8EmLRtJfclXSTU=
X-Received: by 2002:a05:6830:93:: with SMTP id
 a19mr16704693oto.17.1623743188202; 
 Tue, 15 Jun 2021 00:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210615014705.2234866-1-dja@axtens.net>
 <20210615014705.2234866-2-dja@axtens.net>
In-Reply-To: <20210615014705.2234866-2-dja@axtens.net>
From: Marco Elver <elver@google.com>
Date: Tue, 15 Jun 2021 09:46:16 +0200
Message-ID: <CANpmjNOa-a=M-EgdkneiWDD0eCF-DELjMFxAeJzGQz6AgCdNWg@mail.gmail.com>
Subject: Re: [PATCH v12 1/6] kasan: allow an architecture to disable inline
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

On Tue, 15 Jun 2021 at 03:47, Daniel Axtens <dja@axtens.net> wrote:
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
>  lib/Kconfig.kasan | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index cffc2ebbf185..935814f332a7 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -12,6 +12,15 @@ config HAVE_ARCH_KASAN_HW_TAGS
>  config HAVE_ARCH_KASAN_VMALLOC
>         bool
>
> +# Sometimes an architecture might not be able to support inline instrumentation
> +# but might be able to support outline instrumentation. This option allows an
> +# arch to prevent inline and stack instrumentation from being enabled.

This comment could be moved into 'help' of this new config option.

> +# ppc64 turns on virtual memory late in boot, after calling into generic code
> +# like the device-tree parser, so it uses this in conjuntion with a hook in
> +# outline mode to avoid invalid access early in boot.

I think the ppc64-related comment isn't necessary and can be moved to
arch/ppc64 somewhere, if there isn't one already.

> +config ARCH_DISABLE_KASAN_INLINE
> +       bool
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
> 2.27.0
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20210615014705.2234866-2-dja%40axtens.net.
