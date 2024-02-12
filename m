Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB90A8515A9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 14:47:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vtjq4HhY;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vtjq4HhY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYQkF66f0z3d4F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 00:47:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vtjq4HhY;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vtjq4HhY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYQjW1F0mz2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 00:46:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707745595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zKmWeo9+M/EVmSRX3wQ2UDRqy7D6ms4Kk2jOrOYSGJE=;
	b=Vtjq4HhYvrMeGxXFTvz9XmezIw2g/V4L+mSfys8ZVoHO7RP5VepZkOZZILMf+fb5/NvNZ+
	RAjbjsyPI7GzXJhbPbgYhAh38SgywVgkNr7/1QFGVrEIqH4EBV21zu92kH1GDMQ8nXzlhG
	w9I6Mh34qJPhovKUEGuHvL1f3rVB3K8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707745595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zKmWeo9+M/EVmSRX3wQ2UDRqy7D6ms4Kk2jOrOYSGJE=;
	b=Vtjq4HhYvrMeGxXFTvz9XmezIw2g/V4L+mSfys8ZVoHO7RP5VepZkOZZILMf+fb5/NvNZ+
	RAjbjsyPI7GzXJhbPbgYhAh38SgywVgkNr7/1QFGVrEIqH4EBV21zu92kH1GDMQ8nXzlhG
	w9I6Mh34qJPhovKUEGuHvL1f3rVB3K8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-ECPD42asP7iqWfIuMbpaLQ-1; Mon, 12 Feb 2024 08:46:33 -0500
X-MC-Unique: ECPD42asP7iqWfIuMbpaLQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-411a8c8d9b2so259545e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 05:46:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707745592; x=1708350392;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKmWeo9+M/EVmSRX3wQ2UDRqy7D6ms4Kk2jOrOYSGJE=;
        b=VKIOHf21fXiv+ApFcdTpb0h/BE4i+1J0LTtcfqNOOP+7gba9b1O78sjk2rR96YNqdY
         QMj4V9bHRNRw1VOYD8v9VSsUO3Oxy+JRW1QQV6XimTBgnzKiOcEQt78NEU8ItXvAorVr
         kPEe1J+Y2p3CVjxjrQrgqaS/+0ypII6lhqoKECPN99DTfliHtqvRoO/WoU/EIaKXUjlC
         HHColiWoRGGsQN85qLd5AETX3JZy69nOYxmX55dyhQGjRiq2xEsNEKGymA4JoUBwsAoE
         z+QRTQ+mJcWm4vaM69eNvv4yG4gOF29UYS80XsbwUpnjECDYorstnodyuX8U9hKecwWT
         KjdA==
X-Gm-Message-State: AOJu0YwlEFE4E0iQBc6zHUbFX3TjSt726jr6e6S1ehXR5dwbeQxHjtf1
	0JA3wf9pvCmKEMBGrKDspKt3hNMUSMBrbOsvpCUAyzH0c+Ujwcx5i6MZ1ZG/z8PK+78EhVGvH2H
	K7fjEunVgGXrhoh+osC5KylefSrFQK+kufn2+rm4ZfhYgCCoFaEtTgD3RoiTzHcs=
X-Received: by 2002:a05:600c:600c:b0:40f:dd3f:ba10 with SMTP id az12-20020a05600c600c00b0040fdd3fba10mr5191841wmb.33.1707745592214;
        Mon, 12 Feb 2024 05:46:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPplzWPcaqsso3N0CI/E/N7Xd7UgBngjC7BVWael91ny0xFI0Aw+/pztFLuooUEsC56YrOkQ==
X-Received: by 2002:a05:600c:600c:b0:40f:dd3f:ba10 with SMTP id az12-20020a05600c600c00b0040fdd3fba10mr5191806wmb.33.1707745591828;
        Mon, 12 Feb 2024 05:46:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWCSlxX41BvMfnIBhcdGMZl2lpBgDcDwOePABXkky0P/nzfUyDQBurJsAC3Rn3aYzEm/pJ2z2nKq3q9uku6xtqumdrSJjwcg9jmi9ZtIr0RKMGHnotL+yzYf9S4zwcj9Mwke+TnVtm953ifsd+mAUtGezxZpC8ZYxvBTfaRGnHiBRWA4rwgWRpVHGR6V88CfmKY2N3ho7Pf/7Hc+u2GBeR6q4rfUR+0kqgHgK2csKAaYfcwPLubnPICkGsiadrWMCYxoBq59OJpCKV8HPB3DK0Jd9YBI4qRgSkEVh0MGH7LLuSPzmcxBpGXCOQVjwE7giZT/VGSTggJV8NyHJU5fzuxCjD/XoK51wGF0xMNhBsnY9wonx3Bh71NABVFQylEiw3Ozwj4SsPh+9TewX1N0HvdydqsM1pWlrREKRdCWA+ZINOAFdafvKhpvTa4Dv8uPGJNys0K5oF1AdGel45TsEJGqWY1OPxASaQSXnsJHN31/0lqrHibmRZrAykgO8LtpqC+5ka75mhYkB8Vfgz0um22P1zoO2RnXZDA2vvqoucMqgq333sh6PvCYS6qubIgTk0e4+cjAQhcmy8goEm+4p3N5bowH49+Dl3k19fjuKTCZ3VS3z+xO9xx+AHRB3Hp0x0S/NsnvXrjEfiUvh9jmFcFdJcjCRVXM3OI5aXwLgkidGx1dfhPY/XmCneBxMIzEMhgr4TT7AgXQ9K1wKBM8RUCKhX/1Q9LsYRwmFTapKgO+sW8wZcgCLnH/RoOgsXPiSG13jhj/0qpEwAdyELrgclPl//O1YHwJ41ZoDegk3J4Ey7oJpDDvUQ9GWn6IG3bFrPBcihymlcw8yRF5mdIDs7dlGNU8GwwJqloiwJDZgSJ
Received: from ?IPV6:2003:cb:c730:2200:7229:83b1:524e:283a? (p200300cbc7302200722983b1524e283a.dip0.t-ipconnect.de. [2003:cb:c730:2200:7229:83b1:524e:283a])
        by smtp.gmail.com with ESMTPSA id cl7-20020a5d5f07000000b0033b8881f31dsm762856wrb.68.2024.02.12.05.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 05:46:31 -0800 (PST)
Message-ID: <40889617-0820-473e-86ed-04eca6489169@redhat.com>
Date: Mon, 12 Feb 2024 14:46:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/25] arm64/mm: Implement pte_batch_hint()
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
 <20240202080756.1453939-24-ryan.roberts@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240202080756.1453939-24-ryan.roberts@arm.com>
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
Cc: linux-mm@kvack.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02.02.24 09:07, Ryan Roberts wrote:
> When core code iterates over a range of ptes and calls ptep_get() for
> each of them, if the range happens to cover contpte mappings, the number
> of pte reads becomes amplified by a factor of the number of PTEs in a
> contpte block. This is because for each call to ptep_get(), the
> implementation must read all of the ptes in the contpte block to which
> it belongs to gather the access and dirty bits.
> 
> This causes a hotspot for fork(), as well as operations that unmap
> memory such as munmap(), exit and madvise(MADV_DONTNEED). Fortunately we
> can fix this by implementing pte_batch_hint() which allows their
> iterators to skip getting the contpte tail ptes when gathering the batch
> of ptes to operate on. This results in the number of PTE reads returning
> to 1 per pte.
> 
> Tested-by: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>   arch/arm64/include/asm/pgtable.h | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index ad04adb7b87f..353ea67b5d75 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1220,6 +1220,15 @@ static inline void contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
>   		__contpte_try_unfold(mm, addr, ptep, pte);
>   }
>   
> +#define pte_batch_hint pte_batch_hint
> +static inline unsigned int pte_batch_hint(pte_t *ptep, pte_t pte)
> +{
> +	if (!pte_valid_cont(pte))
> +		return 1;
> +
> +	return CONT_PTES - (((unsigned long)ptep >> 3) & (CONT_PTES - 1));
> +}
> +
>   /*
>    * The below functions constitute the public API that arm64 presents to the
>    * core-mm to manipulate PTE entries within their page tables (or at least this


Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

