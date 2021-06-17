Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF413AACFB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 09:06:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5Cls0XKFz3c0x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:06:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=eGrVtvwA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=eGrVtvwA; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5ClL3dtQz2yX6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 17:06:20 +1000 (AEST)
Received: by mail-ot1-x333.google.com with SMTP id
 w22-20020a0568304116b02904060c6415c7so5188681ott.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 00:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nhqmE1vBTbQZlPad3fKuDW4Qef6o+8lKl4ONa0J/G/8=;
 b=eGrVtvwA+i6aNAMo3ETYrgy4DVEWUiimdDfxOE2LFye56wFHpr1W4MnbrblQ8rRQcC
 xJ75y+uRuCGoD3u+AwSOr3k3oP8buzdYF7JppwE5mTFUR0Oe2ouOwNKfRRuPgh7Rr/zk
 RyQf66jXNR/8yk3XRkGerNoLo+WDXQA6ePmSKgvat2HJxflCZPul4uR6rRSq1QM9w53J
 2TE6qCvLxMRjTV1m+KDKmwdi6doQ3jZ+Roh6f2GRMQZ7Uk/4Z11RLlP8MRyTk+7ApLA2
 rL5GXw+oTZeFmgnFcHUqZTo1Ehtao2FNASwGb3WRDOZm6rnFo/I35o+YxhzFb9V+4O/Y
 35jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nhqmE1vBTbQZlPad3fKuDW4Qef6o+8lKl4ONa0J/G/8=;
 b=KWJrG37QZl6mmH90QvZsuplibRJQg6gJ8mBDrD6VLZ5THYanhS/x7cI+lARby+2e5o
 SSLy2HbTDLcAiGaVhEHe1zRtE6dUEaqVBsV2kQS42mFd6Z1/x4fX/lVFUz8t7bdQDJ4I
 TQX622XIf48M+rhRCG0HYZiO0j0XqZmVSjsxvwJPGlby7Zuslh0oleniVEVoIZkoU/dB
 VZ7Dn+OcHZtuduopNdU57dE51ZeJX0ev1nBqIPqaDrG0F4+JHeOYoeXzAArWDO8gllX2
 n2A3phyMC5s82gM0fknOnBYLKcSlfRz/+qLdlbZhlrzVGODcBPkN/EIAFw4VlmZW5fig
 Efxw==
X-Gm-Message-State: AOAM530lafxFWBj8Q7docKnXjUPb+LOmbtTron6zaK6psUp+V797bHtF
 A7nzi41WaD5yxOVP8wlV8d+hxxpZLWf6e5Kw+q1lpg==
X-Google-Smtp-Source: ABdhPJzb3pydS4fL1OGc3+kLyBtkxKVQSv+5ySB2k1JVkAvfcK53EAa09UHM2AiBfuP55Icc+GyGNfs+i3l/fcRAo0o=
X-Received: by 2002:a9d:4e7:: with SMTP id 94mr3260598otm.233.1623913575674;
 Thu, 17 Jun 2021 00:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210617063956.94061-1-dja@axtens.net>
 <20210617063956.94061-3-dja@axtens.net>
In-Reply-To: <20210617063956.94061-3-dja@axtens.net>
From: Marco Elver <elver@google.com>
Date: Thu, 17 Jun 2021 09:06:02 +0200
Message-ID: <CANpmjNPvCprs4+aToP4GXC1upii2sVYbHPRcDoVr=qL3psMUSw@mail.gmail.com>
Subject: Re: [PATCH v14 2/4] kasan: allow architectures to provide an outline
 readiness check
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
 aneesh.kumar@linux.ibm.com, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Andrey Konovalov <andreyknvl@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 17 Jun 2021 at 08:40, Daniel Axtens <dja@axtens.net> wrote:
>
> Allow architectures to define a kasan_arch_is_ready() hook that bails
> out of any function that's about to touch the shadow unless the arch
> says that it is ready for the memory to be accessed. This is fairly
> uninvasive and should have a negligible performance penalty.
>
> This will only work in outline mode, so an arch must specify
> ARCH_DISABLE_KASAN_INLINE if it requires this.
>
> Cc: Balbir Singh <bsingharora@gmail.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Daniel Axtens <dja@axtens.net>

With Christophe's suggestion:

Reviewed-by: Marco Elver <elver@google.com>


> --
>
> Both previous RFCs for ppc64 - by 2 different people - have
> needed this trick! See:
>  - https://lore.kernel.org/patchwork/patch/592820/ # ppc64 hash series
>  - https://patchwork.ozlabs.org/patch/795211/      # ppc radix series
>
> I haven't been able to exercise the arch hook error for !GENERIC as I
> don't have a particularly modern aarch64 toolchain or a lot of experience
> cross-compiling with clang. But it does fire for GENERIC + INLINE on x86.
> ---
>  mm/kasan/common.c  | 4 ++++
>  mm/kasan/generic.c | 3 +++
>  mm/kasan/kasan.h   | 8 ++++++++
>  mm/kasan/shadow.c  | 8 ++++++++
>  4 files changed, 23 insertions(+)
>
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 10177cc26d06..0ad615f3801d 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -331,6 +331,10 @@ static inline bool ____kasan_slab_free(struct kmem_cache *cache, void *object,
>         u8 tag;
>         void *tagged_object;
>
> +       /* Bail if the arch isn't ready */
> +       if (!kasan_arch_is_ready())
> +               return false;
> +
>         tag = get_tag(object);
>         tagged_object = object;
>         object = kasan_reset_tag(object);
> diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
> index 53cbf28859b5..c3f5ba7a294a 100644
> --- a/mm/kasan/generic.c
> +++ b/mm/kasan/generic.c
> @@ -163,6 +163,9 @@ static __always_inline bool check_region_inline(unsigned long addr,
>                                                 size_t size, bool write,
>                                                 unsigned long ret_ip)
>  {
> +       if (!kasan_arch_is_ready())
> +               return true;
> +
>         if (unlikely(size == 0))
>                 return true;
>
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index 8f450bc28045..b18abaf8c78e 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -449,6 +449,14 @@ static inline void kasan_poison_last_granule(const void *address, size_t size) {
>
>  #endif /* CONFIG_KASAN_GENERIC */
>
> +#ifndef kasan_arch_is_ready
> +static inline bool kasan_arch_is_ready(void)   { return true; }
> +#else
> +#if !defined(CONFIG_KASAN_GENERIC) || !defined(CONFIG_KASAN_OUTLINE)
> +#error kasan_arch_is_ready only works in KASAN generic outline mode!
> +#endif
> +#endif
> +
>  /*
>   * Exported functions for interfaces called from assembly or from generated
>   * code. Declarations here to avoid warning about missing declarations.
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index 082ee5b6d9a1..3c7f7efe6f68 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -73,6 +73,10 @@ void kasan_poison(const void *addr, size_t size, u8 value, bool init)
>  {
>         void *shadow_start, *shadow_end;
>
> +       /* Don't touch the shadow memory if arch isn't ready */
> +       if (!kasan_arch_is_ready())
> +               return;
> +
>         /*
>          * Perform shadow offset calculation based on untagged address, as
>          * some of the callers (e.g. kasan_poison_object_data) pass tagged
> @@ -99,6 +103,10 @@ EXPORT_SYMBOL(kasan_poison);
>  #ifdef CONFIG_KASAN_GENERIC
>  void kasan_poison_last_granule(const void *addr, size_t size)
>  {
> +       /* Don't touch the shadow memory if arch isn't ready */
> +       if (!kasan_arch_is_ready())
> +               return;
> +
>         if (size & KASAN_GRANULE_MASK) {
>                 u8 *shadow = (u8 *)kasan_mem_to_shadow(addr + size);
>                 *shadow = size & KASAN_GRANULE_MASK;
> --
> 2.30.2
>
