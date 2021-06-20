Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 540BD3ADE2E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 13:46:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G79qZ08yXz3c6R
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 21:46:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=D6mAsQ+a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c;
 helo=mail-ed1-x52c.google.com; envelope-from=andreyknvl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=D6mAsQ+a; dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G798m42ccz2ymQ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jun 2021 21:16:40 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id c7so13980566edn.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jun 2021 04:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N/chto6jVnmlN7DfH7wDHpFEeSqaG7VTzK76gQyfhdE=;
 b=D6mAsQ+aCAXO3wRcDlfa3JmPrKUwhheHJIVfPvMzhvnOnAYK/uP0OBKIc9QIiQCrJ6
 AFb57u1TufCkRDQAVTj4KAhAJUg8+iVUxYEayPLDkiFc0vUITKcD64lJu7rfxY7fAaU1
 QyLkoIcV5Cydq+N/8tMpN0/g9wjK7zMIaXSYaRR3u5lkJ/jS4PIs+mZoqzs8hNHIKOpm
 hW9eh5cmX09P6x0txhMBBboVUb9OcszdeKdDIfUabtGfbjT6mAIfzjQtXt6uvKC6cOzN
 w7r9k3jSPtvkWs8cJPCh62P+hR6T55Zh4GOfD7Pd2PJ71WxOA0/OURYbwlVoXvrDvBaF
 9I/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N/chto6jVnmlN7DfH7wDHpFEeSqaG7VTzK76gQyfhdE=;
 b=O/4skk8BnctuS7q0eETDamFIlTM+1tFhi7me59C+t+XibZV2xyTR7ulSuay5ovs0BW
 2+yPYUx288WnlimU2fvoLDwRJprRBYhkliJ8w5m1yRUCsvEz+4eBovU9q3u/FcmSRFy4
 MnvIASlbuHpbVfCRzaHM38pAcPw9zHFwCcPB6qD3vIEjAtCDF2rS5zoZCg37nubK9pev
 c0FMTTkFqB08aAyixs+jgn2xql0Qz9BC68CNi+v264iHYCdC42lqS2cgZzHCXnMjKktS
 t+qamDnhFyzu3ph7hdYeaWiwThBVIMzLFPLuhk66fk9tSdIBFOoW0LZqUDgtoibXbaK+
 XP1w==
X-Gm-Message-State: AOAM530X+xZP15w61M2Q/Z79UitsQ3FjGCNeG5nxSsI5VWeokxrqfzDC
 rsrsUx3QuBA0L5K6fI1wSbW8Yy7sg++7POo/G0A=
X-Google-Smtp-Source: ABdhPJxYK3lUOrWNlEP54WBPv+Re8m3kZDwbqiAXmFxidAhd1z49biOTmktDCYU4Ol8bTnqZWRygtohw0sg9Yj17ftc=
X-Received: by 2002:aa7:cd05:: with SMTP id b5mr2787046edw.190.1624187796446; 
 Sun, 20 Jun 2021 04:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210617093032.103097-1-dja@axtens.net>
 <20210617093032.103097-3-dja@axtens.net>
In-Reply-To: <20210617093032.103097-3-dja@axtens.net>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sun, 20 Jun 2021 14:16:16 +0300
Message-ID: <CA+fCnZdJ=HHn1Y=UDiYJ2NagNF9d-bJfjQa0jmiDaLiqneB_rA@mail.gmail.com>
Subject: Re: [PATCH v15 2/4] kasan: allow architectures to provide an outline
 readiness check
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
>  mm/kasan/common.c  | 4 ++++
>  mm/kasan/generic.c | 3 +++
>  mm/kasan/kasan.h   | 6 ++++++
>  mm/kasan/shadow.c  | 8 ++++++++
>  4 files changed, 21 insertions(+)
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

This comment brings no value. The fact that we bail is clear from the
following line. The comment should explain why we bail.

> +       if (!kasan_arch_is_ready())
> +               return false;

Have you considered including these checks into the high-level
wrappers in include/linux/kasan.h? Would that work?


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
