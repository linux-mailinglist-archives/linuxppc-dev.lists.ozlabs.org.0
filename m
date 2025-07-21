Return-Path: <linuxppc-dev+bounces-10345-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AA5B0CD70
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jul 2025 01:00:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmG856MT3z3bgV;
	Tue, 22 Jul 2025 09:00:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753138821;
	cv=none; b=SRwDi7r+hGmt8ZWeFPgw7T4UQR8VZTMtD1M6CZEeZVnD21/f83lcqkf1UPrCAtnR8fJyTsatBl69MY/iXNmdKk2b68gJ6Bv2bN4PMXNxa6yxeb1MfD9JUSkCh7hKNt6AJYCSsZBjd6h3UcSHWgp5wdM3TlSBL7qJaIyjlksxc/pvBlkYiG5K2hZdKFyrlrUlix+KX2hS8uVuZVW06OVVL/mZ27yzP5xrVNe0sJNsoeeoBjHx01vECWWyJ4xG3istldqaMawMRc1DRRtyPDrx/hG/dbVPaY3ZoNbbYc3MOhQQYZ0aInkk5dmsI5WYCiioYAJruPzVsxOQgSBuiZ+yDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753138821; c=relaxed/relaxed;
	bh=qL9A0aUIl8Uddr//bj642F7utZi72l2outni4topsME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0RThufQt9S9JeTc72Yu4lwm3DfsbyyDOtjdbS5OUp5i4405Ekvrz4Yoj2SdFpD3ZE9Y5rK0MFjmK6mhBqymFP7PThGIlZQLdXMJCRuGfLYrLA5KoGR37p2YBAADOU5GPsu/UKJQ//b4OjwA/iE/he82S1NL4omcO2D2tikrIJFtPa6Go7JUM6ljLqc++EKgdQZxmPeJkaXySYTT1Tzx5YQZPtk+sYJY4ugi//KesP0PnmMI+FTmtdR6BLLL+FM3ECnuE4ErOKmDPEUZ7l1oezKa50Xi1bjMLwbjApcm9K1YsGF7p9riCvYmSpAitBimRq968bLVHKeWIpNQs2amxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W0SKjBBL; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W0SKjBBL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmG846qT8z305v
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 09:00:20 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6075ca6d617so943985a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jul 2025 16:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753138818; x=1753743618; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qL9A0aUIl8Uddr//bj642F7utZi72l2outni4topsME=;
        b=W0SKjBBLsQwL/QvRWHC6ykADv4B3RVC8gi55vXHEtjhwg0pf8vHiT1pWApQWSBQ2fn
         b4d4YQStifFEf6kZf9HAn51PgjkAXdmohy3PTAxtewIXjAn0Z2iFcq1RD7tNmSGNQv4k
         SUilWRUYwiso+MdAKwzH0XJPmr71KJ02s1bvHTvRYzZwmHZ5O6Nb1nn70cH4C/hRG5Ts
         PS1mxxSjhq17h3BMO8ujWOBJOIXgzAgWikURgt0EfSqCLqGs158Avr8Pf0Bud2vBs2Rc
         tvh2bvQ1vGsYCFHvTheA8Ue5SQkzkdEmgmdwXFSUFEjkbNx3c8n34fBvU/EHA5unYpf+
         7cFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753138818; x=1753743618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qL9A0aUIl8Uddr//bj642F7utZi72l2outni4topsME=;
        b=vo26b6FAEI3L8K3hDjISz6fGNhe2lW7GJQ7i09L9u+lXOcs+4QqCAiw+uSVNaCjr77
         xFsqsJ3xEhbeDaMxmY1mVna46VSqvtT4Jvu8DXHsIF7DT6wwEuxTT0DsXs7wJmRc0ibx
         vsAQ+Y0OVOvjdu0awPtsbHh9RVKN66/hZNisSaR5mlQ2K4CO0RA08Ywv7DyKxaDirf5J
         HpyR+MJ+K20iQ3jbriFYO9Z8xRW3z+3VouW8WY+0JFKBom0CXBXYR73GY00vMrKHpG5a
         L56dV/fUH9wy91o2bLuY7f0BQfSkqRCIiasARIowilpyTobCxsNb/8glCdPPSd7Av6Kt
         2R2A==
X-Forwarded-Encrypted: i=1; AJvYcCXA9vCwCC6ip401wIeFoVLerIqxTzqYv/EI3NpYjvoePzMso170Q+biOlz2kQlUKxhs5FKxgSoDoxCNynk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz4mkunxSJ+g6gqSl9nlR/zmZ9y20Vw1r2KAM+BRVhIXrL7v4RV
	sMwtgNNXQOd1sVfCbz6paR0kg2uK0l9H6/b7puqF0qzA8jf+4y2oY8W/
X-Gm-Gg: ASbGncuzx/pYQOBijVT8thS3xXgZJip+RMkvh4uPjCZdaVOZSuB3X9ETMRdg2vECDLy
	fSm2Ryt7Nma5i/LnsZ1tsK0LMKvrI7CFkuWc/70vqY5YTuP9hoVquRu+jbMip4g2RhQrQ2r99jm
	oD2socaBj6tuTSRDRdH+berhyg7u6yNWqN/RazfzUofvZAfvwdRXcOdrXWK8873R+SrayPL+tsc
	O69Xaonq1Q9v8T/e1ihv8YpVl+WjS0fkiBhFjM7YJvCjzdKNz9ImSjUndZ5C1iZPeKLHIg7U5Vt
	MEqc9qjB/ePHoj+iF6rN1SJIVn2C6wIma1vmsk7AYBZ4T0i82XDHexvzOVwNEy/g/JuFRh5hS5x
	PvqcUQ9Yf1TwRcCI+oVfKveSaSe8yOaLTuVx+RhzR/dW5twgsYzIzB8SFRz2PSwkBs1Fg
X-Google-Smtp-Source: AGHT+IHckuXEWvfAMpSzjjL6pEsgi7MWI7yYCMOiqpAqEO5gMn0ATvaVtw0/vmnoItEaOlX4DlEKBQ==
X-Received: by 2002:a17:907:7fa1:b0:ae6:c555:8dbb with SMTP id a640c23a62f3a-ae9c9af98e3mr887526166b.11.1753138817353;
        Mon, 21 Jul 2025 16:00:17 -0700 (PDT)
Received: from [192.168.0.18] (cable-94-189-142-142.dynamic.sbb.rs. [94.189.142.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d8357sm753164466b.52.2025.07.21.16.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 16:00:16 -0700 (PDT)
Message-ID: <c8b0be89-6c89-46ed-87c3-8905b6ccbbeb@gmail.com>
Date: Tue, 22 Jul 2025 00:59:56 +0200
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
Subject: Re: [PATCH v3 07/12] kasan/loongarch: select ARCH_DEFER_KASAN and
 call kasan_init_generic
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, hca@linux.ibm.com,
 christophe.leroy@csgroup.eu, andreyknvl@gmail.com, agordeev@linux.ibm.com,
 akpm@linux-foundation.org
Cc: glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250717142732.292822-1-snovitoll@gmail.com>
 <20250717142732.292822-8-snovitoll@gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250717142732.292822-8-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 7/17/25 4:27 PM, Sabyrzhan Tasbolatov wrote:

> diff --git a/arch/loongarch/include/asm/kasan.h b/arch/loongarch/include/asm/kasan.h
> index 62f139a9c87..0e50e5b5e05 100644
> --- a/arch/loongarch/include/asm/kasan.h
> +++ b/arch/loongarch/include/asm/kasan.h
> @@ -66,7 +66,6 @@
>  #define XKPRANGE_WC_SHADOW_OFFSET	(KASAN_SHADOW_START + XKPRANGE_WC_KASAN_OFFSET)
>  #define XKVRANGE_VC_SHADOW_OFFSET	(KASAN_SHADOW_START + XKVRANGE_VC_KASAN_OFFSET)
>  
> -extern bool kasan_early_stage;
>  extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
>  
>  #define kasan_mem_to_shadow kasan_mem_to_shadow
> @@ -75,12 +74,6 @@ void *kasan_mem_to_shadow(const void *addr);
>  #define kasan_shadow_to_mem kasan_shadow_to_mem
>  const void *kasan_shadow_to_mem(const void *shadow_addr);
>  
> -#define kasan_arch_is_ready kasan_arch_is_ready
> -static __always_inline bool kasan_arch_is_ready(void)
> -{
> -	return !kasan_early_stage;
> -}
> -
>  #define addr_has_metadata addr_has_metadata
>  static __always_inline bool addr_has_metadata(const void *addr)
>  {
> diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_init.c
> index d2681272d8f..cf8315f9119 100644
> --- a/arch/loongarch/mm/kasan_init.c
> +++ b/arch/loongarch/mm/kasan_init.c
> @@ -40,11 +40,9 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>  #define __pte_none(early, pte) (early ? pte_none(pte) : \
>  ((pte_val(pte) & _PFN_MASK) == (unsigned long)__pa(kasan_early_shadow_page)))
>  
> -bool kasan_early_stage = true;
> -
>  void *kasan_mem_to_shadow(const void *addr)
>  {
> -	if (!kasan_arch_is_ready()) {
> +	if (!kasan_enabled()) {

This doesn't make sense, !kasan_enabled() is compile-time check which is always false here.

>  		return (void *)(kasan_early_shadow_page);
>  	} else {
>  		unsigned long maddr = (unsigned long)addr;

