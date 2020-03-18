Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A386189A8A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 12:22:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48j71B1k1yzDqsR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 22:22:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=mhocko@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48j6rS25hJzDqQh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 22:14:47 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AEDFCB243;
 Wed, 18 Mar 2020 11:14:41 +0000 (UTC)
Date: Wed, 18 Mar 2020 12:14:39 +0100
From: Michal Hocko <mhocko@suse.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/4] mm: Check for node_online in node_present_pages
Message-ID: <20200318111439.GJ21362@dhcp22.suse.cz>
References: <20200318072810.9735-1-srikar@linux.vnet.ibm.com>
 <20200318072810.9735-2-srikar@linux.vnet.ibm.com>
 <20200318100256.GH21362@dhcp22.suse.cz>
 <20200318110215.GC27520@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318110215.GC27520@linux.vnet.ibm.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Nathan Lynch <nathanl@linux.ibm.com>, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, Kirill Tkhai <ktkhai@virtuozzo.com>,
 Mel Gorman <mgorman@suse.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 18-03-20 16:32:15, Srikar Dronamraju wrote:
> * Michal Hocko <mhocko@suse.com> [2020-03-18 11:02:56]:
> 
> > On Wed 18-03-20 12:58:07, Srikar Dronamraju wrote:
[...]
> > > -#define node_present_pages(nid)	(NODE_DATA(nid)->node_present_pages)
> > > -#define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
> > > +#define node_present_pages(nid)		\
> > > +	(node_online(nid) ? NODE_DATA(nid)->node_present_pages : 0)
> > > +#define node_spanned_pages(nid)		\
> > > +	(node_online(nid) ? NODE_DATA(nid)->node_spanned_pages : 0)
> >
> > I believe this is a wrong approach. We really do not want to special
> > case all the places which require NODE_DATA. Can we please go and
> > allocate pgdat for all possible nodes?
> >
> 
> I can do that but the question I had was should we make this change just for
> Powerpc or should the change be for other archs.

No, we shouldn't, really. If NODE_DATA is non-null for all possible
nodes then this shouldn't be really necessary and arch specific.

> NODE_DATA initialization always seems to be in arch specific code.
> 
> The other archs that are affected seem to be mips, sh and sparc
> These archs seem to have making an assumption that NODE_DATA has to be local
> only,

Which is all good and fine for nodes that hold some memory. If those
architectures support memory less nodes at all then I do not see any
problem to have remote pgdata.

> For example on sparc / arch/sparc/mm/init_64.c in allocate_node_data function.
> 
>   NODE_DATA(nid) = memblock_alloc_node(sizeof(struct pglist_data),
>                                              SMP_CACHE_BYTES, nid);
>         if (!NODE_DATA(nid)) {
>                 prom_printf("Cannot allocate pglist_data for nid[%d]\n", nid);
>                 prom_halt();
>         }
> 
>         NODE_DATA(nid)->node_id = nid;

This code is not about memroy less nodes, is it? It looks more like a
allocation failure panic-like handling because there is not enough
memory to hold pgdat. This also strongly suggests that this platform
doesn't really expect memory less nodes in the early init path.

> So even if I make changes to allocate NODE_DATA from fallback node, I may not
> be able to test them.

Please try to focus on the architecture you can test for. From the
existing reports I have seen this looks mostly to be a problem for x86
and ppc
-- 
Michal Hocko
SUSE Labs
