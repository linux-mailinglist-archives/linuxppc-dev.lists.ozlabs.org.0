Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6F0343B85
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 09:18:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3nSp4dRqz30DH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 19:18:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=UsoPckqy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::335;
 helo=mail-ot1-x335.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=UsoPckqy; dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3nSM52NSz2yjB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 19:18:09 +1100 (AEDT)
Received: by mail-ot1-x335.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso15085831ott.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 01:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sk5nXZmNrPBhnu290SRFE/AaX0zXvxqhg24fy7HJRik=;
 b=UsoPckqy/cBUBbKkWG7iVBL06TORbtJfQyHbYe8pqPWyQh5dez8eGB3IQJEvHOmg7G
 ZMmlbJljicTOw9XSZNbt1qAZc3Ur+4ZDG11DBj0gtsRxDM8bgvJwy5qesu2zrTnJUvmd
 u4Aw3PiSfzfqkzwffdfqKKIlriCizZHLJPPi7BK9KTYZVUJYflke8Z/fFMVHGrr7+D5v
 Nw1yV+N4pVB6UyYAhV98yvt8euaZ74R03+HjtyWE+4z384GtTMTA3pKxGrnG7uyCQRxc
 wtI07Y5BoxRPev2GwNJSwhzmFzExRkw2QIfJeCouKPL35isVkA2epjzCeJdFlBvEJJME
 jyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sk5nXZmNrPBhnu290SRFE/AaX0zXvxqhg24fy7HJRik=;
 b=E+qeGsdatKmu1HeJ4qEhnjzunhTJqxYzmblIGO4kF7ukGI0FOvmO6Vx9V4DpH7i0Jy
 Gi5JO7aDCiv/j5Xj2Agd0NOTHOdfZS8LYY7IarIKR7jsttE2YO2HgXK0Xp3c7Hjt4krz
 6mTiwISx6Z7I9cDjodNLVmANzLkwcQzdj0Cu3Jwwly4tnfFzxpeB7tMjloZXhovWwqoL
 GtBP1bGwFYKegHtyLyGeeQMeyz7JnGtPorXq/93cDMmg4jBlNgeXolCoAv6/4K+a7W2t
 UnovjNJMmHoqcg6tum6825XzX2e31wQrWV1vdZrqpOAS4EHN2WnXeN/PB0N4UCJBoF1D
 pVrw==
X-Gm-Message-State: AOAM531pvkRAaVoFgzJtRdBhbMm7xSLXK3yo2Q1kD+vw0LYmCQn/yVdL
 qGMCkVBGvNKL7dHRX9kKRTfb9qDQG6FEwPcwN9dXQA==
X-Google-Smtp-Source: ABdhPJzvbElyZZDDIxpenI8cVDVzjmJITxV9NKesMpuZ8BW6GJm0JmhCXcsj5hWyJduf0shx2QAG0j6jEips7rMEgHY=
X-Received: by 2002:a05:6830:1c6e:: with SMTP id
 s14mr10905818otg.17.1616401087131; 
 Mon, 22 Mar 2021 01:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210319144058.772525-1-dja@axtens.net>
 <20210319144058.772525-3-dja@axtens.net>
In-Reply-To: <20210319144058.772525-3-dja@axtens.net>
From: Marco Elver <elver@google.com>
Date: Mon, 22 Mar 2021 09:17:55 +0100
Message-ID: <CANpmjNOGp0DLn8sMwvm5SQo4cqJDogtrEPGFhawRPd3Amr3D=w@mail.gmail.com>
Subject: Re: [PATCH v11 2/6] kasan: allow architectures to provide an outline
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
Cc: aneesh.kumar@linux.ibm.com, LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 kasan-dev <kasan-dev@googlegroups.com>, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 Mar 2021 at 15:41, Daniel Axtens <dja@axtens.net> wrote:
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
>
> --
>
> I discuss the justfication for this later in the series. Also,
> both previous RFCs for ppc64 - by 2 different people - have
> needed this trick! See:
>  - https://lore.kernel.org/patchwork/patch/592820/ # ppc64 hash series
>  - https://patchwork.ozlabs.org/patch/795211/      # ppc radix series
> ---
>  include/linux/kasan.h | 4 ++++
>  mm/kasan/common.c     | 4 ++++
>  mm/kasan/generic.c    | 3 +++
>  mm/kasan/shadow.c     | 4 ++++
>  4 files changed, 15 insertions(+)
>
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 8b3b99d659b7..6bd8343f0033 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h

Does kasan_arch_is_ready() need to be defined in the public interface
of KASAN? Could it instead be moved to mm/kasan/kasan.h?

> @@ -23,6 +23,10 @@ struct kunit_kasan_expectation {
>
>  #endif
>
> +#ifndef kasan_arch_is_ready
> +static inline bool kasan_arch_is_ready(void)   { return true; }
> +#endif
> +
>  #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
>
>  #include <linux/pgtable.h>
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 6bb87f2acd4e..f23a9e2dce9f 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -345,6 +345,10 @@ static inline bool ____kasan_slab_free(struct kmem_cache *cache, void *object,
>         if (unlikely(cache->flags & SLAB_TYPESAFE_BY_RCU))
>                 return false;
>
> +       /* We can't read the shadow byte if the arch isn't ready */
> +       if (!kasan_arch_is_ready())
> +               return false;
> +

While it probably doesn't matter much, it seems this check could be
moved up, rather than having it in the middle here.


>         if (!kasan_byte_accessible(tagged_object)) {
>                 kasan_report_invalid_free(tagged_object, ip);
>                 return true;
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
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index 727ad4629173..1f650c521037 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -80,6 +80,10 @@ void kasan_poison(const void *addr, size_t size, u8 value, bool init)
>          */
>         addr = kasan_reset_tag(addr);
>
> +       /* Don't touch the shadow memory if arch isn't ready */
> +       if (!kasan_arch_is_ready())
> +               return;
> +
>         /* Skip KFENCE memory if called explicitly outside of sl*b. */
>         if (is_kfence_address(addr))
>                 return;
> --
> 2.27.0
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20210319144058.772525-3-dja%40axtens.net.
