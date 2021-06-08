Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEDB39F4B1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 13:12:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzndV3F7tz3bsH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 21:12:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qaYxKhnt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qaYxKhnt; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fznd06LzKz2xfN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 21:12:04 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fznct061wz9sW7;
 Tue,  8 Jun 2021 21:11:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1623150723;
 bh=h1pjcx14WED8GV61yyvX+o5nh/QO2vDigglGzaBUaPo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qaYxKhntxn9domJfTp/b7vZheGgvSG04qAi3oPZszcrG9xJ8L8BtLeFBDdkNbhfRZ
 X8AJHokX7Us9uk+OIikdyp8VwCVfcmpt0jHbXBsbfQ+HEwfgLRBxW3k7uXH4jT5QAg
 8xQpuppzCCGEv/fkG3Q1MEqEdqwDa3GgrXCwBwQ3bGGeK2M1OuWRxuc0qtkEr1keBz
 fDJQZ6qLeVUxjcpDY8AtdZZU3JvH1MC5Y3w/lLqHwiFCGx13AS18HU2Ir33OkNpg2k
 8GyFRxa0K5NYJybxWne97z3ZMcKKDCCW4J0WeaoO69Q+XrReDs4uvXduZSTclQX4ku
 hnEBus8PGkG1w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 05/12] mm/memory_hotplug: remove nid parameter from
 remove_memory() and friends
In-Reply-To: <20210607195430.48228-6-david@redhat.com>
References: <20210607195430.48228-1-david@redhat.com>
 <20210607195430.48228-6-david@redhat.com>
Date: Tue, 08 Jun 2021 21:11:57 +1000
Message-ID: <87y2bkehky.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: nvdimm@lists.linux.dev, Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Laurent Dufour <ldufour@linux.ibm.com>,
 Dave Jiang <dave.jiang@intel.com>, Vishal Verma <vishal.l.verma@intel.com>,
 David Hildenbrand <david@redhat.com>, linux-acpi@vger.kernel.org,
 Len Brown <lenb@kernel.org>, Nathan Lynch <nathanl@linux.ibm.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Scott Cheloha <cheloha@linux.ibm.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Hui Zhu <teawater@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Marek Kedzierski <mkedzier@redhat.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Hildenbrand <david@redhat.com> writes:
> There is only a single user remaining. We can simply try to offline all
> online nodes - which is fast, because we usually span pages and can skip
> such nodes right away.

That makes me slightly nervous, because our big powerpc boxes tend to
trip on these scaling issues before others.

But the spanned pages check is just:

void try_offline_node(int nid)
{
	pg_data_t *pgdat = NODE_DATA(nid);
        ...
	if (pgdat->node_spanned_pages)
		return;

So I guess that's pretty cheap, and it's only O(nodes), which should
never get that big.

> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> Cc: Len Brown <lenb@kernel.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Vishal Verma <vishal.l.verma@intel.com>
> Cc: Dave Jiang <dave.jiang@intel.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Laurent Dufour <ldufour@linux.ibm.com>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
> Cc: Scott Cheloha <cheloha@linux.ibm.com>
> Cc: Anton Blanchard <anton@ozlabs.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-acpi@vger.kernel.org
> Cc: nvdimm@lists.linux.dev
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  .../platforms/pseries/hotplug-memory.c        |  9 ++++-----
>  drivers/acpi/acpi_memhotplug.c                |  7 +------
>  drivers/dax/kmem.c                            |  3 +--
>  drivers/virtio/virtio_mem.c                   |  4 ++--
>  include/linux/memory_hotplug.h                | 10 +++++-----
>  mm/memory_hotplug.c                           | 20 +++++++++----------
>  6 files changed, 23 insertions(+), 30 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index 8377f1f7c78e..4a9232ddbefe 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -286,7 +286,7 @@ static int pseries_remove_memblock(unsigned long base, unsigned long memblock_si
>  {
>  	unsigned long block_sz, start_pfn;
>  	int sections_per_block;
> -	int i, nid;
> +	int i;
>  
>  	start_pfn = base >> PAGE_SHIFT;
>  
> @@ -297,10 +297,9 @@ static int pseries_remove_memblock(unsigned long base, unsigned long memblock_si
>  
>  	block_sz = pseries_memory_block_size();
>  	sections_per_block = block_sz / MIN_MEMORY_BLOCK_SIZE;
> -	nid = memory_add_physaddr_to_nid(base);
>  
>  	for (i = 0; i < sections_per_block; i++) {
> -		__remove_memory(nid, base, MIN_MEMORY_BLOCK_SIZE);
> +		__remove_memory(base, MIN_MEMORY_BLOCK_SIZE);
>  		base += MIN_MEMORY_BLOCK_SIZE;
>  	}
>  
> @@ -386,7 +385,7 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
>  
>  	block_sz = pseries_memory_block_size();
>  
> -	__remove_memory(mem_block->nid, lmb->base_addr, block_sz);
> +	__remove_memory(lmb->base_addr, block_sz);
>  	put_device(&mem_block->dev);
>  
>  	/* Update memory regions for memory remove */
> @@ -638,7 +637,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>  
>  	rc = dlpar_online_lmb(lmb);
>  	if (rc) {
> -		__remove_memory(nid, lmb->base_addr, block_sz);
> +		__remove_memory(lmb->base_addr, block_sz);
>  		invalidate_lmb_associativity_index(lmb);
>  	} else {
>  		lmb->flags |= DRCONF_MEM_ASSIGNED;


Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
