Return-Path: <linuxppc-dev+bounces-9077-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF5EACADE4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 14:21:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9tH40YXKz2yLT;
	Mon,  2 Jun 2025 22:21:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748866863;
	cv=none; b=H6G+ginJxSJg+WsfJ3mj6uTkuTdW6/dROzGOPFjVVmv/MpMZ2UUuGbqEpkiTqGPFPLrXbTsSs+Ltr3SJDjJ60GWd+Wc+/sj4gcNu8fyYVAumcPwQw80SUYcGQX3ValaS8QT6jAmV+kTMi4c6tIIwqrjKLSd3NXuQpybxKCXtuK0i570pSsMbDUFaeuTpiVOYzCHOooa/Hpl2dSKkfPNw81/ZrwFU46ftczteah599t6qy5MICBdRiVOk1nX5ex05hcKFgrVwJf2kZjGAfPz6jZUQUkaQOT44XD+JnmXg+IzwW/ZaFWIYEJJH90+Y+/oXkMyKsrs/1ln4Ovvnp+Wyeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748866863; c=relaxed/relaxed;
	bh=fha/wYALl1qC/d0EpO8TYe7+VBeqcFERTe14lUW/UoM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UYoZs8kbqpQ1oA4mhDKUpcKdqlAP6R/k4u7Hj6/U9hml1gKCEwa/eSkKibdBib3OjnF41RmMcK8hsvOTvorJjhuet5smmNg7ca8N7tzW21vqJ5QlekJrMfViX0MMCCZjAudaN+KzWgJxSgisBMd8SjEoK/imUy6WwjoUsCpSZ4dU+e+byyMaQ6pwhS/YGbicE2leYlJyUqKgCPh4bCdMiPxcmY6eqlwm/FMh0HrOmraBeJApg+vu2XdjzQhiACfWOWDLft7TFPVbaiy9aCarXdBmtsMJL6GcScVfvzVruccm1auHz15EixSaTmFbYnnGuyfHnwqD82pMx3TMGn7Fwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jFTVmOcE; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jFTVmOcE; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jFTVmOcE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jFTVmOcE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9tH14QMSz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Jun 2025 22:21:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748866857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fha/wYALl1qC/d0EpO8TYe7+VBeqcFERTe14lUW/UoM=;
	b=jFTVmOcEdkHOe6QFmUCh7tsTjuy/pRtP5++Ylk7EgFBXMc44O43PKANSnkrKxyXZBUXdXT
	8TGjKVTfknlU8j2UqsCaK4oVcw6cK10L2qe77zKPIZ8YHzeq5UVlJr5kHI/fvI7ohe+mle
	9P/gZGW6+A6sAKSz3aFWX+legvPMpRo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748866857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fha/wYALl1qC/d0EpO8TYe7+VBeqcFERTe14lUW/UoM=;
	b=jFTVmOcEdkHOe6QFmUCh7tsTjuy/pRtP5++Ylk7EgFBXMc44O43PKANSnkrKxyXZBUXdXT
	8TGjKVTfknlU8j2UqsCaK4oVcw6cK10L2qe77zKPIZ8YHzeq5UVlJr5kHI/fvI7ohe+mle
	9P/gZGW6+A6sAKSz3aFWX+legvPMpRo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-hfKKgGVcMyePZNpLT5MrkA-1; Mon, 02 Jun 2025 08:20:56 -0400
X-MC-Unique: hfKKgGVcMyePZNpLT5MrkA-1
X-Mimecast-MFC-AGG-ID: hfKKgGVcMyePZNpLT5MrkA_1748866855
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450df53d461so17899525e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Jun 2025 05:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748866855; x=1749471655;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fha/wYALl1qC/d0EpO8TYe7+VBeqcFERTe14lUW/UoM=;
        b=CJjPiobBK3XffIyaIEtJRSTuBTLJLK+YmEBQQwEsTOYsP7VkawRNlHo4yjxJncFlM8
         roiQHOBoJgvCoj+UJXUTybbouGgCu9rUjDLLyqZ/Nae1gmTtHAJVQcjpetmpDc04xx+7
         nMqZvIXAjW4yIUBKREdEGAlUsxbYLZY5eW8sOtw7EKKKjAz/mptiqPJ/89y0O2lawPbZ
         saxMOS6ISto+IhOA0sUjLDsXWMMTaoxJU+BRTIpzkkifOYVbvs9fNv+bUdDSoeOLlWV4
         JbFjVhN/RT/rK+CfPH4tBRaGftFjtyAjHUwftm3BOBvOVvUTBrQf/fTf/3IljdDj9dcq
         sycA==
X-Forwarded-Encrypted: i=1; AJvYcCVwlM4UPRlrxQPh/QTNSD2Ejz8VCgkTankhtATtjjXp43mthDyXIfH6VK3is8YWUL2GI7vDx7zcOeqBg+0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxaQ55fBABH37NNzMQTIOVYUQhHxhYEvG7tGUq+AUzHXKAJu/nz
	jno4+YQL/j6F+97Vqj16VY4kiDGutxj3ySPqIUG74QvMkQWwhKeiXSVLggV91S9XDjl/c8OMXLp
	1+xP87wVlumDT9QTUDmrnQei6qlgja8eDENULeMwwLFc4/txX8l1D4/t3BnUKrar43uc=
X-Gm-Gg: ASbGncv1s7N1VgwFr96KqGDns5WY1PqlFQSKl5k0dgXsLc+LemgFyJLkTTmwCfu/NWM
	XjGyZFCLrdJSDz+KYlFTa/K6iM05xzdcoX9eVfkWhooUSrHiAobnZxKE1fdc3Y9Z5Z5hlP64L0c
	8FT1ZWAFTz965UlprqiAoRV26+oxfdJYA8Runp7NIzzGHYXZ4rs/1Nu7lutjwN1YPLO2pnd2trL
	6GBfCtjGRnKG/iVDbfyKixjKeECkQcz7YgyN+mFPOJ4qtnzdwvLTWkvElecUnP1rnMhoHBKaxep
	wqUHzU6gDJAdSfs9ALlSgvQsjum+o90lfcmvTccQj9v/fQYX5RtmcLfu4RR+BJiRj8NEjb5I/Nr
	seioRoON2SoYAzZQDFEVbYANhBr3GxYWaKSj7hfQ=
X-Received: by 2002:a05:600c:608a:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-450d87fd857mr103237655e9.6.1748866854927;
        Mon, 02 Jun 2025 05:20:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIX1lEBcvIjIUWzMHUVHY0RO1zDGA/tS4Yya6bs5LYBrcaJXLO7aiOIgpY/seevYUJEdu6Rg==
X-Received: by 2002:a05:600c:608a:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-450d87fd857mr103237275e9.6.1748866854547;
        Mon, 02 Jun 2025 05:20:54 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f34:a300:1c2c:f35e:e8e5:488e? (p200300d82f34a3001c2cf35ee8e5488e.dip0.t-ipconnect.de. [2003:d8:2f34:a300:1c2c:f35e:e8e5:488e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8edf9sm120150665e9.3.2025.06.02.05.20.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 05:20:54 -0700 (PDT)
Message-ID: <799691d6-d9dd-43fd-805e-7dce6efff3e6@redhat.com>
Date: Mon, 2 Jun 2025 14:20:52 +0200
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
Subject: Re: [PATCH 07/12] mm: Remove redundant pXd_devmap calls
From: David Hildenbrand <david@redhat.com>
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org
Cc: gerald.schaefer@linux.ibm.com, dan.j.williams@intel.com, jgg@ziepe.ca,
 willy@infradead.org, linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>
 <9c465b24-8775-4852-9618-0873cbf2aaf7@redhat.com>
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
In-Reply-To: <9c465b24-8775-4852-9618-0873cbf2aaf7@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9VSobvfbQszH57XJtUZZNz2mc7DuoGebyKbXT5NK5Is_1748866855
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 02.06.25 11:33, David Hildenbrand wrote:
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -1398,10 +1398,7 @@ static int insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
>>    	}
>>    
>>    	entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));
>> -	if (pfn_t_devmap(pfn))
>> -		entry = pmd_mkdevmap(entry);
>> -	else
>> -		entry = pmd_mkspecial(entry);
>> +	entry = pmd_mkspecial(entry);
>>    	if (write) {
> 
> 
> I just stumbled over this, and I think there is something off here in
> the PMD/PUD case.
> 
> vmf_insert_folio_pmd() does a folio_get() + folio_add_file_rmap_pmd().
> 
> But then, we go ahead and turn this into a special mapping by setting it
> pmd_mkdevmap()/pmd_mkspecial().
> 
> Consequently, vm_normal_page_pmd() would ignore them, not following the
> rules documented for vm_normal_page() and behaving differently than
> vmf_insert_page_mkwrite()->insert_page().
> 
> 
> folio_add_file_rmap_pmd() should never set these things special/devmap
> in the first place :/
> 
> What am I missing?
> 
> Note that fs/dax.c calls vmf_insert_folio_pmd() for PMDs and
> vmf_insert_page_mkwrite() for PTEs.
> 
> Consequently, PTEs will never be marked special (corner case, shared
> zeropage), but PMDs would always.
> 
> Hm?

What an ugly piece of crap this pmd handling code is.

Just noting because I stumbled over that myself:

pmd_mkdevmap() does *not* imply pmd_special().

... in contrast to pte_mkdevmap(), which will imply pte_special().


-- 
Cheers,

David / dhildenb


