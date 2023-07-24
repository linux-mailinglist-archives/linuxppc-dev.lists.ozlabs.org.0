Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6413F75F8D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 15:48:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SXWgMuif;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SXWgMuif;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8hMd2m27z30PH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 23:48:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SXWgMuif;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SXWgMuif;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8hLm5fNGz2yGT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 23:47:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690206476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8pfmZyp+xA8zBWn7ulpQCaykhgvKopBAwd4XXMqneUA=;
	b=SXWgMuifxxscBxVTkPQ9zu4+PqSVtX9jrT6n3ih5hHVz5U9Oti4FooisDZWweKbcZ6WPXX
	eLDe2PFumAIBPjLFz1oI0DmV6BO/up/i6KfQb0r0uChShV4WOnGggTXm0zL3rOBif6G/nc
	VVyDlkgoIDR6vPDv51kLB7g4wSOqpfk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690206476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8pfmZyp+xA8zBWn7ulpQCaykhgvKopBAwd4XXMqneUA=;
	b=SXWgMuifxxscBxVTkPQ9zu4+PqSVtX9jrT6n3ih5hHVz5U9Oti4FooisDZWweKbcZ6WPXX
	eLDe2PFumAIBPjLFz1oI0DmV6BO/up/i6KfQb0r0uChShV4WOnGggTXm0zL3rOBif6G/nc
	VVyDlkgoIDR6vPDv51kLB7g4wSOqpfk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-aAvHpIluOCqpxcoE4xGuqQ-1; Mon, 24 Jul 2023 09:47:49 -0400
X-MC-Unique: aAvHpIluOCqpxcoE4xGuqQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-317421b94a4so850184f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 06:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690206468; x=1690811268;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pfmZyp+xA8zBWn7ulpQCaykhgvKopBAwd4XXMqneUA=;
        b=fEN34PoYC5yb0ihTDM1DgWAa/ZlcQ2kM6QFdAp3VWz0ACjVmwg1Abphv411SdHdDIn
         X5RJZuP0fpDonM7C/iBJh9F7dgNCWsffw3fhatkAd6Tkkgetj/2ToLyc3fcbQeoEJtWF
         8DXA8j+TuZpAy76orcNb25wGHn1HC/ZRU+rbw1x1HRD2hTPWqzB4vetjdW2bIzpexIs6
         ULLQ5jN9jaokWDg82+7amcZ7XLq+D88ly/7l9xQVQrnoWeDUKZh74r+iILq3I3Icokop
         QOkyMR7QDk3jSbKlhsAj5hw3zBRNDMVDmjXQHwLMjXH/XT4rztD4eIY3XMoEQZWvzP24
         aaYw==
X-Gm-Message-State: ABy/qLZWaO7RS1e7Ww64LeDWp9awuG5AEj6605sju2BOxIji6VMMoOG5
	GMsVZqytucmnOUHxssunpsX7drdNeMU6IwuOBBWuW5+B+GYz7sK+EwX04XYUyV15Xay+QvMC1mi
	bf0GwVDNRQtZOAzIK/S319K6yfQ==
X-Received: by 2002:a5d:53c3:0:b0:317:568d:d69a with SMTP id a3-20020a5d53c3000000b00317568dd69amr3729249wrw.11.1690206468270;
        Mon, 24 Jul 2023 06:47:48 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG9J8DGc/PhrKu3N3yp1FcLsFmxojaIc7GVIexsEiJCb+lP/AMrTxdPwz+JTXxMRzaEyCrdfw==
X-Received: by 2002:a5d:53c3:0:b0:317:568d:d69a with SMTP id a3-20020a5d53c3000000b00317568dd69amr3729226wrw.11.1690206467879;
        Mon, 24 Jul 2023 06:47:47 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73d:bb00:91a5:d1c:3a7e:4c77? (p200300cbc73dbb0091a50d1c3a7e4c77.dip0.t-ipconnect.de. [2003:cb:c73d:bb00:91a5:d1c:3a7e:4c77])
        by smtp.gmail.com with ESMTPSA id p1-20020a05600c204100b003fc17e8a1efsm12872573wmg.45.2023.07.24.06.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 06:47:47 -0700 (PDT)
Message-ID: <8a1b82f9-8de8-d0f6-874b-a2ba9131886d@redhat.com>
Date: Mon, 24 Jul 2023 15:47:46 +0200
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

^ just spotted this empty line that gets added here and removed int he 
next patch.

-- 
Cheers,

David / dhildenb

