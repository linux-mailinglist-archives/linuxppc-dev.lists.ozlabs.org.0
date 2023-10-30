Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E59547DB3CC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 08:02:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fyer+0uy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SJkj6516Bz3cP3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 18:02:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fyer+0uy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SJkhH2xBlz307y
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 18:01:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E4CE8CE12E4;
	Mon, 30 Oct 2023 07:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B1CC433C7;
	Mon, 30 Oct 2023 07:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698649274;
	bh=EmJn7V2xcCxlebppxaDAhU12OFutDZWRBy0vMaSrWuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fyer+0uyv1jhu2jxdwK+n1O2/sIgGI7ezOwxQC871hHJ3Cd/JKl9lBlO3pXltUpO2
	 tybWUbFkw8nG3yYnKj5NWsk/KsMeh5cYt2Zf06cFoE4cK0SwwSOQ0meQsCZJmwrLES
	 ZjfIwnoeXu/25/54cCJrG0ThSOL/VsSYVOr1W/9QTaMgDvrgblTvcHPZrDSbxEy8fw
	 AT95UrDI+b348FRlIe6JpCkizTZtGaE3kNe+nAOZWv5ZyGWJevSARlVxf0OsNjI/Uk
	 BM7kNTKVl9T3dS3d/hE9ctd5XEbBUeRh4TuIA6DuyqF/4ni+SgBncpCAAQy/vXTAcB
	 87xr+yc2RIXWg==
Date: Mon, 30 Oct 2023 09:00:53 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 04/13] mm/execmem, arch: convert remaining overrides
 of module_alloc to execmem
Message-ID: <20231030070053.GL2824@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-5-rppt@kernel.org>
 <20231023171420.GA4041@willie-the-truck>
 <20231026085800.GK2824@kernel.org>
 <20231026102438.GA6924@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026102438.GA6924@willie-the-truck>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?iso-8859-1?Q?Bj=F6rn_
 T=F6pel?= <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 26, 2023 at 11:24:39AM +0100, Will Deacon wrote:
> On Thu, Oct 26, 2023 at 11:58:00AM +0300, Mike Rapoport wrote:
> > On Mon, Oct 23, 2023 at 06:14:20PM +0100, Will Deacon wrote:
> > > On Mon, Sep 18, 2023 at 10:29:46AM +0300, Mike Rapoport wrote:
> > > > diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> > > > index dd851297596e..cd6320de1c54 100644
> > > > --- a/arch/arm64/kernel/module.c
> > > > +++ b/arch/arm64/kernel/module.c

...

> > > > -	if (module_direct_base) {
> > > > -		p = __vmalloc_node_range(size, MODULE_ALIGN,
> > > > -					 module_direct_base,
> > > > -					 module_direct_base + SZ_128M,
> > > > -					 GFP_KERNEL | __GFP_NOWARN,
> > > > -					 PAGE_KERNEL, 0, NUMA_NO_NODE,
> > > > -					 __builtin_return_address(0));
> > > > -	}
> > > > +	module_init_limits();
> > > 
> > > Hmm, this used to be run from subsys_initcall(), but now you're running
> > > it _really_ early, before random_init(), so randomization of the module
> > > space is no longer going to be very random if we don't have early entropy
> > > from the firmware or the CPU, which is likely to be the case on most SoCs.
> > 
> > Well, it will be as random as KASLR. Won't that be enough?
> 
> I don't think that's true -- we have the 'kaslr-seed' property for KASLR,
> but I'm not seeing anything like that for the module randomisation and I
> also don't see why we need to set these limits so early.

x86 needs execmem initialized before ftrace_init() so I thought it would be
best to setup execmem along with most of MM in mm_core_init().

I'll move execmem initialization for !x86 to a later point, say
core_initcall.
 
> Will

-- 
Sincerely yours,
Mike.
