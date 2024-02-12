Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0F7851491
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 14:15:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h/mzq9iC;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h/mzq9iC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYQ1y16Yzz3dVJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 00:15:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h/mzq9iC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h/mzq9iC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYQ1B673mz3bx0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 00:15:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707743707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qLa1enao/eBHrJt4n5b2gdRWxVNxxplXI5t3v+HwRWc=;
	b=h/mzq9iCNevJ3SxCgXsfaTNLECs8HigWONRhxLqlVhs1oJzEq3pnHwKgp625JqgezNGiRN
	iNR34fWMZ4ZXh0MvvLXlKrNHUPajrTnzo79eqEiyBvzFMTmPgKy5d21gHmg+JcxZEMaslB
	TP5QyIqTiDS2JzKGfn6k/81Ha1N/1xo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707743707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qLa1enao/eBHrJt4n5b2gdRWxVNxxplXI5t3v+HwRWc=;
	b=h/mzq9iCNevJ3SxCgXsfaTNLECs8HigWONRhxLqlVhs1oJzEq3pnHwKgp625JqgezNGiRN
	iNR34fWMZ4ZXh0MvvLXlKrNHUPajrTnzo79eqEiyBvzFMTmPgKy5d21gHmg+JcxZEMaslB
	TP5QyIqTiDS2JzKGfn6k/81Ha1N/1xo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-Qt-6TGOSNTqY0k4vsrbv3g-1; Mon, 12 Feb 2024 08:15:05 -0500
X-MC-Unique: Qt-6TGOSNTqY0k4vsrbv3g-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40e53200380so20395085e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 05:15:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707743705; x=1708348505;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLa1enao/eBHrJt4n5b2gdRWxVNxxplXI5t3v+HwRWc=;
        b=oH1kGFM5qx7RQrBuwzVej9GwHtRaTknm5f1k6Q0hVZJuhL2uJt1o4oEwmN+VxY1Nqy
         euTFuYkEeHDQTiXPPyS7VqrQ4GWLefpZed3XXlCijZPp7SJH6sfB7Vm3Co1YXGkfeF2+
         Jxy4iH9y/GtWMAS7atJsOiOTpsR/cGSiP6c/oT2BD5OLeYt61ACexiCLhjGAy4SH3BPd
         XbWlQSNq7tfOUUkCmJx3fHkA/ifdFBjjB5ZILivdzqRw2o4rhOppHCrR5GUfSuWq4Hks
         6D7YXjIcszyWkjRbtIjDb1qgdTTozkxXJmGw0xz3aaL+5SRp8hjqaoBufGUQMQkrCQUP
         S0cw==
X-Gm-Message-State: AOJu0Yx46RytS4AHK7ec4yn9eczYhMjAixWs84ZinX/TDok6FERBP9Uf
	P5bmViqt2wtgahrZDy6+jTtnKuoe8D++EVQBd/aX9R532zTmYhwGOW0ukdFAKW6NDfsg5Mz9PAV
	5fVWs4Nz6skRnAxkMJuMlqSxFXwQp4CAjiD27b4yS2eD+m6cDNWCqHtG2n27q/44=
X-Received: by 2002:a05:600c:5112:b0:410:cf4f:68e9 with SMTP id o18-20020a05600c511200b00410cf4f68e9mr2207270wms.3.1707743704896;
        Mon, 12 Feb 2024 05:15:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJjiiO1bSMph3D/W46ZOYowz5HVMA2Of9ZOViP+lBylUKgJUnAo5QesZ3nIqCqDpru9cyv5g==
X-Received: by 2002:a05:600c:5112:b0:410:cf4f:68e9 with SMTP id o18-20020a05600c511200b00410cf4f68e9mr2207237wms.3.1707743704457;
        Mon, 12 Feb 2024 05:15:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJ6bp9t1R9waQ+yUBOiEY4IhrHfAFgqkvGIjuaTC/RQ8vdJvr+BHS7HMQ8R22yBrp3pAArV5kbYF7ZgJCyHDTrisZibM51DrJ6qIf/TbCho3Wy1FPnrpAVTSe8sgYaI7gz+I/9FWXF4sHyzU0v9mURYSaaai3y440paSeg21rEUyVtD7vaVO+XSgqSy19Ggk8SnzolXKlwGpSy4Mb69uYiWui2f9XGPurcpQ2AeqL/wB3Db63q7HsDLjqWhEEkVtKByZ6ZB4Qp5LAoUEreL8/9LkSC/Dp0GqGN/5SKBTbIrIwR5zJb8z04StcwHnbhblZ5C31H+JoRkA2Y6i7TAK7aXPSGwz3p7ZuYEPynt3TMzFdTrDVWZzag51L6YpYANWbokG2GEmqILmdhCAg3v+x4pArdnhmSFC9dSL1xVKK+FSJjoOS4IldpTRIRc8m4eODIzJ8dCEpcpg28aXNObGxZQBMLpJGF31hAoVhOMXPNYaw2voehIK6UdpxmfvxQFi9DL7UuJL7xXammxCMLeQJiJmKLELWGDxVrUV/Vm7lsREZpxAArLk1nXD1nBIUvQX0woQQH56Bea3+j2hcHhi0XG0Tt1lYC7dIXs+06z3EgNANpmXoM2VDXQTv7lDLtKpmPSj+MYlqR6qGLpSGS7emv7z26sfcUZ6KAWRO3zHk8NEhYV/5Zx6HDFq96ogu41R8jssd/lnK6U6L5xFXuDejmm36GIfm5FsXaBAlVsRt38idNYeoXb5oMnRQIG2O/d5Pl8xHajeL76ov0JdMKKQuoBx7UgPt9nKE3ElYTch9c8UhDN18HWuQVlMiSdy+B6pui1i+CcRyoi8NqEdQvG/T8Izb+kMQhbFZwA8tAa+cb
Received: from ?IPV6:2003:cb:c730:2200:7229:83b1:524e:283a? (p200300cbc7302200722983b1524e283a.dip0.t-ipconnect.de. [2003:cb:c730:2200:7229:83b1:524e:283a])
        by smtp.gmail.com with ESMTPSA id en8-20020a056000420800b0033b7d9c14desm3956966wrb.5.2024.02.12.05.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 05:15:04 -0800 (PST)
Message-ID: <608feac1-8cd6-48c2-87ab-688fb9c0bda4@redhat.com>
Date: Mon, 12 Feb 2024 14:15:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/25] arm64/mm: Split __flush_tlb_range() to elide
 trailing DSB
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, John Hubbard
 <jhubbard@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Barry Song <21cnbao@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Yang Shi <shy828301@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
 <20240202080756.1453939-19-ryan.roberts@arm.com>
 <9e1d793a-02c9-4dbb-a6d4-1e1c0c42638c@redhat.com>
 <1ef4c737-0926-424c-9698-794c23370b74@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <1ef4c737-0926-424c-9698-794c23370b74@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-mm@kvack.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12.02.24 14:05, Ryan Roberts wrote:
> On 12/02/2024 12:44, David Hildenbrand wrote:
>> On 02.02.24 09:07, Ryan Roberts wrote:
>>> Split __flush_tlb_range() into __flush_tlb_range_nosync() +
>>> __flush_tlb_range(), in the same way as the existing flush_tlb_page()
>>> arrangement. This allows calling __flush_tlb_range_nosync() to elide the
>>> trailing DSB. Forthcoming "contpte" code will take advantage of this
>>> when clearing the young bit from a contiguous range of ptes.
>>>
>>> Tested-by: John Hubbard <jhubbard@nvidia.com>
>>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>>> ---
>>>    arch/arm64/include/asm/tlbflush.h | 13 +++++++++++--
>>>    1 file changed, 11 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/tlbflush.h
>>> b/arch/arm64/include/asm/tlbflush.h
>>> index 79e932a1bdf8..50a765917327 100644
>>> --- a/arch/arm64/include/asm/tlbflush.h
>>> +++ b/arch/arm64/include/asm/tlbflush.h
>>> @@ -422,7 +422,7 @@ do {                                    \
>>>    #define __flush_s2_tlb_range_op(op, start, pages, stride, tlb_level) \
>>>        __flush_tlb_range_op(op, start, pages, stride, 0, tlb_level, false,
>>> kvm_lpa2_is_enabled());
>>>    -static inline void __flush_tlb_range(struct vm_area_struct *vma,
>>> +static inline void __flush_tlb_range_nosync(struct vm_area_struct *vma,
>>>                         unsigned long start, unsigned long end,
>>>                         unsigned long stride, bool last_level,
>>>                         int tlb_level)
>>> @@ -456,10 +456,19 @@ static inline void __flush_tlb_range(struct
>>> vm_area_struct *vma,
>>>            __flush_tlb_range_op(vae1is, start, pages, stride, asid,
>>>                         tlb_level, true, lpa2_is_enabled());
>>>    -    dsb(ish);
>>>        mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, start, end);
>>>    }
>>>    +static inline void __flush_tlb_range(struct vm_area_struct *vma,
>>> +                     unsigned long start, unsigned long end,
>>> +                     unsigned long stride, bool last_level,
>>> +                     int tlb_level)
>>> +{
>>> +    __flush_tlb_range_nosync(vma, start, end, stride,
>>> +                 last_level, tlb_level);
>>> +    dsb(ish);
>>> +}
>>> +
>>>    static inline void flush_tlb_range(struct vm_area_struct *vma,
>>>                       unsigned long start, unsigned long end)
>>>    {
>>
>> You're now calling dsb() after mmu_notifier_arch_invalidate_secondary_tlbs().
>>
>>
>> In flush_tlb_mm(), we have the order
>>
>>      dsb(ish);
>>      mmu_notifier_arch_invalidate_secondary_tlbs()
>>
>> In flush_tlb_page(), we have the effective order:
>>
>>      mmu_notifier_arch_invalidate_secondary_tlbs()
>>      dsb(ish);
>>
>> In flush_tlb_range(), we used to have the order:
>>
>>      dsb(ish);
>>      mmu_notifier_arch_invalidate_secondary_tlbs();
>>
>>
>> So I *suspect* having that DSB before
>> mmu_notifier_arch_invalidate_secondary_tlbs() is fine. Hopefully, nothing in
>> there relies on that placement.
> 
> Will spotted this against v3. My argument was that I was following the existing
> pattern in flush_tlb_page(). Apparently that is not correct and needs changing,
> but the conclusion was to leave my change as is for now, since it is consistent
> and change them at a later date together.

Good, I think you should add a few words to the patch description 
("ordering might be incorrect, but is in-line with __flush_tlb_page()"; 
will be resolved separately).

-- 
Cheers,

David / dhildenb

