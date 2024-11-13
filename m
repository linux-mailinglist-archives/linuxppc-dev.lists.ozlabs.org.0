Return-Path: <linuxppc-dev+bounces-3149-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0039C7913
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 17:42:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpTbQ5R9Lz2yQL;
	Thu, 14 Nov 2024 03:42:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731516146;
	cv=none; b=e/qZyCYzZ/wLyWOaDUEbMG9p6QSBXmlpyWtsEbjZwQ6sU0coHUI9o++JJrC4fuc9nr6oKsOHqw5FLSQG48k8R44tr+JrOsk/MqgQuO0hH8yLORetY/7P/BWo6JWc6gaM2hN2MQiD/vWZzFI/gOeNlPX5BrjYdXYHoSjmU5CXR2yVaYde2Zr4PrknKM25sgF736PN/HVFXGyXuJVRXE7OomLpdHMMALpI26MdBxrz7c88mzmHZ+eqBFMyEBpwV+cEy9VXf21Po5lvUJvSmbUXWPNuVrEqS9U5EZW6t7kO0UDEs2jNLuv2XE0vouLe35Kk6ZWVRtIUpdPN6PTs7rbRtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731516146; c=relaxed/relaxed;
	bh=o2uVTxwTpGvAZlW2EK/ythZusGtOUM1ymWD0yqATzCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lTaMCcupRsgtv+EZVkDnv0g5kUfN/Fho7tk9fUnQtdmPVHqr1naPtKFMIa4QjsQI4GSyuWaNZZcWQZ+kcuQEMoC4rYL+SBNFG5LwySwOUUjNlGaZffnjSJne+7Cb1Xc96zAQIfrVAudaDl9RmnbhWj7A3fyUnRlj2haWmjlQ/raKUT5/jYrYEsEf3w7SCG5T7/VbrYZGaJEBpiTDvKTly2HioN1okFNGnPbxXtYnI4WV7BesR67tx3bVqhBeIvAe9NRTpHONik2GNkoldPtpM3P+kaWoCs3XpAA8GMSSpijrACaNfDNz7DAU5R6FYAYI9514hRfTsvnz1tCqTqbYDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AyVNo38U; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AyVNo38U; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AyVNo38U;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AyVNo38U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpTbP4cwnz2xjY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 03:42:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731516141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=o2uVTxwTpGvAZlW2EK/ythZusGtOUM1ymWD0yqATzCQ=;
	b=AyVNo38U/DO8HfihLP0v4gfJW1jpkhmKVeimw1aM66wOCtz6BTirPuhvQGX3vzyT8d+bwx
	os5UPvW3NX+PMRZ885jGXqTTyhWNBPt4HjNA3NEBqE+qMPWzvt5wfeMkdtzZBhJqxjBiZF
	xH0Jxj68HxxCJTVzNjEEDgxmaMZ5qFE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731516141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=o2uVTxwTpGvAZlW2EK/ythZusGtOUM1ymWD0yqATzCQ=;
	b=AyVNo38U/DO8HfihLP0v4gfJW1jpkhmKVeimw1aM66wOCtz6BTirPuhvQGX3vzyT8d+bwx
	os5UPvW3NX+PMRZ885jGXqTTyhWNBPt4HjNA3NEBqE+qMPWzvt5wfeMkdtzZBhJqxjBiZF
	xH0Jxj68HxxCJTVzNjEEDgxmaMZ5qFE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-jwsobbkZNs2q5Up3tLPt0g-1; Wed, 13 Nov 2024 11:42:19 -0500
X-MC-Unique: jwsobbkZNs2q5Up3tLPt0g-1
X-Mimecast-MFC-AGG-ID: jwsobbkZNs2q5Up3tLPt0g
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4315dd8fe7fso65390005e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 08:42:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731516139; x=1732120939;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o2uVTxwTpGvAZlW2EK/ythZusGtOUM1ymWD0yqATzCQ=;
        b=a1JVjd+FGRFp3k6MOF68oya8e9O+VtK5MZNqFH/kZGuvzbqXF1KYLF8rthgayopDX7
         UH0Li1a/fLfIXsnoYOLxz/4q5hKAd6FK15aAYfhG466DOvYVOybzQVZ6RZpVVUe223hU
         J20p6DgD8erK7ZR4+cgI5nIsdvI4ko6baFuiE/YHfVxCmM0pC9Ih3V5bqWTGzX7inacn
         fu8hNk6q2PsyqHxpby5Q2LugGL0GqCKqaBzToBwm1ETMzdj9GZflBkD0j6OMituLqSFe
         PC6M/DPvujJzvdXsT8tZX5n+cT5sSQYXTqHZSp8l7qTH0HNs/+yeU43gnhKu/0fnnUN8
         Yp5A==
X-Forwarded-Encrypted: i=1; AJvYcCV6umFT4M2L+kW3+NTrHjur4Sp5E9W8y57w+ddlfvMYOsPEEAqphh/4c/hRH1RsTFVJA3ghpdu5qhnfdMA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyng7HwIuMUV8shCBN/68Q9eNxiIwPl8NDxK+k6xn7rjZeM2ZDt
	9e++L0w8/Vdi2Juyh0tAOGudDKEacc8PjuuXmUZKHoz60GAMBCuuDtNlmN7+E/pkOQDwKrEesKT
	uVpamhSkZus4piY7mksfiAGD2Sy6HjRpA/n4tWbXyMW0uF7n7KGYJUxBuXn7AwA0=
X-Received: by 2002:a05:600c:190e:b0:431:5465:8072 with SMTP id 5b1f17b1804b1-432b751f555mr231133135e9.31.1731516138766;
        Wed, 13 Nov 2024 08:42:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7U9v4QGbe+ZmeS+NXkcbAp5ztZHdnmCRT35fHTpfHCojjgfyFy84Cu66+WEexOLiE2YCK7A==
X-Received: by 2002:a05:600c:190e:b0:431:5465:8072 with SMTP id 5b1f17b1804b1-432b751f555mr231132705e9.31.1731516138387;
        Wed, 13 Nov 2024 08:42:18 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:1500:d584:7ad8:d3f7:5539? (p200300cbc7081500d5847ad8d3f75539.dip0.t-ipconnect.de. [2003:cb:c708:1500:d584:7ad8:d3f7:5539])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2c8csm30059935e9.6.2024.11.13.08.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 08:42:17 -0800 (PST)
Message-ID: <07ba2a86-f22b-43aa-a542-f1a182656b63@redhat.com>
Date: Wed, 13 Nov 2024 17:42:15 +0100
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
Subject: Re: [PATCH v5 0/7] mm/mprotect: Fix dax puds
To: Peter Xu <peterx@redhat.com>, Jann Horn <jannh@google.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Nicholas Piggin <npiggin@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 James Houghton <jthoughton@google.com>, Huang Ying <ying.huang@intel.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Rick P Edgecombe <rick.p.edgecombe@intel.com>,
 Hugh Dickins <hughd@google.com>, Borislav Petkov <bp@alien8.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Rik van Riel <riel@surriel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Mel Gorman <mgorman@techsingularity.net>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Jiang
 <dave.jiang@intel.com>, Oscar Salvador <osalvador@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20240812181225.1360970-1-peterx@redhat.com>
 <CAG48ez0NNph0Zp2aZ+c1T+U940CvwxcQ+jyEhp3KYZLSWPSrNw@mail.gmail.com>
 <ZzTWQqr-zFQz0HHY@x1n>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ZzTWQqr-zFQz0HHY@x1n>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0jDmgo5ojIYeJ_h3H5gOh5Oyz70nQNQDL9U5-Q1iRGk_1731516139
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 13.11.24 17:39, Peter Xu wrote:
> On Mon, Nov 11, 2024 at 10:20:59PM +0100, Jann Horn wrote:
>> On Mon, Aug 12, 2024 at 8:12 PM Peter Xu <peterx@redhat.com> wrote:
>>> Dax supports pud pages for a while, but mprotect on puds was missing since
>>> the start.  This series tries to fix that by providing pud handling in
>>> mprotect().  The goal is to add more types of pud mappings like hugetlb or
>>> pfnmaps.  This series paves way for it by fixing known pud entries.
>>
>> Do people actually use hardware where they can use PUD THP mappings
>> for DAX? I thought that was just some esoteric feature that isn't
>> actually usable on almost any system.
>> Was I wrong about that?
> 
> I did run it with a qemu emulated nvdimm device.  Though in reality I've no
> idea on how many people are using it..

I wonder if we still have to support it ... or could disable it+rip it out.

-- 
Cheers,

David / dhildenb


