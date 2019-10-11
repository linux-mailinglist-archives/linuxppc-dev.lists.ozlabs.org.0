Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C38D38A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 07:17:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qGRv68SRzDqXt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 16:17:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="AOu22roD"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qGQ11R8dzDqXQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 16:16:08 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id q7so5339656pfh.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 22:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=JNE3qIp3GwZhiIaVERKeTReBCbfaT6qnnngWA97+jmk=;
 b=AOu22roDAjo2Iw+3ow0fVFNymLA4XBqbwMDgFJZyPjBxC4xlTXYjrRBrz2nneQ5BxF
 sbxK7nQd39Xz28F4U95JzmCvqagYnkud8AjfEHFfy1gzZ0Xf5ELRIiKXZHiGMtS6LAgp
 5GYBEWP2o+WH4nxjrWEq08XdmsoVQ9uFUxcWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=JNE3qIp3GwZhiIaVERKeTReBCbfaT6qnnngWA97+jmk=;
 b=PtTssBaCIopgYs7ij2MPIl7WGvSBU5nkBx/fSj/4zWgke/PzrMCBxEshdefyMSESdQ
 jiOWhFNWtCn8g+mXCRfgWnLBiIcwiLtTmY0FN7q8BlOYMIrDbx3BIKAL44aNqSjH8c6P
 zJ22CA2i0jAZZsTuIopGLaUDKLAZJjiaM3MN/0RjEGTcnqkzFJpgj7fFJAzVP6wAV3lu
 yPr5vUP2wbmTwnxJMjmGfKvKMMAbLhOHdL2D37EBfkuujFfZ13ia3OTYt16ANP1U4jnk
 y7dkzM8/+Ss6LLR6sqoYqRbWUfXBKuoAWZ7HZSjSGevuQ89HgMevd/7RlMFfoCiL4kA0
 I47g==
X-Gm-Message-State: APjAAAVuco3k089/U3wH9T2538FnNE0gUvyGTIEOnzjWZQAmc/o8jRfL
 5xeg0ivw8QhL+h/pautDvyD11Q==
X-Google-Smtp-Source: APXvYqyssA7gSzANSBd3uHeJuSuJcZZ6Tgu3LYuU0Dw0BEbm5M5u9xetMF08ol8pUsyxy0slgFZujw==
X-Received: by 2002:aa7:8dd9:: with SMTP id j25mr12341886pfr.94.1570770964627; 
 Thu, 10 Oct 2019 22:16:04 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id x125sm7795793pfb.93.2019.10.10.22.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 22:16:03 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Uladzislau Rezki <urezki@gmail.com>
Subject: Re: [PATCH v8 1/5] kasan: support backing vmalloc space with real
 shadow memory
In-Reply-To: <20191007080209.GA22997@pc636>
References: <20191001065834.8880-1-dja@axtens.net>
 <20191001065834.8880-2-dja@axtens.net> <20191007080209.GA22997@pc636>
Date: Fri, 11 Oct 2019 16:15:59 +1100
Message-ID: <87sgnzuak0.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: mark.rutland@arm.com, gor@linux.ibm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 glider@google.com, luto@kernel.org, aryabinin@virtuozzo.com,
 linuxppc-dev@lists.ozlabs.org, dvyukov@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Uladzislau,


> Looking at it one more, i think above part of code is a bit wrong
> and should be separated from merge_or_add_vmap_area() logic. The
> reason is to keep it simple and do only what it is supposed to do:
> merging or adding.
>
> Also the kasan_release_vmalloc() gets called twice there and looks like
> a duplication. Apart of that, merge_or_add_vmap_area() can be called via
> recovery path when vmap/vmaps is/are not even setup. See percpu
> allocator.
>
> I guess your part could be moved directly to the __purge_vmap_area_lazy()
> where all vmaps are lazily freed. To do so, we also need to modify
> merge_or_add_vmap_area() to return merged area:

Thanks for the review. I've integrated your snippet - it seems to work
fine, and I agree that it is much simpler and clearer. so I've rolled it
in to v9 which I will post soon.

Regards,
Daniel

>
> <snip>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index e92ff5f7dd8b..fecde4312d68 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -683,7 +683,7 @@ insert_vmap_area_augment(struct vmap_area *va,
>   * free area is inserted. If VA has been merged, it is
>   * freed.
>   */
> -static __always_inline void
> +static __always_inline struct vmap_area *
>  merge_or_add_vmap_area(struct vmap_area *va,
>         struct rb_root *root, struct list_head *head)
>  {
> @@ -750,7 +750,10 @@ merge_or_add_vmap_area(struct vmap_area *va,
>  
>                         /* Free vmap_area object. */
>                         kmem_cache_free(vmap_area_cachep, va);
> -                       return;
> +
> +                       /* Point to the new merged area. */
> +                       va = sibling;
> +                       merged = true;
>                 }
>         }
>  
> @@ -759,6 +762,8 @@ merge_or_add_vmap_area(struct vmap_area *va,
>                 link_va(va, root, parent, link, head);
>                 augment_tree_propagate_from(va);
>         }
> +
> +       return va;
>  }
>  
>  static __always_inline bool
> @@ -1172,7 +1177,7 @@ static void __free_vmap_area(struct vmap_area *va)
>         /*
>          * Merge VA with its neighbors, otherwise just add it.
>          */
> -       merge_or_add_vmap_area(va,
> +       (void) merge_or_add_vmap_area(va,
>                 &free_vmap_area_root, &free_vmap_area_list);
>  }
>  
> @@ -1279,15 +1284,20 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end)
>         spin_lock(&vmap_area_lock);
>         llist_for_each_entry_safe(va, n_va, valist, purge_list) {
>                 unsigned long nr = (va->va_end - va->va_start) >> PAGE_SHIFT;
> +               unsigned long orig_start = va->va_start;
> +               unsigned long orig_end = va->va_end;
>  
>                 /*
>                  * Finally insert or merge lazily-freed area. It is
>                  * detached and there is no need to "unlink" it from
>                  * anything.
>                  */
> -               merge_or_add_vmap_area(va,
> +               va = merge_or_add_vmap_area(va,
>                         &free_vmap_area_root, &free_vmap_area_list);
>  
> +               kasan_release_vmalloc(orig_start,
> +                       orig_end, va->va_start, va->va_end);
> +
>                 atomic_long_sub(nr, &vmap_lazy_nr);
>  
>                 if (atomic_long_read(&vmap_lazy_nr) < resched_threshold)
> <snip>
>
> --
> Vlad Rezki
