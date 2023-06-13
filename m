Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B827672EB8A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 21:05:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UteSpuaA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgdLL4Y3Yz3bTV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 05:05:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UteSpuaA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.25; helo=out-25.mta1.migadu.com; envelope-from=kent.overstreet@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 489 seconds by postgrey-1.37 at boromir; Wed, 14 Jun 2023 05:04:53 AEST
Received: from out-25.mta1.migadu.com (out-25.mta1.migadu.com [95.215.58.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgdKK3J7Wz2y1T
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 05:04:52 +1000 (AEST)
Date: Tue, 13 Jun 2023 14:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1686682581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cI/+VKexODe7tgazUH0uBbszHN+Sh5VjQJKMcYicSKU=;
	b=UteSpuaAfbQ2NCJDHT0DaE6LH+0KCxqxliA1u1CiHpYLEp/BHx0yHT4z2wyOm1k0K155IH
	1TdtqXMsJtk9bqAzUZ31aQXTksL2s2n1Q4RGfHebraQUDr3MhWO8yy+4wsaox2mGxQ3YRe
	XgmITo5ci4OCni1zywcC85bIuHv1vdI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
Message-ID: <ZIi7zmey0w61EG25@moria.home.lan>
References: <20230601101257.530867-1-rppt@kernel.org>
 <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan>
 <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
 <20230605092040.GB3460@kernel.org>
 <ZH20XkD74prrdN4u@FVFF77S0Q05N>
 <CAPhsuW7ntn_HpVWdGK_hYVd3zsPEFToBNfmtt0m6K8SwfxJ66Q@mail.gmail.com>
 <20230608184116.GJ52412@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230608184116.GJ52412@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 08, 2023 at 09:41:16PM +0300, Mike Rapoport wrote:
> On Tue, Jun 06, 2023 at 11:21:59AM -0700, Song Liu wrote:
> > On Mon, Jun 5, 2023 at 3:09 AM Mark Rutland <mark.rutland@arm.com> wrote:
> > 
> > [...]
> > 
> > > > > > Can you give more detail on what parameters you need? If the only extra
> > > > > > parameter is just "does this allocation need to live close to kernel
> > > > > > text", that's not that big of a deal.
> > > > >
> > > > > My thinking was that we at least need the start + end for each caller. That
> > > > > might be it, tbh.
> > > >
> > > > Do you mean that modules will have something like
> > > >
> > > >       jit_text_alloc(size, MODULES_START, MODULES_END);
> > > >
> > > > and kprobes will have
> > > >
> > > >       jit_text_alloc(size, KPROBES_START, KPROBES_END);
> > > > ?
> > >
> > > Yes.
> > 
> > How about we start with two APIs:
> >      jit_text_alloc(size);
> >      jit_text_alloc_range(size, start, end);
> > 
> > AFAICT, arm64 is the only arch that requires the latter API. And TBH, I am
> > not quite convinced it is needed.
>  
> Right now arm64 and riscv override bpf and kprobes allocations to use the
> entire vmalloc address space, but having the ability to allocate generated
> code outside of modules area may be useful for other architectures.
> 
> Still the start + end for the callers feels backwards to me because the
> callers do not define the ranges, but rather the architectures, so we still
> need a way for architectures to define how they want allocate memory for
> the generated code.

So, the start + end just comes from the need to keep relative pointers
under a certain size. I think this could be just a flag, I see no reason
to expose actual addresses here.
