Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 907D87C4E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 16:26:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zG1p2NRVzDqg1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 00:26:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=rppt@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zFwv735WzDqjb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2019 00:21:51 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6VEEm4u112460
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 10:21:47 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2u3ck48d6k-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 10:21:46 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <rppt@linux.ibm.com>;
 Wed, 31 Jul 2019 15:21:44 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 31 Jul 2019 15:21:37 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6VELZYv35258606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Jul 2019 14:21:35 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32CF3A4066;
 Wed, 31 Jul 2019 14:21:34 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 958CCA406D;
 Wed, 31 Jul 2019 14:21:31 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.206.240])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 31 Jul 2019 14:21:31 +0000 (GMT)
Date: Wed, 31 Jul 2019 17:21:29 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: microblaze HAVE_MEMBLOCK_NODE_MAP dependency (was Re: [PATCH v2
 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by default for NUMA)
References: <20190712143730.au3662g4ua2tjudu@willie-the-truck>
 <20190712150007.GU29483@dhcp22.suse.cz>
 <730368c5-1711-89ae-e3ef-65418b17ddc9@os.amperecomputing.com>
 <20190730081415.GN9330@dhcp22.suse.cz>
 <20190731062420.GC21422@rapoport-lnx>
 <20190731080309.GZ9330@dhcp22.suse.cz>
 <20190731111422.GA14538@rapoport-lnx>
 <20190731114016.GI9330@dhcp22.suse.cz>
 <20190731122631.GB14538@rapoport-lnx>
 <20190731130037.GN9330@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731130037.GN9330@dhcp22.suse.cz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19073114-0028-0000-0000-00000389AADE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19073114-0029-0000-0000-00002449FC15
Message-Id: <20190731142129.GA24998@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-31_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907310144
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

On Wed, Jul 31, 2019 at 03:00:37PM +0200, Michal Hocko wrote:
> On Wed 31-07-19 15:26:32, Mike Rapoport wrote:
> > On Wed, Jul 31, 2019 at 01:40:16PM +0200, Michal Hocko wrote:
> > > On Wed 31-07-19 14:14:22, Mike Rapoport wrote:
> > > > On Wed, Jul 31, 2019 at 10:03:09AM +0200, Michal Hocko wrote:
> > > > > On Wed 31-07-19 09:24:21, Mike Rapoport wrote:
> > > > > > [ sorry for a late reply too, somehow I missed this thread before ]
> > > > > > 
> > > > > > On Tue, Jul 30, 2019 at 10:14:15AM +0200, Michal Hocko wrote:
> > > > > > > [Sorry for a late reply]
> > > > > > > 
> > > > > > > On Mon 15-07-19 17:55:07, Hoan Tran OS wrote:
> > > > > > > > Hi,
> > > > > > > > 
> > > > > > > > On 7/12/19 10:00 PM, Michal Hocko wrote:
> > > > > > > [...]
> > > > > > > > > Hmm, I thought this was selectable. But I am obviously wrong here.
> > > > > > > > > Looking more closely, it seems that this is indeed only about
> > > > > > > > > __early_pfn_to_nid and as such not something that should add a config
> > > > > > > > > symbol. This should have been called out in the changelog though.
> > > > > > > > 
> > > > > > > > Yes, do you have any other comments about my patch?
> > > > > > > 
> > > > > > > Not really. Just make sure to explicitly state that
> > > > > > > CONFIG_NODES_SPAN_OTHER_NODES is only about __early_pfn_to_nid and that
> > > > > > > doesn't really deserve it's own config and can be pulled under NUMA.
> > > > > > > 
> > > > > > > > > Also while at it, does HAVE_MEMBLOCK_NODE_MAP fall into a similar
> > > > > > > > > bucket? Do we have any NUMA architecture that doesn't enable it?
> > > > > > > > > 
> > > > > > 
> > > > > > HAVE_MEMBLOCK_NODE_MAP makes huge difference in node/zone initialization
> > > > > > sequence so it's not only about a singe function.
> > > > > 
> > > > > The question is whether we want to have this a config option or enable
> > > > > it unconditionally for each NUMA system.
> > > > 
> > > > We can make it 'default NUMA', but we can't drop it completely because
> > > > microblaze uses sparse_memory_present_with_active_regions() which is
> > > > unavailable when HAVE_MEMBLOCK_NODE_MAP=n.
> > > 
> > > I suppose you mean that microblaze is using
> > > sparse_memory_present_with_active_regions even without CONFIG_NUMA,
> > > right?
> > 
> > Yes.
> > 
> > > I have to confess I do not understand that code. What is the deal
> > > with setting node id there?
> > 
> > The sparse_memory_present_with_active_regions() iterates over
> > memblock.memory regions and uses the node id of each region as the
> > parameter to memory_present(). The assumption here is that sometime before
> > each region was assigned a proper non-negative node id. 
> > 
> > microblaze uses device tree for memory enumeration and the current FDT code
> > does memblock_add() that implicitly sets nid in memblock.memory regions to -1.
> > 
> > So in order to have proper node id passed to memory_present() microblaze
> > has to call memblock_set_node() before it can use
> > sparse_memory_present_with_active_regions().
> 
> I am sorry, but I still do not follow. Who is consuming that node id
> information when NUMA=n. In other words why cannot we simply do
 
We can, I think nobody cared to change it.

> diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
> index a015a951c8b7..3a47e8db8d1c 100644
> --- a/arch/microblaze/mm/init.c
> +++ b/arch/microblaze/mm/init.c
> @@ -175,14 +175,9 @@ void __init setup_memory(void)
>  
>  		start_pfn = memblock_region_memory_base_pfn(reg);
>  		end_pfn = memblock_region_memory_end_pfn(reg);
> -		memblock_set_node(start_pfn << PAGE_SHIFT,
> -				  (end_pfn - start_pfn) << PAGE_SHIFT,
> -				  &memblock.memory, 0);
> +		memory_present(0, start_pfn << PAGE_SHIFT, end_pfn << PAGE_SHIFT);

memory_present() expects pfns, the shift is not needed.

>  	}
>  
> -	/* XXX need to clip this if using highmem? */
> -	sparse_memory_present_with_active_regions(0);
> -
>  	paging_init();
>  }
>  
> -- 
> Michal Hocko
> SUSE Labs

-- 
Sincerely yours,
Mike.

