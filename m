Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4A863A2A3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 09:19:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLJKx3dHHz3cJq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 19:19:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S+oFkjKV;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S+oFkjKV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S+oFkjKV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S+oFkjKV;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLJJz1gM6z2xGn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 19:18:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669623533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ueiNL/RrPlD3vRod9MDAxJpgFwmJj0Jyg8USWk7yPz8=;
	b=S+oFkjKVP3mckzd7VBbvH1QuZTZol0q9wTWffdsPiXu+2nmhjaLmPhu8ziCyV0KCioRPJI
	5JQ7Ka6QTT7w/TcDd4C3+oasgr3fATIDGVWRdSU8qp6A71RrRGJewLWoV59J4JHfMOQ3z1
	2VHUt/gcI6faTsrG8illEYtRpXcU/30=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669623533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ueiNL/RrPlD3vRod9MDAxJpgFwmJj0Jyg8USWk7yPz8=;
	b=S+oFkjKVP3mckzd7VBbvH1QuZTZol0q9wTWffdsPiXu+2nmhjaLmPhu8ziCyV0KCioRPJI
	5JQ7Ka6QTT7w/TcDd4C3+oasgr3fATIDGVWRdSU8qp6A71RrRGJewLWoV59J4JHfMOQ3z1
	2VHUt/gcI6faTsrG8illEYtRpXcU/30=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-_Ftb84oTNae2uPyTh7debQ-1; Mon, 28 Nov 2022 03:18:51 -0500
X-MC-Unique: _Ftb84oTNae2uPyTh7debQ-1
Received: by mail-wm1-f72.google.com with SMTP id f1-20020a1cc901000000b003cf703a4f08so3477298wmb.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 00:18:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ueiNL/RrPlD3vRod9MDAxJpgFwmJj0Jyg8USWk7yPz8=;
        b=EemMFYOJzrHcYZ77eR1njMfBqIpPZHMimFDBiHBgRnfMvGmH5nxsULMEtKiIJ2tsBy
         1rhRCSiAacXq7ER4GayU42tLYx5xWYV03AUsYpTNabMoFORKs6JNR6tF5gZHEmrnlCUZ
         7C6giJJKauFaOS9t3LhWPgN6TS1t5gDdYn2tnxPyL6Y/fYL7+708E5xa/rTS5VgzCcE0
         ZyF5XvlIMrWeyFuiRIs1aBSjV3GqW+c86ijdC+MZDHnL8UnN0oB+cQ6TUYJNeSRCgAdo
         CtHgTcZRRSmDsxL7GnGIKlR4ECvQQHKYE+avGAOZRLWJoyo7kg2sHMXFpkP+FQTDyCUP
         sKXg==
X-Gm-Message-State: ANoB5pl7KRZb5fFntye0eclhVMgOpR7ZBB8K3Y/bSHy8wOZ9SQtAJ1ni
	WtRPH7qG6bS3QR0DDlTWgspF8mlsMggaLOurFOw3OTnoj+BTrHQk+PVmEXMijZ2hGUGT8rrzFo5
	9tH/BvI5op8ctclPAPzZXEW1Maw==
X-Received: by 2002:a05:600c:3587:b0:3cf:a9c2:2b04 with SMTP id p7-20020a05600c358700b003cfa9c22b04mr36262261wmq.152.1669623530561;
        Mon, 28 Nov 2022 00:18:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5KFgnMS9OgeX6iNUgB1p0xskb3yOxviUW4FnLaUffslFm3du7Shktyf0rRUHCATZ7f+3nFJA==
X-Received: by 2002:a05:600c:3587:b0:3cf:a9c2:2b04 with SMTP id p7-20020a05600c358700b003cfa9c22b04mr36262220wmq.152.1669623530122;
        Mon, 28 Nov 2022 00:18:50 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:9000:3d6:e434:f8b4:80cf? (p200300cbc702900003d6e434f8b480cf.dip0.t-ipconnect.de. [2003:cb:c702:9000:3d6:e434:f8b4:80cf])
        by smtp.gmail.com with ESMTPSA id g14-20020a05600c310e00b003a2f2bb72d5sm22518102wmo.45.2022.11.28.00.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 00:18:49 -0800 (PST)
Message-ID: <9d0bf98a-3d6a-1082-e992-1338e1525935@redhat.com>
Date: Mon, 28 Nov 2022 09:18:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH mm-unstable v1 16/20] mm/frame-vector: remove FOLL_FORCE
 usage
To: Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-17-david@redhat.com>
 <81fb0fa3-2e06-b765-56ac-a7d981194e59@redhat.com>
 <08b65ac6-6786-1080-18f8-d2be109c85fc@xs4all.nl>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <08b65ac6-6786-1080-18f8-d2be109c85fc@xs4all.nl>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>, linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linuxppc-dev
 @lists.ozlabs.org, Oded Gabbay <ogabbay@kernel.org>, linux-mips@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 28.11.22 09:17, Hans Verkuil wrote:
> Hi David,
> 
> On 27/11/2022 11:35, David Hildenbrand wrote:
>> On 16.11.22 11:26, David Hildenbrand wrote:
>>> FOLL_FORCE is really only for ptrace access. According to commit
>>> 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are always
>>> writable"), get_vaddr_frames() currently pins all pages writable as a
>>> workaround for issues with read-only buffers.
>>>
>>> FOLL_FORCE, however, seems to be a legacy leftover as it predates
>>> commit 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are
>>> always writable"). Let's just remove it.
>>>
>>> Once the read-only buffer issue has been resolved, FOLL_WRITE could
>>> again be set depending on the DMA direction.
>>>
>>> Cc: Hans Verkuil <hverkuil@xs4all.nl>
>>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Cc: Tomasz Figa <tfiga@chromium.org>
>>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>    drivers/media/common/videobuf2/frame_vector.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
>>> index 542dde9d2609..062e98148c53 100644
>>> --- a/drivers/media/common/videobuf2/frame_vector.c
>>> +++ b/drivers/media/common/videobuf2/frame_vector.c
>>> @@ -50,7 +50,7 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
>>>        start = untagged_addr(start);
>>>          ret = pin_user_pages_fast(start, nr_frames,
>>> -                  FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
>>> +                  FOLL_WRITE | FOLL_LONGTERM,
>>>                      (struct page **)(vec->ptrs));
>>>        if (ret > 0) {
>>>            vec->got_ref = true;
>>
>>
>> Hi Andrew,
>>
>> see the discussion at [1] regarding a conflict and how to proceed with
>> upstreaming. The conflict would be easy to resolve, however, also
>> the patch description doesn't make sense anymore with [1].
> 
> Might it be easier and less confusing if you post a v2 of this series
> with my patch first? That way it is clear that 1) my patch has to come
> first, and 2) that it is part of a single series and should be merged
> by the mm subsystem.
> 
> Less chances of things going wrong that way.
> 
> Just mention in the v2 cover letter that the first patch was added to
> make it easy to backport that fix without being hampered by merge
> conflicts if it was added after your frame_vector.c patch.

Yes, that's the way I would naturally do, it, however, Andrew prefers 
delta updates for minor changes.

@Andrew, whatever you prefer!

Thanks!

-- 
Thanks,

David / dhildenb

