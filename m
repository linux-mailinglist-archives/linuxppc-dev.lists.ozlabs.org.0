Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B65F9186F80
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 17:00:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48h1H16qPHzDqV3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 03:00:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.67; helo=mail-wm1-f67.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48h0Mj2MwlzDqPN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 02:19:28 +1100 (AEDT)
Received: by mail-wm1-f67.google.com with SMTP id a132so18103758wme.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 08:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9gCLfTwG3giIuIHsNt54BqZ2oPFCe851NK97n7eWk0U=;
 b=F+ASKkvpPMQl7zvh2osTUSTAsy99+CC5GsnIJAcI84sefX1qBxttbaV/7A07Evn+jD
 jVa30Pq2FtxWJ7jT1Vl53o5eFPChhUmSN50DHtEGh/kqj7nHaKK/PC6ek+FrY+NHnqff
 pch+zJU8tjhkuNjBGnu9sGneeAIBFfG+IC97iYik6m/xMkQRBzQBmr21GfrYlouRHmgp
 YeWcJxfYcjjaWK0yPtpCU0XXScAOnjprNNEKWbJHh20qnRHFJRovC+ZVrFyi2La63T+X
 sUMQQMVKej2oZHRUczc9Ass7CemWqIg2+Eu8Bbfuu77Bp1voovRxSX6h1czY9v5BZwGC
 CfIQ==
X-Gm-Message-State: ANhLgQ2k49g3Ir2U8IiV9CeKodW+4Urxq5awN6ebI5h0RfmGUa5Z/DST
 A3iTPPKwd7s2ZIafEqZcRpI=
X-Google-Smtp-Source: ADFU+vvOYExuooXZ898XQrqAGBWNBedWRADee7iQ/jiwP4Lm03/iQnl4/TOMx1px3Igm+ARPH+fmlA==
X-Received: by 2002:a7b:c0cf:: with SMTP id s15mr29520903wmh.106.1584371964191; 
 Mon, 16 Mar 2020 08:19:24 -0700 (PDT)
Received: from localhost ([37.188.132.163])
 by smtp.gmail.com with ESMTPSA id w204sm79069wma.1.2020.03.16.08.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:19:23 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:19:22 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 2/5] drivers/base/memory: map MMOP_OFFLINE to 0
Message-ID: <20200316151922.GT11482@dhcp22.suse.cz>
References: <20200311123026.16071-1-david@redhat.com>
 <20200311123026.16071-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311123026.16071-3-david@redhat.com>
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

On Wed 11-03-20 13:30:23, David Hildenbrand wrote:
> I have no idea why we have to start at -1.

Because this is how the offline state offline was represented
originally.

> Just treat 0 as the special
> case. Clarify a comment (which was wrong, when we come via
> device_online() the first time, the online_type would have been 0 /
> MEM_ONLINE). The default is now always MMOP_OFFLINE.

git grep says that you have covered the only remaining place which
hasn't used the enum value.

> This is a preparation to use the online_type as an array index.
> 
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
>  drivers/base/memory.c          | 11 ++++-------
>  include/linux/memory_hotplug.h |  2 +-
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 8c5ce42c0fc3..e7e77cafef80 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -211,17 +211,14 @@ static int memory_subsys_online(struct device *dev)
>  		return 0;
>  
>  	/*
> -	 * If we are called from state_store(), online_type will be
> -	 * set >= 0 Otherwise we were called from the device online
> -	 * attribute and need to set the online_type.
> +	 * When called via device_online() without configuring the online_type,
> +	 * we want to default to MMOP_ONLINE.
>  	 */
> -	if (mem->online_type < 0)
> +	if (mem->online_type == MMOP_OFFLINE)
>  		mem->online_type = MMOP_ONLINE;
>  
>  	ret = memory_block_change_state(mem, MEM_ONLINE, MEM_OFFLINE);
> -
> -	/* clear online_type */
> -	mem->online_type = -1;
> +	mem->online_type = MMOP_OFFLINE;
>  
>  	return ret;
>  }
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index 261dbf010d5d..c2e06ed5e0e9 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -48,7 +48,7 @@ enum {
>  /* Types for control the zone type of onlined and offlined memory */
>  enum {
>  	/* Offline the memory. */
> -	MMOP_OFFLINE = -1,
> +	MMOP_OFFLINE = 0,
>  	/* Online the memory. Zone depends, see default_zone_for_pfn(). */
>  	MMOP_ONLINE,
>  	/* Online the memory to ZONE_NORMAL. */
> -- 
> 2.24.1

-- 
Michal Hocko
SUSE Labs
