Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFF23759AC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 19:49:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbh0g2VzJz3bTc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 03:49:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z893qVLT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZRVH7Whm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Z893qVLT; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZRVH7Whm; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbh096H9Jz301q
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 03:48:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620323332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sErE00U4WcGmUSAevO0iW70/trzDhCsvbx5qjerHVmo=;
 b=Z893qVLTA+4/eBje4o2HOcFLSIBOpAo1yINtXreooOvcCtINeTVV31FBPnwuSeBR2oTYRo
 SSf5HcViKNeXJMdyKN8djk98jnCcBTqXmAa1BIXf4WPy/urTDv4KYeiUE2eLfEa7izVUHJ
 ++hE36XqKTOwtDMGFyN01N9jjkbcjgU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620323333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sErE00U4WcGmUSAevO0iW70/trzDhCsvbx5qjerHVmo=;
 b=ZRVH7Whm12Tr+DzJtTB0tNAWlnSzOgfcSuVazSUFQojKq6iSjPe8HjRPxDZS9Mzk6/IM+d
 6ZbojIck6Uo0aXeSbV3EKp+GICIXDB3ioL7ikb05BXv1dbfYK56Lq/EGcgMP1yv6Oq9Zcf
 fAS/jvZMdBuNqCcf5rBPmIepRrYvMxY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-CRPmMZXVNtupzCTHvIKL0w-1; Thu, 06 May 2021 13:48:51 -0400
X-MC-Unique: CRPmMZXVNtupzCTHvIKL0w-1
Received: by mail-ej1-f70.google.com with SMTP id
 qk30-20020a170906d9deb02903916754e1b6so2018318ejb.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 May 2021 10:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=sErE00U4WcGmUSAevO0iW70/trzDhCsvbx5qjerHVmo=;
 b=JJctaVy4Xxwh449Kj7QyFb/DK4Qf58WAvuaaBS4emDlQ7HOc5PFbdy7YlbCAw4s34x
 CkQoA3nFdL2rbOQ7R1BNPk3keZln4tHbYCszS3kdn0L6Dvs0ypAEPFtU7cMyohUSgj4X
 hzJUzfIpwkwYYol5j9WlSarQ1WujHA1v3kkdUCxAGobZiAUyYBzWBN2s+SxybToUi+qo
 bgH+kxRD56SoXM0uJTOTla1vjwadpjRifqmMa/pax5l6tqpM/804Sz0WB3dibUCmxx1q
 09R5dZA+sKn0xSHXpZ/bLhgu0vUKvXgNJbK0IXSaxLxkzQw5Fr36KNhjhdR5jTnboaG1
 w8tw==
X-Gm-Message-State: AOAM5311xGDaRdLyuZ8WyEGG8A0y++vmbNSaL2PfWABo0hTAXNziTkk6
 ngkM5yinAnqpQUAxFk/6N2g5Cy+EercI+rqfel57CAObqnmCpN3RZAmPEKcQ1XOZeSspaAu+fbN
 BNP2DZWCwARNo3hJ+q9BfDUZJTw==
X-Received: by 2002:a17:906:b850:: with SMTP id
 ga16mr5685104ejb.161.1620323329986; 
 Thu, 06 May 2021 10:48:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxYxV3BG/KTcPkpOhwuXWymB4rfYur+EzgnFPtngmiTwNQw1drtsn3vGuRAIG6YTL8WJSPHQ==
X-Received: by 2002:a17:906:b850:: with SMTP id
 ga16mr5685070ejb.161.1620323329602; 
 Thu, 06 May 2021 10:48:49 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ae.dip0.t-ipconnect.de. [91.12.100.174])
 by smtp.gmail.com with ESMTPSA id s8sm2248395edj.25.2021.05.06.10.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 10:48:49 -0700 (PDT)
To: Zi Yan <ziy@nvidia.com>, Oscar Salvador <osalvador@suse.de>
References: <20210506152623.178731-1-zi.yan@sent.com>
 <20210506152623.178731-2-zi.yan@sent.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC PATCH 1/7] mm: sparse: set/clear subsection bitmap when
 pages are onlined/offlined.
Message-ID: <06dfaf69-1173-462c-b85f-8715cb8d108c@redhat.com>
Date: Thu, 6 May 2021 19:48:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506152623.178731-2-zi.yan@sent.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, x86@kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06.05.21 17:26, Zi Yan wrote:
> From: Zi Yan <ziy@nvidia.com>
> 
> subsection bitmap was set/cleared when a section is added/removed, but
> pfn_to_online_page() uses subsection bitmap to check if the page is
> online, which is not accurate. It was working when a whole section is
> added/removed during memory hotplug and hotremove. When the following
> patches enable memory hotplug and hotremove for subsections,
> subsection bitmap needs to be changed during page online/offline time,
> otherwise, pfn_to_online_page() will not give right answers. Move the
> subsection bitmap manipulation code from section_activate() to
> online_mem_sections() and section_deactivate() to
> offline_mem_sections(), respectively.
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>   mm/sparse.c | 36 +++++++++++++++++++++++++++++++++---
>   1 file changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/sparse.c b/mm/sparse.c
> index b2ada9dc00cb..7637208b8874 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -606,6 +606,7 @@ void __init sparse_init(void)
>   
>   #ifdef CONFIG_MEMORY_HOTPLUG
>   
> +static int fill_subsection_map(unsigned long pfn, unsigned long nr_pages);
>   /* Mark all memory sections within the pfn range as online */
>   void online_mem_sections(unsigned long start_pfn, unsigned long end_pfn)
>   {
> @@ -621,9 +622,12 @@ void online_mem_sections(unsigned long start_pfn, unsigned long end_pfn)
>   
>   		ms = __nr_to_section(section_nr);
>   		ms->section_mem_map |= SECTION_IS_ONLINE;
> +		fill_subsection_map(pfn, min(end_pfn, pfn + PAGES_PER_SECTION) - pfn);
>   	}
>   }
>   
> +static int clear_subsection_map(unsigned long pfn, unsigned long nr_pages);
> +static bool is_subsection_map_empty(struct mem_section *ms);
>   /* Mark all memory sections within the pfn range as offline */
>   void offline_mem_sections(unsigned long start_pfn, unsigned long end_pfn)
>   {
> @@ -641,7 +645,13 @@ void offline_mem_sections(unsigned long start_pfn, unsigned long end_pfn)
>   			continue;
>   
>   		ms = __nr_to_section(section_nr);
> -		ms->section_mem_map &= ~SECTION_IS_ONLINE;
> +
> +		if (end_pfn < pfn + PAGES_PER_SECTION) {
> +			clear_subsection_map(pfn, end_pfn - pfn);
> +			if (is_subsection_map_empty(ms))
> +				ms->section_mem_map &= ~SECTION_IS_ONLINE;
> +		} else
> +			ms->section_mem_map &= ~SECTION_IS_ONLINE;
>   	}
>   }
>   
> @@ -668,6 +678,17 @@ static void free_map_bootmem(struct page *memmap)
>   	vmemmap_free(start, end, NULL);
>   }
>   
> +static int subsection_map_intersects(struct mem_section *ms, unsigned long pfn,
> +				     unsigned long nr_pages)
> +{
> +	DECLARE_BITMAP(map, SUBSECTIONS_PER_SECTION) = { 0 };
> +	unsigned long *subsection_map = &ms->usage->subsection_map[0];
> +
> +	subsection_mask_set(map, pfn, nr_pages);
> +
> +	return bitmap_intersects(map, subsection_map, SUBSECTIONS_PER_SECTION);
> +}
> +
>   static int clear_subsection_map(unsigned long pfn, unsigned long nr_pages)
>   {
>   	DECLARE_BITMAP(map, SUBSECTIONS_PER_SECTION) = { 0 };
> @@ -760,6 +781,12 @@ static void free_map_bootmem(struct page *memmap)
>   	}
>   }
>   
> +static int subsection_map_intersects(struct mem_section *ms, unsigned long pfn,
> +				     unsigned long nr_pages)
> +{
> +	return 0;
> +}
> +
>   static int clear_subsection_map(unsigned long pfn, unsigned long nr_pages)
>   {
>   	return 0;
> @@ -800,7 +827,10 @@ static void section_deactivate(unsigned long pfn, unsigned long nr_pages,
>   	struct page *memmap = NULL;
>   	bool empty;
>   
> -	if (clear_subsection_map(pfn, nr_pages))
> +	if (WARN((IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP) && !ms->usage) ||
> +		 subsection_map_intersects(ms, pfn, nr_pages),
> +				"section already deactivated (%#lx + %ld)\n",
> +				pfn, nr_pages))
>   		return;
>   
>   	empty = is_subsection_map_empty(ms);
> @@ -855,7 +885,7 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
>   		ms->usage = usage;
>   	}
>   
> -	rc = fill_subsection_map(pfn, nr_pages);
> +	rc = !nr_pages || subsection_map_intersects(ms, pfn, nr_pages);
>   	if (rc) {
>   		if (usage)
>   			ms->usage = NULL;
> 

If I am not missing something, this is completely broken for 
devmem/ZONE_DEVICE that never onlines pages. But also when memory blocks 
are never onlined, this would be just wrong. Least thing you would need 
is a sub-section online map.

But glimpsing at patch #2, I'd rather stop right away digging deeper 
into this series :)

I think what would really help is drafting a design of how it all could 
look like and then first discussing the high-level design, investigating 
how it could play along with all existing users, existing workloads, and 
existing use cases. Proposing such changes without a clear picture in 
mind and a high-level overview might give you some unpleasant reactions 
from some of the developers around here ;)

-- 
Thanks,

David / dhildenb

