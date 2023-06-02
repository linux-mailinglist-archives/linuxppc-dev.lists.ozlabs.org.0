Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2A271FE03
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 11:36:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXdDR67Jzz3fbt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 19:36:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXdCw5hqTz3dwt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 19:35:53 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2ACE41063;
	Fri,  2 Jun 2023 02:36:05 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.24.167])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF4863F7BD;
	Fri,  2 Jun 2023 02:35:14 -0700 (PDT)
Date: Fri, 2 Jun 2023 10:35:09 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
Message-ID: <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
References: <20230601101257.530867-1-rppt@kernel.org>
 <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHjgIH3aX9dCvVZc@moria.home.lan>
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
Cc: x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David
  S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 01, 2023 at 02:14:56PM -0400, Kent Overstreet wrote:
> On Thu, Jun 01, 2023 at 05:12:03PM +0100, Mark Rutland wrote:
> > For a while I have wanted to give kprobes its own allocator so that it can work
> > even with CONFIG_MODULES=n, and so that it doesn't have to waste VA space in
> > the modules area.
> > 
> > Given that, I think these should have their own allocator functions that can be
> > provided independently, even if those happen to use common infrastructure.
> 
> How much memory can kprobes conceivably use? I think we also want to try
> to push back on combinatorial new allocators, if we can.

That depends on who's using it, and how (e.g. via BPF).

To be clear, I'm not necessarily asking for entirely different allocators, but
I do thinkg that we want wrappers that can at least pass distinct start+end
parameters to a common allocator, and for arm64's modules code I'd expect that
we'd keep the range falblack logic out of the common allcoator, and just call
it twice.

> > > Several architectures override module_alloc() because of various
> > > constraints where the executable memory can be located and this causes
> > > additional obstacles for improvements of code allocation.
> > > 
> > > This set splits code allocation from modules by introducing
> > > jit_text_alloc(), jit_data_alloc() and jit_free() APIs, replaces call
> > > sites of module_alloc() and module_memfree() with the new APIs and
> > > implements core text and related allocation in a central place.
> > > 
> > > Instead of architecture specific overrides for module_alloc(), the
> > > architectures that require non-default behaviour for text allocation must
> > > fill jit_alloc_params structure and implement jit_alloc_arch_params() that
> > > returns a pointer to that structure. If an architecture does not implement
> > > jit_alloc_arch_params(), the defaults compatible with the current
> > > modules::module_alloc() are used.
> > 
> > As above, I suspect that each of the callsites should probably be using common
> > infrastructure, but I don't think that a single jit_alloc_arch_params() makes
> > sense, since the parameters for each case may need to be distinct.
> 
> I don't see how that follows. The whole point of function parameters is
> that they may be different :)

What I mean is that jit_alloc_arch_params() tries to aggregate common
parameters, but they aren't actually common (e.g. the actual start+end range
for allocation).

> Can you give more detail on what parameters you need? If the only extra
> parameter is just "does this allocation need to live close to kernel
> text", that's not that big of a deal.

My thinking was that we at least need the start + end for each caller. That
might be it, tbh.

Thanks,
Mark.
