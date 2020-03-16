Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C30186F7A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 16:58:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48h1Ds4jW3zDqV1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 02:58:37 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48h0Cf5w3jzDqT3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 02:12:29 +1100 (AEDT)
Received: by mail-wm1-f65.google.com with SMTP id f7so18482359wml.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 08:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pP29NNx6Ci3tKu2VMQ6svFhSLpTYpkSdhU02iawHkFs=;
 b=Lmg0tjC921psb8I9m823Gwkc0Oh3/HfIJvPn1ofR7MafiYWlaXFaAzr5qSvnnzSpQb
 a9xUdblb1uSioKlCQ+0H/la67PF3TjI15nGtnJYDcc5oB1Ih3DTpUM9J0X5iCM6AK4y0
 B8SuQaZtrWKj0P0DG0pKA5CXUb2+VcCPFmqx6hJFYzJzjZ64e1GzGgJkgRsk6qQg7SuN
 dl+FMIB0iZkUd0Tm7wSVqD88WxKft1N7tfrQ3r96x98yR2JmMFn1rPFQMAdxm2IDabBG
 Fr00ZRl2sVG5R23z3sgCHF19edZRCG8DeXXaAFGfCfOcfIJll8BdsiKxr5UuXYDxXQGE
 fvpA==
X-Gm-Message-State: ANhLgQ3d+xemN4Hf+KQxmvvxwJuP8CZxjvXTQZeI1TFM6w2sl5Hb4feG
 qvtXFypwSOE1bwVR7xQD+y4=
X-Google-Smtp-Source: ADFU+vu/tvS5V97YVVfKD2ivxmneOufMFO5W9ErMHPP4C5Ju1eQN39CBYRDgFDWYm0T37VQ9dxYtJg==
X-Received: by 2002:a7b:c75a:: with SMTP id w26mr10625158wmk.2.1584371544960; 
 Mon, 16 Mar 2020 08:12:24 -0700 (PDT)
Received: from localhost ([37.188.132.163])
 by smtp.gmail.com with ESMTPSA id s15sm347045wrr.45.2020.03.16.08.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:12:24 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:12:23 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/5] drivers/base/memory: rename MMOP_ONLINE_KEEP to
 MMOP_ONLINE
Message-ID: <20200316151223.GS11482@dhcp22.suse.cz>
References: <20200311123026.16071-1-david@redhat.com>
 <20200311123026.16071-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311123026.16071-2-david@redhat.com>
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

On Wed 11-03-20 13:30:22, David Hildenbrand wrote:
> The name is misleading. Let's just name it like the online_type name we
> expose to user space ("online").

I would disagree the name is misleading. It just says that you want to
online and keep the zone type. Nothing I would insist on though.

> Add some documentation to the types.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/base/memory.c          | 9 +++++----
>  include/linux/memory_hotplug.h | 6 +++++-
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 6448c9ece2cb..8c5ce42c0fc3 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -216,7 +216,7 @@ static int memory_subsys_online(struct device *dev)
>  	 * attribute and need to set the online_type.
>  	 */
>  	if (mem->online_type < 0)
> -		mem->online_type = MMOP_ONLINE_KEEP;
> +		mem->online_type = MMOP_ONLINE;
>  
>  	ret = memory_block_change_state(mem, MEM_ONLINE, MEM_OFFLINE);
>  
> @@ -251,7 +251,7 @@ static ssize_t state_store(struct device *dev, struct device_attribute *attr,
>  	else if (sysfs_streq(buf, "online_movable"))
>  		online_type = MMOP_ONLINE_MOVABLE;
>  	else if (sysfs_streq(buf, "online"))
> -		online_type = MMOP_ONLINE_KEEP;
> +		online_type = MMOP_ONLINE;
>  	else if (sysfs_streq(buf, "offline"))
>  		online_type = MMOP_OFFLINE;
>  	else {
> @@ -262,7 +262,7 @@ static ssize_t state_store(struct device *dev, struct device_attribute *attr,
>  	switch (online_type) {
>  	case MMOP_ONLINE_KERNEL:
>  	case MMOP_ONLINE_MOVABLE:
> -	case MMOP_ONLINE_KEEP:
> +	case MMOP_ONLINE:
>  		/* mem->online_type is protected by device_hotplug_lock */
>  		mem->online_type = online_type;
>  		ret = device_online(&mem->dev);
> @@ -342,7 +342,8 @@ static ssize_t valid_zones_show(struct device *dev,
>  	}
>  
>  	nid = mem->nid;
> -	default_zone = zone_for_pfn_range(MMOP_ONLINE_KEEP, nid, start_pfn, nr_pages);
> +	default_zone = zone_for_pfn_range(MMOP_ONLINE, nid, start_pfn,
> +					  nr_pages);
>  	strcat(buf, default_zone->name);
>  
>  	print_allowed_zone(buf, nid, start_pfn, nr_pages, MMOP_ONLINE_KERNEL,
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index f4d59155f3d4..261dbf010d5d 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -47,9 +47,13 @@ enum {
>  
>  /* Types for control the zone type of onlined and offlined memory */
>  enum {
> +	/* Offline the memory. */
>  	MMOP_OFFLINE = -1,
> -	MMOP_ONLINE_KEEP,
> +	/* Online the memory. Zone depends, see default_zone_for_pfn(). */
> +	MMOP_ONLINE,
> +	/* Online the memory to ZONE_NORMAL. */
>  	MMOP_ONLINE_KERNEL,
> +	/* Online the memory to ZONE_MOVABLE. */
>  	MMOP_ONLINE_MOVABLE,
>  };
>  
> -- 
> 2.24.1

-- 
Michal Hocko
SUSE Labs
