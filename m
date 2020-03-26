Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FE4193C11
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 10:42:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p0Pv38gCzDqv8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 20:42:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.68; helo=mail-wr1-f68.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p0Mz2YbwzDqYP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 20:40:29 +1100 (AEDT)
Received: by mail-wr1-f68.google.com with SMTP id m17so6809785wrw.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 02:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P7rfDvLouiYZHycnMC+LD8xViPsWvfdlRtaj/g8XMpI=;
 b=VJHACqSwbYGfiqwr5PdkVOTvcZWRJTl/pmucaTYpMYgb8ZZ7zFsrMgbQgKo2B7v3op
 1Bk4qLaALEVcGQbtec8LAlf53gndkdGzOOY4xnCyV8QFRzuPucx1BOHuHI7efaqAM3C+
 yR82+OE9b4EHfOH2HqLNcTtvFyZjzmd24FjKGh2AW9EU3FCORM74YXUIGbKQabYM6EoV
 OMetJQ8uha32rPaqzdLMxIhE3Xd9Tf/MdXPFkjWsU1PTQqxxuisyJkIcpEf2fBy0OAot
 3BFJpJpK4eqTCwKG5SWwXnf1Tdhf5VCq8mAa7WZ1D1ZZ6lFTviEZfcNNY2C8API7XYqK
 sjOQ==
X-Gm-Message-State: ANhLgQ3CM7OU/+Xj8mK7pcyDEl4n2Tmm5+hcXGwewo4nJDIFba15EVHR
 +WJAxK4QjjY3FxDLfZjn3NU=
X-Google-Smtp-Source: ADFU+vtNTC3uveKLjYkpabv7PlfTxhvxoLbq54nGLzKKlGbyrjTz5Ve6WDJ3HQqFstd4mXXf9AA0aw==
X-Received: by 2002:a5d:5687:: with SMTP id f7mr7895856wrv.425.1585215625893; 
 Thu, 26 Mar 2020 02:40:25 -0700 (PDT)
Received: from localhost (ip-37-188-135-150.eurotel.cz. [37.188.135.150])
 by smtp.gmail.com with ESMTPSA id s22sm2517118wmc.16.2020.03.26.02.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 02:40:24 -0700 (PDT)
Date: Thu, 26 Mar 2020 10:40:23 +0100
From: Michal Hocko <mhocko@kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] mm/sparse: Fix kernel crash with pfn_section_valid check
Message-ID: <20200326094023.GG27965@dhcp22.suse.cz>
References: <20200325031914.107660-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325031914.107660-1-aneesh.kumar@linux.ibm.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Baoquan He <bhe@redhat.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 25-03-20 08:49:14, Aneesh Kumar K.V wrote:
> Fixes the below crash
> 
> BUG: Kernel NULL pointer dereference on read at 0x00000000
> Faulting instruction address: 0xc000000000c3447c
> Oops: Kernel access of bad area, sig: 11 [#1]
> LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> CPU: 11 PID: 7519 Comm: lt-ndctl Not tainted 5.6.0-rc7-autotest #1
> ...
> NIP [c000000000c3447c] vmemmap_populated+0x98/0xc0
> LR [c000000000088354] vmemmap_free+0x144/0x320
> Call Trace:
>  section_deactivate+0x220/0x240

It would be great to match this to the specific source code.

>  __remove_pages+0x118/0x170
>  arch_remove_memory+0x3c/0x150
>  memunmap_pages+0x1cc/0x2f0
>  devm_action_release+0x30/0x50
>  release_nodes+0x2f8/0x3e0
>  device_release_driver_internal+0x168/0x270
>  unbind_store+0x130/0x170
>  drv_attr_store+0x44/0x60
>  sysfs_kf_write+0x68/0x80
>  kernfs_fop_write+0x100/0x290
>  __vfs_write+0x3c/0x70
>  vfs_write+0xcc/0x240
>  ksys_write+0x7c/0x140
>  system_call+0x5c/0x68
> 
> With commit: d41e2f3bd546 ("mm/hotplug: fix hot remove failure in SPARSEMEM|!VMEMMAP case")
> section_mem_map is set to NULL after depopulate_section_mem(). This
> was done so that pfn_page() can work correctly with kernel config that disables
> SPARSEMEM_VMEMMAP. With that config pfn_to_page does
> 
> 	__section_mem_map_addr(__sec) + __pfn;
> where
> 
> static inline struct page *__section_mem_map_addr(struct mem_section *section)
> {
> 	unsigned long map = section->section_mem_map;
> 	map &= SECTION_MAP_MASK;
> 	return (struct page *)map;
> }
> 
> Now with SPASEMEM_VMEMAP enabled, mem_section->usage->subsection_map is used to
> check the pfn validity (pfn_valid()). Since section_deactivate release
> mem_section->usage if a section is fully deactivated, pfn_valid() check after
> a subsection_deactivate cause a kernel crash.
> 
> static inline int pfn_valid(unsigned long pfn)
> {
> ...
> 	return early_section(ms) || pfn_section_valid(ms, pfn);
> }
> 
> where
> 
> static inline int pfn_section_valid(struct mem_section *ms, unsigned long pfn)
> {

> 	int idx = subsection_map_index(pfn);
> 
> 	return test_bit(idx, ms->usage->subsection_map);
> }
> 
> Avoid this by clearing SECTION_HAS_MEM_MAP when mem_section->usage is freed.

I am sorry, I haven't noticed that during the review of the commit
mentioned above. This is all subtle as hell, I have to say. 

Why do we have to free usage before deactivaing section memmap? Now that
we have a late section_mem_map reset shouldn't we tear down the usage in
the same branch?

> Fixes: d41e2f3bd546 ("mm/hotplug: fix hot remove failure in SPARSEMEM|!VMEMMAP case")
> Cc: Baoquan He <bhe@redhat.com>
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  mm/sparse.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/mm/sparse.c b/mm/sparse.c
> index aadb7298dcef..3012d1f3771a 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -781,6 +781,8 @@ static void section_deactivate(unsigned long pfn, unsigned long nr_pages,
>  			ms->usage = NULL;
>  		}
>  		memmap = sparse_decode_mem_map(ms->section_mem_map, section_nr);
> +		/* Mark the section invalid */
> +		ms->section_mem_map &= ~SECTION_HAS_MEM_MAP;

Btw. this comment is not really helping at all.
		/*
		 * section->usage is gone and VMEMMAP's pfn_valid depens
		 * on it (see pfn_section_valid)
		 */
>  	}
>  
>  	if (section_is_early && memmap)
> -- 
> 2.25.1
> 

-- 
Michal Hocko
SUSE Labs
