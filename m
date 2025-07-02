Return-Path: <linuxppc-dev+bounces-10024-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9A0AF0F8F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jul 2025 11:16:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXDmL4vB1z30FR;
	Wed,  2 Jul 2025 19:16:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751447794;
	cv=none; b=Z3AZNQBd/nQxagPZKnIR2rB9GPK8ag8+a616dvnst3OEnJHjpEeYipl3YBUhw/QhCnEMSDZUQgpZgJTxu4sSDGVK7/F+YnIFjxGudu7PhzVH9M3d02uDhUhPlT6DoADgYTcmkbdZeCbVE2mTmsIIVoOA6Ysl0r33W0u8BZnno3Kd8rTptCCG9jS4QxZ7pD66KMciDlOx9ltyRkumI7LneS5CmmaWskOa1U2piX7ujQpA3GzNd4Izj9J6b9/EGRik1JwbFWdnEQPzCrdraB3ghZ42YcoAN8PWc6XO9WRsaAy2k5rsfaIk3Wp0UHIOTnYTdURkK0ilKyHfsS1p5cKAVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751447794; c=relaxed/relaxed;
	bh=VhvKivkRdMQ8hNFJSsUo2kra//5VvojDXBm2vAANYo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hJC1pZd4HO647raX/NZbB/0bUnYSX0E3TLP22N+SwgzV47LvHKjzV4dX+ZPzP4Ee74owtSrOenRxQTH2WgjcnSPNQ5wOqvINq+O3ilwxTXDFuzM8J0XZRuJqowV+e1OD+0YX5dclBjOsy1FuWU9gZEk44q3fqsF7mdBX0qN6ZOYqUb3BeKSjh98vvZpCuXvm2D/RLHX4deJ7eiuMk9VAEdp/33dLFhTBkAIfOdE+J1Y5LCJhnsPpdWqUgkbhGUm32B1hTbABRF0SbUBSpDxP+5njFEz9cyWvChbsNYhMDiDseHqP/VrXmyNfaMv1pdPuPg/2nxQSGgmaQ4uarMoF1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RquSLFMf; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RquSLFMf; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RquSLFMf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RquSLFMf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXDmK5nKlz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jul 2025 19:16:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751447789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VhvKivkRdMQ8hNFJSsUo2kra//5VvojDXBm2vAANYo0=;
	b=RquSLFMf72Es7vAkpNh9ka9irtsuc1Aj2ABFQcetXGrVK3yOCqUUNiddjqr9quPSW8LDWO
	tKuZp6lGMZ8jwQyPxnKZmkxNxwc4K81JIw+0gWftK/hR+0bt4zFcTDWZTchg3A2yG5v5eD
	U6UHFE2Z4r9RfO2wIwM4wQopXY7jU0M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751447789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VhvKivkRdMQ8hNFJSsUo2kra//5VvojDXBm2vAANYo0=;
	b=RquSLFMf72Es7vAkpNh9ka9irtsuc1Aj2ABFQcetXGrVK3yOCqUUNiddjqr9quPSW8LDWO
	tKuZp6lGMZ8jwQyPxnKZmkxNxwc4K81JIw+0gWftK/hR+0bt4zFcTDWZTchg3A2yG5v5eD
	U6UHFE2Z4r9RfO2wIwM4wQopXY7jU0M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-gyePrI48MeeD31Sw99mAFA-1; Wed, 02 Jul 2025 05:16:27 -0400
X-MC-Unique: gyePrI48MeeD31Sw99mAFA-1
X-Mimecast-MFC-AGG-ID: gyePrI48MeeD31Sw99mAFA_1751447786
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a50816ccc6so2861462f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jul 2025 02:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447786; x=1752052586;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VhvKivkRdMQ8hNFJSsUo2kra//5VvojDXBm2vAANYo0=;
        b=vq43lds0H2k1/5gxW7x02qpeN6bKo44aYtLgT0lCFEC1SUJfb5N7cdX9IOCo4UKqLX
         hvA8txvx7De5VeOtTzPGEFSArpWLll7kZdubiN01RwFtFKizIQjGn9hGg6XVOvzIGoI7
         ZqqwcJqsU7Yt3hpCVpAFtDNTXSvqlUEYUmmUEZ2r2DUWfHBV10Ud2CUgI4hwlTevqQQW
         u4nKhL3gKblrh9KGQd1hMNwkyRxTxZj5+8hdGl/+ivU1wNgSUxckdXFg2KrLJrG/HXT/
         5l24Sbqe+O8g+TnwvBspeuTskwPiJ85JGZTSH3F41lXxuPPO87G9luQZkFvSdMV7vpBy
         qrQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsxu8zvwniiBFtbYbxQORPVcfzHpOmsRAM64AKrTYWjgrdjbLhG0AeVrEL3Id8A2stecEAPjVcKv3JqEY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyXFLcjLPn+1BQsz76LivS1s1PFmL1L6kl5rhXJ2LBgCV46S+N4
	N5GCcWdKs6idB87PJjX8Tu/KivN8dvaWM/xa4pK0uPA/7bCTioQJ8ZEhpZ4XbMgnZOm8SdBZZSm
	0hechaFShOqkLeD4kL2I6ukErA8Ct8fUCSSPU8XDOZQ7Q7WOeE8v0vgR35B4ZBnk/qUM=
X-Gm-Gg: ASbGncvnolcB0rYSypKPdz3CiGgHrmFY4KBBSTl/DHU7WFXnzZrPa6a9tFOKjhc2/Ja
	MHtCePbaCBEvauCNx9HZXjFYMiFC5MddLhrAxvTyhA2+289gX1tgWA54EXDu5UG70yVnJt9/rTU
	TxO3hZ80Kcae/QMzQwJp+dUMR4BKnosjHtozul05lwIiX3NmOE8FiUM5xBKJhlnaAZJPLsGCDkB
	niKeOvm53KLs1bGTZwAiyrtrhAh1qkLWpG2mF3DuKng0dHPQozo+pqcJBKyDLmeIPvP3eOGsMg7
	/rIzNQt5AhdVEMJ462OLk40hRi8lAIF73uuZ7reA7YeVNDO/CoSl7QA=
X-Received: by 2002:a05:6000:4a14:b0:3a4:fa09:d13b with SMTP id ffacd0b85a97d-3b201f7a27dmr1358432f8f.59.1751447786049;
        Wed, 02 Jul 2025 02:16:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp5EpgeCvR4tiZ/g3Grd0EyFOBAFYllhb6V2TK4S4696v0tuBql0sF0ZVkxL7xaoEGSd7dCw==
X-Received: by 2002:a05:6000:4a14:b0:3a4:fa09:d13b with SMTP id ffacd0b85a97d-3b201f7a27dmr1358369f8f.59.1751447785538;
        Wed, 02 Jul 2025 02:16:25 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7facf9sm15399967f8f.22.2025.07.02.02.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 02:16:24 -0700 (PDT)
Message-ID: <d3b6ca06-92d5-4989-9d5a-5a6f93300bcc@redhat.com>
Date: Wed, 2 Jul 2025 11:16:23 +0200
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
 <ac8f80bb-3aec-491c-a39c-3aecb6e219b2@redhat.com>
 <d7e29c51-6826-49da-ab63-5d71a3db414f@lucifer.local>
 <a6326fca-3263-418a-be3a-f60376ed5be0@redhat.com>
 <f080fd36-8587-42d9-a411-59128bcce195@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <f080fd36-8587-42d9-a411-59128bcce195@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aYtvs32G9DQ8XSnD4wyD3ODqDZwQ2CH8MJv_rEeYbWI_1751447786
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 02.07.25 11:09, Lorenzo Stoakes wrote:
> On Wed, Jul 02, 2025 at 11:02:21AM +0200, David Hildenbrand wrote:
>> On 02.07.25 10:49, Lorenzo Stoakes wrote:
>>> On Tue, Jul 01, 2025 at 09:34:41PM +0200, David Hildenbrand wrote:
>>>> On 01.07.25 15:02, Lorenzo Stoakes wrote:
>>>>> On Mon, Jun 30, 2025 at 03:00:04PM +0200, David Hildenbrand wrote:
>>>>>> We can now simply check for PageAnon() and remove PageMappingFlags().
>>>>>>
>>>>>> ... and while at it, use the folio instead and operate on
>>>>>> folio->mapping.
>>>>>
>>>>> Probably worth mentioning to be super crystal clear that this is because
>>>>> now it's either an anon folio or a KSM folio, both of which set the
>>>>> FOLIO_MAPPING_ANON flag.
>>>>
>>>> "As PageMappingFlags() now only indicates anon (incl. ksm) folios, we can
>>>> now simply check for PageAnon() and remove PageMappingFlags()."
>>>
>>> Sounds good! Though the extremely nitty part of me says 'capitalise KSM' :P
>>
>> Like we do so consistently with vma, pte and all the other acronyms ;)
> 
> Don't forget pae which now means something different depending on whether you're
> talking about x86-64 page tables or anon exclusive flags... :>)

Heh, I don't think we ever used PAE in the src + git log when talking 
about PageAnonExclusive at least :)

-- 
Cheers,

David / dhildenb


