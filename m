Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5230A71F17F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 20:15:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXDpK6xW8z3dxS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 04:15:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=heVebVBy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.20; helo=out-20.mta1.migadu.com; envelope-from=kent.overstreet@linux.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=heVebVBy;
	dkim-atps=neutral
Received: from out-20.mta1.migadu.com (out-20.mta1.migadu.com [95.215.58.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXDnS2WFGz3bZv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 04:15:06 +1000 (AEST)
Date: Thu, 1 Jun 2023 14:14:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1685643302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZJB8Y+qWnzDFm68SRo4Caqik2FMGAG+Lwf+CLh2n8l8=;
	b=heVebVByNmhUMsJ2WAULJ9HLAPC6refckfCUJY0WXx4hRhZsbaomDSDugjYWaWQ6LEkWdP
	Jvcs9tQIzXZc+0yCsv5NbHMBQcwZQ1wXx/fNbx6WxFVHuREaPuDV58w3hONj9KdJXnaniY
	jN/vCOKQCwHm3op0QMHWhM09SJgJWkM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
Message-ID: <ZHjgIH3aX9dCvVZc@moria.home.lan>
References: <20230601101257.530867-1-rppt@kernel.org>
 <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
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
Cc: x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David
  S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 01, 2023 at 05:12:03PM +0100, Mark Rutland wrote:
> For a while I have wanted to give kprobes its own allocator so that it can work
> even with CONFIG_MODULES=n, and so that it doesn't have to waste VA space in
> the modules area.
> 
> Given that, I think these should have their own allocator functions that can be
> provided independently, even if those happen to use common infrastructure.

How much memory can kprobes conceivably use? I think we also want to try
to push back on combinatorial new allocators, if we can.

> > Several architectures override module_alloc() because of various
> > constraints where the executable memory can be located and this causes
> > additional obstacles for improvements of code allocation.
> > 
> > This set splits code allocation from modules by introducing
> > jit_text_alloc(), jit_data_alloc() and jit_free() APIs, replaces call
> > sites of module_alloc() and module_memfree() with the new APIs and
> > implements core text and related allocation in a central place.
> > 
> > Instead of architecture specific overrides for module_alloc(), the
> > architectures that require non-default behaviour for text allocation must
> > fill jit_alloc_params structure and implement jit_alloc_arch_params() that
> > returns a pointer to that structure. If an architecture does not implement
> > jit_alloc_arch_params(), the defaults compatible with the current
> > modules::module_alloc() are used.
> 
> As above, I suspect that each of the callsites should probably be using common
> infrastructure, but I don't think that a single jit_alloc_arch_params() makes
> sense, since the parameters for each case may need to be distinct.

I don't see how that follows. The whole point of function parameters is
that they may be different :)

Can you give more detail on what parameters you need? If the only extra
parameter is just "does this allocation need to live close to kernel
text", that's not that big of a deal.
