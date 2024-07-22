Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CD0938A80
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 09:55:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oG5YJpR0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSCHj5MHbz3cT7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 17:55:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oG5YJpR0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSCH23rv7z3byP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2024 17:54:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E9936027F;
	Mon, 22 Jul 2024 07:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDAAC116B1;
	Mon, 22 Jul 2024 07:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721634874;
	bh=OYRHdXxfKMdclKQlgCt5VIPfcSGA+/ROfi++yX8letM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oG5YJpR0vvG3aK5NTi3fHWDP8/wPCXQEHPpVI03jXrmGjAqE/3ek11pgDez93GupD
	 MYY5cht8NtUour0LZG0EOmrqfl/+OGAQSwhfArqnV9dkDfvXzt+BYN0GoRqQLdf0w8
	 YDUR98pajEJ8JNfue+NyDcAaZ9Iwtukzez1OaHeCmGruaLhg9UE9Wgr4pPcIvv5uiw
	 dIFU4pKtQYikq/zjd4jZhqdwQH73y8o8PB2Iwv4e6pw08hibJoHxG/W9t5i5ZVahkj
	 dZ6r/bQd4gp9OtjoJH+9/yH+xOhOU700mNl2aycElgfDFiCdhzErMhj4jiW1C3Hzxx
	 qgTOP+LBC9IQQ==
Date: Mon, 22 Jul 2024 10:51:25 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 06/17] x86/numa: simplify numa_distance allocation
Message-ID: <Zp4PfVZKAg3djFOu@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-7-rppt@kernel.org>
 <20240719172849.000019a0@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719172849.000019a0@Huawei.com>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 19, 2024 at 05:28:49PM +0100, Jonathan Cameron wrote:
> On Tue, 16 Jul 2024 14:13:35 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Allocation of numa_distance uses memblock_phys_alloc_range() to limit
> > allocation to be below the last mapped page.
> > 
> > But NUMA initializaition runs after the direct map is populated and
> 
> initialization (one too many 'i's)

Thanks.
 
> > there is also code in setup_arch() that adjusts memblock limit to
> > reflect how much memory is already mapped in the direct map.
> > 
> > Simplify the allocation of numa_distance and use plain memblock_alloc().
> > This makes the code clearer and ensures that when numa_distance is not
> > allocated it is always NULL.
> Doesn't this break the comment in numa_set_distance() kernel-doc?
> "
>  * If such table cannot be allocated, a warning is printed and further
>  * calls are ignored until the distance table is reset with
>  * numa_reset_distance().
> "
> 
> Superficially that looks to be to avoid repeatedly hitting the
> singleton bit at the top of numa_set_distance() as SRAT or similar
> parsing occurs.

I believe it's there to avoid allocation of numa_distance in the middle of
distance parsing (SLIT or DT numa-distance-map).

If the allocation fails for the first element in the table, the
numa_distance and numa_distance_cnt remain zero and node_distance() falls
back to

	return from == to ? LOCAL_DISTANCE : REMOTE_DISTANCE;

It's different from arch_numa that always tries to allocate MAX_NUMNODES *
MAX_NUMNODES for numa_distance and treats the allocation failure as a
failure to initialize NUMA.

I like the general approach x86 uses more, i.e. in case distance parsing
fails in some way NUMA is still initialized with probably suboptimal
distances between nodes.

I'm going to restore that "singleton" behavior for now and will look into
making this all less cumbersome later.
 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  arch/x86/mm/numa.c | 12 +++---------
> >  1 file changed, 3 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> > index 5e1dde26674b..ab2d4ecef786 100644
> > --- a/arch/x86/mm/numa.c
> > +++ b/arch/x86/mm/numa.c
> > @@ -319,8 +319,7 @@ void __init numa_reset_distance(void)
> >  {
> >  	size_t size = numa_distance_cnt * numa_distance_cnt * sizeof(numa_distance[0]);
> >  
> > -	/* numa_distance could be 1LU marking allocation failure, test cnt */
> > -	if (numa_distance_cnt)
> > +	if (numa_distance)
> >  		memblock_free(numa_distance, size);
> >  	numa_distance_cnt = 0;
> >  	numa_distance = NULL;	/* enable table creation */
> > @@ -331,7 +330,6 @@ static int __init numa_alloc_distance(void)
> >  	nodemask_t nodes_parsed;
> >  	size_t size;
> >  	int i, j, cnt = 0;
> > -	u64 phys;
> >  
> >  	/* size the new table and allocate it */
> >  	nodes_parsed = numa_nodes_parsed;
> > @@ -342,16 +340,12 @@ static int __init numa_alloc_distance(void)
> >  	cnt++;
> >  	size = cnt * cnt * sizeof(numa_distance[0]);
> >  
> > -	phys = memblock_phys_alloc_range(size, PAGE_SIZE, 0,
> > -					 PFN_PHYS(max_pfn_mapped));
> > -	if (!phys) {
> > +	numa_distance = memblock_alloc(size, PAGE_SIZE);
> > +	if (!numa_distance) {
> >  		pr_warn("Warning: can't allocate distance table!\n");
> > -		/* don't retry until explicitly reset */
> > -		numa_distance = (void *)1LU;
> >  		return -ENOMEM;
> >  	}
> >  
> > -	numa_distance = __va(phys);
> >  	numa_distance_cnt = cnt;
> >  
> >  	/* fill with the default distances */
> 
> 

-- 
Sincerely yours,
Mike.
