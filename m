Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C42859FA16
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 14:36:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCQZc4W5gz3bqn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 22:36:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NaFvxLC3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NaFvxLC3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NaFvxLC3;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NaFvxLC3;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCQYq641Cz2yZc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 22:35:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661344556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rJuT0qCBRs+JGxRnNUBPV/84rd6u301RNuYVKr9ovFg=;
	b=NaFvxLC3Wp21oc9aZ2KQWoVGanClYbRdQ4U/ZRcGVwU272D4ErmONVWFqLW3qP9Wd7GHh5
	EH8q7FuSl/6os0jLgtq4WeCRLZRNDIX/ZS50BxG8d/zPWHhn687wc0+A73cVn8GQVuyhjn
	uu/Rcm7ED6+gu2Mzm8Q7K+29K2rUAY8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661344556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rJuT0qCBRs+JGxRnNUBPV/84rd6u301RNuYVKr9ovFg=;
	b=NaFvxLC3Wp21oc9aZ2KQWoVGanClYbRdQ4U/ZRcGVwU272D4ErmONVWFqLW3qP9Wd7GHh5
	EH8q7FuSl/6os0jLgtq4WeCRLZRNDIX/ZS50BxG8d/zPWHhn687wc0+A73cVn8GQVuyhjn
	uu/Rcm7ED6+gu2Mzm8Q7K+29K2rUAY8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-466-Xu54SWRVOM-tpr74t0blrg-1; Wed, 24 Aug 2022 08:35:54 -0400
X-MC-Unique: Xu54SWRVOM-tpr74t0blrg-1
Received: by mail-wm1-f69.google.com with SMTP id q16-20020a1cf310000000b003a626026ed1so396088wmq.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 05:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=rJuT0qCBRs+JGxRnNUBPV/84rd6u301RNuYVKr9ovFg=;
        b=g6xK+jNNvRVog7x9DXdGc6DLibN2GHb1tqSuqMpCt4uNZzFnTtATOUbSWRoxUhFd+u
         ffKfJI248OutbzEc7bbZQrFsR7vIJUA8j/IEaWsuI2ndQ54y+wnBj5h+3cqu0QJMgn0g
         Y58FWnFtpwXtucw3kQQwMZso5QcDKuQniPIfMb57uh/AcXKLYyzk3y9+6GAckDtL60I0
         WKsRMiSIqVeODRrsW5eNg0W19xkFZp/3T2ebuJgYicaDkiQTn/Q3T+2KOMCusEfMXSqx
         16Hv/uLT01NdE8s9fMgZdm84PkeqzTD/ekFPJy6DKV/a0bsUzgDp1DGES9HogWebQMz5
         mwpA==
X-Gm-Message-State: ACgBeo0wxray1e+EYwEthtkt/9BLRVrFOmhykJj8PEFUAvEm/LaKHD4q
	lwddxv0BA3eeP2OH0iId1Aa/ld0gNERLQ7XnhX69n6ipVNaV5S/Yv2hV9Y3TAgntcxf5xJoMgNp
	OJJSB7s6QMQHEO4kfQO8XbKTiYw==
X-Received: by 2002:a05:600c:4e8c:b0:3a6:11e:cc08 with SMTP id f12-20020a05600c4e8c00b003a6011ecc08mr5172806wmq.198.1661344553402;
        Wed, 24 Aug 2022 05:35:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR44DedJ2+TvsAxiP57X1MmAV94j+vDVcHJ2tTdByck/P3U4Aea5bqXN86cTRa0XCN3QFAkAOA==
X-Received: by 2002:a05:600c:4e8c:b0:3a6:11e:cc08 with SMTP id f12-20020a05600c4e8c00b003a6011ecc08mr5172777wmq.198.1661344553097;
        Wed, 24 Aug 2022 05:35:53 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:c500:5445:cf40:2e32:6e73? (p200300cbc707c5005445cf402e326e73.dip0.t-ipconnect.de. [2003:cb:c707:c500:5445:cf40:2e32:6e73])
        by smtp.gmail.com with ESMTPSA id a3-20020a056000100300b002254880c049sm11802172wrx.31.2022.08.24.05.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 05:35:52 -0700 (PDT)
Message-ID: <6e31290a-5b72-ceb6-b11c-f8c1b066beaf@redhat.com>
Date: Wed, 24 Aug 2022 14:35:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/3] mm/migrate_device.c: Flush TLB while holding PTL
To: Alistair Popple <apopple@nvidia.com>
References: <3b01af093515ce2960ac39bb16ff77473150d179.1661309831.git-series.apopple@nvidia.com>
 <86b0622d-06eb-cfab-2ff1-8a0eaf823f8a@redhat.com>
 <87wnaxg6u4.fsf@nvdebian.thelocal>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <87wnaxg6u4.fsf@nvdebian.thelocal>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Logan Gunthorpe <logang@deltatee.com>, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, stable@vger.kernel.org, akpm@linux-foundation.org, huang ying <huang.ying.caritas@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24.08.22 14:26, Alistair Popple wrote:
> 
> David Hildenbrand <david@redhat.com> writes:
> 
>> On 24.08.22 05:03, Alistair Popple wrote:
>>> When clearing a PTE the TLB should be flushed whilst still holding the
>>> PTL to avoid a potential race with madvise/munmap/etc. For example
>>> consider the following sequence:
>>>
>>>   CPU0                          CPU1
>>>   ----                          ----
>>>
>>>   migrate_vma_collect_pmd()
>>>   pte_unmap_unlock()
>>>                                 madvise(MADV_DONTNEED)
>>>                                 -> zap_pte_range()
>>>                                 pte_offset_map_lock()
>>>                                 [ PTE not present, TLB not flushed ]
>>>                                 pte_unmap_unlock()
>>>                                 [ page is still accessible via stale TLB ]
>>>   flush_tlb_range()
>>>
>>> In this case the page may still be accessed via the stale TLB entry
>>> after madvise returns. Fix this by flushing the TLB while holding the
>>> PTL.
>>>
>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>> Reported-by: Nadav Amit <nadav.amit@gmail.com>
>>> Fixes: 8c3328f1f36a ("mm/migrate: migrate_vma() unmap page from vma while collecting pages")
>>> Cc: stable@vger.kernel.org
>>>
>>> ---
>>>
>>> Changes for v3:
>>>
>>>  - New for v3
>>> ---
>>>  mm/migrate_device.c | 5 +++--
>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>> index 27fb37d..6a5ef9f 100644
>>> --- a/mm/migrate_device.c
>>> +++ b/mm/migrate_device.c
>>> @@ -254,13 +254,14 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>  		migrate->dst[migrate->npages] = 0;
>>>  		migrate->src[migrate->npages++] = mpfn;
>>>  	}
>>> -	arch_leave_lazy_mmu_mode();
>>> -	pte_unmap_unlock(ptep - 1, ptl);
>>>
>>>  	/* Only flush the TLB if we actually modified any entries */
>>>  	if (unmapped)
>>>  		flush_tlb_range(walk->vma, start, end);
>>>
>>> +	arch_leave_lazy_mmu_mode();
>>> +	pte_unmap_unlock(ptep - 1, ptl);
>>> +
>>>  	return 0;
>>>  }
>>>
>>>
>>> base-commit: ffcf9c5700e49c0aee42dcba9a12ba21338e8136
>>
>> I'm not a TLB-flushing expert, but this matches my understanding (and a
>> TLB flushing Linux documentation I stumbled over some while ago but
>> cannot quickly find).
>>
>> In the ordinary try_to_migrate_one() path, flushing would happen via
>> ptep_clear_flush() (just like we do for the anon_exclusive case here as
>> well), correct?
> 
> Correct.
> 

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

