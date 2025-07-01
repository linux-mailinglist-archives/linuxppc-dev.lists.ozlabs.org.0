Return-Path: <linuxppc-dev+bounces-10013-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA3AAEFF74
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 18:20:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWpCR0MWnz30Ff;
	Wed,  2 Jul 2025 02:20:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751386802;
	cv=none; b=LYCwpcH8TJkUz5QZ4SlA0cz51tyNDXeCm0SUU5mkDH3GRQwL4IeLEn5+0bGY58lXCZzWFmV0HqJ0xCfWfxKFaFENm0LI/EjStY3PodeEAJqPi3JwDKzhWRIB74/B56uekdiLig17Oo7tICY+DC1x9e9urroNjC6GRKy0Ux8v3ECfHc0jaVPrW8vDwZbWjJdZyQURLaYbBTMycvoUoEpeEtzO4AkvXm0P7RZ4hpOpwZjWfBCCquSpLivrAE8rH+2aO7YKPVZYIaEw24DZqg56DIU1D6U76glGlVj0z7CpDOAi0tIKA43Le5/CKUGzr58RN6qGjbF/EmsKR8zxRt0C8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751386802; c=relaxed/relaxed;
	bh=prvx9QgvrkS6/HrNRjUGuyIwIbKu9TUrg+VFzDZXD4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GjMcAaQXAkwVdw19pq49xzQnGniIkOcTBjN9V0IVfRhW85Y3aCVIYQ/d21oVWjZ/GYf0JMEKJoCElMvroYkkxYqhOg+ggHfL0c5cUCQeN5z7BuV8OnSmwC9XuKeNEGpFAUTiLodTFh1ivaogndUVX7Kw0BVBPZ9F6mxW/ozE11TAB6eGKJ1Kl5XD58Dh8N+zbNrVs3Licm6onS40mhctf8dtoDoaa7UVLrYKR368NU75HwDpkQLGGemfRGN+y5LT7awIYdoqmhpmfxZp4uLt3SIYxAlyPJfjrm9dl/zR9NPW/teagbWOl2Ntzj4xHz2DzYtBYWxqARv8A+olgKK0MA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H4WQXoWy; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MVQPdtz/; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H4WQXoWy;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MVQPdtz/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWpCP69sdz30FR
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jul 2025 02:19:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751386796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=prvx9QgvrkS6/HrNRjUGuyIwIbKu9TUrg+VFzDZXD4A=;
	b=H4WQXoWykyFVS7IEpRflI2JHrNpkSMlHFxJ/551hG6cdS+pRWa8XuGbUHblMOTn2ahHG+B
	7AKYcNbhP/DcC0KQWexWhQmBCq9HsVijzCmO9KLszIRfAjaEoDitXoMfT/EA0Vte8y+BKD
	xRnsaI4HzPJtts3OIA3dXij+zUEaY/g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751386797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=prvx9QgvrkS6/HrNRjUGuyIwIbKu9TUrg+VFzDZXD4A=;
	b=MVQPdtz/W3WR0bas6Pp8MWZftFGyY5ET4a+KpmXW0/k0kqrIyWsqejA2k7N8rr6zAH0pO0
	r+U6gB3VAoeJ7GL+hhie1RDsnfqjVz+Zb5VAKvP5KYlTjYqHIWJsI0Qez1GpQtjlCSfSN/
	hWfl8dCPZNE+0lLBeZ/b9LUyHJwhxbQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-sf7h96AiMxqWHONXXLrsPw-1; Tue, 01 Jul 2025 12:19:43 -0400
X-MC-Unique: sf7h96AiMxqWHONXXLrsPw-1
X-Mimecast-MFC-AGG-ID: sf7h96AiMxqWHONXXLrsPw_1751386783
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a56b3dee17so3376706f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Jul 2025 09:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751386782; x=1751991582;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=prvx9QgvrkS6/HrNRjUGuyIwIbKu9TUrg+VFzDZXD4A=;
        b=Cpf9YgBCZyZzfPIFXU4keLwJKsvtYTtXEw5dA6wZVmo+tuyq0P1IAByVkwNOevTnCn
         rvPPTvsn/CCRFvBbd8ukt2XXNqHckG5AoOH+L6cBquIR9bJmnBJuDKp1oYXPRONNnGuf
         FNOKESoF50U9v3LTT/AmjzQ4DdcHK8Ev9Lq8Yz00rz2thFANFQta7Ac06p6FJAgBKI3l
         pFoAn38ybSQ4ygFNn/amNx5eiXGOEeb42TgA0KyBB9K3JW0p2kJDe8ABZ07VlMSObewG
         5asxmOsQRKWXhBQDMR+oYIRhAEP+BjzgCgBxAM/y39zc2jbsqo6XP+QwWquwQkichRFE
         MFDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaeQ4LVWhQTG4pBeMVeWKCGRxJKVMAP9MV2kC1JqFQ1s48TJro1eP36lGlxvyeLI25EgnuNXuCYXrlnkY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwgwFzcGwyMh+zf+vR5GTps8080hxvuram+7KaYAZDqd3ge7+zq
	bN05EtK2MDfGNKXU8pCi/z2iTDT4/8NW+lvml4KJnx2EqOCknrcxVh2x4iArXp4efaJj/oANcRw
	N6CIp4WEmMqQ3J2RN7MTZ4C07A0E9RC1i4L0U4UtjX2LIWWa+rYPTJ9zajd4cg68NpwM=
X-Gm-Gg: ASbGncttk2FNOISD6unyXi0h+7hVmWFvTX/0AopSTVbvigCLhziW/DqVGCXcvHhtk9U
	hyrfMK9ERmssfzN8xHpGPvZ7cczkFPbhVlGwBS48W0nQq0+ke3ErDbIvo5ADpt7RRHAMlN39NS1
	Dqp2F/fRH/m5PUQuCR2tXI+T+KShuzWVD2GAda9NvJVNk/OJk+PVNnuKe04cVX+WxH6+z3NjN7F
	gQT6XAxhHKhQWY/f9IVNsS1mmSPH1/yLYcqv6o2Kq96uTejUUdrjorNciSWEnAC+/I2pnrhvxAa
	3q9P369QOVAKkTEWEmvMEUKseQYs+Y7rr7qYtseocmx5sR3F0R+F8suRlTYDC9MfdavmNNUVs97
	Dy+ZT7dRQPH68tSM5D5Uo0muaBYn/nyF00IyV8pfukwF8vkiYsg==
X-Received: by 2002:a05:6000:643:b0:3a6:d95e:f37c with SMTP id ffacd0b85a97d-3afa162e3eamr2592070f8f.2.1751386782454;
        Tue, 01 Jul 2025 09:19:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLsheDAzVmPxelDGtXmBLJTIToWVZUdt5kz1Su7UknmC/bZ3D/wqAcBB9bZnWbrfYyDqyy5w==
X-Received: by 2002:a05:6000:643:b0:3a6:d95e:f37c with SMTP id ffacd0b85a97d-3afa162e3eamr2592019f8f.2.1751386781923;
        Tue, 01 Jul 2025 09:19:41 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52c8esm13813942f8f.55.2025.07.01.09.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 09:19:41 -0700 (PDT)
Message-ID: <b2e65056-bb64-4a50-91b8-3db2d94dcc78@redhat.com>
Date: Tue, 1 Jul 2025 18:19:38 +0200
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
Subject: Re: [PATCH v1 21/29] mm: rename PG_isolated to
 PG_movable_ops_isolated
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
 <20250630130011.330477-22-david@redhat.com>
 <443de491-4ade-45f3-9c9b-b4428b0f0aaa@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <443de491-4ade-45f3-9c9b-b4428b0f0aaa@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ggnmnpg65uit7yLewRfWZ_a2eWH1LfEk0zhOifAiGXs_1751386783
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


>>   PAGEFLAG(MovableOps, movable_ops, PF_NO_TAIL);
>> +/*
>> + * A movable_ops page has this flag set while it is isolated for migration.
>> + * This flag primarily protects against concurrent migration attempts.
>> + *
>> + * Once migration ended (success or failure), the flag is cleared. The
>> + * flag is managed by the migration core.
>> + */
>> +PAGEFLAG(MovableOpsIsolated, movable_ops_isolated, PF_NO_TAIL);
>>   #else
>>   PAGEFLAG_FALSE(MovableOps, movable_ops);
>> +PAGEFLAG_FALSE(MovableOpsIsolated, movable_ops_isolated);
>>   #endif
> 
> Nit, but maybe worth sticking /* CONFIG_MIGRATION */ on else and endif? Not a
> huge block so maybe not massively important but just a thought!

Sure, why not (goes into the introducing patch) :)


-- 
Cheers,

David / dhildenb


