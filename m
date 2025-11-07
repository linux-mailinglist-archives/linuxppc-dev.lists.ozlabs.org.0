Return-Path: <linuxppc-dev+bounces-13958-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F7BC422B9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 08 Nov 2025 01:58:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3HcL24m9z30Sv;
	Sat,  8 Nov 2025 11:58:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762526051;
	cv=none; b=AkyuUcEOFYiRPQqbhjHDIsg/1tKlMLcQ8lNDJtLIhB5OButlnL+f8R+trxNzGR1vkRFO80ES2OBTK5rUThngppsZDw2M3NlTXDOXr+lCCZoNIVrF/lCVo0z6S6q2CJRtJ9/uK4GcG96RjBragetz4NFp89vdhWCtQRWfr8d63KKre5rzGZXGqOoV44NSWo/5xGPPdPqNPBjEG4CQcMV+dxqQVuaZiBImhG30yT4dOm6mgL9Ko+TgmDRjkBAylTZskOohUucQqI3R/RFm/Bw62Mh+aFRPenxDiu/O06kerMw+Uo0Cwy+covNG9NJhYXFmky1qFwRaaMmQgZ6WfLIvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762526051; c=relaxed/relaxed;
	bh=U9gy2Et/tdx42KkCuY9tv69YTLaLyxM7iG0J3rCGUz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kzo/nIiZNFU5o8eNFrjOcXA5foTdxykBwB6Mm7OVOYrditOFLh329KsCadGAdanV2vz4ztOrg4cJZTDgychIf9XTlfJdtG1NgvjaDrw2zNnNP+NaqW7hoFxgQpcmgt9w/57KkFeLzJNQYo+hK5PVgRSq/b2Zj05ZsIaA2flhFrBrhj09ZrTUiGzXSnR6Di2si6C0GGLgdFonwIZcJUnSXQHsfCMA/BpL+FnmKnOtRjlRSd+3fuLzXK7y/HtBaUXFDJQZhJEC+BEYS/3dKyA7srKavRAj9gz3HhTV/FvrkiFcWn0upwcqUoZjFMu0KsPRq5ySYjM7pwSKkeEKdxz+7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=USucs358; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=davidhildenbrandkernel@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=USucs358;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=davidhildenbrandkernel@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d31lk1XC4z3bs7
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 01:34:09 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47117f92e32so6785145e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Nov 2025 06:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762526046; x=1763130846; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U9gy2Et/tdx42KkCuY9tv69YTLaLyxM7iG0J3rCGUz8=;
        b=USucs358AyZLca/Ei4TxoLzEWf8G6KHXeP9o31VivX2yrpje14ATD7kE5UyUOuEEOH
         WHqXnigqP3fmZcKf4J74OLAUDdKc4y3wUzHXs8lD/GjGakv63pLtH2ycFY9ezGmbM/YE
         GFWUgP8dFnC6tJi+VYr9xIJdkNsS/ScAAPJV8Nu2N0tnSc0zJMlIBXGnVDmP9up3bODv
         ptZr3rnuwc5FRWay63Y1IPIOduOcMp00xW+vat32RcV0j8+fw9wH/3gBo6JayUaXrVmh
         uBG2o2pTH+JkPOnTZxRGwe+5FcYajNFOL4wTltQraWzm1Y4JNv9NwK+mV8tBiL4Pz2gx
         quSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762526046; x=1763130846;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9gy2Et/tdx42KkCuY9tv69YTLaLyxM7iG0J3rCGUz8=;
        b=CHdiAE3oFZt+BzSDC8dstOcnao97iUPUvlUJEIEyFfAbRy1hveN/wBQ5AuC1PLbvze
         n4nXHcOXMcFyK3QbAWN7LeDJZT9De2/XoWZQQkYJ30n1STQDhuyBMSC8kopKJKnt+4RS
         bDqBebltC9ydVRVZRGimcq1X/bdWCuRWPPOK02yhCSyDS+7T3ZJEBHrhRqm5OZcpj5pJ
         rDTvYgHLWR1mnrLLxAeBp16RoVR1IluPkzeKIz/TdmHmTndbFuz+GcllsCQhS37Vn15j
         2d638M/02RRv2ZhTqbYPYaeMxywnRpnjj7bKBfRSrhF/WMoOTthWICLKgEzhA1hnpe8I
         VJ5g==
X-Forwarded-Encrypted: i=1; AJvYcCXPj6TiE5BsFXTXPrmNSFuzv+NzBnPGUVtKe/ybSIsJLiSwtP1VxM/zjmS7im1eaDbmPQAgXw1rBhyXgsI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzkgRaW75R+LH1+RBnVOxvXlauNN6oNv0WNExQRugQoKre0JtfI
	yOYGoxeYgEDuvT8+Jf+diSmv5Jm+KNX/1P4le5ZP5A9ujT+84tiWAeys
X-Gm-Gg: ASbGncuBs4wLjTFkD7WevjJdlK4+gl4z5HAwqAoZkpVaxQln1dKAhn0krMDMpNxhZ/C
	rdjOcDrlZxYczay6JZMx7ZzMujjfggn23RVKBm6dldHg/rzbtIfLjbaCnhBNPNCcMyeuwEO36vB
	HcOcfn7wGBWL9aoyiSEdaaW+8gD1L7aNIH63FbEj15uPkCViFNWImjKaaq0XrX+sgdm5tBEwT3D
	O9e3a1JAD+LMa090rIgb+ekGRGc/06D4eOGqKmwsd+0Ihg1K3GVV6rtD4U+57MwRf7k+Cn6rfAU
	I9ZUaHndpUP5YwUhcBqUQdXEKcDKHZR2XPnUdIvRMFhQJkEKTaq0hbEFDJSL4PSGGEu7niEbXJo
	e0HHBcfTQ0R0tLAq6SAB1kKRpDbT2EyplIQWRVWUFdhsukq64ozh1cn+crPc1MS7/B8vXs9ovnJ
	ge5QMYY7UZD5Ci6ARMyzqWskD7+UK8yP9RwnEHESWhVbBkIExaTlMsOsEQPsb5Eji/DUdeOezsl
	/W0z20Ip28MbYbrwQCQU1RhyFhSFWw=
X-Google-Smtp-Source: AGHT+IEbeI8C8CzNAXSH/bs89gWIf/ZmK+BLjDzXB4QFwcXH6hASOjwiIfYomA42vxdn493DYIICBw==
X-Received: by 2002:a05:6000:2084:b0:427:e1bf:13bd with SMTP id ffacd0b85a97d-42ae5adfd73mr3148986f8f.52.1762526045768;
        Fri, 07 Nov 2025 06:34:05 -0800 (PST)
Received: from ?IPV6:2003:d8:2f30:b00:cea9:dee:d607:41d? (p200300d82f300b00cea90deed607041d.dip0.t-ipconnect.de. [2003:d8:2f30:b00:cea9:dee:d607:41d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67845ccsm5465086f8f.36.2025.11.07.06.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 06:34:05 -0800 (PST)
Message-ID: <c764489e-0626-4a50-87b5-39e15d9db733@gmail.com>
Date: Fri, 7 Nov 2025 15:34:03 +0100
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
Subject: Re: [PATCH v4 06/12] mm: introduce generic lazy_mmu helpers
To: Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky
 <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-7-kevin.brodsky@arm.com>
 <71418b31-aedb-4600-9558-842515dd6c44@arm.com>
From: "David Hildenbrand (Red Hat)" <davidhildenbrandkernel@gmail.com>
Content-Language: en-US
In-Reply-To: <71418b31-aedb-4600-9558-842515dd6c44@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

>>   #ifndef pte_batch_hint
>> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
>> index 5d2a876035d6..c49b029d3593 100644
>> --- a/mm/kasan/shadow.c
>> +++ b/mm/kasan/shadow.c
>> @@ -305,7 +305,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>>   	pte_t pte;
>>   	int index;
>>   
>> -	arch_leave_lazy_mmu_mode();
>> +	lazy_mmu_mode_pause();
> 
> I wonder if there really are use cases that *require* pause/resume? I think
> these kasan cases could be correctly implemented using a new nest level instead?
> Are there cases where the effects really need to be immediate or do the effects
> just need to be visible when you get to where the resume is?
> 
> If the latter, that could just be turned into a nested disable (e.g. a flush).
> In this case, there is only 1 PTE write so no benefit, but I wonder if other
> cases may have more PTE writes that could then still be batched. It would be
> nice to simplify the API by removing pause/resume if we can?

It has clear semantics, clearer than some nest-disable IMHO.

Maybe you can elaborate how you would change ("simplify") the API in 
that regard? What would the API look like?

