Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DDE91BAC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 06:00:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BgFN6dh2zDrBn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 14:00:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="ZA6XLzRF"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BgCd4JFXzDqdd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 13:59:06 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id i18so359969pgl.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Aug 2019 20:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=qkepw2mcByNh/XDFWlSo/1pf2rJV4AneuZO+UsdnIoM=;
 b=ZA6XLzRFd2ebKR/TJCR+ADB6Xh9XcGEECwjMBoMxa6uKoZf5G5Nhm/KuNzQIu8RvB4
 nZM9n+RjmwM+ORVQozvjk1GcBBUAhyakdS8qsqDebJDeU1O0XVbiJ8v6t2dKoX0rlm5J
 th7q4VdBjxXvwK1Sz1gcitgvYs3PzRiY1ZCwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=qkepw2mcByNh/XDFWlSo/1pf2rJV4AneuZO+UsdnIoM=;
 b=DxQ12rIpzEMrUZ+F8nmTJ+U9vZi+3R8AQcfuL+U+VtSprZOIk9IKw7Bb6jtADfIL/k
 rN4alBBL3cKE8l63v6TeSe1IFApGlHFwc8bbng4urkClSoVe7DjhF7h+tLuoSeLBDv+P
 5mmJ70FRlk/ndT8MsnbeD7JDR5Vbfh23QneJym49DqFlmK0IxlhLD/806x3I0tgGk1sM
 qr0qfZfMTVUsLM10RHu0tgAlrGorvxxhUx9qGPcpH8rTDHuXoFMtnyNsLpre4xJumM8K
 IaHeD2sVZJtQTfPGZT1w9MrN+G7r/T8fYVIuDCjC3lwj8KgDWlidhDTyzgU79pNk1Pd9
 JpRQ==
X-Gm-Message-State: APjAAAWar4JcmmM5qpW77kFdUkF5boYJEd4PKgY/jXzcR47v7MYgyLiw
 Wl8ORTm6S8AXeltbYXyT1fPidA==
X-Google-Smtp-Source: APXvYqyel1bRmaINRgt273aUt9VqMcblyqiDf6mM5vaVRn/c66GBKoPiiyt6RgkWa+sUPSwErio+sw==
X-Received: by 2002:a63:c203:: with SMTP id b3mr18301448pgd.450.1566187141292; 
 Sun, 18 Aug 2019 20:59:01 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id t6sm12987903pgu.23.2019.08.18.20.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2019 20:59:00 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Mark Rutland <mark.rutland@arm.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v4 1/3] kasan: support backing vmalloc space with real
 shadow memory
In-Reply-To: <20190816170813.GA7417@lakrids.cambridge.arm.com>
References: <20190815001636.12235-1-dja@axtens.net>
 <20190815001636.12235-2-dja@axtens.net>
 <15c6110a-9e6e-495c-122e-acbde6e698d9@c-s.fr>
 <20190816170813.GA7417@lakrids.cambridge.arm.com>
Date: Mon, 19 Aug 2019 13:58:55 +1000
Message-ID: <87imqtu7pc.fsf@dja-thinkpad.axtens.net>
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
Cc: gor@linux.ibm.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com,
 luto@kernel.org, aryabinin@virtuozzo.com, linuxppc-dev@lists.ozlabs.org,
 dvyukov@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>> > Instead, share backing space across multiple mappings. Allocate
>> > a backing page the first time a mapping in vmalloc space uses a
>> > particular page of the shadow region. Keep this page around
>> > regardless of whether the mapping is later freed - in the mean time
>> > the page could have become shared by another vmalloc mapping.
>> > 
>> > This can in theory lead to unbounded memory growth, but the vmalloc
>> > allocator is pretty good at reusing addresses, so the practical memory
>> > usage grows at first but then stays fairly stable.
>> 
>> I guess people having gigabytes of memory don't mind, but I'm concerned
>> about tiny targets with very little amount of memory. I have boards with as
>> little as 32Mbytes of RAM. The shadow region for the linear space already
>> takes one eighth of the RAM. I'd rather avoid keeping unused shadow pages
>> busy.
>
> I think this depends on how much shadow would be in constant use vs what
> would get left unused. If the amount in constant use is sufficiently
> large (or the residue is sufficiently small), then it may not be
> worthwhile to support KASAN_VMALLOC on such small systems.

I'm not unsympathetic to the cause of small-memory systems, but this is
useful as-is for x86, especially for VMAP_STACK. arm64 and s390 have
already been able to make use of it as well. So unless the design is
going to make it difficult to extend to small-memory systems - if it
bakes in concepts or APIs that are going to make things harder - I think
it might be worth merging as is. (pending the fixes for documentation
nits etc that you point out.)

>> Each page of shadow memory represent 8 pages of real memory. Could we use
>> page_ref to count how many pieces of a shadow page are used so that we can
>> free it when the ref count decreases to 0.

I'm not sure how much of a difference it will make, but I'll have a look.

>> > This requires architecture support to actually use: arches must stop
>> > mapping the read-only zero page over portion of the shadow region that
>> > covers the vmalloc space and instead leave it unmapped.
>> 
>> Why 'must' ? Couldn't we switch back and forth from the zero page to real
>> page on demand ?

This code as currently written will not work if the architecture maps
the zero page over the portion of the shadow region that covers the
vmalloc space. So it's an implementation 'must' rather than a laws of
the universe 'must'.

We could perhaps map the zero page, but:

 - you have to be really careful to get it right. If you accidentally
   map the zero page onto memory where you shouldn't, you may permit
   memory accesses that you should catch.

   We could ameliorate this by taking Mark's suggestion and mapping a
   poision page over the vmalloc space instead.

 - I'm not sure what benefit is provided by having something mapped vs
   leaving a hole, other than making the fault addresses more obvious.

 - This gets complex, especially to do swapping correctly with respect
   to various architectures' quirks (see e.g. 56eecdb912b5 "mm: Use
   ptep/pmdp_set_numa() for updating _PAGE_NUMA bit" - ppc64 at least
   requires that set_pte_at is never called on a valid PTE).

>> If the zero page is not mapped for unused vmalloc space, bad memory accesses
>> will Oops on the shadow memory access instead of Oopsing on the real bad
>> access, making it more difficult to locate and identify the issue.

I suppose. It's pretty easy on at least x86 and my draft ppc64
implementation to identify when an access falls into the shadow region
and then to reverse engineer the memory access that was being checked
based on the offset. As Andy points out, the fault handler could do this
automatically.

> I agree this isn't nice, though FWIW this can already happen today for
> bad addresses that fall outside of the usual kernel address space. We
> could make the !KASAN_INLINE checks resilient to this by using
> probe_kernel_read() to check the shadow, and treating unmapped shadow as
> poison.
>
> It's also worth noting that flipping back and forth isn't generally safe
> unless going via an invalid table entry, so there'd still be windows
> where a bad access might not have shadow mapped.
>
> We'd need to reuse the common p4d/pud/pmd/pte tables for unallocated
> regions, or the tables alone would consume significant amounts of memory
> (e..g ~32GiB for arm64 defconfig), and thus we'd need to be able to
> switch all levels between pgd and pte, which is much more complicated.
>
> I strongly suspect that the additional complexity will outweigh the
> benefit.
>

I'm not opposed to this in principle but I am also concerned about the
complexity involved.

Regards,
Daniel

> [...]
>
>> > +#ifdef CONFIG_KASAN_VMALLOC
>> > +static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>> > +				      void *unused)
>> > +{
>> > +	unsigned long page;
>> > +	pte_t pte;
>> > +
>> > +	if (likely(!pte_none(*ptep)))
>> > +		return 0;
>> 
>> Prior to this, the zero shadow area should be mapped, and the test should
>> be:
>> 
>> if (likely(pte_pfn(*ptep) != PHYS_PFN(__pa(kasan_early_shadow_page))))
>> 	return 0;
>
> As above, this would need a more comprehensive redesign, so I don't
> think it's worth going into that level of nit here. :)
>
> If we do try to use common shadow for unallocate VA ranges, it probably
> makes sense to have a common poison page that we can use, so that we can
> report vmalloc-out-of-bounfds.
>
> Thanks,
> Mark.
