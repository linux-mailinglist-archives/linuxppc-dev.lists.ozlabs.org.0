Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 844759380B2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2024 12:27:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OSOw1h0I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WR2ms3KMZz3cZ0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2024 20:27:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OSOw1h0I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WR2m875YNz30W2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jul 2024 20:27:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 423DFCE021C;
	Sat, 20 Jul 2024 10:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39A7C2BD10;
	Sat, 20 Jul 2024 10:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721471235;
	bh=dVNVV+LbgZSpehO8np8DsTOCzJGiWq4UJOrsJg2zgCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OSOw1h0Ig/Sxo42NZVxgWqDg7PApDQPKQu7IqHtWulHzO5DZIoZUQKCkyr/Imoxko
	 Lntuo9YYc0lQcsGc+PRntWL+4q6xGqYrJQGqSwrQ2zZ1CtZ6MvlYyVAEJlaBtunrNO
	 F2DuSLx1QB9fjEK101QysRMhcJp+/gGJQsWj4+tgA87UM1Qqi7MiDFaIy33Yfgv/7x
	 VV0gk0bbejGKCDskyj6Yq3aWY4qrq3jL+EZ+nUCUWS3c3DH2vL/WRIeqbcd+hCBosA
	 QTOgUg+IY8NEEcUIVy6GfU3iS+hehOwAyUj7zAH7+pI+6MP+NYXBi6cf1MEyU9Ri4P
	 as0dGwXRHcDEg==
Date: Sat, 20 Jul 2024 13:24:06 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 05/17] arch, mm: pull out allocation of NODE_DATA to
 generic code
Message-ID: <ZpuQRgmrp-4deiur@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-6-rppt@kernel.org>
 <220da8ed-337a-4b1e-badf-2bff1d36e6c3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <220da8ed-337a-4b1e-badf-2bff1d36e6c3@redhat.com>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 17, 2024 at 04:42:48PM +0200, David Hildenbrand wrote:
> On 16.07.24 13:13, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Architectures that support NUMA duplicate the code that allocates
> > NODE_DATA on the node-local memory with slight variations in reporting
> > of the addresses where the memory was allocated.
> > 
> > Use x86 version as the basis for the generic alloc_node_data() function
> > and call this function in architecture specific numa initialization.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> 
> [...]
> 
> > diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> > index 9208eaadf690..909f6cec3a26 100644
> > --- a/arch/mips/loongson64/numa.c
> > +++ b/arch/mips/loongson64/numa.c
> > @@ -81,12 +81,8 @@ static void __init init_topology_matrix(void)
> >   static void __init node_mem_init(unsigned int node)
> >   {
> > -	struct pglist_data *nd;
> >   	unsigned long node_addrspace_offset;
> >   	unsigned long start_pfn, end_pfn;
> > -	unsigned long nd_pa;
> > -	int tnid;
> > -	const size_t nd_size = roundup(sizeof(pg_data_t), SMP_CACHE_BYTES);
> 
> One interesting change is that we now always round up to full pages on
> architectures where we previously rounded up to SMP_CACHE_BYTES.

I did some git archaeology and it seems that round up to full pages on x86
backdates to bootmem era when allocation granularity was PAGE_SIZE anyway.
I'm going to change that to SMP_CACHE_BYTES in v2.
 
> I assume we don't really expect a significant growth in memory consumption
> that we care about, especially because most systems with many nodes also
> have  quite some memory around.

-- 
Sincerely yours,
Mike.
