Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBD8938A31
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 09:37:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V5rEoxjJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSBvl57dBz3cTj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 17:37:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V5rEoxjJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSBv40qJdz3byP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2024 17:37:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7105ECE0B0A;
	Mon, 22 Jul 2024 07:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C14EC116B1;
	Mon, 22 Jul 2024 07:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721633837;
	bh=Dxslf8J1nw2EoO1825aVEeJAxLrpHgQU1wjgg+XF/0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V5rEoxjJyp8Si4Ol1tKmDHfxujD1M6arK5yB3md41TgtMqzL7133QUbpMAiRqALI8
	 zHqP2jnhANmIGx1K6HRYtObkAQqmVJ2vQFti7pCzHaOzz0dds7xFt2urt534cJHiXw
	 CurmUQ1pi3n/TpSSCUqTSIn7TV/EpAfGuHiiiLk6U01osyb6JXJ0yznQ72y9r7YmE5
	 p6fsNYiqRdEsZWZ4qQtfi/2IxHr6rbbdo6JlW+fM0tWjobtA9os1Uj3kz7eGY4SLEa
	 ISuNDqsn9MvH468ghs8RFDYohLKYRIm2o5BjdJ/Ni63NJJU1x+XnEdyepZgDkMsXF7
	 by+28UouvqBSA==
Date: Mon, 22 Jul 2024 10:34:06 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 02/17] MIPS: sgi-ip27: make NODE_DATA() the same as on
 all other architectures
Message-ID: <Zp4Lbh20_IHZ2I5n@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-3-rppt@kernel.org>
 <e57eca18-b66d-4b5d-9e73-8ab22f6bc747@redhat.com>
 <20240719153852.00003f44@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719153852.00003f44@Huawei.com>
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

On Fri, Jul 19, 2024 at 03:38:52PM +0100, Jonathan Cameron wrote:
> On Wed, 17 Jul 2024 16:32:59 +0200
> David Hildenbrand <david@redhat.com> wrote:
> 
> > On 16.07.24 13:13, Mike Rapoport wrote:
> > > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > > 
> > > sgi-ip27 is the only system that defines NODE_DATA() differently than
> > > the rest of NUMA machines.
> > > 
> > > Add node_data array of struct pglist pointers that will point to
> > > __node_data[node]->pglist and redefine NODE_DATA() to use node_data
> > > array.
> > > 
> > > This will allow pulling declaration of node_data to the generic mm code
> > > in the next commit.
> > > 
> > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > ---
> > >   arch/mips/include/asm/mach-ip27/mmzone.h | 5 ++++-
> > >   arch/mips/sgi-ip27/ip27-memory.c         | 5 ++++-
> > >   2 files changed, 8 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/mips/include/asm/mach-ip27/mmzone.h b/arch/mips/include/asm/mach-ip27/mmzone.h
> > > index 08c36e50a860..629c3f290203 100644
> > > --- a/arch/mips/include/asm/mach-ip27/mmzone.h
> > > +++ b/arch/mips/include/asm/mach-ip27/mmzone.h
> > > @@ -22,7 +22,10 @@ struct node_data {
> > >   
> > >   extern struct node_data *__node_data[];
> > >   
> > > -#define NODE_DATA(n)		(&__node_data[(n)]->pglist)
> > >   #define hub_data(n)		(&__node_data[(n)]->hub)
> > >   
> > > +extern struct pglist_data *node_data[];
> > > +
> > > +#define NODE_DATA(nid)		(node_data[nid])
> > > +
> > >   #endif /* _ASM_MACH_MMZONE_H */
> > > diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
> > > index b8ca94cfb4fe..c30ef6958b97 100644
> > > --- a/arch/mips/sgi-ip27/ip27-memory.c
> > > +++ b/arch/mips/sgi-ip27/ip27-memory.c
> > > @@ -34,8 +34,10 @@
> > >   #define SLOT_PFNSHIFT		(SLOT_SHIFT - PAGE_SHIFT)
> > >   #define PFN_NASIDSHFT		(NASID_SHFT - PAGE_SHIFT)
> > >   
> > > -struct node_data *__node_data[MAX_NUMNODES];
> > > +struct pglist_data *node_data[MAX_NUMNODES];
> > > +EXPORT_SYMBOL(node_data);
> > >   
> > > +struct node_data *__node_data[MAX_NUMNODES];
> > >   EXPORT_SYMBOL(__node_data);
> > >   
> > >   static u64 gen_region_mask(void)
> > > @@ -361,6 +363,7 @@ static void __init node_mem_init(nasid_t node)
> > >   	 */
> > >   	__node_data[node] = __va(slot_freepfn << PAGE_SHIFT);
> > >   	memset(__node_data[node], 0, PAGE_SIZE);
> > > +	node_data[node] = &__node_data[node]->pglist;
> > >   
> > >   	NODE_DATA(node)->node_start_pfn = start_pfn;
> > >   	NODE_DATA(node)->node_spanned_pages = end_pfn - start_pfn;  
> > 
> > I was assuming we could get rid of __node_data->pglist.
> > 
> > But now I am confused where that is actually set.
> 
> It looks nasty... 

Nasty indeed :)

> Cast in arch_refresh_nodedata() takes incoming pg_data_t * and casts it
> to the local version of struct node_data * which I think is this one
> 
> struct node_data {
> 	struct pglist_data pglist; (which is pg_data_t pglist)
> 	struct hub_data hub;
> };
> 
> https://elixir.bootlin.com/linux/v6.10/source/arch/mips/sgi-ip27/ip27-memory.c#L432
> 
> Now that pg_data_t is allocated by 
> arch_alloc_nodedata() which might be fine (though types could be handled in a more
> readable fashion via some container_of() magic.
> https://elixir.bootlin.com/linux/v6.10/source/arch/mips/sgi-ip27/ip27-memory.c#L427
> 
> However that call is:
> pg_data_t * __init arch_alloc_nodedata(int nid)
> {
> 	return memblock_alloc(sizeof(pg_data_t), SMP_CACHE_BYTES);
> }
> 
> So doesn't seem to allocate enough space to me as should be sizeof(struct node_data)

Well, it's there to silence a compiler error (commit f8f9f21c7848 ("MIPS:
Fix build error for loongson64 and sgi-ip27")), but this is not a proper
fix :(
Luckily nothing calls cpumask_of_node() for offline nodes...
 
> Worth cleaning up whilst here?  Proper handling of types would definitely
> help.

Worth cleanup indeed, but I'd rather drop arch_alloc_nodedata() on MIPS
altogether.
 
> Jonathan

-- 
Sincerely yours,
Mike.
