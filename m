Return-Path: <linuxppc-dev+bounces-9875-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FA2AED6E4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 10:16:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bVzXC1RtHz30Qk;
	Mon, 30 Jun 2025 18:16:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751271403;
	cv=none; b=EJyVhZsQeFhICa/ZQ8GKXucwoTvNu+B3SxTOzWcjn4Upr4ywd5qKRMMZ0sJBbpQzfq/o1KibHhf7uOCIH22oym06gz2T/URb6fhkcj4m8UBZ4/NWfAkYb7DHzhIBMYL8FsOHZWm6t9RFOls5GnRuneJ8rslWvgR5WgDV++YycsyYYhTDvj5gk7cC6pe8IkNmjuf+gHUHCXwJQZrA1jhYy0h9EaLmRpD/yn8Jku12DCGqLgvrDLQ0nwYiMX/uNdUy3vzQYKLUQzGqdaFsNwzzXys6gQy7V0QD+O1EWCizj7IDBLIXlzX01LNe6ZpJFRQVfebv/GasbMgyHm0BuT2G8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751271403; c=relaxed/relaxed;
	bh=6VPcb/KjKOGdw4gPzPctO4cFLASxj6NEbu79fmEsFHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GDEBwMapxrwVE1B58volVl2lRCgmZ63rSijE16dqXDU5wp2cAF43H/spY+x53BdRS21bhgEPP055EkEZTneotSgWM380RYr4iBTOs3k0LZDOOg+xXc1uz2r6R2cRNROJQ4w3rsCm91vn1InfgPMyWIUlAWfi1ekWrHpcuf4XoAOvbp2AvC2bCuCOVqBoGaPYpmDj7ylHj2ipqLCU8Psk3aGfQWc71PidyrTdK++QyXLrBEcVDnrv1bE2/F9+vKCR9ybL5mo2KNOgl0oZQUCs/gLOuBKkr2zSkGxjqAGth8rnedDnpGLRgNVQxovvjeSduqEPaL83R5QxTOufjLs7Jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NMW4i6RU; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NMW4i6RU; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NMW4i6RU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NMW4i6RU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bVzXB120Kz30Pg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 18:16:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751271396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6VPcb/KjKOGdw4gPzPctO4cFLASxj6NEbu79fmEsFHY=;
	b=NMW4i6RULpw9clh+M/3unH0QVujRhj4I20F5A4C4UUPLPY0Lr30cW6b/7kl0/HFCakT8ls
	kO5UKfloX3JXsm3V17QI8/vPjfJiPtjvRAaJKvvUg/+2NmDKFbZqEpxrkqI/mWOXDmHQym
	Gtb+EZhHvUXGH5kS/7/iXRC77uDAZHo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751271396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6VPcb/KjKOGdw4gPzPctO4cFLASxj6NEbu79fmEsFHY=;
	b=NMW4i6RULpw9clh+M/3unH0QVujRhj4I20F5A4C4UUPLPY0Lr30cW6b/7kl0/HFCakT8ls
	kO5UKfloX3JXsm3V17QI8/vPjfJiPtjvRAaJKvvUg/+2NmDKFbZqEpxrkqI/mWOXDmHQym
	Gtb+EZhHvUXGH5kS/7/iXRC77uDAZHo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-vPLBMZaLNLqa3dRE50kupA-1; Mon, 30 Jun 2025 04:16:34 -0400
X-MC-Unique: vPLBMZaLNLqa3dRE50kupA-1
X-Mimecast-MFC-AGG-ID: vPLBMZaLNLqa3dRE50kupA_1751271393
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450df53d461so15294245e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 01:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751271393; x=1751876193;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6VPcb/KjKOGdw4gPzPctO4cFLASxj6NEbu79fmEsFHY=;
        b=NDbWo2/PkQH7LSbV+xMmHjs6+GCrNkE+T37+atLMxCtZngMl5uaDZs7va4YPwPmypQ
         /iJrDf1yf2P87+JwJXbN/Mkzvuljde8LP9qh+wsAEKrfbLW6Sr0cFT45UCyVtouTCZcz
         mbxdpb/lvIjtY1bKMrMo3UmVjwAhpIZHkSIZFwDi8jFxYvDiq5S6e4BLbNS09H9sWbQn
         mDngUHJo5ctmGA018WqxDUz58lglhr8eYupkzt0sVwHMGDoXR/QFpXU7MFnCZg+9Qor6
         AEtJ4dMoH/uFEjFyFZa8k9xdduhNAqdMwUKvHNWGP2k2jrnzHYJnLz5HLNIgBfRHlleh
         g/Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXbwzQGCZFMrvJ8loOxJoIOyma7UHRmktoqKEDnNbJ2nMss1vWzSKioBpwLfISNB9UHtOGFe0GQCb+aGs8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxOyEdh5Us/9HdmMerCf33VpLOk0twsmcvQe0YWEIhJY0jiVLqV
	NjllUa3QqzWCXp8Cig1tEhku47mXYuTLuvhKa0xwAScUJ6MPZgpvfTpc+L1rxwolT3WB+SH/2jL
	+jJhS9SO9ZcJ5dfYNz81yaqOw58awr+CozzJSaqsaYdQpQd5Nb+SMARNBTwSZ11+FiLU=
X-Gm-Gg: ASbGncvYA6J7wgQozgszFx2Je88mOBZEI4I+1INEFGWTXyIRfnOMP0HQF31WqB4gdKB
	qOUxa2cLoU8QcnN/ObGLa1Zm4bQoM2HPSqRybHJD0v1WKPUUAvmTn/ocubOdtqSTV/ib+OQAwD6
	kxkEVn3EUsmwcHUe2YWKLspOUA8DfOepC5LXK1RZFnaG7ti7S3K5n/A5+8MB//uif4diwPx2DTl
	X9iO7qcgCnnTBFj4q84Tv+03Q8ToDAAqgAOuilg350FJ1VS+S+uKefrV0ymqzO/A67strDZ0y3d
	ajdYALLtnieJ/cTYaXzNeoKxzADSeAzWsUapWnTvVsaln00PPIKyiLu8hrFY+T+WuQjU3LoS14k
	clQq8EReu42WLKfEQyk2TBYjJIu2MFf5vUy0DJ3fw6u80/KN2wA==
X-Received: by 2002:a05:600c:1ca1:b0:43c:fa52:7d2d with SMTP id 5b1f17b1804b1-4538ee70c4amr100853005e9.20.1751271392658;
        Mon, 30 Jun 2025 01:16:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQl/WnpHN3yTrdW2FOwkHhUK3NtUpbFqlzDb3P/Ebo20sSqdyuNoSbnHSjaaA1DLihH3PoRg==
X-Received: by 2002:a05:600c:1ca1:b0:43c:fa52:7d2d with SMTP id 5b1f17b1804b1-4538ee70c4amr100852195e9.20.1751271391970;
        Mon, 30 Jun 2025 01:16:31 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f40:b300:53f7:d260:aff4:7256? (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e598ddsm9681774f8f.78.2025.06.30.01.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 01:16:29 -0700 (PDT)
Message-ID: <1fee1926-638b-4852-b98f-a0423a94b7f8@redhat.com>
Date: Mon, 30 Jun 2025 10:16:26 +0200
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
Subject: Re: [PATCH RFC 07/29] mm/migrate: rename isolate_movable_page() to
 isolate_movable_ops_page()
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
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-8-david@redhat.com> <aGJE3r5uSzRj8BsR@hyeyoo>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aGJE3r5uSzRj8BsR@hyeyoo>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MDGWBHjax4OWfmIszHa6zISrDUNxKbxJMQyGFvzZ-wA_1751271393
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 30.06.25 10:04, Harry Yoo wrote:
> On Wed, Jun 18, 2025 at 07:39:50PM +0200, David Hildenbrand wrote:
>> ... and start moving back to per-page things that will absolutely not be
>> folio things in the future. Add documentation and a comment that the
>> remaining folio stuff (lock, refcount) will have to be reworked as well.
>>
>> While at it, convert the VM_BUG_ON() into a WARN_ON_ONCE() and handle
>> it gracefully (relevant with further changes), and convert a
>> WARN_ON_ONCE() into a VM_WARN_ON_ONCE_PAGE().
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
> 
> Haha yeah, back to pages after folio conversion :P
> But makes sense.
> 
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> 
> Side question: In the future, maybe we will be unable to tell whether
> a page is compound or not, without first inspecting page->memdesc?
> (e.g., struct slab could have an order and a pointer to the head page...
> just imagining).

Right, it's not really clear what we would do in the future, but for 
anything that allocates a memdesc, that is possible.

We wouldn't even need the "head" + "tail" bit indication.

For things without an allocated memdesc (e.g., PageOffline), maybe 
compound pages will simply not apply.

Likely, the concept of compound pages as we knew it will go away.

-- 
Cheers,

David / dhildenb


