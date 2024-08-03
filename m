Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC066946AF2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2024 20:58:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=o5Y2Rmax;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WbsRz73tpz3d2m
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Aug 2024 04:58:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=o5Y2Rmax;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WbsRJ00nDz3cLl
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Aug 2024 04:58:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 45FFA614E5;
	Sat,  3 Aug 2024 18:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93706C116B1;
	Sat,  3 Aug 2024 18:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1722711495;
	bh=Tpqmomamf68VJd3BX6Aa+aldBw76MPQW/c629qHRnbg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=o5Y2RmaxDgbz57iITn10F1azWivNnKphArt1mFz2o1k24QgUghcLPFcCl4Skc3J7n
	 2U6mfRYJicjGnJ/Lcha0tyWotwjt/73kHML1EvfQheasAaHT4z+JnEhKa6yfFin34R
	 FpUPzEcCObDFHQbrY87xJxqJmIAHp6RYNOzd/x7s=
Date: Sat, 3 Aug 2024 11:58:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Subject: Re: [PATCH v3 07/26] mm: drop CONFIG_HAVE_ARCH_NODEDATA_EXTENSION
Message-Id: <20240803115813.809f808f1afbe9f9feaae129@linux-foundation.org>
In-Reply-To: <20240802104922.000051a0@Huawei.com>
References: <20240801060826.559858-1-rppt@kernel.org>
	<20240801060826.559858-8-rppt@kernel.org>
	<20240802104922.000051a0@Huawei.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Vasily Gorbik <gor@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2 Aug 2024 10:49:22 +0100 Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> > --- a/mm/mm_init.c
> > +++ b/mm/mm_init.c
> > @@ -1838,11 +1838,10 @@ void __init free_area_init(unsigned long *max_zone_pfn)
> >  
> >  		if (!node_online(nid)) {
> >  			/* Allocator not initialized yet */
> > -			pgdat = arch_alloc_nodedata(nid);
> > +			pgdat = memblock_alloc(sizeof(*pgdat), SMP_CACHE_BYTES);
> >  			if (!pgdat)
> >  				panic("Cannot allocate %zuB for node %d.\n",
> >  				       sizeof(*pgdat), nid);
> > -			arch_refresh_nodedata(nid, pgdat);
> 
> This allocates pgdat but never sets node_data[nid] to it
> and promptly leaks it on the line below. 
> 
> Just to sanity check this I spun up a qemu machine with no memory
> initially present on some nodes and it went boom as you'd expect.
> 
> I tested with addition of
> 			NODE_DATA(nid) = pgdat;
> and it all seems to work as expected.

Thanks, I added that.  It blew up on x86_64 allnoconfig because
node_data[] (and hence NODE_DATA()) isn't an lvalue when CONFIG_NUMA=n.

I'll put some #ifdef CONFIG_NUMAs in there for now but

a) NODE_DATA() is upper-case. Implies "constant".  Shouldn't be assigned to.

b) NODE_DATA() should be non-lvalue when CONFIG_NUMA=y also.  But no,
   we insist on implementing things in cpp instead of in C.

c) In fact assigning to anything which ends in "()" is nuts.  Please
   clean up my tempfix.

c) Mike, generally I'm wondering if there's a bunch of code here
   which isn't needed on CONFIG_NUMA=n.  Please check all of this for
   unneeded bloatiness.

