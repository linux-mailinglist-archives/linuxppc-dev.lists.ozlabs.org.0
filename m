Return-Path: <linuxppc-dev+bounces-11379-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEECB3842C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 15:58:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBmMK054Zz300M;
	Wed, 27 Aug 2025 23:58:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756303084;
	cv=none; b=l8fWIsYR+sysgx1RTulb9SNGSyjH/fEf/mqYyMWQcRgVQlhY6Lq1DoYyTAobSrRSlV5bFfL2fHzmDPGStQ1GuU3BWMOqLsIUcmNpJRSHOs91vm6tUnOgXfaq3coUtCiW5zdXQUviX2HzOLYhWyp74p98rS2tYiUOFpFWRaRQqIrZ0BAWyKLRbUyBrFJLePOh3jz9gWHY62NO92dKYxdFA5MDmHOQ/e5sutJPufRyNiwj0Sinf7azxOomdVTJoA1b0+O/EkUhXrXKgZoLioCVfPMBOfZ9CXLhotKZ0pXckuPW50ASkl53TBg89BstH34YoI0BABBRNDdzx6F+hyXL5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756303084; c=relaxed/relaxed;
	bh=0pMMKUGlgiVp4RUtrgX9pnDpZRGAoSX+x85uDyLNVMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VVY4/jq9MM5a7NhX9pYTodzUI1zh/HKK35D/VWL8pe4VW9NAtSns0o8KXpom2LmQY4P8KxGaaO35II0sGQ0ex81HDZ4P5t+LP1cnKL8TRypKMIPBtqmMwF7livfxE23fre0oztyFfogcHoElKrXxqiXssFZ/2yD6qNpYbbTwiq0oaTAXkqukvj1wdMIYerBlgXRrw4+lNAvLFfkJUfm73FIBxPSkp0Q1hyJKCewbA90RQIxcvQVNtAr93SUjA8lB+jiAbDKZvLsIdUM1Qy4z8mQDJjRI0425QOGaJCxZmivddvr1KLSynYPgjTWYrYL36RINxJvnsGb23V/MOydDzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Js86veGb; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Js86veGb; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Js86veGb;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Js86veGb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBmMH4tPRz2ySY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 23:57:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756303075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0pMMKUGlgiVp4RUtrgX9pnDpZRGAoSX+x85uDyLNVMk=;
	b=Js86veGbd5vwVFhfHFt7JdzoDeGP2aYeNF+9p4bLp8cMOiBOqseixZndpmhv3KdUStsk4W
	Wq1sMkqdUaakZVmBrdClrAbTk2rUSXqBfErtMIlHUsIKK4EFs/EJ+DfVuzqMQkaihJZYW/
	7T3diapazLC+kpjgEbS+JBtBjyHMwDg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756303075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0pMMKUGlgiVp4RUtrgX9pnDpZRGAoSX+x85uDyLNVMk=;
	b=Js86veGbd5vwVFhfHFt7JdzoDeGP2aYeNF+9p4bLp8cMOiBOqseixZndpmhv3KdUStsk4W
	Wq1sMkqdUaakZVmBrdClrAbTk2rUSXqBfErtMIlHUsIKK4EFs/EJ+DfVuzqMQkaihJZYW/
	7T3diapazLC+kpjgEbS+JBtBjyHMwDg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-RT8x5UT-NCy8LO13qkWeDQ-1; Wed, 27 Aug 2025 09:57:53 -0400
X-MC-Unique: RT8x5UT-NCy8LO13qkWeDQ-1
X-Mimecast-MFC-AGG-ID: RT8x5UT-NCy8LO13qkWeDQ_1756303070
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70dd6d25947so39604896d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 06:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756303070; x=1756907870;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0pMMKUGlgiVp4RUtrgX9pnDpZRGAoSX+x85uDyLNVMk=;
        b=vwgFxYFxiGKvo2xG2msEQ1YNbqJptaG0t53FjECZdX/eTFCwzpAuUXNsd5D3wS/WSc
         PZwl5f6gdMGg+kxCWXtUiipXIrPlDw5i49XBF6XOutcJgOX9gZcYbzlwdmnwgYNX9h9X
         t9rohp02NRrPuOjC6mAsEa/EHRtSBeyH4S9JV/+drKLQyhjzPCLdNSI1QvI+OGVUcpch
         bTv+x6t5G2DtvqZE/RqDGIIDTTip+v4NPivgr2wn9O+/MThK0JjPZbMQWGFpBscaaKsf
         QzNNB136l2IRhudmhRcTL+S2nnOJs1VkfWjv2rQF5SDWo3osArRgVmvM+AA9hVJJ7Mqq
         mpFg==
X-Forwarded-Encrypted: i=1; AJvYcCXjNf+QQpDajrpSqXeIPamH8EhEp3cb3MWij5E2NW8bZVIXEOTfgSajIL8sTyHPrOWA3QZ6Wpr/1jOBB/E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxyiJsDej9kaUq5/KoXnp59t7BXoK/rCqK2UVviL5+qce0Q4gpf
	M3aTk/eCVbN0lwU9v2uFWGZkiehGz8qH2fM0+bAqmGjPe+udGY/l+brHJo2XcZspRYQw5+mF0Di
	qcJc5QnCMcozOBjNchybVcrglN4Tv8mqYzSBugTDVPEl+s2iUE7oMIltppFTIYB2RbtU=
X-Gm-Gg: ASbGncs4DLTFlkzSaIjqY0UIip3h7ZxDGDzs/O8NnFzmhPOvjmar9K2bFq9zwM4ZHGu
	kk3NoAngv0ASqNAcYJKwwgfAuvI7n2LQTnceRwCEHMcXuARyvEB/aeRAgpVrRIBDpaMMfA7Cyq+
	NhgJO01RpYicGKpRAUhvi8bpR3K6BEWwlm/CyiK6sEg7Ncz8802RaQcA5f2j63+Az0UQ5kOCKSm
	9Rpg1NBRlGq7INaozQ2rEfJnXjXCrcwMOeOKQNF9au8NinGBABPwf5jKmSVJiJ6363sSKawRwTw
	6wY0q42YaFZUR8934jLflwAZODt0HN0+xlaIB1/TnkNCEO5U4Gn40enIZ54o4g==
X-Received: by 2002:ad4:5de9:0:b0:704:f7d8:7030 with SMTP id 6a1803df08f44-70d97358f0fmr265013346d6.50.1756303069809;
        Wed, 27 Aug 2025 06:57:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWXjl5tZ83UA1+ay+aJoeZJMgZd6GNpXCtIp6lIpLZV6EWrRjgPphDax1GYOjslh+fV0VbDw==
X-Received: by 2002:ad4:5de9:0:b0:704:f7d8:7030 with SMTP id 6a1803df08f44-70d97358f0fmr265012716d6.50.1756303069173;
        Wed, 27 Aug 2025 06:57:49 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70dc949bcc6sm42209626d6.8.2025.08.27.06.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 06:57:48 -0700 (PDT)
Message-ID: <0a844460-d898-418c-92b8-671f6156a2db@redhat.com>
Date: Wed, 27 Aug 2025 15:57:41 +0200
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
Subject: Re: [PATCH v3 06/11] powerpc/ptdump: rename "struct pgtable_level" to
 "struct ptdump_pglevel"
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox
 <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
 Lance Yang <lance.yang@linux.dev>
References: <20250811112631.759341-1-david@redhat.com>
 <20250811112631.759341-7-david@redhat.com> <87a53mqc86.fsf@gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <87a53mqc86.fsf@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Tblj_MAzEnW4FRG8AKT-Jnf3hcMboQs2pWubxv-6WSc_1756303070
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 26.08.25 18:28, Ritesh Harjani (IBM) wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> We want to make use of "pgtable_level" for an enum in core-mm. Other
>> architectures seem to call "struct pgtable_level" either:
>> * "struct pg_level" when not exposed in a header (riscv, arm)
>> * "struct ptdump_pg_level" when expose in a header (arm64)
>>
>> So let's follow what arm64 does.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   arch/powerpc/mm/ptdump/8xx.c      | 2 +-
>>   arch/powerpc/mm/ptdump/book3s64.c | 2 +-
>>   arch/powerpc/mm/ptdump/ptdump.h   | 4 ++--
>>   arch/powerpc/mm/ptdump/shared.c   | 2 +-
>>   4 files changed, 5 insertions(+), 5 deletions(-)
> 
> 
> As mentioned in commit msg mostly a mechanical change to convert
> "struct pgtable_level" to "struct ptdump_pg_level" for aforementioned purpose..
> 
> The patch looks ok and compiles fine on my book3s64 and ppc32 platform.
> 
> I think we should fix the subject line.. s/ptdump_pglevel/ptdump_pg_level
> 

Ahh, yes thanks.

@Andrew, can you fix that up?

> Otherwise the changes looks good to me. So please feel free to add -
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Thanks!

-- 
Cheers

David / dhildenb


