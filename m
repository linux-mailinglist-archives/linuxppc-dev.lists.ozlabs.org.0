Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DD9198EF3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 10:57:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s39q2yhHzDqpC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 19:57:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.65; helo=mail-wm1-f65.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48s37W0tfNzDqmd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 19:55:18 +1100 (AEDT)
Received: by mail-wm1-f65.google.com with SMTP id i19so1661672wmb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 01:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rTdu7oh4JjjFUdNyXovYxN1QmbRl7JqIGXsfhw5Wa0c=;
 b=rvDFWI6XOt8p3/hsA0SFh2SBBHQaMvbtCYD0kEsyeV1EHvM95aujtXIEtQrl4oKHdv
 OfFQDbeKXffv/0gYRo7IqGH8qBWFRJAPN8kNoTUf7EUlJqsaIbyIfU5LJ2n/mqZhDKUX
 zoE5fQcMOWSbXqGWCGQ8P81ZO7O2EMvc60l3DxIR/pe7j5qt/5/VmuqlwnsxWx6obej+
 Z192WcFYx+mln7NMgBN0MMs/6fmoP+5+uvVHKnFhO3IdFQwinXwU332RPXOAmMtB/ztu
 Mq1BHwGnGqp6R663rG5yee4weo7orVNfR7EFrVua3zllvkHEoKr5ADaTqpgm0Ni9gQP8
 uSDQ==
X-Gm-Message-State: ANhLgQ0zQ3xKEyFB27rsbos0XGZNWIvou3U8rfgnRtcA+Xccuh6cdV3/
 odGcgCJUjApKdKD2qMTCF/4=
X-Google-Smtp-Source: ADFU+vuscSRwsLwXmVoQv1xnwhJFZnnlCFmntVIImf+p0Rb3SHZnEYoHiIxLd4qO4YJEIRanvIyR4Q==
X-Received: by 2002:a1c:b60b:: with SMTP id g11mr2406590wmf.175.1585644915034; 
 Tue, 31 Mar 2020 01:55:15 -0700 (PDT)
Received: from localhost (ip-37-188-180-223.eurotel.cz. [37.188.180.223])
 by smtp.gmail.com with ESMTPSA id v11sm26003208wrm.43.2020.03.31.01.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 01:55:14 -0700 (PDT)
Date: Tue, 31 Mar 2020 10:55:13 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v3 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by
 default for NUMA
Message-ID: <20200331085513.GE30449@dhcp22.suse.cz>
References: <1585420282-25630-1-git-send-email-Hoan@os.amperecomputing.com>
 <20200330074246.GA14243@dhcp22.suse.cz>
 <20200330175100.GD30942@linux.ibm.com>
 <20200330182301.GM14243@dhcp22.suse.cz>
 <20200331081423.GE30942@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200331081423.GE30942@linux.ibm.com>
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
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 linux-s390@vger.kernel.org, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Hoan Tran <Hoan@os.amperecomputing.com>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>, lho@amperecomputing.com,
 Vasily Gorbik <gor@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will.deacon@arm.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 31-03-20 11:14:23, Mike Rapoport wrote:
> On Mon, Mar 30, 2020 at 08:23:01PM +0200, Michal Hocko wrote:
> > On Mon 30-03-20 20:51:00, Mike Rapoport wrote:
> > > On Mon, Mar 30, 2020 at 09:42:46AM +0200, Michal Hocko wrote:
> > > > On Sat 28-03-20 11:31:17, Hoan Tran wrote:
> > > > > In NUMA layout which nodes have memory ranges that span across other nodes,
> > > > > the mm driver can detect the memory node id incorrectly.
> > > > > 
> > > > > For example, with layout below
> > > > > Node 0 address: 0000 xxxx 0000 xxxx
> > > > > Node 1 address: xxxx 1111 xxxx 1111
> > > > > 
> > > > > Note:
> > > > >  - Memory from low to high
> > > > >  - 0/1: Node id
> > > > >  - x: Invalid memory of a node
> > > > > 
> > > > > When mm probes the memory map, without CONFIG_NODES_SPAN_OTHER_NODES
> > > > > config, mm only checks the memory validity but not the node id.
> > > > > Because of that, Node 1 also detects the memory from node 0 as below
> > > > > when it scans from the start address to the end address of node 1.
> > > > > 
> > > > > Node 0 address: 0000 xxxx xxxx xxxx
> > > > > Node 1 address: xxxx 1111 1111 1111
> > > > > 
> > > > > This layout could occur on any architecture. Most of them enables
> > > > > this config by default with CONFIG_NUMA. This patch, by default, enables
> > > > > CONFIG_NODES_SPAN_OTHER_NODES or uses early_pfn_in_nid() for NUMA.
> > > > 
> > > > I am not opposed to this at all. It reduces the config space and that is
> > > > a good thing on its own. The history has shown that meory layout might
> > > > be really wild wrt NUMA. The config is only used for early_pfn_in_nid
> > > > which is clearly an overkill.
> > > > 
> > > > Your description doesn't really explain why this is safe though. The
> > > > history of this config is somehow messy, though. Mike has tried
> > > > to remove it a94b3ab7eab4 ("[PATCH] mm: remove arch independent
> > > > NODES_SPAN_OTHER_NODES") just to be reintroduced by 7516795739bd
> > > > ("[PATCH] Reintroduce NODES_SPAN_OTHER_NODES for powerpc") without any
> > > > reasoning what so ever. This doesn't make it really easy see whether
> > > > reasons for reintroduction are still there. Maybe there are some subtle
> > > > dependencies. I do not see any TBH but that might be burried deep in an
> > > > arch specific code.
> > > 
> > > I've looked at this a bit more and it seems that the check for
> > > early_pfn_in_nid() in memmap_init_zone() can be simply removed.
> > > 
> > > The commits you've mentioned were way before the addition of
> > > HAVE_MEMBLOCK_NODE_MAP and the whole infrastructure that calculates zone
> > > sizes and boundaries based on the memblock node map.
> > > So, the memmap_init_zone() is called when zone boundaries are already
> > > within a node.
> > 
> > But zones from different nodes might overlap in the pfn range. And this
> > check is there to skip over those overlapping areas.
> 
> Maybe I mis-read the code, but I don't see how this could happen. In the
> HAVE_MEMBLOCK_NODE_MAP=y case, free_area_init_node() calls
> calculate_node_totalpages() that ensures that node->node_zones are entirely
> within the node because this is checked in zone_spanned_pages_in_node().

zone_spanned_pages_in_node does chech the zone boundaries are within the
node boundaries. But that doesn't really tell anything about other
potential zones interleaving with the physical memory range.
zone->spanned_pages simply gives the physical range for the zone
including holes. Interleaving nodes are essentially a hole
(__absent_pages_in_range is going to skip those).

That means that when free_area_init_core simply goes over the whole
physical zone range including holes and that is why we need to check
both for physical and logical holes (aka other nodes).

The life would be so much easier if the whole thing would simply iterate
over memblocks...

-- 
Michal Hocko
SUSE Labs
