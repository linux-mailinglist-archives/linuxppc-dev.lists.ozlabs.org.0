Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DEA7D80B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 12:25:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZyX3dszi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGMPz1512z3vjn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 21:25:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZyX3dszi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGMP14CXhz3dWl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 21:24:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 17FABB8077C;
	Thu, 26 Oct 2023 10:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1DD8C433C8;
	Thu, 26 Oct 2023 10:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698315889;
	bh=WN2YIA4Ghusd7FbmcNZrWw/oKLuywPkap4tOfxaAQ4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZyX3dsziPkRUXG2UWwCRe9pQvhY4J8EKCi1UMJicG8n+1K8kuqLhkCHInfodKwhzx
	 IGdZJx3E0WGYfJuhn5slU+daxFVHZfLRqURf8zRCQM4mPgPcJg6TqmPoqs/pWtOypa
	 aGTSZPjPNBzHwtWONSwhXj/25YMcitUcojHP1kRQ49c14Z4eV6Kpw2ampGhmL7G6Sm
	 v7J3Ia4FdxDhFLmdhSb20AH9mufPj5bcJmpVjmk+yiUwvbVfd/gsYS5NT3Ej9E93W4
	 br849v8H22PcC0TOPiwgXMZFArfvyVNNVM97V2kwDBdHjqJI1bEYt3iRHEo7Tm6Bk9
	 Y3kn5Rw8Exupg==
Date: Thu, 26 Oct 2023 11:24:39 +0100
From: Will Deacon <will@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v3 04/13] mm/execmem, arch: convert remaining overrides
 of module_alloc to execmem
Message-ID: <20231026102438.GA6924@willie-the-truck>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-5-rppt@kernel.org>
 <20231023171420.GA4041@willie-the-truck>
 <20231026085800.GK2824@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026085800.GK2824@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Thu, Oct 26, 2023 at 11:58:00AM +0300, Mike Rapoport wrote:
> On Mon, Oct 23, 2023 at 06:14:20PM +0100, Will Deacon wrote:
> > On Mon, Sep 18, 2023 at 10:29:46AM +0300, Mike Rapoport wrote:
> > > diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> > > index dd851297596e..cd6320de1c54 100644
> > > --- a/arch/arm64/kernel/module.c
> > > +++ b/arch/arm64/kernel/module.c
> > > @@ -20,6 +20,7 @@
> > >  #include <linux/random.h>
> > >  #include <linux/scs.h>
> > >  #include <linux/vmalloc.h>
> > > +#include <linux/execmem.h>
> > >  
> > >  #include <asm/alternative.h>
> > >  #include <asm/insn.h>
> > > @@ -108,46 +109,38 @@ static int __init module_init_limits(void)
> > >  
> > >  	return 0;
> > >  }
> > > -subsys_initcall(module_init_limits);
> > >  
> > > -void *module_alloc(unsigned long size)
> > > +static struct execmem_params execmem_params __ro_after_init = {
> > > +	.ranges = {
> > > +		[EXECMEM_DEFAULT] = {
> > > +			.flags = EXECMEM_KASAN_SHADOW,
> > > +			.alignment = MODULE_ALIGN,
> > > +		},
> > > +	},
> > > +};
> > > +
> > > +struct execmem_params __init *execmem_arch_params(void)
> > >  {
> > > -	void *p = NULL;
> > > +	struct execmem_range *r = &execmem_params.ranges[EXECMEM_DEFAULT];
> > >  
> > > -	/*
> > > -	 * Where possible, prefer to allocate within direct branch range of the
> > > -	 * kernel such that no PLTs are necessary.
> > > -	 */
> > 
> > Why are you removing this comment? I think you could just move it next
> > to the part where we set a 128MiB range.
>  
> Oops, my bad. Will add it back.

Thanks.

> > > -	if (module_direct_base) {
> > > -		p = __vmalloc_node_range(size, MODULE_ALIGN,
> > > -					 module_direct_base,
> > > -					 module_direct_base + SZ_128M,
> > > -					 GFP_KERNEL | __GFP_NOWARN,
> > > -					 PAGE_KERNEL, 0, NUMA_NO_NODE,
> > > -					 __builtin_return_address(0));
> > > -	}
> > > +	module_init_limits();
> > 
> > Hmm, this used to be run from subsys_initcall(), but now you're running
> > it _really_ early, before random_init(), so randomization of the module
> > space is no longer going to be very random if we don't have early entropy
> > from the firmware or the CPU, which is likely to be the case on most SoCs.
> 
> Well, it will be as random as KASLR. Won't that be enough?

I don't think that's true -- we have the 'kaslr-seed' property for KASLR,
but I'm not seeing anything like that for the module randomisation and I
also don't see why we need to set these limits so early.

Will
