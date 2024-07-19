Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89156937949
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 16:39:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQXPT3wl0z3cZR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2024 00:39:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQXP524Dmz3c4l
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jul 2024 00:39:01 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WQXMF48rrz6JBjL;
	Fri, 19 Jul 2024 22:37:29 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id D6E9D140684;
	Fri, 19 Jul 2024 22:38:53 +0800 (CST)
Received: from localhost (10.203.174.77) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 19 Jul
 2024 15:38:53 +0100
Date: Fri, 19 Jul 2024 15:38:52 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 02/17] MIPS: sgi-ip27: make NODE_DATA() the same as on
 all other architectures
Message-ID: <20240719153852.00003f44@Huawei.com>
In-Reply-To: <e57eca18-b66d-4b5d-9e73-8ab22f6bc747@redhat.com>
References: <20240716111346.3676969-1-rppt@kernel.org>
	<20240716111346.3676969-3-rppt@kernel.org>
	<e57eca18-b66d-4b5d-9e73-8ab22f6bc747@redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.174.77]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 17 Jul 2024 16:32:59 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 16.07.24 13:13, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > sgi-ip27 is the only system that defines NODE_DATA() differently than
> > the rest of NUMA machines.
> > 
> > Add node_data array of struct pglist pointers that will point to
> > __node_data[node]->pglist and redefine NODE_DATA() to use node_data
> > array.
> > 
> > This will allow pulling declaration of node_data to the generic mm code
> > in the next commit.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >   arch/mips/include/asm/mach-ip27/mmzone.h | 5 ++++-
> >   arch/mips/sgi-ip27/ip27-memory.c         | 5 ++++-
> >   2 files changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/mips/include/asm/mach-ip27/mmzone.h b/arch/mips/include/asm/mach-ip27/mmzone.h
> > index 08c36e50a860..629c3f290203 100644
> > --- a/arch/mips/include/asm/mach-ip27/mmzone.h
> > +++ b/arch/mips/include/asm/mach-ip27/mmzone.h
> > @@ -22,7 +22,10 @@ struct node_data {
> >   
> >   extern struct node_data *__node_data[];
> >   
> > -#define NODE_DATA(n)		(&__node_data[(n)]->pglist)
> >   #define hub_data(n)		(&__node_data[(n)]->hub)
> >   
> > +extern struct pglist_data *node_data[];
> > +
> > +#define NODE_DATA(nid)		(node_data[nid])
> > +
> >   #endif /* _ASM_MACH_MMZONE_H */
> > diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
> > index b8ca94cfb4fe..c30ef6958b97 100644
> > --- a/arch/mips/sgi-ip27/ip27-memory.c
> > +++ b/arch/mips/sgi-ip27/ip27-memory.c
> > @@ -34,8 +34,10 @@
> >   #define SLOT_PFNSHIFT		(SLOT_SHIFT - PAGE_SHIFT)
> >   #define PFN_NASIDSHFT		(NASID_SHFT - PAGE_SHIFT)
> >   
> > -struct node_data *__node_data[MAX_NUMNODES];
> > +struct pglist_data *node_data[MAX_NUMNODES];
> > +EXPORT_SYMBOL(node_data);
> >   
> > +struct node_data *__node_data[MAX_NUMNODES];
> >   EXPORT_SYMBOL(__node_data);
> >   
> >   static u64 gen_region_mask(void)
> > @@ -361,6 +363,7 @@ static void __init node_mem_init(nasid_t node)
> >   	 */
> >   	__node_data[node] = __va(slot_freepfn << PAGE_SHIFT);
> >   	memset(__node_data[node], 0, PAGE_SIZE);
> > +	node_data[node] = &__node_data[node]->pglist;
> >   
> >   	NODE_DATA(node)->node_start_pfn = start_pfn;
> >   	NODE_DATA(node)->node_spanned_pages = end_pfn - start_pfn;  
> 
> I was assuming we could get rid of __node_data->pglist.
> 
> But now I am confused where that is actually set.

It looks nasty... Cast in arch_refresh_nodedata() takes
incoming pg_data_t * and casts it to the local version of
struct node_data * which I think is this one

struct node_data {
	struct pglist_data pglist; (which is pg_data_t pglist)
	struct hub_data hub;
};

https://elixir.bootlin.com/linux/v6.10/source/arch/mips/sgi-ip27/ip27-memory.c#L432

Now that pg_data_t is allocated by 
arch_alloc_nodedata() which might be fine (though types could be handled in a more
readable fashion via some container_of() magic.
https://elixir.bootlin.com/linux/v6.10/source/arch/mips/sgi-ip27/ip27-memory.c#L427

However that call is:
pg_data_t * __init arch_alloc_nodedata(int nid)
{
	return memblock_alloc(sizeof(pg_data_t), SMP_CACHE_BYTES);
}

So doesn't seem to allocate enough space to me as should be sizeof(struct node_data)

Worth cleaning up whilst here?  Proper handling of types would definitely
help.

Jonathan


> 
> Anyhow
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> 

