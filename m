Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 411E275F663
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 14:31:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ebtuI9LG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NnGtXdO2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8fff156lz30gD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 22:31:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ebtuI9LG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NnGtXdO2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8fdn1N1wz2ykf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 22:30:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690201849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VSKoQEP2EDnL6kJfqxqzODZFeF9lR49lBqcSAz/K+nQ=;
	b=ebtuI9LGpiEg8aBIoD49Ly0dpaLOKSVWIb8dhAOwYPBWGU2GSPPM/BGeKWMyADOvputdVY
	TUBBOxkkPM6o27tIKlUbc270sDq9q16M0phSL6hgfsOrN9zvsvEyZ14kEiB+wG/Z1M5La6
	NZLa0+huGHWW760uxIyIKPmi1SN+afU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690201850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VSKoQEP2EDnL6kJfqxqzODZFeF9lR49lBqcSAz/K+nQ=;
	b=NnGtXdO2rquTxKDTqBR/zZghvwUABbFrWEMvn9hWGTZVHkCPv38T1qi0pVFzULIHiOIVmC
	Q03eHnqPb9l0PJW+uvo/lL9WbNZwX8CWavYefx2awbYfqLacnKrs6Yxw+eXgBXkPjJK+Lu
	lYpRM7Ub12wVEmqDoNX5P7C2o+0f024=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-_igSPDWQO1WbHqnRIw4E5w-1; Mon, 24 Jul 2023 08:30:47 -0400
X-MC-Unique: _igSPDWQO1WbHqnRIw4E5w-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-4fb7b4be07bso3654112e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 05:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690201846; x=1690806646;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VSKoQEP2EDnL6kJfqxqzODZFeF9lR49lBqcSAz/K+nQ=;
        b=YIAgkeAOCnsGvAjVEYJCVP5VugWe9eZvCb0wdjDYlq7qVeqmIAHcza4pwrXNNJ5BXO
         SMZL19/Yq25+fRlqD6IAmWanCSSHw0tZkbiDuU3a6gBboC3faWuGYyC3coQ5tmWcEkPl
         QetG9GgGHL6W2TB6dTwn4F2TVWyxVxG0AmMVMrVyhTOn6lXXcAvKAyXphuyCfzk2gQpz
         8jCmkiE7AUid38nTmSx76zDOnxgrkHWvl8TdrbotF1FsLIttduQYxv/th71nZagdNax7
         rFn6i0hYL2Fl/jx5YmbqFD8KrEcsgDArtp7GwMrYEzXjftfrD1QFnGQTjj7+l1W9Qe2W
         bgSQ==
X-Gm-Message-State: ABy/qLbOegb1rhewH79Bhu9OE63S1jymhzBN+eto1vSB61/hkxAtN07F
	jhxHKHbt1lPM2SENQvZdRHlEJgE6s7DbPWuKJgZApsdm4UNajuI8smmA2Lx8MXpJtmyGkEYc5xi
	gF/UwcYxHLbKcQIY1a9Zkr56xhw==
X-Received: by 2002:ac2:4ec6:0:b0:4fd:c923:db5e with SMTP id p6-20020ac24ec6000000b004fdc923db5emr4314732lfr.21.1690201846424;
        Mon, 24 Jul 2023 05:30:46 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHg111kHN8tF7r6WNzgjtK5ISBSRjkXuBIfdVHLMEx/BxkeOZq0VLRuHYj9anom7QpNRx/Mzg==
X-Received: by 2002:ac2:4ec6:0:b0:4fd:c923:db5e with SMTP id p6-20020ac24ec6000000b004fdc923db5emr4314718lfr.21.1690201846063;
        Mon, 24 Jul 2023 05:30:46 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73d:bb00:91a5:d1c:3a7e:4c77? (p200300cbc73dbb0091a50d1c3a7e4c77.dip0.t-ipconnect.de. [2003:cb:c73d:bb00:91a5:d1c:3a7e:4c77])
        by smtp.gmail.com with ESMTPSA id x8-20020a1c7c08000000b003f90b9b2c31sm12816583wmc.28.2023.07.24.05.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 05:30:45 -0700 (PDT)
Message-ID: <6dc3c82f-c732-79bf-b678-d6484d1b7f76@redhat.com>
Date: Mon, 24 Jul 2023 14:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 3/6] mm/hotplug: Allow architecture to override memmap
 on memory support check
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230718024409.95742-1-aneesh.kumar@linux.ibm.com>
 <20230718024409.95742-4-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230718024409.95742-4-aneesh.kumar@linux.ibm.com>
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

On 18.07.23 04:44, Aneesh Kumar K.V wrote:
> Some architectures would want different restrictions. Hence add an
> architecture-specific override.
> 
> Both the PMD_SIZE check and pageblock alignment check are moved there.

No :)

> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   mm/memory_hotplug.c | 22 +++++++++++++++++++---
>   1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 1b19462f4e72..5921c81fcb70 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1247,9 +1247,25 @@ static int online_memory_block(struct memory_block *mem, void *arg)
>   	return device_online(&mem->dev);
>   }
>   
> +#ifndef arch_supports_memmap_on_memory
> +static inline bool arch_supports_memmap_on_memory(unsigned long size)
> +{
> +	unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
> +	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
> +
> +	/*
> +	 * As default, we want the vmemmap to span a complete PMD such that we
> +	 * can map the vmemmap using a single PMD if supported by the
> +	 * architecture.
> +	 */
> +	return IS_ALIGNED(vmemmap_size, PMD_SIZE);
> +}
> +#endif
> +
>   static bool mhp_supports_memmap_on_memory(unsigned long size)
>   {
> -	unsigned long nr_vmemmap_pages = size / PAGE_SIZE;
> +
> +	unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
>   	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
>   	unsigned long remaining_size = size - vmemmap_size;
>   
> @@ -1281,8 +1297,8 @@ static bool mhp_supports_memmap_on_memory(unsigned long size)
>   	 */
>   	return mhp_memmap_on_memory() &&
>   	       size == memory_block_size_bytes() &&
> -	       IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
> -	       IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));
> +	       IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT)) &&
> +	       arch_supports_memmap_on_memory(size);
>   }
>   
>   /*

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

