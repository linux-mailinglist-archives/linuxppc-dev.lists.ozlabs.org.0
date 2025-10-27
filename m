Return-Path: <linuxppc-dev+bounces-13346-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1252C0F40A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 17:25:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwJky496Hz2yjy;
	Tue, 28 Oct 2025 03:25:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761582314;
	cv=none; b=dvquaMIjtptacpg5xcFpx9oNGjvnBqZKBxOhryk9uxqSgY+1oZBVczRvZzMdGwuU39bP/WxNqfVNboWMNHgQ7TbyIKDUoePASOQj7fMY9lgAAMbcdV2UHBQUwCZv7HW/sxNLd/2ud+HwBxB0Bzot9qw7nPwbn6tdhXJW1xEAIu+KvASZ0Pi3p1q3pig5eVSyHGoeZOQpGAHnlMhDsRzi/wQUCeBNkYAXSJvhT8j6E+tEMFiY5HibdbtKpWJeFc/xSgumoVi7jbXZ/r1a3JVi6K8SgGlNM8RQ9v8Cj3DBq/1akq0tJMi6rzBX6owsVUh50IWFn6gvEg8ekw9e1knJJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761582314; c=relaxed/relaxed;
	bh=EJ5VPlj4otrH6ErEHjuzGdU9BRwHQ8d9NMaXu6e9vKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V7cPdznkqPqw9WA0iJ9cq2HAa8O8Cp5S3v4KUmBm1S21rIvS4W1uOPHgOvpDbQCcSUwbKjAlJzmWkMqWDAj6Ulyq1G1cPcOlqqLaHk2HMjuwmlPtQmNkOkof7qsvfNQrjuU+DTs54iPbbGTj2G4gzXsgBCFzQodPWoRfu+cEAA+FayBW06ZBtGwvyvBb7MhqZwZm1ubz6qPT9CJrwzw/7C/Ele/K1bWit4h7n2D5rPI5XWPbkziaP0m9HvRldlFnJ2o8LalsLl1HoIRIIqUJkWWKxtFk9OiaTF1i6qZ4rnszqYFE77zMQ/KTgmaadS86jLtCt3jJhnzAOIgalwXBQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hu7rrj8j; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hu7rrj8j; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hu7rrj8j;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hu7rrj8j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwJkx16Ynz2xsq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 03:25:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761582307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EJ5VPlj4otrH6ErEHjuzGdU9BRwHQ8d9NMaXu6e9vKY=;
	b=Hu7rrj8jCUBp1Eqc+jo5x1jiyeQc31KvyAgs/f/9SXozqHi32cDh4FU5yDIVMBos30ovqF
	cJeTpKGmW+3cwhlludgzhRGe1MDSTXnDMW+v/MXPeQKS7X57QbTKJ4XOfTS7UjLkkSDLSL
	TvLKDmhmh/al/bN7gx4IKemwFBAD0HE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761582307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EJ5VPlj4otrH6ErEHjuzGdU9BRwHQ8d9NMaXu6e9vKY=;
	b=Hu7rrj8jCUBp1Eqc+jo5x1jiyeQc31KvyAgs/f/9SXozqHi32cDh4FU5yDIVMBos30ovqF
	cJeTpKGmW+3cwhlludgzhRGe1MDSTXnDMW+v/MXPeQKS7X57QbTKJ4XOfTS7UjLkkSDLSL
	TvLKDmhmh/al/bN7gx4IKemwFBAD0HE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-9tgIUUflO2CfoXYvhWq3WQ-1; Mon, 27 Oct 2025 12:25:03 -0400
X-MC-Unique: 9tgIUUflO2CfoXYvhWq3WQ-1
X-Mimecast-MFC-AGG-ID: 9tgIUUflO2CfoXYvhWq3WQ_1761582302
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4770dea2551so33895985e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 09:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761582302; x=1762187102;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJ5VPlj4otrH6ErEHjuzGdU9BRwHQ8d9NMaXu6e9vKY=;
        b=V9cADt6F3hi+aloB/4F4EMbktd+IlBDttksALcmDQ/juRlVlHER961Mw7xHdS/xYWd
         HGz6Z4rYu2/1PPuLRXuuayYLELahvzn1BnjYpFJpo11WIvFapN6KdzYrEHP9Yg174Zod
         ZiDALfnZoJiuSDth/5M6kWX3/+ThaguIhOWn6ifgLUaKgdOAZS+hudP3pavVDlwTe1AG
         UwyA2EwdgxUlOHqWJeiQcE97vucPesE0YJMqCgee59+Cdp3J8cVRm8moui+Prh2iN6V8
         zrTogfzP+Az80M1COuImWobYofPEqmW72p72Zzi3i74mnbik1ZpdK4RxYa7aYsBsRj9s
         s72g==
X-Forwarded-Encrypted: i=1; AJvYcCX6y0+kwG8Egy8U5Vsa4DgtC0UwuHPG39wkjersIcxW8ybZ4xbWU3tr97Eq40yMagigcb644obyzoKHVyQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzxHiv0peWWo2MXFTVqOoW4JzNNZrcOilw7lRdHY3aWKs7Vq8N9
	QSpkVfT7aMN9hp943TdVU25AWZcraO3hJSe1mO/90hDDiOP/jV+yuIQXkG2lsa2hZoBg786qHVO
	ObYP/fer22mTbGFRwmHKXxRlsNAUoItkZOJp1SSPmdCbMiWqYMkfnbV2pkpUI4nxLxvk=
X-Gm-Gg: ASbGncurGhwzaGL4SWa5e7BvKhPzqZpKILXVy7EzV7Hjjli6sssx3ZWoDhCmdF7wY9M
	8/S8WNZWy/5Ulfvwv0ulhqCgV7MikZneM4DiNnbgxSfDKajkZYVHugCGueapdvJ7RlO0F/4o83v
	/cebbTD0KijiiV09hd2P8LHdpSCS+AcYSXv8NYuMofM2gQ5wougWZId+s01YiZu4qdZ5wh/82co
	t0JuvoK5oRgenRAdF4yQNfUxl9WwSJSSvahyaAdJydTGTG6fTYEVTZrX60lJpef7llNEsJ3QWUc
	mjsXbEv3dGbiBRIChFFY576WgevlXTQbj2KFybChugcOBLaD7syxi48Q/CDFq71Nu2Z4NAG1bWW
	sZxTVZ+n1Z6goa+nGjx5Uo/7jgLLQoP9FaiInMSvpw0dbXRjQQOaWHYg3NJqe31mCf+IACyUVLm
	HdhS0PiS+/o+KlfieYeXqAox1Zxyc=
X-Received: by 2002:a05:600c:3e8d:b0:475:dd89:ac7 with SMTP id 5b1f17b1804b1-47717df7ef0mr2442485e9.1.1761582301715;
        Mon, 27 Oct 2025 09:25:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcpfk6BDA32rXrYsquQ4cz9qgC2WRauB7zTOhtVhTNHZoQZbKrXzlM5wPgRBa5cEga5fDZQQ==
X-Received: by 2002:a05:600c:3e8d:b0:475:dd89:ac7 with SMTP id 5b1f17b1804b1-47717df7ef0mr2442105e9.1.1761582301286;
        Mon, 27 Oct 2025 09:25:01 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169? (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de. [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd01c07fsm74064275e9.2.2025.10.27.09.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 09:25:00 -0700 (PDT)
Message-ID: <14030818-52e7-41eb-8ad7-602f3476d448@redhat.com>
Date: Mon, 27 Oct 2025 17:24:57 +0100
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
Subject: Re: [PATCH v3 06/13] mm: introduce generic lazy_mmu helpers
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-7-kevin.brodsky@arm.com>
 <73b274b7-f419-4e2e-8620-d557bac30dc2@redhat.com>
 <390e41ae-4b66-40c1-935f-7a1794ba0b71@arm.com>
 <f8d22ae0-4e36-4537-903f-28164c850fdb@redhat.com>
 <28bf77c0-3aa9-4c41-aa2b-368321355dbb@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <28bf77c0-3aa9-4c41-aa2b-368321355dbb@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iA4hjxeNLnmRXjaOMWQdd7PNyEWFk6tg2sZTJDjXzbU_1761582302
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 24.10.25 16:32, Kevin Brodsky wrote:
> On 24/10/2025 15:27, David Hildenbrand wrote:
>> On 24.10.25 14:13, Kevin Brodsky wrote:
>>> On 23/10/2025 21:52, David Hildenbrand wrote:
>>>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>>>> [...]
>>>>>
>>>>> * madvise_*_pte_range() call arch_leave() in multiple paths, some
>>>>>      followed by an immediate exit/rescheduling and some followed by a
>>>>>      conditional exit. These functions assume that they are called
>>>>>      with lazy MMU disabled and we cannot simply use pause()/resume()
>>>>>      to address that. This patch leaves the situation unchanged by
>>>>>      calling enable()/disable() in all cases.
>>>>
>>>> I'm confused, the function simply does
>>>>
>>>> (a) enables lazy mmu
>>>> (b) does something on the page table
>>>> (c) disables lazy mmu
>>>> (d) does something expensive (split folio -> take sleepable locks,
>>>>       flushes tlb)
>>>> (e) go to (a)
>>>
>>> That step is conditional: we exit right away if pte_offset_map_lock()
>>> fails. The fundamental issue is that pause() must always be matched with
>>> resume(), but as those functions look today there is no situation where
>>> a pause() would always be matched with a resume().
>>
>> We have matches enable/disable, so my question is rather "why" you are
>> even thinking about using pause/resume?
>>
>> What would be the benefit of that? If there is no benefit then just
>> drop this from the patch description as it's more confusing than just
>> ... doing what the existing code does :)
> 
> Ah sorry I misunderstood, I guess you originally meant: why would we use
> pause()/resume()?
> 
> The issue is the one I mentioned in the commit message: using
> enable()/disable(), we assume that the functions are called with lazy
> MMU mode is disabled. Consider:
> 
>    lazy_mmu_mode_enable()
>    madvise_cold_or_pageout_pte_range():
>      lazy_mmu_mode_enable()
>      ...
>      if (need_resched()) {
>        lazy_mmu_mode_disable()
>        cond_resched() // lazy MMU still enabled
>      }
> 
> This will explode on architectures that do not allow sleeping while in
> lazy MMU mode. I'm not saying this is an actual problem - I don't see
> why those functions would be called with lazy MMU mode enabled. But it
> does go against the notion that nesting works everywhere.

I would tackle it from a different direction: if code calls with lazy 
MMU enabled into random other code that might sleep, that caller would 
be wrong.

It's not about changing functions like this to use pause/resume.

Maybe the rule is simple: if you enable the lazy MMU, don't call any 
functions that might sleep.

Maybe we could support that later by handling it before/after sleeping, 
if ever required?

Or am I missing something regarding your point on pause()/resume()?

-- 
Cheers

David / dhildenb


