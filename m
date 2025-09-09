Return-Path: <linuxppc-dev+bounces-11920-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 352BCB4A6AE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 11:07:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLdJK74Mmz3cYL;
	Tue,  9 Sep 2025 19:07:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757408865;
	cv=none; b=lFTKZxWvXMWV5lHHe8Y53+3R9dMv0+az/4Rjw9Nd+bTYUtWbMB//79ZYdG3AyrY95Ivhw8jcg1B55hAW1fi5ev/rv3cSdePmLA9Hj6rvfAbaE3qFNAp907dJ8JdOCzgTLIoIcdBziGbVIFz55qeHMCUvoGMYtl1/D/rx3DTpsOq7OIN8pwIJFovMGSszCwbfrS3ZIDg2hdHGkL3u5HixaDy6OIA2TUQbhh5UyQnpPmSQ6zjVJaea7MMR1EUFx92ErzHAxE6+tMZ2enVdaiPPAX+5VFzQ0VpAxdhGFEgzfkAcgI28ziOvPsOCMklYX94Yr2+u1tKXAyhdYwYBaGFKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757408865; c=relaxed/relaxed;
	bh=wfLFN6eNqIPI3eYn2mOCbZpQPxjwFCGNIowHmmpIIeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=la2TcFz5d6JHlNsijR4PDUE540rIBSuAJk4IkjH/qTeElXBQJ6q1rI7rJvCLjjwQ/6fz3XL+LUSkLADlzrzxtomIvl0jP6CmOJbGiyG31dPT7wgfXo11fUW4gUJrE6a5T4yNBpPLcHuqPUGORO5DYET8phVtAHGE+Y7HyO7c6CZ1+SqhzDMptJEQvn8loeMqMcK3szRiFxPBvVxiIjlSPb/EnxzdFhX51/PZJbpm1HfUmm28uw0k6omyoKEULO5Z8HF1ywJMyOIbl9Y1v7l+DuLvKnt9aUk7BWcCisnLNqC2CBUJAkIdhqGvToN9gPiOp23m6c5xCrCtllMK0G+8og==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Flnv04g4; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=el2YFxR6; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Flnv04g4;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=el2YFxR6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLdJK0dC2z3cQx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 19:07:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757408861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wfLFN6eNqIPI3eYn2mOCbZpQPxjwFCGNIowHmmpIIeQ=;
	b=Flnv04g4BCDwhTa3Te2nd4UcEtZikSvaj5bIKeDTdNkORNU8G53l+63BLDD1z0tdO/t4AY
	hTXVsahiww91T+h9AzU9219OYaYlO/xUk/I78X1fGMDzOXQ5ObK6+lJO/owirQqlWgYF61
	yVyy4I8tKYgg3Slx7xjqomJpeyXUm4g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757408862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wfLFN6eNqIPI3eYn2mOCbZpQPxjwFCGNIowHmmpIIeQ=;
	b=el2YFxR6YNYxWHeweK+6MhoY3tohMsMG9/tNVGKUl44Bhpe4jMK8OtcMVoMOnqK0Mbl+xi
	/XZj6ZKNNFpmgFu1WCKLexSibPI6hXLvFNp6zpfaNsD3BZrzHkMPlROpC/PiQpIA5Zzg7p
	O15EJslwUBECgSVq708/YF3u13GXhyU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-K6XnwbvzP8-heujNURea6A-1; Tue, 09 Sep 2025 05:07:40 -0400
X-MC-Unique: K6XnwbvzP8-heujNURea6A-1
X-Mimecast-MFC-AGG-ID: K6XnwbvzP8-heujNURea6A_1757408859
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45b96c2f4ccso31723285e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Sep 2025 02:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757408859; x=1758013659;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfLFN6eNqIPI3eYn2mOCbZpQPxjwFCGNIowHmmpIIeQ=;
        b=kyeIoCGDJHm5zgvOF/9bt1kZQ0YQe560ZtfNmj9Ondx+p9LWpngfAXC/QkojlaGv+0
         tR5xX5LtYOLMzakIN0djyyw3SwtEtARKdH3HKyKy4sMDuMUyCepbitlC2vZ7WyXGjtZK
         v5KXv/9T91am39EzxQfPeucOmfyBili/TE0zTZsgu2rpLH6NdFsADbU7DemAWGGdS36C
         4L301NbBUuzAckmuwRdjvmvcr1X32Hxj6NEkI3/ALUnaV58avVuhaONgwE9A3SGGYYrE
         8YBGqqJH3GTnNNmX01Hy+m6dW8gf9E2Akl1Df693/CfHMFlFtoc1Lt8tkex37wVYP80Y
         9sTg==
X-Forwarded-Encrypted: i=1; AJvYcCUa31S2pmjYUW+HAYHw2brqDJpTXqVhdnLSXiXfxslhvkf6cEft5h45Y/B38HBcmfw3VTtkgwMVKEdfKc4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwDbPi0zVXHehra077RGAW94yQlzd2jJCShsZ4iB4Df1JgY9tpG
	lhAFXcOrTCIxZwS3VV/HVJXPewmzr1MCcFQqILlRL+3D/FGcYaUZOZ14o9w+Rc7hr46pskMooiZ
	YRnpUD1rf8NUjhONk2OH4IJ7ys79Me8c52sdBvSdep2aNm5dYVZi+BHGK0YI2NdNhzig=
X-Gm-Gg: ASbGncvmkBT0qPsvJQ2dNS1MObn+Ytjj+cI14WEIXLkK2ntzfC9/1GmWzxz54kXeg7h
	Q7VAvVZ12FAbUqWzcltaqU94WtH9nsU2CGonvbrsvxUYcQaPsWIqvv18cnU+QiDBQmYSFUD45mb
	UJrwEerT3O4aTxPESH6AYl61fWx9HQ3qqGXq2DVeEYGBHVs5xUYH4nw3hmxvlysx8WIJyZW47Qf
	3JSrd7kmfiDtFWiHpCuwn2sAMkPgI0arvYSV24E25GgnTBK1XRSX+fKf2CvpA+iMxEjqyfzAtlm
	FgQqhF18Ns/AbgMRVsvXGPk5XP0lix/jYaVujV3hQKfHwbl2zIYiUE+jmvHyR5vLT04FKv2vDyp
	dFP00/yIdOJP6iBiC6i8lCR0SY9uPeo6MY51owFJn/tmMIJafPDqo0nht9aGTotSvV3g=
X-Received: by 2002:a05:600c:1387:b0:45d:d2cd:de36 with SMTP id 5b1f17b1804b1-45dddeb8e9emr100153035e9.12.1757408858971;
        Tue, 09 Sep 2025 02:07:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXDnypB5wJ5rDn/zJEyHS9xO4uduYWB/+gBqRR8sdBFWJ0cHWyM3HNnqaB+9K2c1SmVJ00yg==
X-Received: by 2002:a05:600c:1387:b0:45d:d2cd:de36 with SMTP id 5b1f17b1804b1-45dddeb8e9emr100152415e9.12.1757408858433;
        Tue, 09 Sep 2025 02:07:38 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34? (p200300d82f239c00d1f6f7fe8f147e34.dip0.t-ipconnect.de. [2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df16070bdsm5517555e9.3.2025.09.09.02.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 02:07:37 -0700 (PDT)
Message-ID: <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
Date: Tue, 9 Sep 2025 11:07:36 +0200
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250908073931.4159362-3-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KnFyLGD6hzMCzSexi_PikgmjO0gRNyvjdQ9WqxbNEtw_1757408859
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 08.09.25 09:39, Kevin Brodsky wrote:
> arch_{enter,leave}_lazy_mmu_mode() currently have a stateless API
> (taking and returning no value). This is proving problematic in
> situations where leave() needs to restore some context back to its
> original state (before enter() was called). In particular, this
> makes it difficult to support the nesting of lazy_mmu sections -
> leave() does not know whether the matching enter() call occurred
> while lazy_mmu was already enabled, and whether to disable it or
> not.
> 
> This patch gives all architectures the chance to store local state
> while inside a lazy_mmu section by making enter() return some value,
> storing it in a local variable, and having leave() take that value.
> That value is typed lazy_mmu_state_t - each architecture defining
> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is free to define it as it sees fit.
> For now we define it as int everywhere, which is sufficient to
> support nesting.
> 
> The diff is unfortunately rather large as all the API changes need
> to be done atomically. Main parts:
> 
> * Changing the prototypes of arch_{enter,leave}_lazy_mmu_mode()
>    in generic and arch code, and introducing lazy_mmu_state_t.
> 
> * Introducing LAZY_MMU_{DEFAULT,NESTED} for future support of
>    nesting. enter() always returns LAZY_MMU_DEFAULT for now.
>    (linux/mm_types.h is not the most natural location for defining
>    those constants, but there is no other obvious header that is
>    accessible where arch's implement the helpers.)
> 
> * Changing all lazy_mmu sections to introduce a lazy_mmu_state
>    local variable, having enter() set it and leave() take it. Most of
>    these changes were generated using the following Coccinelle script:
> 
> @@
> @@
> {
> + lazy_mmu_state_t lazy_mmu_state;
> ...
> - arch_enter_lazy_mmu_mode();
> + lazy_mmu_state = arch_enter_lazy_mmu_mode();
> ...
> - arch_leave_lazy_mmu_mode();
> + arch_leave_lazy_mmu_mode(lazy_mmu_state);
> ...
> }
> 
> * In a few cases (e.g. xen_flush_lazy_mmu()), a function knows that
>    lazy_mmu is already enabled, and it temporarily disables it by
>    calling leave() and then enter() again. Here we want to ensure
>    that any operation between the leave() and enter() calls is
>    completed immediately; for that reason we pass LAZY_MMU_DEFAULT to
>    leave() to fully disable lazy_mmu. enter() will then re-enable it
>    - this achieves the expected behaviour, whether nesting occurred
>    before that function was called or not.
> 
> Note: it is difficult to provide a default definition of
> lazy_mmu_state_t for architectures implementing lazy_mmu, because
> that definition would need to be available in
> arch/x86/include/asm/paravirt_types.h and adding a new generic
>   #include there is very tricky due to the existing header soup.

Yeah, I was wondering about exactly that.

In particular because LAZY_MMU_DEFAULT etc resides somewehere compeltely 
different.

Which raises the question: is using a new type really of any benefit here?

Can't we just use an "enum lazy_mmu_state" and call it a day?

-- 
Cheers

David / dhildenb


