Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D551D8A594C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 19:37:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJDsB4lqqz3vcX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 03:37:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJDrn74jFz3cCt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 03:37:27 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30ED11515;
	Mon, 15 Apr 2024 10:37:23 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.38.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6579A3F64C;
	Mon, 15 Apr 2024 10:36:49 -0700 (PDT)
Date: Mon, 15 Apr 2024 18:36:39 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
Message-ID: <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415075241.GF40213@noisy.programming.kicks-ass.net>
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
Cc: x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, Luis Chamberlain <mcgrof@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh
  Nguyen <dinguyen@kernel.org>, "Bj\"orn T\"opel" <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 15, 2024 at 09:52:41AM +0200, Peter Zijlstra wrote:
> On Thu, Apr 11, 2024 at 07:00:41PM +0300, Mike Rapoport wrote:
> > +/**
> > + * enum execmem_type - types of executable memory ranges
> > + *
> > + * There are several subsystems that allocate executable memory.
> > + * Architectures define different restrictions on placement,
> > + * permissions, alignment and other parameters for memory that can be used
> > + * by these subsystems.
> > + * Types in this enum identify subsystems that allocate executable memory
> > + * and let architectures define parameters for ranges suitable for
> > + * allocations by each subsystem.
> > + *
> > + * @EXECMEM_DEFAULT: default parameters that would be used for types that
> > + * are not explcitly defined.
> > + * @EXECMEM_MODULE_TEXT: parameters for module text sections
> > + * @EXECMEM_KPROBES: parameters for kprobes
> > + * @EXECMEM_FTRACE: parameters for ftrace
> > + * @EXECMEM_BPF: parameters for BPF
> > + * @EXECMEM_TYPE_MAX:
> > + */
> > +enum execmem_type {
> > +	EXECMEM_DEFAULT,
> > +	EXECMEM_MODULE_TEXT = EXECMEM_DEFAULT,
> > +	EXECMEM_KPROBES,
> > +	EXECMEM_FTRACE,
> > +	EXECMEM_BPF,
> > +	EXECMEM_TYPE_MAX,
> > +};
> 
> Can we please get a break-down of how all these types are actually
> different from one another?
> 
> I'm thinking some platforms have a tiny immediate space (arm64 comes to
> mind) and has less strict placement constraints for some of them?

Yeah, and really I'd *much* rather deal with that in arch code, as I have said
several times.

For arm64 we have two bsaic restrictions: 

1) Direct branches can go +/-128M
   We can expand this range by having direct branches go to PLTs, at a
   performance cost.

2) PREL32 relocations can go +/-2G
   We cannot expand this further.

* We don't need to allocate memory for ftrace. We do not use trampolines.

* Kprobes XOL areas don't care about either of those; we don't place any
  PC-relative instructions in those. Maybe we want to in future.

* Modules care about both; we'd *prefer* to place them within +/-128M of all
  other kernel/module code, but if there's no space we can use PLTs and expand
  that to +/-2G. Since modules can refreence other modules, that ends up
  actually being halved, and modules have to fit within some 2G window that
  also covers the kernel.

* I'm not sure about BPF's requirements; it seems happy doing the same as
  modules.

So if we *must* use a common execmem allocator, what we'd reall want is our own
types, e.g.

	EXECMEM_ANYWHERE
	EXECMEM_NOPLT
	EXECMEM_PREL32

... and then we use those in arch code to implement module_alloc() and friends.

Mark.
