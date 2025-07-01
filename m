Return-Path: <linuxppc-dev+bounces-9956-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5371AAEF108
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 10:27:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWbkK3YFPz3091;
	Tue,  1 Jul 2025 18:27:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751358457;
	cv=none; b=N/G3MKNTP/M2Wa4UIZPPEUY+hbn6gBK+uHQjeUhBoVaivIPJO5hSNTqZqBkFYjy6CjvBuGzmV3Jrb+jOjtj7nlbanT/4AR+A0+UaVE81DMoQQRKcxDllNf5FtqCukYck7prrXewEAw0xBSDH2Zuu0MbhjppQJ4oiPfxtxOMx7tD8by/c9DbE7UaoWkEVF9vrNBNGmM1sKcjzfDrF3O+LwFsNWAHbtsqFhuuQd+rAuf+aHqEAyhVmyOeHfmfvxPx9PlhRZWc7DgvK8gzZyuy+YVBiWeW7kR54bfgUTMwC9BuMGI83eN0SvgK8TqjlkQRqgU7SjR84dkINxGvrwEFg8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751358457; c=relaxed/relaxed;
	bh=PblRiGjccU8Bn/mbQjlfjXdXmpQtgP9DOCLVx78Z5kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jacp+pWls5E4FDstEPCk3/WUOD+jAZVq85KrP8oi6QlvlOB/DliayHAtqzP5FnZ4mA4hl6mp/AM+kv30hA3Fb1sV6XlCrJEn0rVYd2EC/a8rfX3PsDps2wlx7x+jkvVSBORv78rUhWRbbal0lTflVNxAS6uCKanlxp2S5/3pL5UovfZzFfyR3oIxiyLFkMQHhM+N13d3fiQoX4SJp4Ksq1SJ+aVEast2Y0OUdHxgz15LpPXRCL+bHXG46OfClPeCDT7ZhBO36fj0arLYQXBW4IK/E+g1XYNc0mM+LIh1H+W0Z3nAggfEca70wg+sNI5dGxU3zGv4J8c649U8qE3F2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IByLGxpP; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W+OTVJIg; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IByLGxpP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W+OTVJIg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWbkJ4KR4z2yqn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 18:27:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751358452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PblRiGjccU8Bn/mbQjlfjXdXmpQtgP9DOCLVx78Z5kk=;
	b=IByLGxpP3iBjItrdDcW+nMZkTjOOfxkcAWUxYTYIgTcoJeQUJ/vU4qz6dpCZNGQAur174i
	4TJc17cfItGQWTdIcVdLQ7ri7Pjal8Kgma/y9Tn6ZQl7e6oxTdyIIO7tgq+Ni1taIO/Gnu
	U2zCNnL4UtRlMyu/gVfV3I4L71MqSvg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751358453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PblRiGjccU8Bn/mbQjlfjXdXmpQtgP9DOCLVx78Z5kk=;
	b=W+OTVJIgsM8bFFT9VMtUTGn64OXQmraj3LDCIHAnQCYu7aX0kvSnUceMtiw+E2FhGDA0eB
	iAGkrS0I6i0tzUaD3tuH2xY74iUhGNM5st4/kpsbCwmnT4Ml9UJ1JycTKHNiTt0YqBs9DZ
	raY04NFAwjo3oOA1oOE1saFiyM8eksQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-cjrmSgPPPEqG2hPZEV52dA-1; Tue, 01 Jul 2025 04:27:29 -0400
X-MC-Unique: cjrmSgPPPEqG2hPZEV52dA-1
X-Mimecast-MFC-AGG-ID: cjrmSgPPPEqG2hPZEV52dA_1751358448
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a54a8a0122so2642984f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Jul 2025 01:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751358448; x=1751963248;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PblRiGjccU8Bn/mbQjlfjXdXmpQtgP9DOCLVx78Z5kk=;
        b=fYJRSuCJ/37QZRPz74uwT3eGfnIm1h5k6BzR7fRDD+nJMrPgF3Iv0e1nfNlgVlrW/U
         +6uia1OkFdU7PTF41aNA/Oad1tyhQ58FO5o2rqh81Il4B2cfSOaMTRoJj6gXTjLZOU0R
         48WZ0lWcqamWK/s2CzpRHYgAlZdCikW0vbzkIF+FIq5/qTmI1y5MrdE1IiCNcBv3sI1W
         OryIJfAGGXBedutDQHnClWM04y8ttQIHUFyRgapLEhIsc6vWHL1/zPBFK+xkqvZiGKRz
         MkkeFiJBVEzzZJaXbrOp5QP7J95z1WStWHNfOTTSDTCDkC6EAMyCO689UeJPU3bUSQDf
         mVUw==
X-Forwarded-Encrypted: i=1; AJvYcCVeIQf/jrCMS+m1uVI8glmmVM7TVRVDVm5C6y9TKJYUdmZs1bhPVZmK69U3fXJfN5P4gWVCLGjC1nZmDGI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzUM0EOEzSZWHIuw2fAtOJQPTlis6LhNTNZ+6UJr6l5RzAUZj3x
	tmL9WwdqK9vbRaaZZyCBZQWKurO18LMsU4baEsFm47l68rVIE+b1UhauuMJO3QXSqEpLdDVA+Xy
	EXxg7W6kRFpcH3xfPHGMPG+STGsK2NuhCo4xwNsISrv8YH50QCDOQlYlWybKqWBdv+kM=
X-Gm-Gg: ASbGncvApTHS+N6Mw4970uH0s+3s4BnutK8qIgB3UdKRrEbcNsBJvEWdpQKUBtG0BC9
	ylYM+2sNdMbGmIGFbkkjNQvOoNyLEFFYCLivBHvvoPJU6OG0meTaGYe8+ZQmzpdX9SSYGIPs4rG
	JUpuOLv9hAtfS1vpKGpwFLY0fZ1TLMQS3cx6swJy6YG31ZIUMaOLebQ4GtaomvRtanlZYtTudpl
	PldYux1JkER2pEzTyIS948MjeveLADzH/POKFfq0yt9euz6MIH17Bh6nQJzWjSrvznGsnAxI/xY
	Zyt8Tgj/C9MTCoi5cMHolwb2QIxtcwCQWCEBD64kT5YmGZe+Nyaz7uru2Lof2hpvclCXT6OeJ6f
	3QIWmfZasc6x55DuNxRyyiwh9M0tmphPccHiB6WPRJoan5ph5bg==
X-Received: by 2002:adf:ea49:0:b0:3a5:2cb5:6429 with SMTP id ffacd0b85a97d-3a9001a2429mr10713688f8f.43.1751358448205;
        Tue, 01 Jul 2025 01:27:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiLSGjG1SoIniYOMAMRtKjuH1JQxFUi7zwrUP3ZsrTTfWnOXH6/VrqPd9s71VjBfuaf4xFvw==
X-Received: by 2002:adf:ea49:0:b0:3a5:2cb5:6429 with SMTP id ffacd0b85a97d-3a9001a2429mr10713626f8f.43.1751358447701;
        Tue, 01 Jul 2025 01:27:27 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a35sm12732775f8f.57.2025.07.01.01.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 01:27:27 -0700 (PDT)
Message-ID: <7a194ee3-f5c3-416e-8de2-d2beb32479a8@redhat.com>
Date: Tue, 1 Jul 2025 10:27:24 +0200
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
Subject: Re: [PATCH v1 06/29] mm/zsmalloc: make PageZsmalloc() sticky until
 the page is freed
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
 <20250630130011.330477-7-david@redhat.com>
 <74894b3e-9a64-4600-aa3a-e212d2f63e1b@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <74894b3e-9a64-4600-aa3a-e212d2f63e1b@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oqyDzK0p6aVvbrzPBoQkkWJyoa8WScScZTORiBSei2A_1751358448
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 30.06.25 18:03, Lorenzo Stoakes wrote:
> On Mon, Jun 30, 2025 at 02:59:47PM +0200, David Hildenbrand wrote:
>> Let the page freeing code handle clearing the page type.
>>
>> Acked-by: Zi Yan <ziy@nvidia.com>
>> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
>> Acked-by: Harry Yoo <harry.yoo@oracle.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> On basis of sanity of UINT_MAX thing:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
>> ---
>>   mm/zpdesc.h   | 5 -----
>>   mm/zsmalloc.c | 3 +--
>>   2 files changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/mm/zpdesc.h b/mm/zpdesc.h
>> index 5cb7e3de43952..5763f36039736 100644
>> --- a/mm/zpdesc.h
>> +++ b/mm/zpdesc.h
>> @@ -163,11 +163,6 @@ static inline void __zpdesc_set_zsmalloc(struct zpdesc *zpdesc)
>>   	__SetPageZsmalloc(zpdesc_page(zpdesc));
>>   }
>>
>> -static inline void __zpdesc_clear_zsmalloc(struct zpdesc *zpdesc)
>> -{
>> -	__ClearPageZsmalloc(zpdesc_page(zpdesc));
>> -}
>> -
>>   static inline struct zone *zpdesc_zone(struct zpdesc *zpdesc)
>>   {
>>   	return page_zone(zpdesc_page(zpdesc));
>> diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
>> index 7f1431f2be98f..f98747aed4330 100644
>> --- a/mm/zsmalloc.c
>> +++ b/mm/zsmalloc.c
>> @@ -880,7 +880,7 @@ static void reset_zpdesc(struct zpdesc *zpdesc)
>>   	ClearPagePrivate(page);
>>   	zpdesc->zspage = NULL;
>>   	zpdesc->next = NULL;
>> -	__ClearPageZsmalloc(page);
>> +	/* PageZsmalloc is sticky until the page is freed to the buddy. */
>>   }
>>
>>   static int trylock_zspage(struct zspage *zspage)
>> @@ -1055,7 +1055,6 @@ static struct zspage *alloc_zspage(struct zs_pool *pool,
>>   		if (!zpdesc) {
>>   			while (--i >= 0) {
>>   				zpdesc_dec_zone_page_state(zpdescs[i]);
> 
> Maybe for consistency put a
> 
> /* PageZsmalloc is sticky until the page is freed to the buddy. */
> 

I'll add that inside free_zpdesc(), before the __free_page().

Thanks!

-- 
Cheers,

David / dhildenb


