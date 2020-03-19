Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D3D18B9BD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 15:50:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jqZb5DBkzDrNw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 01:50:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jphf2rt3zDqvt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 01:10:25 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9EE31ABF6;
 Thu, 19 Mar 2020 14:10:21 +0000 (UTC)
Subject: Re: [RFC 1/2] mm, slub: prevent kmalloc_node crashes and memory leaks
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
References: <20200318144220.18083-1-vbabka@suse.cz>
 <20200318160610.GD26049@in.ibm.com>
 <e060ad43-ff4e-0e59-2e64-ce8a4916ec70@suse.cz>
 <0F67B5AA-96DF-4977-BDC6-D72959B3F7EF@linux.vnet.ibm.com>
 <b9b95895-ca6b-5ad2-1f67-45fee93d1e67@suse.cz>
 <658E6AB8-581F-4722-BCBB-4BDD2245D265@linux.vnet.ibm.com>
 <339cf655-393e-c48e-4797-86f61df56c35@suse.cz>
 <20200319140549.GF4879@linux.vnet.ibm.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <717aa572-73a9-65c0-4d6c-30f15d9d909a@suse.cz>
Date: Thu, 19 Mar 2020 15:10:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319140549.GF4879@linux.vnet.ibm.com>
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
 Nathan Lynch <nathanl@linux.ibm.com>, Mel Gorman <mgorman@techsingularity.net>,
 Michal Hocko <mhocko@kernel.org>, Pekka Enberg <penberg@kernel.org>,
 linux-mm@kvack.org, Kirill Tkhai <ktkhai@virtuozzo.com>,
 David Rientjes <rientjes@google.com>, Christopher Lameter <cl@linux.com>,
 bharata@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/19/20 3:05 PM, Srikar Dronamraju wrote:
> * Vlastimil Babka <vbabka@suse.cz> [2020-03-19 14:47:58]:
> 
>> ----8<----
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
> 
> Are we okay with passing a node to get_partial_node with !NUMA_NO_NODE and
> !N_MEMORY including possible nodes?

No, but AFAICS, such node values are already handled in ___slab_alloc, and
cannot reach get_partial(). If you see something I missed, please do tell.

>>  	if (object || node != NUMA_NO_NODE)
> 

