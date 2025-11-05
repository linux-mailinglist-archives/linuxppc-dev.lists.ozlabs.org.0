Return-Path: <linuxppc-dev+bounces-13789-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FD4C34FDC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 10:58:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1gkk0TFXz3bmk;
	Wed,  5 Nov 2025 20:58:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762336717;
	cv=none; b=ljci7a5RJvXqMTlmNpf++WSjXQngWk5ExGUkc5yzV52njMRtMyfszhwld6J0LHeyX0rdPAe3TlKzQ1kByaDr1bbBR+T2GVLiiCzC+uU1X/yOXMfs9FKZ0mfR1frcde3i7CCYs4fRHahL3jF5k5c44CBQeDV75Xd5ypTMSPFl0skh7y/aMDvu45v2+1qb3ygYXEWiorbsn1G5t+sU8HOyosA2VCHNwLVos71vN+K5Wd8/l/4peH03vG1dt3eRaNcn4U6ziQOozzVIeftg5u49NfjkJERUWV0s/n349ZCBIGw7Ka/dpoUQKynVLc8jInm5RBvIrQ32SFF6M4JQFzu0Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762336717; c=relaxed/relaxed;
	bh=PiM5gwx7v9fuKjSNGU0XIbMsJHzNcD3t6sxDOvTigVo=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=kxnOHOCU2tPk6MpU5Btl+YizlvSWjJqynejPHeLazkXrp8sBm6XmHrYx7LyYTPLGxGkw9uPj085+iptoxZeM95zAEAaHkpxcXw/jxOiQGZq9xVSreSLGfI9AL28b3Kq2Z7gvJaquByc5a2fbAySGZDXCHDacFV5xynJIXXIV8n0CaRIMRVXz+9Wtmfuv/933OYLgYpjxUD0PxqMQPtUTH6UgKIIAAvB28gSLXQbMdLX1EF+kK6FY7mQ5lHv/EQCj2+HDDIYj6zJIXRD6e/ipAOuO4C3ncB2xMd3nSVLDHOij8innNtH6lEEQL3QJlddH3RpqAKxgXcuQ1YALnaREdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=grSCbl7N; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=grSCbl7N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1gkj1j2Gz30Qk
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 20:58:36 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-294fb21b160so45998085ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Nov 2025 01:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762336714; x=1762941514; darn=lists.ozlabs.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PiM5gwx7v9fuKjSNGU0XIbMsJHzNcD3t6sxDOvTigVo=;
        b=grSCbl7N6uvDmAQFcGpVwdFBd1AFaTxaPw8uXnUqrkYJe24054sKc6HKbuip/hMd0h
         UT/TazzYgIMF83d7CuyVtwjD6rfqW4kMgpMJ8ou68i2dvexHK3ej6wMiCT+WVDJAULIr
         4Ld2qncDNL3/0lH07d16XS2M0/w529OVCIgCdkHbfJB6ynDGopNZjvjASet7epI79iKC
         kglzuG19WsUYp2X4WuFFQauWyjEHxZcblq/+F4OxqZmtWODrSuH/8v8qpUzNyWK78Fpa
         1VS9uzLkcr4NlInyMjW6enqnynYzrN/S2iQMuNfa0zB2yctWYiXBIPwxDe6IpU7Wd1N9
         Xafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762336714; x=1762941514;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PiM5gwx7v9fuKjSNGU0XIbMsJHzNcD3t6sxDOvTigVo=;
        b=GHgspQoUFhfqvg1TR7mNK9yQkDVBeho/emFXrHbu/FoYLx08n4ETo9ESRlgThYwCAh
         IO1yfnkmV75TpRZUlnwQjV64i9lfZFVa5soWa2F3lbUBHCNspreqmUrGpSM994onFojw
         biPbCJLQbBKh78o1NdXhqtnQ2Yil/CFLmhgPpz1uOPY/pQyFnsnnsAoXP3omdygsv4FF
         MkSeydC2prcI8q1BPlP1V0KOAA9oqLBM208vZfYeCw+3p0s9U6YzeIAGwi6OH9rI1NJ0
         yrUr/Hq2WlSssBTfE7NU7ujWfYVjkeLLmuOdwPx/3DzQ7V7JsXm6mkoSlihcTvJRgY/E
         ZUcw==
X-Forwarded-Encrypted: i=1; AJvYcCWxgPrH9RRAa6CAk+Cg2n3gNOkXtdtz8L/bCWiGIE6Nu0cgvdLXJ1eXcqaZcu1xNlNu3KFCJ5VL3FBZ60Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyIGASKjZKJVpSAvwQxKu1zsKxWo5ck5lqenKm2uvvnpNj7OhYs
	KnKpXUleQZI48HfRRHu3dLxOreisW+vCy6/1w5OL+bIWMrKl9lHwBR3V
X-Gm-Gg: ASbGncuF5MQuw1E8fFVyS7nkC59V+ylosJaBGTb0FQfzffVhgj8sak6WCsxam9jfMG+
	cCDPBqdgcigYHQfCJL1L70P6wBePuiA0YEWl8ruRHEZqiEmOuriyK9uTPHeKbbSM4tM7MRmbDEB
	ejLH/Oet2lsT4EfwhAcf+JwlnAQ3BiNFmgmt7te9Tx+JSSuvRJt22zkrYKMN2RYbj1GmszOD+HT
	+vjrYlfInjYZ3bog1vFCswAJ2p0ZKWdl5lMEDb+iPAk8jDoEmrg0XvS2vBvi3PXP7qkihm/nF4R
	fF5ZR7WZWU9vFsvbeEErVNsXBn7IQNN2in21bBWQ4bmexo5/A1Xk9ToK0eygcbzHIFcvxeaJuez
	U+FN0qIOqfs45UyMDMXuHHg3bcp38dfatWzfV7I/qK59d3ty4Iz7VT6TVrwfW1WUfhTKMXw==
X-Google-Smtp-Source: AGHT+IHbi+0zqKpbA9V2mHcqMUNAu2olVZcwJU6s62eDD+69tSv+JW/d6KHzoaPAbvo+C4JRz5nOFw==
X-Received: by 2002:a17:903:19ce:b0:246:7a43:3f66 with SMTP id d9443c01a7336-2962adb2b0fmr33595265ad.7.1762336714441;
        Wed, 05 Nov 2025 01:58:34 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601972ad1sm55039695ad.19.2025.11.05.01.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 01:58:33 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v4 03/12] powerpc/mm: implement arch_flush_lazy_mmu_mode()
In-Reply-To: <87pl9x41c5.ritesh.list@gmail.com>
Date: Wed, 05 Nov 2025 15:19:35 +0530
Message-ID: <87jz044xn4.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-4-kevin.brodsky@arm.com> <87pl9x41c5.ritesh.list@gmail.com>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:

> Kevin Brodsky <kevin.brodsky@arm.com> writes:
>
>> Upcoming changes to the lazy_mmu API will cause
>> arch_flush_lazy_mmu_mode() to be called when leaving a nested
>> lazy_mmu section.
>>
>> Move the relevant logic from arch_leave_lazy_mmu_mode() to
>> arch_flush_lazy_mmu_mode() and have the former call the latter.
>>
>> Note: the additional this_cpu_ptr() on the
>> arch_leave_lazy_mmu_mode() path will be removed in a subsequent
>> patch.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  .../powerpc/include/asm/book3s/64/tlbflush-hash.h | 15 +++++++++++----
>>  1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>> index 146287d9580f..7704dbe8e88d 100644
>> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>> @@ -41,6 +41,16 @@ static inline void arch_enter_lazy_mmu_mode(void)
>>  	batch->active = 1;
>>  }
>>  
>> +static inline void arch_flush_lazy_mmu_mode(void)
>> +{
>> +	struct ppc64_tlb_batch *batch;
>> +
>> +	batch = this_cpu_ptr(&ppc64_tlb_batch);
>> +
>> +	if (batch->index)
>> +		__flush_tlb_pending(batch);
>> +}
>> +
>
> This looks a bit scary since arch_flush_lazy_mmu_mode() is getting
> called from several of the places in later patches(). 
>
> Although I think arch_flush_lazy_mmu_mode() will only always be called
> in nested lazy mmu case right?
>
> Do you think we can add a VM_BUG_ON(radix_enabled()); in above to make
> sure the above never gets called in radix_enabled() case. 
>
> I am still going over the patch series, but while reviewing this I
> wanted to take your opinion.
>
> Ohh wait.. There is no way of knowing the return value from
> arch_enter_lazy_mmu_mode().. I think you might need a similar check to
> return from arch_flush_lazy_mmu_mode() too, if radix_enabled() is true.
>

Now that I have gone through this series, it seems plaussible that since
lazy mmu mode supports nesting, arch_flush_lazy_mmu_mode() can get
called while the lazy mmu is active due to nesting.. 

That means we should add the radix_enabled() check as I was talking in
above i.e. 

@@ -38,6 +38,9 @@ static inline void arch_flush_lazy_mmu_mode(void)
 {
        struct ppc64_tlb_batch *batch;

+       if (radix_enabled())
+               return;
+
        batch = this_cpu_ptr(&ppc64_tlb_batch);

        if (batch->index)

Correct? Although otherwise also I don't think it should be a problem
because batch->index is only valid during hash, but I still think we can
add above check so that we don't have to call this_cpu_ptr() to check
for batch->index whenever flush is being called.

-ritesh

