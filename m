Return-Path: <linuxppc-dev+bounces-9973-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9BCAEF498
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 12:11:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWf1f1Kfzz2xPc;
	Tue,  1 Jul 2025 20:11:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751364662;
	cv=none; b=XO3RDMcuKo+LnkN1AUjlVUIUfVV8/WCTBHwWYJ8XVdLiDOggZ8utgjrItAgKTEzqE+Bczbxed6G0Ogs1fXOygNCDTbIVHBpoIaOfYXhY1AQh9jKEbRpZr7G3z8yGXr2D0eTnzaZPZTrdyluORu+n16CNTH4TvJTPsMrH8xkPtMuF3kIrz3gJcbNYO0PCFgVvE6b+tflYU7HqoMHmWjH6NT4Frf1dWvYmOfv/cmov1XVTLfZRV67TnEiAHtn1/VCQrFeLRZU4+7f2pt9XG0eQvfwbk5VbEo9c8QMD9TjdIyEpgic+Q5pFCJhUTkxcVpu/Ht7hZoSqYGuzfoTWsAUmYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751364662; c=relaxed/relaxed;
	bh=c0jD2hSpE7gKZ4WlSst4Xt3GrhqpzXYpDNooeYwdm00=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NZcooQEL7T2vyTb+/LbpHc4gNGEY6xCMbmpMfRcpFgsTKLo80QLqFhelql/ZbKH9+FjU3vwhsnY66+85Fu2DUTAHwklNWenQMyiL5l7yT5AI8fNjsWHZzPX9crX56KNhEui1O1vH3AIAfRVyujV6e+HUZOjRaBwLoT7bDjzWoUcOSNDquVpswv5d/kT7cGjjqOY6Mh8t3lA7tJg2V36BbGVMwMfgmrlHC1Xck3n8WPO8z0C8stLBNt9t++azQr716ijTj5bJ6MkFVjWmCrvdAlFWXQcL13Pt+vWQrolKTw+AqFeOPBEn4nsL7YIa2DUtcifPutUFB7dczxAyFLsPDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KHQdbGbu; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KHQdbGbu; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KHQdbGbu;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KHQdbGbu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWf1d1zGGz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 20:11:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751364657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=c0jD2hSpE7gKZ4WlSst4Xt3GrhqpzXYpDNooeYwdm00=;
	b=KHQdbGbu/NWIv3yhUTarpBksdz7d126B63jX09cNSn0uhMrH2wdOlkp7EpGWmBbV38RhL0
	ojur8OUn8cj4jM377Jc5iFIQIuOJLMH6up+n3pEX1Z4inY4rYpaiBPXogspBsZX9hapEr4
	ieTRPlt2KQSDqOpM5tfXIKE5jTEOqcU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751364657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=c0jD2hSpE7gKZ4WlSst4Xt3GrhqpzXYpDNooeYwdm00=;
	b=KHQdbGbu/NWIv3yhUTarpBksdz7d126B63jX09cNSn0uhMrH2wdOlkp7EpGWmBbV38RhL0
	ojur8OUn8cj4jM377Jc5iFIQIuOJLMH6up+n3pEX1Z4inY4rYpaiBPXogspBsZX9hapEr4
	ieTRPlt2KQSDqOpM5tfXIKE5jTEOqcU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-s23nLSoJOoeQdlzNWP5UzA-1; Tue, 01 Jul 2025 06:10:56 -0400
X-MC-Unique: s23nLSoJOoeQdlzNWP5UzA-1
X-Mimecast-MFC-AGG-ID: s23nLSoJOoeQdlzNWP5UzA_1751364655
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4e9252ba0so1968793f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Jul 2025 03:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364655; x=1751969455;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c0jD2hSpE7gKZ4WlSst4Xt3GrhqpzXYpDNooeYwdm00=;
        b=gtB5ebh/4JzHtoUeatZqE6v0Dx5hiuYG+6AAZT93Xr5Xpc0SVpjznqNaM8hUpFoCD5
         kch2tCOSL07N9AxEwJ58lZn5lPeF3F3X75hT4MdM1QQdqO6oLmw0htxPNWXdJlGFmGs0
         RrJ1SfrMl+fgyuQI/JMtQ8HHCO8yeZ2SsXlt7YyXTJlDrwFU8WynMOYSINpUuygFa1x0
         c/2uw/8MGsukUScTa5zviDIy9pgTTJY+MeUgbuuMv+J7ifcK7EXchn7ZzaG3Y8JyGeRg
         EpcTUwnmTFyqPI31vKFWMwTWY89hdMneFvVnt15Nf8XXRMMVo6GtKHc3dLXcpLQh8MdL
         ERNw==
X-Forwarded-Encrypted: i=1; AJvYcCVff924sZ1vtv7M9awrHn6tEV0QQnA/Rm7uCRNxbyqGPBYnGeL80r0msK8QUajw+FGgyesvbMY+0xKU1dE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzhdsStbTXuNYdS8+EhbnkhcXd1K+rOpJCLLb8BlkTOPEVRJ6vD
	zssz5+6xZxS7Cl3lqxvLykOGhWzI4s4qbjkvzcA+rup6NyTUee+/yXcLwwmd2e6wJQF/eDVN6j0
	MjyiOCzK/gJ0hVkkD11RpU7mAKmEqCAmd0yId8qcdv5ux9vRgl1z2jDCpJZSQ3C6tts0=
X-Gm-Gg: ASbGncupxY3wzt2xPeT8Dgyr9TTrJdFqCF2TeIZk28GwGebe52gCpD1eR+vm8Qy0iv1
	0QszOLt9u9FvvwZxUjrjqrmWVHGxE65eLtJhQ0ONoZ/k40xia4ezMGd+Ttlea91RqjYjTdicSNs
	dze8OAO7CM0+ocmz/z7y2mR1MRUfOLWIPBYWlzN5Xn8UMIhmmWV2fOTrQCM1acFaNTnX5n0Dli1
	sqmcKqXC10B0PfQ7QbfMe96RE1kNUG0sViyV/WWZ8P8x4cKNfuo8jRDf7JLLHZJ3Z/4TZa+SV39
	S9+Pzd514SHibab9h99cDbXzDAKY/R3L3fQKZd0a0IumffR+DjN9gjuCgmfDDpzmIuHsxPAtDup
	oECeBnzauYiFlSoU7eRjbC+CaFk7mj2X10VtHvVfl/CrMPDdOMw==
X-Received: by 2002:a05:6000:25ca:b0:3a4:f744:e00e with SMTP id ffacd0b85a97d-3a8f4548f84mr14531930f8f.4.1751364654556;
        Tue, 01 Jul 2025 03:10:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2EPAydBFQPvolNYN1EmggMxJTgK1+GLCQ1XLXRXKbAVGL3PuDAhYqnMDlTu+BQBsY4f0XaA==
X-Received: by 2002:a05:6000:25ca:b0:3a4:f744:e00e with SMTP id ffacd0b85a97d-3a8f4548f84mr14531865f8f.4.1751364653933;
        Tue, 01 Jul 2025 03:10:53 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e74fbsm12977368f8f.10.2025.07.01.03.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:10:53 -0700 (PDT)
Message-ID: <0482f13b-c922-4f54-b32e-bb1dc27b44c3@redhat.com>
Date: Tue, 1 Jul 2025 12:10:51 +0200
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
Subject: Re: [PATCH v1 09/29] mm/migrate: factor out movable_ops page handling
 into migrate_movable_ops_page()
From: David Hildenbrand <david@redhat.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
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
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-10-david@redhat.com>
 <6aba66e6-0bc5-4afb-a42c-a85756716e1c@lucifer.local>
 <315c5e9a-8fbf-4b9c-98b2-1ea69065af85@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <315c5e9a-8fbf-4b9c-98b2-1ea69065af85@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zUzRT-7v0YpfBx9CxfIP1UQDrMiEIwzXDJTOll_zpPk_1751364655
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 01.07.25 11:24, David Hildenbrand wrote:
> On 30.06.25 19:05, Lorenzo Stoakes wrote:
>> On Mon, Jun 30, 2025 at 02:59:50PM +0200, David Hildenbrand wrote:
>>> Let's factor it out, simplifying the calling code.
>>>
>>> The assumption is that flush_dcache_page() is not required for
>>> movable_ops pages: as documented for flush_dcache_folio(), it really
>>> only applies when the kernel wrote to pagecache pages / pages in
>>> highmem. movable_ops callbacks should be handling flushing
>>> caches if ever required.
>>
>> But we've enot changed this have we? The flush_dcache_folio() invocation seems
>> to happen the same way now as before? Did I miss something?
> 
> I think, before this change we would have called it also for movable_ops
> pages
> 
> 
> if (rc == MIGRATEPAGE_SUCCESS) {
> 	if (__folio_test_movable(src)) {
> 		...
> 	}
> 
> 	...
> 
> 	if (likely(!folio_is_zone_device(dst)))
> 		flush_dcache_folio(dst);
> }
> 
> Now, we no longer do that for movable_ops pages.
> 
> For balloon pages, we're not copying anything, so we never possibly have
> to flush the dcache.
> 
> For zsmalloc, we do the copy in zs_object_copy() through kmap_local.
> 
> I think we could have HIGHMEM, so I wonder if we should just do a
> flush_dcache_page() in zs_object_copy().
> 
> At least, staring at highmem.h with memcpy_to_page(), it looks like that
> might be the right thing to do.
> 
> 
> So likely I'll add a patch before this one that will do the
> flush_dcache_page() in there.

But reading the docs again:

"This routine need only be called for page cache pages which can 
potentially ever be mapped into the address space of a user process."

So, not required IIUC. I'll clarify in the patch description.

-- 
Cheers,

David / dhildenb


