Return-Path: <linuxppc-dev+bounces-10015-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD3BAF03DD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 21:34:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWtXD3vPfz30HB;
	Wed,  2 Jul 2025 05:34:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751398492;
	cv=none; b=MqUHH/OXYhAzdxxI19qYj5HK2fEWLGfoo2f3X++NHdSHQDdMptZuvUC4EAV3VzB6JTpr00MmEnDx/+Jux+LJtOPZN+e11qwjJ/Kt5dJiw01Tyn4Xz3t3OVVG2lITqmlGkyN0KzQ5bRgFfFaxnxGwPE+iUlj9r0I/fZmwiz7NlQrDrL4yu8XWpmfpXF6vIIo57prNueulyAH28ObAEMGjfrD03niPwsh29OBy908OJmJG2FigPkVhiUU88ML/Q6yCuwtrhd1f0zpBIx4HCRm44Q2SXBsfR1G7dQGqm9vMX/0wP+r2eb8KQg45KmJVqdD/ifldtFeLcm/LKH8ByxfVNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751398492; c=relaxed/relaxed;
	bh=gw1ZFU7fseKrRoTgl7UAAoDGCdFd91K7Vdf4y+yHx50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y9omebGY8+7y/auobvXiDZ4vGgl1XFGmncZBrE5bxzzvdJQ+bpjZc0I+jxO1FPLQi8DzpGB7yidqhi5ZZDedz+85IToddBN+QApe9miRfayshv2X4LYzhMVWF0zAP/FyJc6OjLZeyPPka9OTNKKmXK7/i1NNd0ztWAgexanbFBDOhnTm+IKktPryFMCgh5iVrwcN1TBmdkhZbDbosFNXPrdVry3oWMm/zCeBWaModW0kD7Sfxn8Ju+wZbnceek2VnJW5lQN6zvXtwb8Wv0cFGaxIoBL5majYIxObbMqMAz3pxyyMPTuL20C/5kfMKvdUZBWJF4MwTaaHmIFAMvJ+Mg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fMMs7P47; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fMMs7P47; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fMMs7P47;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fMMs7P47;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWtXC4ndMz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jul 2025 05:34:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751398488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gw1ZFU7fseKrRoTgl7UAAoDGCdFd91K7Vdf4y+yHx50=;
	b=fMMs7P47Kf+15xnAbaFPRW79Dkjfiz/TqMXDJqJ+oD1qitaega8a81aiotapjiEF6HN+0B
	s4i7JcQ777y65VOoj2xGz58bM40fsx3zNtUhDpW4pcgPWiCdzBxZew8dOD2g6gWxksiyN3
	E/5b4IvNXtyGtjRibx3o9Spr8aqH9BY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751398488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gw1ZFU7fseKrRoTgl7UAAoDGCdFd91K7Vdf4y+yHx50=;
	b=fMMs7P47Kf+15xnAbaFPRW79Dkjfiz/TqMXDJqJ+oD1qitaega8a81aiotapjiEF6HN+0B
	s4i7JcQ777y65VOoj2xGz58bM40fsx3zNtUhDpW4pcgPWiCdzBxZew8dOD2g6gWxksiyN3
	E/5b4IvNXtyGtjRibx3o9Spr8aqH9BY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-oPFtRMiHMXaSg5dw6UR8GQ-1; Tue, 01 Jul 2025 15:34:47 -0400
X-MC-Unique: oPFtRMiHMXaSg5dw6UR8GQ-1
X-Mimecast-MFC-AGG-ID: oPFtRMiHMXaSg5dw6UR8GQ_1751398486
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451d30992bcso23280515e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Jul 2025 12:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751398486; x=1752003286;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gw1ZFU7fseKrRoTgl7UAAoDGCdFd91K7Vdf4y+yHx50=;
        b=EGmB4T1jycjddLH342hC7ybnB+nndTt8BG+EnPN0WspB0jjgr532YkoQS9EcY8M38X
         4l1zmUvg5S8TBciDIUH3itgwhbkKLTpwktJvS5dic8KHQYWvsf5w/62WEZyP67tprJdl
         qi78AqyBrE9OfYePXcrjVrYwUNsKAFLjU6Sw2dFLR0e9mpK+O+ZvTgJ8RMew0pXKxILl
         zAiixioYbmDKCH8zgiaOzjJSPOKwWzukalBb+vX7/2E5xSRDnQy2c/8w65dXnV32x5OK
         rxl+qTf+yaJVckyBgeEGvHGXMmG4qQS2kHMrA2YpN77W2Mg/pMA0F73pOapdKbncudL8
         bq+A==
X-Forwarded-Encrypted: i=1; AJvYcCV9HJokxB8+N74W8TxLLRi5mujGU76w5S1ZGK6yNbWREX0cS3fKOHLtUOX5fRLCmQ84BTKrJbe0dVXQ9mg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyHvCtl3/P0vQoAG7SMfTChw57PP2iMfJxx+EqtSFuU3S/zsEKI
	vRkbNA22BBgzl7YuLoe7XeLD+HE2zdTxYvnsBXVF/NE0cLazD0RszHJ12PjbZLa3LYE15PBmbQ0
	delEj5Nxo88l23E/XT0UNe+2ElhB2m6i0b14+XwZAoFSeCal1Gs4muZuRp2pIOpwCR3EdNWp1ZY
	gYCw==
X-Gm-Gg: ASbGncv0sMaTFukHOAkP85aOMT6NOIPFF9DQKPqD2Wk+5K+m50IQcO6XRo6FoprU4AV
	+eBloFzI3Vz3PV3/Dlc8KzKEW3OthKmAZLyhLyeCmw3zC2FWUB8MNJzHyhfG/aW0GlxqV5qGxdo
	58LxcbDMyWKStwUHBYK574NL9tkzHKycvKFaoahfFtBQFThhMZ0IcNzWE2Y+KvQ6gh2jcN13ZrC
	/PkvMgaLcqGAjNPf+7b2iqJcJC3Xtv09FYm4ORAVNzGM8aV18DX24KhOiA4SdO9hBkRv19aCTRB
	KkMNENfsfZzzPZqOhcaKYpsAWI9Ui0uBUObbjUlUS3HWbXeSIoVrDmdTVOPeTjyPIZfqL3pMQUW
	qZo2mkc2AASLR5j4vDSLI/3Ed05wTvCs1hAtOD+SgHcHQlMLZxw==
X-Received: by 2002:a05:600c:1549:b0:453:6146:1172 with SMTP id 5b1f17b1804b1-454a36d8d1amr4351325e9.3.1751398485589;
        Tue, 01 Jul 2025 12:34:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhEuTg4M0PQbefUA1jZ0F5TAuHLHbTJ/BFBL6Gk20G74uE8iX4U0pj6is7luyXAnqTfNAkbQ==
X-Received: by 2002:a05:600c:1549:b0:453:6146:1172 with SMTP id 5b1f17b1804b1-454a36d8d1amr4351025e9.3.1751398485099;
        Tue, 01 Jul 2025 12:34:45 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c57d7sm215278035e9.40.2025.07.01.12.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 12:34:44 -0700 (PDT)
Message-ID: <ac8f80bb-3aec-491c-a39c-3aecb6e219b2@redhat.com>
Date: Tue, 1 Jul 2025 21:34:41 +0200
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
Subject: Re: [PATCH v1 23/29] mm/page-alloc: remove PageMappingFlags()
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
 <20250630130011.330477-24-david@redhat.com>
 <8ff24777-988a-4d1d-be97-e7184abfa998@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8ff24777-988a-4d1d-be97-e7184abfa998@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qK8EaIGU6PDYW-dBnsNMOK60927GmWvfXnql_yy1OXM_1751398486
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 01.07.25 15:02, Lorenzo Stoakes wrote:
> On Mon, Jun 30, 2025 at 03:00:04PM +0200, David Hildenbrand wrote:
>> We can now simply check for PageAnon() and remove PageMappingFlags().
>>
>> ... and while at it, use the folio instead and operate on
>> folio->mapping.
> 
> Probably worth mentioning to be super crystal clear that this is because
> now it's either an anon folio or a KSM folio, both of which set the
> FOLIO_MAPPING_ANON flag.

"As PageMappingFlags() now only indicates anon (incl. ksm) folios, we 
can now simply check for PageAnon() and remove PageMappingFlags()."


> 
> I wonder if there's other places that could be fixed up similarly that do
> folio_test_anon() || folio_test_ksm() or equivalent?

I think you spotted the one in patch #25 :)

I looked for others while crafting this patch, but there might be more 
hiding that I didn't catch.

> 
>>
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> LGTM, so:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 

Thanks!

-- 
Cheers,

David / dhildenb


