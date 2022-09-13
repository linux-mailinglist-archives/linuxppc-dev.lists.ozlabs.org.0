Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4B95B693C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 10:12:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRbmD2f24z3f2K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 18:12:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iBBRi6XA;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BWbavuNZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iBBRi6XA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BWbavuNZ;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRblW3JP9z30NN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 18:11:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663056691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JmFmooLgl+35+BTBj+s1lGG8DnrrIwlLQYKFeHvmKdo=;
	b=iBBRi6XA4cMF2Uq00koSHg9xgU9R1X1hssDQWg9UAVoTD/U3T6dVYp44Psqesz4a8rJ+MP
	/aWHmvrBBw7s5JoJs3r95DimPUkfb4aKVaHawuC0zaebou7M4fFj30DdmRMwds9q//JXj6
	UrtRPJpQ5xYFUFk6L0YbPO9Ua02Q73g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663056692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JmFmooLgl+35+BTBj+s1lGG8DnrrIwlLQYKFeHvmKdo=;
	b=BWbavuNZ7Cth0YzZkssV02Gx+Az5nD/7zZf2uCUbaGifbGtIPyIw7yTI/Q7TPWE/c9J6ph
	7db+lWJoUKofYK9AaUoyxFUKjlxQ/OHUY2L/pQ5nK59umJygSaQXazUC7jq5MMTA6WsQsF
	pLVe/BkQyMVRp+vsZV+ewjbS+gyWeak=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-0ePKBPgVMnaxadm6a5FsHA-1; Tue, 13 Sep 2022 04:11:27 -0400
X-MC-Unique: 0ePKBPgVMnaxadm6a5FsHA-1
Received: by mail-wm1-f69.google.com with SMTP id y15-20020a1c4b0f000000b003b47578405aso2763202wma.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 01:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=JmFmooLgl+35+BTBj+s1lGG8DnrrIwlLQYKFeHvmKdo=;
        b=jiQV17ck5Gs0jUw0+QdYDYqlZI152w5I7D7DCwR/GlRsNDt5SOeZ39EhtuDp66ECG2
         y8qqzV57ynRiora3Q7s4qkXGqfkc8iyZzkjoGeQrz6NtntCY4Z8IvK5+umlwnBMQscKH
         dm2pZjScTigD4tyQAJ8Iim+q8HRaRMQZV2E/FNyVctsoIZei9D0hABGnknTV5lxo4eKY
         52A0clbnQpQQO4d7ElUoYa4B8IeHpaS8HJn3VoZlLj92BLN8SN50Xqo85mQpk6AiL8TP
         5TbK4ZIlkF3J/CUoRribojYxmYwxLVDrrLdIuWMprVEXlyG2ZL9rCvpy4kIHKDeeCmIF
         ksZw==
X-Gm-Message-State: ACgBeo3qpcdPMjKCHe3DDYOd25yc3sJNXkBPKg3y4fVoor1QlKWjPg2Z
	KD+KlYixqyujPqi9eZiV1qmMqRdgAOE18nMbQESvH3hLf9A4vwGZSIXFOfV4LOfPyt5/8nGzgUi
	goJGjuG0yrm3xnAF5aJGaTzY4dg==
X-Received: by 2002:a05:600c:2c4d:b0:3b4:867f:1e6f with SMTP id r13-20020a05600c2c4d00b003b4867f1e6fmr1470231wmg.75.1663056686092;
        Tue, 13 Sep 2022 01:11:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6gvK/9o5ScYFHjDs446Lk12FBMcnw01AT8c1yJTTHwzIKu2JPOCYuyUxK2yCjziCsd7trgng==
X-Received: by 2002:a05:600c:2c4d:b0:3b4:867f:1e6f with SMTP id r13-20020a05600c2c4d00b003b4867f1e6fmr1470208wmg.75.1663056685746;
        Tue, 13 Sep 2022 01:11:25 -0700 (PDT)
Received: from [10.119.22.46] ([89.101.193.66])
        by smtp.gmail.com with ESMTPSA id p35-20020a05600c1da300b003a5fa79007fsm11515445wms.7.2022.09.13.01.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 01:11:24 -0700 (PDT)
Message-ID: <53390539-cfa9-7498-5b69-8fb8b307182d@redhat.com>
Date: Tue, 13 Sep 2022 10:06:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] hmm-tests: Fix migrate_dirty_page test
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20220913052203.177071-1-apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220913052203.177071-1-apopple@nvidia.com>
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Nadav Amit <nadav.amit@gmail.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, Logan Gunthorpe <logang@deltatee.com>, Ralph Campbell <rcampbell@nvidia.com>, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, huang ying <huang.ying.caritas@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13.09.22 07:22, Alistair Popple wrote:
> As noted by John Hubbard the original test relied on side effects of the
> implementation of migrate_vma_setup() to detect if pages had been
> swapped to disk or not. This is subject to change in future so
> explicitly check for swap entries via pagemap instead. Fix a spelling
> mistake while we're at it.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Fixes: 5cc88e844e87 ("selftests/hmm-tests: add test for dirty bits")
> ---
>   tools/testing/selftests/vm/hmm-tests.c | 50 +++++++++++++++++++++++---
>   1 file changed, 46 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
> index 70fdb49b59ed..b5f6a7dc1f12 100644
> --- a/tools/testing/selftests/vm/hmm-tests.c
> +++ b/tools/testing/selftests/vm/hmm-tests.c
> @@ -1261,9 +1261,47 @@ static int destroy_cgroup(void)
>   	return 0;
>   }
>   
> +static uint64_t get_pfn(int fd, uint64_t ptr)
> +{
> +	uint64_t pfn;
> +	int ret;
> +
> +	ret = pread(fd, &pfn, sizeof(ptr),
> +		(uint64_t) ptr / getpagesize() * sizeof(ptr));
> +	if (ret != sizeof(ptr))
> +		return 0;
> +
> +	return pfn;
> +}
> +
> +#define PAGEMAP_SWAPPED (1ULL << 62)
> +
> +/* Returns true if at least one page in the range is on swap */
> +static bool pages_swapped(void *ptr, unsigned long pages)
> +{
> +	uint64_t pfn;
> +	int fd = open("/proc/self/pagemap", O_RDONLY);
> +	unsigned long i;
> +
> +	if (fd < 0)
> +		return false;
> +
> +	for (i = 0; i < pages; i++) {
> +		pfn = get_pfn(fd, (uint64_t) ptr + i * getpagesize());
> +
> +		if (pfn & PAGEMAP_SWAPPED) {
> +			close(fd);
> +			return true;
> +		}

We do have pagemap_get_entry() in vm_util.c to query the pagemap entry.

Can you further, add pagemap_is_swapped() to vm_util.c?

I'll be also needing that (including a variant for testing a range) in 
anon COW tests.


-- 
Thanks,

David / dhildenb

