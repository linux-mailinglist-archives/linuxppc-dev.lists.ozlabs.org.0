Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D56AD186FA9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 17:07:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48h1RQ1QC2zDqPk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 03:07:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.65; helo=mail-wm1-f65.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48h0dj688HzDqTX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 02:31:37 +1100 (AEDT)
Received: by mail-wm1-f65.google.com with SMTP id f7so18562687wml.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 08:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2enG6C5+gvMUBNCdTFQ/fIEu52PBtZwHWzc4db6XZpQ=;
 b=OrsItnv+mLFAZZGfG/giJlbkfdZreFY15x0vdBW2xcoFlB0ZNoDH5YTaXRwC8l/XjI
 DYFVQzwPUofkbeuUOWts01pfwp2w+eq5KKN+ORxg6hq23Eht7piZ+EuwhwqqTkDQnBLB
 5EqkV3khnnBBI8BlXiPqI1BfO79WdxURyxX51a0xUS535stDo8CC1auNnIQuddQG06xR
 1TDu6oi4YJbg9Vxf0cZJPYdShNR5Wsg+xrb6RN9GY5V6SxqX3jhpiCtrZ4HPHv5aSQj+
 8+wBeNnL9M+bmxLtEpDtH1Kpgi4OEcrVVSde/vz70Ld1k4cM4+wSZ4LQlKdf4N7p8TMq
 mQBA==
X-Gm-Message-State: ANhLgQ37uFeDCEs6vk2pNLYqmkYk6drq8SBo27/2Vi9XFiRbqrJDOeoK
 EB2xked5BEeRkDF4YiLebCA=
X-Google-Smtp-Source: ADFU+vvbB2Au5sNpIKfd6SgHcAn8IC+EDtW12OQN9jVlc5ApS3fGOjrBFNIuPUEGD0eSFUwGgVqj/g==
X-Received: by 2002:a1c:7901:: with SMTP id l1mr28381812wme.188.1584372693830; 
 Mon, 16 Mar 2020 08:31:33 -0700 (PDT)
Received: from localhost ([37.188.132.163])
 by smtp.gmail.com with ESMTPSA id h15sm320797wrw.97.2020.03.16.08.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:31:33 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:31:31 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 5/5] mm/memory_hotplug: allow to specify a default
 online_type
Message-ID: <20200316153131.GW11482@dhcp22.suse.cz>
References: <20200311123026.16071-1-david@redhat.com>
 <20200311123026.16071-6-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311123026.16071-6-david@redhat.com>
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

On Wed 11-03-20 13:30:26, David Hildenbrand wrote:
> For now, distributions implement advanced udev rules to essentially
> - Don't online any hotplugged memory (s390x)
> - Online all memory to ZONE_NORMAL (e.g., most virt environments like
>   hyperv)
> - Online all memory to ZONE_MOVABLE in case the zone imbalance is taken
>   care of (e.g., bare metal, special virt environments)
> 
> In summary: All memory is usually onlined the same way, however, the
> kernel always has to ask userspace to come up with the same answer.
> E.g., HyperV always waits for a memory block to get onlined before
> continuing, otherwise it might end up adding memory faster than
> hotplugging it, which can result in strange OOM situations.
> 
> Let's allow to specify a default online_type, not just "online" and
> "offline". This allows distributions to configure the default online_type
> when booting up and be done with it.
> 
> We can now specify "offline", "online", "online_movable" and
> "online_kernel" via
> - "memhp_default_state=" on the kernel cmdline
> - /sys/devices/systemn/memory/auto_online_blocks
> just like we are able to specify for a single memory block via
> /sys/devices/systemn/memory/memoryX/state

I still strongly believe that the whole interface is wrong. This is just
adding more lipstick on the pig. On the other hand I recognize that the
event based onlining is a PITA as well. The proper interface would
somehow communicate the type of the memory via the event or other sysfs
attribute and then the FW/HV could tell that this is an offline memory,
hotplugable memory or just an additional memory that doesn't need to
support hotremove by the consumer. The userspace or the kernel could
handle the hotadd request much more easier that way.

> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

That being said, I will not object to this patch. I simply gave up
fighting this interface. So if it works for consumers and it doesn't
break the existing userspace (which is shouldn't AFAICS) then go ahead.

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
> index 01443c70aa27..4a96273eafa7 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -75,10 +75,10 @@ EXPORT_SYMBOL_GPL(memhp_default_online_type);
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
