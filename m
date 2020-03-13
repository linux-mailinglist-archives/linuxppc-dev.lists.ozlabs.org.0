Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B4A184617
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 12:41:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48f3gv1sdjzDq5n
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 22:41:47 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48f3cT4w4pzDq5n
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 22:38:49 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B13BBABEF;
 Fri, 13 Mar 2020 11:38:46 +0000 (UTC)
Subject: Re: [PATCH 1/3] powerpc/numa: Set numa_node for all possible cpus
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Joonsoo Kim <js1304@gmail.com>
References: <20200311110237.5731-2-srikar@linux.vnet.ibm.com>
 <20200311115735.GM23944@dhcp22.suse.cz>
 <20200312052707.GA3277@linux.vnet.ibm.com>
 <C5560C71-483A-41FB-BDE9-526F1E0CFA36@linux.vnet.ibm.com>
 <5e5c736a-a88c-7c76-fc3d-7bc765e8dcba@suse.cz>
 <20200312131438.GB3277@linux.vnet.ibm.com>
 <61437352-8b54-38fa-4471-044a65c9d05a@suse.cz>
 <20200312161310.GC3277@linux.vnet.ibm.com>
 <e115048c-be38-c298-b8d1-d4b513e7d2fb@suse.cz>
 <CAAmzW4OFy51BhAT62tdVQD52NNMWm+UPgoGAX97omY7P+nJ+5w@mail.gmail.com>
 <20200313110440.GA25144@linux.vnet.ibm.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <06be5908-9af6-2892-0333-e9558b2cf474@suse.cz>
Date: Fri, 13 Mar 2020 12:38:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313110440.GA25144@linux.vnet.ibm.com>
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Kirill Tkhai <ktkhai@virtuozzo.com>, Mel Gorman <mgorman@suse.de>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christopher Lameter <cl@linux.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/13/20 12:04 PM, Srikar Dronamraju wrote:
>> I lost all the memory about it. :)
>> Anyway, how about this?
>> 
>> 1. make node_present_pages() safer
>> static inline node_present_pages(nid)
>> {
>> if (!node_online(nid)) return 0;
>> return (NODE_DATA(nid)->node_present_pages);
>> }
>> 
> 
> Yes this would help.

Looks good, yeah.

>> 2. make node_to_mem_node() safer for all cases
>> In ppc arch's mem_topology_setup(void)
>> for_each_present_cpu(cpu) {
>>  numa_setup_cpu(cpu);
>>  mem_node = node_to_mem_node(numa_mem_id());
>>  if (!node_present_pages(mem_node)) {
>>   _node_numa_mem_[numa_mem_id()] = first_online_node;
>>  }
>> }
>> 
> 
> But here as discussed above, we miss the case of possible but not present nodes.
> For such nodes, the above change may not update, resulting in they still
> having 0. And node 0 can be only possible but not present.

So is there other way to do the setup so that node_to_mem_node() returns an
online+present node when called for any possible node?

