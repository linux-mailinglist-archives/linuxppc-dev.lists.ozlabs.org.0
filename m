Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4E918825E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 12:40:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hWRy3ryxzDqYW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 22:39:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.66; helo=mail-wm1-f66.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hVbX0HHYzDqZX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 22:01:27 +1100 (AEDT)
Received: by mail-wm1-f66.google.com with SMTP id z13so4869963wml.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 04:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6EipgQFVgo/huvY/O4SRrQWe8XDQ0DAlFK59sTbjBUo=;
 b=PSR/m1k/kkWB5mAdZu1/23GE7DRLIvRCDZR7edUQpg2Fzj7yMspQUvwm2z63uwy/8G
 aYXN6tnt+UtJ51FojOOklnlntqt6OyRFsUFlpa+VDifvMcuYxH6ZzITiznEV5EI+HGDU
 tSyioylayCXvIK9MxQj1gQDJ4Y1gGIG9d7/vBxqQjIP9t3QvbBdS9QIuIm56SoMtI69u
 iwbW18EbwjorgiXiZ+7fCWELAVC1YtZhrywaNxCPjk3Xw2nQALbPGFzEi7cbD3DPJGrO
 QVG7NwfCJI3eyNjuAXqGwKr2yHp/xnezKvSKlbWVAuzrTScgYb2/1btXCympW12H6oCN
 kFGg==
X-Gm-Message-State: ANhLgQ1vahDoetoSFw/EvZme/ZypNoY7/gwLc9vW+IIXXWMsrb2ELT/a
 +sVor4ttnJglTA4aCh3tQQo=
X-Google-Smtp-Source: ADFU+vsC8Dzy9TGXCGl36ggWufL9wQJFd8vsUJbzPnDHv7C0memWXP80yZxYnWH2b4rw1DPH/xRZdA==
X-Received: by 2002:a1c:23d5:: with SMTP id j204mr4961015wmj.59.1584442884527; 
 Tue, 17 Mar 2020 04:01:24 -0700 (PDT)
Received: from localhost (ip-37-188-255-121.eurotel.cz. [37.188.255.121])
 by smtp.gmail.com with ESMTPSA id k3sm3879311wro.59.2020.03.17.04.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 04:01:23 -0700 (PDT)
Date: Tue, 17 Mar 2020 12:01:21 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 8/8] mm/memory_hotplug: allow to specify a default
 online_type
Message-ID: <20200317110121.GN26018@dhcp22.suse.cz>
References: <20200317104942.11178-1-david@redhat.com>
 <20200317104942.11178-9-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317104942.11178-9-david@redhat.com>
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
Cc: linux-hyperv@vger.kernel.org, Baoquan He <bhe@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 17-03-20 11:49:42, David Hildenbrand wrote:
> For now, distributions implement advanced udev rules to essentially
> - Don't online any hotplugged memory (s390x)
> - Online all memory to ZONE_NORMAL (e.g., most virt environments like
>   hyperv)
> - Online all memory to ZONE_MOVABLE in case the zone imbalance is taken
>   care of (e.g., bare metal, special virt environments)
> 
> In summary: All memory is usually onlined the same way, however, the
> kernel always has to ask user space to come up with the same answer.
> E.g., Hyper-V always waits for a memory block to get onlined before
> continuing, otherwise it might end up adding memory faster than
> hotplugging it, which can result in strange OOM situations. This waiting
> slows down adding of a bigger amount of memory.
> 
> Let's allow to specify a default online_type, not just "online" and
> "offline". This allows distributions to configure the default online_type
> when booting up and be done with it.
> 
> We can now specify "offline", "online", "online_movable" and
> "online_kernel" via
> - "memhp_default_state=" on the kernel cmdline
> - /sys/devices/system/memory/auto_online_blocks
> just like we are able to specify for a single memory block via
> /sys/devices/system/memory/memoryX/state
> 
> Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

As I've said earlier and several times already, I really dislike this
interface. But it is fact that this patch doesn't make it any worse.
Quite contrary, so feel free to add
Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  drivers/base/memory.c          | 11 +++++------
>  include/linux/memory_hotplug.h |  2 ++
>  mm/memory_hotplug.c            |  8 ++++----
>  3 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 8d3e16dab69f..2b09b68b9f78 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -35,7 +35,7 @@ static const char *const online_type_to_str[] = {
>  	[MMOP_ONLINE_MOVABLE] = "online_movable",
>  };
>  
> -static int memhp_online_type_from_str(const char *str)
> +int memhp_online_type_from_str(const char *str)
>  {
>  	int i;
>  
> @@ -394,13 +394,12 @@ static ssize_t auto_online_blocks_store(struct device *dev,
>  					struct device_attribute *attr,
>  					const char *buf, size_t count)
>  {
> -	if (sysfs_streq(buf, "online"))
> -		memhp_default_online_type = MMOP_ONLINE;
> -	else if (sysfs_streq(buf, "offline"))
> -		memhp_default_online_type = MMOP_OFFLINE;
> -	else
> +	const int online_type = memhp_online_type_from_str(buf);
> +
> +	if (online_type < 0)
>  		return -EINVAL;
>  
> +	memhp_default_online_type = online_type;
>  	return count;
>  }
>  
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index c6e090b34c4b..ef55115320fb 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -117,6 +117,8 @@ extern int arch_add_memory(int nid, u64 start, u64 size,
>  			struct mhp_restrictions *restrictions);
>  extern u64 max_mem_size;
>  
> +extern int memhp_online_type_from_str(const char *str);
> +
>  /* Default online_type (MMOP_*) when new memory blocks are added. */
>  extern int memhp_default_online_type;
>  /* If movable_node boot option specified */
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 1975a2b99a2b..9916977b6ee1 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -74,10 +74,10 @@ int memhp_default_online_type = MMOP_ONLINE;
>  
>  static int __init setup_memhp_default_state(char *str)
>  {
> -	if (!strcmp(str, "online"))
> -		memhp_default_online_type = MMOP_ONLINE;
> -	else if (!strcmp(str, "offline"))
> -		memhp_default_online_type = MMOP_OFFLINE;
> +	const int online_type = memhp_online_type_from_str(str);
> +
> +	if (online_type >= 0)
> +		memhp_default_online_type = online_type;
>  
>  	return 1;
>  }
> -- 
> 2.24.1

-- 
Michal Hocko
SUSE Labs
