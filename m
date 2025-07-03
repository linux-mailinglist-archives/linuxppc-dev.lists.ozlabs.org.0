Return-Path: <linuxppc-dev+bounces-10076-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01559AF6BE1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jul 2025 09:45:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXpj50YR9z2yf3;
	Thu,  3 Jul 2025 17:45:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751528745;
	cv=none; b=oXN19HmCiQar+qpsyEJ16dwys8k1V4datDyweRgY4Pl8L/3K1INZD2LR+3VWTMqLBKxyPtsYoSM4Hzchia1gUfasSgntrk/Z6HFsrtBJWhRMidZO97oWXnuIw/7bztk9NenxLi+KLERfMxAfateiuZtpEbeWDmN6o2rqfBSCc7XMWcoPSRkSRUSgrOeZFL4ghfNpDiSkKO3Rkuhgw+EXDxPKRdQQwX0/rCF0Iu6XUTexMemo72smn+WUsoBOb12PFmn9yp0NsOScC46cZSh3kN30MRMzDSksDzC1cV6CJtCL3s8/HgpRtrTSnBHdtw6rHARkpSLPBg/4+Oa9gcDLmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751528745; c=relaxed/relaxed;
	bh=WPP1PRWhtmPHNfolpuSgWHE9hj7dLgaAzKr9Pb92+J8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hdsdKkhldJBSWr8j1B39jY/MUvxwehm1q1jmy9CDP3nz1W9b0F1mDGCN746l51DDWkqpY5i63Z2513xJcqyxR2sFLkn5LxnriEldA2wxuezrHeHNM/rUa7PITPz7EWWPGV0hYyGhPtBYAM6fVGNRvQNZmw3Cc0/o2TxqlI43ysuKybGAcmI8vJyyYqjliRyIGBTWdavKvwTZugfmDspaJ5c0XrMGQFhPH0RZShH/Xzsb345E56ASDKbMLC0HOhpzJJ5yrSE8OL/Iz3pYRXI+sL8jrK0EMK60STFQD6P4qn5yTQ1fvDv6eXpbOt9QIZBYzTLI6LY3OpBR1gixoKWj0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i2UbOmYc; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MLBxD0NZ; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i2UbOmYc;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MLBxD0NZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXpj26hsLz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 17:45:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751528737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WPP1PRWhtmPHNfolpuSgWHE9hj7dLgaAzKr9Pb92+J8=;
	b=i2UbOmYcmNRFmvQcIUwMYE19GRg6F6UongTn1QJHPFFIXicKFH0/Vue0ObvaaZzHd2A2fT
	5ZGRNWw81aIfoLOT/30f97uJiea6iS19a3/2BzDFZlZlhv7CVN7wiPd3gk+jMS64DHKGJY
	1/yLbF4x6BtRpLGfCeTq5QrGyz4sLEs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751528738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WPP1PRWhtmPHNfolpuSgWHE9hj7dLgaAzKr9Pb92+J8=;
	b=MLBxD0NZEiiLwYUB1KF07zL0cgZn38YzI18fRQs6NO/f1s43cov+8zXfbSUPU5jk1hIg8s
	rpbL4cfJsMl0NoFbOVHrlvQDWptow5xIDaB91wFYRgonz3QfMGFiHt6LHGZLrr6gtzSoEy
	z+0wMrjhf1LZQULUdgBrAJJH0jUH4fY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-tLYaw6jhPh2mT2bevJUfQg-1; Thu, 03 Jul 2025 03:45:34 -0400
X-MC-Unique: tLYaw6jhPh2mT2bevJUfQg-1
X-Mimecast-MFC-AGG-ID: tLYaw6jhPh2mT2bevJUfQg_1751528733
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ae0cd07eeb2so434949566b.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Jul 2025 00:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751528733; x=1752133533;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WPP1PRWhtmPHNfolpuSgWHE9hj7dLgaAzKr9Pb92+J8=;
        b=f8PhO7z3Fs/2Zh1WhBDoEfE5xL3yOdXgHcpUrNDtGXDJqzkNbVzw6T/8vBVPhmUS5o
         MjY5ct+hv0/r6hO8ubMggXVNEybHmddffppGK3TXBDvmbGTQtmBROdh+lN+MdJnlMNdr
         vG3wgIY/RN9S2dejRkNQG75PNzqu1VPylLhW9HFyxuKu24coArG+q45DdYSJsV7NBnIF
         4wIgduBdT5gPuWJlKpNa+NfORG216GuVA25xCGds6+ZZEsmmf66Axpx+i259DCEgHoL3
         3/T2LiEYm2v+O3CduLSgLr9FgOry1qrI6jcyC+UYSoaolfFyjAHCNe82UoHPczD158Ff
         O3fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr+9VmxaJ5HzGytFciZSTms+1B4hcq0i8xjy96aM1u1ZVytqQACsEqkD0QKGEcIbGIavolVoxrhLSfZLQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwlWdiokytlmlUHC6GOx8JyULC0M3tApYJCXZi/2UYEv/TjIpUJ
	O/PDhegA2CYZ/TUZipg2gG+B2MY9ieOweqQyebY8o1U1fnv/9dZ73CLh2puqSfWPKz2xjSZzmhf
	pNvqZxTw/jA/p+M5CfGXXRtXut7cGoPpp3mQ12e6WdC8yx7wawmFcrBGKuNAgbmFrpPA=
X-Gm-Gg: ASbGnct5DnD+5lfTeQGxcWQugFKrS6LPYCZT504z7yjP9jSjJnlKvKwmPfkev8JsXgG
	FaKT+FFZG8xzL7TkWWUaMonM3gQYId7PDzmmdSJBO4kglcQg5EMTqxyV/6QQ2SdivCJGuyWTpLr
	yf5tuMHlx/XDTfwC7NyWXEpFCW4uw9hV65rw8azsM4R3o7soRWJmSVDFFf30WDtLOLb8B1Mcjv1
	sP3+VvGv0eoWA9/MrVck5afgnYLetXAeqN8RQYb3mLeUBuyir+vXylZTa13qo+YALJj7TQ+1gET
	+2FwT/GQJueG3xQLwYFbl0NYTw0+nNeMwEwLYeH9WHRG
X-Received: by 2002:a17:907:3cd3:b0:ae3:6651:58ba with SMTP id a640c23a62f3a-ae3d84f7f66mr193263666b.35.1751528732716;
        Thu, 03 Jul 2025 00:45:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9dut9O3e981QeFm7ijgo302R9iI7Vl24WdUyqyOYprtZmMn909rbBKXFTDk2fblCy/fN7iA==
X-Received: by 2002:a17:907:3cd3:b0:ae3:6651:58ba with SMTP id a640c23a62f3a-ae3d84f7f66mr193254666b.35.1751528732009;
        Thu, 03 Jul 2025 00:45:32 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c015b8sm1214932266b.78.2025.07.03.00.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 00:45:31 -0700 (PDT)
Message-ID: <6a83e3e1-ab1d-409b-8395-df363321cade@redhat.com>
Date: Thu, 3 Jul 2025 09:45:29 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/29] mm/zsmalloc: stop using __ClearPageMovable()
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Minchan Kim <minchan@kernel.org>, Brendan Jackman <jackmanb@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
 Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>,
 Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
 <nao.horiguchi@gmail.com>, Oscar Salvador <osalvador@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>, Shakeel Butt <shakeel.butt@linux.dev>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-13-david@redhat.com>
 <zmsay3nrpmjec5n7v44svfa7iwl6vklqan4dgjn4wpvsr5hqt7@cqfwdvhncgrg>
 <757cf6b9-730b-4b12-9a3d-27699e20e3ac@redhat.com>
 <ugm7j66msq2w2hd3jg3thsxd2mv7vudozal3nblnfemclvut64@yp7d6vgesath>
 <11de6ae0-d4ec-43d5-a82e-146d82f17fff@redhat.com>
 <5thkl2h5qan5gm7putqd4o6yn5ht2c5zeei5qbjoni677xr7po@kbfokuekiubj>
 <vscedd6m3cq73c5ggjjz6ndordivgeh4dmvzeok222bnderr5c@dujm4ndthtxb>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <vscedd6m3cq73c5ggjjz6ndordivgeh4dmvzeok222bnderr5c@dujm4ndthtxb>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 148N5QxEhpLooSWyFMmHtdpZ1BOximeV-qxrN2lOsT0_1751528733
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 03.07.25 05:22, Sergey Senozhatsky wrote:
> On (25/07/03 11:28), Sergey Senozhatsky wrote:
>>>>>>>     static int zs_page_migrate(struct page *newpage, struct page *page,
>>>>>>> @@ -1736,6 +1736,13 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
>>>>>>>     	unsigned long old_obj, new_obj;
>>>>>>>     	unsigned int obj_idx;
>>>>>>> +	/*
>>>>>>> +	 * TODO: nothing prevents a zspage from getting destroyed while
>>>>>>> +	 * isolated: we should disallow that and defer it.
>>>>>>> +	 */
>>>>>>
>>>>>> Can you elaborate?
>>>>>
>>>>> We can only free a zspage in free_zspage() while the page is locked.
>>>>>
>>>>> After we isolated a zspage page for migration (under page lock!), we drop
>>>>                         ^^ a physical page? (IOW zspage chain page?)
>>>>
>>>>> the lock again, to retake the lock when trying to migrate it.
>>>>>
>>>>> That means, there is a window where a zspage can be freed although the page
>>>>> is isolated for migration.
>>>>
>>>> I see, thanks.  Looks somewhat fragile.  Is this a new thing?
>>>
>>> No, it's been like that forever. And I was surprised that only zsmalloc
>>> behaves that way
>>
>> Oh, that makes two of us.
> 
> I sort of wonder if zs_page_migrate() VM_BUG_ON_PAGE() removal and
> zspage check addition need to be landed outside of this series, as
> a zsmalloc fixup.

Not sure if there is real value for that; given the review status, I 
assume this series won't take too long to be ready for upstream. Of 
course, if that is not the case we could try pulling them out.

-- 
Cheers,

David / dhildenb


