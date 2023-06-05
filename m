Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8E47221FF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 11:22:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZSmR03F1z3f7P
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 19:21:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jK253SR7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jK253SR7;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZSlY21xkz3c3w
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jun 2023 19:21:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D05A861268;
	Mon,  5 Jun 2023 09:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FBDC433EF;
	Mon,  5 Jun 2023 09:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685956870;
	bh=VAQ7yfzQtWyNohR4wxaMprdeMTDlqPdyTw6okH1kHrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jK253SR7yhSPqefNFos3ffgdScPlfxLEgS1so3b12kxeFrCMZRgawvFm8WayBcEJg
	 gsJRpMEGttvUT3HVy8GIHc65y0zhLLrBx4d+jkyhsnS/hQIbQr5LWBz2vZgDkJqevO
	 +UIxJzVenJUyw/Uip8ZNP03sQq+Yr8qA1I9bh08IcIOmhh2JIjbopJQQXYTqJDA+gf
	 Ib8fD2IpqNgfgglvW2/JWPvjCy1i6XCYLFHWvOg0HPpz5vZx6UOnmL3FtqiwyAdfsz
	 iIun2EVvr5UICgLU5k5gsCEhuKWjokIA4YcB5nFxBvbjMNYU78+Z9LTAA6e8yLvHwk
	 VVxBZGJqVTgtA==
Date: Mon, 5 Jun 2023 12:20:40 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
Message-ID: <20230605092040.GB3460@kernel.org>
References: <20230601101257.530867-1-rppt@kernel.org>
 <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan>
 <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
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
Cc: x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, bpf@vger.kernel.org, linuxppc-dev@lists.ozla
 bs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 02, 2023 at 10:35:09AM +0100, Mark Rutland wrote:
> On Thu, Jun 01, 2023 at 02:14:56PM -0400, Kent Overstreet wrote:
> > On Thu, Jun 01, 2023 at 05:12:03PM +0100, Mark Rutland wrote:
> > > For a while I have wanted to give kprobes its own allocator so that it can work
> > > even with CONFIG_MODULES=n, and so that it doesn't have to waste VA space in
> > > the modules area.
> > > 
> > > Given that, I think these should have their own allocator functions that can be
> > > provided independently, even if those happen to use common infrastructure.
> > 
> > How much memory can kprobes conceivably use? I think we also want to try
> > to push back on combinatorial new allocators, if we can.
> 
> That depends on who's using it, and how (e.g. via BPF).
> 
> To be clear, I'm not necessarily asking for entirely different allocators, but
> I do thinkg that we want wrappers that can at least pass distinct start+end
> parameters to a common allocator, and for arm64's modules code I'd expect that
> we'd keep the range falblack logic out of the common allcoator, and just call
> it twice.
> 
> > > > Several architectures override module_alloc() because of various
> > > > constraints where the executable memory can be located and this causes
> > > > additional obstacles for improvements of code allocation.
> > > > 
> > > > This set splits code allocation from modules by introducing
> > > > jit_text_alloc(), jit_data_alloc() and jit_free() APIs, replaces call
> > > > sites of module_alloc() and module_memfree() with the new APIs and
> > > > implements core text and related allocation in a central place.
> > > > 
> > > > Instead of architecture specific overrides for module_alloc(), the
> > > > architectures that require non-default behaviour for text allocation must
> > > > fill jit_alloc_params structure and implement jit_alloc_arch_params() that
> > > > returns a pointer to that structure. If an architecture does not implement
> > > > jit_alloc_arch_params(), the defaults compatible with the current
> > > > modules::module_alloc() are used.
> > > 
> > > As above, I suspect that each of the callsites should probably be using common
> > > infrastructure, but I don't think that a single jit_alloc_arch_params() makes
> > > sense, since the parameters for each case may need to be distinct.
> > 
> > I don't see how that follows. The whole point of function parameters is
> > that they may be different :)
> 
> What I mean is that jit_alloc_arch_params() tries to aggregate common
> parameters, but they aren't actually common (e.g. the actual start+end range
> for allocation).

jit_alloc_arch_params() tries to aggregate architecture constraints and
requirements for allocations of executable memory and this exactly what
the first 6 patches of this set do.

A while ago Thomas suggested to use a structure that parametrizes
architecture constraints by the memory type used in modules [1] and Song
implemented the infrastructure for it and x86 part [2].

I liked the idea of defining parameters in a single structure, but I
thought that approaching the problem from the arch side rather than from
modules perspective will be better starting point, hence these patches.

I don't see a fundamental reason why a single structure cannot describe
what is needed for different code allocation cases, be it modules, kprobes
or bpf. There is of course an assumption that the core allocations will be
the same for all the users, and it seems to me that something like 

* allocate physical memory if allocator caches are empty
* map it in vmalloc or modules address space
* return memory from the allocator cache to the caller

will work for all usecases.

We might need separate caches for different cases on different
architectures, and a way to specify what cache should be used in the
allocator API, but that does not contradict a single structure for arch
specific parameters, but only makes it more elaborate, e.g. something like

enum jit_type {
	JIT_MODULES_TEXT,
	JIT_MODULES_DATA,
	JIT_KPROBES,
	JIT_FTRACE,
	JIT_BPF,
	JIT_TYPE_MAX,
};

struct jit_alloc_params {
	struct jit_range	ranges[JIT_TYPE_MAX];
	/* ... */
};

> > Can you give more detail on what parameters you need? If the only extra
> > parameter is just "does this allocation need to live close to kernel
> > text", that's not that big of a deal.
> 
> My thinking was that we at least need the start + end for each caller. That
> might be it, tbh.

Do you mean that modules will have something like

	jit_text_alloc(size, MODULES_START, MODULES_END);

and kprobes will have

	jit_text_alloc(size, KPROBES_START, KPROBES_END);
?

It sill can be achieved with a single jit_alloc_arch_params(), just by
adding enum jit_type parameter to jit_text_alloc().

[1] https://lore.kernel.org/linux-mm/87v8mndy3y.ffs@tglx/ 
[2] https://lore.kernel.org/all/20230526051529.3387103-1-song@kernel.org

> Thanks,
> Mark.

-- 
Sincerely yours,
Mike.
