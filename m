Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 396C47AC392
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Sep 2023 18:22:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ofaXj1oN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RtDv20wB6z3c9j
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Sep 2023 02:22:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ofaXj1oN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RtDtC1m9Cz30Pn
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Sep 2023 02:21:55 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AC50ECE1ED5;
	Sat, 23 Sep 2023 16:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13699C433C7;
	Sat, 23 Sep 2023 16:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695486112;
	bh=epTBeih4MHoaHBpc48qML+P/ARMeb7d09SNlM/hQxw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofaXj1oNTs/VBLYlvMmVzGA3HsxAlJskkj7XrUmUTDzx/0RPqgkm91Z7JgVfNThA+
	 jF51Gkq+/u8f3Pl9hK1BmDVAsawYyQVDaZs6NfxlIM+VHJDmPuMKHs1TOy64LPBIRA
	 iuS6IcsT1zTuxev9K6pIMvYP5Qodr6WpU9hqxXwD4ixmanyA2+kLliocF453RBJkLn
	 2TOewMq1E/GW1XYu4R2CCfYUfUpS+zAxWOefS4IClhNx863WjbFLsgwwYry2hXBCvO
	 tH3ho75+Hir/pB3LPn6CIdrcMEvj+m5czuQ0yH+wcE6dXhoEdwLJTXJ/XABJAw1gmy
	 81I0fO8rK/6Jg==
Date: Sat, 23 Sep 2023 19:20:55 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH v3 06/13] mm/execmem: introduce execmem_data_alloc()
Message-ID: <20230923162055.GL3303@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-7-rppt@kernel.org>
 <CAPhsuW73NMvdpmyrhGouQSAHEL9wRw_A+8dZ-5R4BU=UHH83cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW73NMvdpmyrhGouQSAHEL9wRw_A+8dZ-5R4BU=UHH83cw@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Luis Chamberlain <mcgrof@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?iso-8859-1?Q?Bj=F6
 rn_T=F6pel?= <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 21, 2023 at 03:52:21PM -0700, Song Liu wrote:
> On Mon, Sep 18, 2023 at 12:31 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> [...]
> > diff --git a/include/linux/execmem.h b/include/linux/execmem.h
> > index 519bdfdca595..09d45ac786e9 100644
> > --- a/include/linux/execmem.h
> > +++ b/include/linux/execmem.h
> > @@ -29,6 +29,7 @@
> >   * @EXECMEM_KPROBES: parameters for kprobes
> >   * @EXECMEM_FTRACE: parameters for ftrace
> >   * @EXECMEM_BPF: parameters for BPF
> > + * @EXECMEM_MODULE_DATA: parameters for module data sections
> >   * @EXECMEM_TYPE_MAX:
> >   */
> >  enum execmem_type {
> > @@ -37,6 +38,7 @@ enum execmem_type {
> >         EXECMEM_KPROBES,
> >         EXECMEM_FTRACE,
> 
> In longer term, I think we can improve the JITed code and merge
> kprobe/ftrace/bpf. to use the same ranges. Also, do we need special
> setting for FTRACE? If not, let's just remove it.

I don't think we need to limit how the JITed code is generated because we
want to support fewer address space ranges for it. 

As for FTRACE, now it's only needed on x86 and s390 and there it happens
to use the same ranges as MODULES and the rest, but it still gives some
notion of potential semantic differences and the overhead of keeping it is
really negligible.
 
> >         EXECMEM_BPF,
> > +       EXECMEM_MODULE_DATA,
> >         EXECMEM_TYPE_MAX,
> >  };
> 
> Overall, it is great that kprobe/ftrace/bpf no longer depend on modules.
> 
> OTOH, I think we should merge execmem_type and existing mod_mem_type.
> Otherwise, we still need to handle page permissions in multiple places.
> What is our plan for that?

Maybe, but I think this is too early. There are several things missing
before we could remove set_memory usage from modules. E.g. to use ROX
allocations on x86 we at least should update alternatives handling and
reach a consensus about synchronization Andy mentioned in his comments to
v2.
 
> Thanks,
> Song
> 
> 
> >
> > @@ -107,6 +109,23 @@ struct execmem_params *execmem_arch_params(void);
> >   */
> >  void *execmem_text_alloc(enum execmem_type type, size_t size);
> >
> > +/**
> > + * execmem_data_alloc - allocate memory for data coupled to code
> > + * @type: type of the allocation
> > + * @size: how many bytes of memory are required
> > + *
> > + * Allocates memory that will contain data coupled with executable code,
> > + * like data sections in kernel modules.
> > + *
> > + * The memory will have protections defined by architecture.
> > + *
> > + * The allocated memory will reside in an area that does not impose
> > + * restrictions on the addressing modes.
> > + *
> > + * Return: a pointer to the allocated memory or %NULL
> > + */
> > +void *execmem_data_alloc(enum execmem_type type, size_t size);
> > +
> >  /**
> >   * execmem_free - free executable memory
> >   * @ptr: pointer to the memory that should be freed
> > diff --git a/kernel/module/main.c b/kernel/module/main.c
> > index c4146bfcd0a7..2ae83a6abf66 100644
> > --- a/kernel/module/main.c
> > +++ b/kernel/module/main.c
> > @@ -1188,25 +1188,16 @@ void __weak module_arch_freeing_init(struct module *mod)
> >  {
> >  }
> >
> > -static bool mod_mem_use_vmalloc(enum mod_mem_type type)
> > -{
> > -       return IS_ENABLED(CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC) &&
> > -               mod_mem_type_is_core_data(type);
> > -}
> > -
> >  static void *module_memory_alloc(unsigned int size, enum mod_mem_type type)
> >  {
> > -       if (mod_mem_use_vmalloc(type))
> > -               return vzalloc(size);
> > +       if (mod_mem_type_is_data(type))
> > +               return execmem_data_alloc(EXECMEM_MODULE_DATA, size);
> >         return execmem_text_alloc(EXECMEM_MODULE_TEXT, size);
> >  }
> >
> >  static void module_memory_free(void *ptr, enum mod_mem_type type)
> >  {
> > -       if (mod_mem_use_vmalloc(type))
> > -               vfree(ptr);
> > -       else
> > -               execmem_free(ptr);
> > +       execmem_free(ptr);
> >  }
> >
> >  static void free_mod_mem(struct module *mod)
> > diff --git a/mm/execmem.c b/mm/execmem.c
> > index abcbd07e05ac..aeff85261360 100644
> > --- a/mm/execmem.c
> > +++ b/mm/execmem.c
> > @@ -53,11 +53,23 @@ static void *execmem_alloc(size_t size, struct execmem_range *range)
> >         return kasan_reset_tag(p);
> >  }
> >
> > +static inline bool execmem_range_is_data(enum execmem_type type)
> > +{
> > +       return type == EXECMEM_MODULE_DATA;
> > +}
> > +
> >  void *execmem_text_alloc(enum execmem_type type, size_t size)
> >  {
> >         return execmem_alloc(size, &execmem_params.ranges[type]);
> >  }
> >
> > +void *execmem_data_alloc(enum execmem_type type, size_t size)
> > +{
> > +       WARN_ON_ONCE(!execmem_range_is_data(type));
> > +
> > +       return execmem_alloc(size, &execmem_params.ranges[type]);
> > +}
> > +
> >  void execmem_free(void *ptr)
> >  {
> >         /*
> > @@ -93,7 +105,10 @@ static void execmem_init_missing(struct execmem_params *p)
> >                 struct execmem_range *r = &p->ranges[i];
> >
> >                 if (!r->start) {
> > -                       r->pgprot = default_range->pgprot;
> > +                       if (execmem_range_is_data(i))
> > +                               r->pgprot = PAGE_KERNEL;
> > +                       else
> > +                               r->pgprot = default_range->pgprot;
> >                         r->alignment = default_range->alignment;
> >                         r->start = default_range->start;
> >                         r->end = default_range->end;
> > --
> > 2.39.2
> >

-- 
Sincerely yours,
Mike.
