Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB618A1D46
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 20:07:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F6A8Ql6Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFnjM41BWz3vb0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 04:07:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F6A8Ql6Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b2; helo=out-178.mta1.migadu.com; envelope-from=kent.overstreet@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 357 seconds by postgrey-1.37 at boromir; Fri, 12 Apr 2024 04:06:53 AEST
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [IPv6:2001:41d0:203:375::b2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFnhY1hlBz3d2c
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 04:06:52 +1000 (AEST)
Date: Thu, 11 Apr 2024 14:00:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1712858430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hugd8ugKeGXlWiLmTwUcSwxtoNqEbzFWRyiumV4I0QI=;
	b=F6A8Ql6YjuHeVhFhvCjRCHtt6+j5Zmavb6rBRVS2UPMjaUzBr8Uy9YMXKrMLS6Bdu93QAe
	+1JDwGCXhSmYXVX/GYkUtjra2ilUH2ndkI9p7bCt0GDxnXoAiXvPRveKB1Tl7czCP5mSyl
	LwnxqSrFPBMBfyHHV7aQPCs6G/4zVIs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v4 00/15] mm: jit/text allocator
Message-ID: <v52bizaflxzrxqk2wtuek2m2juwbzr6jxnpzlvtswkarcaejow@kd7tygzbmijs>
References: <20240411160051.2093261-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411160051.2093261-1-rppt@kernel.org>
X-Migadu-Flow: FLOW_OUT
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, Luis Chamberlain <mcgrof@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen 
 <dinguyen@kernel.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 11, 2024 at 07:00:36PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> Hi,
> 
> Since v3 I looked into making execmem more of an utility toolbox, as we
> discussed at LPC with Mark Rutland, but it was getting more hairier than
> having a struct describing architecture constraints and a type identifying
> the consumer of execmem.
> 
> And I do think that having the description of architecture constraints for
> allocations of executable memory in a single place is better that having it
> spread all over the place.
> 
> The patches available via git:
> https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=execmem/v4
> 
> v4 changes:
> * rebase on v6.9-rc2
> * rename execmem_params to execmem_info and execmem_arch_params() to
>   execmem_arch_setup()
> * use single execmem_alloc() API instead of execmem_{text,data}_alloc() (Song)
> * avoid extra copy of execmem parameters (Rick)
> * run execmem_init() as core_initcall() except for the architectures that
>   may allocated text really early (currently only x86) (Will)
> * add acks for some of arm64 and riscv changes, thanks Will and Alexandre
> * new commits:
>   - drop call to kasan_alloc_module_shadow() on arm64 because it's not
>     needed anymore
>   - rename MODULE_START to MODULES_VADDR on MIPS
>   - use CONFIG_EXECMEM instead of CONFIG_MODULES on powerpc as per Christophe:
>     https://lore.kernel.org/all/79062fa3-3402-47b3-8920-9231ad05e964@csgroup.eu/
> 
> v3: https://lore.kernel.org/all/20230918072955.2507221-1-rppt@kernel.org
> * add type parameter to execmem allocation APIs
> * remove BPF dependency on modules
> 
> v2: https://lore.kernel.org/all/20230616085038.4121892-1-rppt@kernel.org
> * Separate "module" and "others" allocations with execmem_text_alloc()
> and jit_text_alloc()
> * Drop ROX entailment on x86
> * Add ack for nios2 changes, thanks Dinh Nguyen
> 
> v1: https://lore.kernel.org/all/20230601101257.530867-1-rppt@kernel.org
> 
> = Cover letter from v1 (sligtly updated) =
> 
> module_alloc() is used everywhere as a mean to allocate memory for code.
> 
> Beside being semantically wrong, this unnecessarily ties all subsystmes
> that need to allocate code, such as ftrace, kprobes and BPF to modules and
> puts the burden of code allocation to the modules code.
> 
> Several architectures override module_alloc() because of various
> constraints where the executable memory can be located and this causes
> additional obstacles for improvements of code allocation.
> 
> A centralized infrastructure for code allocation allows allocations of
> executable memory as ROX, and future optimizations such as caching large
> pages for better iTLB performance and providing sub-page allocations for
> users that only need small jit code snippets.
> 
> Rick Edgecombe proposed perm_alloc extension to vmalloc [1] and Song Liu
> proposed execmem_alloc [2], but both these approaches were targeting BPF
> allocations and lacked the ground work to abstract executable allocations
> and split them from the modules core.
> 
> Thomas Gleixner suggested to express module allocation restrictions and
> requirements as struct mod_alloc_type_params [3] that would define ranges,
> protections and other parameters for different types of allocations used by
> modules and following that suggestion Song separated allocations of
> different types in modules (commit ac3b43283923 ("module: replace
> module_layout with module_memory")) and posted "Type aware module
> allocator" set [4].
> 
> I liked the idea of parametrising code allocation requirements as a
> structure, but I believe the original proposal and Song's module allocator
> was too module centric, so I came up with these patches.
> 
> This set splits code allocation from modules by introducing execmem_alloc()
> and and execmem_free(), APIs, replaces call sites of module_alloc() and
> module_memfree() with the new APIs and implements core text and related
> allocations in a central place.
> 
> Instead of architecture specific overrides for module_alloc(), the
> architectures that require non-default behaviour for text allocation must
> fill execmem_info structure and implement execmem_arch_setup() that returns
> a pointer to that structure. If an architecture does not implement
> execmem_arch_setup(), the defaults compatible with the current
> modules::module_alloc() are used.
> 
> Since architectures define different restrictions on placement,
> permissions, alignment and other parameters for memory that can be used by
> different subsystems that allocate executable memory, execmem APIs
> take a type argument, that will be used to identify the calling subsystem
> and to allow architectures to define parameters for ranges suitable for that
> subsystem.
> 
> The new infrastructure allows decoupling of BPF, kprobes and ftrace from
> modules, and most importantly it paves the way for ROX allocations for
> executable memory.

It looks like you're just doing API cleanup first, then improving the
implementation later?

Patch set looks nice and clean; previous versions did seem to leak too
much arch/module details (or perhaps we were just bikeshedding too much
;) - but the API first approach is nice.

Looking forward to seeing this merged.
