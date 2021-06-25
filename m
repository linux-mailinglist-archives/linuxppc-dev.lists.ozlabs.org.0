Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D61B73B44C3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 15:46:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBJF75Q6mz3c6y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 23:46:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HP6Z00KL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::533;
 helo=mail-ed1-x533.google.com; envelope-from=andreyknvl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HP6Z00KL; dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBJDV1Pw4z3c00
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 23:45:45 +1000 (AEST)
Received: by mail-ed1-x533.google.com with SMTP id m14so13472776edp.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 06:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0CpnvSJnCFtaGuYOVBatHS50FEMI3wJ5bkwuLzl1+lo=;
 b=HP6Z00KL8KrDrJaJoViBRS6UP7jk++nCt3H1seK3dJww4zkJWoyTAFrWj2wtJnRn4o
 TKXnGN70eQnJTZqZI8LTK0+suqnKniR1CHSea5VixV/3vFFG1Jyrss/fJu/+XRxLvtoO
 nMLvw/tun18UgPIqqMGPAsIYuJ2VZFsThyBb507XXUZPxdQaicsTERY5kkNX26GyFobJ
 ZrVtRcWfOuVeGoiJ2x05H1Eg/A7qGzPWsKgTbp59i2cpkadFNX2MD/eqVdTHgvtSm6Zj
 3tEMOGBJ36pRhjWgzxK3gS32pKfTcP8U9FDGJ2D8zm0Rb0JEozI4k/gABYPMedExdyUu
 bikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0CpnvSJnCFtaGuYOVBatHS50FEMI3wJ5bkwuLzl1+lo=;
 b=kuM+nxVcAtkdopX7wQfD7a9T2g0/zDXsHrA6NsbY1iVr4E0idBluaoGdXw9SkZdmYK
 XPnTzTziCnpkgzv4ciorf7O/0WXmbmJ/cQgTuhOL+jFN+5+CugT5TjA3cMEceFFUNmMN
 l2sT67bQdvZTo35dwJSxIa+ZohxPkrKXLLXoMIhzT8mQiywARvka/+52PWlU7qhAKHxV
 VNowewSak2vYdvLShV1l6NNYvEmd3inxo/5r26SNfXFTZA5NEeH8VQmaxbaD+aXEqxX/
 7SPe0XZPMPN6z8eUCmOlQg+k27H8WKaTbYT1pKFk9PU+gSdVinKfx0RSGpQaFIdQ98wr
 brEQ==
X-Gm-Message-State: AOAM5314rIRVol1XE4f6S96POKSI1ye113TRT5/e4ukK2V6f6KNOtinX
 /uOcnRtKBEBosT4S1No+TWaW/ZK02HWRS7eWFVk=
X-Google-Smtp-Source: ABdhPJxuvnKDUvbpTpuYYKdL2Bajdp3tVKlgY04Ox58c3KNVp2Si6xh5xFh78NigskIzs8sROTm8v0BhfzMZVNw4srI=
X-Received: by 2002:a05:6402:1d11:: with SMTP id
 dg17mr15087371edb.30.1624628742089; 
 Fri, 25 Jun 2021 06:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210624034050.511391-1-dja@axtens.net>
 <20210624034050.511391-3-dja@axtens.net>
In-Reply-To: <20210624034050.511391-3-dja@axtens.net>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 25 Jun 2021 16:45:19 +0300
Message-ID: <CA+fCnZe14NZMbD8wPJQr=jj_0Mik8ZN1-Q3H6iM2tPp8qY1X4w@mail.gmail.com>
Subject: Re: [PATCH v16 2/4] kasan: allow architectures to provide an outline
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
Cc: Marco Elver <elver@google.com>, aneesh.kumar@linux.ibm.com,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 24, 2021 at 6:41 AM Daniel Axtens <dja@axtens.net> wrote:
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
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Marco Elver <elver@google.com>
> Signed-off-by: Daniel Axtens <dja@axtens.net>
>
> --
>
> Both previous RFCs for ppc64 - by 2 different people - have
> needed this trick! See:
>  - https://lore.kernel.org/patchwork/patch/592820/ # ppc64 hash series
>  - https://patchwork.ozlabs.org/patch/795211/      # ppc radix series
>
> Build tested on arm64 with SW_TAGS and x86 with INLINE: the error fires
> if I add a kasan_arch_is_ready define.
> ---
>  mm/kasan/common.c  | 3 +++
>  mm/kasan/generic.c | 3 +++
>  mm/kasan/kasan.h   | 6 ++++++
>  mm/kasan/shadow.c  | 6 ++++++
>  4 files changed, 18 insertions(+)
>
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 10177cc26d06..2baf121fb8c5 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -331,6 +331,9 @@ static inline bool ____kasan_slab_free(struct kmem_cache *cache, void *object,
>         u8 tag;
>         void *tagged_object;
>
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
> index 8f450bc28045..4dbc8def64f4 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -449,6 +449,12 @@ static inline void kasan_poison_last_granule(const void *address, size_t size) {
>
>  #endif /* CONFIG_KASAN_GENERIC */
>
> +#ifndef kasan_arch_is_ready
> +static inline bool kasan_arch_is_ready(void)   { return true; }
> +#elif !defined(CONFIG_KASAN_GENERIC) || !defined(CONFIG_KASAN_OUTLINE)
> +#error kasan_arch_is_ready only works in KASAN generic outline mode!
> +#endif
> +
>  /*
>   * Exported functions for interfaces called from assembly or from generated
>   * code. Declarations here to avoid warning about missing declarations.
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index 082ee5b6d9a1..8d95ee52d019 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -73,6 +73,9 @@ void kasan_poison(const void *addr, size_t size, u8 value, bool init)
>  {
>         void *shadow_start, *shadow_end;
>
> +       if (!kasan_arch_is_ready())
> +               return;
> +
>         /*
>          * Perform shadow offset calculation based on untagged address, as
>          * some of the callers (e.g. kasan_poison_object_data) pass tagged
> @@ -99,6 +102,9 @@ EXPORT_SYMBOL(kasan_poison);
>  #ifdef CONFIG_KASAN_GENERIC
>  void kasan_poison_last_granule(const void *addr, size_t size)
>  {
> +       if (!kasan_arch_is_ready())
> +               return;
> +
>         if (size & KASAN_GRANULE_MASK) {
>                 u8 *shadow = (u8 *)kasan_mem_to_shadow(addr + size);
>                 *shadow = size & KASAN_GRANULE_MASK;
> --
> 2.30.2
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
