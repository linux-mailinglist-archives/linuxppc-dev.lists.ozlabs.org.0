Return-Path: <linuxppc-dev+bounces-12078-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E0DB54E3A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 14:41:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNYvB4q0mz3dBm;
	Fri, 12 Sep 2025 22:41:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757680870;
	cv=none; b=Xs5ghUp44uT0tSw3xq8YVEin94QeCempbMiFtY9J9/kDoPNNHux7fbFS9084J87FVKk0wVgeRke7UtZGd9o2nrE6CNOIcpk7xQ4k+gtE+nDr0i+L+f1YOS5dojcbhowN7sDB7QZvVXXxrERELttpZDEZvmhofGlPJNCuNgVD+cuUNOQEoioynEBPFe8SJIWEb6/nF/wYVljQXF5NX8ThZZeSjHv6jN/speaV9TMXQjiF7EU/LQ7V0Z6Vj15KsdvlEAzdX2pcepeTvqYM3PcabpFi+epKF02uKL0m6h2OUaVp78rC7qHDE46yxFhDXcRYbnB7LzzccFmFYvNFuExDsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757680870; c=relaxed/relaxed;
	bh=iMoIwx8Fq7mQjvBVlaYyQNpQMDf4JO+RcpWFZz45CMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PrF4588eGuir5SUuhvIHRlUHxunxMgd7TE1xXfJFylWxfY6QHv3xKlCh8OR4yqZ7Ocq1CL1U/q12yI4EuDoZTCrgcMLDi7GCeipUnQ3uKHzuDsVk9le97m/LowgiYhTzTSiClBfTNImVc0gE2Y1JyM4KfT87Ut8ea6wab8LcmJV7m9MIm5ZhPuShBMqSxHGP4O0HE5nGwv64XqefFmF4934t0pO4kfau9AVsoi2Oe2Dt9uKob3PomoOeARJ+zxnT1XJDa6s7x146lq3uRYRC97gWRJmj6ogO+CdnA0pM9er7WCv7xAVpLJ3pto+F7XJ+ZAnAoXmy+mmuRMvs6DJdYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L3x7sOxX; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L3x7sOxX; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L3x7sOxX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L3x7sOxX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNYv63MDzz3dBZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 22:41:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757680861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iMoIwx8Fq7mQjvBVlaYyQNpQMDf4JO+RcpWFZz45CMg=;
	b=L3x7sOxXeoX4Ez1i9TUHu1NQVTocckaO6l3LdUWbess1psN78SxuRICFrMLvk1MX4LvsCj
	5VDT6L1/v9sALGwup8sMcrcyvzGqckgtKN4cHQXHnojVgogbuRySCGdNhRKIb+hVdE60G2
	N2uFfrfl4cS0q1j1FEomBc1Hc/LSs9Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757680861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iMoIwx8Fq7mQjvBVlaYyQNpQMDf4JO+RcpWFZz45CMg=;
	b=L3x7sOxXeoX4Ez1i9TUHu1NQVTocckaO6l3LdUWbess1psN78SxuRICFrMLvk1MX4LvsCj
	5VDT6L1/v9sALGwup8sMcrcyvzGqckgtKN4cHQXHnojVgogbuRySCGdNhRKIb+hVdE60G2
	N2uFfrfl4cS0q1j1FEomBc1Hc/LSs9Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-7E6cCyZFPh2kIUs6rXkwNQ-1; Fri, 12 Sep 2025 08:41:00 -0400
X-MC-Unique: 7E6cCyZFPh2kIUs6rXkwNQ-1
X-Mimecast-MFC-AGG-ID: 7E6cCyZFPh2kIUs6rXkwNQ_1757680859
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45dd62a0dd2so8808755e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 05:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757680859; x=1758285659;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iMoIwx8Fq7mQjvBVlaYyQNpQMDf4JO+RcpWFZz45CMg=;
        b=LzsyE0ZNSz9gCBY9xGbsZSTw/l0tTTJD/O75sDT3ktxGrQvW0I8zicMNCh5iaCkBZK
         YWgu3sKDKB3kO9oLMX+0Dxzn96F/wM7P+XJI/B1Frlmuq0cKTmklL1DA+pDn6t9pF9mH
         rknN5tr9ufbK7Woay9xYK2lwusy100g1V8QYvTsWMmP1jlJpm8f8au31/5S/TBMvrmiI
         rw/107GdcBOSZ+mgly9tZHArmIljdBzU1sgE9xkHOFT0Y5K7B4SWDWTA2YKPy6I0Pqrr
         v3JJGVgJyMc3oLYJjCrKwvFwgPPfzsehG1zcNkRK1cNzHdCCA+e4BSa+eJj9Deg8FLaV
         /V8g==
X-Forwarded-Encrypted: i=1; AJvYcCWfBqCzb97bfwUgbKPnXEG0nfs7JuY9wfztSw1DIO0IToP+dY8YKCVDSLIqcDren0gg6fYO/6hjpwAvsro=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwXDDpIvbiwuK53mfUybvYZLPTL8UnIu7BXd5P3nsb9cDrajVnx
	9S4IWkVXJlG4ghRJ3hHqw4oJsBr3BpI4Kd89SpFwIMkcUpHC5r5pTTBCnesy+6YtLSXgpyIjh2x
	m8pFg/WihoZbohm0YRV2/g05rpEdwaYUNFr9j3V63xF87CEN8jUxTZ9SufeSMiLjwW1A=
X-Gm-Gg: ASbGncvlGXu+vgBMI5uw3ERATRe2WsE/JnqEbxNvbvAioWY0uTBt/WGOLaVJElGzLhU
	42RTCga4bTv8mo8OvZLsuzGkYxtkUYg59cl3wnxVKye9rW51jn5ePQ1x84Z203rOHI/6khvRITj
	8n+AwCW3iC2hNKBg5BYOVAWZPD2fOOEO1t63SqIgd8veLhJtaau18gSi5+gvP1hLgSj0hl86rvl
	qnPd+dfFtT5i1F1XSRLSJu9jzDvS587It8+ynxFBmsG4+kJr+q3XjX6skmVNNoUh5LWujo8M+89
	kpAOocVdKwdt4Ib9vfXurd626V0D36NCMtMgwYqYbVm2bl4p57UdNjHKqMmBF1otIjR9dLWeVE1
	ztXJZggtAfk2ocuvWoTCiHrmmiD/WNjA+kDg4qpTkzCvP7hl9e6im/J3boIVFWCyiG1o=
X-Received: by 2002:a05:600c:1daa:b0:459:d577:bd24 with SMTP id 5b1f17b1804b1-45ed647a10cmr35610125e9.7.1757680859001;
        Fri, 12 Sep 2025 05:40:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVEThTm8r9XP8uPlz9qkFfWXl+PlwCvx30XVhJYO0zMEAs87UYsFy+ktNpyiVcKL2vVNFxRw==
X-Received: by 2002:a05:600c:1daa:b0:459:d577:bd24 with SMTP id 5b1f17b1804b1-45ed647a10cmr35609685e9.7.1757680858542;
        Fri, 12 Sep 2025 05:40:58 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f20:da00:b70a:d502:3b51:1f2d? (p200300d82f20da00b70ad5023b511f2d.dip0.t-ipconnect.de. [2003:d8:2f20:da00:b70a:d502:3b51:1f2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0372ae57sm60050545e9.8.2025.09.12.05.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 05:40:58 -0700 (PDT)
Message-ID: <74d1f275-23c3-4fd8-b665-503c7fc87df0@redhat.com>
Date: Fri, 12 Sep 2025 14:40:55 +0200
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
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mark Rutland <Mark.Rutland@arm.com>
References: <47ee1df7-1602-4200-af94-475f84ca8d80@arm.com>
 <29383ee2-d6d6-4435-9052-d75a263a5c45@redhat.com>
 <9de08024-adfc-421b-8799-62653468cf63@arm.com>
 <ef343405-c394-4763-a79f-21381f217b6c@redhat.com>
 <4b4971fd-0445-4d86-8f3a-6ba3d68d15b7@arm.com>
 <4aa28016-5678-4c66-8104-8dcc3fa2f5ce@redhat.com>
 <15d01c8b-5475-442e-9df5-ca37b0d5dc04@arm.com>
 <7953a735-6129-4d22-be65-ce736630d539@redhat.com>
 <781a6450-1c0b-4603-91cf-49f16cd78c28@arm.com>
 <a17ab4e3-627a-4989-a5a5-d430eadabb86@redhat.com>
 <9ed5441f-cc03-472a-adc6-b9d3ad525664-agordeev@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <9ed5441f-cc03-472a-adc6-b9d3ad525664-agordeev@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tNrFF_X1skr9Z02N7b5KQ34ue3MdUBYbrOgF8RwvCUU_1757680859
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12.09.25 14:37, Alexander Gordeev wrote:
> On Fri, Sep 12, 2025 at 10:55:50AM +0200, David Hildenbrand wrote:
> 
> Hi David, Kevin,
> 
>> Great, looking forward to seeing this all getting cleaned up and done
>> properly for good.
> 
> I am currently working on lazy mmu for s390 and this nesting
> initiative kind of interferres. Well, in fact it looks like
> it does not, but I am bit lost in last couple of iterations ;)
> 
> The prerequisite for s390 would be something like the change
> below. With that change I can store the context in a per-cpu
> structure and use it later in arch-specific ptep_* primitives.
> 
> Moreover, with a further (experimental) rework we could use
> a custom kasan sanitizer to spot false directly compiled
> PTE accesses, as opposed to set_pte()/ptep_get() accessors.
> 
> I am not quite sure see whether this could be derailed by
> the new lazy mmu API. At least I do not immediately see any
> obvious problem. But may be you do?

It would just be passing more context down to the architecture, right?

-- 
Cheers

David / dhildenb


