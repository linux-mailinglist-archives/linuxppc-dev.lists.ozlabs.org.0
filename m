Return-Path: <linuxppc-dev+bounces-9952-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93185AEF09A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 10:12:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWbNc70qfz3091;
	Tue,  1 Jul 2025 18:12:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751357536;
	cv=none; b=As4Xi8yiaXrnbmCC/+nkpHVFnR3un013+W8czapaEaEFhvygyJxhAN3XgCHXHRYdrhGDAHyQXQ8idNbN5gSU3SQGUPJSvZnJ4KrnE7fbY0UDlQH0Qp5+ItopE/Ajg2f1TbQ/gPP0qiczn6EbPkRVjy/GSBjCI3G6bDMdUuqBLHmU8c5CizLDq+RwlhAmwBafoynN4xqOfrdnYURJ7cMuoBD6MRtI1SM7+0FTY7sSqC0uyio7DqXvZ+t1T0dakLVp1bBwtG1T8n2bHimrWeYWIOWLyssnUo2C/Rlx92rTFbZhhgpbvm6wAhnu1V7bS532aYFfTbh/YH9hgPqtCPHYvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751357536; c=relaxed/relaxed;
	bh=XUVH4Y+OJJh1QuOp42YVy3obAL+tMMI3FUFoTmbRvmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aE5sHV0eYMFlb0sg1/8zwrIHN5pZ9Ah1IDke+IAiS2wNFI49WU6CgCYoyBKOGqitBcTZc8XQkuYD48FGcVjngjgc2I7TNyfK2lxA67pJwX4p6OfwM0+eQbRpHahjzG/4hyNtOIT3NIj72Q8rR41l011ecXl9V5wtMsmtikPFU1guXG0pofAltBR2/ATJ8azR9xCQF6PnnVYkhV8bVBEhurG+x+HNUxhQ3xbafx495gJaViaInpd2rhmnOlmsrSeIBLFzqOyYFz60OdfwuB6lOc+nC2w8DxncYUK/vWTU0AJb2Li/IIPTZa97oYjZhi/NZwPspeFT/Jc+aok24ncfkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P1G1qAhi; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P1G1qAhi; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P1G1qAhi;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P1G1qAhi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWbNc11Z2z2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 18:12:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751357533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XUVH4Y+OJJh1QuOp42YVy3obAL+tMMI3FUFoTmbRvmc=;
	b=P1G1qAhigc1rvScL3SLxe/ptJ87yrkrpdQs/cFehIqn1l8HVwlQ2PBwKnqHEUfD91K/tnp
	lpWeTB7LUVDms9DLvgcld9kuC3RnASi3Nw9eg5S74Tlkb1eLx7cwIZYnsb2QOmqHS+AkVB
	YY1l3aiY+Uw8CtojDQogJqQtzkPgz5s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751357533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XUVH4Y+OJJh1QuOp42YVy3obAL+tMMI3FUFoTmbRvmc=;
	b=P1G1qAhigc1rvScL3SLxe/ptJ87yrkrpdQs/cFehIqn1l8HVwlQ2PBwKnqHEUfD91K/tnp
	lpWeTB7LUVDms9DLvgcld9kuC3RnASi3Nw9eg5S74Tlkb1eLx7cwIZYnsb2QOmqHS+AkVB
	YY1l3aiY+Uw8CtojDQogJqQtzkPgz5s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-BCK8A4oKPoaDgDqT3xzJ-g-1; Tue, 01 Jul 2025 04:12:11 -0400
X-MC-Unique: BCK8A4oKPoaDgDqT3xzJ-g-1
X-Mimecast-MFC-AGG-ID: BCK8A4oKPoaDgDqT3xzJ-g_1751357530
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f6ff23ccso3566239f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Jul 2025 01:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751357530; x=1751962330;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XUVH4Y+OJJh1QuOp42YVy3obAL+tMMI3FUFoTmbRvmc=;
        b=oueQg6jsEf8gC1eX3/rCoJcSPCw9hiik2TGov8FvitRcktGnkl2v/ZDSpw93uzpo9F
         Y+fpXGOV+RHnUFF/kf784Ym0LIuw7PSVusS+B/I+KOh7reImECo18dAz5Q0ytOfoPZ8c
         VKE6Noq8MkhpOLJQwVCJxU/z9esmGHv1ifBNCebcqUeiboJ4QYD3rjBGFEtSeqPMptwu
         mLmbRng7aNVVXwHS4yNRAZmsPf5XEZlXe87p1Pfpon7UZGCn1W0ZU+fdI8owpG/9SWQI
         ekY+hmmQ2jdiYxRA0+8lw49uUPMwyYGz+Sv22/sTXhlBXY05nVGH9GPJ6l3jJrwQhx3v
         HlxA==
X-Forwarded-Encrypted: i=1; AJvYcCWqIuvCkyh9VhWdmWa2FoMX/7ouPhdJ+Ijv8KdOg0cB1j+xJSQ8RX12PAd1/AsIX+NBvNWXvYLkeMoKF/Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw7/eAjGtYw+GbreMJOKslPBnFbbMYmH6b5mrWROpYJ4D6Q/iIK
	WlCA4lr8WPLKo+byTDP1w1l+KeXQ8XYxd2m3GDywyvZV+OZypglnuLRuPgxl95R+go0QkWzw6FF
	c+nQ+ba/qSmFka/UXAN+JiHpDpolrKCKRdHPC4oL7d+BV8Ugh5wp6bUzikd7BfdiRU5c=
X-Gm-Gg: ASbGncskrq6LRsLhxjt+osTTX5gcx49eYPa46B8BOs8eEyniJ5c3z1G0jqOMnaM0RQ+
	X48J3Sq3qwim+oGeRcNc+EIo1pF8UkoUn+suWZJcLp880D6kBB3ZBpSYlqnEDDH+CVbe34/yrzq
	Mv7AVKNaPNwxQnpqrO5YaYvCiEa81RA0wQaN2tVEQKn/71IYhm5gi27KAlYJW7LcvNv83IbExlg
	xdEaTFp7gQuag/mxjmWNAbSxqMa/HUA7CA2Xe1UF/AwoZHZCYHp2EsDJH7PhiDXbfEDw58IOAm2
	DEByYpJdi5qsGffNqJh4vPStwdSX7YyR3K0536N42MQ20fRa/QRKTTe73rUKCtahfYHsrSWVFKw
	thSaROi4RdzWFZmA+aXx0GT6TrQmHeQqgrH9dz1dd+cZGTCvEwg==
X-Received: by 2002:a05:6000:104e:b0:3a4:f513:7f03 with SMTP id ffacd0b85a97d-3a917bc827cmr11229473f8f.44.1751357529776;
        Tue, 01 Jul 2025 01:12:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsHgnnUEFpXSYw4p3OElnQrmUS9uew02TXhj0OkRpaoY11Ud7n6qleNpZ0nt8POoq3yWyxJA==
X-Received: by 2002:a05:6000:104e:b0:3a4:f513:7f03 with SMTP id ffacd0b85a97d-3a917bc827cmr11229429f8f.44.1751357529270;
        Tue, 01 Jul 2025 01:12:09 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fab15sm12666380f8f.33.2025.07.01.01.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 01:12:08 -0700 (PDT)
Message-ID: <1618bfb3-fbc2-46c4-954b-f042803cace2@redhat.com>
Date: Tue, 1 Jul 2025 10:12:06 +0200
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
To: Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
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
 <595C96DA-C652-455F-91DB-F7893B95124B@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <595C96DA-C652-455F-91DB-F7893B95124B@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vohz2dIy0VBHkey-2Eb-XjoQksyZfHF8zEpnBAn6pdU_1751357530
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 30.06.25 18:14, Zi Yan wrote:
> On 30 Jun 2025, at 12:01, Lorenzo Stoakes wrote:
> 
>> On Mon, Jun 30, 2025 at 02:59:46PM +0200, David Hildenbrand wrote:
>>> Let the page freeing code handle clearing the page type.
>>
>> Why is this advantageous? We want to keep the page marked offline for longer?
>>
>>>
>>> Acked-by: Zi Yan <ziy@nvidia.com>
>>> Acked-by: Harry Yoo <harry.yoo@oracle.com>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>
>> On assumption this UINT_MAX stuff is sane :)) I mean this is straightforward I
>> guess:
> 
> This is how page type is cleared.
> See: https://elixir.bootlin.com/linux/v6.15.4/source/include/linux/page-flags.h#L1013.
> 
> I agree with you that patch 4 should have a comment in free_pages_prepare()
> about what the code is for and why UINT_MAX is used.

I can add a comment

/* Reset the page_type -> _mapcount to -1 */

To patch #4.

-- 
Cheers,

David / dhildenb


