Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DC0733EDC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 08:52:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P0RFez1E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qjmtj5sPdz3bxY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 16:52:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P0RFez1E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qjmsr29Hqz30fG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 16:52:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 69FCC60B07;
	Sat, 17 Jun 2023 06:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5A2C433C0;
	Sat, 17 Jun 2023 06:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686984717;
	bh=/qKKDaoSMPytALuHQ04GytBWLf/bqmvRcK74ppFE2a8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P0RFez1EfGYRPTyev/ddBuUzPfaI7NYAV3qwPAYDnlRPd3VlORPb9LLwAJNsB7HOD
	 XaTNoL/vc3WgcVwGzmW11kDKJAUwiH+6/aq1FZDc7+GKKGRDNnH6fEazV3xviU4Xdu
	 C+/q5uFaTCGSUOqz7wG3tCyqcwsxuFowQGM9EqAXvug3eByaI82gwGU/LAA7W+0x7N
	 lIyzQgQ47UaYju+tMMa6eYibyB5m2xJlH6icNOvjTXhyI/Ih1KbRLoHwZvr/gyzXyu
	 vOgqeIZZrqb6yw/imXyF8xZATseZuyfjlfKJVafWUrfVejHNNcMI379QODomewks5q
	 shTjXZO35vEXQ==
Date: Sat, 17 Jun 2023 09:51:11 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
Message-ID: <20230617065111.GR52412@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-7-rppt@kernel.org>
 <CAPhsuW4J+rFvh9WJVWLZxFHtcYxahYk=NoKYdU9FMibZU8986w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW4J+rFvh9WJVWLZxFHtcYxahYk=NoKYdU9FMibZU8986w@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 16, 2023 at 01:01:08PM -0700, Song Liu wrote:
> On Fri, Jun 16, 2023 at 1:51 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> >
> > Data related to code allocations, such as module data section, need to
> > comply with architecture constraints for its placement and its
> > allocation right now was done using execmem_text_alloc().
> >
> > Create a dedicated API for allocating data related to code allocations
> > and allow architectures to define address ranges for data allocations.
> >
> > Since currently this is only relevant for powerpc variants that use the
> > VMALLOC address space for module data allocations, automatically reuse
> > address ranges defined for text unless address range for data is
> > explicitly defined by an architecture.
> >
> > With separation of code and data allocations, data sections of the
> > modules are now mapped as PAGE_KERNEL rather than PAGE_KERNEL_EXEC which
> > was a default on many architectures.
> >
> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> [...]
> >  static void free_mod_mem(struct module *mod)
> > diff --git a/mm/execmem.c b/mm/execmem.c
> > index a67acd75ffef..f7bf496ad4c3 100644
> > --- a/mm/execmem.c
> > +++ b/mm/execmem.c
> > @@ -63,6 +63,20 @@ void *execmem_text_alloc(size_t size)
> >                              fallback_start, fallback_end, kasan);
> >  }
> >
> > +void *execmem_data_alloc(size_t size)
> > +{
> > +       unsigned long start = execmem_params.modules.data.start;
> > +       unsigned long end = execmem_params.modules.data.end;
> > +       pgprot_t pgprot = execmem_params.modules.data.pgprot;
> > +       unsigned int align = execmem_params.modules.data.alignment;
> > +       unsigned long fallback_start = execmem_params.modules.data.fallback_start;
> > +       unsigned long fallback_end = execmem_params.modules.data.fallback_end;
> > +       bool kasan = execmem_params.modules.flags & EXECMEM_KASAN_SHADOW;
> > +
> > +       return execmem_alloc(size, start, end, align, pgprot,
> > +                            fallback_start, fallback_end, kasan);
> > +}
> > +
> >  void execmem_free(void *ptr)
> >  {
> >         /*
> > @@ -101,6 +115,28 @@ static bool execmem_validate_params(struct execmem_params *p)
> >         return true;
> >  }
> >
> > +static void execmem_init_missing(struct execmem_params *p)
> 
> Shall we call this execmem_default_init_data?

This also fills in jit.text (next patch), so _data doesn't work here :)
And it's not really a default, the defaults are set explicitly for arches
that don't have execmem_arch_params.
 
> > +{
> > +       struct execmem_modules_range *m = &p->modules;
> > +
> > +       if (!pgprot_val(execmem_params.modules.data.pgprot))
> > +               execmem_params.modules.data.pgprot = PAGE_KERNEL;
> 
> Do we really need to check each of these? IOW, can we do:
> 
> if (!pgprot_val(execmem_params.modules.data.pgprot)) {
>        execmem_params.modules.data.pgprot = PAGE_KERNEL;
>        execmem_params.modules.data.alignment = m->text.alignment;
>        execmem_params.modules.data.start = m->text.start;
>        execmem_params.modules.data.end = m->text.end;
>        execmem_params.modules.data.fallback_start = m->text.fallback_start;
>       execmem_params.modules.data.fallback_end = m->text.fallback_end;
> }

Yes, we can have a single check here.
 
> Thanks,
> Song
> 
> [...]

-- 
Sincerely yours,
Mike.
