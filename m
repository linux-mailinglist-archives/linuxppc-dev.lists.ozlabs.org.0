Return-Path: <linuxppc-dev+bounces-8945-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE61FAC435F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 May 2025 19:17:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5jBG2bZxz2xS2;
	Tue, 27 May 2025 03:17:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748279846;
	cv=none; b=j3wH03PENUp/dXfu/W25GjDCgFHQRtutsCuAzOzUA2jz1/DF06/52WOfzkcrd7D5ts3ZBtXuOA0JAD8Z2FRKVHSVRoxVYXvTrhm+0MwuNiO/WKasr4Xz6sq1bLgS9krtdxBmAq9aY9S7tKi/4zeg4fInRH3QMOREq0fdz1dAWiPMiA3Eg81waWAGIwZR9XOPfrT6z0zRFMmaRX0mCZ6VneFCD/4suOreF85KckNaHrhU8sOCGK3naOjoLUKmhi/Bdq5I+Wwn7Q4vjj/NRh3IePClKhzBMaYlkQ+1oXtkmntmdJLnkwXoWejQ+uTpKndK2NI6KQndu5SZHB8io2ghLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748279846; c=relaxed/relaxed;
	bh=vvkurFwD/ln7aIPd0yrzQWt5kfZ7guBxhUcxWM2VHnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B6IPlpgjvCprh9HTmWAOPvqVZxpUTOHVZhtunLolaCZa7IFmuUYb3FCkPNrGw3i8ZEtEkF0A/XfEy//B8GbzEhGr1dMX5Q0uJCmpEVVshBhLVCvjdVVsjHhSJj4sZV6UC+SW7Hox4WZ/2VXv2WJ5mmkOl481oXnPP61dEjKGW9PyWJKr5nOjCRhPFjqPMUlgpH/+MbDPnZx49+GwvXkkVqDsZr2NY2X5aRmvrmzsgYGr+ngL3qmJY9EOAdyUVLcyGEhi4SdR/gZW9GFu1KYzCUo/CY8maFQR/xTiZvK1F0mp3DjlpT7V3drKOQd4jTbfa12baqePBFQPqikEQTP05Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U52pwY0v; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U52pwY0v; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U52pwY0v;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U52pwY0v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b5jBD6dCWz2xRw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 May 2025 03:17:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748279839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vvkurFwD/ln7aIPd0yrzQWt5kfZ7guBxhUcxWM2VHnE=;
	b=U52pwY0vdKuJuK8KW6YEZFtvXDUMsMj68/SeAupY7Gl3CdOR/y8O0+sMRjbWKU2aou8qfc
	kpcc6fFLk/igw2Sk1ReJ3OiUohxeK1dottRni7yUglYtzRRdvdmv0YV8tp0oj2RNrDB3Lp
	b0vJVjf8TT1sxX0UNs0Am3fIQp5VFro=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748279839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vvkurFwD/ln7aIPd0yrzQWt5kfZ7guBxhUcxWM2VHnE=;
	b=U52pwY0vdKuJuK8KW6YEZFtvXDUMsMj68/SeAupY7Gl3CdOR/y8O0+sMRjbWKU2aou8qfc
	kpcc6fFLk/igw2Sk1ReJ3OiUohxeK1dottRni7yUglYtzRRdvdmv0YV8tp0oj2RNrDB3Lp
	b0vJVjf8TT1sxX0UNs0Am3fIQp5VFro=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-RJLJhN8cOiucpuj3bl24cA-1; Mon, 26 May 2025 13:17:17 -0400
X-MC-Unique: RJLJhN8cOiucpuj3bl24cA-1
X-Mimecast-MFC-AGG-ID: RJLJhN8cOiucpuj3bl24cA_1748279836
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43efa869b19so15791965e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 May 2025 10:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748279836; x=1748884636;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vvkurFwD/ln7aIPd0yrzQWt5kfZ7guBxhUcxWM2VHnE=;
        b=DjPjEZKRACWm+aC+gDQbNqaXACzQL/Lx3wnBwlIGW7aT8mvcGf2WyvU+hl27BgY4uo
         ksbE+KRhvbBOQcIuJS6SeunmBzZI4Ck3xY7rkbJPdy+U1eai6k2rzq3Z78/KaUSjcjjc
         9qO4zrANMJqftVnXQu74YVgqsd+5GWL3OtjawAQvykkuP9LiKTtckeYNl65/ytN8gwnY
         zCurGaQMA4RL4Ai6LHFKv/u+41Z7C7DC0CkO33LlSQtq5YIfbWsJBli2FztO62mI/TRJ
         /QEE8LXncmbmoqWcdsK7zjeAs2WkjmZVqFg5RHkqM2luyeiLjzqiGHWxWeQG8pSU3Uwe
         vggA==
X-Forwarded-Encrypted: i=1; AJvYcCW7oq24PMYDgKXii5bA6I6VSxLyBH58Su+ZuTsb/Wj1j9cT1eKXnggb+SkJc0FvlUEErae2LbcwyljtJHU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyXD/fd1XiRfo1s5vO48PuHSaIPm1Oj+Jgs/tUgvmTIDOBWdoIG
	5eFyDk23B/Ho56E/gRaXnCd3+VnmkHnHCrkIKBHqRx9FZBOnqgn7geRDjc/E6eDxm6SkUnTbm3a
	xZSIA6Qk+rRoaRS4bDXj8kkUp1kFgAPH0FtXoWHvjZm02i0j6+c76sLpmK+y6cOV9ScA=
X-Gm-Gg: ASbGncv7vOaLsGg+oXev/J1f6ep5Sv6Htslbkz5ZFd4ND9bq3y1UkG9b1C2rXpzGqTs
	Tfd3a7hujh/tvKS//qH/0V8diy04/Y98/MAIr28E/AHQszrnhsTIJuMuno/gOasypbFMrbsO4gL
	I6uKE7E57Ois/+igv0DYp7rfKNjWUaDDCTdUZ2PQFwEx4hom7wLXJTdnEst2mvrICwwzflG0x6Z
	6B84VqFhQtdX+yFt4nFOcGI97HID1QP8Y3/jksVWjGk7szQ+K/hgo+YLT5KKoL6/kvyGe0WPwl8
	C1zwLKCv78OV8Zv2GK5wySIqchiIH8+8/ljRWjAVhIdft+7K7cPkmr9POcJJIAf7Y6EebePybBc
	hV+qgtiMOQdZ4QW/c5vfgdv0KJ/GCLvi0uTbFdO0=
X-Received: by 2002:a05:6000:2892:b0:3a4:cf40:ff37 with SMTP id ffacd0b85a97d-3a4cf4101e6mr7349873f8f.6.1748279836126;
        Mon, 26 May 2025 10:17:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEor4pKEGtom7BDqTYjiMotloxQfu1xzqM+ForU+36DqHUur59mzcvYI/Btx64T3mrbSgEa4Q==
X-Received: by 2002:a05:6000:2892:b0:3a4:cf40:ff37 with SMTP id ffacd0b85a97d-3a4cf4101e6mr7349836f8f.6.1748279835622;
        Mon, 26 May 2025 10:17:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:6500:e1c1:8216:4c25:efe4? (p200300d82f196500e1c182164c25efe4.dip0.t-ipconnect.de. [2003:d8:2f19:6500:e1c1:8216:4c25:efe4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cd0cf5c0sm8078384f8f.12.2025.05.26.10.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 10:17:15 -0700 (PDT)
Message-ID: <13707f7a-3ed6-4a79-bc55-46d331f8b051@redhat.com>
Date: Mon, 26 May 2025 19:17:13 +0200
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
Subject: Re: [PATCH v6 1/5] drivers/base/node: Optimize memory block
 registration to reduce boot time
To: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Nilay Shroff
 <nilay@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <bc754a238aa91fa36be463985ccde66aac7055e7.1748270306.git.donettom@linux.ibm.com>
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
In-Reply-To: <bc754a238aa91fa36be463985ccde66aac7055e7.1748270306.git.donettom@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QxDNrE8z8JXp4D5lHPxCgA_8zceo2MTCxJVa-Zz5fSM_1748279836
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 26.05.25 16:50, Donet Tom wrote:
> During node device initialization, `memory blocks` are registered under
> each NUMA node. The `memory blocks` to be registered are identified using
> the node’s start and end PFNs, which are obtained from the node's pg_data
> 
> However, not all PFNs within this range necessarily belong to the same
> node—some may belong to other nodes. Additionally, due to the
> discontiguous nature of physical memory, certain sections within a
> `memory block` may be absent.
> 
> As a result, `memory blocks` that fall between a node’s start and end
> PFNs may span across multiple nodes, and some sections within those blocks
> may be missing. `Memory blocks` have a fixed size, which is architecture
> dependent.
> 
> Due to these considerations, the memory block registration is currently
> performed as follows:
> 
> for_each_online_node(nid):
>      start_pfn = pgdat->node_start_pfn;
>      end_pfn = pgdat->node_start_pfn + node_spanned_pages;
>      for_each_memory_block_between(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn))
>          mem_blk = memory_block_id(pfn_to_section_nr(pfn));
>          pfn_mb_start=section_nr_to_pfn(mem_blk->start_section_nr)
>          pfn_mb_end = pfn_start + memory_block_pfns - 1
>          for (pfn = pfn_mb_start; pfn < pfn_mb_end; pfn++):
>              if (get_nid_for_pfn(pfn) != nid):
>                  continue;
>              else
>                  do_register_memory_block_under_node(nid, mem_blk,
>                                                          MEMINIT_EARLY);
> 
> Here, we derive the start and end PFNs from the node's pg_data, then
> determine the memory blocks that may belong to the node. For each
> `memory block` in this range, we inspect all PFNs it contains and check
> their associated NUMA node ID. If a PFN within the block matches the
> current node, the memory block is registered under that node.
> 
> If CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, get_nid_for_pfn() performs
> a binary search in the `memblock regions` to determine the NUMA node ID
> for a given PFN. If it is not enabled, the node ID is retrieved directly
> from the struct page.
> 
> On large systems, this process can become time-consuming, especially since
> we iterate over each `memory block` and all PFNs within it until a match is
> found. When CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, the additional
> overhead of the binary search increases the execution time significantly,
> potentially leading to soft lockups during boot.
> 
> In this patch, we iterate over `memblock region` to identify the
> `memory blocks` that belong to the current NUMA node. `memblock regions`
> are contiguous memory ranges, each associated with a single NUMA node, and
> they do not span across multiple nodes.
> 
> for_each_memory_region(r): // r => region
>    if (!node_online(r->nid)):
>      continue;
>    else
>      for_each_memory_block_between(r->base, r->base + r->size - 1):
>        do_register_memory_block_under_node(r->nid, mem_blk, MEMINIT_EARLY);
> 
> We iterate over all memblock regions, and if the node associated with the
> region is online, we calculate the start and end memory blocks based on the
> region's start and end PFNs. We then register all the memory blocks within
> that range under the region node.
> 
> Test Results on My system with 32TB RAM
> =======================================
> 1. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.
> 
> Without this patch
> ------------------
> Startup finished in 1min 16.528s (kernel)
> 
> With this patch
> ---------------
> Startup finished in 17.236s (kernel) - 78% Improvement
> 
> 2. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT disabled.
> 
> Without this patch
> ------------------
> Startup finished in 28.320s (kernel)
> 
> With this patch
> ---------------
> Startup finished in 15.621s (kernel) - 46% Improvement
> 
> Acked-by: Oscar Salvador <osalvador@suse.de>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> 


Only a couple of nits:

> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index cd13ef287011..20b6f4496e1b 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -20,6 +20,7 @@
>   #include <linux/pm_runtime.h>
>   #include <linux/swap.h>
>   #include <linux/slab.h>
> +#include <linux/memblock.h>
>   
>   static const struct bus_type node_subsys = {
>   	.name = "node",
> @@ -850,6 +851,47 @@ void unregister_memory_block_under_nodes(struct memory_block *mem_blk)
>   			  kobject_name(&node_devices[mem_blk->nid]->dev.kobj));
>   }
>   
> +/*
> + * register_memory_blocks_under_nodes : Register the memory blocks
 > + *                 under the nodes.> + *
> + * This function registers all memory blocks to their corresponding nodes
> + * based on the associated memory regions. Each memory region is tied to
> + * a specific node and does not span multiple nodes. Therefore, all memory
> + * blocks within a given region are considered to belong to that node. The
> + * function iterates through each memory region and registers the memory
> + * blocks contained within that region to the respective node. Since memory
> + * blocks can span across multiple regions (and hence multiple nodes), a
> + * single memory block may be registered under more than one node if it
> + * overlaps with regions belonging to different nodes.

a) Do we need excessive doc for that?

b) It looks partially like kerneldoc, do we want to convert it to proper 
one?

/**
  * register_memory_blocks_under_nodes - register all memory blocks
  * 					under the corresponding nodes
  *
  ...

c) Maybe add a line break .. or two to make it a bit more readable.

 > + */> +static void register_memory_blocks_under_nodes(void)
> +{
> +	struct memblock_region *r;
> +
> +	for_each_mem_region(r) {
> +		const unsigned long start_block_id = phys_to_block_id(r->base);
> +		const unsigned long end_block_id = phys_to_block_id(r->base + r->size - 1);
> +		unsigned long block_id;
> +		int nid = memblock_get_region_node(r);

const int nid = memblock_get_region_node(r);
unsigned long block_id;

> +
> +		if (!node_online(nid))
> +			continue;
> +
> +		for (block_id = start_block_id; block_id <= end_block_id; block_id++) {
> +			struct memory_block *mem;
> +
> +			mem = find_memory_block_by_id(block_id);
> +			if (!mem)
> +				continue;
> +
> +			do_register_memory_block_under_node(nid, mem, MEMINIT_EARLY);
> +			put_device(&mem->dev);
> +		}
> +
> +	}
> +}
> +
>   void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
>   				       unsigned long end_pfn,
>   				       enum meminit_context context)
> @@ -971,11 +1013,16 @@ void __init node_dev_init(void)
>   
>   	/*
>   	 * Create all node devices, which will properly link the node
> -	 * to applicable memory block devices and already created cpu devices.
> +	 * to already created cpu devices.
>   	 */
>   	for_each_online_node(i) {
> -		ret = register_one_node(i);
> +		ret =  __register_one_node(i);
>   		if (ret)
>   			panic("%s() failed to add node: %d\n", __func__, ret);
>   	}
> +
> +	/*
> +	 * Link the node to memory block devices
> +	 */


This comment is rather ... superfluous.  ... and it would fit into a 
single line.

> +	register_memory_blocks_under_nodes();
>   }
> diff --git a/include/linux/memory.h b/include/linux/memory.h
> index 12daa6ec7d09..2a61088e17ad 100644
> --- a/include/linux/memory.h
> +++ b/include/linux/memory.h
> @@ -171,12 +171,30 @@ struct memory_group *memory_group_find_by_id(int mgid);
>   typedef int (*walk_memory_groups_func_t)(struct memory_group *, void *);
>   int walk_dynamic_memory_groups(int nid, walk_memory_groups_func_t func,
>   			       struct memory_group *excluded, void *arg);
> +struct memory_block *find_memory_block_by_id(unsigned long block_id);
>   #define hotplug_memory_notifier(fn, pri) ({		\
>   	static __meminitdata struct notifier_block fn##_mem_nb =\
>   		{ .notifier_call = fn, .priority = pri };\
>   	register_memory_notifier(&fn##_mem_nb);			\
>   })
>   
> +extern int sections_per_block;
> +
> +static inline unsigned long memory_block_id(unsigned long section_nr)
> +{
> +	return section_nr / sections_per_block;
> +}
> +
> +static inline unsigned long pfn_to_block_id(unsigned long pfn)
> +{
> +	return memory_block_id(pfn_to_section_nr(pfn));
> +}
> +
> +static inline unsigned long phys_to_block_id(unsigned long phys)
> +{
> +	return pfn_to_block_id(PFN_DOWN(phys));
> +}
> +
>   #ifdef CONFIG_NUMA
>   void memory_block_add_nid(struct memory_block *mem, int nid,
>   			  enum meminit_context context);
> @@ -188,5 +206,4 @@ void memory_block_add_nid(struct memory_block *mem, int nid,
>    * can sleep.
>    */
>   extern struct mutex text_mutex;
> -

Unrelated change.


Thanks

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


