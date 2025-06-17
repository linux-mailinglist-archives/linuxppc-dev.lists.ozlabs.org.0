Return-Path: <linuxppc-dev+bounces-9420-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CF7ADC6E0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jun 2025 11:44:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bM25h40xTz30P3;
	Tue, 17 Jun 2025 19:44:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750153480;
	cv=none; b=NngJn/6bO3gwE8ZPJS3dgsZ6hcc+o3tum+A0aYtvObcozz7UZZx0jYU03qyTQ1G+WkKF8eMuo2yBSCjNRgMC5Hq9byXQ7FhvCbPOaO79ggf8IrMjn+zKqURFYmkxs4dwKaNuGBE+/T79b/EGdrT5Jgv2XCDDNfZHv74OGDCumqvTcFXqEmB6UBMvZY9x5wwgcYZm2pk30ZaWEF7R/q+nYoPmtFTErib5lpQrLZtjk4cNRtvnU0uXjYvKKG3o3raVsqborGeum5QG27FthTbDVv+ad+JaChXNtDQfI7hTt26wjkLvJgLm6Xp9jO6R1FCKTShspvvkB+BUMuXprc8tBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750153480; c=relaxed/relaxed;
	bh=sdEh9cEys/eVA2SD9wfMRib1+LZeWMxS5mffwDFqNgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgJgRyrpR/oy5ggCIXdCNtzoZZy+yHBliTPct0AWUciu9KXJ0Jq3z08yIxw6X752z2QbliK1LJdRTxGOOC3x4zBM1zExaaGK4S8OvLaYQ94/9AZyON8QeFE5NConbtR//3hSdiCPE3rVplzXH7UFbYrTBLyYtcKg5rxtPcm/Z7TnKjrOpocQImH5Ehr7/xTxhnmDjEJhxbA6EZE5l9RHfrL1dkYF9DVmEY1+LKcWZD7Ezj6D6YwZgcV8I9rcxtp1lAj8OFygKoPQ69pgLVh8qyIjM5EM1CtVrnbgCLLSLopYX7SCt3PZHSKP1d04fKO8ZiXCx3KlwNXt08qk0EI71g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PhZnPZvV; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PhZnPZvV; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PhZnPZvV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PhZnPZvV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bM25g51bbz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jun 2025 19:44:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750153476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sdEh9cEys/eVA2SD9wfMRib1+LZeWMxS5mffwDFqNgM=;
	b=PhZnPZvVgXYI9sDuBv5rhbBeuDZwc0VZbf1U2pE0Uf9QIjnXQMp3SSSJoyJHtzWX9ce//Q
	SpVMnfSim05APgbchlApkNkRhiJcU6wCq24N6urLB5mDc/gsFM3xCSm8FFjWbIkPL1MEx4
	OxxPsBngcK6yULgL3cr7qaJmyZH6pNk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750153476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sdEh9cEys/eVA2SD9wfMRib1+LZeWMxS5mffwDFqNgM=;
	b=PhZnPZvVgXYI9sDuBv5rhbBeuDZwc0VZbf1U2pE0Uf9QIjnXQMp3SSSJoyJHtzWX9ce//Q
	SpVMnfSim05APgbchlApkNkRhiJcU6wCq24N6urLB5mDc/gsFM3xCSm8FFjWbIkPL1MEx4
	OxxPsBngcK6yULgL3cr7qaJmyZH6pNk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-aVlRkGSMMmWIzSIss8EnDQ-1; Tue, 17 Jun 2025 05:44:34 -0400
X-MC-Unique: aVlRkGSMMmWIzSIss8EnDQ-1
X-Mimecast-MFC-AGG-ID: aVlRkGSMMmWIzSIss8EnDQ_1750153473
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso35570345e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jun 2025 02:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153473; x=1750758273;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sdEh9cEys/eVA2SD9wfMRib1+LZeWMxS5mffwDFqNgM=;
        b=ixsFsI3rNd+kZqZ4hBW1K+bE//Sv6I8445AK1yrZeQz6Nk6tq04oQY9TEq1zcqduOL
         X8RlKznGLmMuRn8wdkMNdXv3oD8FafUugOkRs8fAZM8Bz6xC8nqSwRiOjPC/Puga2WLM
         5igjGGexXe6nZ4BSO5YoiaVZCShM5BnDPQ4xtnDpydWL0EaY4N4iDgth1NVOWKLcOQcN
         a5fppblBtlVz1Cae8mK8oBnVGode0yIK6qVVoUDybt7RFZbXhusn9K/SG0T9Yt4GTdqw
         BGSvLoK8fttrs/Ms+kgc1WEg8D4baGQ9rozWIWSv8AJPBqeYdZe3GVbA4lVj5tnvtBPX
         Uctw==
X-Forwarded-Encrypted: i=1; AJvYcCXJbDsHvRXMm5z7x9VDJCOeuaxFD9RhEqNSCaMAnWbhJRPaL5X+mFSVEclTSuqMh5ySIuOMFMtX/o+5Nus=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywxxek+f9Dc8y3wW+f5cSUaG/Q8DJiCBOniMUF1yqIa/83blycv
	nI4iSYoyxrnAQK6sxYVii4iuhwgNJZcdTAK1i971xpPU4h4QvOYSFruTYtO0HQo6Vi9JZnKo+JH
	Yw66vASWBjT5uQ6OQwhBhUgfJKNZ26B3phPlqW2C02yNCY7GzfpuKScWNEjCDzQJkGW0=
X-Gm-Gg: ASbGncsEZG4YsHFMdJ0D57sVSVh0J9xZ/FAU9WIgPCbj/BNVOZk3OuJg4NqaqeycGKq
	JLXaaBncvdRDC8GucnC6PtBJEq3sLgIV/WVEKURzCUFoH8VkC6QmO9LEyyX0SsfOHZ4JokbRBvj
	Uokgrf8/zfDxDkyC5Y3kK2Oo7PcNiZFWCb38es9G84Qy8GUUemvTmxXIYylnMvgzLVahsuZhGon
	CEIeRjEe3z6ZkK1+BBhfFqDLPLPSBjQljSHPfJjdSMP5W2Wq51oAbnUOlQOCAXUhtkfPC2mkc6f
	2H7Z3MlY2a9/XNFf7Ar40AG6f9bAlN8cZ4SF5A1WsTju+bhJnROPQ63KEKcv9+l+3+8UukYjWEY
	t9pe+rm1iwR+ddJZ5gyXGNCKwCkaGq5lm/0IcoPeyRvLV0P4=
X-Received: by 2002:a05:6000:65a:b0:3a5:88e9:a54f with SMTP id ffacd0b85a97d-3a588e9a99bmr1291308f8f.1.1750153473092;
        Tue, 17 Jun 2025 02:44:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHQpVd3mwZ+TEDjCXC20DL1F3MMRYh4Y/yZHPnb93a/Bf/b7RyUJmn1/nXnnPCK9NELoBd4w==
X-Received: by 2002:a05:6000:65a:b0:3a5:88e9:a54f with SMTP id ffacd0b85a97d-3a588e9a99bmr1291288f8f.1.1750153472667;
        Tue, 17 Jun 2025 02:44:32 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b4b67bsm13257644f8f.83.2025.06.17.02.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:44:31 -0700 (PDT)
Message-ID: <31bdbfcf-bbfa-46b7-a427-806d42d88cec@redhat.com>
Date: Tue, 17 Jun 2025 11:44:30 +0200
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
Subject: Re: [PATCH v2 08/14] mm/khugepaged: Remove redundant pmd_devmap()
 check
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
 dan.j.williams@intel.com, jgg@ziepe.ca, willy@infradead.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net,
 m.szyprowski@samsung.com, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
 <d4aa84277015fe21978232ed4ac91bd7270e9ee0.1750075065.git-series.apopple@nvidia.com>
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
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <d4aa84277015fe21978232ed4ac91bd7270e9ee0.1750075065.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fsW_DsoxKBwQap9UfPKvI2d7Qfux7_n0SM9do30SBZI_1750153473
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 16.06.25 13:58, Alistair Popple wrote:
> The only users of pmd_devmap were device dax and fs dax. The check for
> pmd_devmap() in check_pmd_state() is therefore redundant as callers
> explicitly check for is_zone_device_page(), so this check can be dropped.
> 

Looking again, is this true?

If we return "SCAN_SUCCEED", we assume there is a page table there that 
we can map and walk.

But I assume we can drop that check because nobody will ever set 
pmd_devmap() anymore?

So likely just the description+sibject of this patch should be adjusted.

FWIW, I think check_pmd_state() should be changed to work on pmd_leaf() 
etc, but that's something for another day.

-- 
Cheers,

David / dhildenb


