Return-Path: <linuxppc-dev+bounces-10165-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF16AAFF689
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jul 2025 03:57:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bcydY0ww3z2yhX;
	Thu, 10 Jul 2025 11:57:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752112625;
	cv=none; b=jXaIKKlQd36J+FU7kFV+ptS7KeVki8nVOqaETf4UD805twr0vljqJXjS+g/twSsW6JxN6LLYBFYoeKtYWTGOtcwRXakPCvRd9MhDGfHemw0aOpR/KlIHNNqGt9l5OfpXk2h/3glzKPmNtqEiU7TB7cg2LJXJZLluIpYqEV+VjMuR6z8Ni4lxnfz+S7K6WvdwY8/dtzTH0kZx8vVo4YNElwKe8VHfmg98bCn4PHUNniWVwCGMesrGUouC8M3WeE8k9kOLwzqmTglJ+fwnHJDFBz4ztp1ffavrdNL2L0PIjM5ATXO135YANySEbgGeTPEPyf4J4Q1gqUh17wtS7cYcXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752112625; c=relaxed/relaxed;
	bh=DDObvEJ/jIdbBg5ZxcRmtzlW2/cKEzrqP8L22Qd6WsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCk7fqAAdTB8uCZEhWpVuBKBlAbwQ6qaAdGPE5JDczVh/0CDVab+0rjbuiXqYXNNDCSTJzV27j5gQ8/4koyU2ZkcOuN8YVyUe9ulGrc629l1pDt5BwtcSseZMv7QICzu5OUIyZDWvtHbJFyzwLzw5Z6h+jfxBF4T/I4IynIVMwvk1d+UF6sSO8ObUMV/J64xlNgv0misTz89/f0eUj0PATrQQyJlsuQnm6OBSTiHU4UoCUbiNhiVDAxUUUvuSdAYK+TpAeRKWzOcxNArGZe3oCUWJYIrrkcGD4oJVE9uhY7X8hXYj+OKT60q9SaT4nntVYDzDSYroQKceCX3aQmDzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s36gQ67r; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s36gQ67r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bcydX1H9Hz2yf3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jul 2025 11:57:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9CBA65C6B8A;
	Thu, 10 Jul 2025 01:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B5A6C4CEEF;
	Thu, 10 Jul 2025 01:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752112621;
	bh=V5+0JeybGuGj3hNbNrffhOaKN4FNKIUQicNKhhV6M9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s36gQ67r+HzmWOakvqjLN2Bi+cxAqgCf9b1jm8CeVANKXagOyi4qRCxno997vOt7I
	 npTW9Sqm4fAIHoISBPWcX7vjQIgal5suR6GEB+4EiYf2hwAgwibu53TlZdekzLZBEQ
	 9ABBQhGaRUZwnPIix2Qtgh30B7PYqrpPimSO1KfrR0HfIEongwbMYk/1onz4hpDV26
	 GuIsiO8b8UJiiZ9KWrmQ80LhTJRWiOT9thCwXfahXz+KypMzoUnp19aAp8cABbtMDx
	 gSq60cIssEQ+9AYdxjTLFvnKp8xU42OaucaV/Fz2aUcFFHry0HoCkWdrBfNWJs8YVU
	 kLmHPK8kS1RBw==
Date: Wed, 9 Jul 2025 18:57:00 -0700
From: Kees Cook <kees@kernel.org>
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 08/14] powerpc: Handle KCOV __init vs inline mismatches
Message-ID: <202507091856.C6510D809A@keescook>
References: <20250523043251.it.550-kees@kernel.org>
 <20250523043935.2009972-8-kees@kernel.org>
 <87jz662ssp.fsf@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jz662ssp.fsf@gmail.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, May 24, 2025 at 04:13:02PM +0530, Ritesh Harjani wrote:
> Kees Cook <kees@kernel.org> writes:
> 
> > When KCOV is enabled all functions get instrumented, unless
> > the __no_sanitize_coverage attribute is used. To prepare for
> > __no_sanitize_coverage being applied to __init functions, we have to
> > handle differences in how GCC's inline optimizations get resolved. For
> > s390 this requires forcing a couple functions to be inline with
> > __always_inline.
> >
> > Signed-off-by: Kees Cook <kees@kernel.org>
> > ---
> > Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Nicholas Piggin <npiggin@gmail.com>
> > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Cc: Naveen N Rao <naveen@kernel.org>
> > Cc: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
> > Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: <linuxppc-dev@lists.ozlabs.org>
> > ---
> >  arch/powerpc/mm/book3s64/hash_utils.c    | 2 +-
> >  arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> > index 5158aefe4873..93f1e1eb5ea6 100644
> > --- a/arch/powerpc/mm/book3s64/hash_utils.c
> > +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> > @@ -409,7 +409,7 @@ static DEFINE_RAW_SPINLOCK(linear_map_kf_hash_lock);
> >  
> >  static phys_addr_t kfence_pool;
> >  
> > -static inline void hash_kfence_alloc_pool(void)
> > +static __always_inline void hash_kfence_alloc_pool(void)
> >  {
> >  	if (!kfence_early_init_enabled())
> >  		goto err;
> > diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> > index 9f764bc42b8c..3238e9ed46b5 100644
> > --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> > +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> > @@ -363,7 +363,7 @@ static int __meminit create_physical_mapping(unsigned long start,
> >  }
> >  
> >  #ifdef CONFIG_KFENCE
> > -static inline phys_addr_t alloc_kfence_pool(void)
> > +static __always_inline phys_addr_t alloc_kfence_pool(void)
> >  {
> >  	phys_addr_t kfence_pool;
> >  
> 
> I remember seeing a warning msg around .init.text section. Let me dig
> that...
> 
> ... Here it is: https://lore.kernel.org/oe-kbuild-all/202504190552.mnFGs5sj-lkp@intel.com/
> 
> I am not sure why it only complains for hash_debug_pagealloc_alloc_slots().
> I believe there should me more functions to mark with __init here.
> Anyways, here is the patch of what I had in mind.. I am not a compiler expert,
> so please let me know your thoughts on this.

Yeah, this looks good. I'll snag your patch and drop mine. :)

-Kees

-- 
Kees Cook

