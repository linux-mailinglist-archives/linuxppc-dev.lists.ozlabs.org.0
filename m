Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 868713ADE2F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 13:47:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G79r121NPz3cCC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 21:47:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=WXYG6Cdf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52e;
 helo=mail-ed1-x52e.google.com; envelope-from=andreyknvl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WXYG6Cdf; dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G799h5SLvz2ypn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jun 2021 21:17:28 +1000 (AEST)
Received: by mail-ed1-x52e.google.com with SMTP id h2so1415106edt.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jun 2021 04:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ox6b74Fvc6eYbkVfNLZ3KvjE6zQLqybhjoI+fLMMAAM=;
 b=WXYG6Cdf6By2iyUeWDdpOD47jL5uFwBbosTEKrmlnmXvDpzsAuoyBww2pRA2Nf2Ygd
 DD4A5L3vWj87qldAax3ct/cAmp7164hOVOcjWuNyybt/M5PYq+bH7Uw8xsxzqm4JclDK
 LIto+UwOj0HHXP1hgJKyxLfliaNccUpEscCUVWs3myw6twqAl1PUNRlS4mwtL8VPvH2i
 /jG/shwVDIPB0cqHPRLgk+7J9ddYULS67W9JTNIBBiYBCKekjzWaq4G6xn3gTi7x3oZi
 4TI3M6kZhzIxXd31Git2Xl8h73DWG2h8bolP5AxjIovmioxJN4HIDmt/HBr1mTifgnT4
 w+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ox6b74Fvc6eYbkVfNLZ3KvjE6zQLqybhjoI+fLMMAAM=;
 b=rN/T9H1y/Yv1mtzaxEIi5308jjudwtXmcK9Eil3/rb9eVZGsKvpVRl/ArF0Zf+y1JH
 zvMRTDozmMixM+4h4EyVsFaMu7b1X9n2olTKl/f8uAR62b94f7KhpPAri1Xq+EGbl9FN
 ApXU4bJST/D3hAav2dcDvhN+Fvl8Iv7EcSTB/HcJcKF+ny4kfmaqYglBfBM/nnk5fX7I
 fmKOBxBZsPLmTIetN6XmWCKrrpzgj3KzMIwxZPZVpgg3UNNLA6GTKlJkDUMDKedu/EgB
 /bSb0f4zE0qKNjtUlNzZO1o/Vs/384j9sInv1lPxT5slegtnfcX4FhwRrPtdzSJaB+o1
 c3hw==
X-Gm-Message-State: AOAM531g1JlwGTuud/yRYVhuoafa4XpVlpC48XUSgXhUYq2g0KFvECzH
 5wHJccEFVx59LLNevAlw1G9EYbA6M4CxZUO0nnc=
X-Google-Smtp-Source: ABdhPJww9MCpsYchtIGF8m60gxIne2Q2KYFvGjYAO6vwCGhLCbJsxWFd2YH44uCprI1gDhfoSaxdRwpOLzbrVk0RxPA=
X-Received: by 2002:a50:fd83:: with SMTP id o3mr12106286edt.95.1624187843896; 
 Sun, 20 Jun 2021 04:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210617093032.103097-1-dja@axtens.net>
 <20210617093032.103097-4-dja@axtens.net>
In-Reply-To: <20210617093032.103097-4-dja@axtens.net>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sun, 20 Jun 2021 14:17:04 +0300
Message-ID: <CA+fCnZeJerhmLg_5F_FdVptJC+QqoVa5+pAhqU+nSH1itmhAcQ@mail.gmail.com>
Subject: Re: [PATCH v15 3/4] mm: define default MAX_PTRS_PER_* in
 include/pgtable.h
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
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Marco Elver <elver@google.com>
> Signed-off-by: Daniel Axtens <dja@axtens.net>
>
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

Acked-by: Andrey Konovalov <andreyknvl@gmail.com>
