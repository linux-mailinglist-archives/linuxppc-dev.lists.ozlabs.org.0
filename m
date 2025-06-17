Return-Path: <linuxppc-dev+bounces-9414-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12993ADC664
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jun 2025 11:30:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bM1nN32jFz30GV;
	Tue, 17 Jun 2025 19:30:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750152632;
	cv=none; b=HIce3pUe0GXTPoKBvBF6AyLb1vTHVFrUwEA9t0yrPK5P+BFYsh89jJHI4tkY9lpHhEr5d07LGNQDaAeQi/5nOXbrIg7CZOmBwmaHYj6yynByjHpN+MOdNMbC8RKP/5e1Qn6ClKDmU+SK1nujTqOXgo9cqKMiGPeSDLH5EUHRa5R99YTt5b3id9gUKx1ik/U/pu548CbI3pqq0yEcSQuTvZ5OGx3oqvPLnMcaOgI/0zg7ltMytpULipoYAvn3NDHI4CSPHzS2qkh5qdgycmvij0yykKBtmRDFFnjn9EqGf9Q6+cip7FAkWGQ7MN9rFuH0TTvXVQvUCKpKK1zVQQqatw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750152632; c=relaxed/relaxed;
	bh=AycC/SqlmFtbCkiK+UJFsVg8F5mY3OZuVJE4LIVGke0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=AatihxRIcjdEqLFMfMHtIQX2tZYF0Ytg9sG3jkFzIcWhOfUYZhZ7gga2OXYjNugjTCrjYCpCAzhTPFZvlMeIwyaClnsL1j1z+WcZerhIRlQ4YYQzg0LkN313MPY8FQ+yAnJHMf7tXRdgBvU+JwOlyFtDx7KSv9haJbwlgiSFXsClmUbVzcit2P+hV6NyYiOdyOKhlJGMYtvht0RE7iJbQx+IhwONWuABUJ9hMF8kY4zH8zDLXM4yOPevfTmKCl5/PvoI1y0hep6nRdOGVbUW205DgXQOQwlXdoahbPONunRt16hlvGL0NaEScMGwKFfrR83Ub64V43fQZX9w8TrLDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V5GvZj85; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aHO0C+WF; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V5GvZj85;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aHO0C+WF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bM1nM2Xpsz2yMD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jun 2025 19:30:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750152626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AycC/SqlmFtbCkiK+UJFsVg8F5mY3OZuVJE4LIVGke0=;
	b=V5GvZj85cMVYyTXDJ7amQOXGXFjlyN8mAUKTBMuuuQEI3RPN9p2IvKq6dYgC5Fa9XepOOj
	HD8aDGmNAn3oXuemf3pdbsjZBELecH/anmpPZ80kNnxlggFgE//AiyZIG/vWi/VZG6QeZD
	9p5rR1QOR7ma/eWWb+xhCDWQ5tQ75FI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750152627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AycC/SqlmFtbCkiK+UJFsVg8F5mY3OZuVJE4LIVGke0=;
	b=aHO0C+WFb6uHd6wlRwlmpjQRnN3bUchx8cK+CikHZieAmJ+cwzzau2P6patOihesDZ8X+5
	oHMAN/nuDo+2yeO0TWSYdDLOC0N1FozjEnuPItxH/XEaxG91l2hP7Z7z5W+3sdr2jyQoT/
	2mPExggWvryZEgf9KnmEHjdQeNC3sWk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-RM_VGXGUPOeWz3Lh6NftgA-1; Tue, 17 Jun 2025 05:30:24 -0400
X-MC-Unique: RM_VGXGUPOeWz3Lh6NftgA-1
X-Mimecast-MFC-AGG-ID: RM_VGXGUPOeWz3Lh6NftgA_1750152624
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4fac7fa27so2421045f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jun 2025 02:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152623; x=1750757423;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AycC/SqlmFtbCkiK+UJFsVg8F5mY3OZuVJE4LIVGke0=;
        b=FkRhQpTFdcwPntNTxNWq5CF7i8XgJd1GqfaNCJJJJuULocaHRMMbfD8PoWRbOxnn14
         ZnYpDrqXT41ZnDthc/gTZdghak9A8B7gWUmRIDHO7YR7R+GSnOlRB4UxiIvOqrzrkKyV
         mbsG71uVSX1Hi74LyHeHAQMYxi78+IIMajbU43g1Hp+10ycIsgrRNVtQ6rNSDpPC4lpz
         kY9TOoIF3NIqJ1eUMRHxO7ro3XO33uWerkAoT29lF/f/Ob7KWk2AuUovn78cyrKWUeP0
         bhzLvmWrF9AaGDYxCZGz33P8TnN6lOOtcaLpCzLEjmt0Qxza0xs5FXhr4KUxOcWcbObK
         i3vA==
X-Forwarded-Encrypted: i=1; AJvYcCXiL1YpnhYTM2c6RUwLf2hHnqP78Gb6DfjpzW2b5lXR9R4IbVM53u6H06A6NsF0GYhQUL2tSvFD59mSfgs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyLUWJ8KmP3OM8EMDP/MZK+zl/vScv2af7t62tEEqkpWb+GuZ61
	w6y7GEDlSV/N1yN5yDNrR7AWK7Yro+6CCmskyBLuaPpVoAWYtAWReOjFV+QqeYY0Lv01Jx9zGlR
	5nW2wmHYpnLiyFqELMLkF6T3sopgTgKcZwr0hDc41Z4WHfEKngDYDyE5juYm92O7ifK4=
X-Gm-Gg: ASbGncsaU1w86Q29qHoDBuKk/5knfCrSutwFV7E0b6arK5ynnhAFALfIvsiLxCpEx1w
	dDw2fTGM6MEU7fxgeSppsTmPQtIhNjARVSWasHbAjv3FL/5DR3OR18he04MZWb1iXxMh6CH2Xkv
	HPGFSsFyR/HSHwPVTqQmRc22+AhxeuNFKJeixFdl/eB7j8D/nGNT7c/u5wY1qu/5CXVZHQT+7i/
	8S1hcaYbQutXcxPJY7Nj/WjrC50+ghP1IvNanZNOkoWD7OQa8HPV3StpLWPISWWZwvRKdOYUE8l
	pTqB5ZLgRhWbyrflS045sXKMl+9/w90DPCL/Y3PTeAtHQhikdIp9MdrC8AL2JJokpm00+gnmGBt
	YtCN3xXSBrcBxWQ/imK5MkcpzBjXDp6edxSY+3p3j0FeZHgg=
X-Received: by 2002:a05:6000:3109:b0:3a3:7387:3078 with SMTP id ffacd0b85a97d-3a572367b6bmr10595435f8f.4.1750152623497;
        Tue, 17 Jun 2025 02:30:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzIdOD1Y0VrtNcMDMGER4ExUmFNXEczyRtVtoCy/fV6z201YqQ8+qNgA+yjmzITUoW9nwVOw==
X-Received: by 2002:a05:6000:3109:b0:3a3:7387:3078 with SMTP id ffacd0b85a97d-3a572367b6bmr10595381f8f.4.1750152622944;
        Tue, 17 Jun 2025 02:30:22 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b79f45sm13384674f8f.101.2025.06.17.02.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:30:22 -0700 (PDT)
Message-ID: <b67f8dea-dc22-4c83-a71f-f5a2ecc8a8d7@redhat.com>
Date: Tue, 17 Jun 2025 11:30:20 +0200
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
Subject: Re: [PATCH v2 02/14] mm: Filter zone device pages returned from
 folio_walk_start()
From: David Hildenbrand <david@redhat.com>
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
 m.szyprowski@samsung.com
References: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
 <11dd5b70546ec67593a4bf79f087b113f15d6bb1.1750075065.git-series.apopple@nvidia.com>
 <6afc2e67-3ecb-41a5-9c8f-00ecd64f035a@redhat.com>
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
In-Reply-To: <6afc2e67-3ecb-41a5-9c8f-00ecd64f035a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fFQCUmDGIKguCQn8_MMFoLC0c2QrLCx6Ku4YN9zhAv4_1750152624
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 17.06.25 11:25, David Hildenbrand wrote:
> On 16.06.25 13:58, Alistair Popple wrote:
>> Previously dax pages were skipped by the pagewalk code as pud_special() or
>> vm_normal_page{_pmd}() would be false for DAX pages. Now that dax pages are
>> refcounted normally that is no longer the case, so the pagewalk code will
>> start returning them.
>>
>> Most callers already explicitly filter for DAX or zone device pages so
>> don't need updating. However some don't, so add checks to those callers.
>>
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>
>> ---
>>
>> Changes since v1:
>>
>>    - Dropped "mm/pagewalk: Skip dax pages in pagewalk" and replaced it
>>      with this new patch for v2
>>
>>    - As suggested by David and Jason we can filter the folios in the
>>      callers instead of doing it in folio_start_walk(). Most callers
>>      already do this (see below).
>>
>> I audited all callers of folio_walk_start() and found the following:
>>
>> mm/ksm.c:
>>
>> break_ksm() - doesn't need to filter zone_device pages because the can
>> never be KSM pages.
>>
>> get_mergeable_page() - already filters out zone_device pages.
>> scan_get_next_rmap_iterm() - already filters out zone_device_pages.
>>
>> mm/huge_memory.c:
>>
>> split_huge_pages_pid() - already checks for DAX with
>> vma_not_suitable_for_thp_split()
>>
>> mm/rmap.c:
>>
>> make_device_exclusive() - only works on anonymous pages, although
>> there'd be no issue with finding a DAX page even if support was extended
>> to file-backed pages.
>>
>> mm/migrate.c:
>>
>> add_folio_for_migration() - already checks the vma with vma_migratable()
>> do_pages_stat_array() - explicitly checks for zone_device folios
>>
>> kernel/event/uprobes.c:
>>
>> uprobe_write_opcode() - only works on anonymous pages, not sure if
>> zone_device could ever work so add an explicit check
>>
>> arch/s390/mm/fault.c:
>>
>> do_secure_storage_access() - not sure so be conservative and add a check
>>
>> arch/s390/kernel/uv.c:
>>
>> make_hva_secure() - not sure so be conservative and add a check
>> ---
>>    arch/s390/kernel/uv.c   | 2 +-
>>    arch/s390/mm/fault.c    | 2 +-
>>    kernel/events/uprobes.c | 2 +-
>>    3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/s390/kernel/uv.c b/arch/s390/kernel/uv.c
>> index b99478e..55aa280 100644
>> --- a/arch/s390/kernel/uv.c
>> +++ b/arch/s390/kernel/uv.c
>> @@ -424,7 +424,7 @@ int make_hva_secure(struct mm_struct *mm, unsigned long hva, struct uv_cb_header
>>    		return -EFAULT;
>>    	}
>>    	folio = folio_walk_start(&fw, vma, hva, 0);
>> -	if (!folio) {
>> +	if (!folio || folio_is_zone_device(folio)) {
>>    		mmap_read_unlock(mm);
>>    		return -ENXIO;
>>    	}
>> diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
>> index e1ad05b..df1a067 100644
>> --- a/arch/s390/mm/fault.c
>> +++ b/arch/s390/mm/fault.c
>> @@ -449,7 +449,7 @@ void do_secure_storage_access(struct pt_regs *regs)
>>    		if (!vma)
>>    			return handle_fault_error(regs, SEGV_MAPERR);
>>    		folio = folio_walk_start(&fw, vma, addr, 0);
>> -		if (!folio) {
>> +		if (!folio || folio_is_zone_device(folio)) {
>>    			mmap_read_unlock(mm);
>>    			return;
>>    		}
> 
> Curious, does s390 even support ZONE_DEVICE and could trigger this?

Ah, I see you raised this above. Even if it could be triggered (which I 
don't think), I wonder if there would actually be a problem with 
zone_device folios in here?

I think these two can be dropped for now

-- 
Cheers,

David / dhildenb


