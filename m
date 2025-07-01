Return-Path: <linuxppc-dev+bounces-9954-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B521BAEF0DB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 10:21:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWbbZ0Ct0z2y2B;
	Tue,  1 Jul 2025 18:21:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751358105;
	cv=none; b=jPTeVIhhInytt0piRXR1G8JddGkAMJqt1RrFTP/IPnPJq9IbpeapTtRXyHuN78HZrLMj2HYrjAULlx4afUilZetu68eH5HsSxCxfxQf/53TojcOsWKQbWzE8BSrcHBwYtxwIO4sLA/ZNbSimRiskUitrO3yqHJP9hb2i0FjdAyUYEe/KMAtP2oKc1HbC5J/akT8/VXt6QjbUR38+bC+lecU32dER4B4KH8hj26Vo8QfXVbnz6bOe6y/59B38vzF+q8wKxDi1I7YQqKAVz+4dj3i3Ne/q9e27RUd8Yeu/h7wH1kgtbeymVRaUsIXX1Esx2BL0JEiZnISDlqPm0X7MRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751358105; c=relaxed/relaxed;
	bh=cxU0Ib3KCq9mplKVbTFzx/9NyzfjMRXnNip2tiGw51Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nEJRgDgRztFPe8dwtp66JTUKgHsuxP6GWv2JX/L84MwHslF/XoMaZLCFua+WYw66kJYBNU98/bQRDJDjdARXVoLaELjWR7J27xTNwC0+msNLdVU2c/Fky7mIp33wMoSMFnkwIJu7Re9KCT8yJ+3RDbBmKrSUpBX6BZUm5/k4/59ydXWziOCkyJ0ckdXtn1FQ6suV8X2MxhOvQN8QEST+6TqDVbFzMlMz6tHJrUZ15V1/wrns83+743HONDPABEdkVwBMoEzRBkcWPbDIxIL2NitxnTetIeyDewyIF2QFqEF+b7jFQh0jNQR908PBU6kbkYwTSd394IsT5t6Bo098Ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NbTgrr3v; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WFRQ+Hd7; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NbTgrr3v;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WFRQ+Hd7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWbbY0ySNz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 18:21:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751358101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cxU0Ib3KCq9mplKVbTFzx/9NyzfjMRXnNip2tiGw51Q=;
	b=NbTgrr3vsmprePfFZE7vhIY7Bb1mRXxSgIFlPZuEjdgUhgEHfPYBQ/iiFuVSEqlk4Nu+7T
	YAQ2rhsvJRkiTkJD9h1UC3O9yiJUET0hlfHqicILe6FPL9+29d54C8grjsjYkynSLALWF7
	uD6kbQ5U2Bh4W85hTJ4k+XJg56jCek8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751358102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cxU0Ib3KCq9mplKVbTFzx/9NyzfjMRXnNip2tiGw51Q=;
	b=WFRQ+Hd7vMd7Whc2tkPhw+UcdrnRfqgIeOWSNkiDSQxPjx1fNmhwKCbKlAzybb47rAUa08
	eOlDK2gBVPopSi5CVEVmzQ3JIfrFosoa5KVw1BRZYDa49cnNZJdV6o6dhWs7I+US25B5dz
	hOrejrH0uTounQz6lhH6Za8V8ACyL50=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-f8djO9arPXWT-6xVjUdSgA-1; Tue, 01 Jul 2025 04:21:40 -0400
X-MC-Unique: f8djO9arPXWT-6xVjUdSgA-1
X-Mimecast-MFC-AGG-ID: f8djO9arPXWT-6xVjUdSgA_1751358099
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ade57fec429so224393966b.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Jul 2025 01:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751358099; x=1751962899;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cxU0Ib3KCq9mplKVbTFzx/9NyzfjMRXnNip2tiGw51Q=;
        b=ZFOnrn2qSi39LWMeCrJ3s8VAPaFg4/DAziheicd/aAO57DseNAnGvF2WMbm8CstFaC
         Bus3Hf6stPtc97m+mWpHd51kPpcD+hJZMsSoTaE8H6QzCdRXMTnOJO0Q8W1PKjbHBHSD
         cWq5XRLqAC/heF/mqrhU+duXQFjdLpNuVX4JkGX1qbTAfrT0dhwe4C2qOzPNOvfEPeMo
         DBcL2B7V+qIHP/AduMwC65f3dWJ7X8GRTuMc65/sE+cpMSAufpplkRorOdGtw66lyihl
         gMCdbGbpSeAgjfzFeGy8bZk9XJkVWJgus+0Ib5WPQD93atw/oXT/jwM1ibVRGKZIvMX5
         8PqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtdsqeRFDbwFgP2WS3odg5IHheqQivdUebvhKmrjdse6IojLNsXemBP86tbJ1vhtYcBT80oX/024QXk44=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwxObSkao4F1PCfSTCvnMAoW6Ko2Lks8B4YXYoEM4qtPujiUiTt
	JFJvO7fOa9nIs/PDQOn2rvC2q1HiNRHhqGy+hK7PKWcmW1iwY69ID1ADdR7AELz5Pj+7FtQ3U6I
	+KVthNMHGg5ymaNKp2iMn2z1fAaBZdMGGI2uq9P3Bv+I5zJujqu0o3c6CRqFsb9zQUrE=
X-Gm-Gg: ASbGnctERkr7WAeCwyHzxBlkgzs/pgBSN+A+db7JpksWy8kvml7ZaEVHtD24wwixaGg
	RYnhlPBNqgMI4PITxf/H3HX5OO+umKDoR2A09h5cS2CQq0T30n7UdujHbLX1JZN0GXYABmBwlq6
	CeLxwsDDfuqqWp5uBFhQmi3XrDt6CNZc4aXUzHSnAM8e2NAtLsyB1H46bz2oBPV5O4fY7xsbIB4
	ilD52yIdtZbQTeSk98dhiq5ochmYEAqM5wGNyAAyU7QQ7eoLJTwJbCQCcRb5bCbthlMVgzBkTSk
	a+WoN0t3WMFpTVzg/n6m/rWf3pvufZPp3oz+ar10IXa+sgmjM8IiZaFi6bWEcyt0SyfmnuJmsY/
	50oq996foxZH9nSF1JeWXyu7W0r51waeVq41Fp8s1pfCp+350Sg==
X-Received: by 2002:a17:907:78a:b0:ad9:85d3:e141 with SMTP id a640c23a62f3a-ae35016b6d8mr1560671766b.53.1751358098856;
        Tue, 01 Jul 2025 01:21:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQkcTzHwrlDjllUz0WAed9m3pQuwaJybhBgPe9TiWCmEVaIWiUlRTDH+dtrhI3ojD+spG9Mg==
X-Received: by 2002:a17:907:78a:b0:ad9:85d3:e141 with SMTP id a640c23a62f3a-ae35016b6d8mr1560664266b.53.1751358098284;
        Tue, 01 Jul 2025 01:21:38 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b42asm816876766b.25.2025.07.01.01.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 01:21:37 -0700 (PDT)
Message-ID: <00d8e03d-c36f-47b6-919f-00a411ea6fd8@redhat.com>
Date: Tue, 1 Jul 2025 10:21:34 +0200
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
Subject: Re: [PATCH v1 05/29] mm/balloon_compaction: make PageOffline sticky
 until the page is freed
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
 <20250630130011.330477-6-david@redhat.com>
 <6a6cde69-23de-4727-abd7-bae4c0918643@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6a6cde69-23de-4727-abd7-bae4c0918643@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JLUUrSfuxTRaoU9SSZxr9P5BHVcFfRxSt5KWywJjvhE_1751358099
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 30.06.25 18:01, Lorenzo Stoakes wrote:
> On Mon, Jun 30, 2025 at 02:59:46PM +0200, David Hildenbrand wrote:
>> Let the page freeing code handle clearing the page type.
> 
> Why is this advantageous? We want to keep the page marked offline for longer?

Less code? ;)

I will add:

"Being able to identify balloon pages until actually freed is a 
requirement for upcoming movable_ops migration changes."

Note that the documentation is extended in patch #27 to mention that.

> 
>>
>> Acked-by: Zi Yan <ziy@nvidia.com>
>> Acked-by: Harry Yoo <harry.yoo@oracle.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> On assumption this UINT_MAX stuff is sane :)) I mean this is straightforward I
> guess:
 > > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
>> ---
>>   include/linux/balloon_compaction.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
>> index b9f19da37b089..bfc6e50bd004b 100644
>> --- a/include/linux/balloon_compaction.h
>> +++ b/include/linux/balloon_compaction.h
>> @@ -140,7 +140,7 @@ static inline void balloon_page_finalize(struct page *page)
>>   		__ClearPageMovable(page);
>>   		set_page_private(page, 0);
>>   	}
>> -	__ClearPageOffline(page);
>> +	/* PageOffline is sticky until the page is freed to the buddy. */
> 
> OK so we are relying on this UINT_MAX thing in free_pages_prepare() to handle this.

Yes. Resetting the page_type -> _mapcount to the initial value -1.

-- 
Cheers,

David / dhildenb


