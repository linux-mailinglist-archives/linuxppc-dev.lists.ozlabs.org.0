Return-Path: <linuxppc-dev+bounces-12568-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF7DB9BC41
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Sep 2025 21:50:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cX6sJ4kVlz3bvd;
	Thu, 25 Sep 2025 05:50:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758743444;
	cv=none; b=I6/MsQbP3VbcnLnpW2EFppczCbtwS+nm2hJndn29tde6SIoutF2EwnbYLiDo9/gJLAOfPNXhqO2MfxurKbg8Pnqvbq1+RFDHJrApOKM0B+jAVjggvSt7lYCc5KSovaqWKCnLPDgNiW+NK5XUaMaGz1d7Kp+G5Y8dXV7OUGKTwsWgnYkbLhSb+OEPcXbhEbBuKfkzXhcTRwmvG1z9JE3BmOM7uVJ28DrfnPK2H+7QWBrC/Mv2m6gIOF9fEavM/p9ttrdJ6+spMKKF1L1VYfsev+g/xWpeYHb07GGqVA7pBNGQB6MxzhK/s1zSXXwqSf0SHB32W3JS4s2XQt8lSgTNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758743444; c=relaxed/relaxed;
	bh=2x7+Rm13mRhSwl91pdR3BNXkadzfUgRUZMh799UmRzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UeAsFujpmVe2FwyL9UAPZ7iXuQgXhUZlvNE/loSAsTZ0axywSoIUnFRTxyqZ4RLMId3jbH2JFmUQBt+eMww2PBquL395LMdMYab3ApMtpuYOamJRnEz/eG+eQGzOnWma6UoXxmCGjIz+gI4PTibiMsayUqn+lkTbA6xPJwCk9zjW4q26mXEjmezKkX2h9r780bm5xxAEvBHdUpMdvyEeH2xSguAZ09A3o/4JG8Hy5KLHpSIWpqn/lIjx0gn9U8ySeUYCmajyBeKwEgyccE/FBhkNNHvqsE3hm+r31u2C5vVcoMZycf7aTosXo4DeEAIr/h6/sTJzysnOXvxGzHNCuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cX6sH09SGz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Sep 2025 05:50:43 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cX64v3MX8z9sRr;
	Wed, 24 Sep 2025 21:15:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MjkCrWp6j8_X; Wed, 24 Sep 2025 21:15:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cX64v2BmNz9sRk;
	Wed, 24 Sep 2025 21:15:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2A1358B770;
	Wed, 24 Sep 2025 21:15:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WzjUaTohc-zd; Wed, 24 Sep 2025 21:15:43 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1F2AA8B763;
	Wed, 24 Sep 2025 21:15:40 +0200 (CEST)
Message-ID: <d168030f-388c-4f58-987f-648bba5b32f9@csgroup.eu>
Date: Wed, 24 Sep 2025 21:15:40 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drivers/base/node: merge register_one_node() and
 register_node() to a single function.
To: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
 Aboorva Devarajan <aboorvad@linux.ibm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>
References: <cover.1758736423.git.donettom@linux.ibm.com>
 <40257b5228dec05e5b252f02438608eb8d681a2d.1758736423.git.donettom@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <40257b5228dec05e5b252f02438608eb8d681a2d.1758736423.git.donettom@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 24/09/2025 à 20:40, Donet Tom a écrit :
> register_one_node() and register_node() are small functions.
> This patch merges them into a single function named register_node()
> to improve code readability.

This is unclear.

What it really does is it folds register_node() into its only caller 
which is register_one_node() and then it renames register_one_node() 
into register_node().

> 
> No functional changes are introduced.
> 
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> ---
>   arch/powerpc/platforms/pseries/pci_dlpar.c |  2 +-
>   arch/x86/mm/numa.c                         |  4 +-
>   drivers/base/node.c                        | 52 +++++++++-------------
>   include/linux/node.h                       |  4 +-
>   mm/memory_hotplug.c                        |  4 +-
>   mm/mm_init.c                               |  2 +-
>   6 files changed, 28 insertions(+), 40 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/pci_dlpar.c b/arch/powerpc/platforms/pseries/pci_dlpar.c
> index aeb8633a3d00..8c77ec7980de 100644
> --- a/arch/powerpc/platforms/pseries/pci_dlpar.c
> +++ b/arch/powerpc/platforms/pseries/pci_dlpar.c
> @@ -29,7 +29,7 @@ struct pci_controller *init_phb_dynamic(struct device_node *dn)
>   	nid = of_node_to_nid(dn);
>   	if (likely((nid) >= 0)) {
>   		if (!node_online(nid)) {
> -			if (register_one_node(nid)) {
> +			if (register_node(nid)) {
>   				pr_err("PCI: Failed to register node %d\n", nid);
>   			} else {
>   				update_numa_distance(dn);
> diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> index c24890c40138..7a97327140df 100644
> --- a/arch/x86/mm/numa.c
> +++ b/arch/x86/mm/numa.c
> @@ -262,7 +262,7 @@ void __init init_gi_nodes(void)
>   	 * bringup_nonboot_cpus
>   	 *  cpu_up
>   	 *   __try_online_node
> -	 *    register_one_node
> +	 *    register_node
>   	 * because node_subsys is not initialized yet.
>   	 * TODO remove dependency on node_online
>   	 */
> @@ -303,7 +303,7 @@ void __init init_cpu_to_node(void)
>   		 * bringup_nonboot_cpus
>   		 *  cpu_up
>   		 *   __try_online_node
> -		 *    register_one_node
> +		 *    register_node
>   		 * because node_subsys is not initialized yet.
>   		 * TODO remove dependency on node_online
>   		 */
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index 6b6e55a98b79..eab620e29c78 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -638,33 +638,6 @@ static void node_device_release(struct device *dev)
>   	kfree(to_node(dev));
>   }
>   
> -/*
> - * register_node - Setup a sysfs device for a node.
> - * @num - Node number to use when creating the device.
> - *
> - * Initialize and register the node device.
> - */
> -static int register_node(struct node *node, int num)
> -{
> -	int error;
> -
> -	node->dev.id = num;
> -	node->dev.bus = &node_subsys;
> -	node->dev.release = node_device_release;
> -	node->dev.groups = node_dev_groups;
> -	error = device_register(&node->dev);
> -
> -	if (error) {
> -		put_device(&node->dev);
> -	} else {
> -		hugetlb_register_node(node);
> -		compaction_register_node(node);
> -		reclaim_register_node(node);
> -	}
> -
> -	return error;
> -}
> -
>   /**
>    * unregister_node - unregister a node device
>    * @node: node going away
> @@ -869,7 +842,13 @@ void register_memory_blocks_under_node_hotplug(int nid, unsigned long start_pfn,
>   }
>   #endif /* CONFIG_MEMORY_HOTPLUG */
>   
> -int register_one_node(int nid)
> +/*
> + * register_node - Setup a sysfs device for a node.
> + * @nid - Node number to use when creating the device.
> + *
> + * Initialize and register the node device.
> + */
> +int register_node(int nid)
>   {
>   	int error;
>   	int cpu;
> @@ -880,14 +859,23 @@ int register_one_node(int nid)
>   		return -ENOMEM;
>   
>   	INIT_LIST_HEAD(&node->access_list);
> -	node_devices[nid] = node;
>   
> -	error = register_node(node_devices[nid], nid);
> +	node->dev.id = nid;
> +	node->dev.bus = &node_subsys;
> +	node->dev.release = node_device_release;
> +	node->dev.groups = node_dev_groups;
> +
> +	error = device_register(&node->dev);
>   	if (error) {
> -		node_devices[nid] = NULL;
> +		put_device(&node->dev);
>   		return error;
>   	}
>   
> +	node_devices[nid] = node;
> +	hugetlb_register_node(node);
> +	compaction_register_node(node);
> +	reclaim_register_node(node);
> +
>   	/* link cpu under this node */
>   	for_each_present_cpu(cpu) {
>   		if (cpu_to_node(cpu) == nid)
> @@ -980,7 +968,7 @@ void __init node_dev_init(void)
>   	 * to already created cpu devices.
>   	 */
>   	for_each_online_node(i) {
> -		ret =  register_one_node(i);
> +		ret =  register_node(i);
>   		if (ret)
>   			panic("%s() failed to add node: %d\n", __func__, ret);
>   	}
> diff --git a/include/linux/node.h b/include/linux/node.h
> index 2c7529335b21..4dcf876cd0b4 100644
> --- a/include/linux/node.h
> +++ b/include/linux/node.h
> @@ -168,7 +168,7 @@ static inline int hotplug_node_notifier(notifier_fn_t fn, int pri)
>   #ifdef CONFIG_NUMA
>   extern void node_dev_init(void);
>   /* Core of the node registration - only memory hotplug should use this */
> -extern int register_one_node(int nid);
> +extern int register_node(int nid);

extern keyword is pointless on functions prototypes.

checkpatch.pl usually complains about that.

I know previous prototype was extern and all surrounding also are, but 
it is not because mistakes were done in the past that you have to 
continue doing the same mistakes.

>   extern void unregister_one_node(int nid);
>   extern int register_cpu_under_node(unsigned int cpu, unsigned int nid);
>   extern int unregister_cpu_under_node(unsigned int cpu, unsigned int nid);
> @@ -181,7 +181,7 @@ extern int register_memory_node_under_compute_node(unsigned int mem_nid,
>   static inline void node_dev_init(void)
>   {
>   }
> -static inline int register_one_node(int nid)
> +static inline int register_node(int nid)
>   {
>   	return 0;
>   }
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 0be83039c3b5..6c050d867031 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1311,7 +1311,7 @@ static int __try_online_node(int nid, bool set_node_online)
>   
>   	if (set_node_online) {
>   		node_set_online(nid);
> -		ret = register_one_node(nid);
> +		ret = register_node(nid);
>   		BUG_ON(ret);
>   	}
>   out:
> @@ -1542,7 +1542,7 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>   		goto error_memblock_remove;
>   	if (ret) {
>   		node_set_online(nid);
> -		ret = register_one_node(nid);
> +		ret = register_node(nid);
>   		if (WARN_ON(ret)) {
>   			node_set_offline(nid);
>   			goto error_memblock_remove;
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index df614556741a..e1a19a3dadd7 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1909,7 +1909,7 @@ void __init free_area_init(unsigned long *max_zone_pfn)
>   		free_area_init_node(nid);
>   
>   		/*
> -		 * No sysfs hierarchy will be created via register_one_node()
> +		 * No sysfs hierarchy will be created via register_node()
>   		 *for memory-less node because here it's not marked as N_MEMORY
>   		 *and won't be set online later. The benefit is userspace
>   		 *program won't be confused by sysfs files/directories of


