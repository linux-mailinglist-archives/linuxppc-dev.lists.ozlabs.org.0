Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6197D18C906
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 09:39:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kHHk08BNzDrDq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 19:38:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=vbabka@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kHFz0QfNzDrCp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 19:37:26 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E6D0DBA3E;
 Fri, 20 Mar 2020 08:37:20 +0000 (UTC)
Subject: Re: [RFC 1/2] mm, slub: prevent kmalloc_node crashes and memory leaks
To: bharata@linux.ibm.com
References: <20200318144220.18083-1-vbabka@suse.cz>
 <20200318160610.GD26049@in.ibm.com>
 <e060ad43-ff4e-0e59-2e64-ce8a4916ec70@suse.cz>
 <0F67B5AA-96DF-4977-BDC6-D72959B3F7EF@linux.vnet.ibm.com>
 <b9b95895-ca6b-5ad2-1f67-45fee93d1e67@suse.cz>
 <658E6AB8-581F-4722-BCBB-4BDD2245D265@linux.vnet.ibm.com>
 <339cf655-393e-c48e-4797-86f61df56c35@suse.cz>
 <20200320034241.GE26049@in.ibm.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <bc0a11e9-65b1-9862-9be9-9c73b84e9b23@suse.cz>
Date: Fri, 20 Mar 2020 09:37:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200320034241.GE26049@in.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 Nathan Lynch <nathanl@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Mel Gorman <mgorman@techsingularity.net>, Michal Hocko <mhocko@kernel.org>,
 Pekka Enberg <penberg@kernel.org>, linux-mm@kvack.org,
 Kirill Tkhai <ktkhai@virtuozzo.com>, David Rientjes <rientjes@google.com>,
 Christopher Lameter <cl@linux.com>, linuxppc-dev@lists.ozlabs.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/20/20 4:42 AM, Bharata B Rao wrote:
> On Thu, Mar 19, 2020 at 02:47:58PM +0100, Vlastimil Babka wrote:
>> diff --git a/mm/slub.c b/mm/slub.c
>> index 17dc00e33115..7113b1f9cd77 100644
>> --- a/mm/slub.c
>> +++ b/mm/slub.c
>> @@ -1973,8 +1973,6 @@ static void *get_partial(struct kmem_cache *s, gfp_t flags, int node,
>>  
>>  	if (node == NUMA_NO_NODE)
>>  		searchnode = numa_mem_id();
>> -	else if (!node_present_pages(node))
>> -		searchnode = node_to_mem_node(node);
>>  
>>  	object = get_partial_node(s, get_node(s, searchnode), c, flags);
>>  	if (object || node != NUMA_NO_NODE)
>> @@ -2563,17 +2561,27 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
>>  	struct page *page;
>>  
>>  	page = c->page;
>> -	if (!page)
>> +	if (!page) {
>> +		/*
>> +		 * if the node is not online or has no normal memory, just
>> +		 * ignore the node constraint
>> +		 */
>> +		if (unlikely(node != NUMA_NO_NODE &&
>> +			     !node_state(node, N_NORMAL_MEMORY)))
>> +			node = NUMA_NO_NODE;
>>  		goto new_slab;
>> +	}
>>  redo:
>>  
>>  	if (unlikely(!node_match(page, node))) {
>> -		int searchnode = node;
>> -
>> -		if (node != NUMA_NO_NODE && !node_present_pages(node))
>> -			searchnode = node_to_mem_node(node);
>> -
>> -		if (unlikely(!node_match(page, searchnode))) {
>> +		/*
>> +		 * same as above but node_match() being false already
>> +		 * implies node != NUMA_NO_NODE
>> +		 */
>> +		if (!node_state(node, N_NORMAL_MEMORY)) {
>> +			node = NUMA_NO_NODE;
>> +			goto redo;
>> +		} else {
>>  			stat(s, ALLOC_NODE_MISMATCH);
>>  			deactivate_slab(s, page, c->freelist, c);
>>  			goto new_slab;
> 
> This fixes the problem I reported at
> https://lore.kernel.org/linux-mm/20200317092624.GB22538@in.ibm.com/

Thanks, I hope it means I can make it Reported-and-tested-by: you
