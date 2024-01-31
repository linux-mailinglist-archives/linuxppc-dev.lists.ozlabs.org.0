Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 546C5843D0F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 11:43:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LdqKxetn;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NooHQiX3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPzDC1jhWz3cTX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 21:43:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LdqKxetn;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NooHQiX3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPzCS3Zzlz3bpp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 21:43:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706697792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SHlw8k+TqYX0IO/Wrb506XALAVZ388XuzsT+3MrGA+U=;
	b=LdqKxetnuc7W06qCR0uC850anyCtEWEpmkxqP/pF9HFIYpqHXrc+py8PIv2jJoULBAHmLP
	q1OFMqRtkFYeJ/NN4JILqEm2Ffk1jiKToQRMASdqT7O10dj39oGM9gZDdqC+CohpxZrrhK
	r6YM4cRDwzD5xTIAaGYN4UVwcbgNZlg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706697793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SHlw8k+TqYX0IO/Wrb506XALAVZ388XuzsT+3MrGA+U=;
	b=NooHQiX3h2f8V5YfVBQzeaoNYOq2FICADIXqEmKoQMjnGh0lVkJNCfsVy0nok6dAHZDxqv
	vI6flpcnvpBXkMjxFFbKy9Dy1UgvXMf1P2UtT8VttlK12bnwtUY/offkr8ZdN7LVlGdzm1
	Hpo+lP6EewtPLyhlZ2ozCF43Sr4j6+M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-xPzhn95POFSkHETPb88zIA-1; Wed, 31 Jan 2024 05:43:10 -0500
X-MC-Unique: xPzhn95POFSkHETPb88zIA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40e40126031so39214385e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 02:43:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706697790; x=1707302590;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHlw8k+TqYX0IO/Wrb506XALAVZ388XuzsT+3MrGA+U=;
        b=ewND78BkfK7F14DVEkb2BXspziMxF1HSyOE4ASfZISwBCbP1GrkU7zS13I04D+dQZ/
         tUOdfefwCGLAoyEy0pHPwUa0KnmWsgMJhMDHOWk0xONv/0W7yEBAEtgIYyhqNQ04Nlk1
         5Dg7i9otfxXgXbVVRHDDLkOB8Y8IqfXMeY0nRVL/SyuT+g5gtFI6Y/HP0wAt0thPkgQA
         OIz8eaSOZDTFPx45OpqVHTbQg5m7JkYUbiloAi01uUFVSLczwAQ0HJAE9JbReefCV4WR
         OhnaDCNX1KzQHnE+0vyOFKx2k0tYXf1kTKRUt52SxGEyjIlk48oogssJKC3hawJDfsPz
         MnAA==
X-Gm-Message-State: AOJu0Yxr4zie+OOUbPtrBRwALu39DxSqQR20q0hVuU8ybxw5pU/HHAFJ
	4j5S3POlJdbPPnTSN2Paw89Agl/cNdnFNHhrf4GAuzfWa+uUYHCvsnttXEVDBIQ3UZA6lsA0iZH
	BMWwucguV08pc+1c+gsSHP8dh07NqkuLtUhj7/MvilUBQm6nBTn2l5uqoIJLzvE8=
X-Received: by 2002:a05:600c:3b09:b0:40e:f693:94dc with SMTP id m9-20020a05600c3b0900b0040ef69394dcmr952907wms.11.1706697789727;
        Wed, 31 Jan 2024 02:43:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgo7ZkvZKUZr4U69FQrkPfyz/lh2lKintb7qLUXFgEQCuMxTc504c6nJpvameaJYiG+lMkUA==
X-Received: by 2002:a05:600c:3b09:b0:40e:f693:94dc with SMTP id m9-20020a05600c3b0900b0040ef69394dcmr952894wms.11.1706697789373;
        Wed, 31 Jan 2024 02:43:09 -0800 (PST)
Received: from [10.32.64.237] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 23-20020a05600c021700b0040efb8f7158sm1192334wmi.15.2024.01.31.02.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 02:43:09 -0800 (PST)
Message-ID: <3739b705-b7c7-4d1b-b97d-7e55b99f64f6@redhat.com>
Date: Wed, 31 Jan 2024 11:43:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/9] mm/memory: optimize unmap/zap with PTE-mapped THP
To: Yin Fengwei <fengwei.yin@intel.com>, linux-kernel@vger.kernel.org
References: <20240129143221.263763-1-david@redhat.com>
 <4ef64fd1-f605-4ddf-82e6-74b5e2c43892@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <4ef64fd1-f605-4ddf-82e6-74b5e2c43892@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Matthew Wilcox <willy@infradead.org>, "Huang, Ying" <ying.huang@intel.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Ryan Roberts <ryan.roberts@arm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, Nick Piggin <npiggin@gmail.com>, Sven Schnelle <svens@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 31.01.24 03:20, Yin Fengwei wrote:
> On 1/29/24 22:32, David Hildenbrand wrote:
>> This series is based on [1] and must be applied on top of it.
>> Similar to what we did with fork(), let's implement PTE batching
>> during unmap/zap when processing PTE-mapped THPs.
>>
>> We collect consecutive PTEs that map consecutive pages of the same large
>> folio, making sure that the other PTE bits are compatible, and (a) adjust
>> the refcount only once per batch, (b) call rmap handling functions only
>> once per batch, (c) perform batch PTE setting/updates and (d) perform TLB
>> entry removal once per batch.
>>
>> Ryan was previously working on this in the context of cont-pte for
>> arm64, int latest iteration [2] with a focus on arm6 with cont-pte only.
>> This series implements the optimization for all architectures, independent
>> of such PTE bits, teaches MMU gather/TLB code to be fully aware of such
>> large-folio-pages batches as well, and amkes use of our new rmap batching
>> function when removing the rmap.
>>
>> To achieve that, we have to enlighten MMU gather / page freeing code
>> (i.e., everything that consumes encoded_page) to process unmapping
>> of consecutive pages that all belong to the same large folio. I'm being
>> very careful to not degrade order-0 performance, and it looks like I
>> managed to achieve that.
> 
> One possible scenario:
> If all the folio is 2M size folio, then one full batch could hold 510M memory.
> Is it too much regarding one full batch before just can hold (2M - 4096 * 2)
> memory?

Good point, we do have CONFIG_INIT_ON_FREE_DEFAULT_ON. I don't remember 
if init_on_free or init_on_alloc was used in production systems. In 
tlb_batch_pages_flush(), there is a cond_resched() to limit the number 
of entries we process.

So if that is actually problematic, we'd run into a soft-lockup and need 
another cond_resched() [I have some faint recollection that people are 
working on removing cond_resched() completely].

One could do some counting in free_pages_and_swap_cache() (where we 
iterate all entries already) and insert cond_resched+release_pages() for 
every (e.g., 512) pages.

-- 
Cheers,

David / dhildenb

