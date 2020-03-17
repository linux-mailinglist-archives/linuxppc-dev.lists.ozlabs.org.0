Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA0418824E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 12:35:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hWM81cKwzDqVq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 22:35:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hVZ82rZQzDqf4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 22:00:16 +1100 (AEDT)
Received: by mail-wm1-f66.google.com with SMTP id t13so15039206wmi.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 04:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jWcJuEe3U9iMDhxO+2CXuqWIpMY9yFcTi8XiUgDM1I8=;
 b=LSGOG+UkYXiORjkaSijuEyppiTHJ2uJU65NmmQn0YEXB59F238GiQXX6OBkpZIO0ou
 TxGhD/4uhwlwqzCGph0ghEX8qvKKQ58jmOUCx3WezVDJFs9pfOAI1VFZiGiif/wtP4bu
 CfuvaoCt7+yweMBWaND0EgkjiRxVi3VQY4Moildap+apObg0aRAkWpYkMjlnGteN+bpQ
 bNJzaYu0Ne0+/MFuLiPeTyO18A4VlGer9gfOp5y54vScZfpIoV0pXrBzWMkdNBIZhb4L
 x8pC3M6BXupbuEI5Td19J28W7lpGoT7Lc3JmQSb91dmAZ4ASiFsVJdqmxZILU6ITZbax
 3KQg==
X-Gm-Message-State: ANhLgQ1+CO/5f+BIIQ5cV0QeEJN9xGk+Bm8RXXwzKZ3YC0bVLSwNTFbO
 +wxKimpP4KfvUV7PkuucmjY=
X-Google-Smtp-Source: ADFU+vurlY+mODK/ZSQ71xbWFObBOQrd3zMlYKfL9CGb58VdPo7Qxzu/8cGJz+tLu2RaaePI01swrQ==
X-Received: by 2002:a7b:c308:: with SMTP id k8mr4955640wmj.40.1584442812916;
 Tue, 17 Mar 2020 04:00:12 -0700 (PDT)
Received: from localhost (ip-37-188-255-121.eurotel.cz. [37.188.255.121])
 by smtp.gmail.com with ESMTPSA id a7sm28263785wmb.0.2020.03.17.04.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 04:00:11 -0700 (PDT)
Date: Tue, 17 Mar 2020 12:00:10 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 7/8] mm/memory_hotplug: convert memhp_auto_online to
 store an online_type
Message-ID: <20200317110010.GM26018@dhcp22.suse.cz>
References: <20200317104942.11178-1-david@redhat.com>
 <20200317104942.11178-8-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317104942.11178-8-david@redhat.com>
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

On Tue 17-03-20 11:49:41, David Hildenbrand wrote:
> ... and rename it to memhp_default_online_type. This is a preparation
> for more detailed default online behavior.
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

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  drivers/base/memory.c          | 10 ++++------
>  include/linux/memory_hotplug.h |  3 ++-
>  mm/memory_hotplug.c            | 11 ++++++-----
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 8a7f29c0bf97..8d3e16dab69f 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -386,10 +386,8 @@ static DEVICE_ATTR_RO(block_size_bytes);
>  static ssize_t auto_online_blocks_show(struct device *dev,
>  				       struct device_attribute *attr, char *buf)
>  {
> -	if (memhp_auto_online)
> -		return sprintf(buf, "online\n");
> -	else
> -		return sprintf(buf, "offline\n");
> +	return sprintf(buf, "%s\n",
> +		       online_type_to_str[memhp_default_online_type]);
>  }
>  
>  static ssize_t auto_online_blocks_store(struct device *dev,
> @@ -397,9 +395,9 @@ static ssize_t auto_online_blocks_store(struct device *dev,
>  					const char *buf, size_t count)
>  {
>  	if (sysfs_streq(buf, "online"))
> -		memhp_auto_online = true;
> +		memhp_default_online_type = MMOP_ONLINE;
>  	else if (sysfs_streq(buf, "offline"))
> -		memhp_auto_online = false;
> +		memhp_default_online_type = MMOP_OFFLINE;
>  	else
>  		return -EINVAL;
>  
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index c2e06ed5e0e9..c6e090b34c4b 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -117,7 +117,8 @@ extern int arch_add_memory(int nid, u64 start, u64 size,
>  			struct mhp_restrictions *restrictions);
>  extern u64 max_mem_size;
>  
> -extern bool memhp_auto_online;
> +/* Default online_type (MMOP_*) when new memory blocks are added. */
> +extern int memhp_default_online_type;
>  /* If movable_node boot option specified */
>  extern bool movable_node_enabled;
>  static inline bool movable_node_is_enabled(void)
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 2d2aae830b92..1975a2b99a2b 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -67,17 +67,17 @@ void put_online_mems(void)
>  bool movable_node_enabled = false;
>  
>  #ifndef CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE
> -bool memhp_auto_online;
> +int memhp_default_online_type = MMOP_OFFLINE;
>  #else
> -bool memhp_auto_online = true;
> +int memhp_default_online_type = MMOP_ONLINE;
>  #endif
>  
>  static int __init setup_memhp_default_state(char *str)
>  {
>  	if (!strcmp(str, "online"))
> -		memhp_auto_online = true;
> +		memhp_default_online_type = MMOP_ONLINE;
>  	else if (!strcmp(str, "offline"))
> -		memhp_auto_online = false;
> +		memhp_default_online_type = MMOP_OFFLINE;
>  
>  	return 1;
>  }
> @@ -990,6 +990,7 @@ static int check_hotplug_memory_range(u64 start, u64 size)
>  
>  static int online_memory_block(struct memory_block *mem, void *arg)
>  {
> +	mem->online_type = memhp_default_online_type;
>  	return device_online(&mem->dev);
>  }
>  
> @@ -1062,7 +1063,7 @@ int __ref add_memory_resource(int nid, struct resource *res)
>  	mem_hotplug_done();
>  
>  	/* online pages if requested */
> -	if (memhp_auto_online)
> +	if (memhp_default_online_type != MMOP_OFFLINE)
>  		walk_memory_blocks(start, size, NULL, online_memory_block);
>  
>  	return ret;
> -- 
> 2.24.1

-- 
Michal Hocko
SUSE Labs
