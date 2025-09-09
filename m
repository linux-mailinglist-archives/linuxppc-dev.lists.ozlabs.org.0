Return-Path: <linuxppc-dev+bounces-11937-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67551B4A77A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 11:22:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLdct2Lpmz3cYL;
	Tue,  9 Sep 2025 19:22:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757409726;
	cv=none; b=AlcK7zVJB3G1NE7nDxHkE97CInCj/dQtTCPk2CPE5/AmKL6Qwi9qqEjYqB5O+5OVd7xs0fEyDqnue4GTZDeF85viaaJxEYn2II8PBPUhjgmt6p1kR74K9/Fm0aAXhutybmwyYO7C1fzBJ8VRxaJ0nhymMp7ThR40D2xsCc9eAeOyhoEB1Y9sFJ8GLeQl4Le0Jz3mNUxiI6ipOg7nTAh80Zzb8TDE+g+fKE08arp14NoU0FcOIue7EVkLZYDJnKKjuhjruBE8BsflUloCEKflpxhdcdVH53BuQOCLpIdSzEzNqudreehysA8/N7GIpG4S7rc1SPoITo9bM9HqKhNEMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757409726; c=relaxed/relaxed;
	bh=yZ7mpSu7Vyx7D7KzsRAEX4kah9GPWTLG09gnV5krCYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PdOrDakrC8RkKiADleRdp8oEs8PWLnmcdgwycEvcJKhu7As8mab5TJr5VYf6haVucRgT4gSIUsJgsgq01OrlqnnRxW91TEJbcmSwuVLdCxG9BztVS6Jc0C4aW+RRzQqDldBSIyCXBN0c/QR3nyXEqvq+iRq9881Lm/gUNRPGu3DotgSAD1voUYpS4LN98+nLE751Vy5IHP+/LAoJ8ETy+3xqja/HnR1eORtXuOvfEU47BVEgGbahC5zGspAFhN/+oQXVKFzTiqW/hXAmObAVTqL/ebzpaTrYujoibqIJb7n6EgumqYTzy1vw0mcBK45Cetb8lj88ZgM3gnNsEEgJrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T4tSLErP; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T4tSLErP; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T4tSLErP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T4tSLErP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLdcs3QDHz3cQx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 19:22:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757409722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yZ7mpSu7Vyx7D7KzsRAEX4kah9GPWTLG09gnV5krCYA=;
	b=T4tSLErPhfCJBdN0iicJ0/4zKsx2ZuScJCiOeW8vv6c7Xoc9pXK/qqFEWCBVGOs4XwhuA6
	vlpHI3CTN0+qb1hwNaXC34TQ89XoV+dB+MjasUrjasyx5EzAwsOLJjTdPp7DHJX8KCe79k
	SUBn1rTWI0HoSaKq3i/JyI/rEv4xppk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757409722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yZ7mpSu7Vyx7D7KzsRAEX4kah9GPWTLG09gnV5krCYA=;
	b=T4tSLErPhfCJBdN0iicJ0/4zKsx2ZuScJCiOeW8vv6c7Xoc9pXK/qqFEWCBVGOs4XwhuA6
	vlpHI3CTN0+qb1hwNaXC34TQ89XoV+dB+MjasUrjasyx5EzAwsOLJjTdPp7DHJX8KCe79k
	SUBn1rTWI0HoSaKq3i/JyI/rEv4xppk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-wY_LLkptO6ypKEDIIPADWw-1; Tue, 09 Sep 2025 05:21:58 -0400
X-MC-Unique: wY_LLkptO6ypKEDIIPADWw-1
X-Mimecast-MFC-AGG-ID: wY_LLkptO6ypKEDIIPADWw_1757409718
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3e751508f3aso323222f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Sep 2025 02:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409717; x=1758014517;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZ7mpSu7Vyx7D7KzsRAEX4kah9GPWTLG09gnV5krCYA=;
        b=IgJP2mQkZeKhInHzcTyLair3hBS1Oa4MXiTnA0PlE9hUuEbsXUqaEoOh7vk7eljJHt
         4Ln3BaJ2o+T6UOwK2v1QOrsdvQacjjbwrE8Z1uRczWv3qTPQh1bAuUElpMoHP3mGVKkz
         9Z1+GhwonqJ+evY+Ox8FdMuyw5M8K3myBFq9x4GRmscS10taa6d1Ty6xQIMRSjOe1CEW
         TUjztGyYI4EnN3I5pp2HvknoxY7vOPgbiGV+/pabTEHeKpirSMSBruVvqYnztr+2aes7
         7f65Yzcu6gybItsgDGCPgCTw7QoISS4gQjiNWC0DxtjfrUfUf+DmT7b+19iC6TEbeXJU
         xJkg==
X-Forwarded-Encrypted: i=1; AJvYcCUCUBYyOZXdn9rqojb68/hKQvvnU5KMgsUk6EB7Up+6Rks8E5OnZExRfeJZGE8QfUrHewJLIwQmD1ecYm8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzeSijCXm2/UGndR7p1Aw9bbcEfINtcdD0NnkJN/L30GCCQJnXC
	7IfM/cx9d7/8CIALjjZDDep4muR3K+gLfy7beCQKOLqPYXSIHheyBVc9xlQFovtAJIhdDK7x0M8
	Yi3iwy5tdUOvBprCU30YSZ+CY0NfdJa+mSuHTm2uXIvpx3CQx1CPe1pApBF4P4J0V/10=
X-Gm-Gg: ASbGncsJ1yxRBrIzdG48s3r0UeNI/GZyrYxtJskTn6x63LO32Ibyv9qiMCWjJ5PCLVb
	YocelGjRzyVam3w3s86I6A12v+gcHr1VyCDsqorYASCY9eDCdME5Am2DVqbDMFtxL6OSl9eR4KR
	U3F/tUZ85NZKzndXS9pLpCU4I8fl60cORYk/34isAPJP1HuHESiqnbTqDlz+jzbGltN9yGAEIM2
	4lBZzdQ8PZX+PenWmJuJjROEaAy8r+Y8jep8SwLB//Xs7+RmZe9+Xx4n/UUM6AGB/nBbcxPLnKU
	QZPAOTPZ1MCiEPcLb/3doXqcLDK772HXaRHa5V1EcHu2Fc4kUegTLYNBXu77v25nfL9b7nPDgH6
	Ydwf/RcYhPnoHVu3SguwpXLHjM1FjNoAyQ0OftbTA6bJ2+SM1VN5vlQXSNvvzxUdBMrU=
X-Received: by 2002:a05:6000:d0e:b0:3e7:4fb7:4e9 with SMTP id ffacd0b85a97d-3e74fb7050cmr2433462f8f.47.1757409717596;
        Tue, 09 Sep 2025 02:21:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHaiuV2XNAb2KzSftztUT7DW61EOo5r3IILYTR3cBriEgdDR9uMZbXOjouMq5dEBDNTmzUKg==
X-Received: by 2002:a05:6000:d0e:b0:3e7:4fb7:4e9 with SMTP id ffacd0b85a97d-3e74fb7050cmr2433419f8f.47.1757409717177;
        Tue, 09 Sep 2025 02:21:57 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34? (p200300d82f239c00d1f6f7fe8f147e34.dip0.t-ipconnect.de. [2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b98e77231sm303120095e9.12.2025.09.09.02.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 02:21:56 -0700 (PDT)
Message-ID: <d1b4ff2a-052f-4556-91ae-273962edbed0@redhat.com>
Date: Tue, 9 Sep 2025 11:21:54 +0200
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
Subject: Re: [PATCH v2 0/7] Nesting support for lazy MMU mode
To: Andrew Morton <akpm@linux-foundation.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
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
 <20250908191602.61160a7990b9ea418de758c7@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZoEEwEIAEQCGwMCF4ACGQEFCwkIBwICIgIG
 FQoJCAsCBBYCAwECHgcWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaJzangUJJlgIpAAKCRBN
 3hD3AP+DWhAxD/9wcL0A+2rtaAmutaKTfxhTP0b4AAp1r/eLxjrbfbCCmh4pqzBhmSX/4z11
 opn2KqcOsueRF1t2ENLOWzQu3Roiny2HOU7DajqB4dm1BVMaXQya5ae2ghzlJN9SIoopTWlR
 0Af3hPj5E2PYvQhlcqeoehKlBo9rROJv/rjmr2x0yOM8qeTroH/ZzNlCtJ56AsE6Tvl+r7cW
 3x7/Jq5WvWeudKrhFh7/yQ7eRvHCjd9bBrZTlgAfiHmX9AnCCPRPpNGNedV9Yty2Jnxhfmbv
 Pw37LA/jef8zlCDyUh2KCU1xVEOWqg15o1RtTyGV1nXV2O/mfuQJud5vIgzBvHhypc3p6VZJ
 lEf8YmT+Ol5P7SfCs5/uGdWUYQEMqOlg6w9R4Pe8d+mk8KGvfE9/zTwGg0nRgKqlQXrWRERv
 cuEwQbridlPAoQHrFWtwpgYMXx2TaZ3sihcIPo9uU5eBs0rf4mOERY75SK+Ekayv2ucTfjxr
 Kf014py2aoRJHuvy85ee/zIyLmve5hngZTTe3Wg3TInT9UTFzTPhItam6dZ1xqdTGHZYGU0O
 otRHcwLGt470grdiob6PfVTXoHlBvkWRadMhSuG4RORCDpq89vu5QralFNIf3EysNohoFy2A
 LYg2/D53xbU/aa4DDzBb5b1Rkg/udO1gZocVQWrDh6I2K3+cCs7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <20250908191602.61160a7990b9ea418de758c7@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fXEzE44tjHzvTAXMisriCLQBH_P7laUF9hR13bV4b7Y_1757409718
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 09.09.25 04:16, Andrew Morton wrote:
> On Mon,  8 Sep 2025 08:39:24 +0100 Kevin Brodsky <kevin.brodsky@arm.com> wrote:
> 
>> The main change enabling nesting is patch 2, following the approach
>> suggested by Catalin Marinas [4]: have enter() return some state and
>> the matching leave() take that state.
> 
> This is so totally the correct way.  Thanks.

Staring at this, I wonder if we could alternatively handle it like 
pagefault_disable()/pagefault_enable(), having something like 
current->lazy_mmu_enabled.

We wouldn't have to worry about preemption in that case I guess (unless 
the arch has special requirements).

Not sure if that was already discussed, just a thought.

-- 
Cheers

David / dhildenb


