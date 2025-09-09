Return-Path: <linuxppc-dev+bounces-11947-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2246CB4ACF5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 13:55:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLj1X4wQXz3cYG;
	Tue,  9 Sep 2025 21:55:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757418912;
	cv=none; b=ffHPBlJ3xDHAmdq9Uxpuh7tyVLf1o6ClADRH02hXvLAqM19gccv+DoVeBka9ySUQPSeyjjPfcDv3pVI+NUWp/vc2cxSqQ60s0fDzzivA+fvqad/O5AQSE+CYXkWBjHy3BMSoN9qEOfXPRljhuqf1IlLZH05/jrUxGhw5UIEL27jIYk+LU+FxBfhzHsu4gjDwqd1AUrhj2m+UzwK2gU2c1WBk3v1IWJVXnd6epMYee391ZgGVb2aClrDn5H8dN/yBpMK/m+UAtqODE2115Zm0UPjrjwny+FScs2UzVI1xYQm6N3ROnVQPI0tYUugW4Oc80TFC0blHw0mfru+dCWa9jA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757418912; c=relaxed/relaxed;
	bh=wOh5IdHecYmXNJFyfTY+5ofA8ReFnlDB1RFePKgZiG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dyoGqpR+t/hAjYRc5wCY0w1UXqBcHkwB+tuWQVtfhXLtpyXaHffGbuL8V5w2VQd3Xtd0apjL4IXNPiAGJ0QES37j1xVPj+tOyHvKhi8TJlNBy2CfkxPORV8jzwfgsI8Q/cPeClczs/UvLxRRCYjYmTFPmjjorEhoyr0Cd5pGkcEUfJBzbVHZNvV0M1AxxjPRZMsQqUwDWrUitcks957hg2eIP95rsBupcAUNVzQw7elSaZaxCBbotmqTMv7s0BQ+58EwiA23puM+ZHyLKcGZrDDivYjs9IRGe0Jwo6wuHuk7gSZLfgo++0hS1jQkQGpKk1N2tfXPPzaiRaXXCdh+AA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LsYeTzlN; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LsYeTzlN; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LsYeTzlN;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LsYeTzlN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLj1W44jbz3bpS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 21:55:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757418906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wOh5IdHecYmXNJFyfTY+5ofA8ReFnlDB1RFePKgZiG8=;
	b=LsYeTzlNsM41M2M8/Bqw2Kt/2mNt7o0ao12CZrHgHc+oSijEiI+f5I1kfXmy+pI7W17faJ
	hOdajbyoSZwUDAPpSpHUABKjqjNEkJjGxz9QEA8tqA+rI4wnnpS6rRzHtskbQcCSIU5VbL
	+tIr2Cb8deyfgxsbX+3Do77uLJi6wpo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757418906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wOh5IdHecYmXNJFyfTY+5ofA8ReFnlDB1RFePKgZiG8=;
	b=LsYeTzlNsM41M2M8/Bqw2Kt/2mNt7o0ao12CZrHgHc+oSijEiI+f5I1kfXmy+pI7W17faJ
	hOdajbyoSZwUDAPpSpHUABKjqjNEkJjGxz9QEA8tqA+rI4wnnpS6rRzHtskbQcCSIU5VbL
	+tIr2Cb8deyfgxsbX+3Do77uLJi6wpo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-p6ArHbKMPQSzmbieWTTeEw-1; Tue, 09 Sep 2025 07:55:04 -0400
X-MC-Unique: p6ArHbKMPQSzmbieWTTeEw-1
X-Mimecast-MFC-AGG-ID: p6ArHbKMPQSzmbieWTTeEw_1757418903
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3e067ef24aaso2834837f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Sep 2025 04:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757418903; x=1758023703;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOh5IdHecYmXNJFyfTY+5ofA8ReFnlDB1RFePKgZiG8=;
        b=J4vEW3gSxbjj+kZ7lOkvEpp5DzUgkoqqX2jXuEq2Bcm6OUXMYPecxnfyO3urWIfEmh
         /0VZFJwZqqIymzqwfHRN/mExUYO4XJBpEggsU0F/jRHfTODdNZLMnKSd/hVpYPB28Wqe
         RR4JAch0ERJzZEHZ4SOvOUjDJMQ/nduiubx4RtaK8jGq35JVw8qkA6Civ5ONEP0qgh/E
         RbyCGtqyNwxBR1TXY8URQfYvzp8cTEAKwXJWTuYKIxU60ZSSjT+cmkr4MPkZ778FBHfh
         MUHVhLXiKyA+ZGmGlHoNxl/ChPuGmjfLAb0MopiSZmT1Sr2jbJ7Y56GHURRnRXI7UBG5
         jc0g==
X-Forwarded-Encrypted: i=1; AJvYcCWbxIRYFKo2nDAoNY/K2Y3bZ5zmj6e7X5jK0N+wC+nFVcr2geKNQcEfo/Jz6bFqkHy/MtetfyLYKLVUL2g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxfTLODUdM2Ygw+/gVA/DIxteLQ4oc0RfbFoMAM8L3Ghb889zxO
	HTRscFuH9gAE6Ey5Vy6FToLIlb2TTU1FQMwsi6sR5Cq7RqdiixqYgAwy/n7xoCJGKmw5n9RSS/E
	eVT379Jx+a7qFRZ4dPSHHikWqC/Oqyp8VW7b/wyKD9zsYozzS0ERk+9F72gwixzDkJNU=
X-Gm-Gg: ASbGnctL/GSPGYx3gVX+zgZRb9RUKfpIICrU/8V3k1/zxFecMV9MH7ko2A/feIi7x/Q
	rYgAmSZov4MoTMLjGWCOGG+c5BEnjmaI8r4w1G3SIQzeNZ8kuYnwNpmOWeb3l0NBdTYI2CYsy70
	7p/+10SvNwjqiO5v0tWEwy0wDHPfF7l2zAfxf0HUt4IEFGv8YgHTzOXJlINKbwhgZMJ4QBbY/3c
	oPzRRJDzUYSn+0y1tLo5vY/9d5JdriH+Qj7CS8Mou800dv9vOU7Al2khqn5oI8OU0YVv/QjtbNX
	Rp2I2s6effxWSkrkZSHOO3NgJTAycR7aCXiIX5ynyFJGrrsbKED0wpsopHuENDnof9J0JHg2JfT
	Pq83lEJQFd1KF/kWlEYsYbpjfrWE5Z442bl5/Ky8OhDmhuo+Ep/B9oSHEioyq9BAH8Ms=
X-Received: by 2002:a5d:5f82:0:b0:3e7:42ae:d3dd with SMTP id ffacd0b85a97d-3e742aed713mr7769539f8f.53.1757418903205;
        Tue, 09 Sep 2025 04:55:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+ZfFXrc3J/ZXb10wuImf1IN/WN2zT9Bnd5gvpLTDU+4GYxL8KyTu1AXUf0+6BD7rUQ8++xA==
X-Received: by 2002:a5d:5f82:0:b0:3e7:42ae:d3dd with SMTP id ffacd0b85a97d-3e742aed713mr7769489f8f.53.1757418902733;
        Tue, 09 Sep 2025 04:55:02 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34? (p200300d82f239c00d1f6f7fe8f147e34.dip0.t-ipconnect.de. [2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75223898csm2497249f8f.39.2025.09.09.04.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 04:55:02 -0700 (PDT)
Message-ID: <e521b1f4-3f2b-48cd-9568-b9a4cf4c4830@redhat.com>
Date: Tue, 9 Sep 2025 13:54:59 +0200
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
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
 <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
 <2fecfae7-1140-4a23-a352-9fd339fcbae5-agordeev@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <2fecfae7-1140-4a23-a352-9fd339fcbae5-agordeev@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zlyJKO0GIXJ870YrPCeM2hluLHQiO_JpBh-m7czxdsM_1757418903
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 09.09.25 13:45, Alexander Gordeev wrote:
> On Tue, Sep 09, 2025 at 12:09:48PM +0200, David Hildenbrand wrote:
>> On 09.09.25 11:40, Alexander Gordeev wrote:
>>> On Tue, Sep 09, 2025 at 11:07:36AM +0200, David Hildenbrand wrote:
>>>> On 08.09.25 09:39, Kevin Brodsky wrote:
>>>>> arch_{enter,leave}_lazy_mmu_mode() currently have a stateless API
>>>>> (taking and returning no value). This is proving problematic in
>>>>> situations where leave() needs to restore some context back to its
>>>>> original state (before enter() was called). In particular, this
>>>>> makes it difficult to support the nesting of lazy_mmu sections -
>>>>> leave() does not know whether the matching enter() call occurred
>>>>> while lazy_mmu was already enabled, and whether to disable it or
>>>>> not.
>>>>>
>>>>> This patch gives all architectures the chance to store local state
>>>>> while inside a lazy_mmu section by making enter() return some value,
>>>>> storing it in a local variable, and having leave() take that value.
>>>>> That value is typed lazy_mmu_state_t - each architecture defining
>>>>> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is free to define it as it sees fit.
>>>>> For now we define it as int everywhere, which is sufficient to
>>>>> support nesting.
>>> ...
>>>>> {
>>>>> + lazy_mmu_state_t lazy_mmu_state;
>>>>> ...
>>>>> - arch_enter_lazy_mmu_mode();
>>>>> + lazy_mmu_state = arch_enter_lazy_mmu_mode();
>>>>> ...
>>>>> - arch_leave_lazy_mmu_mode();
>>>>> + arch_leave_lazy_mmu_mode(lazy_mmu_state);
>>>>> ...
>>>>> }
>>>>>
>>>>> * In a few cases (e.g. xen_flush_lazy_mmu()), a function knows that
>>>>>      lazy_mmu is already enabled, and it temporarily disables it by
>>>>>      calling leave() and then enter() again. Here we want to ensure
>>>>>      that any operation between the leave() and enter() calls is
>>>>>      completed immediately; for that reason we pass LAZY_MMU_DEFAULT to
>>>>>      leave() to fully disable lazy_mmu. enter() will then re-enable it
>>>>>      - this achieves the expected behaviour, whether nesting occurred
>>>>>      before that function was called or not.
>>>>>
>>>>> Note: it is difficult to provide a default definition of
>>>>> lazy_mmu_state_t for architectures implementing lazy_mmu, because
>>>>> that definition would need to be available in
>>>>> arch/x86/include/asm/paravirt_types.h and adding a new generic
>>>>>     #include there is very tricky due to the existing header soup.
>>>>
>>>> Yeah, I was wondering about exactly that.
>>>>
>>>> In particular because LAZY_MMU_DEFAULT etc resides somewehere compeltely
>>>> different.
>>>>
>>>> Which raises the question: is using a new type really of any benefit here?
>>>>
>>>> Can't we just use an "enum lazy_mmu_state" and call it a day?
>>>
>>> I could envision something completely different for this type on s390,
>>> e.g. a pointer to a per-cpu structure. So I would really ask to stick
>>> with the current approach.
>>
>> Would that integrate well with LAZY_MMU_DEFAULT etc?
> 
> Hmm... I though the idea is to use LAZY_MMU_* by architectures that
> want to use it - at least that is how I read the description above.
> 
> It is only kasan_populate|depopulate_vmalloc_pte() in generic code
> that do not follow this pattern, and it looks as a problem to me.

Yes, that's why I am asking.

What kind of information (pointer to a per-cpu structure) would you want 
to return, and would handling it similar to how 
pagefault_disable()/pagefault_enable() e.g., using a variable in 
"current" to track the nesting level avoid having s390x to do that?

-- 
Cheers

David / dhildenb


