Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F23374EBD0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 12:37:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jEvDpzuS;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jEvDpzuS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0ckM3Yjjz3c4X
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 20:36:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jEvDpzuS;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jEvDpzuS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0cjV72YYz2xdq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 20:36:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689071771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N6ssCuG0JSd5qlcN8oKSPfiBnIlcxyeXs8YnZjwGfBA=;
	b=jEvDpzuSBoVIhBcer7fVKwrde+YOff9Hq1ce8YssbKakaI4ksxpaMPX7HmMj2KexKmwC+8
	IgbHXaDlzmjK36dgMiPFen374SyLbNREcF6RBA0RwWSlym9DJWAGHwfzbOc310WO8Ycjz4
	LXUd5tjPPeTNh7oHjFKhRYs8xFUBBMk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689071771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N6ssCuG0JSd5qlcN8oKSPfiBnIlcxyeXs8YnZjwGfBA=;
	b=jEvDpzuSBoVIhBcer7fVKwrde+YOff9Hq1ce8YssbKakaI4ksxpaMPX7HmMj2KexKmwC+8
	IgbHXaDlzmjK36dgMiPFen374SyLbNREcF6RBA0RwWSlym9DJWAGHwfzbOc310WO8Ycjz4
	LXUd5tjPPeTNh7oHjFKhRYs8xFUBBMk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-hZdaGFU8Ozahb9b3ey9Uxg-1; Tue, 11 Jul 2023 06:36:10 -0400
X-MC-Unique: hZdaGFU8Ozahb9b3ey9Uxg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-314326f6e23so2877332f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 03:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689071769; x=1691663769;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6ssCuG0JSd5qlcN8oKSPfiBnIlcxyeXs8YnZjwGfBA=;
        b=gXldxzobSF7RhpkHLTB+GIqYGWhEd2XH2QxVuV61WXgVDAzyy54BGVbduRZV6FkI9p
         80ixyKJdlIC2AM1dgs1MTm5XMSAEIpmO3wQsLMk8hlVCac6VovlTHykdw6RuNSehl1wj
         ksguPvXhhonhH4/etEGjJddE2w3pGumj4x0WrE52VMRFMDbqt2JI7klpra4PWfUFeOuE
         PFHpaohaMSHfd5uEjtK9r23an6hiE+BPMwenx7Y2p7EfC8JWJ279z8NyKHXIngBc3Hr2
         QFEp3rZ+Gif4pj6O7F0KxXJ/e2p6vXNP/2Z5i5yxrybcZoFbOL85xBuWgUe01kLsf2s7
         iotA==
X-Gm-Message-State: ABy/qLY6X0NmGBVXV8Qw4uhhiM8C9okz6O/Q92jsFnh4I4IkyVkKaon2
	8kFAqL7woBDsJ/CiMzySh0r2pCPriB0lnEy5S3m/fQ3yypzF5KED0uxhxyy78D9d1vPrqVGQpks
	Ygbj4NsSw3p++1gOwDa2YfEoFMdLeuqjX+Q==
X-Received: by 2002:a5d:6341:0:b0:314:2a9:1071 with SMTP id b1-20020a5d6341000000b0031402a91071mr12538660wrw.19.1689071769128;
        Tue, 11 Jul 2023 03:36:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGL499w+SZyLH/zF1GbGuxkRudeRvMjgropibce7B/h5OetzSacJIWp1+vOVl9LpNoPDUjtog==
X-Received: by 2002:a5d:6341:0:b0:314:2a9:1071 with SMTP id b1-20020a5d6341000000b0031402a91071mr12538639wrw.19.1689071768778;
        Tue, 11 Jul 2023 03:36:08 -0700 (PDT)
Received: from ?IPV6:2003:cb:c745:4000:13ad:ed64:37e6:115d? (p200300cbc745400013aded6437e6115d.dip0.t-ipconnect.de. [2003:cb:c745:4000:13ad:ed64:37e6:115d])
        by smtp.gmail.com with ESMTPSA id w8-20020adfd4c8000000b003141e629cb6sm1860337wrk.101.2023.07.11.03.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 03:36:08 -0700 (PDT)
Message-ID: <6f6764f6-4b5a-dfa8-c409-ba4f2828891f@redhat.com>
Date: Tue, 11 Jul 2023 12:36:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
 <20230711044834.72809-4-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 3/7] mm/hotplug: Allow architecture to override memmap
 on memory support check
In-Reply-To: <20230711044834.72809-4-aneesh.kumar@linux.ibm.com>
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
> Some architectures would want different restrictions. Hence add an
> architecture-specific override.
> 
> Both the PMD_SIZE check and pageblock alignment check are moved there.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   mm/memory_hotplug.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 1b19462f4e72..07c99b0cc371 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1247,12 +1247,20 @@ static int online_memory_block(struct memory_block *mem, void *arg)
>   	return device_online(&mem->dev);
>   }
>   
> -static bool mhp_supports_memmap_on_memory(unsigned long size)
> +#ifndef arch_supports_memmap_on_memory

Can we make that a __weak function instead?

> +static inline bool arch_supports_memmap_on_memory(unsigned long size)
>   {
> -	unsigned long nr_vmemmap_pages = size / PAGE_SIZE;
> +	unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
>   	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
>   	unsigned long remaining_size = size - vmemmap_size;
>   
> +	return IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
> +		IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));

You're moving that check back to mhp_supports_memmap_on_memory() in the 
following patch, where it actually belongs. So this check should stay in 
mhp_supports_memmap_on_memory(). Might be reasonable to factor out the 
vmemmap_size calculation.


Also, let's a comment

/*
  * As default, we want the vmemmap to span a complete PMD such that we
  * can map the vmemmap using a single PMD if supported by the
  * architecture.
  */
return IS_ALIGNED(vmemmap_size, PMD_SIZE);

> +}
> +#endif
> +
> +static bool mhp_supports_memmap_on_memory(unsigned long size)
> +{
>   	/*
>   	 * Besides having arch support and the feature enabled at runtime, we
>   	 * need a few more assumptions to hold true:
> @@ -1280,9 +1288,8 @@ static bool mhp_supports_memmap_on_memory(unsigned long size)
>   	 *       populate a single PMD.
>   	 */
>   	return mhp_memmap_on_memory() &&
> -	       size == memory_block_size_bytes() &&
> -	       IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
> -	       IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));
> +		size == memory_block_size_bytes() &&

If you keep the properly aligned indentation, this will not be detected 
as a change by git.

> +		arch_supports_memmap_on_memory(size);
>   }
>   
>   /*

-- 
Cheers,

David / dhildenb

