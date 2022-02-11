Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1E14B22BD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 11:06:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jw8QZ6dBDz3cQN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 21:06:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Awrcqa+7;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Awrcqa+7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Awrcqa+7; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Awrcqa+7; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jw8Pn5FxYz3bW9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 21:05:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644573927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iDBJz+J7At0lHvNivPpkfEo3xX4xigHr8rowGNN+x/8=;
 b=Awrcqa+7tucxy+LbpDK8wYKTyXfmBrDsTxfo/teiPK6fxQpUYHNuzaKTW6xVza7+XOREeO
 UueGO9zhFizajz4gf7YWgIbwDcr5AodnwD1Omj7H+uXIr/t7yLRcuPzxXluJYx8Va3Izfq
 3E57ZSLp1j2acYsNUGKyWGKr7oSJiiw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644573927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iDBJz+J7At0lHvNivPpkfEo3xX4xigHr8rowGNN+x/8=;
 b=Awrcqa+7tucxy+LbpDK8wYKTyXfmBrDsTxfo/teiPK6fxQpUYHNuzaKTW6xVza7+XOREeO
 UueGO9zhFizajz4gf7YWgIbwDcr5AodnwD1Omj7H+uXIr/t7yLRcuPzxXluJYx8Va3Izfq
 3E57ZSLp1j2acYsNUGKyWGKr7oSJiiw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-dKSzjuU4PQqmJBH3ZggTBg-1; Fri, 11 Feb 2022 05:05:19 -0500
X-MC-Unique: dKSzjuU4PQqmJBH3ZggTBg-1
Received: by mail-wm1-f71.google.com with SMTP id
 i204-20020a1c3bd5000000b0037bb9f6feeeso164129wma.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 02:05:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iDBJz+J7At0lHvNivPpkfEo3xX4xigHr8rowGNN+x/8=;
 b=L+bWwNkd2TC010GVBehRv2bj8vD5MEsNNfX8W3n+CBHUrd23BTdZFgzkNTVaVaPeC2
 GUkQdUcm3meLEMJy5+F31v5hht1ytlQAsKkPfItT6bcHXSh/o4AlKkj81+SWtO51Fgm4
 7RXIRczQp1YkBVXiMSDqn/8CZaKQNLRfsXhArWO8N/ZgyI815l6OzxU1xDMrUvG6Xklw
 owfYd6T+6qjateYrmZUIDBsn6nVQPVbSqcP1eSxuX1yG43Q+poPK2X5ptY7VshrEg1ta
 2044SX88sOvehGKcvU4YoO4pZk7j+rARA9XUh7ynrBoAgFx+ZwFD2h6ULM1WQd4cUF9h
 iciw==
X-Gm-Message-State: AOAM533TnuqCn/DFjCCZzMdczZeR4uZsUv45clPAii6BKSMKAQ5XOBRV
 qYlDkjm5QwhfBLZ2RjxoMWa/+8RvXijTJK0IVsbwZLKXZzQoHbiRrNjXBec48O/LpnZ3Um1yY9U
 pVbDwJ0IGQLsu00hVUvAzvK1BaA==
X-Received: by 2002:a7b:ce90:: with SMTP id q16mr807641wmj.91.1644573911276;
 Fri, 11 Feb 2022 02:05:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvvH30T/fd9dexmufkRE14FGkVltTX6czel7n80ccomwXSyWDJdKl0cDY0hVJgHSvsXxds1w==
X-Received: by 2002:a7b:ce90:: with SMTP id q16mr807614wmj.91.1644573910935;
 Fri, 11 Feb 2022 02:05:10 -0800 (PST)
Received: from ?IPV6:2003:cb:c70c:aa00:4cc6:d24a:90ae:8c1f?
 (p200300cbc70caa004cc6d24a90ae8c1f.dip0.t-ipconnect.de.
 [2003:cb:c70c:aa00:4cc6:d24a:90ae:8c1f])
 by smtp.gmail.com with ESMTPSA id w8sm21132702wre.83.2022.02.11.02.05.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 02:05:10 -0800 (PST)
Message-ID: <b77816ef-80fd-40b7-cf6e-6de2a3125eb1@redhat.com>
Date: Fri, 11 Feb 2022 11:05:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] powerpc/mm: Update default hugetlb size early
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20220211065215.101767-1-aneesh.kumar@linux.ibm.com>
 <831ee5f6-8605-02d2-b7e5-543aec4857c3@redhat.com>
 <05d6615a-50c7-1b23-1bab-0e0b64dd4e81@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <05d6615a-50c7-1b23-1bab-0e0b64dd4e81@linux.ibm.com>
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
Cc: linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11.02.22 10:16, Aneesh Kumar K V wrote:
> On 2/11/22 14:00, David Hildenbrand wrote:
>> On 11.02.22 07:52, Aneesh Kumar K.V wrote:
>>> commit: d9c234005227 ("Do not depend on MAX_ORDER when grouping pages by mobility")
>>> introduced pageblock_order which will be used to group pages better.
>>> The kernel now groups pages based on the value of HPAGE_SHIFT. Hence HPAGE_SHIFT
>>> should be set before we call set_pageblock_order.
>>>
>>> set_pageblock_order happens early in the boot and default hugetlb page size
>>> should be initialized before that to compute the right pageblock_order value.
>>>
>>> Currently, default hugetlbe page size is set via arch_initcalls which happens
>>> late in the boot as shown via the below callstack:
>>>
>>> [c000000007383b10] [c000000001289328] hugetlbpage_init+0x2b8/0x2f8
>>> [c000000007383bc0] [c0000000012749e4] do_one_initcall+0x14c/0x320
>>> [c000000007383c90] [c00000000127505c] kernel_init_freeable+0x410/0x4e8
>>> [c000000007383da0] [c000000000012664] kernel_init+0x30/0x15c
>>> [c000000007383e10] [c00000000000cf14] ret_from_kernel_thread+0x5c/0x64
>>>
>>> and the pageblock_order initialization is done early during the boot.
>>>
>>> [c0000000018bfc80] [c0000000012ae120] set_pageblock_order+0x50/0x64
>>> [c0000000018bfca0] [c0000000012b3d94] sparse_init+0x188/0x268
>>> [c0000000018bfd60] [c000000001288bfc] initmem_init+0x28c/0x328
>>> [c0000000018bfe50] [c00000000127b370] setup_arch+0x410/0x480
>>> [c0000000018bfed0] [c00000000127401c] start_kernel+0xb8/0x934
>>> [c0000000018bff90] [c00000000000d984] start_here_common+0x1c/0x98
>>>
>>> delaying default hugetlb page size initialization implies the kernel will
>>> initialize pageblock_order to (MAX_ORDER - 1) which is not an optimal
>>> value for mobility grouping. IIUC we always had this issue. But it was not
>>> a problem for hash translation mode because (MAX_ORDER - 1) is the same as
>>> HUGETLB_PAGE_ORDER (8) in the case of hash (16MB). With radix,
>>> HUGETLB_PAGE_ORDER will be 5 (2M size) and hence pageblock_order should be
>>> 5 instead of 8.
>>
>>
>> A related question: Can we on ppc still have pageblock_order > MAX_ORDER
>> - 1? We have some code for that and I am not so sure if we really need that.
>>
> 
> I also have been wondering about the same. On book3s64 I don't think we 
> need that support for both 64K and 4K page size because with hash 
> hugetlb size is MAX_ORDER -1. (16MB hugepage size)
> 
> I am not sure about the 256K page support. Christophe may be able to 
> answer that.
> 
> For the gigantic hugepage support we depend on cma based allocation or
> firmware reservation. So I am not sure why we ever considered pageblock 
>  > MAX_ORDER -1 scenario. If you have pointers w.r.t why that was ever 
> needed, I could double-check whether ppc64 is still dependent on that.

commit dc78327c0ea7da5186d8cbc1647bd6088c5c9fa5
Author: Michal Nazarewicz <mina86@mina86.com>
Date:   Wed Jul 2 15:22:35 2014 -0700

    mm: page_alloc: fix CMA area initialisation when pageblock > MAX_ORDER

indicates that at least arm64 used to have cases for that as well.

However, nowadays with ARM64_64K_PAGES we have FORCE_MAX_ZONEORDER=14 as
default, corresponding to 512MiB.

So I'm not sure if this is something worth supporting. If you want
somewhat reliable gigantic pages, use CMA or preallocate them during boot.

-- 
Thanks,

David / dhildenb

