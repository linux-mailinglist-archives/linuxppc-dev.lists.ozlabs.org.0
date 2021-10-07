Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F204424FD6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 11:14:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ5Gz393sz3bXR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 20:14:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XZZ+FoLG;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ABnljxMd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=osalvador@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=XZZ+FoLG; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ABnljxMd; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ5GF3c40z2xgP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 20:13:25 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 98A6F225D0;
 Thu,  7 Oct 2021 09:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633598002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VzS0tkOtXPnUweK9gUuFI76p1jCgE7wRtX51d/k/4t4=;
 b=XZZ+FoLGvsvaSUO2b/CRuKch18XW0AAxTewiLtI56ErMmkWUZew4Aeztwx9suKcUQG5qCK
 /4WXOFljMGj7FyWyvZNQRV3hhUfKHHCjyG/T4KFGVpW9DPHHhYOvqQp0MJVGX14sSaIJgK
 Qqqy4CA3Yu1OP8lRs0fnJ1ZJx/8P2ng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633598002;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VzS0tkOtXPnUweK9gUuFI76p1jCgE7wRtX51d/k/4t4=;
 b=ABnljxMdiFjR2q8gMpVu0Kzb9YYf5zH3/WXV5EOWZlrsnKCRdkqGiWxUL9mWKNurYS1n/P
 L8hiSSExRM9GanBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 11BEC13A98;
 Thu,  7 Oct 2021 09:13:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bPeNATG6XmFeLQAAMHmgww
 (envelope-from <osalvador@suse.de>); Thu, 07 Oct 2021 09:13:21 +0000
Date: Thu, 7 Oct 2021 11:13:19 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 4/6] mm/memory_hotplug: remove HIGHMEM leftovers
Message-ID: <YV66LwMsEqYCHWPa@localhost.localdomain>
References: <20210929143600.49379-1-david@redhat.com>
 <20210929143600.49379-5-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210929143600.49379-5-david@redhat.com>
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
Cc: Michal Hocko <mhocko@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
 Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 29, 2021 at 04:35:58PM +0200, David Hildenbrand wrote:
> We don't support CONFIG_MEMORY_HOTPLUG on 32 bit and consequently not
> HIGHMEM. Let's remove any leftover code -- including the unused
> "status_change_nid_high" field part of the memory notifier.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

> ---
>  Documentation/core-api/memory-hotplug.rst     |  3 --
>  .../zh_CN/core-api/memory-hotplug.rst         |  4 ---
>  include/linux/memory.h                        |  1 -
>  mm/memory_hotplug.c                           | 36 ++-----------------
>  4 files changed, 2 insertions(+), 42 deletions(-)
> 
> diff --git a/Documentation/core-api/memory-hotplug.rst b/Documentation/core-api/memory-hotplug.rst
> index de7467e48067..682259ee633a 100644
> --- a/Documentation/core-api/memory-hotplug.rst
> +++ b/Documentation/core-api/memory-hotplug.rst
> @@ -57,7 +57,6 @@ The third argument (arg) passes a pointer of struct memory_notify::
>  		unsigned long start_pfn;
>  		unsigned long nr_pages;
>  		int status_change_nid_normal;
> -		int status_change_nid_high;
>  		int status_change_nid;
>  	}
>  
> @@ -65,8 +64,6 @@ The third argument (arg) passes a pointer of struct memory_notify::
>  - nr_pages is # of pages of online/offline memory.
>  - status_change_nid_normal is set node id when N_NORMAL_MEMORY of nodemask
>    is (will be) set/clear, if this is -1, then nodemask status is not changed.
> -- status_change_nid_high is set node id when N_HIGH_MEMORY of nodemask
> -  is (will be) set/clear, if this is -1, then nodemask status is not changed.
>  - status_change_nid is set node id when N_MEMORY of nodemask is (will be)
>    set/clear. It means a new(memoryless) node gets new memory by online and a
>    node loses all memory. If this is -1, then nodemask status is not changed.
> diff --git a/Documentation/translations/zh_CN/core-api/memory-hotplug.rst b/Documentation/translations/zh_CN/core-api/memory-hotplug.rst
> index 161f4d2c18cc..9a204eb196f2 100644
> --- a/Documentation/translations/zh_CN/core-api/memory-hotplug.rst
> +++ b/Documentation/translations/zh_CN/core-api/memory-hotplug.rst
> @@ -63,7 +63,6 @@ memory_notify结构体的指针::
>  		unsigned long start_pfn;
>  		unsigned long nr_pages;
>  		int status_change_nid_normal;
> -		int status_change_nid_high;
>  		int status_change_nid;
>  	}
>  
> @@ -74,9 +73,6 @@ memory_notify结构体的指针::
>  - status_change_nid_normal是当nodemask的N_NORMAL_MEMORY被设置/清除时设置节
>    点id，如果是-1，则nodemask状态不改变。
>  
> -- status_change_nid_high是当nodemask的N_HIGH_MEMORY被设置/清除时设置的节点
> -  id，如果这个值为-1，那么nodemask状态不会改变。
> -
>  - status_change_nid是当nodemask的N_MEMORY被（将）设置/清除时设置的节点id。这
>    意味着一个新的（没上线的）节点通过联机获得新的内存，而一个节点失去了所有的内
>    存。如果这个值为-1，那么nodemask的状态就不会改变。
> diff --git a/include/linux/memory.h b/include/linux/memory.h
> index dd6e608c3e0b..c46ff374d48d 100644
> --- a/include/linux/memory.h
> +++ b/include/linux/memory.h
> @@ -96,7 +96,6 @@ struct memory_notify {
>  	unsigned long start_pfn;
>  	unsigned long nr_pages;
>  	int status_change_nid_normal;
> -	int status_change_nid_high;
>  	int status_change_nid;
>  };
>  
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 8d7b2b593a26..95c927c8bfb8 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -21,7 +21,6 @@
>  #include <linux/memory.h>
>  #include <linux/memremap.h>
>  #include <linux/memory_hotplug.h>
> -#include <linux/highmem.h>
>  #include <linux/vmalloc.h>
>  #include <linux/ioport.h>
>  #include <linux/delay.h>
> @@ -585,10 +584,6 @@ void generic_online_page(struct page *page, unsigned int order)
>  	debug_pagealloc_map_pages(page, 1 << order);
>  	__free_pages_core(page, order);
>  	totalram_pages_add(1UL << order);
> -#ifdef CONFIG_HIGHMEM
> -	if (PageHighMem(page))
> -		totalhigh_pages_add(1UL << order);
> -#endif
>  }
>  EXPORT_SYMBOL_GPL(generic_online_page);
>  
> @@ -625,16 +620,11 @@ static void node_states_check_changes_online(unsigned long nr_pages,
>  
>  	arg->status_change_nid = NUMA_NO_NODE;
>  	arg->status_change_nid_normal = NUMA_NO_NODE;
> -	arg->status_change_nid_high = NUMA_NO_NODE;
>  
>  	if (!node_state(nid, N_MEMORY))
>  		arg->status_change_nid = nid;
>  	if (zone_idx(zone) <= ZONE_NORMAL && !node_state(nid, N_NORMAL_MEMORY))
>  		arg->status_change_nid_normal = nid;
> -#ifdef CONFIG_HIGHMEM
> -	if (zone_idx(zone) <= ZONE_HIGHMEM && !node_state(nid, N_HIGH_MEMORY))
> -		arg->status_change_nid_high = nid;
> -#endif
>  }
>  
>  static void node_states_set_node(int node, struct memory_notify *arg)
> @@ -642,9 +632,6 @@ static void node_states_set_node(int node, struct memory_notify *arg)
>  	if (arg->status_change_nid_normal >= 0)
>  		node_set_state(node, N_NORMAL_MEMORY);
>  
> -	if (arg->status_change_nid_high >= 0)
> -		node_set_state(node, N_HIGH_MEMORY);
> -
>  	if (arg->status_change_nid >= 0)
>  		node_set_state(node, N_MEMORY);
>  }
> @@ -1801,7 +1788,6 @@ static void node_states_check_changes_offline(unsigned long nr_pages,
>  
>  	arg->status_change_nid = NUMA_NO_NODE;
>  	arg->status_change_nid_normal = NUMA_NO_NODE;
> -	arg->status_change_nid_high = NUMA_NO_NODE;
>  
>  	/*
>  	 * Check whether node_states[N_NORMAL_MEMORY] will be changed.
> @@ -1816,24 +1802,9 @@ static void node_states_check_changes_offline(unsigned long nr_pages,
>  	if (zone_idx(zone) <= ZONE_NORMAL && nr_pages >= present_pages)
>  		arg->status_change_nid_normal = zone_to_nid(zone);
>  
> -#ifdef CONFIG_HIGHMEM
> -	/*
> -	 * node_states[N_HIGH_MEMORY] contains nodes which
> -	 * have normal memory or high memory.
> -	 * Here we add the present_pages belonging to ZONE_HIGHMEM.
> -	 * If the zone is within the range of [0..ZONE_HIGHMEM), and
> -	 * we determine that the zones in that range become empty,
> -	 * we need to clear the node for N_HIGH_MEMORY.
> -	 */
> -	present_pages += pgdat->node_zones[ZONE_HIGHMEM].present_pages;
> -	if (zone_idx(zone) <= ZONE_HIGHMEM && nr_pages >= present_pages)
> -		arg->status_change_nid_high = zone_to_nid(zone);
> -#endif
> -
>  	/*
> -	 * We have accounted the pages from [0..ZONE_NORMAL), and
> -	 * in case of CONFIG_HIGHMEM the pages from ZONE_HIGHMEM
> -	 * as well.
> +	 * We have accounted the pages from [0..ZONE_NORMAL); ZONE_HIGHMEM
> +	 * does not apply as we don't support 32bit.
>  	 * Here we count the possible pages from ZONE_MOVABLE.
>  	 * If after having accounted all the pages, we see that the nr_pages
>  	 * to be offlined is over or equal to the accounted pages,
> @@ -1851,9 +1822,6 @@ static void node_states_clear_node(int node, struct memory_notify *arg)
>  	if (arg->status_change_nid_normal >= 0)
>  		node_clear_state(node, N_NORMAL_MEMORY);
>  
> -	if (arg->status_change_nid_high >= 0)
> -		node_clear_state(node, N_HIGH_MEMORY);
> -
>  	if (arg->status_change_nid >= 0)
>  		node_clear_state(node, N_MEMORY);
>  }
> -- 
> 2.31.1
> 
> 

-- 
Oscar Salvador
SUSE Labs
