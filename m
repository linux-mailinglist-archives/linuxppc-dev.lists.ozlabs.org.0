Return-Path: <linuxppc-dev+bounces-9849-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCE4AEBC18
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jun 2025 17:38:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bTKSh33pBz2yNG;
	Sat, 28 Jun 2025 01:37:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751038676;
	cv=none; b=oaQ1Cj+ccSaBULlQ0URxtcJUv1oYiE3PrlRNybBEJOgtYGflOMSyXK9RlSLO2+e7qYVtMzntXUnQ0ZAm/eZ8HxuBsVDyqK0QVXMQGJg10i2tShPXq1oxqcfweFh4HK5MyJnDOBc44UHwi3ACL7kjZSoAVWdmxXIEJ5fEEaOyjdAldyJT3aGV6bTeYg9mkpk403rZRC39Rz/bY3x78+zOUv+K/vWkD+4PpIKCSpkdchN/t/svIRzkEav7j5oB8AJXn5CzpjrcSUj/zySVfb9X1aZ1Zp1Ko5l/6qvIsCfK6TL24Y6ixJkZ0ZlfRB5e+sfN+G6fR2iNLN42sumkAT2Gkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751038676; c=relaxed/relaxed;
	bh=KJMIAhuzx2BDsLFGZhb6ZdM4Y3+j+fjYrUfv+csICHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kzgvxcy313xqH9FjXoTJcE5yp/Naq/p1ybMEvd9o2EtoihHJ97Vl1ndeyLZ/szcXVbu1VyNiuvb0sv3VBevDOZ+gETfVBXJ9zawJznpum4Vl2HyQP1RRQf7kIAoVmgyc0s1oqDuPuLdB3VmTZU/tfeqmk2kxhWKi52nj/opB93mVZpGZXVv2o6MAy371DBl4pKxpAYBebZN1ndF2r2h9hxstxOCwJuQK+EHqofQ9JfoiRu5MkPKCv0IMn2Sh6jJcgV0CGFFOwicFQ0lajcvd5JPOv8wn39+Wb2aNhf/ND57anUxuHTqRNnGbnEabfhhr1q6hxZUGUrRklSV8gENHDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BjLZSa6w; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BjLZSa6w; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BjLZSa6w;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BjLZSa6w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bTKSg1s5Fz2xsW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jun 2025 01:37:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751038668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KJMIAhuzx2BDsLFGZhb6ZdM4Y3+j+fjYrUfv+csICHY=;
	b=BjLZSa6w2JYQpLYYRRXyGcrEN56KV8RxBuUdz/tuaYP3sf5CuvAztUQrftMHFSbCiq7uao
	ngmQtVg2Ta9wrjKZQeTbP6/+S3xgmidtpWO+tZHiDmG60dcfLpV1lau+kCGxN0SzDFVVJR
	Cf80z//7upz+kJzMS1rdw+dC1a37/6Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751038668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KJMIAhuzx2BDsLFGZhb6ZdM4Y3+j+fjYrUfv+csICHY=;
	b=BjLZSa6w2JYQpLYYRRXyGcrEN56KV8RxBuUdz/tuaYP3sf5CuvAztUQrftMHFSbCiq7uao
	ngmQtVg2Ta9wrjKZQeTbP6/+S3xgmidtpWO+tZHiDmG60dcfLpV1lau+kCGxN0SzDFVVJR
	Cf80z//7upz+kJzMS1rdw+dC1a37/6Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-GK6P97KROfuO0gh4291oRw-1; Fri, 27 Jun 2025 11:37:15 -0400
X-MC-Unique: GK6P97KROfuO0gh4291oRw-1
X-Mimecast-MFC-AGG-ID: GK6P97KROfuO0gh4291oRw_1751038635
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d290d542so14699765e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 08:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751038635; x=1751643435;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KJMIAhuzx2BDsLFGZhb6ZdM4Y3+j+fjYrUfv+csICHY=;
        b=pivfRqj+BADlKFkVkTU0X5dfplqGreXZYLdhI2v1tiahBWFtTgj70l/L2Zf6IDFwQ0
         7S60jJkhlqTmeYap8Sqf/jPyWzE7CgF7pbXdj3eacXsjGAWRGTWwCabQPM7fkaFhs19n
         qKRPkcMZ1cOB3rDBUQKmx543Bto1yb31hwpklLkaM/WS4esvMzUGxc6rGeGf6HaxH8bx
         6E8DnNIHE7N/3GbM18esr2riPeS96rKVMbz2lrKVMwxuUdxR05/hv5BlJzYVFeVssEv7
         8/bXePcxVXMxhm3PTk9nXjhtkz2LgIdsPLCkbXBYPr948+C/VgXuLY7t5VewotvGtSXA
         7ybg==
X-Forwarded-Encrypted: i=1; AJvYcCUcmx4/sAjXe0dnr7sllS0ED6XCPhQHl377F8FJ8JZxeiOI/FEPKwllvReTSyJ2W8eWkIXuaGwfsA1NgvU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx4jgVETSVz7xnZaNNixRTwAOqyE7NyaOpgH0bbskQkP1UVlfgT
	mWJ5WZzJzdcKi0EEugN+Vfb6pEEwv8FaHnSC5UKOw5W+JyqBna05OVmbG1xCcuPTqE5tNKwYutn
	L/clIKP6LN8ztDEU+6Dvp4o48DnC6IDe3HweHfDIybZ7V1jk2ZTDg+sgvDBjkEKw/bkM=
X-Gm-Gg: ASbGncsxa1jAMn7yTBIaOa2TA5cE3lD9KOWYiCGGzwxDiG5ymmF46VU4xFPI8THTwIs
	GnTUDvxRYjkjIzmBIVWs0F4951xuv/LaBjj3lFFVM7H9KaxgE4mnOKULzPCf6ZP5WFe0FKXyaTd
	8fheHbAw8KkDpecHFMKorFf9s0TLWCZQUeU1b6EIYmWK7QTNt8CY4QJ8+/eLFAgmxcFWIS0aDWe
	f152TYKovAyZfDixIdvijtaw51jdpp/Kpk3T8+K09R+04aKDVDMG2uDPNdAtvaDkOaHZMly4Wx6
	OoIrnSTQWHtguAdk/1Tozogf3/EInl4LJILg2UbnBYITX1rluYk10JABySfyTioEcEnoJw0u90d
	5w0+s675Jd4117oLz0HR/VbzkU3Gy+6B6sSeQJLd4v6/IR041Tg==
X-Received: by 2002:a05:600c:5392:b0:445:1984:2479 with SMTP id 5b1f17b1804b1-45390bad330mr28966875e9.5.1751038634603;
        Fri, 27 Jun 2025 08:37:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpemDZ40uiONDtZjJW+nV/evMunhZba+Qc1nWoeuTAFiMYSJpUOGLDvVkR2VDxHht8RT+tzw==
X-Received: by 2002:a05:600c:5392:b0:445:1984:2479 with SMTP id 5b1f17b1804b1-45390bad330mr28966365e9.5.1751038634131;
        Fri, 27 Jun 2025 08:37:14 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:5d00:f1a3:2f30:6575:9425? (p200300d82f2d5d00f1a32f3065759425.dip0.t-ipconnect.de. [2003:d8:2f2d:5d00:f1a3:2f30:6575:9425])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538f50c926sm13605245e9.0.2025.06.27.08.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:37:13 -0700 (PDT)
Message-ID: <468f845d-f048-4ac8-94e7-e2eb97b613e5@redhat.com>
Date: Fri, 27 Jun 2025 17:37:10 +0200
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
Subject: Re: [PATCH RFC 07/29] mm/migrate: rename isolate_movable_page() to
 isolate_movable_ops_page()
To: Zi Yan <ziy@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
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
 <20250618174014.1168640-8-david@redhat.com>
 <9F76592E-BB0E-4136-BDBA-195CC6FF3B03@nvidia.com>
 <aFMH0TmoPylhkSjZ@casper.infradead.org>
 <4D6D7321-CAEC-4D82-9354-4B9786C4D05E@nvidia.com>
 <bef13481-5218-4732-831d-fe22d95184c1@redhat.com>
 <8FE2EDF1-DF20-4DC4-A179-83E598508748@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8FE2EDF1-DF20-4DC4-A179-83E598508748@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KzCcCH5bpxnDB47hZJi8pdMsT1AWJHE48_ojbtagEns_1751038635
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 23.06.25 17:42, Zi Yan wrote:
> On 23 Jun 2025, at 11:33, David Hildenbrand wrote:
> 
>> On 18.06.25 20:48, Zi Yan wrote:
>>> On 18 Jun 2025, at 14:39, Matthew Wilcox wrote:
>>>
>>>> On Wed, Jun 18, 2025 at 02:14:15PM -0400, Zi Yan wrote:
>>>>> On 18 Jun 2025, at 13:39, David Hildenbrand wrote:
>>>>>
>>>>>> ... and start moving back to per-page things that will absolutely not be
>>>>>> folio things in the future. Add documentation and a comment that the
>>>>>> remaining folio stuff (lock, refcount) will have to be reworked as well.
>>>>>>
>>>>>> While at it, convert the VM_BUG_ON() into a WARN_ON_ONCE() and handle
>>>>>> it gracefully (relevant with further changes), and convert a
>>>>>> WARN_ON_ONCE() into a VM_WARN_ON_ONCE_PAGE().
>>>>>
>>>>> The reason is that there is no upstream code, which use movable_ops for
>>>>> folios? Is there any fundamental reason preventing movable_ops from
>>>>> being used on folios?
>>>>
>>>> folios either belong to a filesystem or they are anonymous memory, and
>>>> so either the filesystem knows how to migrate them (through its a_ops)
>>>> or the migration code knows how to handle anon folios directly.
>>
>> Right, migration of folios will be handled by migration core.
>>
>>>
>>> for device private pages, to support migrating >0 order anon or fs folios
>>> to device, how should we represent them for devices? if you think folio is
>>> only for anon and fs.
>>
>> I assume they are proper folios, so yes. Just like they are handled today (-> folios)
>>
>> I was asking a related question at LSF/MM in Alistair's session: are we sure these things will be folios even before they are assigned to a filesystem? I recall the answer was "yes".
>>
>> So we don't (and will not) support movable_ops for folios.
> 
> Got it. (I was abusing it to help develop alloc_contig_range() at pageblock
> granularity, since it was easy to write a driver to allocate a compound page
> at a specific PFN and claim the page is movable, then do page online/offline
> the range containing the PFNs. :) )
> 
> For the patch, Reviewed-by: Zi Yan <ziy@nvidia.com>

BTW, thinking about it, I think we could handle compound pages quite 
easily, we'd just have to lookup the head at some point -- but we 
wouldn't be using folios for that.

BUT, I am note sure how compound pages without a memdesc would look like 
in a memdesc world, and if it would actually be "compound pages" in the 
traditional sense.

So, I think there would be ways to handle that, once we get to it.

-- 
Cheers,

David / dhildenb


