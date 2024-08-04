Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA19B946F86
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Aug 2024 17:11:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WcNMX4fqZz3cjm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2024 01:11:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WcNLw41Rjz30TF
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Aug 2024 01:11:17 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WcNJB6tQWz6K5Vy;
	Sun,  4 Aug 2024 23:08:58 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id B33CF140A35;
	Sun,  4 Aug 2024 23:11:09 +0800 (CST)
Received: from localhost (10.195.244.131) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Sun, 4 Aug
 2024 16:11:08 +0100
Date: Sun, 4 Aug 2024 16:11:19 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v3 07/26] mm: drop CONFIG_HAVE_ARCH_NODEDATA_EXTENSION
Message-ID: <20240804161119.00003a02@Huawei.com>
In-Reply-To: <Zq8sn5iD1iOmYrss@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
	<20240801060826.559858-8-rppt@kernel.org>
	<20240802104922.000051a0@Huawei.com>
	<20240803115813.809f808f1afbe9f9feaae129@linux-foundation.org>
	<Zq8sn5iD1iOmYrss@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.244.131]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Vasily Gorbik <gor@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 4 Aug 2024 10:24:15 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> On Sat, Aug 03, 2024 at 11:58:13AM -0700, Andrew Morton wrote:
> > On Fri, 2 Aug 2024 10:49:22 +0100 Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:
> >   
> > > > --- a/mm/mm_init.c
> > > > +++ b/mm/mm_init.c
> > > > @@ -1838,11 +1838,10 @@ void __init free_area_init(unsigned long *max_zone_pfn)
> > > >  
> > > >  		if (!node_online(nid)) {
> > > >  			/* Allocator not initialized yet */
> > > > -			pgdat = arch_alloc_nodedata(nid);
> > > > +			pgdat = memblock_alloc(sizeof(*pgdat), SMP_CACHE_BYTES);
> > > >  			if (!pgdat)
> > > >  				panic("Cannot allocate %zuB for node %d.\n",
> > > >  				       sizeof(*pgdat), nid);
> > > > -			arch_refresh_nodedata(nid, pgdat);  
> > > 
> > > This allocates pgdat but never sets node_data[nid] to it
> > > and promptly leaks it on the line below. 
> > > 
> > > Just to sanity check this I spun up a qemu machine with no memory
> > > initially present on some nodes and it went boom as you'd expect.
> > > 
> > > I tested with addition of
> > > 			NODE_DATA(nid) = pgdat;
> > > and it all seems to work as expected.  
> > 
> > Thanks, I added that.  It blew up on x86_64 allnoconfig because
> > node_data[] (and hence NODE_DATA()) isn't an lvalue when CONFIG_NUMA=n.
> > 
> > I'll put some #ifdef CONFIG_NUMAs in there for now but
> > 
> > a) NODE_DATA() is upper-case. Implies "constant".  Shouldn't be assigned to.
> > 
> > b) NODE_DATA() should be non-lvalue when CONFIG_NUMA=y also.  But no,
> >    we insist on implementing things in cpp instead of in C.  
> 
> This looks like a candidate for a separate tree-wide cleanup.
>  
> > c) In fact assigning to anything which ends in "()" is nuts.  Please
> >    clean up my tempfix.
> > 
> > c) Mike, generally I'm wondering if there's a bunch of code here
> >    which isn't needed on CONFIG_NUMA=n.  Please check all of this for
> >    unneeded bloatiness.  
> 
> I believe the patch addresses your concerns, just with this the commit log
> needs update. Instead of 
> 
>     Replace the call to arch_alloc_nodedata() in free_area_init() with
>     memblock_alloc(), remove arch_refresh_nodedata() and cleanup
>     include/linux/memory_hotplug.h from the associated ifdefery.
> 
> it should be
> 
>     Replace the call to arch_alloc_nodedata() in free_area_init() with a
>     new helper alloc_offline_node_data(), remove arch_refresh_nodedata()
>     and cleanup include/linux/memory_hotplug.h from the associated
>     ifdefery.
> 
> I can send an updated patch if you prefer.
This solution looks good to me - except for a Freudian typo that means it won't
compile :)

Jonathan

> 
> diff --git a/include/linux/numa.h b/include/linux/numa.h
> index 3b12d8ca0afd..5a749fd67f39 100644
> --- a/include/linux/numa.h
> +++ b/include/linux/numa.h
> @@ -34,6 +34,7 @@ extern struct pglist_data *node_data[];
>  #define NODE_DATA(nid)	(node_data[nid])
>  
>  void __init alloc_node_data(int nid);
> +void __init alloc_offline_node_data(int nit);
>  
>  /* Generic implementation available */
>  int numa_nearest_node(int node, unsigned int state);
> @@ -62,6 +63,8 @@ static inline int phys_to_target_node(u64 start)
>  {
>  	return 0;
>  }
> +
> +static inline void alloc_offline_node_data(int nit) {}
nid
>  #endif
>  
>  #define numa_map_to_online_node(node) numa_nearest_node(node, N_ONLINE)
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index bcc2f2dd8021..2785be04e7bb 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1836,13 +1836,8 @@ void __init free_area_init(unsigned long *max_zone_pfn)
>  	for_each_node(nid) {
>  		pg_data_t *pgdat;
>  
> -		if (!node_online(nid)) {
> -			/* Allocator not initialized yet */
> -			pgdat = memblock_alloc(sizeof(*pgdat), SMP_CACHE_BYTES);
> -			if (!pgdat)
> -				panic("Cannot allocate %zuB for node %d.\n",
> -				       sizeof(*pgdat), nid);
> -		}
> +		if (!node_online(nid))
> +			alloc_offline_node_data(nid);
>  
>  		pgdat = NODE_DATA(nid);
>  		free_area_init_node(nid);
> diff --git a/mm/numa.c b/mm/numa.c
> index da27eb151dc5..07e486a977c7 100644
> --- a/mm/numa.c
> +++ b/mm/numa.c
> @@ -34,6 +34,18 @@ void __init alloc_node_data(int nid)
>  	memset(NODE_DATA(nid), 0, sizeof(pg_data_t));
>  }
>  
> +void __init alloc_offline_node_data(int nit)

nid

> +{
> +	pg_data_t *pgdat;
> +
> +	pgdat = memblock_alloc(sizeof(*pgdat), SMP_CACHE_BYTES);
> +	if (!pgdat)
> +		panic("Cannot allocate %zuB for node %d.\n",
> +		      sizeof(*pgdat), nid);
> +
> +	node_data[nid] = pgdat;
> +}
> +
>  /* Stub functions: */
>  
>  #ifndef memory_add_physaddr_to_nid
> 
>  
> 

