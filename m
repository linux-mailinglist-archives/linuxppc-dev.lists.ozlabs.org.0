Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C0174F362
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 17:27:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xt4UuLOI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xt4UuLOI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0l9s22Dsz3brg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 01:27:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xt4UuLOI;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xt4UuLOI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0l8z3ws7z30dt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 01:26:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689089214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vM0w+6+aaAqWTgkd0SnTYMUtAoi91ku0pktKlO+P5ew=;
	b=Xt4UuLOILn78tjUPihFP8n87tnia/VV3JnhRimIMgN7vKUbIWpt6Dsz0+/9fvsjGLhx7GK
	+obi+Ym+QOo/daEtkD5qPsUOUt6oUnOAwli5MmjCdH/oXjePeieP3/Y6I//VDQveP/V5Vl
	3QoB5/BDlyLLdmWrQKhwYBLyDEttaUA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689089214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vM0w+6+aaAqWTgkd0SnTYMUtAoi91ku0pktKlO+P5ew=;
	b=Xt4UuLOILn78tjUPihFP8n87tnia/VV3JnhRimIMgN7vKUbIWpt6Dsz0+/9fvsjGLhx7GK
	+obi+Ym+QOo/daEtkD5qPsUOUt6oUnOAwli5MmjCdH/oXjePeieP3/Y6I//VDQveP/V5Vl
	3QoB5/BDlyLLdmWrQKhwYBLyDEttaUA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-JgPmfeiFPiyI0G4_3iQ3Ug-1; Tue, 11 Jul 2023 11:26:52 -0400
X-MC-Unique: JgPmfeiFPiyI0G4_3iQ3Ug-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3fbb34f7224so39174215e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 08:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689089211; x=1691681211;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vM0w+6+aaAqWTgkd0SnTYMUtAoi91ku0pktKlO+P5ew=;
        b=iflzSp8ZnVZvnBSNUZv4ABsH930LDdbjCMq+cXa9xcbPv79ZM6IZsJjP22OM5GxuOz
         QrjqLTUpS3/lFEhq4ZVCJsnwZL6SoNJwmfmENfxva8zQgMuvI4d/T+CWeSoLP8oue1Hl
         6oRMI5539F0IAM93DzLeeC+c72509kfhN0nl9DYH6uFHN3Z5/RET9jN4uuJkQoVCArsH
         yjNngyNef02hDyPOx73qW3DBUh/KleKa0Bx/BcxW5aJwk/yRXqu0dc6RmZSZBtF75GSj
         yTiSaH9Ss1zx8TX2SQCQIf5Nxp59aH8jh/Gi4YBUfszk4okq95Ez3isktHBinBOdF/JM
         Y6ng==
X-Gm-Message-State: ABy/qLaBf6zbov3gLVvJzByADI1aqUFq5B6TnQaCnv2nB5efaPjtzC3z
	6X4O+yioUGL7fPPI55PpSvyaxdp6He5cBNgsj5NEqHWAIkAlaDSsfHQNeMMpXl2ndE7KisTeP+w
	cn/uTYuSfqfF98QngE8abZehFqQ==
X-Received: by 2002:a1c:4c09:0:b0:3f9:8c3:6805 with SMTP id z9-20020a1c4c09000000b003f908c36805mr16214209wmf.7.1689089211238;
        Tue, 11 Jul 2023 08:26:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGw2WzDZuCEdYlu7Y0yLMaFqvebMduDgxmhsWsAORZJ56DuewUEdFcqGxFB+DTBd2RIvVW3kA==
X-Received: by 2002:a1c:4c09:0:b0:3f9:8c3:6805 with SMTP id z9-20020a1c4c09000000b003f908c36805mr16214192wmf.7.1689089210848;
        Tue, 11 Jul 2023 08:26:50 -0700 (PDT)
Received: from ?IPV6:2003:cb:c745:4000:13ad:ed64:37e6:115d? (p200300cbc745400013aded6437e6115d.dip0.t-ipconnect.de. [2003:cb:c745:4000:13ad:ed64:37e6:115d])
        by smtp.gmail.com with ESMTPSA id v2-20020adfe4c2000000b0031434c08bb7sm2515544wrm.105.2023.07.11.08.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 08:26:50 -0700 (PDT)
Message-ID: <98285185-170f-10fb-67a7-09e35ab47650@redhat.com>
Date: Tue, 11 Jul 2023 17:26:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 5/7] powerpc/book3s64/memhotplug: Enable memmap on
 memory for radix
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
 <20230711044834.72809-6-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230711044834.72809-6-aneesh.kumar@linux.ibm.com>
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
> Radix vmemmap mapping can map things correctly at the PMD level or PTE
> level based on different device boundary checks. Hence we skip the
> restrictions w.r.t vmemmap size to be multiple of PMD_SIZE. This also
> makes the feature widely useful because to use PMD_SIZE vmemmap area we
> require a memory block size of 2GiB
> 
> We can also use MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY to that the feature
> can work with a memory block size of 256MB. Using altmap.reserve feature
> to align things correctly at pageblock granularity. We can end up
> losing some pages in memory with this. For ex: with a 256MiB memory block
> size, we require 4 pages to map vmemmap pages, In order to align things
> correctly we end up adding a reserve of 28 pages. ie, for every 4096
> pages 28 pages get reserved.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   arch/powerpc/Kconfig                          |  1 +
>   arch/powerpc/include/asm/pgtable.h            | 28 +++++++++++++++++++
>   .../platforms/pseries/hotplug-memory.c        |  3 +-
>   mm/memory_hotplug.c                           |  2 ++
>   4 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 116d6add0bb0..f890907e5bbf 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -157,6 +157,7 @@ config PPC
>   	select ARCH_HAS_UBSAN_SANITIZE_ALL
>   	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>   	select ARCH_KEEP_MEMBLOCK
> +	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if PPC_RADIX_MMU
>   	select ARCH_MIGHT_HAVE_PC_PARPORT
>   	select ARCH_MIGHT_HAVE_PC_SERIO
>   	select ARCH_OPTIONAL_KERNEL_RWX		if ARCH_HAS_STRICT_KERNEL_RWX
> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
> index 68817ea7f994..8e6c92dde6ad 100644
> --- a/arch/powerpc/include/asm/pgtable.h
> +++ b/arch/powerpc/include/asm/pgtable.h
> @@ -169,6 +169,34 @@ static inline bool is_ioremap_addr(const void *x)
>   int __meminit vmemmap_populated(unsigned long vmemmap_addr, int vmemmap_map_size);
>   bool altmap_cross_boundary(struct vmem_altmap *altmap, unsigned long start,
>   			   unsigned long page_size);
> +/*
> + * mm/memory_hotplug.c:mhp_supports_memmap_on_memory goes into details
> + * some of the restrictions. We don't check for PMD_SIZE because our
> + * vmemmap allocation code can fallback correctly. The pageblock
> + * alignment requirement is met using altmap->reserve blocks.
> + */
> +#define arch_supports_memmap_on_memory arch_supports_memmap_on_memory
> +static inline bool arch_supports_memmap_on_memory(unsigned long size)
> +{
> +	unsigned long nr_pages = size >> PAGE_SHIFT;
> +	unsigned long vmemmap_size = nr_pages * sizeof(struct page);
> +
> +	if (!radix_enabled())
> +		return false;
> +
> +#ifdef CONFIG_PPC_4K_PAGES
> +	return IS_ALIGNED(vmemmap_size, PMD_SIZE);
> +#else
> +	/*
> +	 * Make sure the vmemmap allocation is fully contianed
> +	 * so that we always allocate vmemmap memory from altmap area.
> +	 * The pageblock alignment requirement is met by using
> +	 * reserve blocks in altmap.
> +	 */
> +	return IS_ALIGNED(vmemmap_size,  PAGE_SIZE);

Can we move that check into common code as well?

If our (original) vmemmap size would not fit into a single page, we 
would be in trouble on any architecture. Did not check if it would be an 
issue for arm64 as well in case we would allow eventually wasting memory.

-- 
Cheers,

David / dhildenb

