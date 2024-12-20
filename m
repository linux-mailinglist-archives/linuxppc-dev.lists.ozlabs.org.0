Return-Path: <linuxppc-dev+bounces-4366-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1419F99F6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2024 20:07:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFH392hdzz30YT;
	Sat, 21 Dec 2024 06:07:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734721621;
	cv=none; b=R6HQ35ZsZm9xk866gbsiMafatyS+vcg37VO1XwHVEctaFtzuDypUUjzyxEypPAP78P6ft/+4edMdq8qlaHRdmmgamAqkERwjJ9Egr9SDu3KJnVJp7NdOlJmeTLU51YCYHTHTRSJtW9YejhPgxj7ehT1UjBnbeiHO4hMNAssHxbCnEB8Y524dT3KzmWfRg0ptbhOk3/q67lEgJsM/nq5EnHyJ3ZrFjlzbMfe2rMQk18GN//QiPs5Q6g7HcaDXpChaLZsg3C2KplX97J2NWKhQptMygwyf10v7pRt1804+gikY0C+yKNekw+WmJQSHpZnOBfrODAU67hL0cUlMH5ZbIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734721621; c=relaxed/relaxed;
	bh=RFkEsTciWcnTwL/TtonKd+lF734hGRTV7zLxkP7e2NM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RR0L66OjwyzZsNdRMUp3rpAFtDpShP21lFtQZh9BAMiEColYaPCFB8xVfNO5Fa6IX4k3cem1f5Ipp84EmK/UC32CG1+4+RD/DEbV+3cSzH2YnUikTSMQubtjx3DK/kaNVIWB/htWnhEfBC3blGE4cLCrRa5afTrIO46Vhba30VWEiHloP4gwPYSgNCRMBL0AWLR4jNBvFpPMvXhGuhwJtzTmj6X5kH2ni2/hZys/jcnASEDw4MxQ+mAbC4SKwj5b/d2MEQdKeacDYbdrWdXy+IyqoVGLYq0qh2L0TR1ku3gdm/Bcn8JD/9A9nmoruPJK9NK2uEHD2VxSCYbHInbpEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fgBnBrHM; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UGcRe4B5; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fgBnBrHM;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UGcRe4B5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFH381ZHzz30Wm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2024 06:06:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734721615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RFkEsTciWcnTwL/TtonKd+lF734hGRTV7zLxkP7e2NM=;
	b=fgBnBrHMG93kC8O+AvYgWyjXvtHg41t3iKU72MtnZa0JJK9ii7IHPYMvfUVZ9WIhPGjj76
	oR1awzLr4uJU2scWJaQ0p+RcJjC0MXlJvkcu0v0DUtkTZCpUCNKFy8bHYFzA5+6DtbYF+v
	UQMAbdt0zXXs0XMaOOqhRtGOKPkZpOI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734721616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RFkEsTciWcnTwL/TtonKd+lF734hGRTV7zLxkP7e2NM=;
	b=UGcRe4B5jr9lcMug7MfomWDg+yAGIRDI1BkI8w8qupEmnx/IFFX5p5Lwg0gyRckcEEHi1G
	cemBVYn6heLzVTe9CXWvxRYI9JJKhFRhsV7IyUQ8vRaEb3dOuw+D7/cwHEQEfUKQ2JyC9Z
	PMR8Xgu+1b214qHh7vxQYhj8hl/tZlE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-unez5nypN2WzI806FQy76Q-1; Fri, 20 Dec 2024 14:06:54 -0500
X-MC-Unique: unez5nypN2WzI806FQy76Q-1
X-Mimecast-MFC-AGG-ID: unez5nypN2WzI806FQy76Q
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43624b08181so12559345e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2024 11:06:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734721613; x=1735326413;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RFkEsTciWcnTwL/TtonKd+lF734hGRTV7zLxkP7e2NM=;
        b=l2Xn1nO5DpH8XmYS/o3yhyTHpmDig67kOV8biIxvZGGFrqKOmdE8/FpVWucmvybC9m
         OBMnHg5gpVLTooAST7uunvk4DWm0xjGGNYrK4eeJqXn4zvpO6X9Ig01iEa6LIovct8sP
         HVdAP5B/MsasKbFz6rLNM8siHRXmby7RpyBy1V4Ks4Obfp4YV3P3g6qdEAHsHW32NnXw
         Vf8pJiV1Xs8Zlh3Fj+u7X/RV0I4p2EG+fPvnUZoVTkxVdFNFsl/BDuW2dld5GHIinLIC
         W3GsMu/8/sw1bbhHpucJB0/64oNlE5HCm8OZ/MNi2r8KHkieEbvTW4Z5DQ6up0lKZ+Pc
         3nLw==
X-Forwarded-Encrypted: i=1; AJvYcCWmU0E/G21hsTcR+tqeFsRSxyTjqaNhCJ7Xyppl0L3HV8qvCFV94G3lm3emLSzju3h0qo0fFpVauvwwyxw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxky8KA9lqbyTtDiF9vxjAcJgR7qRAss2XLN1Q+e8jQ2F1pugQS
	WQfqrsLsMBKqexRJKgjrWLRiIT1ZLEk2LhkxAZCIzIL7Z6SnNDjAi0e+V7kJ9wmcAgMjUhytNDX
	3Ucl+y/JOHubipjkTw639bgoRNA6k/qTuGELDkNkwYTF39LvzfAwu37kVfICq+EM=
X-Gm-Gg: ASbGncujJZw+b8fG1iCpeCzvk/4GFf4vrzeOrn4Ae0oQmkwxztHkdHdpcxSvqZ/uku1
	Lf0YMxwY4kMrh8F1LNNANU65QRkQt9GeOCJuUNt/RfUzjW/sl5jDz5IFmF1SOOUYgcytZK/hz51
	m7FO7sS7y9oj3Amh13QgLuT2Tfip8a4LNd/z9IlE3F071Gy+/OK/S/RyUBCyC7L8sYmh2cXJaZk
	Tyq8zThMhhNnp/wIKIsCfDJ9pG1tGH+I5FReVokhGRgdUNNESD4QTrliya7bhp7s13JPNAyJnij
	oMq2z19p4FNn2Cz+a4drxVYQlk7kT5HciWYRpsIELrV+lk3K3kS02ZgNxCdzNI41RbXsUkzAKeX
	oy93CDAyN
X-Received: by 2002:a05:600c:511d:b0:434:fddf:5c06 with SMTP id 5b1f17b1804b1-436696fec16mr35270395e9.1.1734721612813;
        Fri, 20 Dec 2024 11:06:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERqIf8xGPJCOcwULreRIrmoeCTCQCdfJF2ZzCiP9Fl3O6hFSwQAHiUYx6RQs/AxsCHXPlxOQ==
X-Received: by 2002:a05:600c:511d:b0:434:fddf:5c06 with SMTP id 5b1f17b1804b1-436696fec16mr35270125e9.1.1734721612322;
        Fri, 20 Dec 2024 11:06:52 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:9d00:edd9:835b:4bfb:2ce3? (p200300cbc7089d00edd9835b4bfb2ce3.dip0.t-ipconnect.de. [2003:cb:c708:9d00:edd9:835b:4bfb:2ce3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366112e780sm53169585e9.0.2024.12.20.11.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 11:06:51 -0800 (PST)
Message-ID: <6254ce2c-4a47-4501-b518-dedaddcbf91a@redhat.com>
Date: Fri, 20 Dec 2024 20:06:48 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/25] mm/memory: Enhance insert_page_into_pte_locked()
 to create writable mappings
From: David Hildenbrand <david@redhat.com>
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 dan.j.williams@intel.com, linux-mm@kvack.org
Cc: lina@asahilina.net, zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com
References: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
 <25a23433cb70f0fe6af92042eb71e962fcbf092b.1734407924.git-series.apopple@nvidia.com>
 <d4d32e17-d8e2-4447-bd33-af41e89a528f@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <d4d32e17-d8e2-4447-bd33-af41e89a528f@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qggLSWI2hcJWZRcl5KBl7whAaS6ynfeICuCXdBDTTdA_1734721613
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 20.12.24 20:01, David Hildenbrand wrote:
> On 17.12.24 06:12, Alistair Popple wrote:
>> In preparation for using insert_page() for DAX, enhance
>> insert_page_into_pte_locked() to handle establishing writable
>> mappings.  Recall that DAX returns VM_FAULT_NOPAGE after installing a
>> PTE which bypasses the typical set_pte_range() in finish_fault.
>>
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> Suggested-by: Dan Williams <dan.j.williams@intel.com>
>>
>> ---
>>
>> Changes since v2:
>>
>>    - New patch split out from "mm/memory: Add dax_insert_pfn"
>> ---
>>    mm/memory.c | 45 +++++++++++++++++++++++++++++++++++++--------
>>    1 file changed, 37 insertions(+), 8 deletions(-)
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 06bb29e..cd82952 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -2126,19 +2126,47 @@ static int validate_page_before_insert(struct vm_area_struct *vma,
>>    }
>>    
>>    static int insert_page_into_pte_locked(struct vm_area_struct *vma, pte_t *pte,
>> -			unsigned long addr, struct page *page, pgprot_t prot)
>> +				unsigned long addr, struct page *page,
>> +				pgprot_t prot, bool mkwrite)
>>    {
>>    	struct folio *folio = page_folio(page);
>> +	pte_t entry = ptep_get(pte);
>>    	pte_t pteval;
>>    
>> -	if (!pte_none(ptep_get(pte)))
>> -		return -EBUSY;
>> +	if (!pte_none(entry)) {
>> +		if (!mkwrite)
>> +			return -EBUSY;
>> +
>> +		/*
>> +		 * For read faults on private mappings the PFN passed in may not
>> +		 * match the PFN we have mapped if the mapped PFN is a writeable
>> +		 * COW page.  In the mkwrite case we are creating a writable PTE
>> +		 * for a shared mapping and we expect the PFNs to match. If they
>> +		 * don't match, we are likely racing with block allocation and
>> +		 * mapping invalidation so just skip the update.
>> +		 */
> 
> Would it make sense to instead have here
> 
> /* See insert_pfn(). */
> 
> But ...
> 
>> +		if (pte_pfn(entry) != page_to_pfn(page)) {
>> +			WARN_ON_ONCE(!is_zero_pfn(pte_pfn(entry)));
>> +			return -EFAULT;
>> +		}
>> +		entry = maybe_mkwrite(entry, vma);
>> +		entry = pte_mkyoung(entry);
>> +		if (ptep_set_access_flags(vma, addr, pte, entry, 1))
>> +			update_mmu_cache(vma, addr, pte);
> 
> ... I am not sure if we want the above at all. Someone inserted a page,
> which is refcounted + mapcounted already.
> 
> Now you ignore that and do like the second insertion "worked" ?
> 
> No, that feels wrong, I suspect you will run into refcount+mapcount issues.
> 
> If there is already something, inserting must fail IMHO. If you want to
> change something to upgrade write permissions, then a different
> interface should be used.

Ah, now I realize that the early exit saves you because we won't adjust 
the refcount +mapcount.

I still wonder if that really belongs in here, I would prefer to not 
play such tricks to upgrade write permissions if possible.

-- 
Cheers,

David / dhildenb


