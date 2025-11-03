Return-Path: <linuxppc-dev+bounces-13698-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C89C2CF6A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 17:04:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0bxF2qpTz304H;
	Tue,  4 Nov 2025 03:04:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762185841;
	cv=none; b=ZtNvtXeECDnltLEZZWlLpE212S46js/BdSuTA8oxrXtduLUbrNJxhFNG3S+9TOKHSvJqL8FG8IRIdCcgS4dOFMacku7YYYYy3kptKbq0YY1WVnjPDggELr0SaSzc9iCbkPrSUbKBsi4yq3/I9KNvgkQBXryT6FFOM0u5RZTmlR/PyEP1rEfRmWaAzoLUtvE9Xm1WsJFfjxrEM0l2uC0pI9+RHIjcPGD3xWCZwdB97hnd0jyGBnRfYTNNNLkvQh5mIKdjrGXk6QmAUzYV9v573b+t29DukbNaSu4XD6/yP9VwEzDPhppelE5ez2zzbrFMeP7H7/l0gTu5ZCo3Bx31Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762185841; c=relaxed/relaxed;
	bh=lAB1nRPhZgw2D2F/txfufevKSsNDcd09VLHZkiGFvSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZV6cVybJ126WYLRKTrUcty8SJVS6Kzrz3P+D+eWbZKfBJFoR+tViU8qVcb1hbkI/t0Uq+EeTpPapJxW6QLOcLLPLJEmyUoIlYrfic74jKhlkMCNcKAfWzhfAP2CHXKq2HYQ4+5FRhiqb99psO3RCdnK86qYXFkZ2TsN7VA5SbI5lJZ6uPnZrfZpGchJf8mKGdlBPZuK01IdvvYxvNZSNUOjVndcHvK4d74KaEMlfoef8IWdyrbh7A0OfZlTXaRSAJuNrLAcBma5G36gUPH/p/ppiYy0wzcYvzNRyN/VOIxqp5hUYE82C2zPyKY0mdrdDKjq49GT+jot2RBXMzoN9oQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CGOv8A+C; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V5aQEiOY; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CGOv8A+C;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V5aQEiOY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0bxD0blDz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 03:03:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762185829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lAB1nRPhZgw2D2F/txfufevKSsNDcd09VLHZkiGFvSY=;
	b=CGOv8A+C7rOGKqKlbbbSqZE9dX/Er5cOUdCLp2IRLzvRs5gu/aTRROl81ixake68mR5XUD
	XJsjQqMoOtokTA78QmGnISqYuRCtcXuXRf6UGtUqDAAoIFEseVx5YNUxpdpdfRSwxPuOpo
	Ho3FN1WCHM+/71K8vqR9W0iBH0frLAU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762185830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lAB1nRPhZgw2D2F/txfufevKSsNDcd09VLHZkiGFvSY=;
	b=V5aQEiOYZqrzeKF2eFrzWpHbbOJEnecsE5utLoB5P33s9xRwnsNZIK9KvP74mg2lJxEhM7
	qzDC66iY8HzNYW4TtTudlOvebXH9lVIJmy6X35m0JMzTdOno8H4Db60l4HuHXjgZxFnxVI
	ZNRKAGkNVuJy+ITa/g0PeTeYPzS7mCA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-Y1YR_SoHPw-7deTkvBvj7w-1; Mon, 03 Nov 2025 11:03:46 -0500
X-MC-Unique: Y1YR_SoHPw-7deTkvBvj7w-1
X-Mimecast-MFC-AGG-ID: Y1YR_SoHPw-7deTkvBvj7w_1762185826
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47717c2737bso17705125e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Nov 2025 08:03:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762185825; x=1762790625;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lAB1nRPhZgw2D2F/txfufevKSsNDcd09VLHZkiGFvSY=;
        b=XRV8ItrX3EHEyRhEm3hYzvoTyndzpzOlw7xEwH6ILc+cQjBQXqPVxkmJEJph/Q08hR
         A64tF896ruuXg9q/k5PyrPXHowX7eiuhIMDwMPHL6mGVQ6mK6nXsWDDhEyszwohQ1JJs
         1Qg+FQWZ36isHThR8H2G+iFdry2/m5YTpfesfGqVYaCZXUTwMPXck4td0i7HbP0SRyTp
         ys7HcSmtP10rXvHxVyq1Lvt62l7ncl7U6ZzqUBw74YUOssQt6Fy4dNKYrrKcAErJg0AG
         akaGps/zx8ekOi4DvdvTBze+J+QJYAmJY7LMWO7pLi/LaxhtU8BiFxv9WHBqF0rBzMbR
         o8Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVoepQZaIWx5V5CTAYswMT/jW370PGTuTal30/FVclZW4nbMN+kNh6cXGpYThvxhI0ch1xEV5vWAGp8qJk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxh5ngOO4oTJHqWMX582yM2h64+j5ykNH0fa2hRIwkqrPRKT4Hc
	wtxAphbPaLDizndqgo0gp8h1djgkMUZ/GaU2yeCyFtD9avm7TRUpdvxwEVjIOofP/0xuN6AJn1G
	DslJejORy4IMUy+G/Qg0f8thhbJ9wf64qhPCMNidC8FqLJRcJOjxK/54WOW4M84F5FpI=
X-Gm-Gg: ASbGncujEleh1xTtZFEnEomYQ2E3tYVcnLle2Sq6RxfyfpVWI9LmrVQhFfuPWa1Bzfk
	BBkXqtF6ZGNPXt4WfftMk/uOOwjoN7yjC7Eo6fDnPF80nknPGrNVlZQHuAyLAlSNDSO8R9HeAG4
	jeuZfZm6EOX8tAspsRny/Lqt817qK8XJRrt2fuTXWCBaAwOPNOJMRIQA3JGpuMFuPTu/zmIpcs6
	oxdtbUvpBKUgyCm7ZyUF+CNmSHSD/v4EXwk79CH6epzWRz0nDGeEI6QE8iXkisJiI8QYVMjoEYW
	OWDtRImRSPWT7g4SVK4PFR9ijWeAi2aqe4XttNE5WLSlHlLVicejNJJcBB+lSiPJmpWT5hmBsnS
	mNoibYX+ib7Ilqx7VTrC8GAJmW3KSa2lOYM4XTzHg8GoRu0GVOdMgUhLt7eGqRafi0mlhXnlzBp
	JIpO5ljxjaxo9QnZpzQrfltpdjV1w=
X-Received: by 2002:a05:600d:831c:b0:477:542a:7ed1 with SMTP id 5b1f17b1804b1-477542a7ee4mr3985095e9.19.1762185825554;
        Mon, 03 Nov 2025 08:03:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5tyJHb+sues0m+7ZNZilqyo2L9Cho1JQDhJMCuFOgAOZW6Lsc8SY3FhL38SgCM772181+5A==
X-Received: by 2002:a05:600d:831c:b0:477:542a:7ed1 with SMTP id 5b1f17b1804b1-477542a7ee4mr3984625e9.19.1762185825048;
        Mon, 03 Nov 2025 08:03:45 -0800 (PST)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169? (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de. [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c48daa0sm167032215e9.3.2025.11.03.08.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 08:03:44 -0800 (PST)
Message-ID: <b6f5b3cc-93a0-408a-b7e0-72462f3fd549@redhat.com>
Date: Mon, 3 Nov 2025 17:03:42 +0100
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
Subject: Re: [PATCH v4 08/12] arm64: mm: replace TIF_LAZY_MMU with
 in_lazy_mmu_mode()
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
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
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-9-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251029100909.3381140-9-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GYqHqObAINVvY9vQOsClNkwY6jjrdUlhHWzeVRdlG1w_1762185826
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 29.10.25 11:09, Kevin Brodsky wrote:
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode. As a result we no longer need a TIF flag for that purpose -
> let's use the new in_lazy_mmu_mode() helper instead.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>   arch/arm64/include/asm/pgtable.h     | 16 +++-------------
>   arch/arm64/include/asm/thread_info.h |  3 +--
>   2 files changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 535435248923..61ca88f94551 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -62,30 +62,21 @@ static inline void emit_pte_barriers(void)
>   
>   static inline void queue_pte_barriers(void)
>   {
> -	unsigned long flags;
> -
>   	if (in_interrupt()) {
>   		emit_pte_barriers();
>   		return;
>   	}
>   
> -	flags = read_thread_flags();
> -
> -	if (flags & BIT(TIF_LAZY_MMU)) {
> -		/* Avoid the atomic op if already set. */
> -		if (!(flags & BIT(TIF_LAZY_MMU_PENDING)))
> -			set_thread_flag(TIF_LAZY_MMU_PENDING);
> -	} else {
> +	if (in_lazy_mmu_mode())
> +		test_and_set_thread_flag(TIF_LAZY_MMU_PENDING);

You likely don't want a test_and_set here, which would do a 
test_and_set_bit() -- an atomic rmw.

You only want to avoid the atomic write if already set.

So keep the current

	/* Avoid the atomic op if already set. */
	if (!(flags & BIT(TIF_LAZY_MMU_PENDING)))
		set_thread_flag(TIF_LAZY_MMU_PENDING);

-- 
Cheers

David


