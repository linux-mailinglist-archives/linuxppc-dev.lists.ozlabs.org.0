Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 897E47632A3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 11:42:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KVeEcwal;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KVeEcwal;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9pq53Btzz3cGY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 19:42:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KVeEcwal;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KVeEcwal;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9pp91J0vz2yGN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 19:42:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690364524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NGx2jj4bNcV1rNpDgfUn3c40hTgdOgMy1nAFytodzYY=;
	b=KVeEcwalYK5fYc9nH6voUPjRq+i5Qk7vpC9M1lBDiaan/mXTbuvbAhOe5XuBOWk6KaOBnZ
	bjOMjWK/CNVZYrZX5uKArpOuksOQmErQQLQhZFDdI8GQyw/CYrYG05nB1hwU8Pb9fGoC4q
	YSDTbgGjqTCdydZ2VedxQ2PtfR1eLco=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690364524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NGx2jj4bNcV1rNpDgfUn3c40hTgdOgMy1nAFytodzYY=;
	b=KVeEcwalYK5fYc9nH6voUPjRq+i5Qk7vpC9M1lBDiaan/mXTbuvbAhOe5XuBOWk6KaOBnZ
	bjOMjWK/CNVZYrZX5uKArpOuksOQmErQQLQhZFDdI8GQyw/CYrYG05nB1hwU8Pb9fGoC4q
	YSDTbgGjqTCdydZ2VedxQ2PtfR1eLco=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-bJRhj9BrMTOP7pFGR46CrQ-1; Wed, 26 Jul 2023 05:42:02 -0400
X-MC-Unique: bJRhj9BrMTOP7pFGR46CrQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3fd2778f5e4so4535675e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 02:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690364522; x=1690969322;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGx2jj4bNcV1rNpDgfUn3c40hTgdOgMy1nAFytodzYY=;
        b=gqqhDlFxfly2TubfEhB8SDHAKd0qu0+55ZqZyp8fJ37Rv6LqX9VMF1krhOEGX1F/9S
         1y39OHg/e/PN4lTm4Zbiacd8P9ureuKcTMC2G51iyea+ti5bqhl+ftgI8Y+ydCOo7tOp
         KG73svJ2v2Lhxy3vsaMxtxsW4MRa3PcwSnU2mE5yfJHwDkI9JdF2oNO+KPL3CDjr9vu0
         tGhGfogP1WB7salsKmsKYWheT80bh+TNi2ashChcIEA5FPGGUXCfzAySJId38Qa9d/dR
         cIn3ICsO8HhtNkJSdbt6XiOq34PCDjIDH1UWCBfAEsv8bBiTVjZe2tgvklaILhOSYPdI
         vMHg==
X-Gm-Message-State: ABy/qLbQY6wn/uDa0viuyWKMVSAsfeM+ip7bE/saIZKc07UyTCksiMYr
	AVgud+qMzKE4Hks1g2GMJXAGF3B6tFKr7vnorMPPxJEUnSJ+Q6m9ktYwKe6MK9DwHimzM8LvEz6
	aXQ/yjQJ9rKhEe/goU2Tthn5eAg==
X-Received: by 2002:a05:600c:207:b0:3f9:b867:4bb with SMTP id 7-20020a05600c020700b003f9b86704bbmr4228054wmi.2.1690364521695;
        Wed, 26 Jul 2023 02:42:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEJR4MjuVs4MC2UvM+18MzTwAbr0oz696nN83E0KwVUxl9B23QTqt0l84TgedQXhtCQy/p3aw==
X-Received: by 2002:a05:600c:207:b0:3f9:b867:4bb with SMTP id 7-20020a05600c020700b003f9b86704bbmr4228032wmi.2.1690364521297;
        Wed, 26 Jul 2023 02:42:01 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:f600:a519:c50:799b:f1e3? (p200300cbc705f600a5190c50799bf1e3.dip0.t-ipconnect.de. [2003:cb:c705:f600:a519:c50:799b:f1e3])
        by smtp.gmail.com with ESMTPSA id m25-20020a7bce19000000b003fbe36a4ce6sm1524526wmc.10.2023.07.26.02.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 02:42:00 -0700 (PDT)
Message-ID: <aa27b96e-5296-0324-d9d3-07ab1ee969d0@redhat.com>
Date: Wed, 26 Jul 2023 11:41:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
 <20230725100212.531277-7-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v5 6/7] mm/hotplug: Embed vmem_altmap details in memory
 block
In-Reply-To: <20230725100212.531277-7-aneesh.kumar@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 25.07.23 12:02, Aneesh Kumar K.V wrote:
> With memmap on memory, some architecture needs more details w.r.t altmap
> such as base_pfn, end_pfn, etc to unmap vmemmap memory. Instead of
> computing them again when we remove a memory block, embed vmem_altmap
> details in struct memory_block if we are using memmap on memory block
> feature.
> 
> No functional change in this patch
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---

[...]

>   
>   static int add_memory_block(unsigned long block_id, unsigned long state,
> -			    unsigned long nr_vmemmap_pages,
> +			    struct vmem_altmap *altmap,
>   			    struct memory_group *group)
>   {
>   	struct memory_block *mem;
> @@ -744,7 +751,14 @@ static int add_memory_block(unsigned long block_id, unsigned long state,
>   	mem->start_section_nr = block_id * sections_per_block;
>   	mem->state = state;
>   	mem->nid = NUMA_NO_NODE;
> -	mem->nr_vmemmap_pages = nr_vmemmap_pages;
> +	if (altmap) {
> +		mem->altmap = kmalloc(sizeof(struct vmem_altmap), GFP_KERNEL);
> +		if (!mem->altmap) {
> +			kfree(mem);
> +			return -ENOMEM;
> +		}
> +		memcpy(mem->altmap, altmap, sizeof(*altmap));
> +	}

I'm wondering if we should instead let the caller do the alloc/free. So we would alloc
int the caller and would only store the pointer.

Before removing the memory block, we would clear the pointer and free it in the caller.

IOW, when removing a memory block and we still have an altmap set, something would be wrong.

See below on try_remove_memory() handling.

[...]

> -static int get_nr_vmemmap_pages_cb(struct memory_block *mem, void *arg)
> +static int get_vmemmap_altmap_cb(struct memory_block *mem, void *arg)
>   {
> +	struct vmem_altmap *altmap = (struct vmem_altmap *)arg;
>   	/*
> -	 * If not set, continue with the next block.
> +	 * If we have any pages allocated from altmap
> +	 * return the altmap details and break callback.
>   	 */
> -	return mem->nr_vmemmap_pages;
> +	if (mem->altmap) {
> +		memcpy(altmap, mem->altmap, sizeof(struct vmem_altmap));
> +		return 1;
> +	}
> +	return 0;
>   }
>   
>   static int check_cpu_on_node(int nid)
> @@ -2146,9 +2152,8 @@ EXPORT_SYMBOL(try_offline_node);
>   
>   static int __ref try_remove_memory(u64 start, u64 size)
>   {
> -	struct vmem_altmap mhp_altmap = {};
> -	struct vmem_altmap *altmap = NULL;
> -	unsigned long nr_vmemmap_pages;
> +	int ret;
> +	struct vmem_altmap mhp_altmap, *altmap = NULL;
>   	int rc = 0, nid = NUMA_NO_NODE;
>   
>   	BUG_ON(check_hotplug_memory_range(start, size));
> @@ -2171,24 +2176,15 @@ static int __ref try_remove_memory(u64 start, u64 size)
>   	 * the same granularity it was added - a single memory block.
>   	 */
>   	if (mhp_memmap_on_memory()) {
> -		nr_vmemmap_pages = walk_memory_blocks(start, size, NULL,
> -						      get_nr_vmemmap_pages_cb);
> -		if (nr_vmemmap_pages) {
> +		ret = walk_memory_blocks(start, size, &mhp_altmap,
> +					 get_vmemmap_altmap_cb);
> +		if (ret) {
>   			if (size != memory_block_size_bytes()) {
>   				pr_warn("Refuse to remove %#llx - %#llx,"
>   					"wrong granularity\n",
>   					start, start + size);
>   				return -EINVAL;
>   			}
> -
> -			/*
> -			 * Let remove_pmd_table->free_hugepage_table do the
> -			 * right thing if we used vmem_altmap when hot-adding
> -			 * the range.
> -			 */
> -			mhp_altmap.base_pfn = PHYS_PFN(start);
> -			mhp_altmap.free = nr_vmemmap_pages;
> -			mhp_altmap.alloc = nr_vmemmap_pages;
>   			altmap = &mhp_altmap;
>   		}


Instead of that, I suggest (whitespace damage expected):

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 3f231cf1b410..f6860df64549 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1956,12 +1956,19 @@ static int check_memblock_offlined_cb(struct memory_block *mem, void *arg)
         return 0;
  }
  
-static int get_nr_vmemmap_pages_cb(struct memory_block *mem, void *arg)
+static int test_has_altmap_cb(struct memory_block *mem, void *arg)
  {
-       /*
-        * If not set, continue with the next block.
-        */
-       return mem->nr_vmemmap_pages;
+       struct memory_block **mem_ptr = (struct memory_block **)arg;
+
+       if (mem->altmap) {
+               /*
+                * We're not taking a reference on the memory block; it
+                * it cannot vanish while we're about to that memory ourselves.
+                */
+               *mem_ptr = mem;
+               return 1;
+       }
+       return 0;
  }
  
  static int check_cpu_on_node(int nid)
@@ -2036,9 +2043,7 @@ EXPORT_SYMBOL(try_offline_node);
  
  static int __ref try_remove_memory(u64 start, u64 size)
  {
-       struct vmem_altmap mhp_altmap = {};
         struct vmem_altmap *altmap = NULL;
-       unsigned long nr_vmemmap_pages;
         int rc = 0, nid = NUMA_NO_NODE;
  
         BUG_ON(check_hotplug_memory_range(start, size));
@@ -2061,9 +2066,9 @@ static int __ref try_remove_memory(u64 start, u64 size)
          * the same granularity it was added - a single memory block.
          */
         if (mhp_memmap_on_memory()) {
-               nr_vmemmap_pages = walk_memory_blocks(start, size, NULL,
-                                                     get_nr_vmemmap_pages_cb);
-               if (nr_vmemmap_pages) {
+               struct memory_block *mem;
+
+               if (walk_memory_blocks(start, size, &mem, test_has_altmap_cb)) {
                         if (size != memory_block_size_bytes()) {
                                 pr_warn("Refuse to remove %#llx - %#llx,"
                                         "wrong granularity\n",
@@ -2072,12 +2077,11 @@ static int __ref try_remove_memory(u64 start, u64 size)
                         }
  
                         /*
-                        * Let remove_pmd_table->free_hugepage_table do the
-                        * right thing if we used vmem_altmap when hot-adding
-                        * the range.
+                        * Clear the altmap from the memory block before we
+                        * remove it; we'll take care of freeing the altmap.
                          */
-                       mhp_altmap.alloc = nr_vmemmap_pages;
-                       altmap = &mhp_altmap;
+                       altmap = mem->altmap;
+                       mem->altmap = NULL;
                 }
         }
  
@@ -2094,6 +2098,9 @@ static int __ref try_remove_memory(u64 start, u64 size)
  
         arch_remove_memory(start, size, altmap);
  
+       if (altmap)
+               kfree(altmap);
+
         if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK)) {
                 memblock_phys_free(start, size);
                 memblock_remove(start, size);


-- 
Cheers,

David / dhildenb

