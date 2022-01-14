Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8E848EB03
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 14:45:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jb2cH3Z0Nz30Lc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 00:45:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eSlalJIt;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eSlalJIt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=eSlalJIt; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=eSlalJIt; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jb2bY5Jv8z2yLy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jan 2022 00:44:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642167877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nfjFLSHiBQKga3FwXwxrCNc9DhWW0rRljO+uSdIGNDI=;
 b=eSlalJItA1fAVeZ4lPifC1zKADSLB1XFI24QmLbj/CORxM2iHCkLA/C9iltecnBJ2jvxbV
 iJ7kVrleBjitaKDkAL+9D7B2XjeuUNWqmSLgOZ4WsU+N/XTLkihUEiQ4q/ogWLOqzu9gze
 seFz3ufpxA2CKQ+kvZU75+eYUTRf7Es=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642167877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nfjFLSHiBQKga3FwXwxrCNc9DhWW0rRljO+uSdIGNDI=;
 b=eSlalJItA1fAVeZ4lPifC1zKADSLB1XFI24QmLbj/CORxM2iHCkLA/C9iltecnBJ2jvxbV
 iJ7kVrleBjitaKDkAL+9D7B2XjeuUNWqmSLgOZ4WsU+N/XTLkihUEiQ4q/ogWLOqzu9gze
 seFz3ufpxA2CKQ+kvZU75+eYUTRf7Es=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-LEzT3HmCNYKgBvVakAK6Ww-1; Fri, 14 Jan 2022 08:44:35 -0500
X-MC-Unique: LEzT3HmCNYKgBvVakAK6Ww-1
Received: by mail-ed1-f71.google.com with SMTP id
 t11-20020aa7d70b000000b004017521782dso854258edq.19
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 05:44:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nfjFLSHiBQKga3FwXwxrCNc9DhWW0rRljO+uSdIGNDI=;
 b=vR4b+iVKP1IWM3wMpG042AeWgp7pu1EG+1jQTlxFOwNeKGNN53Qc3MiLTt9VgBbD14
 PKdMUHPh22SN2qHZPhysNygiCk/YF+GyhCR+4NCDymX89+P00wT/6dp+2AMd8j31iusI
 QKr9WN63zFHKv0K0AaD538ufwlmHc9aDrwC7PAwKrxyVnZCiukt2FSAeU0puEf7W68V1
 BiublEQGBqQ/lQWsIViMqaji6MihSY4DfrDeXztyxGZUVMfpgAe1H42zIWscnOlNDEVc
 ohxIycvAD5InVfzg4wgwIllnRnaA3Eqny1+t20FcDeScU1QidsUf3QMFy3EbyOus8pNG
 YC1w==
X-Gm-Message-State: AOAM532fgCwQPipnTG50GZRMC3Flkh+nRqUIwbYjRkxpuJf4oxVX2+FL
 7WQXzlVSJXWHc5nlLvJYRAWX40XWFNqJxyfv2emvyEH3/OwprSYQQ0bIfEnDS3HcErvFldJwrwv
 Thrc1veNaTJUsIXLad28KNZTJug==
X-Received: by 2002:a05:6402:1008:: with SMTP id
 c8mr9115185edu.114.1642167874595; 
 Fri, 14 Jan 2022 05:44:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5OFak9AC/l+A6gU6QqTI2K9zWFX8t7yOZXV50BOSN3qj9pr1cdJHhBXdsT7LCgDNpLjpiDw==
X-Received: by 2002:a05:6402:1008:: with SMTP id
 c8mr9115163edu.114.1642167874354; 
 Fri, 14 Jan 2022 05:44:34 -0800 (PST)
Received: from ?IPV6:2003:cb:c701:9d00:ff87:1c9b:108a:9702?
 (p200300cbc7019d00ff871c9b108a9702.dip0.t-ipconnect.de.
 [2003:cb:c701:9d00:ff87:1c9b:108a:9702])
 by smtp.gmail.com with ESMTPSA id 10sm1861145ejy.174.2022.01.14.05.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 05:44:33 -0800 (PST)
Message-ID: <60778775-b5f5-0837-092f-9911cec84854@redhat.com>
Date: Fri, 14 Jan 2022 14:44:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v3 7/8] drivers: virtio_mem: use pageblock size as the
 minimum virtio_mem size.
To: Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org
References: <20220105214756.91065-1-zi.yan@sent.com>
 <20220105214756.91065-8-zi.yan@sent.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220105214756.91065-8-zi.yan@sent.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Mel Gorman <mgorman@techsingularity.net>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Eric Ren <renzhengeek@gmail.com>,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05.01.22 22:47, Zi Yan wrote:
> From: Zi Yan <ziy@nvidia.com>
> 
> alloc_contig_range() now only needs to be aligned to pageblock_order,
> drop virtio_mem size requirement that it needs to be the max of
> pageblock_order and MAX_ORDER.
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>  drivers/virtio/virtio_mem.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
> index a6a78685cfbe..2664dc16d0f9 100644
> --- a/drivers/virtio/virtio_mem.c
> +++ b/drivers/virtio/virtio_mem.c
> @@ -2481,8 +2481,7 @@ static int virtio_mem_init_hotplug(struct virtio_mem *vm)
>  	 * - Is required for now for alloc_contig_range() to work reliably -
>  	 *   it doesn't properly handle smaller granularity on ZONE_NORMAL.
>  	 */

Please also update this comment.

-- 
Thanks,

David / dhildenb

