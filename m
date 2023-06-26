Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D5973DF08
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 14:24:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QqRqT64hLz30Bs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 22:24:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QqRpt0wmlz304p
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 22:24:02 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E14312F4;
	Mon, 26 Jun 2023 05:24:12 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.23.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA5173F64C;
	Mon, 26 Jun 2023 05:23:22 -0700 (PDT)
Date: Mon, 26 Jun 2023 13:23:17 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Puranjay Mohan <puranjay12@gmail.com>
Subject: Re: [PATCH v2 02/12] mm: introduce execmem_text_alloc() and
 jit_text_alloc()
Message-ID: <ZJmDNbY009G3haH9@FVFF77S0Q05N>
References: <20230616085038.4121892-3-rppt@kernel.org>
 <f9a7eebe-d36e-4587-b99d-35d4edefdd14@app.fastmail.com>
 <20230618080027.GA52412@kernel.org>
 <a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com>
 <20230625161417.GK52412@kernel.org>
 <90161ac9-3ca0-4c72-b1c4-ab1293e55445@app.fastmail.com>
 <20230625174257.GL52412@kernel.org>
 <20230625180741.jrrtkq55c4jrqh3t@moria.home.lan>
 <CAPhsuW45gmtCVgA0mg6X87x5EOzSmVqq3SCMSR6agyiukiJvEQ@mail.gmail.com>
 <CANk7y0jcakmuF4e9x8z7ZUra=MPx-=xxb0JZ3RrJ+S9Eb9-0_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANk7y0jcakmuF4e9x8z7ZUra=MPx-=xxb0JZ3RrJ+S9Eb9-0_g@mail.gmail.com>
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
Cc: the arch/x86 maintainers <x86@kernel.org>, loongarch@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, torvalds@linux-foundation.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, pjt@google.com, linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, Linux Kernel M
 ailing List <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 26, 2023 at 11:54:02AM +0200, Puranjay Mohan wrote:
> On Mon, Jun 26, 2023 at 8:13 AM Song Liu <song@kernel.org> wrote:
> >
> > On Sun, Jun 25, 2023 at 11:07 AM Kent Overstreet
> > <kent.overstreet@linux.dev> wrote:
> > >
> > > On Sun, Jun 25, 2023 at 08:42:57PM +0300, Mike Rapoport wrote:
> > > > On Sun, Jun 25, 2023 at 09:59:34AM -0700, Andy Lutomirski wrote:
> > > > >
> > > > >
> > > > > On Sun, Jun 25, 2023, at 9:14 AM, Mike Rapoport wrote:
> > > > > > On Mon, Jun 19, 2023 at 10:09:02AM -0700, Andy Lutomirski wrote:
> > > > > >>
> > > > > >> On Sun, Jun 18, 2023, at 1:00 AM, Mike Rapoport wrote:
> > > > > >> > On Sat, Jun 17, 2023 at 01:38:29PM -0700, Andy Lutomirski wrote:
> > > > > >> >> On Fri, Jun 16, 2023, at 1:50 AM, Mike Rapoport wrote:
> > > > > >> >> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > > > > >> >> >
> > > > > >> >> > module_alloc() is used everywhere as a mean to allocate memory for code.
> > > > > >> >> >
> > > > > >> >> > Beside being semantically wrong, this unnecessarily ties all subsystems
> > > > > >> >> > that need to allocate code, such as ftrace, kprobes and BPF to modules
> > > > > >> >> > and puts the burden of code allocation to the modules code.
> > > > > >> >> >
> > > > > >> >> > Several architectures override module_alloc() because of various
> > > > > >> >> > constraints where the executable memory can be located and this causes
> > > > > >> >> > additional obstacles for improvements of code allocation.
> > > > > >> >> >
> > > > > >> >> > Start splitting code allocation from modules by introducing
> > > > > >> >> > execmem_text_alloc(), execmem_free(), jit_text_alloc(), jit_free() APIs.
> > > > > >> >> >
> > > > > >> >> > Initially, execmem_text_alloc() and jit_text_alloc() are wrappers for
> > > > > >> >> > module_alloc() and execmem_free() and jit_free() are replacements of
> > > > > >> >> > module_memfree() to allow updating all call sites to use the new APIs.
> > > > > >> >> >
> > > > > >> >> > The intention semantics for new allocation APIs:
> > > > > >> >> >
> > > > > >> >> > * execmem_text_alloc() should be used to allocate memory that must reside
> > > > > >> >> >   close to the kernel image, like loadable kernel modules and generated
> > > > > >> >> >   code that is restricted by relative addressing.
> > > > > >> >> >
> > > > > >> >> > * jit_text_alloc() should be used to allocate memory for generated code
> > > > > >> >> >   when there are no restrictions for the code placement. For
> > > > > >> >> >   architectures that require that any code is within certain distance
> > > > > >> >> >   from the kernel image, jit_text_alloc() will be essentially aliased to
> > > > > >> >> >   execmem_text_alloc().
> > > > > >> >> >
> > > > > >> >>
> > > > > >> >> Is there anything in this series to help users do the appropriate
> > > > > >> >> synchronization when the actually populate the allocated memory with
> > > > > >> >> code?  See here, for example:
> > > > > >> >
> > > > > >> > This series only factors out the executable allocations from modules and
> > > > > >> > puts them in a central place.
> > > > > >> > Anything else would go on top after this lands.
> > > > > >>
> > > > > >> Hmm.
> > > > > >>
> > > > > >> On the one hand, there's nothing wrong with factoring out common code. On
> > > > > >> the other hand, this is probably the right time to at least start
> > > > > >> thinking about synchronization, at least to the extent that it might make
> > > > > >> us want to change this API.  (I'm not at all saying that this series
> > > > > >> should require changes -- I'm just saying that this is a good time to
> > > > > >> think about how this should work.)
> > > > > >>
> > > > > >> The current APIs, *and* the proposed jit_text_alloc() API, don't actually
> > > > > >> look like the one think in the Linux ecosystem that actually
> > > > > >> intelligently and efficiently maps new text into an address space:
> > > > > >> mmap().
> > > > > >>
> > > > > >> On x86, you can mmap() an existing file full of executable code PROT_EXEC
> > > > > >> and jump to it with minimal synchronization (just the standard implicit
> > > > > >> ordering in the kernel that populates the pages before setting up the
> > > > > >> PTEs and whatever user synchronization is needed to avoid jumping into
> > > > > >> the mapping before mmap() finishes).  It works across CPUs, and the only
> > > > > >> possible way userspace can screw it up (for a read-only mapping of
> > > > > >> read-only text, anyway) is to jump to the mapping too early, in which
> > > > > >> case userspace gets a page fault.  Incoherence is impossible, and no one
> > > > > >> needs to "serialize" (in the SDM sense).
> > > > > >>
> > > > > >> I think the same sequence (from userspace's perspective) works on other
> > > > > >> architectures, too, although I think more cache management is needed on
> > > > > >> the kernel's end.  As far as I know, no Linux SMP architecture needs an
> > > > > >> IPI to map executable text into usermode, but I could easily be wrong.
> > > > > >> (IIRC RISC-V has very developer-unfriendly icache management, but I don't
> > > > > >> remember the details.)
> > > > > >>
> > > > > >> Of course, using ptrace or any other FOLL_FORCE to modify text on x86 is
> > > > > >> rather fraught, and I bet many things do it wrong when userspace is
> > > > > >> multithreaded.  But not in production because it's mostly not used in
> > > > > >> production.)
> > > > > >>
> > > > > >> But jit_text_alloc() can't do this, because the order of operations
> > > > > >> doesn't match.  With jit_text_alloc(), the executable mapping shows up
> > > > > >> before the text is populated, so there is no atomic change from not-there
> > > > > >> to populated-and-executable.  Which means that there is an opportunity
> > > > > >> for CPUs, speculatively or otherwise, to start filling various caches
> > > > > >> with intermediate states of the text, which means that various
> > > > > >> architectures (even x86!) may need serialization.
> > > > > >>
> > > > > >> For eBPF- and module- like use cases, where JITting/code gen is quite
> > > > > >> coarse-grained, perhaps something vaguely like:
> > > > > >>
> > > > > >> jit_text_alloc() -> returns a handle and an executable virtual address,
> > > > > >> but does *not* map it there
> > > > > >> jit_text_write() -> write to that handle
> > > > > >> jit_text_map() -> map it and synchronize if needed (no sync needed on
> > > > > >> x86, I think)
> > > > > >>
> > > > > >> could be more efficient and/or safer.
> > > > > >>
> > > > > >> (Modules could use this too.  Getting alternatives right might take some
> > > > > >> fiddling, because off the top of my head, this doesn't match how it works
> > > > > >> now.)
> > > > > >>
> > > > > >> To make alternatives easier, this could work, maybe (haven't fully
> > > > > >> thought it through):
> > > > > >>
> > > > > >> jit_text_alloc()
> > > > > >> jit_text_map_rw_inplace() -> map at the target address, but RW, !X
> > > > > >>
> > > > > >> write the text and apply alternatives
> > > > > >>
> > > > > >> jit_text_finalize() -> change from RW to RX *and synchronize*
> > > > > >>
> > > > > >> jit_text_finalize() would either need to wait for RCU (possibly extra
> > > > > >> heavy weight RCU to get "serialization") or send an IPI.
> > > > > >
> > > > > > This essentially how modules work now. The memory is allocated RW, written
> > > > > > and updated with alternatives and then made ROX in the end with set_memory
> > > > > > APIs.
> > > > > >
> > > > > > The issue with not having the memory mapped X when it's written is that we
> > > > > > cannot use large pages to map it. One of the goals is to have executable
> > > > > > memory mapped with large pages and make code allocator able to divide that
> > > > > > page among several callers.
> > > > > >
> > > > > > So the idea was that jit_text_alloc() will have a cache of large pages
> > > > > > mapped ROX, will allocate memory from those caches and there will be
> > > > > > jit_update() that uses text poking for writing to that memory.
> > > > > >
> > > > > > Upon allocation of a large page to increase the cache, that large page will
> > > > > > be "invalidated" by filling it with breakpoint instructions (e.g int3 on
> > > > > > x86)
> > > > >
> > > > > Is this actually valid?  In between int3 and real code, there’s a
> > > > > potential torn read of real code mixed up with 0xcc.
> > > >
> > > > You mean while doing text poking?
> > >
> > > I think we've been getting distracted by text_poke(). text_poke() does
> > > updates via a different virtual address which introduce new
> > > synchroniation wrinkles, but it's not the main issue.
> > >
> > > As _think_ I understand it, the root of the issue is that speculative
> > > execution - and that per Andy, speculative execution doesn't obey memory
> > > barriers.
> > >
> > > I have _not_ dug into the details of how retpolines work and all the
> > > spectre stuff that was going on, but - retpoline uses lfence, doesn't
> > > it? And if speculative execution is the issue here, isn't retpoline what
> > > we need?
> > >
> > > For this particular issue, I'm not sure "invalidate by filling with
> > > illegal instructions" makes sense. For that to work, would the processor
> > > have to execute a serialize operation and a retry on hitting an illegal
> > > instruction - or perhaps we do in the interrupt handler?
> > >
> > > But if filling with illegal instructions does act as a speculation
> > > barrier, then the issue is that a torn read could generate a legal but
> > > incorrect instruction.
> >
> > What is a "torn read" here? I assume it is an instruction read that
> > goes at the wrong instruction boundary (CISC). If this is correct, do
> > we need to handle torn read caused by software bug, or hardware
> > bit flip, or both?
> 
> On ARM64 (RISC), torn reads can't happen because the instruction fetch
> is word aligned. If we replace the whole instruction atomically then there
> won't be half old - half new instruction fetches.

Unfortunately, that's only guaranteed for a subset of instructions (e.g. B,
NOP), and in general CPUs can fetch an instruction multiple times, and could
fetch arbitrary portions of the instruction each time.

Please see the "Concurrent Modification and Execution of instructions" rules in
the ARM ARM.

For arm64, in general, you need to inhibit any concurrent execution (e.g. by
stopping-the-world) when patching text, and afterwards you need cache maintence
followed by a context-syncrhonization-event (aking to an x86 serializing
instruction) on CPUs which will execute the new instruction(s).

There are a bunch of special cases where we can omit some of that, but in
general the architectural guarnatees are *very* weak and require SW to perform
several bits of work to guarantee the new instructions will be executed without issues.

Thanks,
Mark.
