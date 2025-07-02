Return-Path: <linuxppc-dev+bounces-10051-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C582AF5BB6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jul 2025 16:53:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXNDf3nVhz2yLJ;
	Thu,  3 Jul 2025 00:53:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751467986;
	cv=none; b=atBF3HXynwOfzvMMzSBYIr6GK1SD5k3FkLdOu7zMqnQk51juNFlIvY/sk3WJbHEMxpBHY1ZPSu2UBBdxIb2XARNhdYNbnHFJKXVrG8inv9QArmfPipZMei56gZzQE3jJxtxg768fpXyc/9VDfLjbb6PRbmfmIZES1DVCu+JvESrhE00yxtwxkYNvkfkISf07Aepo4QK0w6F8Hs/ydWyjDa51JazoWEDgNPjX62gJiHAXfP5ZtJYgKLqJ2Bv7RnBqHo+M7+eYbHuDR+viCubpUimzzEwnWwaZBLBO0MmGPSLQL2xj4OhjmMAzXm9bFhEZyMGkPHqMEGIRyhk3902jfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751467986; c=relaxed/relaxed;
	bh=T5nj6T4+km6XBVJylVpc2FdMnDZamikSe9UfbX+MJzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V04EhwiHFXkqgBUPJ2p8Dz8XxwXApQXTIjz+7fKot1aBipB8Pku0yt5Fpy65IR3ldgSjQghpuO02Wci03bzSgNcadUfzMNLcrmUUHSQGOCVRKMQ8b+ExTfLnq6u2+jMfpRUvVRxdhdkU5dTkKbhXDkwM/OfoettZ/nuh2CUpIsfAq63+d3TQWN3QuHyyx1p7d6bg8ANWLQ8hR6EUmoVNuB0QEuC/jIMw/ki10gqx8wNGyOh1SB3T7TyC8BszcCZzYO4WP9JXRpbCSdODVCGyFBD1nlqcwX2BIKpY2dMfWSUgmTBAlinDkIHQ5hUrnX5489NO/Pi/rKCQbPV+TBs6Og==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NeqRbALn; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NeqRbALn; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NeqRbALn;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NeqRbALn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXNDd4RbDz2xlQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 00:53:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751467981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=T5nj6T4+km6XBVJylVpc2FdMnDZamikSe9UfbX+MJzI=;
	b=NeqRbALnpfq/Rkyxi4ps3WxXEIwU2fFDeHOrC/Hx+WR2IMc34lxO9b+Lfb7JDu8E8OQqJj
	hpKc/cDTMfMEw54sltywAjE5dRzucteGhNXp7vsREa99YVpcud+yC37JXuzh3l40CpCFAw
	keA/MIoMku3sqweZQM3PszwOA9Tpjw4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751467981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=T5nj6T4+km6XBVJylVpc2FdMnDZamikSe9UfbX+MJzI=;
	b=NeqRbALnpfq/Rkyxi4ps3WxXEIwU2fFDeHOrC/Hx+WR2IMc34lxO9b+Lfb7JDu8E8OQqJj
	hpKc/cDTMfMEw54sltywAjE5dRzucteGhNXp7vsREa99YVpcud+yC37JXuzh3l40CpCFAw
	keA/MIoMku3sqweZQM3PszwOA9Tpjw4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-0xDf4bvjPJScCvFDBJei4w-1; Wed, 02 Jul 2025 10:52:58 -0400
X-MC-Unique: 0xDf4bvjPJScCvFDBJei4w-1
X-Mimecast-MFC-AGG-ID: 0xDf4bvjPJScCvFDBJei4w_1751467978
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a503f28b09so3612834f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jul 2025 07:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751467977; x=1752072777;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T5nj6T4+km6XBVJylVpc2FdMnDZamikSe9UfbX+MJzI=;
        b=DmQFUyxzXqH6g03Jtk+pOSSvGOyW9h4tQ95thrqrjiajRsAWW+sumXKMqGblVT6esL
         iFUXWIot7an+FzV+Xm3u5uWaxbS4azbMNaltzYSvPjI2kb2O9ykJyCfy1XoTePU1GGKT
         bcxYImGOqbsl7xk8RAwXlx41IjT6feKoLxeW5x7sq6GficBWbrdYRgS+ars+dYwnkzoV
         JyCi4zg2bcJztcCVDOtAm8Q41e4wVeDqv9N95E8JSU63SfS/O7LkQly6eb4kkEFPtZHd
         TK09N1NV3xjcktcIFTzlPAlqKJ1kHCr4kOxrbLe1OXEj3RGPwZPjVQvd137+VlLLxspH
         1nPg==
X-Forwarded-Encrypted: i=1; AJvYcCVL8LykI2rDD/nZco625eV2GkRarhsOyn4i8A3zrDz4MvRCpipS+wo8hrgYqPLlSRv4KVK6ku0/kUeMrsg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywx6Wtw/yzSOBEu9/B/BXVLT/1R5Xm4tq8CNWIOmFQDgigGbjCj
	ySIN/quSsXHOAXNX82vCyKtd03OiNhmcliQDSqf5LjjHJpcSuneUkaxoghc8wbm2PIiUiWvtywc
	VsTAX71Cnh+elf9TOhhfFaxGjjUSU6TfMv/rWrTmHTtltZnFaESGa8t/gT04MuTCMTzU=
X-Gm-Gg: ASbGnct3YRy9m50VTdwMJ1zWpRCKUzAMDRrg9l+zN3fRJu7looh/Xl4EFAvHvSq1VSI
	lQsWXXFLqFSH+JljQfYbp7oB1Y9qXpdEqJgD4Bjafm9LKGR967CqF+JP76rL0QSnlebSNpcRIB8
	ihFLGeBq631duFx0mrAhrAyeF0RxCiJ9vqpq0db1Vv94iiPP/4EZSzNHyzJhJD+yDZD3Ma0zg35
	dzypom5W4wnc2URHRkS8fIHdI9z0QUdqWzSBSycFrsEBeflcLoZ4xdolqz/+IdW4TxXbsPw7kLk
	hpk8RbWjr6L3cWHBRxC0SGzmIU+4qkaDDWAqh9mDc0a0xHYosgPEMVk=
X-Received: by 2002:a05:6000:2302:b0:3a5:1388:9a55 with SMTP id ffacd0b85a97d-3b1f5813ebbmr2700896f8f.5.1751467977360;
        Wed, 02 Jul 2025 07:52:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6zmp9d2w2MJkn7HSBDnoWuF5cmgkYx/VRxm4DVngK4kJgBtnY9v5ljh4jmUYVqeNL+t+SYg==
X-Received: by 2002:a05:6000:2302:b0:3a5:1388:9a55 with SMTP id ffacd0b85a97d-3b1f5813ebbmr2700827f8f.5.1751467976689;
        Wed, 02 Jul 2025 07:52:56 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e76e1sm16577247f8f.16.2025.07.02.07.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 07:52:56 -0700 (PDT)
Message-ID: <bd162903-6854-4b69-ad4b-89deb8e0d695@redhat.com>
Date: Wed, 2 Jul 2025 16:52:53 +0200
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
Subject: Re: [PATCH v1 27/29] docs/mm: convert from "Non-LRU page migration"
 to "movable_ops page migration"
To: Harry Yoo <harry.yoo@oracle.com>
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
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin
 <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>, Shakeel Butt <shakeel.butt@linux.dev>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-28-david@redhat.com> <aGVA2p5mUWoBDVKJ@hyeyoo>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aGVA2p5mUWoBDVKJ@hyeyoo>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ObX1Bqi833CLIiMZ1JY75rfmdBGEzwkvPiVe3hBja2Y_1751467978
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 02.07.25 16:23, Harry Yoo wrote:
> On Mon, Jun 30, 2025 at 03:00:08PM +0200, David Hildenbrand wrote:
>> Let's bring the docs up-to-date.
>>
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>
>> +movable_ops page migration
>> +==========================
>> +
>> +Selected typed, non-folio pages (e.g., pages inflated in a memory balloon,
>> +zsmalloc pages) can be migrated using the movable_ops migration framework.
>> +
>> +The "struct movable_operations" provide callbacks specific to a page type
>> +for isolating, migrating and un-isolating (putback) these pages.
>> +
>> +Once a page is indicated as having movable_ops, that condition must not
>> +change until the page was freed back to the buddy. This includes not
>> +changing/clearing the page type and not changing/clearing the
>> +PG_movable_ops page flag.
>> +
>> +Arbitrary drivers cannot currently make use of this framework, as it
>> +requires:
>> +
>> +(a) a page type
>> +(b) indicating them as possibly having movable_ops in page_has_movable_ops()
>> +    based on the page type
> 
>> +(c) returning the movable_ops from page_has_movable_ops() based on the page
>> +    type
> 
> I think you meant page_movable_ops()?

Very right, thanks!

-- 
Cheers,

David / dhildenb


