Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA42F88E9B7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:48:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SBY91gqt;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SBY91gqt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4WKf4cdjz3vql
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:48:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SBY91gqt;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SBY91gqt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4WJw1gpkz3bq0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:47:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711554461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nx2RBcEO1zlkXSO8aDJi6Uao1EiV9BqGUI/e60nrr6c=;
	b=SBY91gqtVcFUzzi4TSoCzeGe9vmp0v24ukKZfzJt7wOw1zr/PfIBXYy9RUizIS09ggbs3a
	MkVQfC6QTbV3ZUYN7NYQrK+73TU/RXejokfPRtFk0Rk9arlFsQlHfJfFpXTf02LeGM96FV
	u1a2BhFKKDJrTeLC1ny8ABALMy3802w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711554461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nx2RBcEO1zlkXSO8aDJi6Uao1EiV9BqGUI/e60nrr6c=;
	b=SBY91gqtVcFUzzi4TSoCzeGe9vmp0v24ukKZfzJt7wOw1zr/PfIBXYy9RUizIS09ggbs3a
	MkVQfC6QTbV3ZUYN7NYQrK+73TU/RXejokfPRtFk0Rk9arlFsQlHfJfFpXTf02LeGM96FV
	u1a2BhFKKDJrTeLC1ny8ABALMy3802w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-dZD1kHdUMTKJx1cxZoNSQQ-1; Wed, 27 Mar 2024 11:47:39 -0400
X-MC-Unique: dZD1kHdUMTKJx1cxZoNSQQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40e435a606aso37278915e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 08:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711554458; x=1712159258;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nx2RBcEO1zlkXSO8aDJi6Uao1EiV9BqGUI/e60nrr6c=;
        b=bM1k8hW0ZZHhL95pOoy7gaUNly3pr7ssGJs4a69D9hfDL1pwe/Mq3cTjvGXws5bATA
         v1Fonus0PXRLTdHa/ULTj2XF26yU01VlcDoExMIlCeEyrGSMJt8hUbipMb7WX4jLMMCd
         l5hT7JREAUUvdOlI1Lhnns9TRIAiR4nlKkSCk02EGHhz2LXp5+QF53LqzZwx33Pb02ha
         PbL1Rp3adrTiNRQTsruQAljnmbFHdvohs3pSei5nJXRY+XxoriRAdi3lYG3WXbA/h+yR
         3G8LEdqz46I9DtnHC/UlHcVE52ycZtMIiAMUuT9zrFLaAEM6tAA8oa0UsqtABK8NEZ4G
         YabQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/AcVC7Lq6N8IKXJXQ7Waqc7P+UMZwR0/7PA3eYLPup4eUvMnbuXQXVJgy2ZX+k6kS9zXZChOCFgt9xOjqEYEJsoY4AMobcgWyNHxZzg==
X-Gm-Message-State: AOJu0YyXnlq6QiQMKVLLo0QoSMNEFCKn5vZNWck3eSsyFOOy7RZS4GGp
	BkxqaXfwW6z7Jktti+T1riMQwKK/oVY6EV72ncL3JYTMwMvTXMINzPfEYGCYE5w23W8+1hUVUA+
	VcQ9LCJ27mGdlJ38sBBHqm0Rd4MIx4L7vyEeKQHAama2fz2tKoG72aHmSyIKJy0g=
X-Received: by 2002:a05:600c:524d:b0:414:8c04:23d7 with SMTP id fc13-20020a05600c524d00b004148c0423d7mr351314wmb.12.1711554458564;
        Wed, 27 Mar 2024 08:47:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMMNr9uPGzoqufs3UzwsuyIJrM6qX29FP7ICBLhhHmRIezXNRoAaLgs2liyRBDuZ/By57oYw==
X-Received: by 2002:a05:600c:524d:b0:414:8c04:23d7 with SMTP id fc13-20020a05600c524d00b004148c0423d7mr351286wmb.12.1711554458105;
        Wed, 27 Mar 2024 08:47:38 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:8a00:362b:7e34:a3bc:9ddf? (p200300cbc7088a00362b7e34a3bc9ddf.dip0.t-ipconnect.de. [2003:cb:c708:8a00:362b:7e34:a3bc:9ddf])
        by smtp.gmail.com with ESMTPSA id m31-20020a05600c3b1f00b004146bcdde06sm2534359wms.6.2024.03.27.08.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 08:47:37 -0700 (PDT)
Message-ID: <7f9fd647-dd0a-4be0-9e3b-3f0fe5f479cc@redhat.com>
Date: Wed, 27 Mar 2024 16:47:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] mm/gup: consistently call it GUP-fast
To: Ryan Roberts <ryan.roberts@arm.com>, Peter Xu <peterx@redhat.com>
References: <20240327130538.680256-1-david@redhat.com> <ZgQ5hNltQ2DHQXps@x1n>
 <3922460a-4d01-4ecb-b8c5-7c57fd46f3fd@redhat.com>
 <8727a618-30c4-4a13-b0e9-eccc3fd67c73@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8727a618-30c4-4a13-b0e9-eccc3fd67c73@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-s390@vger.kernel.org, loongarch@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27.03.24 16:46, Ryan Roberts wrote:
>>
>> Some of them look like mm-unstable issue, For example, arm64 fails with
>>
>>    CC      arch/arm64/mm/extable.o
>> In file included from ./include/linux/hugetlb.h:828,
>>                   from security/commoncap.c:19:
>> ./arch/arm64/include/asm/hugetlb.h:25:34: error: redefinition of
>> 'arch_clear_hugetlb_flags'
>>     25 | #define arch_clear_hugetlb_flags arch_clear_hugetlb_flags
>>        |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/hugetlb.h:840:20: note: in expansion of macro
>> 'arch_clear_hugetlb_flags'
>>    840 | static inline void arch_clear_hugetlb_flags(struct folio *folio) { }
>>        |                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./arch/arm64/include/asm/hugetlb.h:21:20: note: previous definition of
>> 'arch_clear_hugetlb_flags' with t
>> ype 'void(struct folio *)'
>>     21 | static inline void arch_clear_hugetlb_flags(struct folio *folio)
>>        |                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from ./include/linux/hugetlb.h:828,
>>                   from mm/filemap.c:37:
>> ./arch/arm64/include/asm/hugetlb.h:25:34: error: redefinition of
>> 'arch_clear_hugetlb_flags'
>>     25 | #define arch_clear_hugetlb_flags arch_clear_hugetlb_flags
>>        |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/hugetlb.h:840:20: note: in expansion of macro
>> 'arch_clear_hugetlb_flags'
>>    840 | static inline void arch_clear_hugetlb_flags(struct folio *folio) { }
>>        |                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./arch/arm64/include/asm/hugetlb.h:21:20: note: previous definition of
>> 'arch_clear_hugetlb_flags' with type 'void(struct folio *)'
>>     21 | static inline void arch_clear_hugetlb_flags(struct folio *folio)
> 
> see: https://lore.kernel.org/linux-mm/ZgQvNKGdlDkwhQEX@casper.infradead.org/
> 

Yes, besides the other failures I see (odd targets), I was expecting 
that someone else noticed that already :) thanks!

-- 
Cheers,

David / dhildenb

