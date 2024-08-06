Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2B094959D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 18:33:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TD1X76OY;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T8JInWIR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wdf4B3MkMz3cXV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 02:32:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TD1X76OY;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T8JInWIR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wdf3T6kCcz2xWb
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 02:32:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722961938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oxnEgvMxeUyY0UmIGfmdIEh/CRjSbpkFLi3oxJz10Qw=;
	b=TD1X76OYwdiXFFcO+q2PKPRQK8QVqNngChz+5qMiFKfByVUtlop7VObgzl9gAG/hpZemIO
	fyPfPmYMjDX2p3eISrODIUMui+xSUyRNHxvfNuYMvrpHXesN2TWIUpGb8NLRG7TwjRKSzG
	8RrrlyEH0LRFccc9TOcfrPmFEaJhtYg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722961939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oxnEgvMxeUyY0UmIGfmdIEh/CRjSbpkFLi3oxJz10Qw=;
	b=T8JInWIRYX7j9j5Xb2LTkfOtyV+pxZsWglPue531XNpipX5oeUlRq13VTTUwynt55soc11
	I1cwzwzVUHojj6a47iTJsNdRjIQzgVVUfVUyuHCXuTr6ymLWfSD0cLEQUd+gmQn37nx1Cp
	cPAYjOgR9wq40OvKLFYk8b/Puhob2zE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-lWvN_HyFNEGqgSbNZrV_og-1; Tue, 06 Aug 2024 12:32:17 -0400
X-MC-Unique: lWvN_HyFNEGqgSbNZrV_og-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-428c2fbf95eso6271235e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Aug 2024 09:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722961933; x=1723566733;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oxnEgvMxeUyY0UmIGfmdIEh/CRjSbpkFLi3oxJz10Qw=;
        b=F1W2a1uo0KKLInH8LOvBVLNxj+Y353s/c+1JCbP18GloK/Tk3tJ1esIyTGZZYQ3GAR
         sFca6FqW914/DOVPdwqGFYiufavo1Vp3c1cJ+nDJJ69jNEBZYqJWg56GuXQ57XHiGato
         3mKnaaNcJuNZ0MTsO/f0PsuE8C6lPSjoesN/b9xJRMl62FUNxtDJapn7XkVkuFIIlHnC
         xdIrt6H8aoidVnfZbCpzXPSw9VZ+vaiLYm2YBaOS7ZVo2yKG9e0gY9eNA+a50qzpZ8Vx
         pQHbHbI97Zn2KOOmVIj9mV54i16J04i8n5LDO92SaG3Rnq5IU67nImmwc+FT7g97LvBx
         Y1wg==
X-Forwarded-Encrypted: i=1; AJvYcCW/PQ/1S0j9pV657MTaEo932FprxeOMzN5Nk3uWRZSOmCqXjwiS/6q9VBtFDIkkD6eoWr4myed3O8IlRy3cmvJjVDVBHhLjPeTsVwV3wQ==
X-Gm-Message-State: AOJu0YyT6H87Xp5swBT67AB5dim3NM54+0aorohorNzhG5W6Gp+Aua8H
	j2X5CJ3e4S0fvH1cpicbC6CJQvY4PAij6L1/+15OijAXORpKMkmmMTFUecDtid9JL4zeSYEYsN3
	8DbsNim+Kbc5wzPFTBBpDbBJUACeOa/77sVojzFN621L0vsHT4YK2Ll2BhBrZUYE=
X-Received: by 2002:a5d:6c62:0:b0:369:cbd0:61ff with SMTP id ffacd0b85a97d-36bbc0c4fadmr14415243f8f.9.1722961933185;
        Tue, 06 Aug 2024 09:32:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXQxvNbyf2inRdjFcizT7Se4zbWSkDp2Jj3apl69BhbFZNVFpkaWzyTErDQpS/96pxAysz4A==
X-Received: by 2002:a5d:6c62:0:b0:369:cbd0:61ff with SMTP id ffacd0b85a97d-36bbc0c4fadmr14415204f8f.9.1722961932633;
        Tue, 06 Aug 2024 09:32:12 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73f:8500:f83c:3602:5300:88af? (p200300cbc73f8500f83c3602530088af.dip0.t-ipconnect.de. [2003:cb:c73f:8500:f83c:3602:5300:88af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbcf0cc4csm13583582f8f.3.2024.08.06.09.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 09:32:12 -0700 (PDT)
Message-ID: <a149ee8e-e53a-4978-b5af-dbf43c99cf7b@redhat.com>
Date: Tue, 6 Aug 2024 18:32:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] mm/mprotect: Remove NUMA_HUGE_PTE_UPDATES
To: Peter Xu <peterx@redhat.com>
References: <20240715192142.3241557-1-peterx@redhat.com>
 <20240715192142.3241557-3-peterx@redhat.com>
 <added2d0-b8be-4108-82ca-1367a388d0b1@redhat.com> <Zq-Y3qs5_PZW04bt@x1n>
 <054324a3-bc77-426f-a751-06700aad394e@redhat.com> <ZrJO0aLVaeRoo8eo@x1n>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ZrJO0aLVaeRoo8eo@x1n>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Alex Thorlton <athorlton@sgi.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06.08.24 18:26, Peter Xu wrote:
> On Tue, Aug 06, 2024 at 03:02:00PM +0200, David Hildenbrand wrote:
>>> Right.
>>>
>>> I don't have a reason to change numa_pte_updates semantics yet so far, but
>>> here there's the problem where numa_huge_pte_updates can be ambiguous when
>>> there is even PUD involved.
>>>
>>> In general, I don't know how I should treat this counter in PUD path even
>>> if NUMA isn't involved in dax yet; it can be soon involved if we move on
>>> with using this same path for hugetlb, or when 1G thp can be possible (with
>>> Yu Zhao's TAO?).
>>
>> We shouldn't bother about it in the PUD path at all I think. Especially as
>> long as NUMA hinting doesn't apply to any of what we would handle on the PUD
>> path :)
> 
> Hmm, I just noticed that hugetlb was never involved.. but then how about a
> potential 1G THP?  Do you mean 1G THP will not be accounted in numa
> balancing too even in the future?

My best guess is that you would want a separate counter for that. The 
old one was just badly named ...

72403b4a0fbd even spells out "NUMA huge PMD updates".


"NUMA huge PMD updates were the number of THP  updates which in 
combination can be used to calculate how many ptes were updated from 
userspace."

... which doesn't make sense if you don't know how "huge" the huge 
actually was. :)

> 
> The motivation I had this patch in this series is I want to be clear on how
> I should treat this counter in pud path if it won't go.  And when people
> compare the two paths we'll need to be clear why there's such difference if
> I ignore it in pud path.
> 
> Per my current read on this counter, it might be an overkill to do that at
> all, and it might be simpler we drop it now.

Fine with me. But I would send that out separately, not buried in this 
series. The we might actually get Mel to review (was he CCed?).

Up to you!

-- 
Cheers,

David / dhildenb

