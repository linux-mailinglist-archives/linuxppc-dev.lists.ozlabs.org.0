Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D703A9573
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 10:56:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4fFM1dy9z3bry
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 18:56:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=NWG0M7wK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32f;
 helo=mail-ot1-x32f.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=NWG0M7wK; dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4fDt0Csxz2yY9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 18:56:28 +1000 (AEST)
Received: by mail-ot1-x32f.google.com with SMTP id
 w22-20020a0568304116b02904060c6415c7so1811164ott.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 01:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PJLq/uYB/Lpm2G2R7d6L11/gd8MJ7X0dg2M/HcvVqks=;
 b=NWG0M7wK1B+f5XItaIWlh+tYoYNQuV5jfpb9Ms8V4ncGz2BkEq2JBNVQ8kLjlr5Oyv
 QFOmHlp9qLyw1zVVyqKwhLRGEDxH8qrO69Yk+0UeC0unPpocjWwkmPrPeam4haiRhm6f
 0qlqrklsg0l/nH8iao/i4Y7SK9K/y3FO6yn/tvYfOsDfi14Ug+RRgO/UFVGZwbMNsQzg
 /pwBMO3TQ3qHmOAqQu/QmZV/t944xyOFB2lekcGL5fhUiIZsrhOqwVoprpwvTIf3clpO
 hgO9tY5G/Y5brlxH4fAcVtgtsNaPJYz+Bhw6AseVyu26kykHPfOBftVo8QW5wEUv3bSY
 d+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PJLq/uYB/Lpm2G2R7d6L11/gd8MJ7X0dg2M/HcvVqks=;
 b=EcvY6Uer+GxSfqGUalxfa8y5YmJeawnZ0w+X32j8fhHdilz1V+eqQ3rCee+5Gbdjv6
 SFSrwt1THeYaPhsqajhSLAq7zcY5zqt6YXnczndD+L0o62gcnZ4n5sAhd6pR2c3zeMpZ
 +v4CFK0WTJ2VG49Kp2IgtLn7ciN4vbkyUchey2seIgCQhY3frpN2JPTyq/LzEH+3/TGp
 Z5eguaP+dhB+P4/hYbMXJX40pXEZ+/qix9Qj+aq4uWUZWS9zdewdinPRNmjXKX+kPqt7
 fgw0xjVRma9TTXAcbjT8nYqx3HwDebqZ8DbVPuNgQK97IsNlPfo2ciIGDjB4bUHl0zvs
 znKg==
X-Gm-Message-State: AOAM531b+i/CpmBrAF+tpeyHLZvAIWj8oeCLhhDDf3Y2zCMg01gwX4Vg
 BjpeENTuychqRb11Wt9Z9DvlkPwa2l7anBzQIzgKEQ==
X-Google-Smtp-Source: ABdhPJxN9SBqZNQQS2v2qUitNIUv6Mg0ImuOSr/ulbWLNw7NzsCtqZqbIN/jrGqOtYAAlifzBqfI7DBNWhje+6Eek0o=
X-Received: by 2002:a05:6830:1bcb:: with SMTP id
 v11mr3196923ota.251.1623833784490; 
 Wed, 16 Jun 2021 01:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210616080244.51236-1-dja@axtens.net>
 <20210616080244.51236-3-dja@axtens.net>
In-Reply-To: <20210616080244.51236-3-dja@axtens.net>
From: Marco Elver <elver@google.com>
Date: Wed, 16 Jun 2021 10:56:11 +0200
Message-ID: <CANpmjNP8U_Mg05F0qOKsC3g58e9+hsuYkTQg0ZqsY==B5uLNqw@mail.gmail.com>
Subject: Re: [PATCH v13 2/3] kasan: allow architectures to provide an outline
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

On Wed, 16 Jun 2021 at 10:02, Daniel Axtens <dja@axtens.net> wrote:
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

Reviewed-by: Marco Elver <elver@google.com>

but also check if an assertion that this is only used with
KASAN_GENERIC might make sense (below). Depends on how much we want to
make sure kasan_arch_is_ready() could be useful for other modes (which
I don't think it makes sense).

> --
>
> I discuss the justfication for this later in the series. Also,
> both previous RFCs for ppc64 - by 2 different people - have
> needed this trick! See:
>  - https://lore.kernel.org/patchwork/patch/592820/ # ppc64 hash series
>  - https://patchwork.ozlabs.org/patch/795211/      # ppc radix series
> ---
>  mm/kasan/common.c  | 4 ++++
>  mm/kasan/generic.c | 3 +++
>  mm/kasan/kasan.h   | 4 ++++
>  mm/kasan/shadow.c  | 8 ++++++++
>  4 files changed, 19 insertions(+)
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
> index 8f450bc28045..19323a3d5975 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -449,6 +449,10 @@ static inline void kasan_poison_last_granule(const void *address, size_t size) {
>
>  #endif /* CONFIG_KASAN_GENERIC */
>
> +#ifndef kasan_arch_is_ready
> +static inline bool kasan_arch_is_ready(void)   { return true; }
> +#endif
> +

I've been trying to think of a way to make it clear this is only for
KASAN_GENERIC mode, and not the others. An arch can always define this
function, but of course it might not be used. One way would be to add
an '#ifndef CONFIG_KASAN_GENERIC' in the #else case and #error if it's
not generic mode.

I think trying to make this do anything useful for SW_TAGS or HW_TAGS
modes does not make sense (at least right now).

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
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20210616080244.51236-3-dja%40axtens.net.
