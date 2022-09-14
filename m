Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A80E25B85F0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 12:10:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSGKk4mtsz3bdk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 20:10:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EyQ9du6x;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EyQ9du6x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EyQ9du6x;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EyQ9du6x;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSGJz5kwJz2xZ7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 20:09:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663150155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tRy6NMXVqAdLaaelo9/KHPKagVual2K79eNRneTqSHA=;
	b=EyQ9du6xRmFX7YB9MtOcw0ux1gbmZFbMa870f0cREnvSY2IrABqTEJKu1seMY5Z6ZTAgA0
	BF8Gqmj8ht3sJ0Koqz7ckcfPs18wTEGvkTactiV0Ta1+Js/OVzQMzhGoQ1VJL8JT+taLEi
	aBjTYbA9zjRHMMROLQ6qkJecchuWkfU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663150155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tRy6NMXVqAdLaaelo9/KHPKagVual2K79eNRneTqSHA=;
	b=EyQ9du6xRmFX7YB9MtOcw0ux1gbmZFbMa870f0cREnvSY2IrABqTEJKu1seMY5Z6ZTAgA0
	BF8Gqmj8ht3sJ0Koqz7ckcfPs18wTEGvkTactiV0Ta1+Js/OVzQMzhGoQ1VJL8JT+taLEi
	aBjTYbA9zjRHMMROLQ6qkJecchuWkfU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-WNB2l02zPkuL_m5dcbrKmA-1; Wed, 14 Sep 2022 06:09:13 -0400
X-MC-Unique: WNB2l02zPkuL_m5dcbrKmA-1
Received: by mail-wm1-f71.google.com with SMTP id h4-20020a1c2104000000b003b334af7d50so10158799wmh.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 03:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=tRy6NMXVqAdLaaelo9/KHPKagVual2K79eNRneTqSHA=;
        b=dgMhWImptHuUKeGfOPxrJkHEZ8vXdhBT+opBNU86wQlNp9GBV7N8s5iwfXvb5LEh6+
         9SbXsjVKzRN9kFTzyLOrkJmFL4hFV5i7iIyeVeSrSiBDbqFumM2p27+Zm772PDvqSyKd
         gb5UvLydoCBXXljVIcwZieoVqjtxQYDaDmBDgjAXNed6I5ciXRzoV1ZHkQI8c7vX3WGA
         auE3vJGer3Ophn87SFUNrs+wkp6vjs/YgeoY9aRESLPhIWn/DPknsvl4+nHDhUvmqX99
         l1aiO3JtVaU8btsIWGRqvLEgadeGGklqAYRtOla0+a4+NEp10QTelVzXwAsey1SvwIVE
         QF+Q==
X-Gm-Message-State: ACgBeo3rrp4OUs1Bs18Y8RNLnWvwJOhZ2SlvWovTbCMhOm1LOV2MRCv8
	x7gA9WNPv923fJxqOGYMJnvPPXF488Hl9JKbEsGleOBjNqHpH6w3I/+Xx+MGPMai/Ara3v55CZU
	q3LgH+4XFlz8p9kkWaPbMdA/l0A==
X-Received: by 2002:a5d:47aa:0:b0:226:dbf6:680c with SMTP id 10-20020a5d47aa000000b00226dbf6680cmr20947366wrb.581.1663150152760;
        Wed, 14 Sep 2022 03:09:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6mUE0OyqSCSCmqM4mki5eCHDSHXk9TWtC5yJAaN4TbupXuzHkSxN3OSWGQKjEVNQGAFCI3Hw==
X-Received: by 2002:a5d:47aa:0:b0:226:dbf6:680c with SMTP id 10-20020a5d47aa000000b00226dbf6680cmr20947344wrb.581.1663150152500;
        Wed, 14 Sep 2022 03:09:12 -0700 (PDT)
Received: from [10.119.22.46] ([89.101.193.71])
        by smtp.gmail.com with ESMTPSA id v2-20020adfe282000000b00228dff8d975sm12603941wri.109.2022.09.14.03.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 03:09:11 -0700 (PDT)
Message-ID: <35003c8f-d777-b2b1-4d48-20f90ba66994@redhat.com>
Date: Wed, 14 Sep 2022 12:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] hmm-tests: Fix migrate_dirty_page test
To: Alistair Popple <apopple@nvidia.com>
References: <20220913052203.177071-1-apopple@nvidia.com>
 <53390539-cfa9-7498-5b69-8fb8b307182d@redhat.com>
 <878rmnn0jq.fsf@nvdebian.thelocal>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <878rmnn0jq.fsf@nvdebian.thelocal>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Logan Gunthorpe <logang@deltatee.com>, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, akpm@linux-foundation.org, huang ying <huang.ying.caritas@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13.09.22 10:20, Alistair Popple wrote:
> 
> David Hildenbrand <david@redhat.com> writes:
> 
>> On 13.09.22 07:22, Alistair Popple wrote:
>>> As noted by John Hubbard the original test relied on side effects of the
>>> implementation of migrate_vma_setup() to detect if pages had been
>>> swapped to disk or not. This is subject to change in future so
>>> explicitly check for swap entries via pagemap instead. Fix a spelling
>>> mistake while we're at it.
>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>> Fixes: 5cc88e844e87 ("selftests/hmm-tests: add test for dirty bits")
>>> ---
>>>    tools/testing/selftests/vm/hmm-tests.c | 50 +++++++++++++++++++++++---
>>>    1 file changed, 46 insertions(+), 4 deletions(-)
>>> diff --git a/tools/testing/selftests/vm/hmm-tests.c
>>> b/tools/testing/selftests/vm/hmm-tests.c
>>> index 70fdb49b59ed..b5f6a7dc1f12 100644
>>> --- a/tools/testing/selftests/vm/hmm-tests.c
>>> +++ b/tools/testing/selftests/vm/hmm-tests.c
>>> @@ -1261,9 +1261,47 @@ static int destroy_cgroup(void)
>>>    	return 0;
>>>    }
>>>    +static uint64_t get_pfn(int fd, uint64_t ptr)
>>> +{
>>> +	uint64_t pfn;
>>> +	int ret;
>>> +
>>> +	ret = pread(fd, &pfn, sizeof(ptr),
>>> +		(uint64_t) ptr / getpagesize() * sizeof(ptr));
>>> +	if (ret != sizeof(ptr))
>>> +		return 0;
>>> +
>>> +	return pfn;
>>> +}
>>> +
>>> +#define PAGEMAP_SWAPPED (1ULL << 62)
>>> +
>>> +/* Returns true if at least one page in the range is on swap */
>>> +static bool pages_swapped(void *ptr, unsigned long pages)
>>> +{
>>> +	uint64_t pfn;
>>> +	int fd = open("/proc/self/pagemap", O_RDONLY);
>>> +	unsigned long i;
>>> +
>>> +	if (fd < 0)
>>> +		return false;
>>> +
>>> +	for (i = 0; i < pages; i++) {
>>> +		pfn = get_pfn(fd, (uint64_t) ptr + i * getpagesize());
>>> +
>>> +		if (pfn & PAGEMAP_SWAPPED) {
>>> +			close(fd);
>>> +			return true;
>>> +		}
>>
>> We do have pagemap_get_entry() in vm_util.c to query the pagemap entry.
> 
> Thanks. I'd missed that, although `grep pagemap
> tools/testing/selftests/vm` suggests I'm not the first to follow a
> tradition of open-coding this :-)
> 
> But there's no need to perpetuate that tradition, so will redo this to
> use vm_util.c instead.

Yeah, we just recently factored stuff out into there. I'll be factoring 
out more in my upcoming tests from the madv_populate tests.

-- 
Thanks,

David / dhildenb

