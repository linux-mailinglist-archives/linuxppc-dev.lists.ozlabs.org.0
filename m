Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1689263BCB4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 10:16:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLxXh6D3Zz3bTJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 20:16:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OvXTU6p0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IU7xG2px;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OvXTU6p0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IU7xG2px;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLxWl3X98z2yxQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 20:15:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669713326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kLZwFc2T16+VzxzvdeqP7dZ+DZAGfAAiD+u0EUrSQ8s=;
	b=OvXTU6p0Ct0GG3VEsw6AOZSjwusuY/Ng6cuNku1asLSrx9F6Mc66uLvd7qxMRAZbOAL+J5
	Q8DdnyjmltiPLfDTqjLE3SaozLtbjrW5pWS5w+X7WF2iZ/48KkE540YFRqNv9Zfo0kmyyh
	pze47cOZYmn8QXjChvz5wyc79I3BaI4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669713327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kLZwFc2T16+VzxzvdeqP7dZ+DZAGfAAiD+u0EUrSQ8s=;
	b=IU7xG2pxelXljMFqi8xHF+bmZxbEWM4ilThBeSE39E8xBm2qa027sL1g3fQwR1CtuWe4MJ
	0nUI/WVSnhozQuq8YZerPB6jSchEyQRjdzZZMpq0T8/YQ+na852WJ7Fg6wvNxN72rEDPcH
	IxWWUobLx2P27yrimf7KCXtNe25xGL8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-458-Y3eegD9eMlCHm4tIs5YqCw-1; Tue, 29 Nov 2022 04:15:24 -0500
X-MC-Unique: Y3eegD9eMlCHm4tIs5YqCw-1
Received: by mail-wm1-f69.google.com with SMTP id b47-20020a05600c4aaf00b003d031aeb1b6so9856934wmp.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 01:15:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLZwFc2T16+VzxzvdeqP7dZ+DZAGfAAiD+u0EUrSQ8s=;
        b=3PozzNGLz/Rn9TBdEFhOWGTawkxcSX+lIfAqsgrxgDkW1sRR305eSTmXQAXNxXvwEU
         eDfSAQf3B1bu0CcmvZ4Lf84JtYfnPZYP8Y3DYotL/7T5xuvk6n2yudu9rQHcHdU5lXsv
         zwUcwx5KaWqkKPvNO0bSPnIJyWzyqPWsWodEdWpPm+O/zhsWTdlbuHmPC6ymnQEi8mUT
         trqPZeW+vnjH2zWo1aKI9FelGhm7fy1juHedt3Vn+oIbvJqa7c0FnCwJSvwR8ELCvUiM
         aQftBXFnI4CYtHq6E0pe6Rw4VrxXlttrT11FirFFpnGNBgk63Z3DCH1CATMtHR8lDXCq
         zUxA==
X-Gm-Message-State: ANoB5pnb1dIekxLvh4hKpPRMIIY4lh3SwyQ7fSdIS0WoUIsDoWCKIGvo
	n4Q5rR6GpbThmo7XesXnzfaDJMAIScKDIg9rpjRUtcQ11+kpkJQQhk8O/reDY+Jt89489KxwWtG
	RyehFqpQ2xYPN0K/THGGon2GaKw==
X-Received: by 2002:a05:600c:430c:b0:3cf:8ed7:7124 with SMTP id p12-20020a05600c430c00b003cf8ed77124mr42243406wme.140.1669713323594;
        Tue, 29 Nov 2022 01:15:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5aMoFyhfTZRz6WGw0GcgDkcONZAiRyZAh+e0PFHXmVnEtFtgvwKaxuOXbIxhdoVgI1OB8H+Q==
X-Received: by 2002:a05:600c:430c:b0:3cf:8ed7:7124 with SMTP id p12-20020a05600c430c00b003cf8ed77124mr42243382wme.140.1669713323266;
        Tue, 29 Nov 2022 01:15:23 -0800 (PST)
Received: from ?IPV6:2003:cb:c705:ca00:3fb8:c253:3bf7:b60e? (p200300cbc705ca003fb8c2533bf7b60e.dip0.t-ipconnect.de. [2003:cb:c705:ca00:3fb8:c253:3bf7:b60e])
        by smtp.gmail.com with ESMTPSA id n26-20020a05600c3b9a00b003c6b70a4d69sm1498998wms.42.2022.11.29.01.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 01:15:22 -0800 (PST)
Message-ID: <abcba252-13a0-50aa-79ec-28b649c892cd@redhat.com>
Date: Tue, 29 Nov 2022 10:15:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH mm-unstable v1 16/20] mm/frame-vector: remove FOLL_FORCE
 usage
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-17-david@redhat.com>
 <81fb0fa3-2e06-b765-56ac-a7d981194e59@redhat.com>
 <08b65ac6-6786-1080-18f8-d2be109c85fc@xs4all.nl>
 <9d0bf98a-3d6a-1082-e992-1338e1525935@redhat.com>
 <20221128145927.df895bf1966cfa125cae9668@linux-foundation.org>
 <22b1107b-0acc-5772-a883-8f3c4682eb1b@redhat.com>
 <c2681582-1e24-7ed9-e4fb-e2dd17a93aed@xs4all.nl>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <c2681582-1e24-7ed9-e4fb-e2dd17a93aed@xs4all.nl>
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
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>, linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lis
 ts.infradead.org, linuxppc-dev@lists.ozlabs.org, Oded Gabbay <ogabbay@kernel.org>, linux-mips@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29.11.22 10:08, Hans Verkuil wrote:
> On 29/11/2022 09:48, David Hildenbrand wrote:
>> On 28.11.22 23:59, Andrew Morton wrote:
>>> On Mon, 28 Nov 2022 09:18:47 +0100 David Hildenbrand <david@redhat.com> wrote:
>>>
>>>>> Less chances of things going wrong that way.
>>>>>
>>>>> Just mention in the v2 cover letter that the first patch was added to
>>>>> make it easy to backport that fix without being hampered by merge
>>>>> conflicts if it was added after your frame_vector.c patch.
>>>>
>>>> Yes, that's the way I would naturally do, it, however, Andrew prefers
>>>> delta updates for minor changes.
>>>>
>>>> @Andrew, whatever you prefer!
>>>
>>> I'm inclined to let things sit as they are.  Cross-tree conflicts
>>> happen, and Linus handles them.  I'll flag this (very simple) conflict
>>> in the pull request, if MM merges second.  If v4l merges second then
>>> hopefully they will do the same.  But this one is so simple that Linus
>>> hardly needs our help.
> 
> It's not about cross-tree conflicts, it's about the fact that my patch is
> a fix that needs to be backported to older kernels. It should apply cleanly
> to those older kernels if my patch goes in first, but if it is the other way
> around I would have to make a new patch for the stable kernels.

IIUC, the conflict will be resolved at merge time and the merge 
resolution will be part of the merge commit. It doesn't matter in which 
order the patches go upstream, the merge commit resolves the problematic 
overlap.

So your patch will be upstream as intended, where it can be cleanly 
backported.

Hope I am not twisting reality ;)

-- 
Thanks,

David / dhildenb

