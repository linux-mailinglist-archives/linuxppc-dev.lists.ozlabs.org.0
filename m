Return-Path: <linuxppc-dev+bounces-13232-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AC1C0352F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 22:08:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csxtr67q7z3clw;
	Fri, 24 Oct 2025 07:08:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761250132;
	cv=none; b=Z4QUBpckTv7WhNhnLkSqeFmyiKSQynee3m6ILV5isKNnMuR0VkKgZJpz3ernqmLmZYwSE3lIRZ+E3r5n3gQ9/5at4Y9fcqnCiS5vN3syGWInwsE3NE6NWwhEgl/ox9BKX2WpghOe0pX6L3JN2GkUBtCPYPPe5w9LqLGHIR5fBZbjjdqRIIU/jF8vFcGSkM5jM5Xm2B0TvO65xO3MPvJUUMUSvCLq6P/+Z7WeGwaOBpdpV7vP17MF829fk/+AKYFPiYkJpUQV7Un3QBY2KfI7OD5e3IgrCbe1XnFChrQqr41K9skBeX6/4BKuiXWELS4YT4CufQiLgMAKZgZVpzEOaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761250132; c=relaxed/relaxed;
	bh=3/xqA5Sno72zZ6iNEmFJ5mtAMbJynT1rhUprvMytuFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UnMDeiltu2/7w4jReNCiPbbxtPSG2No/+DwURF4wDcf3Ka/mg89u581/ZQV6g/VKZkPI9aL5CudHRF0iJDXW/b29apK7O0hceaxbMcNqrpLD91O15PBQicMP6UBQFB3hb/MTj2GgkdlpRmaIrm3BlYj5+zw+IBxflQku/wJTEPpZNj4blymGDF5N6GhvrzeMadqhciTZGJfb5DbwYC6RkERnPoSSOftT+v8sLpfVoDjh16tUQ6/yHrBJHgkujO2/VCUa6anBz55ygl9nNtOic85UpDhrBUwv9BiEAocTAjehMz+ztVJs93l8jgkHlVLk7cfu6KoXJ2DXNzF95V6z0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bCF3xmyq; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bCF3xmyq; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bCF3xmyq;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bCF3xmyq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csxtq5BWpz3cl0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 07:08:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761250129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3/xqA5Sno72zZ6iNEmFJ5mtAMbJynT1rhUprvMytuFY=;
	b=bCF3xmyqGhAxt2D2zsQiWIznqj3FOVeCl8+sQxO6yKNFtnMpL135Jc/DC0DOkc1XLWUoc2
	pXdCjS8oBzwVVJ+12YJR+8XrsXAnhVOMz+56GtAw8+/GYjuqBssaC6vW/Gpnz3v8BQlVns
	H/8D9KEJKADshfRX0oPJFucs6QKMZ7g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761250129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3/xqA5Sno72zZ6iNEmFJ5mtAMbJynT1rhUprvMytuFY=;
	b=bCF3xmyqGhAxt2D2zsQiWIznqj3FOVeCl8+sQxO6yKNFtnMpL135Jc/DC0DOkc1XLWUoc2
	pXdCjS8oBzwVVJ+12YJR+8XrsXAnhVOMz+56GtAw8+/GYjuqBssaC6vW/Gpnz3v8BQlVns
	H/8D9KEJKADshfRX0oPJFucs6QKMZ7g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-_sNDNOvbM7OrsGI9cgzUwg-1; Thu, 23 Oct 2025 16:08:47 -0400
X-MC-Unique: _sNDNOvbM7OrsGI9cgzUwg-1
X-Mimecast-MFC-AGG-ID: _sNDNOvbM7OrsGI9cgzUwg_1761250126
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47114d373d5so10062545e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 13:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761250126; x=1761854926;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/xqA5Sno72zZ6iNEmFJ5mtAMbJynT1rhUprvMytuFY=;
        b=xDySSNLNCsBTbBdxFgpV99bvlDa/WcTBwB3NDFDNZcOuE0Jz6vznHi3A46lLO0FCq6
         v2T2XQ4OVc7tN+v+XWXmnkykDL6FbWb3qSq1Qxg9jWp9qu6yKpfbfsZUvqvFTulBRVwD
         e6C88r2KJ6icpxRTOMjxBPZXdd862cr9LBDm92pzzn0FSM4TnvQv7VKWsCMqFgjP0Dtm
         cDL+GhjmwRQuVgRTHPNfWiFryBIQxjR5k4PUteJjD0L/AKflr1tARlJDcbySP7/YVZiM
         w/n48qTVrZ2QHhRwckNxj+0Ow650g0614H++XdyAcoZJDV4+7h4UziGZxusBME6JrWDT
         b4DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaHcLW6WwAXzoQYXN+0ydEhI0t1BuEN5q/E4TEjz8pM5xjiCg+iRM4wWB9wo2jYBpProeR0uYerSIMEak=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzYZf7Klcdnf/F19VLLTKvy8S7djkSNjFfyMuJ8BFYFw1hcisdB
	qoQj0VlhfV3GI8PIeyaT+/a7y1OVHONHNAwwxVJnx7H141j8g+DQomK1LAtKP5xiKuQObX7iSOT
	BdJ7rs/K2KTmxKfr8UkV9hFfwODspoY55NGdAXV45c1VxOCR8xffuIcJFhXzOf9NwOFo=
X-Gm-Gg: ASbGnctN2oHZr4Sc5yuDJYFL65Yt2SMSuB8AqevL31p45k5xI+twensAtUhPiOSLQNJ
	T3Fffeok5yAP2gGfxTx1TiOMgHP2ZHzOYnxQYIcaYA8sL44+DA6gCVVFt8pGjPqdYX+X4vQzpf9
	szTG3MmDyqIy7KUR/JAvTv6oio++QW8OIL4j3prc7Vh7DhuKU7zV9cg8OpwupvYXgHk6/HucXZ2
	ojEuCYHQnmHpiNunyGaukMtwdpOGyz//5bhuOkLnDmMgBDLPQAphVjoTZagjJJZJ7D19WxRLF+E
	18/6tmLN+DzNyz2qiZs3qCloY//opLUSeZOFXbTTlRT1whN3RE87XX1DOqUaAcQnlAP+Q4hiPYT
	Giq5hSkLIdlmc1gRYs2fYnVC0CJi1f6Mle2YyF7bHxsf+nDXpr/eLRMsy/+JS5hT61u359ftgCZ
	8TkpRZaV5Mi6IGasnkD3pv+AFsZMA=
X-Received: by 2002:a05:600c:4fd4:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-4711791c5dfmr213019245e9.30.1761250126426;
        Thu, 23 Oct 2025 13:08:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhLOfkc2goKkbSV/WelWxssM1PnfK27SOZ93tRWz4irrY4Van7GhpXF/QUV/ppkvRzGCYJqQ==
X-Received: by 2002:a05:600c:4fd4:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-4711791c5dfmr213018935e9.30.1761250125948;
        Thu, 23 Oct 2025 13:08:45 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4342373sm135497185e9.12.2025.10.23.13.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 13:08:45 -0700 (PDT)
Message-ID: <28f2ebe9-cfed-41c3-803f-8756dca0e300@redhat.com>
Date: Thu, 23 Oct 2025 22:08:43 +0200
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
Subject: Re: [PATCH v3 12/13] mm: bail out of lazy_mmu_mode_* in interrupt
 context
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
 <20251015082727.2395128-13-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251015082727.2395128-13-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Hix3uKoE8muPWrrPIrLC4syXaXyrRN0Piv6rvNXuKBA_1761250126
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 15.10.25 10:27, Kevin Brodsky wrote:
> The lazy MMU mode cannot be used in interrupt context. This is
> documented in <linux/pgtable.h>, but isn't consistently handled
> across architectures.
> 
> arm64 ensures that calls to lazy_mmu_mode_* have no effect in
> interrupt context, because such calls do occur in certain
> configurations - see commit b81c688426a9 ("arm64/mm: Disable barrier
> batching in interrupt contexts"). Other architectures do not check
> this situation, most likely because it hasn't occurred so far.
> 
> Both arm64 and x86/Xen also ensure that any lazy MMU optimisation is
> disabled while in interrupt mode (see queue_pte_barriers() and
> xen_get_lazy_mode() respectively).
> 
> Let's handle this in the new generic lazy_mmu layer, in the same
> fashion as arm64: bail out of lazy_mmu_mode_* if in_interrupt(), and
> have in_lazy_mmu_mode() return false to disable any optimisation.
> Also remove the arm64 handling that is now redundant; x86/Xen has
> its own internal tracking so it is left unchanged.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>   arch/arm64/include/asm/pgtable.h | 17 +----------------
>   include/linux/pgtable.h          | 16 ++++++++++++++--
>   include/linux/sched.h            |  3 +++
>   3 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 944e512767db..a37f417c30be 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -62,37 +62,22 @@ static inline void emit_pte_barriers(void)
>   
>   static inline void queue_pte_barriers(void)
>   {
> -	if (in_interrupt()) {
> -		emit_pte_barriers();
> -		return;
> -	}
> -

That took me a while. I guess this works because in_lazy_mmu_mode() == 0 
in interrupt context, so we keep calling emit_pte_barriers?


-- 
Cheers

David / dhildenb


