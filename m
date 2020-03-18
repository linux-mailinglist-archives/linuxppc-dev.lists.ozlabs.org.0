Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C11F18A031
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 17:08:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jFLr1ByJzDr0T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 03:08:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jFJx0D8pzDqw2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 03:06:24 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IG3FjJ126045
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 12:06:22 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu862018c-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 12:06:21 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Wed, 18 Mar 2020 16:06:19 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Mar 2020 16:06:16 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02IG6FIN43188562
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2020 16:06:15 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70255A4055;
 Wed, 18 Mar 2020 16:06:15 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DD41A4040;
 Wed, 18 Mar 2020 16:06:13 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.80.118])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 18 Mar 2020 16:06:12 +0000 (GMT)
Date: Wed, 18 Mar 2020 21:36:10 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [RFC 1/2] mm, slub: prevent kmalloc_node crashes and memory leaks
References: <20200318144220.18083-1-vbabka@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318144220.18083-1-vbabka@suse.cz>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-TM-AS-GCONF: 00
x-cbid: 20031816-0012-0000-0000-0000039347FB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031816-0013-0000-0000-000021D02AEC
Message-Id: <20200318160610.GD26049@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_07:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003180074
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
Reply-To: bharata@linux.ibm.com
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Michal Hocko <mhocko@kernel.org>, Pekka Enberg <penberg@kernel.org>,
 linux-mm@kvack.org, Kirill Tkhai <ktkhai@virtuozzo.com>,
 David Rientjes <rientjes@google.com>, Christopher Lameter <cl@linux.com>,
 Mel Gorman <mgorman@techsingularity.net>, Joonsoo Kim <iamjoonsoo.kim@lge.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 18, 2020 at 03:42:19PM +0100, Vlastimil Babka wrote:
> This is a PowerPC platform with following NUMA topology:
> 
> available: 2 nodes (0-1)
> node 0 cpus:
> node 0 size: 0 MB
> node 0 free: 0 MB
> node 1 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
> node 1 size: 35247 MB
> node 1 free: 30907 MB
> node distances:
> node   0   1
>   0:  10  40
>   1:  40  10
> 
> possible numa nodes: 0-31
> 
> A related issue was reported by Bharata [3] where a similar PowerPC
> configuration, but without patch [2] ends up allocating large amounts of pages
> by kmalloc-1k kmalloc-512. This seems to have the same underlying issue with
> node_to_mem_node() not behaving as expected, and might probably also lead
> to an infinite loop with CONFIG_SLUB_CPU_PARTIAL.

This patch doesn't fix the issue of kmalloc caches consuming more
memory for the above mentioned topology. Also CONFIG_SLUB_CPU_PARTIAL is set
here and I have not observed infinite loop till now.

Or, are you expecting your fix to work on top of Srikar's other patchset
https://lore.kernel.org/linuxppc-dev/20200311110237.5731-1-srikar@linux.vnet.ibm.com/t/#u ?

With the above patchset, no fix is required to address increased memory
consumption of kmalloc caches because this patchset prevents such
topology from occuring thereby making it impossible for the problem
to surface (or at least impossible for the specific topology that I
mentioned)

> diff --git a/mm/slub.c b/mm/slub.c
> index 17dc00e33115..4d798cacdae1 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -1511,7 +1511,7 @@ static inline struct page *alloc_slab_page(struct kmem_cache *s,
>  	struct page *page;
>  	unsigned int order = oo_order(oo);
>  
> -	if (node == NUMA_NO_NODE)
> +	if (node == NUMA_NO_NODE || !node_online(node))
>  		page = alloc_pages(flags, order);
>  	else
>  		page = __alloc_pages_node(node, flags, order);
> @@ -1973,8 +1973,6 @@ static void *get_partial(struct kmem_cache *s, gfp_t flags, int node,
>  
>  	if (node == NUMA_NO_NODE)
>  		searchnode = numa_mem_id();
> -	else if (!node_present_pages(node))
> -		searchnode = node_to_mem_node(node);

We still come here with memory-less node=0 (and not NUMA_NO_NODE), fail to
find partial slab, go back and allocate a new one thereby continuosly
increasing the number of newly allocated slabs.

>  
>  	object = get_partial_node(s, get_node(s, searchnode), c, flags);
>  	if (object || node != NUMA_NO_NODE)
> @@ -2568,12 +2566,15 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
>  redo:
>  
>  	if (unlikely(!node_match(page, node))) {
> -		int searchnode = node;
> -
> -		if (node != NUMA_NO_NODE && !node_present_pages(node))
> -			searchnode = node_to_mem_node(node);
> -
> -		if (unlikely(!node_match(page, searchnode))) {
> +		/*
> +		 * node_match() false implies node != NUMA_NO_NODE
> +		 * but if the node is not online or has no pages, just
> +		 * ignore the constraint
> +		 */
> +		if ((!node_online(node) || !node_present_pages(node))) {
> +			node = NUMA_NO_NODE;
> +			goto redo;

Many calls for allocating slab object from memory-less node 0 in my case
don't even hit the above check because they get short circuited by
goto new_slab label which is present a few lines above.  Hence I don't see
any reduction in the amount of slab memory with this fix.

Regards,
Bharata.

