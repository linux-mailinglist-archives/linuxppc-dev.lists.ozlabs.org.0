Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E518D74980B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 11:12:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hy5k0Mia;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hy5k0Mia;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxW5f0qNjz3dHw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 19:12:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hy5k0Mia;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hy5k0Mia;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxVz26T3sz3cGC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 19:07:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688634428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R42b/Wbgih42rOHKtCzKHwu2+V02R+fbzMrQPXy76Ow=;
	b=Hy5k0Miamo8J0i73QdHcIuOY7cufPIhb9y/e7SIvguFvNjFHx1JccMlk4OgGenzjWb8oqz
	Xmi0tECunQObido9LkE/BJxFN2RA3zx5MkB1tdzvvHaio+7pGCU/9nJJEHXIl2wFNg2uba
	P2cUUQW5RFNIQc0qUGc/czHJKfe4CTk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688634428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R42b/Wbgih42rOHKtCzKHwu2+V02R+fbzMrQPXy76Ow=;
	b=Hy5k0Miamo8J0i73QdHcIuOY7cufPIhb9y/e7SIvguFvNjFHx1JccMlk4OgGenzjWb8oqz
	Xmi0tECunQObido9LkE/BJxFN2RA3zx5MkB1tdzvvHaio+7pGCU/9nJJEHXIl2wFNg2uba
	P2cUUQW5RFNIQc0qUGc/czHJKfe4CTk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-I41ar0HpOwSrdrpTwxDspQ-1; Thu, 06 Jul 2023 05:07:06 -0400
X-MC-Unique: I41ar0HpOwSrdrpTwxDspQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-31286355338so244187f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 02:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688634425; x=1691226425;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R42b/Wbgih42rOHKtCzKHwu2+V02R+fbzMrQPXy76Ow=;
        b=kTKDUiqUqxb39xXOEkboYLOcH9W3H29f5LIPDwuUkzKRqRBbZnlraGfvuVPQivQYTu
         CQp1IkynEmtBrriT9tO6uSMoX4y9p6foQKYwLol86bIJX53GQyTzBcbHFGz594BEyHVR
         EyS2kLOunt5zYYXmQMpYRzeq+XrOGurtrXWCO+dMNxc3qwW7AguUSqPOP9gOgth71Li5
         xmcRRkB+WK7emJ4VIpaTj6fBRrOOjVVYi7oMCsJOm5YnLSwfXrakMNU8cBw2w4iCE8Ps
         VRd2Iok9hcHMLH0s3brhMV3P9mj8uZhvSfpT8a099DeiXKCXG+AIveSattEm314M5Y0Y
         PDHA==
X-Gm-Message-State: ABy/qLZEk8AQFUpL6atynCs+gOlAXqvBe8eMlUfqEhjVUUzMY1EvGE3H
	+zznbz9DSCjNZKcdrQRDRQchmIZKSZrRwGVjPO0ulr3eLzZ3W0XAx6YWA+4doRgXTsTYtDQZSrq
	+uLJBGEgUS0+ElHiELvIgtThvIA==
X-Received: by 2002:a5d:6b49:0:b0:314:327:2ece with SMTP id x9-20020a5d6b49000000b0031403272ecemr949160wrw.61.1688634425366;
        Thu, 06 Jul 2023 02:07:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE0lxW5bimNCjuvaRNMQEhG9azRUiUxoNrsW+1xm+ZQq90JKjbkV0+LPqLy9UT6IjmiaZfQiA==
X-Received: by 2002:a5d:6b49:0:b0:314:327:2ece with SMTP id x9-20020a5d6b49000000b0031403272ecemr949140wrw.61.1688634424916;
        Thu, 06 Jul 2023 02:07:04 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id j7-20020a5d6187000000b00301a351a8d6sm1280938wru.84.2023.07.06.02.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 02:07:04 -0700 (PDT)
Message-ID: <eba60083-641f-4d68-398e-60d06ce226e7@redhat.com>
Date: Thu, 6 Jul 2023 11:07:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230706085041.826340-1-aneesh.kumar@linux.ibm.com>
 <20230706085041.826340-6-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 5/5] powerpc/book3s64/memhotplug: Enable memmap on
 memory for radix
In-Reply-To: <20230706085041.826340-6-aneesh.kumar@linux.ibm.com>
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

On 06.07.23 10:50, Aneesh Kumar K.V wrote:
> Radix vmemmap mapping can map things correctly at the PMD level or PTE
> level based on different device boundary checks. We also use altmap.reserve
> feature to align things correctly at pageblock granularity. We can end up
> loosing some pages in memory with this. For ex: with 256MB memory block
> size, we require 4 pages to map vmemmap pages, In order to align things
> correctly we end up adding a reserve of 28 pages. ie, for every 4096 pages
> 28 pages get reserved.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   arch/powerpc/Kconfig                          |  1 +
>   arch/powerpc/mm/book3s64/radix_pgtable.c      | 28 +++++++++++++++++++
>   .../platforms/pseries/hotplug-memory.c        |  4 ++-
>   3 files changed, 32 insertions(+), 1 deletion(-)
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
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index a62729f70f2a..c0bd60b5fb64 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -1678,3 +1678,31 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
>   
>   	return 1;
>   }
> +
> +/*
> + * mm/memory_hotplug.c:mhp_supports_memmap_on_memory goes into details
> + * some of the restrictions. We don't check for PMD_SIZE because our
> + * vmemmap allocation code can fallback correctly. The pageblock

x86 also has the fallback IIRC; the concern is rather that you end up 
with a PTE-mapped vmemmap, which is slower at runtime than a PMD-mapped 
vmemmap.

> + * alignment requirement is met using altmap->reserve blocks.
> + */
> +bool mhp_supports_memmap_on_memory(unsigned long size)
> +{
> +	if (!radix_enabled())
> +		return false;
> +	/*
> +	 * The pageblock alignment requirement is met by using
> +	 * reserve blocks in altmap.
> +	 */
> +	return size == memory_block_size_bytes();
> +}

I really dislike such arch overrides.

I think the flow should be something like that, having a generic:

bool mhp_supports_memmap_on_memory(unsigned long size)
{
	...
	return arch_mhp_supports_memmap_on_memory(size)) &&
	       size == memory_block_size_bytes() &&
	       ...
}

where we'll also keep the pageblock check here.

And a ppc specific

bool arch_mhp_supports_memmap_on_memory(unsigned long size)
{
	/*
          * Don't check for the vmemmap covering PMD_SIZE, we accept that
          * we might get a PTE-mapped vmemmap.
          */
	return radix_enabled();
}

We can then move the PMD_SIZE check into arch specific code (x86-aarch64).

-- 
Cheers,

David / dhildenb

