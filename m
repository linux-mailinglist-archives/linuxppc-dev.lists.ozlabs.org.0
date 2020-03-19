Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE4B18B064
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 10:39:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jhhK5Yw4zDr7Z
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 20:39:45 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jhfS0DSczDr34
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 20:38:07 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1E6DFACB9;
 Thu, 19 Mar 2020 09:38:04 +0000 (UTC)
Subject: Re: [PATCH v2 1/4] mm: Check for node_online in node_present_pages
To: Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
References: <20200318072810.9735-1-srikar@linux.vnet.ibm.com>
 <20200318072810.9735-2-srikar@linux.vnet.ibm.com>
 <20200318100256.GH21362@dhcp22.suse.cz>
 <2d7c55ed-0f67-bd47-e478-9726734abcc9@suse.cz>
 <87tv2ldw1k.fsf@mpe.ellerman.id.au>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <d950e0e3-e4c0-f36b-5925-ba0bfcdd348f@suse.cz>
Date: Thu, 19 Mar 2020 10:38:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <87tv2ldw1k.fsf@mpe.ellerman.id.au>
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
 Nathan Lynch <nathanl@linux.ibm.com>, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, Kirill Tkhai <ktkhai@virtuozzo.com>,
 Mel Gorman <mgorman@suse.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christopher Lameter <cl@linux.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/19/20 1:32 AM, Michael Ellerman wrote:
> Seems like a nice solution to me

Thanks :)

>> ----8<----
>> diff --git a/mm/slub.c b/mm/slub.c
>> index 17dc00e33115..1d4f2d7a0080 100644
>> --- a/mm/slub.c
>> +++ b/mm/slub.c
>> @@ -1511,7 +1511,7 @@ static inline struct page *alloc_slab_page(struct kmem_cache *s,
>>  	struct page *page;
>>  	unsigned int order = oo_order(oo);
>>  
>> -	if (node == NUMA_NO_NODE)
>> +	if (node == NUMA_NO_NODE || !node_online(node))
> 
> Why don't we need the node_present_pages() check here?

Page allocator is fine with a node without present pages, as long as there's a
zonelist, which online nodes must have (ideally all possible nodes should have,
and then we can remove this).

SLUB on the other hand doesn't allocate cache per-cpu structures for nodes
without present pages (understandably) that's why the other place includes the
node_present_pages() check.

Thanks
