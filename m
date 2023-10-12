Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 502587C69B2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 11:32:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pq6dNMkA;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pq6dNMkA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5ktq1Cchz3cmK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 20:32:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pq6dNMkA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pq6dNMkA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5ksv6qtpz3bP4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 20:31:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697103085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSLDOzif9pe7NWfs6FAqs0gKz2RiKRhAj6wFDsEM4p4=;
	b=Pq6dNMkAOiuCb/k/pwm8uPMScd9ep9s9Z79PS5TkJNUM1TRCL1abY7/7msV19k3Ct43a7E
	lQVUpgjE9q9RN0upmvdP7SwqNVMqj3MuirsVmeBag8WvSfoLVO9oJ2P0CiiwOCEvHnOPeQ
	dke9gmKT1oPO1SPY0y72nja9pKGVsto=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697103085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSLDOzif9pe7NWfs6FAqs0gKz2RiKRhAj6wFDsEM4p4=;
	b=Pq6dNMkAOiuCb/k/pwm8uPMScd9ep9s9Z79PS5TkJNUM1TRCL1abY7/7msV19k3Ct43a7E
	lQVUpgjE9q9RN0upmvdP7SwqNVMqj3MuirsVmeBag8WvSfoLVO9oJ2P0CiiwOCEvHnOPeQ
	dke9gmKT1oPO1SPY0y72nja9pKGVsto=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-ca9lKu7VO9Kz0drKHGOv0Q-1; Thu, 12 Oct 2023 05:31:24 -0400
X-MC-Unique: ca9lKu7VO9Kz0drKHGOv0Q-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-32d903d35c2so297228f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 02:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697103081; x=1697707881;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSLDOzif9pe7NWfs6FAqs0gKz2RiKRhAj6wFDsEM4p4=;
        b=JE5lOBq7Ul+oIQqwPVK7+zCT+MB9AhY9+zONzqTf1TA5u1qX9DCrZ9n7cOOjsGS0bL
         BqpJi6tYO6Szy6wiha+HvYqnlgMjST9gkxLwBBNkKdLuo73GPF7b8JFOc8EeFaaIm/22
         iWFEMJHv3+gYzWyOihC1ip6i7l8zEwR74oq3KWwbjIPGBRXHZZv9dVay+7Tv+KBofIdG
         ZZtJZC7FGDuae9g2aMLCPf2X6ZQXkamkIhf0xSWm8Rd/BQXlAnivaDXxjZ/uOO3COXFa
         JsWOpB6IZpiYjdLocwjOa1oFcI5MdYsIaF6oWUhhkuydJTKdfTkvEmbt1+Cz0wPms3GP
         Q00w==
X-Gm-Message-State: AOJu0Yw7VC2YgXTm0sFYbi+1n3RnVzpF+H+YdQ204i/IJ/9CCGxOk21F
	IMadDQpmM8VHJVNiPuUasl+ROMoOirlopsO+JwHPkaJnf3/QvBuwSS4VrncKA2Zztyr0yYewRvr
	iYpLpPM/Iib5uDTXZkhLqL7gA2w==
X-Received: by 2002:a5d:5487:0:b0:319:6997:942e with SMTP id h7-20020a5d5487000000b003196997942emr21160883wrv.8.1697103081683;
        Thu, 12 Oct 2023 02:31:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPzeS7uCwL+pDb1dGgHVTR29EBJnszm/PSyz58/uQ1Bkw1Kxbz5kvLADKGVnfjZ5RZryevww==
X-Received: by 2002:a5d:5487:0:b0:319:6997:942e with SMTP id h7-20020a5d5487000000b003196997942emr21160852wrv.8.1697103081266;
        Thu, 12 Oct 2023 02:31:21 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70d:ee00:b271:fb6c:a931:4769? (p200300cbc70dee00b271fb6ca9314769.dip0.t-ipconnect.de. [2003:cb:c70d:ee00:b271:fb6c:a931:4769])
        by smtp.gmail.com with ESMTPSA id 20-20020a05600c22d400b004054dcbf92asm981775wmg.20.2023.10.12.02.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 02:31:20 -0700 (PDT)
Message-ID: <0feef130-59dd-0a31-ed06-e3849a52c75e@redhat.com>
Date: Thu, 12 Oct 2023 11:31:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 4/9] mm: thp: Introduce anon_orders and
 anon_always_mask sysfs files
To: Andrew Morton <akpm@linux-foundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20230929114421.3761121-1-ryan.roberts@arm.com>
 <20230929114421.3761121-5-ryan.roberts@arm.com>
 <20230929155530.a51e68e03e47a06b6b84c689@linux-foundation.org>
 <87fs2mrqld.fsf@mail.lhotse>
 <20231009172029.e558c08dd90d9b94fec3a036@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20231009172029.e558c08dd90d9b94fec3a036@linux-foundation.org>
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
Cc: linux-arm-kernel@lists.infradead.org, David Rientjes <rientjes@google.com>, Ryan Roberts <ryan.roberts@arm.com>, Yu Zhao <yuzhao@google.com>, John Hubbard <jhubbard@nvidia.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, "Huang, Ying" <ying.huang@intel.com>, Hugh Dickins <hughd@google.com>, Yin Fengwei <fengwei.yin@intel.com>, Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Luis Chamberlain <mcgrof@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Itaru Kitayama <itaru.kitayama@gmail.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10.10.23 02:20, Andrew Morton wrote:
> On Sun, 08 Oct 2023 09:54:22 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:
> 
>>> I don't know why powerpc's PTE_INDEX_SIZE is variable.
>>
>> To allow a single vmlinux to boot using either the Hashed Page Table
>> MMU, or Radix Tree MMU, which have different page table geometry.
>>
>> That's a pretty crucial feature for distros, so that they can build a
>> single kernel to boot on Power8/9/10.
> 
> Dumb question: why can't distros ship two kernels and have the boot
> loader (or something else) pick the appropriate one?

One answer I keep hearing over and over again is "test matrix 
explosion". So distros only do it when unavoidable: for example, when 
differing PAGE_SIZE is required (e.g., 4k vs 64k) or we're dealing with 
RT support (RT vs !RT).

-- 
Cheers,

David / dhildenb

