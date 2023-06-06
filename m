Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A50B1723F1C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 12:17:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb5y036h5z3f6Z
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 20:17:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ex2boOSb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ex2boOSb;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb5x76GWtz3drq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 20:16:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8F6BF6250C;
	Tue,  6 Jun 2023 10:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16CCDC433EF;
	Tue,  6 Jun 2023 10:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686046599;
	bh=K3mQNwoT9j+uKtNH0+N5SGAruipqVMe0nyrOVYu8zmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ex2boOSbFX9F8vILoj2ER6OMGqZieI/qXxa+Cl88F6P5WueebucHT8gXYMljU/UwF
	 W4Vwtw16CB66Ckf8CUcEwiMgsp0Rl7Zp+sWmc7WhCTWF54CsHU5is7Yegd2qZ+FcpB
	 7HYr90xDXGc4Q+jlXpM3iwKf1+z1TAE79jym8dBpk7/sIwryEOoaJwZE+mZ+/dgO9Q
	 jbUZZ/yVspF9cToZ4ExktC3lUSHmqXSahqJcQT5b1PfE/IsSC9GrwIVg8JzQsfRBlA
	 +FWytBECVY5td4H8LIUSl6ZWwnci/X0OdWg6sGet7yNw0Tt3OFZ9/6khP83arPzxeP
	 mpCOpEPlPas8A==
Date: Tue, 6 Jun 2023 13:16:08 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
Message-ID: <20230606101608.GC52412@kernel.org>
References: <20230601101257.530867-1-rppt@kernel.org>
 <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan>
 <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
 <20230605092040.GB3460@kernel.org>
 <ZH20XkD74prrdN4u@FVFF77S0Q05N>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZH20XkD74prrdN4u@FVFF77S0Q05N>
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

On Mon, Jun 05, 2023 at 11:09:34AM +0100, Mark Rutland wrote:
> On Mon, Jun 05, 2023 at 12:20:40PM +0300, Mike Rapoport wrote:
> > On Fri, Jun 02, 2023 at 10:35:09AM +0100, Mark Rutland wrote:
> >
> > It sill can be achieved with a single jit_alloc_arch_params(), just by
> > adding enum jit_type parameter to jit_text_alloc().
> 
> That feels backwards to me; it centralizes a bunch of information about
> distinct users to be able to shove that into a static array, when the callsites
> can pass that information. 

The goal was not to shove everything into an array, but centralize
architecture requirements for code allocations. The callsites don't have
that information per se, they get it from the arch code, so having this
information in a single place per arch is better than spreading
MODULE_START, KPROBES_START etc all over.

I'd agree though that having types for jit_text_alloc is ugly and this
should be handled differently.
 
> What's *actually* common after separating out the ranges? Is it just the
> permissions?

On x86 everything, on arm64 apparently just the permissions.

I've started to summarize what are the restrictions for code placement for
modules, kprobes and bpf on different architectures, that's roughly what
I've got so far:

* x86 and s390 need everything within modules address space because of
PC-relative
* arm, arm64, loongarch, sparc64, riscv64, some of mips and
powerpc32 configurations require a dedicated modules address space; the
rest just use vmalloc address space
* all architectures that support kprobes except x86 and s390 don't use
relative jumps, so they don't care where kprobes insn_page will live
* not sure yet about BPF. Looks like on arm and arm64 it does not use
relative jumps, so it can be anywhere, didn't dig enough about the others.

> If we want this to be able to share allocations and so on, why can't we do this
> like a kmem_cache, and have the callsite pass a pointer to the allocator data?
> That would make it easy for callsites to share an allocator or use a distinct
> one.

This maybe something worth exploring.
 
> Thanks,
> Mark.

-- 
Sincerely yours,
Mike.
