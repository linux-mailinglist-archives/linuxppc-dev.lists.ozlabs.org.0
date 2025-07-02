Return-Path: <linuxppc-dev+bounces-10032-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95117AF12AA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jul 2025 12:55:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXGyB5Tp9z2yLJ;
	Wed,  2 Jul 2025 20:55:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751453714;
	cv=none; b=UGCwVEJDI5O0+8Q1IuSfVY26bGWccrAtC1O8aP6SW9wuPpl0Rsrlg0onsV4hDSf/gSK23y0FJ7nrN9rjvWgRNl8TW/c1pOz2hwNY7r0xe0fDM+TbvRRwwqtI4tc9AYjSIo6uPPudTbc6A3phYU+c/sBkRx2q9zqV9xAXmhaF6yx/drx3A1q8zem3M/escC+YWc7yGPW82+O9wT2q5pkMWFZZMpdFT0towP/x07ujMKE6zbrDh/QtZZmeYnCwPa1dGiP+DrTmz1VxaXo0k1OnaxL2OklmTR2cMb1qV6gMJ36Er9vKpcyT1o7FElM48ZQGV+wlDdWP9UAUk7nmOyeqIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751453714; c=relaxed/relaxed;
	bh=3jS+uD1Oc4zGOBUHZNuowE6e3b/KrfwZtLCHN7KeS3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eg+cXfzaUoFhA8vXUGjkTCHGNrvBctA2JZ7ZR+wD24cKkzZDk995YO0SJfdW2pjxvQdlWNMjAtjV5zcfLLspojjEVeSVhYcRPlT4zhoCs9YZDtrQndr99k4ZZCi9Q5BgXyRcm/t8VQqLkjgYKKys736j+4xGp0wALVewf9A2YadhnPBJpRSJllQ1Y/c5VE+nzkxrBuyEG1JEUQyH0UebcIpvKLA9ciJVOrstwNP9ziy7+1lBEJGkfiVR0i1IBRk7vAbbXGzT0SqW3eWJVEJUqUXOuY6XnxlFMVWRXREr12st9gFmxGC96HIE1TgETA/5lfX3r4J/XPBd22tz0Ft7ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VAw/gNsS; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VAw/gNsS; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VAw/gNsS;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VAw/gNsS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXGy92xSxz2xlQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jul 2025 20:55:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751453708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3jS+uD1Oc4zGOBUHZNuowE6e3b/KrfwZtLCHN7KeS3E=;
	b=VAw/gNsSgbnu/x9zgtUxgaMbXg78LeT9hseDdw9wnsxkKGFB7FI9ogwN1SXqBsCDn9jcWT
	yi5kgkjE/7DohA5pGrhiM0ZU6KIGSpVEfEK5UBnYw0kyZB1K5uUAL/gwIbHwUCbLUI4ajh
	oLwcCEvy/TJSNyoExDOpvBS2b4a0ddw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751453708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3jS+uD1Oc4zGOBUHZNuowE6e3b/KrfwZtLCHN7KeS3E=;
	b=VAw/gNsSgbnu/x9zgtUxgaMbXg78LeT9hseDdw9wnsxkKGFB7FI9ogwN1SXqBsCDn9jcWT
	yi5kgkjE/7DohA5pGrhiM0ZU6KIGSpVEfEK5UBnYw0kyZB1K5uUAL/gwIbHwUCbLUI4ajh
	oLwcCEvy/TJSNyoExDOpvBS2b4a0ddw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-BUmcIMRUMyaJy4rcK0JClA-1; Wed, 02 Jul 2025 06:55:07 -0400
X-MC-Unique: BUmcIMRUMyaJy4rcK0JClA-1
X-Mimecast-MFC-AGG-ID: BUmcIMRUMyaJy4rcK0JClA_1751453706
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a5780e8137so3748496f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jul 2025 03:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453705; x=1752058505;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3jS+uD1Oc4zGOBUHZNuowE6e3b/KrfwZtLCHN7KeS3E=;
        b=aCsuQean2flCuA+eEi1FS//KKOgMVMpiUVkDVIBdA+pidTTKoVnYEDzq1uaVEydRK0
         j8GJMGkfT/dlwhkHElv4q3XvU5ip1i2V6ZzEZ6DmMmv3+liKUVrJAAj81HpjEeYCrkQ6
         U9Qh10LHgY0DWHyFPaamIfzzf9MmqR3GeR8gmGxQFK0YP5e9x+U55w8Dib5x4k/A3Jj4
         WrtcIsx2Jvfj8sBrOx2ubXPB7vPUqaAJ3if1pOkwNqs9BQoT01zfxbhdPIQ5x2liyWLR
         BqUEezVZriEwfr3BVkt+rrCR0IIuSkxjEPLZgNFt2UbC7Rjt3xw0WFZF/bbz6Tfy7a+o
         gIOA==
X-Forwarded-Encrypted: i=1; AJvYcCVUaWJLBbsqg6SJwPz8Bw2iW2pmBVPsqzpm8Kv+Dw0txjc2ecMW58gEVw0lvWOAj9Gc9bWefjulk3l51Qc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwPwM87qwJBBY2brQG5W6wk8j7Y0Q9F22iFhD191JwTe1DKG21o
	75ci7e4v558mnbzuwToYaahEq8lzs7ECuVLt183Du4VCTlAvtRAhuouZaX2RQOx0xsMtz0bjdxm
	B8ViZiImCbgACeYnaQU8Uek7uf8soyP+IbAL4fVsv8GJU03ZeQESNAStmKXzFIpWv7gE=
X-Gm-Gg: ASbGncsR736w1oODgtYebj3V95Hxhx8z8p9SfuYT8Hy4IgRZDYiTL5dxkTTR0GFNOJl
	p50isRLVCR2iQJtRg829x0npw3iUC7jCyQRn2xepv2W/tp6ivZmoT5i/Zj0jP8Yf8UYx8RQI7bt
	CH/XDn2NE1ZDxKBQdcFrMdnkO8BAlv9x0putLkXebs2JFQ/noThk25fukdW/ljgcoKwY2dLIfVG
	gQpDCkhdx3Z13+WOQm9k/PkpIPxeNkcvVfOk/1X1Am9YTCkk8xwcs9SPPW28Df1Ec1DGE6woIme
	NB1QWWNhlLOcQ6GXy10QJ4dfzijeG8ecH6MMH20UlddfoyjBPgYeoUo=
X-Received: by 2002:a05:6000:25f0:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3b1f7ae6ef8mr1644479f8f.16.1751453705463;
        Wed, 02 Jul 2025 03:55:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq26TSMyBQAlDrNyJ4gRIcosC2SckUR8wvmxMD9/SEPekoJbfcXvmF8Q5kjpg2FJd2gcKeiQ==
X-Received: by 2002:a05:6000:25f0:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3b1f7ae6ef8mr1644442f8f.16.1751453704899;
        Wed, 02 Jul 2025 03:55:04 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c80b74csm15710562f8f.45.2025.07.02.03.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 03:55:04 -0700 (PDT)
Message-ID: <11de6ae0-d4ec-43d5-a82e-146d82f17fff@redhat.com>
Date: Wed, 2 Jul 2025 12:55:02 +0200
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ugm7j66msq2w2hd3jg3thsxd2mv7vudozal3nblnfemclvut64@yp7d6vgesath>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EaLK5NDZR-xag18S0wLFkzHODK0myMW8WmYzXb2WZx8_1751453706
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 02.07.25 12:10, Sergey Senozhatsky wrote:
> On (25/07/02 10:25), David Hildenbrand wrote:
>> On 02.07.25 10:11, Sergey Senozhatsky wrote:
>>> On (25/06/30 14:59), David Hildenbrand wrote:
>>> [..]
>>>>    static int zs_page_migrate(struct page *newpage, struct page *page,
>>>> @@ -1736,6 +1736,13 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
>>>>    	unsigned long old_obj, new_obj;
>>>>    	unsigned int obj_idx;
>>>> +	/*
>>>> +	 * TODO: nothing prevents a zspage from getting destroyed while
>>>> +	 * isolated: we should disallow that and defer it.
>>>> +	 */
>>>
>>> Can you elaborate?
>>
>> We can only free a zspage in free_zspage() while the page is locked.
>>
>> After we isolated a zspage page for migration (under page lock!), we drop
>                        ^^ a physical page? (IOW zspage chain page?)
> 
>> the lock again, to retake the lock when trying to migrate it.
>>
>> That means, there is a window where a zspage can be freed although the page
>> is isolated for migration.
> 
> I see, thanks.  Looks somewhat fragile.  Is this a new thing?

No, it's been like that forever. And I was surprised that only zsmalloc 
behaves that way -- balloon implements isolation as one would expect it 
(disallow freeing while isolated).

> 
>> While we currently keep that working (as far as I can see), in the future we
>> want to remove that support from the core.
> 
> Maybe comment can more explicitly distinguish zspage isolation and
> physical page (zspage chain) isolation?  zspages can get isolated
> for compaction (defragmentation), for instance, which is a different
> form of isolation.

Well, it's confusing, as we have MM compaction (-> migration) and 
apparently zs_compact.

I'll try to clarify that we are talking about isolation for page 
migration purposes.

-- 
Cheers,

David / dhildenb


