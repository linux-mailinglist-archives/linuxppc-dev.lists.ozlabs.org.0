Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 977B8734945
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 01:15:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n8muyYIF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QkpfN2xP6z30P2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 09:15:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n8muyYIF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.54; helo=out-54.mta0.migadu.com; envelope-from=kent.overstreet@linux.dev; receiver=lists.ozlabs.org)
Received: from out-54.mta0.migadu.com (out-54.mta0.migadu.com [91.218.175.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QkpdN6tgcz302Q
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 09:14:46 +1000 (AEST)
Date: Sun, 18 Jun 2023 19:14:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1687130080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KNV5zwl+hLzM43CrYb9nr/b3a6OyCWH6RWURaog0Xso=;
	b=n8muyYIFu4NWn2jUrxuhNWtbUM5+mIauth+1Pc71A47mzFzPENac7CXSnCthrLOM9Mp8Vp
	ZC85r5mgKM1Z6DbUVT6Cjqrw0askzvY2hRQW+Cy+BiYrMDlad4Bi9in+atwC+gux88leWU
	Lsl3kE3f4XQNXRl/yeFL9WdFeIa4tAE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
Message-ID: <20230618231431.4aj3k5ujye22sqai@moria.home.lan>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-7-rppt@kernel.org>
 <87jzw0qu3s.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzw0qu3s.ffs@tglx>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 19, 2023 at 12:32:55AM +0200, Thomas Gleixner wrote:
> Mike!
> 
> Sorry for being late on this ...
> 
> On Fri, Jun 16 2023 at 11:50, Mike Rapoport wrote:
> >  
> > +void *execmem_data_alloc(size_t size)
> > +{
> > +	unsigned long start = execmem_params.modules.data.start;
> > +	unsigned long end = execmem_params.modules.data.end;
> > +	pgprot_t pgprot = execmem_params.modules.data.pgprot;
> > +	unsigned int align = execmem_params.modules.data.alignment;
> > +	unsigned long fallback_start = execmem_params.modules.data.fallback_start;
> > +	unsigned long fallback_end = execmem_params.modules.data.fallback_end;
> > +	bool kasan = execmem_params.modules.flags & EXECMEM_KASAN_SHADOW;
> 
> While I know for sure that you read up on the discussion I had with Song
> about data structures, it seems you completely failed to understand it.
> 
> > +	return execmem_alloc(size, start, end, align, pgprot,
> > +			     fallback_start, fallback_end, kasan);
> 
> Having _seven_ intermediate variables to fill _eight_ arguments of a
> function instead of handing in @size and a proper struct pointer is
> tasteless and disgusting at best.
> 
> Six out of those seven parameters are from:
> 
>     execmem_params.module.data
> 
> while the KASAN shadow part is retrieved from
> 
>     execmem_params.module.flags
> 
> So what prevents you from having a uniform data structure, which is
> extensible and decribes _all_ types of allocations?
> 
> Absolutely nothing. The flags part can either be in the type dependend
> part or you make the type configs an array as I had suggested originally
> and then execmem_alloc() becomes:
> 
> void *execmem_alloc(type, size)
> 
> and
> 
> static inline void *execmem_data_alloc(size_t size)
> {
>         return execmem_alloc(EXECMEM_TYPE_DATA, size);
> }
> 
> which gets the type independent parts from @execmem_param.
> 
> Just read through your own series and watch the evolution of
> execmem_alloc():
> 
>   static void *execmem_alloc(size_t size)
> 
>   static void *execmem_alloc(size_t size, unsigned long start,
>                              unsigned long end, unsigned int align,
>                              pgprot_t pgprot)
> 
>   static void *execmem_alloc(size_t len, unsigned long start,
>                              unsigned long end, unsigned int align,
>                              pgprot_t pgprot,
>                              unsigned long fallback_start,
>                              unsigned long fallback_end,
>                              bool kasan)
> 
> In a month from now this function will have _ten_ parameters and tons of
> horrible wrappers which convert an already existing data structure into
> individual function arguments.
> 
> Seriously?
> 
> If you want this function to be [ab]used outside of the exec_param
> configuration space for whatever non-sensical reasons then this still
> can be either:
> 
> void *execmem_alloc(params, type, size)
> 
> static inline void *execmem_data_alloc(size_t size)
> {
>         return execmem_alloc(&exec_param, EXECMEM_TYPE_DATA, size);
> }
> 
> or
> 
> void *execmem_alloc(type_params, size);
> 
> static inline void *execmem_data_alloc(size_t size)
> {
>         return execmem_alloc(&exec_param.data, size);
> }
> 
> which both allows you to provide alternative params, right?
> 
> Coming back to my conversation with Song:
> 
>    "Bad programmers worry about the code. Good programmers worry about
>     data structures and their relationships."

Thomas, you're confusing an internal interface with external, I made the
same mistake reviewing Song's patchset...
