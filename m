Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B45935BD30
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 10:49:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJj8m0jxlz3byp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 18:49:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NcYL4Bla;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NcYL4Bla;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=NcYL4Bla; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=NcYL4Bla; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJj8J6LZqz302V
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 18:49:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618217342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ZVzewdg79RzKFsnnpj3toO21U2g5cN2oMm8eONJYHY=;
 b=NcYL4BlaFw5wYmD5UqdudAcvYDu0q4jqG6xPP5UiHQaQYr0SYN76NIrGgTBCxF1AXc6sbE
 g5JXcq6EweER7lga2WtMOQOqycjW7BS+k0GOR4xu+sn/WF36SVcNGv8lWlXZ3XM51YrI99
 w1Bt/sTU8j/5Hf/8ODwtuGsU451YEMA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618217342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ZVzewdg79RzKFsnnpj3toO21U2g5cN2oMm8eONJYHY=;
 b=NcYL4BlaFw5wYmD5UqdudAcvYDu0q4jqG6xPP5UiHQaQYr0SYN76NIrGgTBCxF1AXc6sbE
 g5JXcq6EweER7lga2WtMOQOqycjW7BS+k0GOR4xu+sn/WF36SVcNGv8lWlXZ3XM51YrI99
 w1Bt/sTU8j/5Hf/8ODwtuGsU451YEMA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-m-EAs4_iNZuUivnrtaA5Iw-1; Mon, 12 Apr 2021 04:47:28 -0400
X-MC-Unique: m-EAs4_iNZuUivnrtaA5Iw-1
Received: by mail-wm1-f69.google.com with SMTP id
 a5-20020a1c66050000b02901258107720dso2210125wmc.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 01:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+ZVzewdg79RzKFsnnpj3toO21U2g5cN2oMm8eONJYHY=;
 b=Amf6n5grs8KoPLhtmaeaqp79CFEIgWPgX0snU7WcSsT7yArlo/6+e1P9gcPxDC3Iy9
 OyLNm/1S0UrjcBz5re6J4WDtcWBr/AAqFa0KAaCLQPnVgBGzpZ9G7raSCWxu71RK8wCo
 jW6rHaKfMT7HmzgmyVyCScWtJz1P0nVNVZQvKKOT6tTFYokCD1FWmd95cGvSjtw+W3v1
 WvGHPpFbcNN908sNbjBq6fEgpjKzcOpTlNvOWHXxteVj0xacNtyeTNPKLiVrNqwjaF/D
 cA0a89MX5tL+YdBpNa9nd7zzOb03z5dmVJ0EwI4if7CZtmeftuqvxWFS9r95l+1fyvxH
 y9Cw==
X-Gm-Message-State: AOAM532y7ngOcsTKZDzvz1aia5IyDZb7/fIo2UBStiRx9V7tbJQMrEQK
 xK1fqDxyc5R5A4wtrgFvNR7tmj71a6MAsWtIA74rqmAlkTquZUw/hIJvb4wgHU2/f6bprnFOTIn
 cVPGGFWgeTfMV5gJ6dhY0aAAsiw==
X-Received: by 2002:a05:600c:4482:: with SMTP id
 e2mr619421wmo.121.1618217247181; 
 Mon, 12 Apr 2021 01:47:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxx4EM0F3QJf++u7/wgOu5mPjOoaJFUsv/zcyrlmWMxAjz9nri7Al51/O7Rz2gFFz2XuY2fYQ==
X-Received: by 2002:a05:600c:4482:: with SMTP id
 e2mr619402wmo.121.1618217246983; 
 Mon, 12 Apr 2021 01:47:26 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c66cb.dip0.t-ipconnect.de. [91.12.102.203])
 by smtp.gmail.com with ESMTPSA id g5sm15937930wrq.30.2021.04.12.01.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 01:47:26 -0700 (PDT)
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <1618199302-29335-1-git-send-email-anshuman.khandual@arm.com>
 <09284b9a-cfe1-fc49-e1f6-3cf0c1b74c76@arm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH V2] mm/page_alloc: Ensure that HUGETLB_PAGE_ORDER is less
 than MAX_ORDER
Message-ID: <162877dd-e6ba-d465-d301-2956bb034429@redhat.com>
Date: Mon, 12 Apr 2021 10:47:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <09284b9a-cfe1-fc49-e1f6-3cf0c1b74c76@arm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linuxppc-dev @ lists . ozlabs . org" <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@kernel.org>,
 Mel Gorman <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12.04.21 10:06, Anshuman Khandual wrote:
> + linuxppc-dev@lists.ozlabs.org
> + linux-ia64@vger.kernel.org
> 
> On 4/12/21 9:18 AM, Anshuman Khandual wrote:
>> pageblock_order must always be less than MAX_ORDER, otherwise it might lead
>> to an warning during boot. A similar problem got fixed on arm64 platform
>> with the commit 79cc2ed5a716 ("arm64/mm: Drop THP conditionality from
>> FORCE_MAX_ZONEORDER"). Assert the above condition before HUGETLB_PAGE_ORDER
>> gets assigned as pageblock_order. This will help detect the problem earlier
>> on platforms where HUGETLB_PAGE_SIZE_VARIABLE is enabled.
>>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: linux-mm@kvack.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> Changes in V2:
>>
>> - Changed WARN_ON() to BUILD_BUG_ON() per David
>>
>> Changes in V1:
>>
>> https://patchwork.kernel.org/project/linux-mm/patch/1617947717-2424-1-git-send-email-anshuman.khandual@arm.com/
>>
>>   mm/page_alloc.c | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index cfc72873961d..19283bff4bec 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -6875,10 +6875,17 @@ void __init set_pageblock_order(void)
>>   	if (pageblock_order)
>>   		return;
>>   
>> -	if (HPAGE_SHIFT > PAGE_SHIFT)
>> +	if (HPAGE_SHIFT > PAGE_SHIFT) {
>> +		/*
>> +		 * pageblock_order must always be less than
>> +		 * MAX_ORDER. So does HUGETLB_PAGE_ORDER if
>> +		 * that is being assigned here.
>> +		 */
>> +		BUILD_BUG_ON(HUGETLB_PAGE_ORDER >= MAX_ORDER);
> 
> Unfortunately the build test fails on both the platforms (powerpc and ia64)
> which subscribe HUGETLB_PAGE_SIZE_VARIABLE and where this check would make
> sense. I some how overlooked the cross compile build failure that actually
> detected this problem.
> 
> But wondering why this assert is not holding true ? and how these platforms
> do not see the warning during boot (or do they ?) at mm/vmscan.c:1092 like
> arm64 did.
> 
> static int __fragmentation_index(unsigned int order, struct contig_page_info *info)
> {
>          unsigned long requested = 1UL << order;
> 
>          if (WARN_ON_ONCE(order >= MAX_ORDER))
>                  return 0;
> ....
> 
> Can pageblock_order really exceed MAX_ORDER - 1 ?

Ehm, for now I was under the impression that such configurations 
wouldn't exist.

And originally, HUGETLB_PAGE_SIZE_VARIABLE was introduced to handle 
hugepage sizes that all *smaller* than MAX_ORDER - 1: See d9c234005227 
("Do not depend on MAX_ORDER when grouping pages by mobility")


However, looking into init_cma_reserved_pageblock():

	if (pageblock_order >= MAX_ORDER) {
		i = pageblock_nr_pages;
		...
	}


But it's kind of weird, isn't it? Let's assume we have MAX_ORDER - 1 
correspond to 4 MiB and pageblock_order correspond to 8 MiB.

Sure, we'd be grouping pages in 8 MiB chunks, however, we cannot even 
allocate 8 MiB chunks via the buddy. So only alloc_contig_range() could 
really grab them (IOW: gigantic pages).

Further, we have code like deferred_free_range(), where we end up 
calling __free_pages_core()->...->__free_one_page() with 
pageblock_order. Wouldn't we end up setting the buddy order to something 
 > MAX_ORDER -1 on that path?

Having pageblock_order > MAX_ORDER feels wrong and looks shaky.

-- 
Thanks,

David / dhildenb

