Return-Path: <linuxppc-dev+bounces-9974-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD762AEF4BB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 12:16:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWf7C5hS1z2yqn;
	Tue,  1 Jul 2025 20:15:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751364951;
	cv=none; b=gonyezRbwSy8mt4/agivyx+IelR11xTt4Kdi8f8TAn9fxP0Z0QZjqKYE2vjCSVVD+QlxA4rcistcPqCr7NnIgu9/JKiltAAGFArw4cKfm1OnVlaHvMrZRgHqDTGCg6FyzyrfoV4wOW+8Djwc5qGNtHvjzuSuI9SSWRTH+hi3pclhxO00dp3pCRJ/rqKA6fsmQwI1dEQHJohM8AVJ9XiD7uTRDyvcl8jLI5gXxnljV4i70ol41uyFpN/xJq9rZJM+2daXeVo96cXniKm5TkIQSM5ESPkkKFXMRGpwsgCtwMEmRpHoWM8GU1AuCwEv1BpHAQJyPRLSuML9c4wxBu5Dwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751364951; c=relaxed/relaxed;
	bh=J4Wnv9upb7wAm0VhLvAftXFWY5tUZLgFJPfWZ7TYeAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BiaohMZzMPXh6JhpOA5xMcOymcm9U0J20kPGCWnqlUQKvYkqUs2i7SqrzIWGqgv4WLDp+3ljzw2kz6XtT1Jk/Ui6yqtxLJJemfvaLx10gV/v+uzcqMFJt5LcQRTMJYegXZRizt9CCPgGWwNvCnpbFkt0i6bMNFjU/DkueCfxBcW4eJJYZNVNWxlX02dDhc9t9FRmahLktcqTLMcd3kdtZFwOhxNRuITIn6xTNRoXA5y1GsAkzSYS/weQfMyfFnS5kaIL2Eh1rdxQsKwvWybn/vcOWt6OwD+VKtwf/sBaPYJKZG3/zFzmuJM+ECRI/hSe8W/KHD3SXTQNZB6im1+iqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X5guPKg2; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X5guPKg2; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X5guPKg2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X5guPKg2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWf7B5QFHz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 20:15:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751364947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=J4Wnv9upb7wAm0VhLvAftXFWY5tUZLgFJPfWZ7TYeAU=;
	b=X5guPKg26l+Q6nEdaQysq0ZIie5jvi5r/QLqP+/48Nj/aWUfAonR3yf87Dig8sPb+fuWAR
	Iet3220IzbRIwqvAvTseyAg8AAxJpSXM1FHs7oYLQiFdd59Kc1X+SDVjsifNe4gN+C7f0E
	xsfgxDx/OrmY8IpT9v+YdZGEPsBs/5U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751364947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=J4Wnv9upb7wAm0VhLvAftXFWY5tUZLgFJPfWZ7TYeAU=;
	b=X5guPKg26l+Q6nEdaQysq0ZIie5jvi5r/QLqP+/48Nj/aWUfAonR3yf87Dig8sPb+fuWAR
	Iet3220IzbRIwqvAvTseyAg8AAxJpSXM1FHs7oYLQiFdd59Kc1X+SDVjsifNe4gN+C7f0E
	xsfgxDx/OrmY8IpT9v+YdZGEPsBs/5U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-SiGeaDAQOiyedaoDlJH72A-1; Tue, 01 Jul 2025 06:15:45 -0400
X-MC-Unique: SiGeaDAQOiyedaoDlJH72A-1
X-Mimecast-MFC-AGG-ID: SiGeaDAQOiyedaoDlJH72A_1751364945
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a54a8a0122so2716176f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Jul 2025 03:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364944; x=1751969744;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J4Wnv9upb7wAm0VhLvAftXFWY5tUZLgFJPfWZ7TYeAU=;
        b=BtP7cMKGkfx7xc8BzIvQvPVoCtFI+lq6bK4GNA+rACMFDbgMrXcfhkG+2CcApAHqm4
         mFoqSw9m5IdFJpRTk1QvIBtNR33L8Stz4UxflaUPKKpF5gvoXvK7Kr50VsDfc1WKA7vN
         F5pMwRclP4TlhkNYk5qBUuX+CscBTg8RO0vnXcBr5L7qWlzk+vRKvnBtT5ZGNF1jhRnE
         tMkLxHVhd+eIzSlEZsa0YNtsrqpTrh+EvsVIZma7P3Hda254PmrY7KxUbBUfsLYyAheU
         r4gpWZAfuakEig6c6HDa5Ngwh09+cuQaZhOuvQqsXE/uurZ3IxqH+oVgqMv1BAGNPfev
         gWhg==
X-Forwarded-Encrypted: i=1; AJvYcCUzwKyFkPHP0gash5vksyhe0z/BQlXzmia353rRglPVxCbe0qcfjYqvNs+nShca6ROEhHjZPRJiJVLz/wM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwuIKFWY1ynIY8P0L9fdt/iHUvDuMtrroaA2cNzRvSgRZYEMWZp
	zk2n/zPhFiorMCrg/ak3id+HGYzi6CtJy+UT1GqnRgLS4fNinS0mTy5URxUAaOe+c5H02U1pyIg
	El89luVf+aTqBq/CR/NGkiseB2b4SEmZX7Gc0BGaj3L+JnL1rM6VuDdQtoJMSbyMqdRs=
X-Gm-Gg: ASbGnculbS002lkqsTZbckKlu8cpqkB2zkTzdU2mbXonp7uFo5rx3q1w0tBYw1ohK6L
	ABx+n224eOIzC6u0eSzFsDuyGseGHGZaRXSIFT/pksf3y0UHNqHp3PTeo1ouHaIT7kfQlIAu3ua
	uqcfvjv11muYEQic4mO+ixaw9CRRKECa3LYiKqlMFQwnswogi0E4gzhgcCeCtJdUM6tBQMENmwg
	CvXvZDu+GZwrc7Ko9mzAV3ebTIjyQDLdUKlxmZr+zcHcEQ3zKWn70MGZHj4PhyO+4rHEnARn7HI
	7MfhOnZnHgSGI+D4KVl109G0nz0RvKVpri4OzmrpOBmVqo+eL8SH0gF91ZOvVOsyaVhsFZ2A04V
	vwwGEEH8VkJmnDudNTgM7j2Pkjs7Sn3CSbm9r+3kaXZI/aPrEkw==
X-Received: by 2002:adf:9dd1:0:b0:3a4:f63b:4bfc with SMTP id ffacd0b85a97d-3a8ffcc9f0cmr13281186f8f.34.1751364944497;
        Tue, 01 Jul 2025 03:15:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBcN+deUjqfPetiJ/myiyifjCnu6+sl2jGKUFJOp6xe1gkfchpSA8Op3NtcLea2c6cf5QT6g==
X-Received: by 2002:adf:9dd1:0:b0:3a4:f63b:4bfc with SMTP id ffacd0b85a97d-3a8ffcc9f0cmr13281122f8f.34.1751364943981;
        Tue, 01 Jul 2025 03:15:43 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234be76sm191227645e9.15.2025.07.01.03.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:15:43 -0700 (PDT)
Message-ID: <3887c07c-db95-41a2-a3c6-c1199005cdd0@redhat.com>
Date: Tue, 1 Jul 2025 12:15:41 +0200
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
Subject: Re: [PATCH v1 10/29] mm/migrate: remove folio_test_movable() and
 folio_movable_ops()
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
 <20250630130011.330477-11-david@redhat.com>
 <100ed589-d3cf-4e31-b8d1-036a8bf77201@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <100ed589-d3cf-4e31-b8d1-036a8bf77201@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XALehmZvDTYh0OYcmrE9xoFQsKyGHxfZtGO_ZzPO1MM_1751364945
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 30.06.25 19:07, Lorenzo Stoakes wrote:
> On Mon, Jun 30, 2025 at 02:59:51PM +0200, David Hildenbrand wrote:
>> Folios will have nothing to do with movable_ops page migration. These
>> functions are now unused, so let's remove them.
> 
> Maybe worth mentioning that __folio_test_movable() is still a thing (for now).

"Note that __folio_test_movable() and friends will be removed separately 
next, after more rework."

Thanks!

-- 
Cheers,

David / dhildenb


