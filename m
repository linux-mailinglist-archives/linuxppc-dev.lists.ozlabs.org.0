Return-Path: <linuxppc-dev+bounces-4359-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4329F9980
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2024 19:29:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFGCx64V9z30WQ;
	Sat, 21 Dec 2024 05:29:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734719373;
	cv=none; b=NTMR6HtlKE60s5GTWji/oTIZGsKrn90Gf6X/kPzH6iOFqMQrDN1jCNuqxXgMM2T2YoZ8pk2aVBuSwq6wwp2TtOXx5YstXKaALjrI7KLJuGQJBncTJddHCytXxoe9a1v4h7Qn6N9Bm9IBcaEHLJXrxmH1S83eXmuikpDG6aQVwYyAyLxdqpOGJBb/348nr2xFveACFTBs3Fu0+TINOzysL7BM2SKAJzqRg8hPiuMYqjUG3iOdFvOq89ueMfnTIz96BsEsnflTTIPfK1Jyv5EmRc9WcGcEPoS89ivkpP0O0OhXEZjho/uK4A23KTgUhwnM72OFCkr7bDEvLUi475ZQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734719373; c=relaxed/relaxed;
	bh=ShuO3TfEMw80wDehD7G0N/FfiqkQn0QjW6tjkfqEvXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Et9TxkhmqEz0LYJqU4G4M/zE9meDCMdrynRzBTHbFCkhoex7+ZOsIvpRLnPzPniZawej4rtbWNJK4godSjgeL8O1zQXzFhXyIErWfwX+5Lu/HV0UaK1kfsg7aQFi7BBtebVRiYoLNK62vlUdLs2loMxkd2A8YOSCMTClfotgtqvOr9mLqNbOexE5LXUde9q/846HqEx/6MESJji5ROXtCfpfc/VeIBG9D+m3KdkMqRcBS7uPoxjppBXo3YSqnPrQW+6UfCVyqRMSSFtl6BjigNWH757T1EdQCq22z2uECmqLwsHF3yqz8ScaLVER73yAgP2LsRVO78aF2tjZmbFY8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PF/Vjwab; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PF/Vjwab; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PF/Vjwab;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PF/Vjwab;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFGCw3LNJz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2024 05:29:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734719365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ShuO3TfEMw80wDehD7G0N/FfiqkQn0QjW6tjkfqEvXA=;
	b=PF/VjwabwE497xwinJz7HQIYphlW37QUqsbgJJd7jT4z4p3aoY3B7Eur3BEzFqk/h5rDb6
	kiBfBC/S17fIWTpvfSFm8LLPrkGe+u7rQXKwh/Ej18aISIHR8vblzz2MzizInIPxXNKSGz
	GYcI9SpM7zpvAhfw8cLhkcGw71vZdhA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734719365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ShuO3TfEMw80wDehD7G0N/FfiqkQn0QjW6tjkfqEvXA=;
	b=PF/VjwabwE497xwinJz7HQIYphlW37QUqsbgJJd7jT4z4p3aoY3B7Eur3BEzFqk/h5rDb6
	kiBfBC/S17fIWTpvfSFm8LLPrkGe+u7rQXKwh/Ej18aISIHR8vblzz2MzizInIPxXNKSGz
	GYcI9SpM7zpvAhfw8cLhkcGw71vZdhA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-1oqlTns-N9OJFT15z9AP6g-1; Fri, 20 Dec 2024 13:29:23 -0500
X-MC-Unique: 1oqlTns-N9OJFT15z9AP6g-1
X-Mimecast-MFC-AGG-ID: 1oqlTns-N9OJFT15z9AP6g
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385d80576abso1424134f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2024 10:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734719362; x=1735324162;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ShuO3TfEMw80wDehD7G0N/FfiqkQn0QjW6tjkfqEvXA=;
        b=aq0BDnIgPQcW7/5EGCmeflyaaJLTQ5cpnkAOEcPjU/gqJzMivgXKGcmBCn+q03WS+U
         YahoXyL+G4/tv9Ib0iOrNFS+CSIOlo4q8JybnrNNRzGmnCIjWQNAoirrXSy7JmfavzVB
         QeGIcdCZs/tm8EL9DsmJ9DUm5FztKzeGsWStx4CX/LkdYKWR6ZqxnVMLac2pR/Ns5H2m
         +fvpQYVaUR4pqf0IYM0M/PtX7s5YGuUL3cuLa4kDHgrc47eVPtOAv0l5CgBXJHF1nywb
         Wa/i4Pj3DD3X/+bKxGDqyU7V/PbrAxyrhdYQDRQn0UfwQ9WYvmWpqQHJSXxM83/svsSl
         W0iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKVq69ZhOAqEMbbYqpHbIFaSNRYPDbeIKAWb0TEb6jXFxHrAhVY5ULdBIJ3O721TsiYr8bcbyOo/9WuWE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy354qzecVP/Mir75WQh+URVk1c2FG8gddKl+yzd512KCoO5mu3
	g1sIkb/jZbnWUM3wMuVk9/yMKW0vdPEZE9O4K2SwNPYxtfVsm9Dhun9UcG7VOlWVhQxpWX+hV8e
	QsC3k49LFfxgGfNeUpcW5Pbt1w8u6xJ0nuz2vqkRKsgxoQF5Lz8hpAP99dpYyhGc=
X-Gm-Gg: ASbGncuxFaKRtjTahwlDbdfqIZWCWDVIaONxdj0V2tCYrAzdYJ52N2Nvh0K3jY3+RlW
	GrfoQUuIB3pUBpQCtwluNToLk+cxJMqnMI2NCJK5yfU9LmFSyBkxJtqn2NSxGxAnwG2KH3Afman
	sp55bSQox7i/iCm7LEkjHHxgDrmWkjizQb0vIPx09WmXIK6ArxDPn2w7xuaxmYzu6c+Jn+TTE1s
	L2uisU6yO6OgZHBYEA7MRLEQY6uWF8H5VFikB+7SvWMIES/+PISAMoviIgoG06pnYyhNgaWXiru
	WVP/8GydWKWZ7rf+YX8M2QO3GyHAz8Qjp4em6tGOnUf837DNakuBWUm64XrohZZL9hdIhT2wgzE
	2HqrJQQ/g
X-Received: by 2002:a05:6000:18a9:b0:386:3835:9fff with SMTP id ffacd0b85a97d-38a22406d43mr4852365f8f.59.1734719362353;
        Fri, 20 Dec 2024 10:29:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4GC48OmfJNltY6Ek7vleCwhpqJySNAWqKHGuZFUvMe2tCVDpmaDR4IIQ/DXZtWNsmnqadZA==
X-Received: by 2002:a05:6000:18a9:b0:386:3835:9fff with SMTP id ffacd0b85a97d-38a22406d43mr4852317f8f.59.1734719361985;
        Fri, 20 Dec 2024 10:29:21 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:9d00:edd9:835b:4bfb:2ce3? (p200300cbc7089d00edd9835b4bfb2ce3.dip0.t-ipconnect.de. [2003:cb:c708:9d00:edd9:835b:4bfb:2ce3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b441bbsm85576885e9.40.2024.12.20.10.29.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 10:29:20 -0800 (PST)
Message-ID: <4446a9c9-613b-4303-9a06-686fb10af363@redhat.com>
Date: Fri, 20 Dec 2024 19:29:18 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/25] mm/mm_init: Move p2pdma page refcount
 initialisation to p2pdma
To: Alistair Popple <apopple@nvidia.com>
Cc: akpm@linux-foundation.org, dan.j.williams@intel.com, linux-mm@kvack.org,
 lina@asahilina.net, zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com
References: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
 <aaa23e6f315a2d9b30a422c3769100cdfa42e85a.1734407924.git-series.apopple@nvidia.com>
 <359a1cf2-c5b0-4682-ba3c-980d77c4cfdb@redhat.com>
 <bk6cmiubwvor6gevit3wgl4k66xxpfcv6swmfrtvxnjnuojqkx@yow3pmyuxozw>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <bk6cmiubwvor6gevit3wgl4k66xxpfcv6swmfrtvxnjnuojqkx@yow3pmyuxozw>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iC7Ne0apsURo7x-EnnA5xNf8W7bPQ5kKj_LIBEeUJXk_1734719362
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


>>
>>
>> But that's a bit weird: we call __init_single_page()->init_page_count() to
>> initialize it to 1, to then set it back to 0.
>>
>>
>> Maybe we can just pass to __init_single_page() the refcount we want to have
>> directly? Can be a patch on top of course.
> 
> Once the dust settles on this series we won't need the pgmap->type check at
> all because all ZONE_DEVICE pages will get an initial count of 0. I have some
> follow up clean-ups for after this series is applied (particularly with regards
> to pgmap refcounts), so if it's ok I'd rather do this as a follow-up.

Sure. For ordinary memory hotplug I'll also convert it to start with 
refcount=0 soonish, so there we're also simply pass 0 to __init_single_page.

-- 
Cheers,

David / dhildenb


