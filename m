Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE95374F6E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 19:20:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hZJ2NYn6;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hZJ2NYn6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0ngN5fKBz3bkD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 03:20:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hZJ2NYn6;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hZJ2NYn6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0nfR3wqmz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 03:19:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689095948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/9M+w9wyYwGUra5eOp7gqUj7VLWSNr2xpH2Oj5f44v4=;
	b=hZJ2NYn6UnLf6ve2qa1ETGidzAc+JMYD0D8EvHoyblL7NTuOcAtUvvauIq3meRylczmdFp
	8fe2PsX6hzpnSuPV+83hm8HUidYyG1Q0s14+Ah5+ugBdI0cujZdIUXZ+kD2Xw68jse1blm
	cZoF+mT1zagTK20pywP7TJ2fFj+U5Vc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689095948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/9M+w9wyYwGUra5eOp7gqUj7VLWSNr2xpH2Oj5f44v4=;
	b=hZJ2NYn6UnLf6ve2qa1ETGidzAc+JMYD0D8EvHoyblL7NTuOcAtUvvauIq3meRylczmdFp
	8fe2PsX6hzpnSuPV+83hm8HUidYyG1Q0s14+Ah5+ugBdI0cujZdIUXZ+kD2Xw68jse1blm
	cZoF+mT1zagTK20pywP7TJ2fFj+U5Vc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-i-8tjyI6M0qX_lJ7vM4RlA-1; Tue, 11 Jul 2023 13:19:07 -0400
X-MC-Unique: i-8tjyI6M0qX_lJ7vM4RlA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-314134f403fso3285317f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 10:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689095946; x=1691687946;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9M+w9wyYwGUra5eOp7gqUj7VLWSNr2xpH2Oj5f44v4=;
        b=Mh/4vZ+lJle2b5ulg1wzzJht71KH/5r9QEJabhANvbcZebsqRnX8bMWhRvphffOj2z
         DbN/QMW1KOW4BhYsqkYS1ieAocMQO1hMYqblCRC+rmgY0Kj1YWo+vTUqfNn5y3rERcQe
         dcoUopDmMcNm1FiCvWH/vrhbg9vzeZjqgU7zyxO8rhhFWUB8PIt71ndzFCmyjJF3DUoo
         tjcAAS+8nJKI2ArPWm60/poRcYqaBLkQU+b1sBiznS2EzXjebfte7kqItSLtWoe+qr8F
         UhGFW+M/6LXS/+0995XMZUBMtCgglgQs/YpjSXgUn98CN996z23alRF/KLfPAHwS/0z4
         tmxA==
X-Gm-Message-State: ABy/qLZW0lQrqznhtTXdR0vaa9D6r/kBoo62YwMGK907D/MsEVbAT4eG
	dkuJqWOGehNSfmbZE7vp+g0rtPvuSg0bGVbCNKLI6s207HVfN8V+crK4ijHtWcx6VgQWUKkFkuF
	zfLKWODu5VOTtr+RWHC5MiQoIxQ==
X-Received: by 2002:a5d:6d50:0:b0:313:e888:3517 with SMTP id k16-20020a5d6d50000000b00313e8883517mr9881894wri.43.1689095945837;
        Tue, 11 Jul 2023 10:19:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFjs9i+1e2SCLTiGZJoMwpTB+Sx8tNcVltP3KrC+1KsvYVjiwCBam3TKHcUrm76bK04AXGfqg==
X-Received: by 2002:a5d:6d50:0:b0:313:e888:3517 with SMTP id k16-20020a5d6d50000000b00313e8883517mr9881879wri.43.1689095945413;
        Tue, 11 Jul 2023 10:19:05 -0700 (PDT)
Received: from ?IPV6:2003:cb:c745:4000:13ad:ed64:37e6:115d? (p200300cbc745400013aded6437e6115d.dip0.t-ipconnect.de. [2003:cb:c745:4000:13ad:ed64:37e6:115d])
        by smtp.gmail.com with ESMTPSA id i17-20020a5d55d1000000b00313f07ccca4sm2755866wrw.117.2023.07.11.10.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 10:19:04 -0700 (PDT)
Message-ID: <b44ce7ab-7fcf-3f1b-4bca-3d5d12838812@redhat.com>
Date: Tue, 11 Jul 2023 19:19:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
 <20230711044834.72809-5-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 4/7] mm/hotplug: Allow pageblock alignment via altmap
 reservation
In-Reply-To: <20230711044834.72809-5-aneesh.kumar@linux.ibm.com>
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

On 11.07.23 06:48, Aneesh Kumar K.V wrote:
> Add a new kconfig option that can be selected if we want to allow
> pageblock alignment by reserving pages in the vmemmap altmap area.
> This implies we will be reserving some pages for every memoryblock
> This also allows the memmap on memory feature to be widely useful
> with different memory block size values.

"reserving pages" is a nice way of saying "wasting memory". :) Let's 
spell that out.

I think we have to find a better name for this, and I think we should 
have a toggle similar to memory_hotplug.memmap_on_memory. This should be 
an admin decision, not some kernel config option.


memory_hotplug.force_memmap_on_memory

"Enable the memmap on memory feature even if it could result in memory 
waste due to memmap size limitations. For example, if the memmap for a 
memory block requires 1 MiB, but the pageblock size is 2 MiB, 1 MiB
of hotplugged memory will be wasted. Note that there are still cases 
where the feature cannot be enforced: for example, if the memmap is 
smaller than a single page, or if the architecture does not support the 
forced mode in all configurations."

Thoughts?

> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   mm/Kconfig          |  9 +++++++
>   mm/memory_hotplug.c | 59 +++++++++++++++++++++++++++++++++++++--------
>   2 files changed, 58 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 932349271e28..88a1472b2086 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -570,6 +570,15 @@ config MHP_MEMMAP_ON_MEMORY
>   	depends on MEMORY_HOTPLUG && SPARSEMEM_VMEMMAP
>   	depends on ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
>   
> +config MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY
> +       bool "Allow Reserving pages for page block aligment"
> +       depends on MHP_MEMMAP_ON_MEMORY
> +       help
> +	This option allows memmap on memory feature to be more useful
> +	with different memory block sizes. This is achieved by marking some pages
> +	in each memory block as reserved so that we can get page-block alignment
> +	for the remaining pages.
> +



>   endif # MEMORY_HOTPLUG
>   
>   config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 07c99b0cc371..f36aec1f7626 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1252,15 +1252,17 @@ static inline bool arch_supports_memmap_on_memory(unsigned long size)
>   {
>   	unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
>   	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
> -	unsigned long remaining_size = size - vmemmap_size;
>   
> -	return IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
> -		IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));
> +	return IS_ALIGNED(vmemmap_size, PMD_SIZE);
>   }
>   #endif
>   
>   static bool mhp_supports_memmap_on_memory(unsigned long size)
>   {
> +	unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
> +	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
> +	unsigned long remaining_size = size - vmemmap_size;
> +
>   	/*
>   	 * Besides having arch support and the feature enabled at runtime, we
>   	 * need a few more assumptions to hold true:
> @@ -1287,9 +1289,30 @@ static bool mhp_supports_memmap_on_memory(unsigned long size)
>   	 *       altmap as an alternative source of memory, and we do not exactly
>   	 *       populate a single PMD.
>   	 */
> -	return mhp_memmap_on_memory() &&
> -		size == memory_block_size_bytes() &&
> -		arch_supports_memmap_on_memory(size);
> +	if (!mhp_memmap_on_memory() || size != memory_block_size_bytes())
> +		return false;
> +	 /*
> +	  * Without page reservation remaining pages should be pageblock aligned.
> +	  */
> +	if (!IS_ENABLED(CONFIG_MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY) &&
> +	    !IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT)))
> +		return false;
> +
> +	return arch_supports_memmap_on_memory(size);
> +}
> +
> +static inline unsigned long memory_block_align_base(unsigned long size)
> +{
> +	if (IS_ENABLED(CONFIG_MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY)) {
> +		unsigned long align;
> +		unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
> +		unsigned long vmemmap_size;
> +
> +		vmemmap_size = (nr_vmemmap_pages * sizeof(struct page)) >> PAGE_SHIFT;
> +		align = pageblock_align(vmemmap_size) - vmemmap_size;

We should probably have a helper to calculate

a) the unaligned vmemmap size, for example used in 
arch_supports_memmap_on_memory()

b) the pageblock-aligned vmemmap size.


-- 
Cheers,

David / dhildenb

