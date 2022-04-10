Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDE84FADA6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 13:29:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KbqWV4GzBz3bky
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 21:29:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=I9pw0lrE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KbqVw3478z2xvW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 21:28:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=I9pw0lrE; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KbqVv21v5z4xNl;
 Sun, 10 Apr 2022 21:28:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649590120;
 bh=bWMlGO9+BhrhUnAw4psROVAflBZr1WxUpIsiqOVWFwU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=I9pw0lrEvttIbctgZ0lUHuJb43v6wlV+QNUYBXPhFziEN/WnuBl+7d4S4RpVdeOZw
 varm21jJcQRFdcLn20fJ+wH7j0RZ1jL1dTwuc8oCBW1fSIOvUQTmUk8/K+jqZ14Jjl
 6xxuy83Y2/lZIGy0o9YgWDZlXwoiNfvAOCKQAXUDeCidX/dYYI/3Fql3K1vyE9jNqw
 YDvdjNPJKAe0/iH+1qhjFcLXJDI5rtCyfbC/vQROtU6PQAQMye0zNUuQFcD3mRyHCq
 Iv5WRlHpiNVdtZz4A96xqdIfwslM8NQ7f3P9hEZHeDQEvr7ABFvsNdpn7IiEVFQ5n5
 RyjZOgr++My/A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Oscar Salvador
 <osalvador@suse.de>
Subject: Re: [PATCH] powerpc/numa: Handle partially initialized numa nodes
In-Reply-To: <20220408122537.GD568950@linux.vnet.ibm.com>
References: <20220330135123.1868197-1-srikar@linux.vnet.ibm.com>
 <Yk29dMa3H8bk0yST@localhost.localdomain>
 <20220408122537.GD568950@linux.vnet.ibm.com>
Date: Sun, 10 Apr 2022 21:28:38 +1000
Message-ID: <874k316uu1.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-mm@kvack.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Michal Hocko <mhocko@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> * Oscar Salvador <osalvador@suse.de> [2022-04-06 18:19:00]:
>
>> On Wed, Mar 30, 2022 at 07:21:23PM +0530, Srikar Dronamraju wrote:
>> >  arch/powerpc/mm/numa.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > 
>> > diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>> > index b9b7fefbb64b..13022d734951 100644
>> > --- a/arch/powerpc/mm/numa.c
>> > +++ b/arch/powerpc/mm/numa.c
>> > @@ -1436,7 +1436,7 @@ int find_and_online_cpu_nid(int cpu)
>> >  	if (new_nid < 0 || !node_possible(new_nid))
>> >  		new_nid = first_online_node;
>> >  
>> > -	if (NODE_DATA(new_nid) == NULL) {
>> > +	if (!node_online(new_nid)) {
>> >  #ifdef CONFIG_MEMORY_HOTPLUG
>> >  		/*
>> >  		 * Need to ensure that NODE_DATA is initialized for a node from
>> 
>> Because of this fix, I wanted to check whether we might have any more fallouts due
>> to ("mm: handle uninitialized numa nodes gracefully"), and it made me look closer
>> as to why powerpc is the only platform that special cases try_online_node(),
>> while all others rely on cpu_up()->try_online_node() to do the right thing.
>> 
>> So, I had a look.
>> Let us rewind a bit:
>> 
>> The commit that sets find_and_online_cpu_nid() in dlpar_online_cpu was
>> e67e02a544e9 ("powerpc/pseries: Fix cpu hotplug crash with memoryless nodes").
>> 
>> In there, it says that we have the following picture:
>> 
>> partition_sched_domains
>>  arch_update_cpu_topology
>>   numa_update_cpu_topology
>>    find_and_online_cpu_nid
>> 
>> and by the time find_and_online_cpu_nid() gets called to online the node, it might be
>> too late as we might have referenced some NODE_DATA() fields.
>> Note that this happens at a much later stage in cpuhp.
>> 
>> Also note that at a much earlier stage, we do already have a try_online_node() in cpu_up(),
>> which should allocate-and-online the node and prevent accessing garbage.
>> But the problem is that, on powerpc, all possible cpus have the same node set at boot stage
>> (see arch/powerpc/mm/numa.c:mem_topology_setup),
>> so cpu_to_node() returns the same thing until it the mapping gets update (which happens in
>> start_secondary()->set_numa_node()), and so, the try_online_node() from cpu_up() does not
>> apply on the right node, because it still holds the not-up-to-date mapping node <-> cpu.
>> 
>> (e.g: in my test case, when onlining a CPU belongin to node1, cpu_up()->try_online_node()
>>  tries to online node0, or whatever old mapping numa<->cpu is there).
>> 
>> So, we have something like:
>> 
>> dlpar_online_cpu
>>  device_online
>>   dev->bus->online
>>    cpu_subsys_online
>>     cpu_device_up
>>      cpu_up
>>       try_online_node (old mapping nid <-> cpu )
>>       ...
>>       ...
>>       cphp_callbacks
>>        sched_cpu_activate
>>         cpuset_update_active_cpus
>>          schedule_work(&cpuset_hotplug_work)
>>           cpuset_hotplug_work
>>            partition_sched_domains
>>             arch_update_cpu_topology
>>              numa_update_cpu_topology
>>               find_and_online_cpu_nid (online new_nid)
>> 
>> 
>> So, yeah, the real onlining in numa_update_cpu_topology()->find_and_online_cpu_nid()
>> happens too late, that is why adding find_and_online_cpu_nid() back in dlpar_online_cpu()
>> fixed the issue, but we should not need this special casing at all.
>> 
>> We do already know the numa<->cpu associativity in
>> dlpar_online_cpu()->find_and_online_cpu_nid(), so we should just be able to
>> update the numa<->cpu mapping, and let the try_online_node() do the right thing.
>> 
>> With this in mind, I came up with the following patch, where I carried out a battery
>> of tests for CPU hotplug stuff and it worked as expected.
>> But I am not familiar with all powerpc pitfalls, e.g: dedicated vs shared cpus etc, so
>> I would like to hear from more familiar people.
>> 
>> The patch is:
>> 
>> From: Oscar Salvador <osalvador@suse.de>
>> Date: Wed, 6 Apr 2022 14:39:15 +0200
>> Subject: [PATCH] powerpc/numa: Associate numa node to its cpu earlier
>> 
>> powerpc is the only platform that do not rely on
>> cpu_up()->try_online_node() to bring up a numa node,
>> and special cases it, instead, deep in its own machinery:
>> 
>> dlpar_online_cpu
>>  find_and_online_cpu_nid
>>   try_online_node
>> 
>> This should not be needed, but the thing is that the try_online_node()
>> from cpu_up() will not apply on the right node, because cpu_to_node()
>> will return the old mapping numa<->cpu that gets set on boot stage
>> for all possible cpus.
>> 
>> That can be seen easily if we try to print out the numa node passed
>> to try_online_node() in cpu_up().
>> 
>> The thing is that the numa<->cpu mapping does not get updated till a much
>> later stage in start_secondary:
>> 
>> start_secondary:
>>  set_numa_node(numa_cpu_lookup_table[cpu])
>> 
>> But we do not really care, as we already now the
>> CPU <-> NUMA associativity back in find_and_online_cpu_nid(),
>> so let us make use of that and set the proper numa<->cpu mapping,
>> so cpu_to_node() in cpu_up() returns the right node and
>> try_online_node() can do its work.
>> 
>> Signed-off-by: Oscar Salvador <osalvador@suse.de>
>
> Looks good to me.
>
> Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

Yeah agreed, thanks for getting to the root of the problem.

Can you resend as a standalone patch. Because you sent it as a reply it
won't be recognised by patchwork[1] which means it risks getting lost.

cheers

1: http://patchwork.ozlabs.org/project/linuxppc-dev/list/
