Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E149674984E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 11:25:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fybZ71fZ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dtjhu7Bl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxWND5rkTz3bv4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 19:25:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fybZ71fZ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dtjhu7Bl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxWMM2TTTz2xJ4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 19:24:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688635483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rpec4T93wDYZjo7+Z3gbFxMP0yyz1BRaLAaacEc8RdM=;
	b=fybZ71fZuRlyGr5XjZVLQTPNvFMlAIdVmLGtvjbvKrjKupQ6it54LZgOcD88dtUpSNamKn
	0qss36NI5Vm6ZYpKHUhzhCLdbwjmolagtE+d/L2nog1TD9iP9Sr2ncfco99Oj5oGb9fHok
	j2D0IUAu9gXTF7WJqU/G3BBqfPTvNXE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688635484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rpec4T93wDYZjo7+Z3gbFxMP0yyz1BRaLAaacEc8RdM=;
	b=Dtjhu7BlNjEyXpQVOxaqdnM6RdFMUmkYD9o2aNRCRt86by3sFNjFkwM9eftuZdQaArdp+8
	cjpdfY2z3Y82DdGz6PN78o0IxFXGY1eJIanDsWUuvBnOVkG18dA5l6TZwPxScS1mMptlD5
	ct2cjq/C0hp+cmlfqSo2ihufFbAm3hU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-u59uoLxtM5a9SMqkpnSl-g-1; Thu, 06 Jul 2023 05:24:41 -0400
X-MC-Unique: u59uoLxtM5a9SMqkpnSl-g-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-31421c900b7so242859f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 02:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688635480; x=1691227480;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rpec4T93wDYZjo7+Z3gbFxMP0yyz1BRaLAaacEc8RdM=;
        b=Y3LJ+lfY9892aDh3tP14Qv+Suscf2PzsRz51qEZAjDZVKd1dm9RqpaFHtHF9I/aFEs
         39V4hiivu9gM8tnDZgPZYEEDFTyfmIgNuBNoJ669ReL8MWs0KQLYvv2yEnAfyJh0HVo4
         KgIoq2KqrSV1Sk5nZtPF8GUywguyVW4HYNFJctjsUG8Q/dkjgVsLmCXJr5jgULJTdElV
         cw2poQS7lSwh72BF/kCvMxZUeQ4gJYkg9NHvdsnA+28BXwEioUwIf+ceUWaVnbJTSqVC
         EBKPfzZdQ35WBKCmLZrgRxIcPrDnvbGll0JXTR2WA8QQKn7RIorhpT75EECDGy3H65n3
         svaw==
X-Gm-Message-State: ABy/qLZNHJ7sAVtlmwTpBKkfy7DVG9V+MFURre7BsFF7sMR+f0qkaVgz
	zaKTaPcG2Baw9ZcnQn2pn13NizUon3tawv2RVKmsTbWagOb5auyBiORmn8klKxX5N4ngUlciIWD
	ovBrVDPJdhwKHghsagW8KC2B/Fw==
X-Received: by 2002:adf:fed1:0:b0:306:2e62:8d2e with SMTP id q17-20020adffed1000000b003062e628d2emr1038216wrs.1.1688635480721;
        Thu, 06 Jul 2023 02:24:40 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF+hkoShQiUt2aK2jbP6BLI4V/XrUGB9ja8pOROo25U1Ew5hgmdJl8cZRK/1s56/OJa/fSdOg==
X-Received: by 2002:adf:fed1:0:b0:306:2e62:8d2e with SMTP id q17-20020adffed1000000b003062e628d2emr1038203wrs.1.1688635480418;
        Thu, 06 Jul 2023 02:24:40 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id j7-20020a5d6187000000b00301a351a8d6sm1322911wru.84.2023.07.06.02.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 02:24:39 -0700 (PDT)
Message-ID: <0efcd10b-dff8-d011-e192-5feaedc2ee2d@redhat.com>
Date: Thu, 6 Jul 2023 11:24:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/5] mm/hotplug: Simplify the handling of
 MHP_MEMMAP_ON_MEMORY flag
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230706085041.826340-1-aneesh.kumar@linux.ibm.com>
 <20230706085041.826340-4-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230706085041.826340-4-aneesh.kumar@linux.ibm.com>
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
> Instead of checking for memmap on memory feature enablement within the
> functions checking for alignment, use the kernel parameter to control the
> memory hotplug flags. The generic kernel now enables memmap on memory
> feature if the hotplug flag request for the same.
> 
> The ACPI code now can pass the flag unconditionally because the kernel will
> fallback to not using the feature if the alignment rules are not met.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   drivers/acpi/acpi_memhotplug.c |  3 +--
>   include/linux/memory_hotplug.h | 14 ++++++++++++++
>   mm/memory_hotplug.c            | 35 +++++++++++-----------------------
>   3 files changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/acpi/acpi_memhotplug.c b/drivers/acpi/acpi_memhotplug.c
> index 24f662d8bd39..4d0096fc4cc2 100644
> --- a/drivers/acpi/acpi_memhotplug.c
> +++ b/drivers/acpi/acpi_memhotplug.c
> @@ -211,8 +211,7 @@ static int acpi_memory_enable_device(struct acpi_memory_device *mem_device)
>   		if (!info->length)
>   			continue;
>   
> -		if (mhp_supports_memmap_on_memory(info->length))
> -			mhp_flags |= MHP_MEMMAP_ON_MEMORY;
> +		mhp_flags |= get_memmap_on_memory_flags();
>   		result = __add_memory(mgid, info->start_addr, info->length,
>   				      mhp_flags);
>   
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index a769f44b8368..af7017122506 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -358,4 +358,18 @@ bool mhp_supports_memmap_on_memory(unsigned long size);
>   bool __mhp_supports_memmap_on_memory(unsigned long size);
>   #endif /* CONFIG_MEMORY_HOTPLUG */
>   
> +#ifdef CONFIG_MHP_MEMMAP_ON_MEMORY
> +extern bool memmap_on_memory;
> +static inline unsigned long get_memmap_on_memory_flags(void)
> +{
> +	if (memmap_on_memory)
> +		return MHP_MEMMAP_ON_MEMORY;
> +	return 0;
> +}
> +#else
> +static inline unsigned long get_memmap_on_memory_flags(void)
> +{
> +	return 0;
> +}
> +#endif

That's kind-of ugly TBH.


Why do we need this change?

-- 
Cheers,

David / dhildenb

