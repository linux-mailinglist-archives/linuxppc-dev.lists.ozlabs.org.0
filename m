Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC5B3A0FEB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 12:05:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0N673YrYz3bwN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 20:05:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aAXZflFR;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aAXZflFR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=aAXZflFR; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=aAXZflFR; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0N5Z3SRQz301j
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 20:05:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623233117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHwERDV3Ik2w6kA7FU7L2RqGuM08Lzd2/FD6Wyr2HFk=;
 b=aAXZflFRMEt5MsS89bAvu/QD6atVVRargGGs3EzUz2yWGlBCvOz3niZpM1BW/aEAk6a7s7
 FBlvdkb+6BsJJnhmiodt6/sQq+TiGDyHOqZ7cow9umCJg/1hqKmck/NJG9jcEfDKKskAUh
 RNrkcs113tpFFSVHlkardmT6ygIO5Xk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623233117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHwERDV3Ik2w6kA7FU7L2RqGuM08Lzd2/FD6Wyr2HFk=;
 b=aAXZflFRMEt5MsS89bAvu/QD6atVVRargGGs3EzUz2yWGlBCvOz3niZpM1BW/aEAk6a7s7
 FBlvdkb+6BsJJnhmiodt6/sQq+TiGDyHOqZ7cow9umCJg/1hqKmck/NJG9jcEfDKKskAUh
 RNrkcs113tpFFSVHlkardmT6ygIO5Xk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-E89F97ADNkKckCaJ6OE9mg-1; Wed, 09 Jun 2021 06:05:05 -0400
X-MC-Unique: E89F97ADNkKckCaJ6OE9mg-1
Received: by mail-wr1-f71.google.com with SMTP id
 d5-20020a0560001865b0290119bba6e1c7so6577381wri.20
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Jun 2021 03:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=RHwERDV3Ik2w6kA7FU7L2RqGuM08Lzd2/FD6Wyr2HFk=;
 b=C8bkexnsMzAjfy76r58vp5Gs6SalUNJL0yuzWYF73aqs/KVPnH6qNU8PBoLtzNvve/
 7CrsKk7TrJQUnb8C9D2uyYOKCBwMbbvf5usucqF0gmJyU7xeqluNeXrFiS4AmTDzIYbr
 IhftK/3LgWbZCWN8DTFSoZb5zO4fFACdDUc8i7GwjAlrzkU0GvoVX30g9HoDLCG9ARuY
 Mi88IddtzZyRZ5+47Ep9tI4JZgvhWPt9uNa0bwWPwpjo9TNldamjZn7VumtWveDIuJty
 TxEvqxNeuP8ZFrXVIsykmqDVfIzURx2utoZj+HSwZqImDd9aDDIndplUna452inci42o
 fgTQ==
X-Gm-Message-State: AOAM532W+CSxPw9qN6rG8ag81fGeIj6CQj+Vj/RfDMb5UyNnOD7NVQVE
 y8HdshuwZvCNaqn2xn17n3klSsmEXaeAADmwFr55gkAKQ/sOCFKohJBWRIhqFgM27PrxWJYwUoL
 5qqvcCuvQ84wlglXKka9nBBbh/A==
X-Received: by 2002:adf:d4cc:: with SMTP id w12mr26997701wrk.216.1623233103790; 
 Wed, 09 Jun 2021 03:05:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxisdlmQ9hbEJc7XyIIogfmbAP40COfOWXq53QTDVV5O2yA236wwdWl7PrbHqWMhmbVzLyEcw==
X-Received: by 2002:adf:d4cc:: with SMTP id w12mr26997662wrk.216.1623233103520; 
 Wed, 09 Jun 2021 03:05:03 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c611d.dip0.t-ipconnect.de. [91.12.97.29])
 by smtp.gmail.com with ESMTPSA id
 l31sm9209629wms.31.2021.06.09.03.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 03:05:03 -0700 (PDT)
Subject: Re: [PATCH v1 05/12] mm/memory_hotplug: remove nid parameter from
 remove_memory() and friends
From: David Hildenbrand <david@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
References: <20210607195430.48228-1-david@redhat.com>
 <20210607195430.48228-6-david@redhat.com> <87y2bkehky.fsf@mpe.ellerman.id.au>
 <7463b3ed-07d3-7157-629d-a85a3ff558d6@redhat.com>
Organization: Red Hat
Message-ID: <fe3e8d93-4e69-84c5-3dd3-ab4aca3317ab@redhat.com>
Date: Wed, 9 Jun 2021 12:05:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <7463b3ed-07d3-7157-629d-a85a3ff558d6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: nvdimm@lists.linux.dev, Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Laurent Dufour <ldufour@linux.ibm.com>,
 Dave Jiang <dave.jiang@intel.com>, Vishal Verma <vishal.l.verma@intel.com>,
 linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>,
 Nathan Lynch <nathanl@linux.ibm.com>,
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

On 08.06.21 13:18, David Hildenbrand wrote:
> On 08.06.21 13:11, Michael Ellerman wrote:
>> David Hildenbrand <david@redhat.com> writes:
>>> There is only a single user remaining. We can simply try to offline all
>>> online nodes - which is fast, because we usually span pages and can skip
>>> such nodes right away.
>>
>> That makes me slightly nervous, because our big powerpc boxes tend to
>> trip on these scaling issues before others.
>>
>> But the spanned pages check is just:
>>
>> void try_offline_node(int nid)
>> {
>> 	pg_data_t *pgdat = NODE_DATA(nid);
>>           ...
>> 	if (pgdat->node_spanned_pages)
>> 		return;
>>
>> So I guess that's pretty cheap, and it's only O(nodes), which should
>> never get that big.
> 
> Exactly. And if it does turn out to be a problem, we can walk all memory
> blocks before removing them, collecting the nid(s).
> 

I might just do the following on top:

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 61bff8f3bfb1..bbc26fdac364 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -2176,7 +2176,9 @@ int __ref offline_pages(unsigned long start_pfn, unsigned long nr_pages,
  static int check_memblock_offlined_cb(struct memory_block *mem, void *arg)
  {
         int ret = !is_memblock_offlined(mem);
+       int *nid = arg;
  
+       *nid = mem->nid;
         if (unlikely(ret)) {
                 phys_addr_t beginpa, endpa;
  
@@ -2271,10 +2273,10 @@ EXPORT_SYMBOL(try_offline_node);
  
  static int __ref try_remove_memory(u64 start, u64 size)
  {
-       int rc = 0, nid;
         struct vmem_altmap mhp_altmap = {};
         struct vmem_altmap *altmap = NULL;
         unsigned long nr_vmemmap_pages;
+       int rc = 0, nid = NUMA_NO_NODE;
  
         BUG_ON(check_hotplug_memory_range(start, size));
  
@@ -2282,8 +2284,12 @@ static int __ref try_remove_memory(u64 start, u64 size)
          * All memory blocks must be offlined before removing memory.  Check
          * whether all memory blocks in question are offline and return error
          * if this is not the case.
+        *
+        * While at it, determine the nid. Note that if we'd have mixed nodes,
+        * we'd only try to offline the last determined one -- which is good
+        * enough for the cases we care about.
          */
-       rc = walk_memory_blocks(start, size, NULL, check_memblock_offlined_cb);
+       rc = walk_memory_blocks(start, size, &nid, check_memblock_offlined_cb);
         if (rc)
                 return rc;
  
@@ -2332,7 +2338,7 @@ static int __ref try_remove_memory(u64 start, u64 size)
  
         release_mem_region_adjustable(start, size);
  
-       for_each_online_node(nid)
+       if (nid != NUMA_NO_NODE)
                 try_offline_node(nid);
  
         mem_hotplug_done();



-- 
Thanks,

David / dhildenb

