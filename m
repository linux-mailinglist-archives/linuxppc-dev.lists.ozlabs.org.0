Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E465F946D11
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Aug 2024 09:27:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KIU8LoVO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WcB3P67PBz3cW7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Aug 2024 17:27:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KIU8LoVO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WcB2h23fMz3c54
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Aug 2024 17:26:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8829660BD3;
	Sun,  4 Aug 2024 07:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD611C32786;
	Sun,  4 Aug 2024 07:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722756393;
	bh=rx2UdBu3Jn4YvMBlkSpIvWfaZAHG3g5eVDYxreRC0w8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KIU8LoVOwFPBw/i+e9r4MNw3lCZ9Vibx6Dii6JlG87646MCH9g5WB4uLhl1sgD8XY
	 fdhDH8dGci/plC04bp2qqqFN5dQbJHMWc6fWKJYivJ+bk5+GubVSlg3B3t+HSNIfir
	 JTwRTaCcEoGzTNU1jYvwPfIqnBAdwUe1xFf3HqAX19LfaXMjWdmtrEyuqIK93JEmBz
	 EFHb56nL5u7GvI90DNZwVtfaVmCpUg9fU4iOezzHPPuQFpcF1invnI5Iw9ThB6TUT4
	 ADe9mcgPXLgojRwwccp6Y65CANZWgRQC4iHBhVf31YxxkVq1gi+zDus1lvqFhKf27J
	 Jc+qx/YNiH/Gg==
Date: Sun, 4 Aug 2024 10:24:15 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 07/26] mm: drop CONFIG_HAVE_ARCH_NODEDATA_EXTENSION
Message-ID: <Zq8sn5iD1iOmYrss@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
 <20240801060826.559858-8-rppt@kernel.org>
 <20240802104922.000051a0@Huawei.com>
 <20240803115813.809f808f1afbe9f9feaae129@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240803115813.809f808f1afbe9f9feaae129@linux-foundation.org>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Vasily Gorbik <gor@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 03, 2024 at 11:58:13AM -0700, Andrew Morton wrote:
> On Fri, 2 Aug 2024 10:49:22 +0100 Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:
> 
> > > --- a/mm/mm_init.c
> > > +++ b/mm/mm_init.c
> > > @@ -1838,11 +1838,10 @@ void __init free_area_init(unsigned long *max_zone_pfn)
> > >  
> > >  		if (!node_online(nid)) {
> > >  			/* Allocator not initialized yet */
> > > -			pgdat = arch_alloc_nodedata(nid);
> > > +			pgdat = memblock_alloc(sizeof(*pgdat), SMP_CACHE_BYTES);
> > >  			if (!pgdat)
> > >  				panic("Cannot allocate %zuB for node %d.\n",
> > >  				       sizeof(*pgdat), nid);
> > > -			arch_refresh_nodedata(nid, pgdat);
> > 
> > This allocates pgdat but never sets node_data[nid] to it
> > and promptly leaks it on the line below. 
> > 
> > Just to sanity check this I spun up a qemu machine with no memory
> > initially present on some nodes and it went boom as you'd expect.
> > 
> > I tested with addition of
> > 			NODE_DATA(nid) = pgdat;
> > and it all seems to work as expected.
> 
> Thanks, I added that.  It blew up on x86_64 allnoconfig because
> node_data[] (and hence NODE_DATA()) isn't an lvalue when CONFIG_NUMA=n.
> 
> I'll put some #ifdef CONFIG_NUMAs in there for now but
> 
> a) NODE_DATA() is upper-case. Implies "constant".  Shouldn't be assigned to.
> 
> b) NODE_DATA() should be non-lvalue when CONFIG_NUMA=y also.  But no,
>    we insist on implementing things in cpp instead of in C.

This looks like a candidate for a separate tree-wide cleanup.
 
> c) In fact assigning to anything which ends in "()" is nuts.  Please
>    clean up my tempfix.
> 
> c) Mike, generally I'm wondering if there's a bunch of code here
>    which isn't needed on CONFIG_NUMA=n.  Please check all of this for
>    unneeded bloatiness.

I believe the patch addresses your concerns, just with this the commit log
needs update. Instead of 

    Replace the call to arch_alloc_nodedata() in free_area_init() with
    memblock_alloc(), remove arch_refresh_nodedata() and cleanup
    include/linux/memory_hotplug.h from the associated ifdefery.

it should be

    Replace the call to arch_alloc_nodedata() in free_area_init() with a
    new helper alloc_offline_node_data(), remove arch_refresh_nodedata()
    and cleanup include/linux/memory_hotplug.h from the associated
    ifdefery.

I can send an updated patch if you prefer.

diff --git a/include/linux/numa.h b/include/linux/numa.h
index 3b12d8ca0afd..5a749fd67f39 100644
--- a/include/linux/numa.h
+++ b/include/linux/numa.h
@@ -34,6 +34,7 @@ extern struct pglist_data *node_data[];
 #define NODE_DATA(nid)	(node_data[nid])
 
 void __init alloc_node_data(int nid);
+void __init alloc_offline_node_data(int nit);
 
 /* Generic implementation available */
 int numa_nearest_node(int node, unsigned int state);
@@ -62,6 +63,8 @@ static inline int phys_to_target_node(u64 start)
 {
 	return 0;
 }
+
+static inline void alloc_offline_node_data(int nit) {}
 #endif
 
 #define numa_map_to_online_node(node) numa_nearest_node(node, N_ONLINE)
diff --git a/mm/mm_init.c b/mm/mm_init.c
index bcc2f2dd8021..2785be04e7bb 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1836,13 +1836,8 @@ void __init free_area_init(unsigned long *max_zone_pfn)
 	for_each_node(nid) {
 		pg_data_t *pgdat;
 
-		if (!node_online(nid)) {
-			/* Allocator not initialized yet */
-			pgdat = memblock_alloc(sizeof(*pgdat), SMP_CACHE_BYTES);
-			if (!pgdat)
-				panic("Cannot allocate %zuB for node %d.\n",
-				       sizeof(*pgdat), nid);
-		}
+		if (!node_online(nid))
+			alloc_offline_node_data(nid);
 
 		pgdat = NODE_DATA(nid);
 		free_area_init_node(nid);
diff --git a/mm/numa.c b/mm/numa.c
index da27eb151dc5..07e486a977c7 100644
--- a/mm/numa.c
+++ b/mm/numa.c
@@ -34,6 +34,18 @@ void __init alloc_node_data(int nid)
 	memset(NODE_DATA(nid), 0, sizeof(pg_data_t));
 }
 
+void __init alloc_offline_node_data(int nit)
+{
+	pg_data_t *pgdat;
+
+	pgdat = memblock_alloc(sizeof(*pgdat), SMP_CACHE_BYTES);
+	if (!pgdat)
+		panic("Cannot allocate %zuB for node %d.\n",
+		      sizeof(*pgdat), nid);
+
+	node_data[nid] = pgdat;
+}
+
 /* Stub functions: */
 
 #ifndef memory_add_physaddr_to_nid

 

-- 
Sincerely yours,
Mike.
