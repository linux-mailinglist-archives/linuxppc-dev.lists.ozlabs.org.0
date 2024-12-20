Return-Path: <linuxppc-dev+bounces-4361-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA6B9F9992
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2024 19:33:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFGHz2JNnz30WT;
	Sat, 21 Dec 2024 05:33:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734719583;
	cv=none; b=ZIdxfQe33dCzcMz27DiF2LvI/9vvjPON1SIqRdU0DLMNgtYeBa3uENttLTAxeZloLHpZqdgLT3pwZmnbnuSk60fCc/9EhYC0Yn+P5KPUM3rwsHZA91ww+UxlGgJtBCGcFjwqDWGMdW6mz4RKAS2b9/vntgd8CtnZvRkTdwcT42Xauw3v2NSx5i4Le6JzSg+NbgzeO9xJXrU3EzBCvyjXYjR1rCzZuMTptCOQNXMJ2TOnR+33nQxaGLDn6FBQ1wdxuqcEc3dZM0MK1ivo8uFmiGGkG8zoMQazbdI1q0br5QkCys1U2qzuzmkoIecS4re3xcv5FlXM7a7EAecWjtxPKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734719583; c=relaxed/relaxed;
	bh=swU3J22w1qiLCqCLjNaSEiN34P+WDwMezqQF+LZ7YmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DWvaAHeWvaQ9rPbEzud+25oByV8lJBrfXdRSbJZf8IRDBdtNtfpTWbIjOGwMnUeqVGKnks0tpVCBYIR1Zy7ga0E1Fw55wxNyY9vUhNBY+3PiD4YNB84YnYR5/MZU1HphQUKqRgt3YScQdS+y5BiFosJ5zfH6GOYxwDruFrhW9JvpubR6btHS5+tg3FBofw/ZFxVp8iQPCoEF3Vjb4hjKw8eb418ZxojvFMWnDguV8INj6sjDdxVb+72Te7llLh0cQEHH+3yUXCUCm0iefKxwTgmnv10GBcHL5nQuTXSSgfdQaoqjA8IvFvEJuuKuzE/I5pnrr5NylP0yYAYW9o+xGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D9duBBCf; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ACG3+wPg; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D9duBBCf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ACG3+wPg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFGHy1Rqjz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2024 05:33:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734719578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=swU3J22w1qiLCqCLjNaSEiN34P+WDwMezqQF+LZ7YmM=;
	b=D9duBBCf6+o3+AF+SHhzSWP9zk5kFNJGjqoV3tpURPULb/VVGxSfOY0thatAKttd5GF51w
	vCVo5g2xClsZW5cE1jMW1h4R+yR2i3yxCwnNeMgcjdiNbED5++kgu7H3K0yXUcOjvZJdTn
	2j+brg0XDacYPSoM9/lpWI+xWkUTPuY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734719579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=swU3J22w1qiLCqCLjNaSEiN34P+WDwMezqQF+LZ7YmM=;
	b=ACG3+wPgK0Hi+/BcpjkUQDZFq2kXzdkYqQb8pVL2kIUug2cMFJr2xQuwlsbp8CncLeHpXW
	eM3J8sr6PfuGJQ8fbzS4PB7ixaJR5on+GCsnvn0gv9Ybt6rQSESpGwfE2DLP2n34w3/r+v
	jvHbH/sATHjQV/+7ybOxP93MvCPEal8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-8uOEHLOSMyudz8wEkND4wQ-1; Fri, 20 Dec 2024 13:32:57 -0500
X-MC-Unique: 8uOEHLOSMyudz8wEkND4wQ-1
X-Mimecast-MFC-AGG-ID: 8uOEHLOSMyudz8wEkND4wQ
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385e03f54d0so1133874f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2024 10:32:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734719576; x=1735324376;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=swU3J22w1qiLCqCLjNaSEiN34P+WDwMezqQF+LZ7YmM=;
        b=KVCzecEbrBi33PUXK+D2/+5vACmlIjz/BCbbM9npDpSQpJV/aPgsZ/B0N1siuO0Fqw
         hWzXjgvqS/weKIt0zIKdyjfgnuaAvph/+olrXKnF0QuT2ZWyFriZDRkZYLHUsLg8cTFN
         b/bmQA32Tg2nFYsD/B+T+z+ncRyNvlqmHvrpfRnzdAY0NhwL162wGpg8VzCR7iRCp2Bv
         eDG32hGnDo5p7oqg8LhellrpMHUucyCiN2QDpsIPHC45cafv73KuJwuL1b4HK1DcWvOx
         DBSoi/tjgYpLGIU4a/gWz2QJi0xEQQq7eh+NHcAyxHOTBmONi8rfRsAGkJJ5YbOWMZb2
         3IaA==
X-Forwarded-Encrypted: i=1; AJvYcCV63OygYeosIWDAmf6K/hnNr9UUpkGUTjwyEBpmVfgHwJ98bBPh6WTXjHzfK5xOaaMKjlowkx430lpHfMw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxfyaiRxouJYdRenI8piiJlFpCYW8+/cj+sAQkVvZ54pW9nsyQu
	FjfeKswNfiHrIPeZe1hLqPZRtrWR+3HQK14eXlNVlnGbuVWow6yysfFMjG05fxr0X61b8sKMtz8
	cSvKhrziAllYYh6194Nt1gIwhJgzRbauj3CCZH5NwPdWp1hDREGABRVmyGVKBql8=
X-Gm-Gg: ASbGncsMdW/THIDbus0DJYYr84UV521aRmY2GhIpney6oP9bA5vpxyYUP0YY3IvMzO8
	w8NcxX+ga47oO7UBSCjFvT/URf8hAcJTN4gBgXIauh1G9EB/yug9OWeU/8Tra072ijr/x/Tm8n5
	VFR3yFfLuYoh9u2s7hNkO2Io9LSIVoDFYXFz9kSbkDAuNuEZZlq2+KIMP9p0PMdogeFTKxKD4UL
	x4zngSTBelj05UrGvicyCFtCuoMM8u0hMYMnj+b8tGlOi/SujbuC4FKZQLnuO+O3dKwU4gOYVtB
	GAeF8bWjRBUEyBRMUIA9E7nheaFNZ2RM4/5QQXvGw+NfKRMgjPzXLQ+ZCeNzEB0ONuCskxT6rFE
	Gau0q+zuS
X-Received: by 2002:a05:6000:1fad:b0:385:ec89:2f07 with SMTP id ffacd0b85a97d-38a222001b1mr2999426f8f.32.1734719575917;
        Fri, 20 Dec 2024 10:32:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEk0Gj/f9sMdkNX68mPrqALSYePXcnIEwcuX62px3U4cp9do+t6yyCpZv960vKDvx0DNpRxKg==
X-Received: by 2002:a05:6000:1fad:b0:385:ec89:2f07 with SMTP id ffacd0b85a97d-38a222001b1mr2999374f8f.32.1734719575483;
        Fri, 20 Dec 2024 10:32:55 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:9d00:edd9:835b:4bfb:2ce3? (p200300cbc7089d00edd9835b4bfb2ce3.dip0.t-ipconnect.de. [2003:cb:c708:9d00:edd9:835b:4bfb:2ce3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e278sm4706351f8f.75.2024.12.20.10.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 10:32:54 -0800 (PST)
Message-ID: <36334f20-2b9e-4529-89c4-120678bc5985@redhat.com>
Date: Fri, 20 Dec 2024 19:32:52 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/25] proc/task_mmu: Ignore ZONE_DEVICE pages
To: Alistair Popple <apopple@nvidia.com>
Cc: akpm@linux-foundation.org, dan.j.williams@intel.com, linux-mm@kvack.org,
 lina@asahilina.net, zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com
References: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
 <f3ebda542373feb70ed3e5d83b276a2e8347609f.1734407924.git-series.apopple@nvidia.com>
 <c7bd9b00-6920-4dc0-8e2e-36c16ef7ad5a@redhat.com>
 <37rxl2bjda3psdknhboexhbg3hahf5ifmublp5fw7ltdoyqllc@udbz76jklmnu>
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
In-Reply-To: <37rxl2bjda3psdknhboexhbg3hahf5ifmublp5fw7ltdoyqllc@udbz76jklmnu>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QoTsZw-MAWBA2LfdvYU2fPtxIuJvwvHEMWl-w6Y5vIc_1734719576
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 19.12.24 00:11, Alistair Popple wrote:
> On Tue, Dec 17, 2024 at 11:31:25PM +0100, David Hildenbrand wrote:
>> On 17.12.24 06:13, Alistair Popple wrote:
>>> The procfs mmu files such as smaps currently ignore device dax and fs
>>> dax pages because these pages are considered special. To maintain
>>> existing behaviour once these pages are treated as normal pages and
>>> returned from vm_normal_page() add tests to explicitly skip them.
>>>
>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>> ---
>>>    fs/proc/task_mmu.c | 18 ++++++++++++++----
>>>    1 file changed, 14 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
>>> index 38a5a3e..c9b227a 100644
>>> --- a/fs/proc/task_mmu.c
>>> +++ b/fs/proc/task_mmu.c
>>> @@ -801,6 +801,8 @@ static void smaps_pte_entry(pte_t *pte, unsigned long addr,
>>>    	if (pte_present(ptent)) {
>>>    		page = vm_normal_page(vma, addr, ptent);
>>> +		if (page && (is_device_dax_page(page) || is_fsdax_page(page)))
>>
>> This "is_device_dax_page(page) || is_fsdax_page(page)" is a common theme
>> here, likely we should have a special helper?
> 
> Sounds good, will add is_dax_page() if there are enough callers left after any
> review comments.

:)

>   
>> But, don't we actually want to include them in the smaps output now? I think
>> we want.
> 
> I'm not an expert in what callers of vm_normal_page() think of as a "normal"
> page. 

Yeah, it's tricky. It means "this is abnormal, don't look at the struct 
page". We're moving away from that, such that these folios/pages will be 
... mostly normal :)

> So my philosphy here was to ensure anything calling vm_normal_page()
> didn't accidentally start seeing DAX pages, either by checking existing filters
> (lots of callers already call vma_is_special_huge() or some equivalent) or
> explicitly filtering them out in the hope someone smarter than me could tell me
> it was unneccssary.
> 
> That stategy seems to have worked, and so I agree we likely do want them in
> smaps. I just didn't want to silently do it without this kind of discussion
> first.

Yes, absolutely.

> 
>> The rmap code will indicate these pages in /proc/meminfo, per-node info, in
>> the memcg ... as "Mapped:" etc.
>>
>> So likely we just want to also indicate them here, or is there any downsides
>> we know of?
> 
> I don't know of any, and I think it makes sense to also indicate them so will
> drop this check in the respin.

It will be easy to hide them later, at least we talked about it. Thanks 
for doing all this!

-- 
Cheers,

David / dhildenb


