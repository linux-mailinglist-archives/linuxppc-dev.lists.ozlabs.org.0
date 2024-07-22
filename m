Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 577D8938FEC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 15:30:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fLCwrejS;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rk+mU8G4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSLkf28Blz3cY8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 23:30:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fLCwrejS;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rk+mU8G4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSLjx4k2lz3bnt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2024 23:29:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721654989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hj0518Q+ag2Y9NZVcsCpncBBpD7wr8EEpXH9Btxb4Io=;
	b=fLCwrejSGd8EwhkzncuiF35/KqnR0ZoEGsXcooJjWf5WqReaxZInyvko+EUbWp84GIF20a
	BJKDv073G8lciS/AQBNKxLjcg/Ywc683jBcXpyBuAFr+sq0NzWXMSh3yHtUZkCpPVMPjBg
	8MxlZGuAokjukKCMmd+zT6bFevsNbDM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721654990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hj0518Q+ag2Y9NZVcsCpncBBpD7wr8EEpXH9Btxb4Io=;
	b=Rk+mU8G4ZLlvCsSpuiXkvY4X5MSTXJLKNpRZ5oJu7IqcQtS0HrLgSQ08aXin1i2qQoiIN9
	bG+egQOyj+JtoxO9+vGwL4pwcXQBcNBHI8CkFJ2TvUVq9heoDjrKRWeLJNq8A/MfSEQr4Z
	SaU0HF4dh5OTGb/b3+sYN+7MUu0bk8A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-Qm5_QsqNPRahmNsVsh6luw-1; Mon, 22 Jul 2024 09:29:46 -0400
X-MC-Unique: Qm5_QsqNPRahmNsVsh6luw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42668796626so32911755e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2024 06:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721654985; x=1722259785;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hj0518Q+ag2Y9NZVcsCpncBBpD7wr8EEpXH9Btxb4Io=;
        b=o9zZldrPFPn7mHXmHsoLpd3RlXBAtQM+ndSNToj4d3FWQ8CLR1EFhkSl62uQQWDRBn
         yqpB39zgyF04Xi5gEX6mnO4zFAaBWg6s63889x9LAzAAmh7+JVyyYt7ll5n+7X5zWu+z
         o9vZmpHWKeltQIEZmYCu+boAgO/QzJk9mwpsF0UqWKGXa2oDpeqoaKUyg8Y3zXFEBXNE
         vne4sV8BI86RIqlm1KpdoDeHXsXW7ICRaWvbCcvVyjpxa1DV1A5lt7nVFJQyMajz//PU
         KUEsivFkrl+MJBszszbyxCK8kBUHMXDN7nZLe2wJZWFLP0+qo8IKcjmknICgqIzHph+2
         LT1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfRkrZvm2o2+LCMfe2VJC9ZncaBb75XQff6v0HTqA39flQzaNRFQQpWnk32y/x96iSbteTV1pqsb4cRV+TbIvsbqTLmOEPyAtIZRkVQg==
X-Gm-Message-State: AOJu0YxjQXXyi1lagPHU3QFepxap7R45Ve8zPylO5jECyadzdIkOnXrk
	IKoqHPlgZVxUGWfnjwYerS6ViC3O/DCGy0s+SfMy51jdsqdvbCZMfjkbcton8EWKOGntoCgSD43
	jp+jMHF8RSNeEUyIvh7GSa/Y9q0u1xlRdvQYpTHfqBoRj/yQ32S06YcEDSK6Ad2I=
X-Received: by 2002:a05:600c:a4c:b0:426:6389:94c4 with SMTP id 5b1f17b1804b1-427ea1d5a2dmr9070995e9.37.1721654985332;
        Mon, 22 Jul 2024 06:29:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIyw9dA2YYXh0wR+3Pj025bxjyvTGi6gFSINBbowgn9GBPFQbhi8MNgjqnWB9eXV6rnCmpfg==
X-Received: by 2002:a05:600c:a4c:b0:426:6389:94c4 with SMTP id 5b1f17b1804b1-427ea1d5a2dmr9070715e9.37.1721654984893;
        Mon, 22 Jul 2024 06:29:44 -0700 (PDT)
Received: from ?IPV6:2003:cb:c727:7000:c050:e303:f8a7:6ed9? (p200300cbc7277000c050e303f8a76ed9.dip0.t-ipconnect.de. [2003:cb:c727:7000:c050:e303:f8a7:6ed9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6900caasm126895385e9.11.2024.07.22.06.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 06:29:44 -0700 (PDT)
Message-ID: <cf36725d-c197-4c07-8998-d34711335fdb@redhat.com>
Date: Mon, 22 Jul 2024 15:29:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/6] mm: THP-agnostic refactor on huge mappings
To: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20240717220219.3743374-1-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240717220219.3743374-1-peterx@redhat.com>
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
Cc: linux-s390@vger.kernel.org, Alistair Popple <apopple@nvidia.com>, Ryan Roberts <ryan.roberts@arm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18.07.24 00:02, Peter Xu wrote:
> This is an RFC series, so not yet for merging.  Please don't be scared by
> the code changes: most of them are code movements only.
> 
> This series is based on the dax mprotect fix series here (while that one is
> based on mm-unstable):
> 
>    [PATCH v3 0/8] mm/mprotect: Fix dax puds
>    https://lore.kernel.org/r/20240715192142.3241557-1-peterx@redhat.com
> 
> Overview
> ========
> 
> This series doesn't provide any feature change.  The only goal of this
> series is to start decoupling two ideas: "THP" and "huge mapping".  We
> already started with having PGTABLE_HAS_HUGE_LEAVES config option, and this
> one extends that idea into the code.
> 
> The issue is that we have so many functions that only compile with
> CONFIG_THP=on, even though they're about huge mappings, and huge mapping is
> a pretty common concept, which can apply to many things besides THPs
> nowadays.  The major THP file is mm/huge_memory.c as of now.
> 
> The first example of such huge mapping users will be hugetlb.  We lived
> until now with no problem simply because Linux almost duplicated all the
> logics there in the "THP" files into hugetlb APIs.  If we want to get rid
> of hugetlb specific APIs and paths, this _might_ be the first thing we want
> to do, because we want to be able to e.g., zapping a hugetlb pmd entry even
> if !CONFIG_THP.
> 
> Then consider other things like dax / pfnmaps.  Dax can depend on THP, then
> it'll naturally be able to use pmd/pud helpers, that's okay.  However is it
> a must?  Do we also want to have every new pmd/pud mappings in the future
> to depend on THP (like PFNMAP)?  My answer is no, but I'm open to opinions.
> 
> If anyone agrees with me that "huge mapping" (aka, PMD/PUD mappings that
> are larger than PAGE_SIZE) is a more generic concept than THP, then I think
> at some point we need to move the generic code out of THP code into a
> common code base.
> 
> This is what this series does as a start.

Hi Peter!

 From a quick glimpse, patch #1-#4 do make sense independent of patch #5.

I am not so sure about all of the code movement in patch #5. If large 
folios are the future, then likely huge_memory.c should simply be the 
home for all that logic.

Maybe the goal should better be to compile huge_memory.c not only for 
THP, but also for other use cases that require that logic, and fence off 
all THP specific stuff using #ifdef?

Not sure, though. But a lot of this code movements/churn might be avoidable.

-- 
Cheers,

David / dhildenb

