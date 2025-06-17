Return-Path: <linuxppc-dev+bounces-9415-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C84ADC693
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jun 2025 11:34:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bM1t50hDSz30MY;
	Tue, 17 Jun 2025 19:34:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750152877;
	cv=none; b=Ly7j/oKzZYggFBFyyHGpkP1dVIhn2CvQfqYEmW76o2MF5l2bcKC7GXwtaAtDhHHPXlEdO3anXE2vd64uWGR3JsO/7xH7tIbhULfLeDDJf8+lq19Qd0tiZkaHDhNvIjFy0FEGY0JAYPQiIRlMBNzJ9TrJ65m0pOJna6CxgvjtEWfd5qQWN2N1x4eMFJRtZ+LZIn8H3WjrCzAZvpaHgBTio2Ai0h+xrTHw1Ge09V2OB4RrPk2/L0S+DbAmBS8ZGUuONIzFlyiSUt2iXD/DdwnaSSdVUm+qY1e+tsNEdVMeRUEosjG3bgS4b/7oA7gIWec3LvP4we2wXSEFeqC0Fc5s+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750152877; c=relaxed/relaxed;
	bh=UoO6Im3sdMj9qrKiZw97K0g1BjWI//UD+48kISxcxhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZR/mBRqnOlyNHk/w8OWq8QN6jILJbUVYmzP161F4SQAsxWUby5gijdhyOp5aMvvS7JnazNdovqupZR/7owvbr5Gl1Cv4wrVmgAKU+gXVDt4IwYNO56Y8Blr3hGzI6VbsFIjMil7nhYrrQZNyiLX3hQlwAp8v1sI0yUyVucfR0UAkLqteDeKM2VpKey6Vv08vc841k09gtdMFRlrhaY1wQ7KfEBfZQjnAHQGzGHYFCLcXXX1xVeGwj5F749zYH9jn6ZVGfLrkaj4x4fIj5Gn/KcuEz//OkiLduQzJvLKu0ad+R8ZLf3OcDfZifym6cXRFr+COUYTzrtlUPq6/xOZZRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H17Ga4VT; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Uc44c+In; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H17Ga4VT;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Uc44c+In;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bM1t349HFz309v
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jun 2025 19:34:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750152872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UoO6Im3sdMj9qrKiZw97K0g1BjWI//UD+48kISxcxhU=;
	b=H17Ga4VTXpLcJQtVGtOXTLTdsFRxwKIZHlHmDp2f3q4yHxHlYVq0ynSoYBY/wGSjSEXrdP
	g/u+MBzDyHyrpTb8c4q4v4wOZCmmwb9NRwni4iJ4qkwmUjmxgg/DTemp6jmXWVHFthclTk
	fu1Xru0KpxBxLCTSONuPH5GsGdosqhI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750152873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UoO6Im3sdMj9qrKiZw97K0g1BjWI//UD+48kISxcxhU=;
	b=Uc44c+InMbW3xwmn/mqqVBeGtM93CihYLN2uTFhHilNZV3+QFPBnfXLM3ItpVVTnkvveeY
	d2ODiz9qY1JEeUeUe+WszfHjuwKx5uDdTKnzVxlYgnoTATUIrrcR64R66lF4AWjFl6vhzW
	PAMm+uGQYbJu/OSFM3i82gPp89eoMFc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-_pMCuk1XMva8LEz417SeNw-1; Tue, 17 Jun 2025 05:34:29 -0400
X-MC-Unique: _pMCuk1XMva8LEz417SeNw-1
X-Mimecast-MFC-AGG-ID: _pMCuk1XMva8LEz417SeNw_1750152868
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45311704d1fso31116635e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jun 2025 02:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152868; x=1750757668;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UoO6Im3sdMj9qrKiZw97K0g1BjWI//UD+48kISxcxhU=;
        b=jVBTr8KNFnqWnC5hUd+LaLRUBls0jo2AEevIFWwDskTVVuRbBvxHHaGaRYm0OZzlDV
         q3CMZeL54YsmSqCM+7gkFb1OQa1w4yXjt8B54E8P4+mcDUnUYnV64mZaSpk+v07bu53D
         /0tBbBCZ3w5ymWvWfNYfu4swxTzswKHbTs+A67jiOyEGbOhQR6zg4fxwunvnZvsGTTI8
         x2Xzq6PHWmE27dHEW/wRi1gvinyoS886yZ9sK5t0YiIfpev0wgok76KglqCR8XtBkoJv
         pejpYSxBImILhFfCg0UU0orx4ELbkvwgjw3xH5+wMBFFLncLnaO5/Azoj9dmKMOP22Nf
         v+Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUuC12o/3y3/WYpp7VY9nRzRxl1xzV2h7pX6t3GOch2iE2jMfG4yKFrJd7PtqApIpR3lVJhJFNCamP+gSE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwXcs538VjRcfSr5wOkwRBd4HG/XOtNNDfSMXI5rl8YupCU8VlW
	AcYilStv5yIGlh3T8H7t9jCp3eZqs7OYTkfkIC83eX1foTbVaLgC9+DZ2PQAYKtBM1MWFGbMfWR
	vY2jvAkuhADmq+4kXOSjslqG8q1iPoD0IaGH9kSgvuB/haIbE9aYtYhc1jPnQGXinSR0=
X-Gm-Gg: ASbGnct7ewgHVsmtXD0lHjuj4CBYuWUYFm6QQ4Qkj0fBanAbMhbttxXGRO3IprmtJQd
	62C+u/VIeFDwvPOnM/S0ZkYMIeaJV/g7ZgQHuNwUdKf1trbK0WNcaN/0luoMP8S28NEgVJ03M84
	lP4/S/MAFqxhswgQGQiLh2yA17ZQeQGFT3dVh4hrVe8WF1/myCu0hc8G2BM9UVyvuTej+GNiLKr
	3hH67c26dN+8XdggpWpt3FhT8KYgXxsSqOocvGLLBdtup1NzonWyamGIfgja3GwzX0G1G/qS7QV
	tpeEOm3BLqmRYyXcyXquDgKqg1iciTifB/5MOitRR2INqFoDd2t98/+THDV1bNhQbObP069J1hh
	XfxAD8DERvDAdgFFM7C3glru+zH6G0UUl9SwXWDXrbFd1NvI=
X-Received: by 2002:a05:6000:480d:b0:3a4:ed2f:e82d with SMTP id ffacd0b85a97d-3a5723a49e0mr9462613f8f.22.1750152867955;
        Tue, 17 Jun 2025 02:34:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAmkCmIe8r1op6vQb6TFjyJmDKs7yVrH6V8NRIzvLkSM/8ZQuEH09JTbMfp0YgKwsQ3nxlSg==
X-Received: by 2002:a05:6000:480d:b0:3a4:ed2f:e82d with SMTP id ffacd0b85a97d-3a5723a49e0mr9462594f8f.22.1750152867607;
        Tue, 17 Jun 2025 02:34:27 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7f8f9sm13367621f8f.42.2025.06.17.02.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:34:27 -0700 (PDT)
Message-ID: <b2640810-d528-4a3f-b69a-87847943dc2b@redhat.com>
Date: Tue, 17 Jun 2025 11:34:25 +0200
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
Subject: Re: [PATCH v2 14/14] mm/memremap: Remove unused devmap_managed_key
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
 <51ccdbbc3d7b76a7f6e2aefb543eba52d653a230.1750075065.git-series.apopple@nvidia.com>
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
In-Reply-To: <51ccdbbc3d7b76a7f6e2aefb543eba52d653a230.1750075065.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SfqyLaLGxivKMSXvQVdV-KVMtIeozxUWSsQbVDLa754_1750152868
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
> It's no longer used so remove it.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


