Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 949204F64C9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 18:19:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYV8f3lhSz3bd9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 02:19:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ixC6cJSw;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IHLjDnNi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=osalvador@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ixC6cJSw; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=IHLjDnNi; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYV7w1l7fz2yXM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 02:19:07 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2218E210EE;
 Wed,  6 Apr 2022 16:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649261943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wlmYLOHX5VMXy5nEdrG4o4AAuirTE+n7iRh/t3Fj3hg=;
 b=ixC6cJSwo/13qyBfSTUtvDwlqcXOLgocHYL9HD13RBkmdBsMFvTTBBR8n1ABTiF876m1nj
 JGB+o97atBYhougUPAErHo5SrHGiq130iB0FAi3ldnNMBin2p0BpewCmNH6T1HZulQTQrl
 oTthpB1IMFlsGpX1vtGoavQm8y5oeXA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649261943;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wlmYLOHX5VMXy5nEdrG4o4AAuirTE+n7iRh/t3Fj3hg=;
 b=IHLjDnNiYzebzvVEASx4W9hoAQlXZsGQaqdphO2hIcV8j6PvbX7ZuP5RKVLLrAgAon/H1w
 N1EUhuyL/SxlNOAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 99D8B139F5;
 Wed,  6 Apr 2022 16:19:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /9XYIXa9TWLVUAAAMHmgww
 (envelope-from <osalvador@suse.de>); Wed, 06 Apr 2022 16:19:02 +0000
Date: Wed, 6 Apr 2022 18:19:00 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/numa: Handle partially initialized numa nodes
Message-ID: <Yk29dMa3H8bk0yST@localhost.localdomain>
References: <20220330135123.1868197-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330135123.1868197-1-srikar@linux.vnet.ibm.com>
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
Cc: Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>, linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 30, 2022 at 07:21:23PM +0530, Srikar Dronamraju wrote:
>  arch/powerpc/mm/numa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index b9b7fefbb64b..13022d734951 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -1436,7 +1436,7 @@ int find_and_online_cpu_nid(int cpu)
>  	if (new_nid < 0 || !node_possible(new_nid))
>  		new_nid = first_online_node;
>  
> -	if (NODE_DATA(new_nid) == NULL) {
> +	if (!node_online(new_nid)) {
>  #ifdef CONFIG_MEMORY_HOTPLUG
>  		/*
>  		 * Need to ensure that NODE_DATA is initialized for a node from

Because of this fix, I wanted to check whether we might have any more fallouts due
to ("mm: handle uninitialized numa nodes gracefully"), and it made me look closer
as to why powerpc is the only platform that special cases try_online_node(),
while all others rely on cpu_up()->try_online_node() to do the right thing.

So, I had a look.
Let us rewind a bit:

The commit that sets find_and_online_cpu_nid() in dlpar_online_cpu was
e67e02a544e9 ("powerpc/pseries: Fix cpu hotplug crash with memoryless nodes").

In there, it says that we have the following picture:

partition_sched_domains
 arch_update_cpu_topology
  numa_update_cpu_topology
   find_and_online_cpu_nid

and by the time find_and_online_cpu_nid() gets called to online the node, it might be
too late as we might have referenced some NODE_DATA() fields.
Note that this happens at a much later stage in cpuhp.

Also note that at a much earlier stage, we do already have a try_online_node() in cpu_up(),
which should allocate-and-online the node and prevent accessing garbage.
But the problem is that, on powerpc, all possible cpus have the same node set at boot stage
(see arch/powerpc/mm/numa.c:mem_topology_setup),
so cpu_to_node() returns the same thing until it the mapping gets update (which happens in
start_secondary()->set_numa_node()), and so, the try_online_node() from cpu_up() does not
apply on the right node, because it still holds the not-up-to-date mapping node <-> cpu.

(e.g: in my test case, when onlining a CPU belongin to node1, cpu_up()->try_online_node()
 tries to online node0, or whatever old mapping numa<->cpu is there).

So, we have something like:

dlpar_online_cpu
 device_online
  dev->bus->online
   cpu_subsys_online
    cpu_device_up
     cpu_up
      try_online_node (old mapping nid <-> cpu )
      ...
      ...
      cphp_callbacks
       sched_cpu_activate
        cpuset_update_active_cpus
         schedule_work(&cpuset_hotplug_work)
          cpuset_hotplug_work
           partition_sched_domains
            arch_update_cpu_topology
             numa_update_cpu_topology
              find_and_online_cpu_nid (online new_nid)


So, yeah, the real onlining in numa_update_cpu_topology()->find_and_online_cpu_nid()
happens too late, that is why adding find_and_online_cpu_nid() back in dlpar_online_cpu()
fixed the issue, but we should not need this special casing at all.

We do already know the numa<->cpu associativity in
dlpar_online_cpu()->find_and_online_cpu_nid(), so we should just be able to
update the numa<->cpu mapping, and let the try_online_node() do the right thing.

With this in mind, I came up with the following patch, where I carried out a battery
of tests for CPU hotplug stuff and it worked as expected.
But I am not familiar with all powerpc pitfalls, e.g: dedicated vs shared cpus etc, so
I would like to hear from more familiar people.

The patch is:

From: Oscar Salvador <osalvador@suse.de>
Date: Wed, 6 Apr 2022 14:39:15 +0200
Subject: [PATCH] powerpc/numa: Associate numa node to its cpu earlier

powerpc is the only platform that do not rely on
cpu_up()->try_online_node() to bring up a numa node,
and special cases it, instead, deep in its own machinery:

dlpar_online_cpu
 find_and_online_cpu_nid
  try_online_node

This should not be needed, but the thing is that the try_online_node()
from cpu_up() will not apply on the right node, because cpu_to_node()
will return the old mapping numa<->cpu that gets set on boot stage
for all possible cpus.

That can be seen easily if we try to print out the numa node passed
to try_online_node() in cpu_up().

The thing is that the numa<->cpu mapping does not get updated till a much
later stage in start_secondary:

start_secondary:
 set_numa_node(numa_cpu_lookup_table[cpu])

But we do not really care, as we already now the
CPU <-> NUMA associativity back in find_and_online_cpu_nid(),
so let us make use of that and set the proper numa<->cpu mapping,
so cpu_to_node() in cpu_up() returns the right node and
try_online_node() can do its work.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
 arch/powerpc/include/asm/topology.h          |  8 ++-----
 arch/powerpc/mm/numa.c                       | 31 +++++++---------------------
 arch/powerpc/platforms/pseries/hotplug-cpu.c |  2 +-
 3 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 36fcafb1fd6d..6ae1b2dce83e 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -111,14 +111,10 @@ static inline void unmap_cpu_from_node(unsigned long cpu) {}
 #endif /* CONFIG_NUMA */

 #if defined(CONFIG_NUMA) && defined(CONFIG_PPC_SPLPAR)
-extern int find_and_online_cpu_nid(int cpu);
+extern void find_and_update_cpu_nid(int cpu);
 extern int cpu_to_coregroup_id(int cpu);
 #else
-static inline int find_and_online_cpu_nid(int cpu)
-{
-	return 0;
-}
-
+static inline void find_and_update_cpu_nid(int cpu) {}
 static inline int cpu_to_coregroup_id(int cpu)
 {
 #ifdef CONFIG_SMP
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index b9b7fefbb64b..b5bc8b1a833d 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1423,43 +1423,28 @@ static long vphn_get_associativity(unsigned long cpu,
 	return rc;
 }

-int find_and_online_cpu_nid(int cpu)
+void find_and_update_cpu_nid(int cpu)
 {
 	__be32 associativity[VPHN_ASSOC_BUFSIZE] = {0};
 	int new_nid;

 	/* Use associativity from first thread for all siblings */
 	if (vphn_get_associativity(cpu, associativity))
-		return cpu_to_node(cpu);
+		return;

+	/* Do not have previous associativity, so find it now. */
 	new_nid = associativity_to_nid(associativity);
+
 	if (new_nid < 0 || !node_possible(new_nid))
 		new_nid = first_online_node;
-
-	if (NODE_DATA(new_nid) == NULL) {
-#ifdef CONFIG_MEMORY_HOTPLUG
-		/*
-		 * Need to ensure that NODE_DATA is initialized for a node from
-		 * available memory (see memblock_alloc_try_nid). If unable to
-		 * init the node, then default to nearest node that has memory
-		 * installed. Skip onlining a node if the subsystems are not
-		 * yet initialized.
-		 */
-		if (!topology_inited || try_online_node(new_nid))
-			new_nid = first_online_node;
-#else
-		/*
-		 * Default to using the nearest node that has memory installed.
-		 * Otherwise, it would be necessary to patch the kernel MM code
-		 * to deal with more memoryless-node error conditions.
+	else
+		/* Associate node <-> cpu, so cpu_up() calls
+		 * try_online_node() on the right node.
 		 */
-		new_nid = first_online_node;
-#endif
-	}
+		set_cpu_numa_node(cpu, new_nid);

 	pr_debug("%s:%d cpu %d nid %d\n", __FUNCTION__, __LINE__,
 		cpu, new_nid);
-	return new_nid;
 }

 int cpu_to_coregroup_id(int cpu)
diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index b81fc846d99c..0f8cd8b06432 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -398,7 +398,7 @@ static int dlpar_online_cpu(struct device_node *dn)
 			if (get_hard_smp_processor_id(cpu) != thread)
 				continue;
 			cpu_maps_update_done();
-			find_and_online_cpu_nid(cpu);
+			find_and_update_cpu_nid(cpu);
 			rc = device_online(get_cpu_device(cpu));
 			if (rc) {
 				dlpar_offline_cpu(dn);
--
2.16.4

-- 
Oscar Salvador
SUSE Labs
