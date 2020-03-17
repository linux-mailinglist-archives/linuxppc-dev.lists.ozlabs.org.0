Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F2C188BDF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 18:18:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hfy25hMnzDqn5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 04:18:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hfDL2WLFzDqc5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 03:45:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48hfDL0p7rz9BWT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 03:45:22 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48hfDK6brRz9sPR; Wed, 18 Mar 2020 03:45:21 +1100 (AEDT)
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
 by ozlabs.org (Postfix) with ESMTPS id 48hfDK21V1z9sPF
 for <linuxppc-dev@ozlabs.org>; Wed, 18 Mar 2020 03:45:20 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A890BAD11;
 Tue, 17 Mar 2020 16:45:16 +0000 (UTC)
Subject: Re: Slub: Increased mem consumption on cpu,mem-less node powerpc guest
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
References: <20200317092624.GB22538@in.ibm.com>
 <20200317115339.GA26049@in.ibm.com>
 <4088ae3c-4dfa-62ae-f56a-b46773788fc7@suse.cz>
 <20200317162536.GB27520@linux.vnet.ibm.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <080b2d00-76ef-2187-ec78-c9d181ef1701@suse.cz>
Date: Tue, 17 Mar 2020 17:45:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200317162536.GB27520@linux.vnet.ibm.com>
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
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@ozlabs.org,
 aneesh.kumar@linux.ibm.com, bharata@linux.ibm.com,
 Pekka Enberg <penberg@kernel.org>, linux-mm@kvack.org,
 David Rientjes <rientjes@google.com>, Christoph Lameter <cl@linux.com>,
 Michal Hocko <mhocko@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/17/20 5:25 PM, Srikar Dronamraju wrote:
> * Vlastimil Babka <vbabka@suse.cz> [2020-03-17 16:56:04]:
> 
>> 
>> I wonder why do you get a memory leak while Sachin in the same situation [1]
>> gets a crash? I don't understand anything anymore.
> 
> Sachin was testing on linux-next which has Kirill's patch which modifies
> slub to use kmalloc_node instead of kmalloc. While Bharata is testing on
> upstream, which doesn't have this. 

Yes, that Kirill's patch was about the memcg shrinker map allocation. But the
patch hunk that Bharata posted as a "hack" that fixes the problem, it follows
that there has to be something else that calls kmalloc_node(node) where node is
one that doesn't have present pages.

He mentions alloc_fair_sched_group() which has:

        for_each_possible_cpu(i) {
                cfs_rq = kzalloc_node(sizeof(struct cfs_rq),
                                      GFP_KERNEL, cpu_to_node(i));
...
                se = kzalloc_node(sizeof(struct sched_entity),
                                  GFP_KERNEL, cpu_to_node(i));

I assume one of these structs is 1k and other 512 bytes (rounded) and that for
some possible cpu's cpu_to_node(i) will be 0, which has no present pages. And as
Bharata pasted, node_to_mem_node(0) = 0
So this looks like the same scenario, but it doesn't crash? Is the node 0
actually online here, and/or does it have N_NORMAL_MEMORY state?

>> 
>> [1]
>> https://lore.kernel.org/linux-next/3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com/
>> 
> 

