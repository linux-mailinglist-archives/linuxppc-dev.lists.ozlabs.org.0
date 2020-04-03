Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E700E19D0D6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 09:11:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48trgn0YJGzDrgB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 18:11:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Lh8KKJVh; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48trdx1yPDzDrRQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 18:09:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585897759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TUShErNk8cwU7hJf8BxmK0K5c6pEQ4hGGKwc5zmiaaw=;
 b=Lh8KKJVhWGQ571JPW6YZhM/hUgzk3wt1DGTNe8uu00UMZJIJmhUWuX09i8TdO0EgeMk1Lt
 6sq1G9y73vJ/t9JGj4g3h4Qm6Nj1+pPZxym3G/5RFNBB7QWg28M0pfr0nJWdaDgSYQRGGX
 aiiAvbgIVIjYfhhc1tqDg00Yyi3buVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-Cvy3b_roPf66oPbJTVFQdA-1; Fri, 03 Apr 2020 03:09:13 -0400
X-MC-Unique: Cvy3b_roPf66oPbJTVFQdA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2400818A6EC1;
 Fri,  3 Apr 2020 07:09:09 +0000 (UTC)
Received: from localhost (ovpn-12-42.pek2.redhat.com [10.72.12.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 115A11147D2;
 Fri,  3 Apr 2020 07:09:07 +0000 (UTC)
Date: Fri, 3 Apr 2020 15:09:04 +0800
From: Baoquan He <bhe@redhat.com>
To: Hoan Tran <hoan@os.amperecomputing.com>
Subject: Re: [PATCH v3 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by
 default for NUMA
Message-ID: <20200403070904.GO2402@MiWiFi-R3L-srv>
References: <1585420282-25630-1-git-send-email-Hoan@os.amperecomputing.com>
 <20200330074246.GA14243@dhcp22.suse.cz>
 <20200330175100.GD30942@linux.ibm.com>
 <20200330182301.GM14243@dhcp22.suse.cz>
 <20200331081423.GE30942@linux.ibm.com>
 <20200331085513.GE30449@dhcp22.suse.cz>
 <20200331140332.GA2129@MiWiFi-R3L-srv>
 <20200331142138.GL30449@dhcp22.suse.cz>
 <20200331143140.GA2402@MiWiFi-R3L-srv>
 <cc717f09-2b18-b242-e438-3ec730c5dac0@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc717f09-2b18-b242-e438-3ec730c5dac0@os.amperecomputing.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: mmorana@amperecomputing.com, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 linux-s390@vger.kernel.org, x86@kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>, lho@amperecomputing.com,
 Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will.deacon@arm.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Oscar Salvador <osalvador@suse.de>,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/02/20 at 09:46pm, Hoan Tran wrote:
> Hi All,
> 
> On 3/31/20 7:31 AM, Baoquan He wrote:
> > On 03/31/20 at 04:21pm, Michal Hocko wrote:
> > > On Tue 31-03-20 22:03:32, Baoquan He wrote:
> > > > Hi Michal,
> > > > 
> > > > On 03/31/20 at 10:55am, Michal Hocko wrote:
> > > > > On Tue 31-03-20 11:14:23, Mike Rapoport wrote:
> > > > > > Maybe I mis-read the code, but I don't see how this could happen. In the
> > > > > > HAVE_MEMBLOCK_NODE_MAP=y case, free_area_init_node() calls
> > > > > > calculate_node_totalpages() that ensures that node->node_zones are entirely
> > > > > > within the node because this is checked in zone_spanned_pages_in_node().
> > > > > 
> > > > > zone_spanned_pages_in_node does chech the zone boundaries are within the
> > > > > node boundaries. But that doesn't really tell anything about other
> > > > > potential zones interleaving with the physical memory range.
> > > > > zone->spanned_pages simply gives the physical range for the zone
> > > > > including holes. Interleaving nodes are essentially a hole
> > > > > (__absent_pages_in_range is going to skip those).
> > > > > 
> > > > > That means that when free_area_init_core simply goes over the whole
> > > > > physical zone range including holes and that is why we need to check
> > > > > both for physical and logical holes (aka other nodes).
> > > > > 
> > > > > The life would be so much easier if the whole thing would simply iterate
> > > > > over memblocks...
> > > > 
> > > > The memblock iterating sounds a great idea. I tried with putting the
> > > > memblock iterating in the upper layer, memmap_init(), which is used for
> > > > boot mem only anyway. Do you think it's doable and OK? It yes, I can
> > > > work out a formal patch to make this simpler as you said. The draft code
> > > > is as below. Like this it uses the existing code and involves little change.
> > > 
> > > Doing this would be a step in the right direction! I haven't checked the
> > > code very closely though. The below sounds way too simple to be truth I
> > > am afraid. First for_each_mem_pfn_range is available only for
> > > CONFIG_HAVE_MEMBLOCK_NODE_MAP (which is one of the reasons why I keep
> > > saying that I really hate that being conditional). Also I haven't really
> > > checked the deferred initialization path - I have a very vague
> > > recollection that it has been converted to the memblock api but I have
> > > happilly dropped all that memory.
> > 
> > Thanks for your quick response and pointing out the rest suspect aspects,
> > I will investigate what you mentioned, see if they impact.
> 
> I would like to check if we still move on with my patch to remove
> CONFIG_NODES_SPAN_OTHER_NODES and have another patch on top it?

I think we would like to replace CONFIG_NODES_SPAN_OTHER_NODES with
CONFIG_NUMA, and just let UMA return 0 as node id, as Michal replied in
another mail. Anyway, your patch 2~5 are still needed to sit on top of
the change of this new plan.

