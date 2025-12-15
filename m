Return-Path: <linuxppc-dev+bounces-14760-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B3DCBE472
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Dec 2025 15:28:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVMq913cWz2xrk;
	Tue, 16 Dec 2025 01:28:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765808884;
	cv=none; b=jSu2a7WjEd92MkGOezZhMxmx+KHCqqReP17rp665YID8J1R6PKSQbRh04yqevJIQ+QqoIYOqdhOE5nRoMD0JmdeYSQs1vIzBjUFLclgT9kvQix/2KWid1mNYSo7R79yiUyPHFKu7VjLuqKdpj6Xq8r35U3AEyKqVJsc2rq4nPs4A4ZJKbDgbTZu5ikFrJlaNW+FsLXjj15I2BtdPfKryzpuKTOKiApvKyaF2onuuoc4olbGcoqF9WArUhwWorR4z/4k/n43JWxbdTGzMNpJXTGfSQNAfL4PmtDU4RFFKNHdA2igsargpJnSXk9ME5Xjfn4gXQUuZz2qOg7z8UWEtKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765808884; c=relaxed/relaxed;
	bh=dcq1j6544AWTrXFS++mwFnDhDMKc8xPfVFYYuvKVzWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cGqpyCGDyfhBV09suFNvnuR0lRLslqxOxlzlcllgUJQBtucSrzVqACrtXOypG0rWvDb4CYXJTcKoFhoOkXOW+6NA1AUaJhYmwtf9lbx/CqYati+5K+c9ezgiDfIF92Na3mWqG9z5bFDVmk7Rczrx1mN9Ph90rXG+Me9hc7LcU08Nv3Oe6DDGT88MI3ci0Os+7Z3RzWGh1plg43BTnVrJ+frtmCtk42o60oh86dsSRfQadQAPX9oW54HX12qST4IYeL2BJC05cLhBz8qXEnoNvXgisD0mb0zwEBlzuqjyojr5nCqg+LJNS869QGgs61GxRdmXybXz0pdznq5K/u+gnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GbyYaZHY; dkim-atps=neutral; spf=pass (client-ip=209.85.128.182; helo=mail-yw1-f182.google.com; envelope-from=seakeel@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GbyYaZHY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.182; helo=mail-yw1-f182.google.com; envelope-from=seakeel@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVMq7529nz2xJT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 01:28:02 +1100 (AEDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78d6eb6956cso30123107b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Dec 2025 06:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765808820; x=1766413620; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dcq1j6544AWTrXFS++mwFnDhDMKc8xPfVFYYuvKVzWQ=;
        b=GbyYaZHYV8BYWk692MfGHyHkHa3Eo4KXcwHNH3d661dKJBESD+NdJpIJ/DYoAw0L/e
         QN/KC9pUjxjfk8dp4MxqGn3w6p2XDGYpal49ysGPYvZKr8gMPDQTrd5Pr/UVPkN1JI+I
         JbCVbQ1xx5/OReFf0kJLN6THgTqxjxdg4RbUTbdtvzcOdWx3Mea02itdQKGsNQ7deDkV
         MqLj8Oql3IU2+t3wj9pXt0nEAPsSpX5racZXntjVjk8a2VIXMiZY1on42vCgsa7svpo5
         DNDtjk5h5r5PracaQnoOWkXL20EkzIivQ2PCOvno6ak9R/iRyHOSA8oGLfs37XVznfig
         uJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765808820; x=1766413620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcq1j6544AWTrXFS++mwFnDhDMKc8xPfVFYYuvKVzWQ=;
        b=JqdzVutn5wnoKTvNm+71TtmbjmqB8rvHbe5crxJhMnln/Z00h1714MS+/4MxkVSixi
         T9zP4ZYO+tJ1SnqsmwzYvrTArKN1jcS3jrleZ5SQbuADtJ+Sb5R6gglFIzOtQP6NjuVp
         1wCv9lJaQEp+VQpUz3pyRSF7N+o5AOUNUTfMbmWK5SbgcPw0mkx+Epf5F3eEqONQRg8T
         NLVVO0UUVF1MoZjUaJK0AVJRHDjFTumL5DveSZAMdyz7H31+hZ0Uubr8+2V6ZY8SniXF
         IeD2XUWx22Rkivc9cpHwfqC9VB0/iQweL67eKPVDiwDxTYj7R4vdHmbvCCV+fNG0gxBi
         M95w==
X-Forwarded-Encrypted: i=1; AJvYcCUb6ciGO8tk0XcAMqPlhrQrttN0BLtwTplLfrYnslzZqtNAvO65gG/HPHsEkE0/yXyTxedEBAWg0u5MEF4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzBmv/Df1tR4m25PuJajYyQCEBFFTqv/ojTUceUUeLqLVoQPPrT
	Uf5Es8naXui6vxUQ4Dy+6MHAId3ji1/TvFdSWDekivpBYeEmhXnZs8oH
X-Gm-Gg: AY/fxX4vlciIbwz9tmIsmnoBbgtq7/srK+X91sEcT16U4SrC4nvUg9Nq6tF4Zlssu5K
	u5dCe2HGQ8hUMoELkP9Mp1PS1uQ+GMoQXo36eYT0owAkz2fhExu0iwtoJCJQ9hHwOUp5Zz1789S
	GOc1XNEUcjCS/4PsVpC0Ias+nW10tPOYE1z9oD0ApCZaOz8QKlyjEuA9H9gSaPs4K0GxadETLtq
	GcTJ2Hs2sq7O1n5IDshx8Apqsky2qQYOBq/7+i7mkhwwh19C9SRaraSiKoZAokd1ge1soPUu0lr
	Qs3pxeDUh47d3BsD4GY2NEihJYedUpM+6X5KdEZhWV6WYBOqF8KdosP2HznmXr09/CWrS7bf+4L
	W5+u0lciofYdL/xy7rwhw8asxdaRue50hsqTU48PxW3Gb5ym3wiRZyLspRl0X/lLyDyejz4k4/V
	cuR7d2pghYZ8VmkzHc7oVonRnd2mFuIKTOw+8RBQ==
X-Google-Smtp-Source: AGHT+IF4a51y57BzF37Vo9369cXMn6T0B92c877kSdcZ6vwpnS/AOu/LuwtwBmWQVHYV+/9EHDVqvg==
X-Received: by 2002:a05:690c:dd6:b0:787:e015:8561 with SMTP id 00721157ae682-78e66d8030cmr89937457b3.20.1765808819563;
        Mon, 15 Dec 2025 06:26:59 -0800 (PST)
Received: from [192.168.2.226] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78e749e55edsm28402847b3.33.2025.12.15.06.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 06:26:59 -0800 (PST)
Message-ID: <b9e3921a-2a54-4adb-b19c-802e2aa1aa75@gmail.com>
Date: Mon, 15 Dec 2025 22:26:42 +0800
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
Subject: Re: [RFC PATCH 1/2] mm/pgtable: use ptdesc for pmd_huge_pte
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, alexs@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S . Miller"
 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Thomas Huth <thuth@redhat.com>,
 Will Deacon <will@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Magnus Lindholm <linmag7@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org
References: <20251214065546.156209-1-alexs@kernel.org>
 <686b85ff-6a5a-4608-af97-55aee1582c5c@kernel.org>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <686b85ff-6a5a-4608-af97-55aee1582c5c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 2025/12/15 14:06, Christophe Leroy (CS GROUP) wrote:
> 
> Le 14/12/2025 à 07:55, alexs@kernel.org a écrit :
>> From: Alex Shi <alexs@kernel.org>
>>
>> 'pmd_huge_pte' are pgtable variables, but used 'pgtable->lru'
>> instead of pgtable->pt_list in pgtable_trans_huge_deposit/withdraw
>> functions, That's a bit weird.
>>
>> So let's convert the pgtable_t to precise 'struct ptdesc *' for
>> ptdesc->pmd_huge_pte, and mm->pmd_huge_pte, then convert function
>> pgtable_trans_huge_deposit() to use correct ptdesc.
>>
>> This convertion works for most of arch, but failed on s390/sparc/powerpc
>> since they use 'pte_t *' as pgtable_t. Is there any suggestion for these
>> archs? If we could have a solution, we may remove the pgtable_t for other
>> archs.
> 
> The use of struct ptdesc * assumes that a pagetable is contained in one 
> (or several) page(s).
> 
> On powerpc, there can be several page tables in one page. For instance, 
> on powerpc 8xx the hardware require page tables to be 4k at all time, 
> allthough page sizes can be either 4k or 16k. So in the 16k case there 
> are 4 pages tables in one page.

Hi Christophe,

Thanks a lot for the info.

> 
> There is some logic in arch/powerpc/mm/pgtable-frag.c to handle that but 
> this is only for last levels (PTs and PMDs). For other levels 
> kmem_cache_alloc() is used to provide a PxD of the right size. Maybe the 
> solution is to convert all levels to using pgtable-frag, but this 
> doesn't look trivial. Probably it should be done at core level not at 
> arch level.

Uh, glad to hear some idea for this, would you like to give more 
detailed explanation of your ideas?

Thanks a lot

> 
> Christophe
> 
>>
>> Signed-off-by: Alex Shi <alexs@kernel.org>
>> ---
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/ 
>> powerpc/include/asm/book3s/64/pgtable.h
>> index aac8ce30cd3b..f10736af296d 100644
>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> @@ -1320,11 +1320,11 @@ pud_t pudp_huge_get_and_clear_full(struct 
>> vm_area_struct *vma,
>>   #define __HAVE_ARCH_PGTABLE_DEPOSIT
>>   static inline void pgtable_trans_huge_deposit(struct mm_struct *mm,
>> -                          pmd_t *pmdp, pgtable_t pgtable)
>> +                          pmd_t *pmdp, struct ptdesc *pgtable)
>>   {
>>       if (radix_enabled())
>> -        return radix__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
>> -    return hash__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
>> +        return radix__pgtable_trans_huge_deposit(mm, pmdp, 
>> page_ptdesc(pgtable));
>> +    return hash__pgtable_trans_huge_deposit(mm, pmdp, 
>> page_ptdesc(pgtable));
>>   }
> 
> I can't understand this change.
> 
> pgtable is a pointer to a page table, and you want to replace it to 
> something that returns a pointer to a struct page, how can it work ?

Sorry for the bothering. Right, it can't work as I mentioned in commit 
log. I just want to bring up this issue, and hope you expert to give 
some ideas.

Thanks

