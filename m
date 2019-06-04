Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A48863522D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 23:49:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JQYJ0MVQzDqWJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 07:49:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=richard.weiyang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LHVOjJU+"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JQX22lMhzDqLJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 07:47:59 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id c26so2646137edt.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2019 14:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YAOiP57A01Sn4VN1p2tU0pXmqdLPIiJ4XRB9cBH/L60=;
 b=LHVOjJU+PrWUKjw2La9VE1vPKl5KearF9vd1gx+fMOah0NIYnTCpk/hLPywmGuD7Qx
 ubKVoOSXllgIIOtqhu2gVJ3x9B0/bsgZ7dOqAY3y5Ayi0qhLPf1tZQD8IUflfR/bo3b1
 F4TaQlhPSFK4tf44OdTct45QOW1HbhpVKmRS1UPgsRmJ8ykiC6IB1kc0IjzAbHbpYgcW
 XocfR253q6JmXmpbPH+wSLE5nYqYTiHdUq2ypGGmgfgczCsKHTbAbfTkEuh649zZZ9c/
 Obhuc+H39gsisfGYj1xrWFrX2Lyh1bRdUjq62tExuKhoIe4zwnBrI2RwiYnmhdgPNIGz
 bDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=YAOiP57A01Sn4VN1p2tU0pXmqdLPIiJ4XRB9cBH/L60=;
 b=ilOBynIHkHBL8ztS1PmCYSPtu2boXhtdyQLGDA38PioX2uPR/s1V1KUa1yKGpumWxJ
 Zh+q/TPMGHfdfgoarYdHRU97spLRYshNQm7VPbiD2lnD8OOUtQzP0jf+HPsbXX0xnhNq
 qEhjF5ZuJvKxy8ljoSS1MHXOEDI/iLMr6i1/EzutHXNUWqT+tgaeErHpofjGQq8R0Z5t
 dwC4btk6LHLklHVz0JmQ2zMf4MlplGD4f/Jzti7eQ2671ZBerez3Xd9ErW/a9J1du9+L
 Dx222ymoemTaXL+oubVrPghUMLC23b+zwIwt4oLuZJVxI7fZQOy2OjiszdoP48S4qPS2
 NZrA==
X-Gm-Message-State: APjAAAUcJqziHmdlBoTMt/uuhQ7N9noSe2jTOtu0OXKMMOgMKyeFEZO3
 DE6IGHGxH68nJLKaw9pSWfo=
X-Google-Smtp-Source: APXvYqwDVoxJj2tIOxzLuK3nYNHPwTJ67OHC1d3ag5SDYh0bPqzR5f57ZgPalm+F2A4DDOJ5mfMHNQ==
X-Received: by 2002:a50:bb24:: with SMTP id y33mr38369134ede.116.1559684875305; 
 Tue, 04 Jun 2019 14:47:55 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id n5sm2897404edt.65.2019.06.04.14.47.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Jun 2019 14:47:54 -0700 (PDT)
Date: Tue, 4 Jun 2019 21:47:53 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 08/11] mm/memory_hotplug: Drop MHP_MEMBLOCK_API
Message-ID: <20190604214753.utbdrjtjavgi7yhf@master>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-9-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527111152.16324-9-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: Oscar Salvador <osalvador@suse.com>, linux-s390@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 Pavel Tatashin <pasha.tatashin@soleen.com>, linux-sh@vger.kernel.org,
 Mathieu Malaterre <malat@debian.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
 linux-mm@kvack.org, Arun KS <arunks@codeaurora.org>, Qian Cai <cai@lca.pw>,
 Igor Mammedov <imammedo@redhat.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 27, 2019 at 01:11:49PM +0200, David Hildenbrand wrote:
>No longer needed, the callers of arch_add_memory() can handle this
>manually.
>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: David Hildenbrand <david@redhat.com>
>Cc: Michal Hocko <mhocko@suse.com>
>Cc: Oscar Salvador <osalvador@suse.com>
>Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
>Cc: Wei Yang <richard.weiyang@gmail.com>
>Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
>Cc: Qian Cai <cai@lca.pw>
>Cc: Arun KS <arunks@codeaurora.org>
>Cc: Mathieu Malaterre <malat@debian.org>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>

>---
> include/linux/memory_hotplug.h | 8 --------
> mm/memory_hotplug.c            | 9 +++------
> 2 files changed, 3 insertions(+), 14 deletions(-)
>
>diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
>index 2d4de313926d..2f1f87e13baa 100644
>--- a/include/linux/memory_hotplug.h
>+++ b/include/linux/memory_hotplug.h
>@@ -128,14 +128,6 @@ extern void arch_remove_memory(int nid, u64 start, u64 size,
> extern void __remove_pages(struct zone *zone, unsigned long start_pfn,
> 			   unsigned long nr_pages, struct vmem_altmap *altmap);
> 
>-/*
>- * Do we want sysfs memblock files created. This will allow userspace to online
>- * and offline memory explicitly. Lack of this bit means that the caller has to
>- * call move_pfn_range_to_zone to finish the initialization.
>- */
>-
>-#define MHP_MEMBLOCK_API               (1<<0)
>-
> /* reasonably generic interface to expand the physical pages */
> extern int __add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
> 		       struct mhp_restrictions *restrictions);
>diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>index b1fde90bbf19..9a92549ef23b 100644
>--- a/mm/memory_hotplug.c
>+++ b/mm/memory_hotplug.c
>@@ -251,7 +251,7 @@ void __init register_page_bootmem_info_node(struct pglist_data *pgdat)
> #endif /* CONFIG_HAVE_BOOTMEM_INFO_NODE */
> 
> static int __meminit __add_section(int nid, unsigned long phys_start_pfn,
>-		struct vmem_altmap *altmap, bool want_memblock)
>+				   struct vmem_altmap *altmap)
> {
> 	int ret;
> 
>@@ -294,8 +294,7 @@ int __ref __add_pages(int nid, unsigned long phys_start_pfn,
> 	}
> 
> 	for (i = start_sec; i <= end_sec; i++) {
>-		err = __add_section(nid, section_nr_to_pfn(i), altmap,
>-				restrictions->flags & MHP_MEMBLOCK_API);
>+		err = __add_section(nid, section_nr_to_pfn(i), altmap);
> 
> 		/*
> 		 * EEXIST is finally dealt with by ioresource collision
>@@ -1067,9 +1066,7 @@ static int online_memory_block(struct memory_block *mem, void *arg)
>  */
> int __ref add_memory_resource(int nid, struct resource *res)
> {
>-	struct mhp_restrictions restrictions = {
>-		.flags = MHP_MEMBLOCK_API,
>-	};
>+	struct mhp_restrictions restrictions = {};
> 	u64 start, size;
> 	bool new_node = false;
> 	int ret;
>-- 
>2.20.1

-- 
Wei Yang
Help you, Help me
