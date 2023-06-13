Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB69272EDAB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 23:10:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZwHrH/Ut;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qgh6N5bWNz3bP2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 07:10:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZwHrH/Ut;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qgh5P6XPhz2xpl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 07:09:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 459FD63B01;
	Tue, 13 Jun 2023 21:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1CA2C433C0;
	Tue, 13 Jun 2023 21:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686690580;
	bh=CnDPIeLogwBWCfXwDFCGYSnn6freMhcPiMKmnauZmK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZwHrH/UtQy5gtJuV6CZdRxLuHzTaAkiUGIx/JgEU65AMLsBIKZ0sWdlw1vTEQYgdy
	 gSLYt19YIoeRBe5zYzLlgTuRTMMo3kgRmlRYZUwN9+y0DX2gj67q8Dp8pJtQUo0gHp
	 Oy60KuQPQMSSexOGqUQrMmT3Fgb1GBewXzaMMxDEmcoyUN9bNnKzEk/bEsVagentbs
	 IrjokONRoY0TE+yzqvQqq0avTQyKOfbb7gZycLtP7znx6sVR7tnvKBFHLqFKSVwEs2
	 kIA6GPsL9JTaWmKMWc1Wdyo1oerK/huG9zsVu6RfIYfLEAg8ULTJ9IL3DRtm5ddTXF
	 JrMlJp241w1cA==
Date: Wed, 14 Jun 2023 00:09:00 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
Message-ID: <20230613210900.GV52412@kernel.org>
References: <20230601101257.530867-1-rppt@kernel.org>
 <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan>
 <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
 <20230605092040.GB3460@kernel.org>
 <ZH20XkD74prrdN4u@FVFF77S0Q05N>
 <CAPhsuW7ntn_HpVWdGK_hYVd3zsPEFToBNfmtt0m6K8SwfxJ66Q@mail.gmail.com>
 <20230608184116.GJ52412@kernel.org>
 <ZIi7zmey0w61EG25@moria.home.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZIi7zmey0w61EG25@moria.home.lan>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 13, 2023 at 02:56:14PM -0400, Kent Overstreet wrote:
> On Thu, Jun 08, 2023 at 09:41:16PM +0300, Mike Rapoport wrote:
> > On Tue, Jun 06, 2023 at 11:21:59AM -0700, Song Liu wrote:
> > > On Mon, Jun 5, 2023 at 3:09 AM Mark Rutland <mark.rutland@arm.com> wrote:
> > > 
> > > [...]
> > > 
> > > > > > > Can you give more detail on what parameters you need? If the only extra
> > > > > > > parameter is just "does this allocation need to live close to kernel
> > > > > > > text", that's not that big of a deal.
> > > > > >
> > > > > > My thinking was that we at least need the start + end for each caller. That
> > > > > > might be it, tbh.
> > > > >
> > > > > Do you mean that modules will have something like
> > > > >
> > > > >       jit_text_alloc(size, MODULES_START, MODULES_END);
> > > > >
> > > > > and kprobes will have
> > > > >
> > > > >       jit_text_alloc(size, KPROBES_START, KPROBES_END);
> > > > > ?
> > > >
> > > > Yes.
> > > 
> > > How about we start with two APIs:
> > >      jit_text_alloc(size);
> > >      jit_text_alloc_range(size, start, end);
> > > 
> > > AFAICT, arm64 is the only arch that requires the latter API. And TBH, I am
> > > not quite convinced it is needed.
> >  
> > Right now arm64 and riscv override bpf and kprobes allocations to use the
> > entire vmalloc address space, but having the ability to allocate generated
> > code outside of modules area may be useful for other architectures.
> > 
> > Still the start + end for the callers feels backwards to me because the
> > callers do not define the ranges, but rather the architectures, so we still
> > need a way for architectures to define how they want allocate memory for
> > the generated code.
> 
> So, the start + end just comes from the need to keep relative pointers
> under a certain size. I think this could be just a flag, I see no reason
> to expose actual addresses here.

It's the other way around. The start + end comes from the need to restrict
allocation to certain range because of the relative addressing. I don't see
how a flag can help here.

-- 
Sincerely yours,
Mike.
