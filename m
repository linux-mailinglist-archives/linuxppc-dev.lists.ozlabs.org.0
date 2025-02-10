Return-Path: <linuxppc-dev+bounces-6054-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EDFA2F815
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 20:01:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsDT13vWxz30Tx;
	Tue, 11 Feb 2025 06:01:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739214101;
	cv=none; b=RelZB1E3VwZkzT87awebRWA8J541VpL7lGlAkT3Q9+6JmzMogmVekFafbHC+NdSZEXD8On9/SGjkFZGM1DcwqnDBLTGKTqJrTQv5i2aBBzwbbGCNnOMPaXxI0xt0Yc6dji19ZQ10+nY6BJ/O8cFBEyipFOzSJNtkv77QlSBAwsH/HumUgmorIpFjQBVn9Fm7g/QX40qSzRTsG6Byp+CozCu1uA8dNkqkfA4YpmXXUzgl0eZaIwZY+QFp2bDzeHbR1fqskIDr7GwVaxL1vlzdvcvZMx/CLM6oBOuhgia3EKKBN5jYZYv7BHU5EgldWRFhCHtRjkE9aSIzzOxisdhITQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739214101; c=relaxed/relaxed;
	bh=wzsV/nHxroBNjLXhWoD5i0vnw07P5+Zp+zulUeyeNIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UnSr7FjD+k6Z91hb0QiLoNVVyBNjxHx1BlzwtCFVMPJBiWAFnKnQeoxyIebnNrTrCAHfsItQoFTeSVjXM3vyd1EyMM7Rg+VIDc0xT868l07CNeHpnEegONkWF3WF8zq2GEvs6EhpUxvR0+J3u2fPcA6REdRKvVxVMj4HECY72JmH9w3itcaqLmojihWnhUrUwd74RITtDPu4Aoa3VjiOBovTy3ddn2cnCUr2c5d1nSFZthijZ6Lm5R28ksFUKM1svqxkoSK0FhIEiAFcbGZSix5anm7rdpcX2Vjy++bDGwLpi3dOD0aHlUN8ikgD/mm3uvhDg77kNRNuxZAUeExDEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VNWBZnfA; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VNWBZnfA; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VNWBZnfA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VNWBZnfA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsDT02qy5z30Tp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 06:01:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739214095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wzsV/nHxroBNjLXhWoD5i0vnw07P5+Zp+zulUeyeNIU=;
	b=VNWBZnfAwgoQEgt6BFmUNqHbRj0yj0isYfI9idsQAc4g2saSGKzbTufjzJ5UCvSp43LPny
	xCBrbYhp9BdQ2LErltzGjNn2bkI57u8nRo7uVSbpZT60he4dDEmXt/IcWy7eegn5M2MPx7
	AniSCi3NTkhsL1Wh+FgmTwbpn8q2EOc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739214095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wzsV/nHxroBNjLXhWoD5i0vnw07P5+Zp+zulUeyeNIU=;
	b=VNWBZnfAwgoQEgt6BFmUNqHbRj0yj0isYfI9idsQAc4g2saSGKzbTufjzJ5UCvSp43LPny
	xCBrbYhp9BdQ2LErltzGjNn2bkI57u8nRo7uVSbpZT60he4dDEmXt/IcWy7eegn5M2MPx7
	AniSCi3NTkhsL1Wh+FgmTwbpn8q2EOc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-i0XifRL5NjWJ2fJc5AwXXQ-1; Mon, 10 Feb 2025 14:01:33 -0500
X-MC-Unique: i0XifRL5NjWJ2fJc5AwXXQ-1
X-Mimecast-MFC-AGG-ID: i0XifRL5NjWJ2fJc5AwXXQ
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4393e8738b3so11504075e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 11:01:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739214092; x=1739818892;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wzsV/nHxroBNjLXhWoD5i0vnw07P5+Zp+zulUeyeNIU=;
        b=l4L15OTur6v/8VpQ5NnnIchuBJhQF5z/0zJaxZ6Ul6aDpbwWWhuQ0LFR7LkCO5b0zN
         lZR34MKN3I1mGUQu6ljM2WwLK9NMMb/0B8FMNf0Qe2c08F4omC2Z8B0PI1Hbu+OGUvNq
         Yq/ce6rvD6h/LM3hsbTQ/FpqSd+yJiDKW0+mZR+lfAY5+u+Xx8PXZlVrVq6JVyZjw0oj
         OLqjiNC1oISQWP5SbLcEDeVl8UyklkWASh4nVfws75345Y/BFeJ/Sq4RscquXboXnrTp
         nMUB8x6SxGsbjXf29GV65DqxbvF9/wzlyNByHK37c15IjsAdIqAWPwPd+wpmks10IHBA
         d50g==
X-Forwarded-Encrypted: i=1; AJvYcCXL1RDmySQVDRV1TR/CaxUXMAeTPLOvhtR5oeJRHKcGdCEVINDu7VIBH7HV4ss0Qhc2wJ9Kkh9mdZp73fk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwJN9eKlYoLsqxXQcLDPX5pxlHozLiswWsT8LcoCYRWUi+zVZ8y
	Z92nyC2wl62G2WfB29UoixO1yUbQDAJn1XzaUtLSLGTRITCV0fmtPJvGwJJJNclEzEEw6xKVQtE
	oLQJTVYI03KzzSviSGzXnJ0FZw8GULe4Ytb2Fiw9LrG4Y+PyYM6Pnx1PN1eAUVPI=
X-Gm-Gg: ASbGncuGSwXsBmbD9lUs+TRQQI5GrmCiViH+8Gg9we2q8z0P4+pQzT3m823mJmrUr4K
	jkJNXI6w5BiLRBnelvqBJaLMY29+LwobhAVBE/QQOBIlEd42/iZCZLiVVvHEFwzPYd4YFFl7A7g
	L3tsfbomcJCrI9C0cDJuWnQgQVBEp9rE9biVdjT8qca3KlRCj1+EDnnz8DnTqbs8HZp1Mnv0rRg
	L1G6mB86LS3oqiBdCvxtbRfjizE0obF1WUPfUeARC7ujrLXGHOqHoJ4DeHk018ZKnD0XpgjxgcH
	puYK7WrYhWEUd+RgzAY7gf3YtZm7l6PeUQkeemz0HnyMGCgBtopgSKLp081T+yToZdEQCxksSFI
	6+DCSKA0NyJO/KCC1V2YLkP9Zkj5mwm9Q
X-Received: by 2002:a05:600c:190e:b0:438:a240:c55 with SMTP id 5b1f17b1804b1-4392497d5a2mr101320445e9.1.1739214092220;
        Mon, 10 Feb 2025 11:01:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqWvelv/EcWxqIdqqM8VMOUSW6z55PUGBNaBVsQSNr8P/MbW0xQgBUZTOgnOd6dY4d3UNnxA==
X-Received: by 2002:a05:600c:190e:b0:438:a240:c55 with SMTP id 5b1f17b1804b1-4392497d5a2mr101319385e9.1.1739214091737;
        Mon, 10 Feb 2025 11:01:31 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:b800:12c4:65cd:348a:aee6? (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc17e278bsm12112233f8f.48.2025.02.10.11.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:01:30 -0800 (PST)
Message-ID: <6a6773ae-a21a-437c-be6f-d8e53267e534@redhat.com>
Date: Mon, 10 Feb 2025 20:01:28 +0100
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
Subject: Re: [PATCH v7 19/20] fs/dax: Properly refcount fs dax pages
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 dan.j.williams@intel.com, linux-mm@kvack.org
Cc: Alison Schofield <alison.schofield@intel.com>, lina@asahilina.net,
 zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
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
 david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev
References: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
 <b5c33b201b9dc0131d8bb33b31661645c68bf398.1738709036.git-series.apopple@nvidia.com>
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
In-Reply-To: <b5c33b201b9dc0131d8bb33b31661645c68bf398.1738709036.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iqFULnpkgsoWhrWymofRH3Rjb3AgdVaLWVbXOp3XqUU_1739214092
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


>   
> -static inline unsigned long dax_page_share_put(struct page *page)
> +static inline unsigned long dax_folio_put(struct folio *folio)
>   {
> -	WARN_ON_ONCE(!page->share);
> -	return --page->share;
> +	unsigned long ref;
> +
> +	if (!dax_folio_is_shared(folio))
> +		ref = 0;
> +	else
> +		ref = --folio->share;
> +
> +	WARN_ON_ONCE(ref < 0);
> +	if (!ref) {
> +		folio->mapping = NULL;
> +		if (folio_order(folio)) {


I'd have made this easier to read by doing

if (ref)
	return ref;
folio->mapping = NULL;

order = folio_order(folio)
if (!order)
	return 0;

pgmap = page_pgmap(&folio->page);
for (i = 0; i < (1UL << order); i++) {
	// loop body see below
}
return 0;


In the context of similar split users and related discussions in the 
future with memdescs -- see 89a41a0263293856678189981e5407375261c4ff -- 
I would further do within the loop (avoiding messing with page-> 
completely):

...
	struct page *page = folio_page(folio, i);
	/* Careful: see __split_huge_page_tail() */
	struct folio *new_folio = (struct folio *)page;

	ClearPageHead(page);
	clear_compound_head(page);

	new_folio->mapping = NULL;	
	/*
	 * Reset pgmap which was over-written by
	 * prep_compound_page().
	 */
	new_folio->pgmap = pgmap;
	new_folio->share = 0;
	WARN_ON_ONCE(folio_ref_count(new_folio));
...


I scanned over the other stuff in here, but I'm not an expert on the 
pfn_t etc thingies.

-- 
Cheers,

David / dhildenb


