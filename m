Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AF1188A82
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 17:38:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hf4c6RdNzDqV5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 03:38:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hd7d038YzDqgq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 02:56:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48hd7c27Sfz8tHw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 02:56:12 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48hd7b5MhLz9sPR; Wed, 18 Mar 2020 02:56:11 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=vbabka@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48hd7b0kRWz9sRY
 for <linuxppc-dev@ozlabs.org>; Wed, 18 Mar 2020 02:56:10 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E8582ACA1;
 Tue, 17 Mar 2020 15:56:06 +0000 (UTC)
Subject: Re: Slub: Increased mem consumption on cpu,mem-less node powerpc guest
To: bharata@linux.ibm.com, linux-mm@kvack.org
References: <20200317092624.GB22538@in.ibm.com>
 <20200317115339.GA26049@in.ibm.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <4088ae3c-4dfa-62ae-f56a-b46773788fc7@suse.cz>
Date: Tue, 17 Mar 2020 16:56:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200317115339.GA26049@in.ibm.com>
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
 Andrew Morton <akpm@linux-foundation.org>, aneesh.kumar@linux.ibm.com,
 Michal Hocko <mhocko@kernel.org>, Pekka Enberg <penberg@kernel.org>,
 linuxppc-dev@ozlabs.org, David Rientjes <rientjes@google.com>,
 Christoph Lameter <cl@linux.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/17/20 12:53 PM, Bharata B Rao wrote:
> On Tue, Mar 17, 2020 at 02:56:28PM +0530, Bharata B Rao wrote:
>> Case 1: 2 node NUMA, node0 empty
>> ================================
>> # numactl -H
>> available: 2 nodes (0-1)
>> node 0 cpus:
>> node 0 size: 0 MB
>> node 0 free: 0 MB
>> node 1 cpus: 0 1 2 3 4 5 6 7
>> node 1 size: 16294 MB
>> node 1 free: 15453 MB
>> node distances:
>> node   0   1 
>>   0:  10  40 
>>   1:  40  10 
>> 
>> diff --git a/mm/slub.c b/mm/slub.c
>> index 17dc00e33115..888e4d245444 100644
>> --- a/mm/slub.c
>> +++ b/mm/slub.c
>> @@ -1971,10 +1971,8 @@ static void *get_partial(struct kmem_cache *s, gfp_t flags, int node,
>>  	void *object;
>>  	int searchnode = node;
>>  
>> -	if (node == NUMA_NO_NODE)
>> +	if (node == NUMA_NO_NODE || !node_present_pages(node))
>>  		searchnode = numa_mem_id();
>> -	else if (!node_present_pages(node))
>> -		searchnode = node_to_mem_node(node);
> 
> For the above topology, I see this:
> 
> node_to_mem_node(1) = 1
> node_to_mem_node(0) = 0
> node_to_mem_node(NUMA_NO_NODE) = 0
> 
> Looks like the last two cases (returning memory-less node 0) is the
> problem here?

I wonder why do you get a memory leak while Sachin in the same situation [1]
gets a crash? I don't understand anything anymore.

[1]
https://lore.kernel.org/linux-next/3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com/

> Regards,
> Bharata.
> 
> 

