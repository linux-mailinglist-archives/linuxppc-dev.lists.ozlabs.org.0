Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A9276521D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 13:19:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q0tQRdsh;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q0tQRdsh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBSw13BXhz3cRc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 21:19:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q0tQRdsh;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q0tQRdsh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBStl2bXrz3cJ4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 21:18:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690456700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J5aSglhBSh7Q6jT77+XYZea18X5UXNoMlG4BeMpxQmA=;
	b=Q0tQRdsh5qiwf/eZx0HxKw5LQuPQzqPd6Bl3dAyeQ4IIt7vk2rLuKR2CQBbG9hkuN3nBax
	XC+mZDmQW4mLG2CDAImlY2eikAjyNo6ikUR0Ly8Qyja9sAtwC3yW+rqF62/xRvY7yv7XHH
	ZpjObrV65TF+bL9EJNBeueTY2E/V7tc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690456700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J5aSglhBSh7Q6jT77+XYZea18X5UXNoMlG4BeMpxQmA=;
	b=Q0tQRdsh5qiwf/eZx0HxKw5LQuPQzqPd6Bl3dAyeQ4IIt7vk2rLuKR2CQBbG9hkuN3nBax
	XC+mZDmQW4mLG2CDAImlY2eikAjyNo6ikUR0Ly8Qyja9sAtwC3yW+rqF62/xRvY7yv7XHH
	ZpjObrV65TF+bL9EJNBeueTY2E/V7tc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-pePiulysNLC3hQ1N-AOiCQ-1; Thu, 27 Jul 2023 07:18:16 -0400
X-MC-Unique: pePiulysNLC3hQ1N-AOiCQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3fbdf341934so4374295e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 04:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690456691; x=1691061491;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5aSglhBSh7Q6jT77+XYZea18X5UXNoMlG4BeMpxQmA=;
        b=RlZfSY2xMBLB3wCvZlRtSCE2dx18iyWc7t0xegyjHx5szNJDDDtlwsMSjHvBaL0xrY
         8Ch1JOFRQqDitVpsdUP+dvnnZ+ACQLy1Z5rRFRR+kzgkcEKWuOakUAocxXD4ER+xkHKj
         gE+x5la4LctTguuFsXGIclD9UfXcD7JHLisWOstF9XSTCDFgckScQP8zwTMab21WHoWT
         EKOlwuNvBOoyoAcZt87Lr9jqVwVVGtnAAlQEP2aU+FjIWCm1dQQVW4LcayMXEio6yrge
         8mVk0YXSlBp0HvDA7gtnAMvN/Hp/QJb5FfmTuqFwJC/4193JyP88hHiaO++6imylJ+26
         aVHg==
X-Gm-Message-State: ABy/qLZJqV2/veNxJm+crlM/oFPW94FC/W3ei9qifHXY+V0Mb7GtC+FF
	fAe2uvRwpaiSNmpv9EEwdZnBMwDdVsGCiUGsDZ9s7luUqUEEz/Dy/zeCo+YuwMmD9seZYA2sXgc
	+Vgxcl/eZS4fvYnszX6UvMpPSO9cTiRCKEA==
X-Received: by 2002:a1c:e908:0:b0:3fc:5bcc:a91a with SMTP id q8-20020a1ce908000000b003fc5bcca91amr1662985wmc.6.1690456691333;
        Thu, 27 Jul 2023 04:18:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH0ZToprIgSDfwJmmp3kGZee2OelfjDJ8Mj+brRBQssO3Ov83L9J2RbIhEq7LfPgIeu9SrYDQ==
X-Received: by 2002:a1c:e908:0:b0:3fc:5bcc:a91a with SMTP id q8-20020a1ce908000000b003fc5bcca91amr1662966wmc.6.1690456690984;
        Thu, 27 Jul 2023 04:18:10 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id l19-20020a1c7913000000b003fc07e17d4esm4384584wme.2.2023.07.27.04.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 04:18:10 -0700 (PDT)
Message-ID: <8735f065-cdf7-6383-d9e3-98a022e6f0e2@redhat.com>
Date: Thu, 27 Jul 2023 13:18:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 7/7] mm/memory_hotplug: Enable runtime update of
 memmap_on_memory parameter
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230727080232.667439-1-aneesh.kumar@linux.ibm.com>
 <20230727080232.667439-8-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230727080232.667439-8-aneesh.kumar@linux.ibm.com>
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

On 27.07.23 10:02, Aneesh Kumar K.V wrote:
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   mm/memory_hotplug.c | 35 +++++++++++++++++++----------------
>   1 file changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index aa8724bd1d53..7c877756b363 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -89,7 +89,12 @@ static int set_memmap_mode(const char *val, const struct kernel_param *kp)
>   		else
>   			mode = MEMMAP_ON_MEMORY_DISABLE;
>   	}
> +	/*
> +	 * Avoid changing memmap mode during hotplug.
> +	 */

Nit: comment fits into a single line.

-- 
Cheers,

David / dhildenb

