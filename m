Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA0F192197
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 08:08:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nK304g1JzDqvw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 18:08:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.74;
 helo=us-smtp-delivery-74.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=LC4sOFre; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nK1J4g5dzDqZC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 18:06:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585120014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DXe37XA0lfapO5Rb1aOqlNhUPIp3vNMLcAvl3Ef53Tg=;
 b=LC4sOFretlAJdNpnQ1HqWSGRCo1y64tvDEuNKvGmjxMjer2pDdhZgBNEKKa7yR7YUfYmdr
 11iHGWrW38QA9tSM/cE77fYcdEGEYMIPZeMuwhFdnFUMgAfNjXDcQ7A3O0kbj3Yn+sngoy
 3XWe2V5VQlZ+z8jbDxYGW1IKUp0UXok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-lr4m0wjzMhewtNCfl9Hs1w-1; Wed, 25 Mar 2020 03:06:49 -0400
X-MC-Unique: lr4m0wjzMhewtNCfl9Hs1w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E8248017CC;
 Wed, 25 Mar 2020 07:06:48 +0000 (UTC)
Received: from localhost (ovpn-12-88.pek2.redhat.com [10.72.12.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A43DE91D82;
 Wed, 25 Mar 2020 07:06:46 +0000 (UTC)
Date: Wed, 25 Mar 2020 15:06:43 +0800
From: Baoquan He <bhe@redhat.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] mm/sparse: Fix kernel crash with pfn_section_valid check
Message-ID: <20200325070643.GH3039@MiWiFi-R3L-srv>
References: <20200325031914.107660-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325031914.107660-1-aneesh.kumar@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dan.j.williams@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03/25/20 at 08:49am, Aneesh Kumar K.V wrote:
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
> 
> Fixes: d41e2f3bd546 ("mm/hotplug: fix hot remove failure in SPARSEMEM|!VMEMMAP case")
> Cc: Baoquan He <bhe@redhat.com>
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Maybe add Sachin's Tested-by, Sachin has tested and confirmed this fix
works.

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

Not sure if we should add checking in valid_section() or pfn_valid(),
e.g check ms->usage validation too. Otherwise, this fix looks good to
me.

Reviewed-by: Baoquan He <bhe@redhat.com>

