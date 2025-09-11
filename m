Return-Path: <linuxppc-dev+bounces-12041-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D66B53B2A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 20:14:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cN5L44r5Hz2yGx;
	Fri, 12 Sep 2025 04:14:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757614460;
	cv=none; b=huPKRI639ozx5/2O68dnb6bPninKjD3bmDYaH237twMUNSWrQ1K0bvpBSGvAUJuN4FWkQGS32OQf5clils+3DcdlzTqEbLilrqJmRWSA869xPBBZegiHbJtHvtXb3ZSyN3jWLnbIWezPImhAmgR6jLEfrxdgnDqnsXTGmC2UowYWcyGdPvWALnCsnYYc8vsO+yjcxT1kgTa30/lNjQMSxwZfv25Si+U85EJTcJt/5LtcvrBu/lvIyiVMnqNt/nT2SDPtTtKVmb0vfYmZdc4IYTpJ/MthiBsGfJJH84sVD9qJvhU73cEX2zVjquydD+Hvq2jtwXkqDPGlo/2yeGil0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757614460; c=relaxed/relaxed;
	bh=fO/wiS6u6wjvvJi4t2wKktGS6aYq1CiRm5gJANXSAXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMDb4eu9Ya66V+7FsHAooRv2FVxhIX3Frx0Sg3q5ik+LZXC7F3OSriY3eo3OliH3lQbqeUSnfSyUx0bOTFE94RaZAZyBk2WlDLLG1Y6LrVCLjRqiLP6kT5Y4Hj5kg0oFjQUHrAevaY3mwXKq13ib81hJr1T41E7C6cQZEmUmjwMIcgZJMHxQC0RJdfuuwRAGGq2Jbd3RIOjZatvo4ExSElNhBm3R0XGrFO489LWgLPLY4XGoyORnyh76gU2/20LRRwlcocCYWxBB3QKfFYdhS++Zrrjci9vUWeBjAtHWgjXLnjndAAdhsUp+mMVCsSglT9X/LO6PKV09MNziw6+7lQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ROmY7FUr; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ROmY7FUr; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ROmY7FUr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ROmY7FUr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cN5L340Xhz2xnn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 04:14:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757614452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fO/wiS6u6wjvvJi4t2wKktGS6aYq1CiRm5gJANXSAXc=;
	b=ROmY7FUr4RFL/ZaJdrsNgxHvb34/pAbXIlb5WxbBwVKDvroNMtrDVkA7rzCQcYhEqSXRQA
	0VFaqRk3jkv/sWR13uf/Zx5Uy6ZZXnT/pLJX/OgNKiWbPBcIoPslsk8bRSG1mp0j3ZqF+8
	6b5EBJooQIW0NgT5Tk70lsJr6Axak8M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757614452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fO/wiS6u6wjvvJi4t2wKktGS6aYq1CiRm5gJANXSAXc=;
	b=ROmY7FUr4RFL/ZaJdrsNgxHvb34/pAbXIlb5WxbBwVKDvroNMtrDVkA7rzCQcYhEqSXRQA
	0VFaqRk3jkv/sWR13uf/Zx5Uy6ZZXnT/pLJX/OgNKiWbPBcIoPslsk8bRSG1mp0j3ZqF+8
	6b5EBJooQIW0NgT5Tk70lsJr6Axak8M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-aH-Ez0a6NR2jIbtNMvjREw-1; Thu, 11 Sep 2025 14:14:10 -0400
X-MC-Unique: aH-Ez0a6NR2jIbtNMvjREw-1
X-Mimecast-MFC-AGG-ID: aH-Ez0a6NR2jIbtNMvjREw_1757614449
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45b920e0c25so6846255e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 11:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757614449; x=1758219249;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fO/wiS6u6wjvvJi4t2wKktGS6aYq1CiRm5gJANXSAXc=;
        b=AM7c/9I69rAk2s4bAvdNuLvzbPg/MInhNm+5pZy3UkKiMvBLlFbZsyCX2TPMwhNgM3
         3AKXvrGBq/t8cNBMBGWvGVY7bUvfZTDky3yTDjA5PZUUJkBN5QdAhJXvAuw6D91RML3F
         3F8PIWPwpV+V0l7cT4mEAM9H0IJ023K4YfoVJ+60DSJEAA++l2Nd3ai+5QiqQsTudq6F
         4od/nwv3GgxY3ktqxJbKHacV5LX/IgMy9KozZcs6vSp14fpKmSFvoN2C2EJWvAl7qsXy
         LlWqflt/L+XVCjrHs0Qpi2Z9Lp1Eswas8IER3RexUQI1rXnB/6tlZmG2zWAd1s8IQVRQ
         xYPA==
X-Forwarded-Encrypted: i=1; AJvYcCVApnuj8827UgnKdv/uOa1s+6KPMS3vNL+EG/uY3lUQ5mdY/T1vWGX+S07OiZ1nZlAHm4fZz7XhgfNePB0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwxdK/ZE4sf1Qe1AobaZh1iuU5V6JN51JLkDHdOUZEtTWCt6NTc
	8xwBgGz1j824r4cC2LbdeJI6GfoH0SBtUgpgvn4G9LqtJkDTUH/BzV57fRMsAz5awVpwKemU2Cx
	Be0Z7Pn911KyzkvJw5EJx9pW8vZfzuXkviTQ7fM/bT4kGd03+GCnMHPt3GG67n/1DB0o=
X-Gm-Gg: ASbGncu25LGAX4Dne45+JZ+EX7zir6W0B0W6itraB4N3SlNPcx6T0uvYcMvBjWp/ycY
	du82MfwHoREE2FX+vU+I2hh2Oab9pjpRHnyGvMYlOcOolO895IumGoT1I+gokGE9A6eIRyJ3Ggz
	yvMVpxbdBoquu5ZkW0BiUniZKYDioHTmSLDPF347+txYZkgjIQAKR7x9IOKCFCWbM+jt04wtzSZ
	ASmBa1Ua9qXEtcafXQZ48fIX8BGo440tJff6KI5o2VXxyfLE54UaxFY93wvDQnJG0Fg7pXwO6nd
	Ap/UOg0UZtG8E6j1bnmxDz6SqNI/sGOyr5LvJF3I0iIaguTiG9p1rWUdWQ0fiAH+s7gnhvIdsGy
	WjDRWUEUO1WWSoqdCnXopJHYHN+nayP/nMvRTl5tKNiYNAQ056N+hHTSzoDIpnH5xHR4=
X-Received: by 2002:a05:600c:1387:b0:45b:88d6:8ddb with SMTP id 5b1f17b1804b1-45f211fc2dbmr3761085e9.37.1757614449363;
        Thu, 11 Sep 2025 11:14:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYPRnitXgQzHDt7U0vwEWEhdUB9NK1hJir7NlpKTdRzaPw5ybQNZDXnkL32l5S2EQ4JRmc7Q==
X-Received: by 2002:a05:600c:1387:b0:45b:88d6:8ddb with SMTP id 5b1f17b1804b1-45f211fc2dbmr3760825e9.37.1757614448886;
        Thu, 11 Sep 2025 11:14:08 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f42:b000:db8b:7655:f60f:812b? (p200300d82f42b000db8b7655f60f812b.dip0.t-ipconnect.de. [2003:d8:2f42:b000:db8b:7655:f60f:812b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e016b5cbcsm35354055e9.11.2025.09.11.11.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 11:14:08 -0700 (PDT)
Message-ID: <4aa28016-5678-4c66-8104-8dcc3fa2f5ce@redhat.com>
Date: Thu, 11 Sep 2025 20:14:05 +0200
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
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mark Rutland <Mark.Rutland@arm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
 <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
 <2fecfae7-1140-4a23-a352-9fd339fcbae5-agordeev@linux.ibm.com>
 <e521b1f4-3f2b-48cd-9568-b9a4cf4c4830@redhat.com>
 <47ee1df7-1602-4200-af94-475f84ca8d80@arm.com>
 <29383ee2-d6d6-4435-9052-d75a263a5c45@redhat.com>
 <9de08024-adfc-421b-8799-62653468cf63@arm.com>
 <ef343405-c394-4763-a79f-21381f217b6c@redhat.com>
 <4b4971fd-0445-4d86-8f3a-6ba3d68d15b7@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <4b4971fd-0445-4d86-8f3a-6ba3d68d15b7@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KrzOsUDmzvB-Vd5JR2g5QqAbqtJCIqcqzNQ1_nZetSU_1757614449
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

>>> On the other hand, with a pagefault_disabled-like approach, there is no
>>> way to instruct call {3} to fully exit lazy_mmu regardless of the
>>> nesting level.
>>
>> Sure there is, with a better API. See below. :)
> 
> I meant while keeping the existing shape of the API but yes fair enough!

Time to do it properly I guess :)

[...]

>> Assume we store in the task_struct
>>
>> uint8_t lazy_mmu_enabled_count;
>> bool lazy_mmu_paused;
> 
> I didn't think of that approach! I can't immediately see any problem
> with it, assuming we're fine with storing arch-specific context in
> thread_struct (which seems to be the case as things stand).

Right, just to complete the picture:

a) We will have some CONFIG_ARCH_LAZY_MMU

b) Without that config, all lazy_mmu_*() functions are a nop and no 
lazy_mmu_state is stored in task_struct

struct lazy_mmu_state {
	uint8_t enabled_count;
	bool paused;
}

c) With that config, common-code lazy_mmu_*() functions implement the 
updating of the lazy_mmu_state in task_struct and call into arch code
on the transition from 0->1, 1->0 etc.

Maybe that can be done through exiting 
arch_enter_lazy_mmu_mode()/arch_leave_lazy_mmu_mode() callbacks, maybe 
we need more. I feel like
we might be able to implement that through the existing helpers.

> 
>>
>> We can do things like
>>
>> a) Sanity check that while we are paused that we get no more
>> enable/disable requests
>> b) Sanity check that while we are paused that we get no more pause
>> requests.
> 
> These are good points - and this is only possible with such global
> state. (Similarly we can check that the counter never underflows.)

Exactly.

[..]

> 
> Overall what you're proposing seems sensible to me, the additional
> fields in task_struct don't take much space and we can keep the API
> unchanged in most cases. It is also good to have the option to check
> that the API is used correctly. I'll reply to the cover letter to let
> anyone who didn't follow this thread chip in, before I go ahead and try
> out that new approach.

And on top of the proposal above we will have some

struct arch_lazy_mmu_state;

define by the architecture (could be an empty struct on most).

We can store that inside "struct lazy_mmu_state;" or if we ever have to, 
start returning only that from the enable/disable etc. functions.

For now, I'd say just store it in the task struct in the lazy_mmu_state. 
But we can always adjust later if required.

In the first (this) series we probably don't even have to introduce 
arch_lazy_mmu_state.

-- 
Cheers

David / dhildenb


