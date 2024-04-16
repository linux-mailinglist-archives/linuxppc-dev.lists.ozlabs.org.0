Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D75D8A6505
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 09:24:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ekk8HCBF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJbBc00S9z3vZL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 17:24:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ekk8HCBF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJb9s4PBTz3bZ3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 17:23:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C866360BA0;
	Tue, 16 Apr 2024 07:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBECC113CE;
	Tue, 16 Apr 2024 07:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713252205;
	bh=ULqJjlTCraVJ0ruf913jYz2dlG1gS6UCOgmOiRdXRlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ekk8HCBFjthC7O7PxrFN7j/GM7z/nWOuO8k9QOUSLiGyz09GAO2cg64dmGZlUlds7
	 00Ewxyx3C6wcPZBoIkKGD6lbL3qbO2ksVpnRUlonLdQr9BhpV1yf7+bx9loZNn41At
	 rywVk+bWOXuipnXUZImOPnzXQlyIpQamAXCi97V5XEUtgpABiSiT97flmkQAEFDr7A
	 YcuRY0rwjZPTJIRXEph9PF+jUZc4mOVTGomsCx8EugJ6WC8EEbdEckfhASAJlczMAM
	 pEgjXqHCw7T7cVdoBUzlejwen9ZBJYRh+vjYrzCI4CZ6xsCi82SwkYS2yHPnvfOsma
	 Wo31Nl9r7Gz/Q==
Date: Tue, 16 Apr 2024 10:22:14 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
Message-ID: <Zh4nJp8rv1qRBs8m@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net>
 <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
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
Cc: x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, Luis Chamberlain <mcgrof@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.d
 ev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, "Bj\"orn T\"opel" <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 15, 2024 at 06:36:39PM +0100, Mark Rutland wrote:
> On Mon, Apr 15, 2024 at 09:52:41AM +0200, Peter Zijlstra wrote:
> > On Thu, Apr 11, 2024 at 07:00:41PM +0300, Mike Rapoport wrote:
> > > +/**
> > > + * enum execmem_type - types of executable memory ranges
> > > + *
> > > + * There are several subsystems that allocate executable memory.
> > > + * Architectures define different restrictions on placement,
> > > + * permissions, alignment and other parameters for memory that can be used
> > > + * by these subsystems.
> > > + * Types in this enum identify subsystems that allocate executable memory
> > > + * and let architectures define parameters for ranges suitable for
> > > + * allocations by each subsystem.
> > > + *
> > > + * @EXECMEM_DEFAULT: default parameters that would be used for types that
> > > + * are not explcitly defined.
> > > + * @EXECMEM_MODULE_TEXT: parameters for module text sections
> > > + * @EXECMEM_KPROBES: parameters for kprobes
> > > + * @EXECMEM_FTRACE: parameters for ftrace
> > > + * @EXECMEM_BPF: parameters for BPF
> > > + * @EXECMEM_TYPE_MAX:
> > > + */
> > > +enum execmem_type {
> > > +	EXECMEM_DEFAULT,
> > > +	EXECMEM_MODULE_TEXT = EXECMEM_DEFAULT,
> > > +	EXECMEM_KPROBES,
> > > +	EXECMEM_FTRACE,
> > > +	EXECMEM_BPF,
> > > +	EXECMEM_TYPE_MAX,
> > > +};
> > 
> > Can we please get a break-down of how all these types are actually
> > different from one another?
> > 
> > I'm thinking some platforms have a tiny immediate space (arm64 comes to
> > mind) and has less strict placement constraints for some of them?
> 
> Yeah, and really I'd *much* rather deal with that in arch code, as I have said
> several times.
> 
> For arm64 we have two bsaic restrictions: 
> 
> 1) Direct branches can go +/-128M
>    We can expand this range by having direct branches go to PLTs, at a
>    performance cost.
> 
> 2) PREL32 relocations can go +/-2G
>    We cannot expand this further.
> 
> * We don't need to allocate memory for ftrace. We do not use trampolines.
> 
> * Kprobes XOL areas don't care about either of those; we don't place any
>   PC-relative instructions in those. Maybe we want to in future.
> 
> * Modules care about both; we'd *prefer* to place them within +/-128M of all
>   other kernel/module code, but if there's no space we can use PLTs and expand
>   that to +/-2G. Since modules can refreence other modules, that ends up
>   actually being halved, and modules have to fit within some 2G window that
>   also covers the kernel.
> 
> * I'm not sure about BPF's requirements; it seems happy doing the same as
>   modules.

BPF are happy with vmalloc().
 
> So if we *must* use a common execmem allocator, what we'd reall want is our own
> types, e.g.
> 
> 	EXECMEM_ANYWHERE
> 	EXECMEM_NOPLT
> 	EXECMEM_PREL32
> 
> ... and then we use those in arch code to implement module_alloc() and friends.

I'm looking at execmem_types more as definition of the consumers, maybe I
should have named the enum execmem_consumer at the first place.

And the arch constrains defined in struct execmem_range describe how memory
should be allocated for each consumer.

These constraints are defined early at boot and remain static, so
initializing them once and letting a common allocator use them makes
perfect sense to me.

I agree that fallback_{start,end} are not ideal, but we have 3
architectures that have preferred and secondary range for modules. And arm
and powerpc use the same logic for kprobes as well, and I don't see why this
code should be duplicated.

And, for instance, if you decide to place PC-relative instructions if
kprobes XOL areas, you'd only need to update execmem_range for kprobes to
be more like the range for modules.

With central allocator it's easier to deal with the things like
VM_FLUSH_RESET_PERMS and caching of ROX memory and I think it will be more
maintainable that module_alloc(), alloc_insn_page() and
bpf_jit_alloc_exec() spread all over the place.
 
> Mark.

-- 
Sincerely yours,
Mike.
