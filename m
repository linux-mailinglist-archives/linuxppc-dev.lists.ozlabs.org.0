Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73880763CA3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 18:40:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OQR1mITt;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OQR1mITt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RB04z2mk1z3cRt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 02:40:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OQR1mITt;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OQR1mITt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RB0421R3dz2yGv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 02:39:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690389582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mBRwboZ65s2wEyxE4FPIAJKpqYqzXSa2YWMDeQT0bz4=;
	b=OQR1mITt3QLCqs1bKqzbpSfFoBcnv9qUfhrJ43+HwyvlCE76vHdrxkspyJm7Iw/3atvJzb
	c4CRGJXvSWoYR9lURG/xThcgYEjxQ2TfST0/+FcPGb4nailAwq1C2YMENwYiOJFExfZn6B
	3xD6n2YKinZYWJ4HJMEPXK+cxVuAkKc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690389582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mBRwboZ65s2wEyxE4FPIAJKpqYqzXSa2YWMDeQT0bz4=;
	b=OQR1mITt3QLCqs1bKqzbpSfFoBcnv9qUfhrJ43+HwyvlCE76vHdrxkspyJm7Iw/3atvJzb
	c4CRGJXvSWoYR9lURG/xThcgYEjxQ2TfST0/+FcPGb4nailAwq1C2YMENwYiOJFExfZn6B
	3xD6n2YKinZYWJ4HJMEPXK+cxVuAkKc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-z8lewEvdNGyiyOrlZBIrHw-1; Wed, 26 Jul 2023 12:39:40 -0400
X-MC-Unique: z8lewEvdNGyiyOrlZBIrHw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-314394a798dso636546f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 09:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690389578; x=1690994378;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBRwboZ65s2wEyxE4FPIAJKpqYqzXSa2YWMDeQT0bz4=;
        b=gaPaDMxjEP5X0e7Rb6/G2gwU9ST6OFx7huVlRpiVFRRe8PLyqltnMolr9Pj0Kr8f4V
         4N6z9BsdnSjoHjCoiDvSnW+Zq4eHRwbtFAb6uDdqyh64YUzRbfFWDzqPuSPjnv3+pXSs
         3++i7eGouZfRwlBP6EBjdblL8WsegIiW+dj7rgioG0yC8IH78mcU8qWo88wE1+zZsltq
         PkGC8tpBhG4FUa/XIxaBlXczGQ97ofL04YJMQ57vG1WKBARbmgEClWEeiMicNhsCYLqz
         ynnMrsNls2hYAyH+f7RE5EPUY78Dw0MDdbnVORQV7Lr/ggAe87p5iBTUpfUKLVA6fVQK
         UomQ==
X-Gm-Message-State: ABy/qLaYIdEKnvjWpshR2qk6TwN25ismivP1x7sWIRVxyQzDBIruyX1H
	zWWbGdFxZSebWszHtfSm3gYmpMJJ3IseReKxezzPVzJd3os0PXuiHPQr24YP/7LcK1dKsyInVsy
	QdYaTvJtPC8+N98ko9AKNgWmhFQ==
X-Received: by 2002:adf:dcd0:0:b0:314:98f:2495 with SMTP id x16-20020adfdcd0000000b00314098f2495mr31561wrm.12.1690389578675;
        Wed, 26 Jul 2023 09:39:38 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFPADryZnRWsCJW+Me4oefqTHt3zQ2NSSl2lc70Hw6KN5yXHJYzRYB1UeLeLRegTJnEIqxq/Q==
X-Received: by 2002:adf:dcd0:0:b0:314:98f:2495 with SMTP id x16-20020adfdcd0000000b00314098f2495mr31543wrm.12.1690389578273;
        Wed, 26 Jul 2023 09:39:38 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:f600:a519:c50:799b:f1e3? (p200300cbc705f600a5190c50799bf1e3.dip0.t-ipconnect.de. [2003:cb:c705:f600:a519:c50:799b:f1e3])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d6411000000b003140f47224csm2309648wru.15.2023.07.26.09.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 09:39:37 -0700 (PDT)
Message-ID: <e435e31d-a22c-1723-d48e-1385d69794eb@redhat.com>
Date: Wed, 26 Jul 2023 18:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 4/7] mm/hotplug: Support memmap_on_memory when memmap
 is not aligned to pageblocks
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
 <20230725100212.531277-5-aneesh.kumar@linux.ibm.com>
 <e1a4430e-d3ae-711b-7efa-5085934b62fd@redhat.com>
 <875y67xpsi.fsf@linux.ibm.com>
 <aeab0767-457a-a2d1-8b23-4dde5acf48f4@redhat.com>
 <9d1448d3-a43a-5305-68aa-d82111fe077a@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <9d1448d3-a43a-5305-68aa-d82111fe077a@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 26.07.23 11:57, Aneesh Kumar K V wrote:
> On 7/26/23 2:34 PM, David Hildenbrand wrote:
>>
>>>>>     /*
>>>>> @@ -1310,7 +1400,10 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>>>>>     {
>>>>>         struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
>>>>>         enum memblock_flags memblock_flags = MEMBLOCK_NONE;
>>>>> -    struct vmem_altmap mhp_altmap = {};
>>>>> +    struct vmem_altmap mhp_altmap = {
>>>>> +        .base_pfn =  PHYS_PFN(res->start),
>>>>> +        .end_pfn  =  PHYS_PFN(res->end),
>>>>
>>>> Is it required to set .end_pfn, and if so, shouldn't we also set it to
>>>> base_pfn + memory_block_memmap_on_memory_pages()) ?
>>>>
>>>
>>> We use that in ppc64 for checking altmap boundary condition. As we
>>> discussed earlier, ppc64 due to vmemmap mapping size restrictions can't
>>> always allocate vmemmap pages from altmap area even if requested. We
>>> fallback to regular memory alocation in that case (only used now with
>>> pmem). We use altmap.end_pfn for that boundary check. You can refer to
>>> altmap_cross_boundary() for more details.
>>
>> But even then, setting the end to the end of the resource size is wrong, no? We don't want anybody to allocate beyond base_pfn + memory_block_memmap_on_memory_pages().
>>
> 
> altmap.end is the end pfn of the resource

Oh, thanks for pointing that out. I wonder why the altmap even has to 
care about that ...

-- 
Cheers,

David / dhildenb

