Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5DB17230C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 17:19:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SyYJ31WbzDqZC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 03:19:32 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SyV96YQNzDqXf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 03:16:48 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 56680B198;
 Thu, 27 Feb 2020 16:16:43 +0000 (UTC)
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
To: Sachin Sant <sachinp@linux.vnet.ibm.com>, Michal Hocko <mhocko@kernel.org>
References: <D6F45EDD-9F2E-4593-B630-55E5BD7DE915@linux.vnet.ibm.com>
 <20200218142620.GF4151@dhcp22.suse.cz>
 <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com>
 <20200218152441.GH4151@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
 <20200224085812.GB22443@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
 <20200226184152.GQ3771@dhcp22.suse.cz>
 <c412ee69-80f9-b013-67d4-3b0a2f6aff7f@suse.cz>
 <dd450314-d428-6776-af07-f92c04c7b967@suse.cz>
 <20200227121214.GE3771@dhcp22.suse.cz>
 <52EF4673-7292-4C4C-B459-AF583951BA48@linux.vnet.ibm.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <9a86f865-50b5-7483-9257-dbb08fecd62b@suse.cz>
Date: Thu, 27 Feb 2020 17:16:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <52EF4673-7292-4C4C-B459-AF583951BA48@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
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
Cc: Pekka Enberg <penberg@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 David Rientjes <rientjes@google.com>, Christopher Lameter <cl@linux.com>,
 linuxppc-dev@lists.ozlabs.org, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Kirill Tkhai <ktkhai@virtuozzo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/27/20 5:00 PM, Sachin Sant wrote:
> 
> 
>> On 27-Feb-2020, at 5:42 PM, Michal Hocko <mhocko@kernel.org> wrote:
>> 
>> A very good hint indeed. I would do this
>> diff --git a/include/linux/topology.h b/include/linux/topology.h
>> index eb2fe6edd73c..d9f1b6737e4d 100644
>> --- a/include/linux/topology.h
>> +++ b/include/linux/topology.h
>> @@ -137,6 +137,8 @@ static inline void set_numa_mem(int node)
>> {
>> 	this_cpu_write(_numa_mem_, node);
>> 	_node_numa_mem_[numa_node_id()] = node;
>> +	pr_info("%s %d -> %d\n", __FUNCTION__, numa_node_id(), node);
>> +	dump_stack();
>> }
>> #endif
>> 
>> Btw. it would be also helpful to get
>> `faddr2line ___slab_alloc+0x334' from your kernel Sachin.
> 
> [linux-next]# ./scripts/faddr2line ./vmlinux ___slab_alloc+0x334 
> ___slab_alloc+0x334/0x760:
> new_slab_objects at mm/slub.c:2478
> (inlined by) ___slab_alloc at mm/slub.c:2628
> [linux-next]# 

Hmm that doesn't look relevant, but that address was marked as unreliable, no?
Don't we actually need this one?

[    8.768727] NIP [c0000000003d55f4] ___slab_alloc+0x1f4/0x760

> I have also attached boot log with a kernel that include about change.
> I see the following o/p during boot:
> 
> [    0.005269] set_numa_mem 1 -> 1

So there's no "set_numa_mem 0 -> X", specifically not
"set_numa_mem 0 -> 1" which I would have expected. That seems to confirm my
suspicion that the arch code doesn't set up the memoryless node 0 properly.

> [    0.005270] CPU: 12 PID: 0 Comm: swapper/12 Not tainted 5.6.0-rc3-next-20200227-autotest+ #6
> [    0.005271] Call Trace:
> [    0.005272] [c0000008b37dfe80] [c000000000b5d948] dump_stack+0xbc/0x104 (unreliable)
> [    0.005274] [c0000008b37dfec0] [c000000000059320] start_secondary+0x600/0x6e0
> [    0.005277] [c0000008b37dff90] [c00000000000ac54] start_secondary_prolog+0x10/0x14
> 
> Thanks
> -Sachin
> 

