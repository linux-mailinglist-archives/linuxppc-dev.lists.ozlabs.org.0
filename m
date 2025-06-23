Return-Path: <linuxppc-dev+bounces-9662-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8FBAE48FF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jun 2025 17:43:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQsnP4mM9z30Vn;
	Tue, 24 Jun 2025 01:43:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750693433;
	cv=none; b=HlBAcMAb4aSSgqa2OkCAmii9/mubACJKlbOE/Gy9ARp5oNET0IaLw6pFwkTE9XSNqO65ri4ubowX/l2jffjCG50UEd+OaNtl0qyIa6rJ30OLIPsd3BaIxLdX5vddMaqHS4wnffdcK1IPAE8aIx6cW1KfNq4mU3SQkp9jm0EeC7uDW/TJQjJn7S1aZkdAGJr/eLDOT1nUDzWPeZtFkYRxuuUYPVlFkjwthPAgrm8/wbX0tqpqipRkSh0RK+GQWahu7jlQNfa7WgEAkiZbUI7K/PVsCTDK2Eo3PNOyq8r+dr+eE1dRHEgNUT/o2LdwDAIskEx+aC+SHnTNjYLxR7uF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750693433; c=relaxed/relaxed;
	bh=23Yqz6D5y7M7u78E7VkUTuP0Y7WfwouQlTdg1wTNEMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LNURUx0ZUO4ut/m7+c4gtqlxD44bP9PHXep14sfeaFHCNUCUvM5JYbFGJzjFcIqfSkVy/WD1ac2IAmUGLNl3xRrdn8R5WTetCyk4nOf18iuJVp49wEf/e/xD1wxG7bS07GzZHDIPQhEustGHCa/rEbf6AiLo9B/mahfBpNiZaL4KMxCGX0p2sGvRN9qVVs0IXIwaP/EDMsWuiJeog+qpGCOUKZdDtnLCvdjD91FsKkNOsE9k1H3bq+vocBeI15YxE3JQ1n+JhSd5xxu7OZdbV58hk+z/sPQBrfUeHef6w77A+ZyAoH3qCxi+ERAgVSotxqT24LiN2G1D3Dw818tx/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gdGCcNLp; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gdGCcNLp; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gdGCcNLp;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gdGCcNLp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQsnN5X7Gz30Vb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 01:43:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750693429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=23Yqz6D5y7M7u78E7VkUTuP0Y7WfwouQlTdg1wTNEMo=;
	b=gdGCcNLpoZruM8rsdU/FoLiN0IM1rMJSbVF5XggMEhK6Z/rXgPfUp9Nfsqn7Igfjde6KZb
	twWI71nuxHfkwO+c/kJw5jxdBoz5tRI2zbtUgv/X5bYKw2mGB7SdW1vOyYCDbLeojAKHdm
	5nsOMtqAXzHJoKPYznC2v5qn1XhjNYY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750693429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=23Yqz6D5y7M7u78E7VkUTuP0Y7WfwouQlTdg1wTNEMo=;
	b=gdGCcNLpoZruM8rsdU/FoLiN0IM1rMJSbVF5XggMEhK6Z/rXgPfUp9Nfsqn7Igfjde6KZb
	twWI71nuxHfkwO+c/kJw5jxdBoz5tRI2zbtUgv/X5bYKw2mGB7SdW1vOyYCDbLeojAKHdm
	5nsOMtqAXzHJoKPYznC2v5qn1XhjNYY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-CmnaPbd1MQqw_3THCCEbig-1; Mon, 23 Jun 2025 11:43:47 -0400
X-MC-Unique: CmnaPbd1MQqw_3THCCEbig-1
X-Mimecast-MFC-AGG-ID: CmnaPbd1MQqw_3THCCEbig_1750693426
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f7f1b932so2878741f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 08:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750693426; x=1751298226;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=23Yqz6D5y7M7u78E7VkUTuP0Y7WfwouQlTdg1wTNEMo=;
        b=usfgCLZlraGiYctitiSvnJo9UQBRgcByIfyYppOIsr+pQR6xvY+JagaaACfKXCiIJp
         n08F0NWcsEUq8WZeJCTvh8UDqGBu1/rQQ9gXfU0zyNyWkaDvjRCkS3/o1umEEhSnI4ri
         pmGe3zfhfoIA/3Ir3HVdK2f6Cu1ud2L3h3gqykCUacbFAtVAAmMHhyN3RuvYD2HPNOJp
         jdqeoWT2yHXRhQeWwZoVjIE1rJq0cEZd9X6Idb8hNXr5fvxR5Y0/Prb3E1YTVTUMhlF3
         779qvo4+cd2wrT/8RzcnzhWzvXvZhQbs5OKl1fAF2Ndy1uymdiMiT3x0vShLP0PfoNs/
         zjBA==
X-Forwarded-Encrypted: i=1; AJvYcCWZJeccIWi0vfqs47A0Qh6sOSrAxaXe9C5KdLXRZBkEcEWYaodlqMAklSoPIhM8cJHK7cCRluUKpdovrV0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz55atpSTV7NntqrTYRL8oXa7alWXZ+YFQaHpVEg93LV9VqtUI0
	zUbUJUjpeAJW58Au+j/TbfI8bRmR8kjX0ohD6dDx7hMol9LrqSzjcTpZIYx7kSYjxZJkz8ulhD0
	P+lAWFn3IppWvizkf4z5tIXAFPd8KGziSCumwEdAEb+4m3eEHS3A2IcFbWbxVZWpi3hI=
X-Gm-Gg: ASbGncupMl/fQmA/QkiMAa0DHKpmilYiqFZ+OVbEpPGcY2snuAqQ0Xj1LnCKaO87UMZ
	sROFDz5GbMfEDB2tlgk7WOfncGK68WpmIM14NKH/rGPFYKc0gAqymnaibUwkBIQBU4DmHtW0aX7
	2kS/i4kxK7AfuZO/nt0+w7e/cUnIiOWvCGR9kw/A9bsjQ+pIUt7fM4zhNs/3Tg1kVHKtnTIwkrY
	juUbYAQ6U6CZKmUTrL9kSzuR5HU97E4rY8PfRSf/1zJzTuTWhIgk4PTbPTgeGzutnZp9tqtYqK5
	b0l+7J3k3H1Y1Mr3NUOSGD3cOWFZO//AU26f7xydNwgNIUXcPzsA/Kqon42T3NajTb0O0sW1sL5
	zZLzX7b0t890MPt2IaNYX8QG7cqyS13VtsJYxTE2XH61Q9EXjUg==
X-Received: by 2002:a5d:6f1d:0:b0:3a4:cfbf:5199 with SMTP id ffacd0b85a97d-3a6d128a528mr11275084f8f.9.1750693426120;
        Mon, 23 Jun 2025 08:43:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhqtrtlxl1Gchv2dH1mkzO8col2pfRQZ6piZoDOacwDoi8xsHoL99bl7bc3fGu2ZE5CWTyNA==
X-Received: by 2002:a5d:6f1d:0:b0:3a4:cfbf:5199 with SMTP id ffacd0b85a97d-3a6d128a528mr11275028f8f.9.1750693425658;
        Mon, 23 Jun 2025 08:43:45 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb672sm115985825e9.6.2025.06.23.08.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 08:43:44 -0700 (PDT)
Message-ID: <3fc57897-4eb0-4f39-8428-bbf10d51b83d@redhat.com>
Date: Mon, 23 Jun 2025 17:43:42 +0200
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
Subject: Re: [PATCH RFC 14/29] mm/migrate: remove __ClearPageMovable()
To: Zi Yan <ziy@nvidia.com>
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
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin
 <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-15-david@redhat.com>
 <501877A7-28C9-4203-84B8-E05E7A0E24F8@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <501877A7-28C9-4203-84B8-E05E7A0E24F8@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bw--O9D6c3JilEqXYlC2qUjLg4CUAkvBXh7oVgaAx_0_1750693426
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 20.06.25 22:15, Zi Yan wrote:
> On 18 Jun 2025, at 13:39, David Hildenbrand wrote:
> 
>> Unused, let's remove it.
>>
>> The Chinese docs in Documentation/translations/zh_CN/mm/page_migration.rst
>> still mention it, but that whole docs is destined to get outdated and
>> updated by somebody that actually speaks that language.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   include/linux/migrate.h |  4 ----
>>   mm/compaction.c         | 11 -----------
>>   2 files changed, 15 deletions(-)
>>
> 
> The comment for struct movable_operations needs an update too.
> "
> If page migration is successful, the driver should call
> __ClearPageMovable(@src) and return MIGRATEPAGE_SUCCESS.
 > "

Ah, thanks, it will simply be "should return MIGRATEPAGE_SUCCESS".

There is more magic to it (the driver must setup the dst page as
movable), but probably that might all be reworked soon.

-- 
Cheers,

David / dhildenb


