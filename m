Return-Path: <linuxppc-dev+bounces-9995-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D194FAEF927
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 14:50:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWjY76bs3z2xPc;
	Tue,  1 Jul 2025 22:50:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751374203;
	cv=none; b=iz3xHBAyy0xEOS9VF0Busd/yhZaGyFfJcrfNFtfXzSh2LGkz5qRnSfIuBzRW51zpF839XGyOnvaOU3ZyQVm0ljfMj8UtBh0CVYd5cOLQ6hfGpGaD7Na62ZTAgWJdNXCnmtc1/v5hQFrmxTVK60ErOMqZZKN44fOiv60e63TB9tPoHNs52G5169Gi7gxgNZCWIWneCbOV09eKF6j0US2gJHCRdi+UUyuNocSFq06hE7NblWRAdRbWznJc8Uyfr/FNjnKQGedGeBdX2gCzxuBIFuNn5UY9TJrG6jVI2iNAKrHvJKGOkVqimBAaxgIDzv4YHxvpRE+3Ehlmoo2xqxklXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751374203; c=relaxed/relaxed;
	bh=C+eeNIGph/RfboTkvhQ0KJF1oXksncRWcmuBP7S2QrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EOGyOWY970K2S2l0P0wrHn0WcpXf87caGErQkKPnQAZcjmiJJEiv8LfSsnujsZsplcHY+EEQCnxFJ09bBX1lnLkI78xqygFrQPecDba/8DMVsTgZjfBO2pF2V/JoNlDO0dqg5e+GvEsFzT84PCJwpmGimO5CMXIUsjm9xhL6P0iZ+KKt7edWhk16o2LtqmMXn9Jqrws2B4Tm4kBSPUPTflwJCwt5lcK2zUWd+7TuabgC0zC7A1peVLhBxcYivbSSDpFS6eKcKAfU3d/2Xp0B80/UdR6MOFzwGdLrmunjCnsQbT9D8Yb3T+gGi5qebIcfpX1UfVUHG6NARN+Wfkaz8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XTo4bSvk; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZXcxAZlN; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XTo4bSvk;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZXcxAZlN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWjY66S4lz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 22:50:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751374199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=C+eeNIGph/RfboTkvhQ0KJF1oXksncRWcmuBP7S2QrE=;
	b=XTo4bSvkQsy1swqkXy42nf7K+gcNEruDIl971R0cYcfJriwF89nGpWW/eeHP7Ewb9YYnlg
	apxUYr1zAFsS2q7hc0HRIUKnZDI1IsdPXLIlqOKUIFjcgMrW1YZPpXrE8V0M2IE0FJZzjY
	zSduNpOq61RUS5+bMCmL06R6vkYWhDU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751374200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=C+eeNIGph/RfboTkvhQ0KJF1oXksncRWcmuBP7S2QrE=;
	b=ZXcxAZlNoYmSa6sky8eFz5HcMNWvO/yRT6xLQ09RDs4XIa+kBqiLpvwfAKzxqoN61ZoQBy
	u/Pvh2mjZUiQNnGFbntDhZQnE38lFPkSq4lxrKtJmrErXQe1uLDOjS0LyrfcXmPyrw7ygH
	iy/7p+X6WtCi091Ze/iags72Olghcjg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-s3juUZq_N-uVwl2oj_RtVw-1; Tue, 01 Jul 2025 08:49:58 -0400
X-MC-Unique: s3juUZq_N-uVwl2oj_RtVw-1
X-Mimecast-MFC-AGG-ID: s3juUZq_N-uVwl2oj_RtVw_1751374197
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a50816ccc6so2264435f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Jul 2025 05:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751374197; x=1751978997;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C+eeNIGph/RfboTkvhQ0KJF1oXksncRWcmuBP7S2QrE=;
        b=e187xLT20SXp52Yv8anS7TNzcjmtKSQaF9OloFUb5X0wXMYSN4F03HU0bnBB/Kv3rW
         dhJ3qm+NB+lxa6eX3T41StgHkD8uoh900tLDsG4MeGqKxccefCGqrNe3NL5yDONYWVhQ
         XwOFrR+z5tSQIbhkL1557JXgBgulJqTs6VMdRyCehM0CYR9xpEVgxmQgTv3PxHCIrh19
         yceZPSlgGfNIuJL394v6Zp+6SCkLX8+vIgMcf539mj1eoi6WJdXAMShXJfaC1ar6qt0f
         LZ53n3+SaaR/YaQXpPWpas9hF3Tv9kQK/eYqyvfGjKNKCQV5j9e4i2MTipTMRa6m8gBq
         ZX5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaU7OdiwmRQrdSBe3NnK1e5OtAINIAQ9pP9ns0PJqvBDSv9OoIiC1xdGKdiL0Gvus6FXPvczmYY9oj4/A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx9EoB4CDLoaurLQdTHPlXXci0d6OTAnLM5PuC1LL160nEIqCjk
	dGOX/fW4fA6MdEb5aCBC2qe6EaTYyTcgzbM0w0A2az9TrSwlFB7ii4r1y1XimORRzPudF+inMoS
	wC8pn3cvuCSBXOFEtxMmuNzUK5IAxyVCDvy5A69jY851XRcyXWwXfzE5c3T3Skg2xrlk=
X-Gm-Gg: ASbGncsw+5N8Y9vJG9Vt/xgLdQ7GSLlBSzlRprO+ShVxuJ08tbA4qRK06oVWEcch3in
	r6kkbhlmadtNpfYsb7J1boHUCma0mmP6A0HEs/VNNNJRWDV2KDfa6ryWyVwDEjLHy8txTv4jn4G
	vdxTyQkF9gH6ZyYRWkW5FljY6LxZOY88K3H8hlEkBPwR7fNle6qbF1YgR+MdMf/6RiTutFl7nP3
	zcbqTeQL/QF431z3SK0KipgORJ8VUtzzZ+ELlru5OsnWMd1BFqV6yQgTBblOLvlUoguMM7tvTUI
	wViJ7jhXg0zSmN2GAJp/bip7tX+InlnVVXIrHHYFfGWuf5NLY9XqqsATIO9I5hyiw+jo/zgMSAr
	rJaC1PUBdewdkh/AeBTRiZanMLnHv2rYl1AAYv0+sB/b5xqWhkQ==
X-Received: by 2002:adf:979c:0:b0:3a6:e6c3:6d95 with SMTP id ffacd0b85a97d-3a8fe5b1b18mr10836960f8f.41.1751374196746;
        Tue, 01 Jul 2025 05:49:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAxFPpLtFvUGf5RCxIdMcSORQzf+JZ0BcoaG83ZHXzVCGagtBTeeRvpO+7s2vJcmdXsJSXFQ==
X-Received: by 2002:adf:979c:0:b0:3a6:e6c3:6d95 with SMTP id ffacd0b85a97d-3a8fe5b1b18mr10836894f8f.41.1751374196190;
        Tue, 01 Jul 2025 05:49:56 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7facf9sm13066611f8f.22.2025.07.01.05.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:49:55 -0700 (PDT)
Message-ID: <efb280d5-8c8c-409f-89cc-6cf45bfcf2ff@redhat.com>
Date: Tue, 1 Jul 2025 14:49:53 +0200
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
Subject: Re: [PATCH v1 20/29] mm: convert "movable" flag in page->mapping to a
 page flag
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
 <20250630130011.330477-21-david@redhat.com>
 <0150bc5a-1275-4205-8d85-82364ecabbda@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <0150bc5a-1275-4205-8d85-82364ecabbda@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E9JLEr-7VWNDPiIYkwHAW7BrzR07CECTuQyeYqa9Ecs_1751374197
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 01.07.25 14:44, Lorenzo Stoakes wrote:
> On Mon, Jun 30, 2025 at 03:00:01PM +0200, David Hildenbrand wrote:
>> Instead, let's use a page flag. As the page flag can result in
>> false-positives, glue it to the page types for which we
>> support/implement movable_ops page migration.
>>
>> The flag reused by PageMovableOps() might be sued by other pages, so
> 
> I assume 'used' not 'sued' :P

:)

> 
>> warning in case it is set in page_has_movable_ops() might result in
>> false-positive warnings.
> 
> Worth mentioning that it's PG_uptodate. Also probably worth putting a proviso
> here that we're safe to use it for movable ops pages because it's used to track
> file system state.

Will do.

> 
>>
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Seems reasonable though, so:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>


Thanks!


-- 
Cheers,

David / dhildenb


