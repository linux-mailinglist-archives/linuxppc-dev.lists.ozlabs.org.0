Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA27213758
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 11:12:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yq3N1HlrzDqwL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 19:12:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yq1G3191zDrCG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 19:10:10 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D1E3ADE4;
 Fri,  3 Jul 2020 09:10:03 +0000 (UTC)
Date: Fri, 3 Jul 2020 11:10:01 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v5 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
Message-ID: <20200703091001.GJ21462@kitsune.suse.cz>
References: <20200624092846.9194-1-srikar@linux.vnet.ibm.com>
 <20200624092846.9194-4-srikar@linux.vnet.ibm.com>
 <20200701084200.GN2369@dhcp22.suse.cz>
 <20200701100442.GB17918@linux.vnet.ibm.com>
 <184102af-ecf2-c834-db46-173ab2e66f51@redhat.com>
 <20200701110145.GC17918@linux.vnet.ibm.com>
 <0468f965-8762-76a3-93de-3987cf859927@redhat.com>
 <12945273-d788-710d-e8d7-974966529c7d@redhat.com>
 <20200701122110.GT2369@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701122110.GT2369@dhcp22.suse.cz>
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, Mel Gorman <mgorman@suse.de>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 01, 2020 at 02:21:10PM +0200, Michal Hocko wrote:
> On Wed 01-07-20 13:30:57, David Hildenbrand wrote:
> > On 01.07.20 13:06, David Hildenbrand wrote:
> > > On 01.07.20 13:01, Srikar Dronamraju wrote:
> > >> * David Hildenbrand <david@redhat.com> [2020-07-01 12:15:54]:
> > >>
> > >>> On 01.07.20 12:04, Srikar Dronamraju wrote:
> > >>>> * Michal Hocko <mhocko@kernel.org> [2020-07-01 10:42:00]:
> > >>>>
> > >>>>>
> > >>>>>>
> > >>>>>> 2. Also existence of dummy node also leads to inconsistent information. The
> > >>>>>> number of online nodes is inconsistent with the information in the
> > >>>>>> device-tree and resource-dump
> > >>>>>>
> > >>>>>> 3. When the dummy node is present, single node non-Numa systems end up showing
> > >>>>>> up as NUMA systems and numa_balancing gets enabled. This will mean we take
> > >>>>>> the hit from the unnecessary numa hinting faults.
> > >>>>>
> > >>>>> I have to say that I dislike the node online/offline state and directly
> > >>>>> exporting that to the userspace. Users should only care whether the node
> > >>>>> has memory/cpus. Numa nodes can be online without any memory. Just
> > >>>>> offline all the present memory blocks but do not physically hot remove
> > >>>>> them and you are in the same situation. If users are confused by an
> > >>>>> output of tools like numactl -H then those could be updated and hide
> > >>>>> nodes without any memory&cpus.
> > >>>>>
> > >>>>> The autonuma problem sounds interesting but again this patch doesn't
> > >>>>> really solve the underlying problem because I strongly suspect that the
> > >>>>> problem is still there when a numa node gets all its memory offline as
> > >>>>> mentioned above.
> 
> I would really appreciate a feedback to these two as well.
> 
> > >>>>> While I completely agree that making node 0 special is wrong, I have
> > >>>>> still hard time to review this very simply looking patch because all the
> > >>>>> numa initialization is so spread around that this might just blow up
> > >>>>> at unexpected places. IIRC we have discussed testing in the previous
> > >>>>> version and David has provided a way to emulate these configurations
> > >>>>> on x86. Did you manage to use those instruction for additional testing
> > >>>>> on other than ppc architectures?
> > >>>>>
> > >>>>
> > >>>> I have tried all the steps that David mentioned and reported back at
> > >>>> https://lore.kernel.org/lkml/20200511174731.GD1961@linux.vnet.ibm.com/t/#u
> > >>>>
> > >>>> As a summary, David's steps are still not creating a memoryless/cpuless on
> > >>>> x86 VM.
> > >>>
> > >>> Now, that is wrong. You get a memoryless/cpuless node, which is *not
> > >>> online*. Once you hotplug some memory, it will switch online. Once you
> > >>> remove memory, it will switch back offline.
> > >>>
> > >>
> > >> Let me clarify, we are looking for a node 0 which is cpuless/memoryless at
> > >> boot.  The code in question tries to handle a cpuless/memoryless node 0 at
> > >> boot.
> > > 
> > > I was just correcting your statement, because it was wrong.
> > > 
> > > Could be that x86 code maps PXM 1 to node 0 because PXM 1 does neither
> > > have CPUs nor memory. That would imply that we can, in fact, never have
> > > node 0 offline during boot.
> > > 
> > 
> > Yep, looks like it.
> > 
> > [    0.009726] SRAT: PXM 1 -> APIC 0x00 -> Node 0
> > [    0.009727] SRAT: PXM 1 -> APIC 0x01 -> Node 0
> > [    0.009727] SRAT: PXM 1 -> APIC 0x02 -> Node 0
> > [    0.009728] SRAT: PXM 1 -> APIC 0x03 -> Node 0
> > [    0.009731] ACPI: SRAT: Node 0 PXM 1 [mem 0x00000000-0x0009ffff]
> > [    0.009732] ACPI: SRAT: Node 0 PXM 1 [mem 0x00100000-0xbfffffff]
> > [    0.009733] ACPI: SRAT: Node 0 PXM 1 [mem 0x100000000-0x13fffffff]
> 
> This begs a question whether ppc can do the same thing?
Or x86 stop doing it so that you can see on what node you are running?

What's the point of this indirection other than another way of avoiding
empty node 0?

Thanks

Michal
