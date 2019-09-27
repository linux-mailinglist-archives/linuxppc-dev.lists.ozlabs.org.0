Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9F5C0284
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 11:39:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fmwQ4cb1zDqwJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 19:39:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=markmarshall14@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gRCf0Qsu"; 
 dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fhvG6J5LzDqvL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 16:38:15 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id 7so5236569wme.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 23:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Owq66DDGFiymKtRCifTYoKISdbP/+uwfvEw1o14BnvA=;
 b=gRCf0QsuhrQoJtXTprczxr/dllFuh2YdgOjedXS2oZph/OT3yc247VSnDSBEBJ+JY5
 6W+XTdq4rYo2i/DBm4XA1CZd24p36zZi9kd65vWBr0/qBQ+r/dBM85o3gbtbzIh40c4q
 iQehrWH3DWbdZMurjEL7nqYVCm6n8QGRs7I5RuJS03XivI2ta7O+M9MpcaNwg4MQ/SK3
 O3YoxskcP+tXZHqbWBWcfzuRsKvDmw9hHoXj6K8lSyONPd4xpUnaO7dr2/mmnvinYL1S
 bTvl9Z7QJ6AjrizR/Px0aqJeGJRP2J+UxubWjYQpl6EUItsIKZWxY4JdG7w4QJVd3KX6
 3hNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Owq66DDGFiymKtRCifTYoKISdbP/+uwfvEw1o14BnvA=;
 b=k9VUfsHY3pMh07WuHj2yYajErnk78CwM643LcJJX1QPM9A6LygmP4kozELJn40es59
 wwq/HT52fL+AdXI/CSfY0K8/mVWLU5BsqBRnymKs5glznImeMXZJNvTKqaCclEHFISRy
 kcnyd+kSN8tyvg0c6/kCng/MCB3VyJW8K9ePczHjtIFCGskMBoZID/e6X4JlYFHgqdIm
 6ATaRV1pjONUNGK5D/Tu5FityXV9l3086ZnB1ylVQHsqXSN0EfElwpNbkrjQK3qh90io
 5njwDzqGmDsiBqg2tvcddYExnS69AVN4Oo+HUhbpTW6QGenTex/nPXaH6KWRLV+zBIGH
 Sm6g==
X-Gm-Message-State: APjAAAWaY4c9c8wxAhZwJFZXfZmVcbrJbhyfs91e19TzfRvqQHo0B3p+
 GU2ti42kywCkpMx2c38K1iph/jMb2D/QSBIk2TY=
X-Google-Smtp-Source: APXvYqyTIKxHef+KF9Q5eelRllB1C6bWIaIEoaVVq8xO0PjfcZYnc2VCsRn/kJ/xLRtG6YYf3yQERhTVSJWwplX1xvo=
X-Received: by 2002:a1c:f714:: with SMTP id v20mr6087485wmh.55.1569566287677; 
 Thu, 26 Sep 2019 23:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190926045419.22827-1-alastair@au1.ibm.com>
 <20190926045419.22827-6-alastair@au1.ibm.com>
In-Reply-To: <20190926045419.22827-6-alastair@au1.ibm.com>
From: Mark Marshall <markmarshall14@gmail.com>
Date: Fri, 27 Sep 2019 08:37:56 +0200
Message-ID: <CAD4b4WLdMgunRoBDVtNZbhaMPbMw57AbcJgkKfmy2zpshgVyqQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] powerpc: Chunk calls to flush_dcache_range in
 arch_*_memory
To: "Alastair D'Silva" <alastair@au1.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 27 Sep 2019 19:37:47 +1000
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
Cc: Michal Hocko <mhocko@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alastair@d-silva.org,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Qian Cai <cai@lca.pw>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Comment below...

On Thu, 26 Sep 2019 at 12:18, Alastair D'Silva <alastair@au1.ibm.com> wrote:
>
> From: Alastair D'Silva <alastair@d-silva.org>
>
> When presented with large amounts of memory being hotplugged
> (in my test case, ~890GB), the call to flush_dcache_range takes
> a while (~50 seconds), triggering RCU stalls.
>
> This patch breaks up the call into 1GB chunks, calling
> cond_resched() inbetween to allow the scheduler to run.
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  arch/powerpc/mm/mem.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index cff947cb2a84..a2758e473d58 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -104,6 +104,27 @@ int __weak remove_section_mapping(unsigned long start, unsigned long end)
>         return -ENODEV;
>  }
>
> +#define FLUSH_CHUNK_SIZE SZ_1G
> +/**
> + * flush_dcache_range_chunked(): Write any modified data cache blocks out to
> + * memory and invalidate them, in chunks of up to FLUSH_CHUNK_SIZE
> + * Does not invalidate the corresponding instruction cache blocks.
> + *
> + * @start: the start address
> + * @stop: the stop address (exclusive)
> + * @chunk: the max size of the chunks
> + */
> +static void flush_dcache_range_chunked(unsigned long start, unsigned long stop,
> +                                      unsigned long chunk)
> +{
> +       unsigned long i;
> +
> +       for (i = start; i < stop; i += FLUSH_CHUNK_SIZE) {
Here you ignore the function parameter "chunk" and use the define
FLUSH_CHUNK_SIZE.
You should do one or the other; use the parameter or remove it.
> +               flush_dcache_range(i, min(stop, start + FLUSH_CHUNK_SIZE));
> +               cond_resched();
> +       }
> +}
> +
>  int __ref arch_add_memory(int nid, u64 start, u64 size,
>                         struct mhp_restrictions *restrictions)
>  {
> @@ -120,7 +141,8 @@ int __ref arch_add_memory(int nid, u64 start, u64 size,
>                         start, start + size, rc);
>                 return -EFAULT;
>         }
> -       flush_dcache_range(start, start + size);
> +
> +       flush_dcache_range_chunked(start, start + size, FLUSH_CHUNK_SIZE);
>
>         return __add_pages(nid, start_pfn, nr_pages, restrictions);
>  }
> @@ -137,7 +159,8 @@ void __ref arch_remove_memory(int nid, u64 start, u64 size,
>
>         /* Remove htab bolted mappings for this section of memory */
>         start = (unsigned long)__va(start);
> -       flush_dcache_range(start, start + size);
> +       flush_dcache_range_chunked(start, start + size, FLUSH_CHUNK_SIZE);
> +
>         ret = remove_section_mapping(start, start + size);
>         WARN_ON_ONCE(ret);
>
> --
> 2.21.0
>
