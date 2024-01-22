Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB715837383
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 21:09:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=euCzmD2c;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=euCzmD2c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJhBc4nYZz3cMH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 07:09:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=euCzmD2c;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=euCzmD2c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJh9r3hj8z3bmN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 07:08:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705954109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=74vQSZ9Ib6W2cdwmSu4B7EOliPKMRAyQqJMwdDwvZic=;
	b=euCzmD2c50isGWWWKnGtfP9OFsl70RYchgdyeD/ioOBr4WndcmSoAXaaNEaMKhHChpjmBT
	0Osj1m8J/4PcZ/Mec9V2HXwAelEA0Ez3Evbmu2lRLRAcylN9q7lW8J8aM4YvJ9zCN+0wyn
	4jHlR9JMKz0JXKVeqsz0nWT3a1O1AUg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705954109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=74vQSZ9Ib6W2cdwmSu4B7EOliPKMRAyQqJMwdDwvZic=;
	b=euCzmD2c50isGWWWKnGtfP9OFsl70RYchgdyeD/ioOBr4WndcmSoAXaaNEaMKhHChpjmBT
	0Osj1m8J/4PcZ/Mec9V2HXwAelEA0Ez3Evbmu2lRLRAcylN9q7lW8J8aM4YvJ9zCN+0wyn
	4jHlR9JMKz0JXKVeqsz0nWT3a1O1AUg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-zjorMmg4O_-Ki0dwCVnXsA-1; Mon, 22 Jan 2024 15:08:28 -0500
X-MC-Unique: zjorMmg4O_-Ki0dwCVnXsA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40e4f70af99so33305775e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jan 2024 12:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705954107; x=1706558907;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74vQSZ9Ib6W2cdwmSu4B7EOliPKMRAyQqJMwdDwvZic=;
        b=gnWyDL1HktVwgVIKS2eWhoF29vVqw14sfJxvmoASWe7RrkIjk/5tfaIJO5oBJCv6Is
         ZzA8/Gh5uBRujefYgYN6M5ahcL1owLdGzwkmSoBIfTocKpWVyi9FS+dVIIP0QzHIcsd9
         OTTZjlpo8BDKa9J9lkySVMEild1cDoDHyDGu9KS3exjtvGmJljk6rfG+EA3usKiy/m7K
         1dDx15R1lkaPDdreBhnok2DzyjyLFU8E9wtz0S7xWgODMEFcICqjh9NtW1ZvLUz/lCq7
         GF10+BtTv6TZCGIefxQyo4etfDeND7szEzNptXpZvUrS+oOwIoDYzI9RNV22IYVtzerY
         29XQ==
X-Gm-Message-State: AOJu0Yyy9+hYHl5ZuDineGLr5P/y7z+uHJDu2BrhV2vkZSDRz72gQvnL
	5RfMml0rc+o6PZ+meIfVRl5sn16pKrJHMHHir7vFnkZe+xjAZqKIErSSMGMNjhobp7SI43Cn3fw
	m66q/Qpc1ynBhNaYSUTRgHP8GGFQa9BRbJ+I0dOnRLfQrkgYhzxI84IYxLMND0r0=
X-Received: by 2002:a05:600c:4f4a:b0:40e:b207:37ad with SMTP id m10-20020a05600c4f4a00b0040eb20737admr585150wmq.130.1705954106943;
        Mon, 22 Jan 2024 12:08:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHK8OlAl3XA9eIoNh6f85JWWWd6CdUDvuraIncansW9lJ4yoYjQun4BKcSrDUo/pFZGmSKIpg==
X-Received: by 2002:a05:600c:4f4a:b0:40e:b207:37ad with SMTP id m10-20020a05600c4f4a00b0040eb20737admr585125wmq.130.1705954106524;
        Mon, 22 Jan 2024 12:08:26 -0800 (PST)
Received: from ?IPV6:2003:cb:c737:f400:b194:1841:c4a5:75f5? (p200300cbc737f400b1941841c4a575f5.dip0.t-ipconnect.de. [2003:cb:c737:f400:b194:1841:c4a5:75f5])
        by smtp.gmail.com with ESMTPSA id v16-20020a5d4b10000000b00337d4eed87asm11594671wrq.115.2024.01.22.12.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 12:08:26 -0800 (PST)
Message-ID: <01aa95ee-0abd-4d65-b03b-2191285d1ac3@redhat.com>
Date: Mon, 22 Jan 2024 21:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/11] risc: pgtable: define PFN_PTE_SHIFT
To: Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-5-david@redhat.com>
 <5601b896-f67c-432d-a169-0f08928123fc@ghiti.fr>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <5601b896-f67c-432d-a169-0f08928123fc@ghiti.fr>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22.01.24 21:03, Alexandre Ghiti wrote:
> Hi David,
> 
> On 22/01/2024 20:41, David Hildenbrand wrote:
>> We want to make use of pte_next_pfn() outside of set_ptes(). Let's
>> simpliy define PFN_PTE_SHIFT, required by pte_next_pfn().
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>    arch/riscv/include/asm/pgtable.h | 2 ++
>>    1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>> index 0c94260b5d0c1..add5cd30ab34d 100644
>> --- a/arch/riscv/include/asm/pgtable.h
>> +++ b/arch/riscv/include/asm/pgtable.h
>> @@ -523,6 +523,8 @@ static inline void __set_pte_at(pte_t *ptep, pte_t pteval)
>>    	set_pte(ptep, pteval);
>>    }
>>    
>> +#define PFN_PTE_SHIFT		_PAGE_PFN_SHIFT
>> +
>>    static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>>    		pte_t *ptep, pte_t pteval, unsigned int nr)
>>    {
> 
> 
> There is a typo in the commit title: risc -> riscv. Otherwise, this is
> right so:

Whops :)

> 
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks!

-- 
Cheers,

David / dhildenb

