Return-Path: <linuxppc-dev+bounces-12567-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4D3B9BC3E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Sep 2025 21:50:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cX6sB58c7z2yqv;
	Thu, 25 Sep 2025 05:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758743438;
	cv=none; b=gqoHBHoaak+oQ0MJkWVeyLJU9X5lbHwsIG1ERqimtezHgHxumqn4PT9cHoZEBWpNZHa9bwj03Cyo780UKNJJ7BdNX6I1Bli5zQvSQFTUENEf64mabtRfXk/LDPYHQvImQd3D/JfQMTp18igrycCEvMnuumKzTUu/Ylz92nNDIdlD3WZZhJXq/jhqUv7fRIH5l0WXb/mhJ9aZQR/57JvBJPyortcBoW919kB+36t+v8Hx4m8FQAbsqAlpwYKIpjfNYy5lKsAR84uS2mNEgkxSHe4TIAm6UJThP2raNiIOhBdMZxonmO3Ohe6NHBM9QRsYpL01Jgz3Zja3NEI8daYhlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758743438; c=relaxed/relaxed;
	bh=0T0BEn3CGJdLUo/alIU+i1QAr4lyYS9YdnkHR5OSRG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wr2NfC4w/WFjpUbsb6M4FvTrewbwn63RWyCHryd+qtpoKaeHK3rJGzotNqjsmowmZG1oNLmw1SK6UZerG2/OXKVYes/yA0CXQ1BBujm0ki2NBuL2OMNjlhT1lhPSRPih5t3rAjccXZ12QUMwNT8YSLqYwZUiFofMXaWuvYxv5jS/o6dY5lM5q0a3uHbrf7+TSHVi7JI8NNGrHkcOdEGcrVz1Eqy5umZYmQ+LmnBsIeouQrQjWmhYcVNLl4wzE+FPfF0EEcX3yS3iUHTnfZG3fkMMMU/ixZPt3mmLaCep42hxthATUdpP2xn5EBLc/wdhq4CD6Wcsf1bmylJQ4WgZ8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cX6s97331z2xck
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Sep 2025 05:50:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cX69D2dJ6z9sRy;
	Wed, 24 Sep 2025 21:19:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nqpn_EP-cTuc; Wed, 24 Sep 2025 21:19:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cX69D0pt8z9sRk;
	Wed, 24 Sep 2025 21:19:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CC7DE8B76C;
	Wed, 24 Sep 2025 21:19:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id edNE7oeRg5Qo; Wed, 24 Sep 2025 21:19:27 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 135518B768;
	Wed, 24 Sep 2025 21:19:25 +0200 (CEST)
Message-ID: <fa2272b9-13f2-464f-bb95-72fd31f1dcf9@csgroup.eu>
Date: Wed, 24 Sep 2025 21:19:25 +0200
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
Subject: Re: [PATCH 2/2] drivers/base/node: merge unregister_one_node() and
 unregister_node() to a single function.
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
 <c99d97e253378455f1b3b7bec5b0c830d4e73074.1758736423.git.donettom@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <c99d97e253378455f1b3b7bec5b0c830d4e73074.1758736423.git.donettom@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 24/09/2025 à 20:40, Donet Tom a écrit :
> unregister_one_node() and unregister_node() are small functions.
> This patch merges them into a single function named unregister_node()
> to improve code readability.

Same comment than patch 1. It is not only because they are small that 
you merge them, it is primarily because unregister_node() only has one 
caller.

> 
> No functional changes are introduced.
> 
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> ---
>   drivers/base/node.c  | 37 +++++++++++++++++--------------------
>   include/linux/node.h |  6 ++----
>   mm/memory_hotplug.c  |  4 ++--
>   3 files changed, 21 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index eab620e29c78..d460c1675c77 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -638,23 +638,6 @@ static void node_device_release(struct device *dev)
>   	kfree(to_node(dev));
>   }
>   
> -/**
> - * unregister_node - unregister a node device
> - * @node: node going away
> - *
> - * Unregisters a node device @node.  All the devices on the node must be
> - * unregistered before calling this function.
> - */
> -void unregister_node(struct node *node)
> -{
> -	hugetlb_unregister_node(node);
> -	compaction_unregister_node(node);
> -	reclaim_unregister_node(node);
> -	node_remove_accesses(node);
> -	node_remove_caches(node);
> -	device_unregister(&node->dev);
> -}
> -
>   struct node *node_devices[MAX_NUMNODES];
>   
>   /*
> @@ -887,12 +870,26 @@ int register_node(int nid)
>   	return error;
>   }
>   
> -void unregister_one_node(int nid)
> +/**
> + * unregister_node - unregister a node device
> + * @nid: nid of the node going away
> + *
> + * Unregisters the node device at node id  @nid.  All the devices on the
> + * node must be unregistered before calling this function.
> + */
> +void unregister_node(int nid)
>   {
> -	if (!node_devices[nid])
> +	struct node *node = node_devices[nid];
> +
> +	if (!node)
>   		return;
>   
> -	unregister_node(node_devices[nid]);
> +	hugetlb_unregister_node(node);
> +	compaction_unregister_node(node);
> +	reclaim_unregister_node(node);
> +	node_remove_accesses(node);
> +	node_remove_caches(node);
> +	device_unregister(&node->dev);
>   	node_devices[nid] = NULL;
>   }
>   
> diff --git a/include/linux/node.h b/include/linux/node.h
> index 4dcf876cd0b4..d721127964b3 100644
> --- a/include/linux/node.h
> +++ b/include/linux/node.h
> @@ -124,8 +124,6 @@ static inline void register_memory_blocks_under_nodes(void)
>   }
>   #endif
>   
> -extern void unregister_node(struct node *node);
> -
>   struct node_notify {
>   	int nid;
>   };
> @@ -169,7 +167,7 @@ static inline int hotplug_node_notifier(notifier_fn_t fn, int pri)
>   extern void node_dev_init(void);
>   /* Core of the node registration - only memory hotplug should use this */
>   extern int register_node(int nid);
> -extern void unregister_one_node(int nid);
> +extern void unregister_node(int nid);

No 'extern' on function prototypes.

>   extern int register_cpu_under_node(unsigned int cpu, unsigned int nid);
>   extern int unregister_cpu_under_node(unsigned int cpu, unsigned int nid);
>   extern void unregister_memory_block_under_nodes(struct memory_block *mem_blk);
> @@ -185,7 +183,7 @@ static inline int register_node(int nid)
>   {
>   	return 0;
>   }
> -static inline int unregister_one_node(int nid)
> +static inline int unregister_node(int nid)
>   {
>   	return 0;
>   }
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 6c050d867031..94a8f6e8811a 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1596,7 +1596,7 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>   error:
>   	if (new_node) {
>   		node_set_offline(nid);
> -		unregister_one_node(nid);
> +		unregister_node(nid);
>   	}
>   error_memblock_remove:
>   	if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK))
> @@ -2201,7 +2201,7 @@ void try_offline_node(int nid)
>   	 * node now.
>   	 */
>   	node_set_offline(nid);
> -	unregister_one_node(nid);
> +	unregister_node(nid);
>   }
>   EXPORT_SYMBOL(try_offline_node);
>   


