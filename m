Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5D97630F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 11:05:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RVD1uH5a;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RVD1uH5a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9nzv6w7zz3cGn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 19:05:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RVD1uH5a;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RVD1uH5a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9nyy4J62z2yVs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 19:04:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690362276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kQM+PipHAXSY7x2vlq6C7GWwn6O4D5U4rBQcpyXO4L8=;
	b=RVD1uH5aOXGjr0c0ss6wOk/x2JzeNyIiILnlc59iWSFpSGF8C1kepB8V/fI2SI3T+uGAh3
	gth6OiiwFu6AyV44RE0NPO28WIwogTSPOkyi9pt0sVPvyaCwN/ytq414j+o119+V70sOg6
	k/O+DTvu8x+EjvvQZZ64UwuQa2Lzk8M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690362276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kQM+PipHAXSY7x2vlq6C7GWwn6O4D5U4rBQcpyXO4L8=;
	b=RVD1uH5aOXGjr0c0ss6wOk/x2JzeNyIiILnlc59iWSFpSGF8C1kepB8V/fI2SI3T+uGAh3
	gth6OiiwFu6AyV44RE0NPO28WIwogTSPOkyi9pt0sVPvyaCwN/ytq414j+o119+V70sOg6
	k/O+DTvu8x+EjvvQZZ64UwuQa2Lzk8M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-zvw0dOrfM0WGAqE_IXMUXg-1; Wed, 26 Jul 2023 05:04:32 -0400
X-MC-Unique: zvw0dOrfM0WGAqE_IXMUXg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3faabd8fd33so31683145e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 02:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690362271; x=1690967071;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQM+PipHAXSY7x2vlq6C7GWwn6O4D5U4rBQcpyXO4L8=;
        b=ORws9PDyzikwhRrMajj/84T7gEgJJZYgMly1h05obk0oyE3WWc8VF4QgZn72nroIBM
         ClSDejZAtaDGVGde7P2MreWRaI3J6/p2WLz7HopsM10OayTO2gRhyYtgMi4/6friGdUi
         BjoWnvq9lM27QGhgO7JOg7TmPLjrNIfyuuvt1tNmT3iG9C4itB9jiBRbG9K4qiZ+n41b
         OmPjM23gYfuEYvNd/rOlOIuAjzXE6/2Z/1HqDFYxXFdn1mIH+94LgrlxiuzZk8TzAbmr
         2OLJtMjhvs+l9OMeZqIpLaKN3Jt/CTAzP0F+26C20qZ4B/zMFXk1PucsidbRhuG3h6M0
         iJuQ==
X-Gm-Message-State: ABy/qLb1Jgx9a66YEWP9oH/XK76SYzAYoEW8jEbrA+Kr52+SG715F9zA
	5B0rDOUnsviw7mr42YdEW4AmFHCqdgfGhlvdIetdJd1SqLtPDVZu4pJ/jhvh3Hcr8oZW9lYUlwh
	+v93IBZYHUuVyJ1Xd2DAFMiZA6A==
X-Received: by 2002:a05:600c:11d2:b0:3f9:b19c:aab4 with SMTP id b18-20020a05600c11d200b003f9b19caab4mr893095wmi.6.1690362271303;
        Wed, 26 Jul 2023 02:04:31 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE0lzo2lrby4qhNhn+e2opJ7XFXzbxGfEajZ3lSim6VbbTZL0Zxf/A3kuImL0dfRNig2Uim0w==
X-Received: by 2002:a05:600c:11d2:b0:3f9:b19c:aab4 with SMTP id b18-20020a05600c11d200b003f9b19caab4mr893080wmi.6.1690362270894;
        Wed, 26 Jul 2023 02:04:30 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:f600:a519:c50:799b:f1e3? (p200300cbc705f600a5190c50799bf1e3.dip0.t-ipconnect.de. [2003:cb:c705:f600:a519:c50:799b:f1e3])
        by smtp.gmail.com with ESMTPSA id h14-20020a05600c260e00b003fbca942499sm1434784wma.14.2023.07.26.02.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 02:04:30 -0700 (PDT)
Message-ID: <aeab0767-457a-a2d1-8b23-4dde5acf48f4@redhat.com>
Date: Wed, 26 Jul 2023 11:04:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
 <20230725100212.531277-5-aneesh.kumar@linux.ibm.com>
 <e1a4430e-d3ae-711b-7efa-5085934b62fd@redhat.com>
 <875y67xpsi.fsf@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v5 4/7] mm/hotplug: Support memmap_on_memory when memmap
 is not aligned to pageblocks
In-Reply-To: <875y67xpsi.fsf@linux.ibm.com>
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


>>>    /*
>>> @@ -1310,7 +1400,10 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>>>    {
>>>    	struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
>>>    	enum memblock_flags memblock_flags = MEMBLOCK_NONE;
>>> -	struct vmem_altmap mhp_altmap = {};
>>> +	struct vmem_altmap mhp_altmap = {
>>> +		.base_pfn =  PHYS_PFN(res->start),
>>> +		.end_pfn  =  PHYS_PFN(res->end),
>>
>> Is it required to set .end_pfn, and if so, shouldn't we also set it to
>> base_pfn + memory_block_memmap_on_memory_pages()) ?
>>
> 
> We use that in ppc64 for checking altmap boundary condition. As we
> discussed earlier, ppc64 due to vmemmap mapping size restrictions can't
> always allocate vmemmap pages from altmap area even if requested. We
> fallback to regular memory alocation in that case (only used now with
> pmem). We use altmap.end_pfn for that boundary check. You can refer to
> altmap_cross_boundary() for more details.

But even then, setting the end to the end of the resource size is wrong, 
no? We don't want anybody to allocate beyond base_pfn + 
memory_block_memmap_on_memory_pages().


Apart from that, LGTM.

-- 
Cheers,

David / dhildenb

