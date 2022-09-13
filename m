Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 332F15B6B2C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 11:51:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRdyD5ZZDz3bcc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 19:51:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gDVmlbDJ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gDVmlbDJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mpenttil@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gDVmlbDJ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gDVmlbDJ;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRZf63kRJz2xdQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 17:21:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663053704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ylh9ncmGPJOsB78thI/3cAGzV/njJPkYV/mAwkDnPyI=;
	b=gDVmlbDJXUfXsuQGBiGKARgTX1WTp4oyGju5w1ihYXyGRvcNmBSJq83rznWP0iGG+MZp4k
	HwxORjssqNi3toMzXH2xzPv91GjcLSXJpFDn9xvp7ubYqS/SJTEXbUOoQn+hI2BVALhLj6
	4iMJoROGIoXTEot7kWd12FbBcQiwc+E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663053704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ylh9ncmGPJOsB78thI/3cAGzV/njJPkYV/mAwkDnPyI=;
	b=gDVmlbDJXUfXsuQGBiGKARgTX1WTp4oyGju5w1ihYXyGRvcNmBSJq83rznWP0iGG+MZp4k
	HwxORjssqNi3toMzXH2xzPv91GjcLSXJpFDn9xvp7ubYqS/SJTEXbUOoQn+hI2BVALhLj6
	4iMJoROGIoXTEot7kWd12FbBcQiwc+E=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-335-BlEu_mSnOC2W8Ikx5g8uwg-1; Tue, 13 Sep 2022 03:21:42 -0400
X-MC-Unique: BlEu_mSnOC2W8Ikx5g8uwg-1
Received: by mail-lj1-f199.google.com with SMTP id v4-20020a2ea444000000b00261e0d5bc25so2744761ljn.19
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 00:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ylh9ncmGPJOsB78thI/3cAGzV/njJPkYV/mAwkDnPyI=;
        b=yCznOhOCsj+gVScsyWGnjaA0zWkgjwTVL1I3emp9CpZLWcWifTAlYIed+RJIWQFelw
         JDuJhrR3ODrG81pxGrjskCDViNxa2Wob5HTG17XDTX3qTr9tl0yKcxAaFA3aL7lYlfAz
         NazqrPvVVsazIXvdft9LrZUZjf82FYQWQoDBa0szm+FynZD3f8G301dz27RgDNKx+OFr
         ixujTE7fWva2nWiB2qzL1yla+lQFG0ir4jheBSicEgEt7gagK+Pjx7CNHR1RXcIxGIgY
         cmnd68O8rwNfsrUSk9J3xqpIdsXwrIiWR4cKhkp7B8dcjd+YXPO3FUgvPqmCJoQEJd23
         so1w==
X-Gm-Message-State: ACgBeo2O/RdqG1BHUTXsivqXaOpY8BI2YetP0ji+PmPvl9wOPXliYu/b
	0NRa0+xyqUrXa6VtryMZQTbFUgksZygv31VCveUFVCWX4p+jlEE1hS31LvPieIBxoC5f/oCMGoP
	WwmGp4FAny3SN1j3HRP4RY9uG
X-Received: by 2002:a2e:a887:0:b0:26a:871b:a16d with SMTP id m7-20020a2ea887000000b0026a871ba16dmr9391607ljq.482.1663053701481;
        Tue, 13 Sep 2022 00:21:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6r+REe45FUvXnaTS9jVKKwZjNZFId41bNwnokkT3n1YTbgrJnWiH8KnqDSyjREPFSzn6xt4g==
X-Received: by 2002:a2e:a887:0:b0:26a:871b:a16d with SMTP id m7-20020a2ea887000000b0026a871ba16dmr9391578ljq.482.1663053700977;
        Tue, 13 Sep 2022 00:21:40 -0700 (PDT)
Received: from [192.168.1.121] (91-145-109-188.bb.dnainternet.fi. [91.145.109.188])
        by smtp.gmail.com with ESMTPSA id o1-20020a05651205c100b0048b0099f40fsm1522618lfo.216.2022.09.13.00.21.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 00:21:40 -0700 (PDT)
Message-ID: <64964b86-1fef-3550-a224-081f8e0e5e52@redhat.com>
Date: Tue, 13 Sep 2022 10:21:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] hmm-tests: Fix migrate_dirty_page test
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20220913052203.177071-1-apopple@nvidia.com>
From: =?UTF-8?Q?Mika_Penttil=c3=a4?= <mpenttil@redhat.com>
In-Reply-To: <20220913052203.177071-1-apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 13 Sep 2022 19:50:27 +1000
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Nadav Amit <nadav.amit@gmail.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, Logan Gunthorpe <logang@deltatee.com>, Ralph Campbell <rcampbell@nvidia.com>, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, huang ying <huang.ying.caritas@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 13.9.2022 8.22, Alistair Popple wrote:
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
> +	}
> +
> +	close(fd);
> +	return false;
> +}
> +
>   /*
>    * Try and migrate a dirty page that has previously been swapped to disk. This
> - * checks that we don't loose dirty bits.
> + * checks that we don't lose dirty bits.
>    */
>   TEST_F(hmm, migrate_dirty_page)
>   {
> @@ -1300,6 +1338,10 @@ TEST_F(hmm, migrate_dirty_page)
>   
>   	ASSERT_FALSE(write_cgroup_param(cgroup, "memory.reclaim", 1UL<<30));
>   
> +	/* Make sure at least some pages got paged to disk. */
> +	if (!pages_swapped(buffer->ptr, npages))
> +		SKIP(return, "Pages weren't swapped when they should have been");
> +
>   	/* Fault pages back in from swap as clean pages */
>   	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
>   		tmp += ptr[i];
> @@ -1309,10 +1351,10 @@ TEST_F(hmm, migrate_dirty_page)
>   		ptr[i] = i;
>   
>   	/*
> -	 * Attempt to migrate memory to device, which should fail because
> -	 * hopefully some pages are backed by swap storage.
> +	 * Attempt to migrate memory to device. This might fail if some pages
> +	 * are/were backed by swap but that's ok.
>   	 */
> -	ASSERT_TRUE(hmm_migrate_sys_to_dev(self->fd, buffer, npages));
> +	hmm_migrate_sys_to_dev(self->fd, buffer, npages);
>   
>   	ASSERT_FALSE(write_cgroup_param(cgroup, "memory.reclaim", 1UL<<30));
>   


Reviewed-by: Mika Penttilä <mpenttil@redhat.com>

