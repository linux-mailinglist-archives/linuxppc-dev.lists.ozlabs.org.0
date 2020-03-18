Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF19189928
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 11:20:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48j5dn1dVBzDqwp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 21:20:29 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48j5Ft18wfzDqv8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 21:03:06 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7734EAC6B;
 Wed, 18 Mar 2020 10:02:58 +0000 (UTC)
Date: Wed, 18 Mar 2020 11:02:56 +0100
From: Michal Hocko <mhocko@suse.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/4] mm: Check for node_online in node_present_pages
Message-ID: <20200318100256.GH21362@dhcp22.suse.cz>
References: <20200318072810.9735-1-srikar@linux.vnet.ibm.com>
 <20200318072810.9735-2-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318072810.9735-2-srikar@linux.vnet.ibm.com>
X-Mailman-Approved-At: Wed, 18 Mar 2020 21:15:09 +1100
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

On Wed 18-03-20 12:58:07, Srikar Dronamraju wrote:
> Calling a kmalloc_node on a possible node which is not yet onlined can
> lead to panic. Currently node_present_pages() doesn't verify the node is
> online before accessing the pgdat for the node. However pgdat struct may
> not be available resulting in a crash.
> 
> NIP [c0000000003d55f4] ___slab_alloc+0x1f4/0x760
> LR [c0000000003d5b94] __slab_alloc+0x34/0x60
> Call Trace:
> [c0000008b3783960] [c0000000003d5734] ___slab_alloc+0x334/0x760 (unreliable)
> [c0000008b3783a40] [c0000000003d5b94] __slab_alloc+0x34/0x60
> [c0000008b3783a70] [c0000000003d6fa0] __kmalloc_node+0x110/0x490
> [c0000008b3783af0] [c0000000003443d8] kvmalloc_node+0x58/0x110
> [c0000008b3783b30] [c0000000003fee38] mem_cgroup_css_online+0x108/0x270
> [c0000008b3783b90] [c000000000235aa8] online_css+0x48/0xd0
> [c0000008b3783bc0] [c00000000023eaec] cgroup_apply_control_enable+0x2ec/0x4d0
> [c0000008b3783ca0] [c000000000242318] cgroup_mkdir+0x228/0x5f0
> [c0000008b3783d10] [c00000000051e170] kernfs_iop_mkdir+0x90/0xf0
> [c0000008b3783d50] [c00000000043dc00] vfs_mkdir+0x110/0x230
> [c0000008b3783da0] [c000000000441c90] do_mkdirat+0xb0/0x1a0
> [c0000008b3783e20] [c00000000000b278] system_call+0x5c/0x68
> 
> Fix this by verifying the node is online before accessing the pgdat
> structure. Fix the same for node_spanned_pages() too.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Christopher Lameter <cl@linux.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> Cc: Kirill Tkhai <ktkhai@virtuozzo.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Cc: Bharata B Rao <bharata@linux.ibm.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> 
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  include/linux/mmzone.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index f3f264826423..88078a3b95e5 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -756,8 +756,10 @@ typedef struct pglist_data {
>  	atomic_long_t		vm_stat[NR_VM_NODE_STAT_ITEMS];
>  } pg_data_t;
>  
> -#define node_present_pages(nid)	(NODE_DATA(nid)->node_present_pages)
> -#define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
> +#define node_present_pages(nid)		\
> +	(node_online(nid) ? NODE_DATA(nid)->node_present_pages : 0)
> +#define node_spanned_pages(nid)		\
> +	(node_online(nid) ? NODE_DATA(nid)->node_spanned_pages : 0)

I believe this is a wrong approach. We really do not want to special
case all the places which require NODE_DATA. Can we please go and
allocate pgdat for all possible nodes?

The current state of memory less hacks subtle bugs poping up here and
there just prove that we should have done that from the very begining
IMHO.

>  #ifdef CONFIG_FLAT_NODE_MEM_MAP
>  #define pgdat_page_nr(pgdat, pagenr)	((pgdat)->node_mem_map + (pagenr))
>  #else
> -- 
> 2.18.1

-- 
Michal Hocko
SUSE Labs
