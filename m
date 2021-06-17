Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FADC3AAD16
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 09:09:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5Cpq4tSgz3c10
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:09:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=PzliMFti;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32d;
 helo=mail-ot1-x32d.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=PzliMFti; dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5CpK4Gtpz2yX6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 17:08:57 +1000 (AEST)
Received: by mail-ot1-x32d.google.com with SMTP id
 102-20020a9d0eef0000b02903fccc5b733fso5165934otj.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 00:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MsqYILgAKurijhL/t9Pxm6TteQj8nlU+VZKZOuCyAgE=;
 b=PzliMFtiv8K08Pxfo0PmDseeXd+8Rv6kuf1m0/BRKy1IbtPJ0C7ZtmipsFCYFJm7v+
 8BpAmnYv6hYFBhc6MJnJWQkv8VkdplslO22TaJmGL4hlifgJfhYqaoPXxeLj59t+GYa8
 DwQqabZdrdcpOIwg5a9dbdwhgAYIyjKHpxvD6SXaQJF0NU75Y2M7Oa13V4kib8E10aGq
 0u+WIvfiyPKwo/74aXBxOQlyEZAkThSGXtOU1keZaHfx+XKYgT9sI5K/bxb/RW8DOdwr
 hZG7J0+b42ffm6Jhyz6jwOhDwQ3MUGQhpYX2U6Ujam6eCivPYscRqjK9RaCeirZ3uIfW
 ZhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MsqYILgAKurijhL/t9Pxm6TteQj8nlU+VZKZOuCyAgE=;
 b=dENo3Jy1FHDfWdyUnOjlXHK3NOwlEL5VvZ5gckTHmdscFKJpqt/XWfCKZbU8SQ5cYP
 zhLoSKi1hvkd5bGqBAX1G7b99ZkuOWyN1u4HwIgzUATOIT8RTvrGUf+7HEHMPezJxhz2
 3PsnLIpjKymZCIy67LEtsMuBJqAStwjatiOIYoZuGZOCJgQWdAVh/ZytEEeV2xnvylSf
 hWTDaG1/lZYzzS4db+4gx2k9xMdr3OjFIH0lKyRQ37iGZMMy3TDzhGuEfDZWUGFKYYcM
 62i11DmGm2OA+TaBt7f/z5W82cKaS9nM8JVnbAhVhLWnc8my9/ptKtAuLceeY8qdAeS+
 EN3A==
X-Gm-Message-State: AOAM530D9lRgfmPbzlWM2QP/N+yXy2QqsemRdxCQrBG8F00KSxWffIog
 +BzO/6RVqDwUdlX9HYBJRv8lUCr3J8naX9H8YTIxog==
X-Google-Smtp-Source: ABdhPJzqEqAk206nhpNPL67OT0Xxgz7/1QCd+nNRElt8NPsvhQsdviKEPqluZO+azBZyRHYyFAXHZ4YUUD6AwJ6AEp0=
X-Received: by 2002:a05:6830:93:: with SMTP id
 a19mr3236836oto.17.1623913733228; 
 Thu, 17 Jun 2021 00:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210617063956.94061-1-dja@axtens.net>
 <20210617063956.94061-4-dja@axtens.net>
In-Reply-To: <20210617063956.94061-4-dja@axtens.net>
From: Marco Elver <elver@google.com>
Date: Thu, 17 Jun 2021 09:08:41 +0200
Message-ID: <CANpmjNPo1Cn5PNQB0kRWU_481WKUO1WkY-kDYhBTQkT0VXsF0A@mail.gmail.com>
Subject: Re: [PATCH v14 3/4] mm: define default MAX_PTRS_PER_* in
 include/pgtable.h
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
> Commit c65e774fb3f6 ("x86/mm: Make PGDIR_SHIFT and PTRS_PER_P4D variable")
> made PTRS_PER_P4D variable on x86 and introduced MAX_PTRS_PER_P4D as a
> constant for cases which need a compile-time constant (e.g. fixed-size
> arrays).
>
> powerpc likewise has boot-time selectable MMU features which can cause
> other mm "constants" to vary. For KASAN, we have some static
> PTE/PMD/PUD/P4D arrays so we need compile-time maximums for all these
> constants. Extend the MAX_PTRS_PER_ idiom, and place default definitions
> in include/pgtable.h. These define MAX_PTRS_PER_x to be PTRS_PER_x unless
> an architecture has defined MAX_PTRS_PER_x in its arch headers.
>
> Clean up pgtable-nop4d.h and s390's MAX_PTRS_PER_P4D definitions while
> we're at it: both can just pick up the default now.
>
> Signed-off-by: Daniel Axtens <dja@axtens.net>

Reviewed-by: Marco Elver <elver@google.com>


> ---
>
> s390 was compile tested only.
> ---
>  arch/s390/include/asm/pgtable.h     |  2 --
>  include/asm-generic/pgtable-nop4d.h |  1 -
>  include/linux/pgtable.h             | 22 ++++++++++++++++++++++
>  3 files changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
> index 7c66ae5d7e32..cf05954ce013 100644
> --- a/arch/s390/include/asm/pgtable.h
> +++ b/arch/s390/include/asm/pgtable.h
> @@ -342,8 +342,6 @@ static inline int is_module_addr(void *addr)
>  #define PTRS_PER_P4D   _CRST_ENTRIES
>  #define PTRS_PER_PGD   _CRST_ENTRIES
>
> -#define MAX_PTRS_PER_P4D       PTRS_PER_P4D
> -
>  /*
>   * Segment table and region3 table entry encoding
>   * (R = read-only, I = invalid, y = young bit):
> diff --git a/include/asm-generic/pgtable-nop4d.h b/include/asm-generic/pgtable-nop4d.h
> index ce2cbb3c380f..2f6b1befb129 100644
> --- a/include/asm-generic/pgtable-nop4d.h
> +++ b/include/asm-generic/pgtable-nop4d.h
> @@ -9,7 +9,6 @@
>  typedef struct { pgd_t pgd; } p4d_t;
>
>  #define P4D_SHIFT              PGDIR_SHIFT
> -#define MAX_PTRS_PER_P4D       1
>  #define PTRS_PER_P4D           1
>  #define P4D_SIZE               (1UL << P4D_SHIFT)
>  #define P4D_MASK               (~(P4D_SIZE-1))
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 9e6f71265f72..69700e3e615f 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1625,4 +1625,26 @@ typedef unsigned int pgtbl_mod_mask;
>  #define pte_leaf_size(x) PAGE_SIZE
>  #endif
>
> +/*
> + * Some architectures have MMUs that are configurable or selectable at boot
> + * time. These lead to variable PTRS_PER_x. For statically allocated arrays it
> + * helps to have a static maximum value.
> + */
> +
> +#ifndef MAX_PTRS_PER_PTE
> +#define MAX_PTRS_PER_PTE PTRS_PER_PTE
> +#endif
> +
> +#ifndef MAX_PTRS_PER_PMD
> +#define MAX_PTRS_PER_PMD PTRS_PER_PMD
> +#endif
> +
> +#ifndef MAX_PTRS_PER_PUD
> +#define MAX_PTRS_PER_PUD PTRS_PER_PUD
> +#endif
> +
> +#ifndef MAX_PTRS_PER_P4D
> +#define MAX_PTRS_PER_P4D PTRS_PER_P4D
> +#endif
> +
>  #endif /* _LINUX_PGTABLE_H */
> --
> 2.30.2
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20210617063956.94061-4-dja%40axtens.net.
