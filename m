Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C4B7C540
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 16:45:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zGSJ28zWzDqkf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 00:45:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=mhocko@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zGMQ1HxpzDqkb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2019 00:41:21 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E6CFCB0C6;
 Wed, 31 Jul 2019 14:41:17 +0000 (UTC)
Date: Wed, 31 Jul 2019 16:41:14 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: microblaze HAVE_MEMBLOCK_NODE_MAP dependency (was Re: [PATCH v2
 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by default for NUMA)
Message-ID: <20190731144114.GY9330@dhcp22.suse.cz>
References: <20190712150007.GU29483@dhcp22.suse.cz>
 <730368c5-1711-89ae-e3ef-65418b17ddc9@os.amperecomputing.com>
 <20190730081415.GN9330@dhcp22.suse.cz>
 <20190731062420.GC21422@rapoport-lnx>
 <20190731080309.GZ9330@dhcp22.suse.cz>
 <20190731111422.GA14538@rapoport-lnx>
 <20190731114016.GI9330@dhcp22.suse.cz>
 <20190731122631.GB14538@rapoport-lnx>
 <20190731130037.GN9330@dhcp22.suse.cz>
 <20190731142129.GA24998@rapoport-lnx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731142129.GA24998@rapoport-lnx>
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
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, "H . Peter Anvin" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Will Deacon <will@kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, "willy@infradead.org" <willy@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Hoan Tran OS <hoan@os.amperecomputing.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will.deacon@arm.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 31-07-19 17:21:29, Mike Rapoport wrote:
> On Wed, Jul 31, 2019 at 03:00:37PM +0200, Michal Hocko wrote:
> > On Wed 31-07-19 15:26:32, Mike Rapoport wrote:
> > > On Wed, Jul 31, 2019 at 01:40:16PM +0200, Michal Hocko wrote:
> > > > On Wed 31-07-19 14:14:22, Mike Rapoport wrote:
> > > > > On Wed, Jul 31, 2019 at 10:03:09AM +0200, Michal Hocko wrote:
> > > > > > On Wed 31-07-19 09:24:21, Mike Rapoport wrote:
> > > > > > > [ sorry for a late reply too, somehow I missed this thread before ]
> > > > > > > 
> > > > > > > On Tue, Jul 30, 2019 at 10:14:15AM +0200, Michal Hocko wrote:
> > > > > > > > [Sorry for a late reply]
> > > > > > > > 
> > > > > > > > On Mon 15-07-19 17:55:07, Hoan Tran OS wrote:
> > > > > > > > > Hi,
> > > > > > > > > 
> > > > > > > > > On 7/12/19 10:00 PM, Michal Hocko wrote:
> > > > > > > > [...]
> > > > > > > > > > Hmm, I thought this was selectable. But I am obviously wrong here.
> > > > > > > > > > Looking more closely, it seems that this is indeed only about
> > > > > > > > > > __early_pfn_to_nid and as such not something that should add a config
> > > > > > > > > > symbol. This should have been called out in the changelog though.
> > > > > > > > > 
> > > > > > > > > Yes, do you have any other comments about my patch?
> > > > > > > > 
> > > > > > > > Not really. Just make sure to explicitly state that
> > > > > > > > CONFIG_NODES_SPAN_OTHER_NODES is only about __early_pfn_to_nid and that
> > > > > > > > doesn't really deserve it's own config and can be pulled under NUMA.
> > > > > > > > 
> > > > > > > > > > Also while at it, does HAVE_MEMBLOCK_NODE_MAP fall into a similar
> > > > > > > > > > bucket? Do we have any NUMA architecture that doesn't enable it?
> > > > > > > > > > 
> > > > > > > 
> > > > > > > HAVE_MEMBLOCK_NODE_MAP makes huge difference in node/zone initialization
> > > > > > > sequence so it's not only about a singe function.
> > > > > > 
> > > > > > The question is whether we want to have this a config option or enable
> > > > > > it unconditionally for each NUMA system.
> > > > > 
> > > > > We can make it 'default NUMA', but we can't drop it completely because
> > > > > microblaze uses sparse_memory_present_with_active_regions() which is
> > > > > unavailable when HAVE_MEMBLOCK_NODE_MAP=n.
> > > > 
> > > > I suppose you mean that microblaze is using
> > > > sparse_memory_present_with_active_regions even without CONFIG_NUMA,
> > > > right?
> > > 
> > > Yes.
> > > 
> > > > I have to confess I do not understand that code. What is the deal
> > > > with setting node id there?
> > > 
> > > The sparse_memory_present_with_active_regions() iterates over
> > > memblock.memory regions and uses the node id of each region as the
> > > parameter to memory_present(). The assumption here is that sometime before
> > > each region was assigned a proper non-negative node id. 
> > > 
> > > microblaze uses device tree for memory enumeration and the current FDT code
> > > does memblock_add() that implicitly sets nid in memblock.memory regions to -1.
> > > 
> > > So in order to have proper node id passed to memory_present() microblaze
> > > has to call memblock_set_node() before it can use
> > > sparse_memory_present_with_active_regions().
> > 
> > I am sorry, but I still do not follow. Who is consuming that node id
> > information when NUMA=n. In other words why cannot we simply do
>  
> We can, I think nobody cared to change it.

It would be great if somebody with the actual HW could try it out.
I can throw a patch but I do not even have a cross compiler in my
toolbox.

> 
> > diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
> > index a015a951c8b7..3a47e8db8d1c 100644
> > --- a/arch/microblaze/mm/init.c
> > +++ b/arch/microblaze/mm/init.c
> > @@ -175,14 +175,9 @@ void __init setup_memory(void)
> >  
> >  		start_pfn = memblock_region_memory_base_pfn(reg);
> >  		end_pfn = memblock_region_memory_end_pfn(reg);
> > -		memblock_set_node(start_pfn << PAGE_SHIFT,
> > -				  (end_pfn - start_pfn) << PAGE_SHIFT,
> > -				  &memblock.memory, 0);
> > +		memory_present(0, start_pfn << PAGE_SHIFT, end_pfn << PAGE_SHIFT);
> 
> memory_present() expects pfns, the shift is not needed.

Right.

-- 
Michal Hocko
SUSE Labs
