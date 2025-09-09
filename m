Return-Path: <linuxppc-dev+bounces-11943-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD24B4A9A6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 12:10:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLfh65R6Sz3cYr;
	Tue,  9 Sep 2025 20:09:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757412598;
	cv=none; b=mj80JRd00MXiEcx/10IxqS+sBRV+h8DuxfCwbcUYLyqZRSK7qycV3aHIpDUxFHxh/oeSd65L1aJAw+a1H+VuZVHowRE5tTXLZlpm9rWP4XkQa3bAAuxU1ISihpCizM2oVOa1iPq+Ymc5tZdt4RhLgm+uA19pSC+68A9I0AX3hPsbgsi9aOOx6dYFzf5yhQdUTU12pJtSl7jAyRPU5hfGXEjLjXPp9jBM1V0ge9dHIw4XdHa+h3uTWT2tVpjx+LLLxJRQdHtmGlsqyawSPrZqWkjZhRw9blP6d4W29yllPlTN58c2fXvLo8WgrGY3Czu2RZuIRns0+evcfMi4ZAhgSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757412598; c=relaxed/relaxed;
	bh=LqU+WGzmfGncFG5qyai0jHYVSP7TCxKOV9AhHT2zCnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wp7RDYdMd2euLv84lbp2lNl18z8Fv5tHJ6xaWFkBunMFLA65VWxbcf9gW3Bd0M9UA+W6M7LGodPaKHEwCPWzh259vOL2b6Kq5bUKte6oEwARDpriVCqQqy8/ReU1qDwbC4PF1+Ifw35xFQzJA7ILsfaTXavNu40+FLo+qSQBkk9CsbEUT5shhjN9aWc7EgFeCiAIk/SGtV658F5RgbYpRPQEHQ5r0Vn4Y7f62K30cz0YMxnNJK3d4m+gZJYz9i8P9V0M2xRy9h6vM83ZYgMcutqKhtdS1aWsXPJ6LradAyJ+e22zOqGxhD/K4LWZJxO6L3b079DIIKoOVSJ979ogBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EIH2P8zI; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EIH2P8zI; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EIH2P8zI;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EIH2P8zI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLfh551Zhz3cYV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 20:09:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757412594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LqU+WGzmfGncFG5qyai0jHYVSP7TCxKOV9AhHT2zCnc=;
	b=EIH2P8zIcZYkDaCMrxLDGWHfPHP777hlvuk4rjzrd3EWHy82xAVFawnQA0eQ11KfPTUQIw
	mfMilZyTB/IPyohu6Inx1nvoomsXwhxl1TwV8jO+qcFWtUu16n9q54WBAzd+YUCW37T5WO
	MDo4/NDu6ELr7/8Lah8RGtOioePKBS0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757412594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LqU+WGzmfGncFG5qyai0jHYVSP7TCxKOV9AhHT2zCnc=;
	b=EIH2P8zIcZYkDaCMrxLDGWHfPHP777hlvuk4rjzrd3EWHy82xAVFawnQA0eQ11KfPTUQIw
	mfMilZyTB/IPyohu6Inx1nvoomsXwhxl1TwV8jO+qcFWtUu16n9q54WBAzd+YUCW37T5WO
	MDo4/NDu6ELr7/8Lah8RGtOioePKBS0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-_vfteTqfPQKN4KHLUrMxSg-1; Tue, 09 Sep 2025 06:09:53 -0400
X-MC-Unique: _vfteTqfPQKN4KHLUrMxSg-1
X-Mimecast-MFC-AGG-ID: _vfteTqfPQKN4KHLUrMxSg_1757412592
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3d3d2472b92so3078896f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Sep 2025 03:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412592; x=1758017392;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqU+WGzmfGncFG5qyai0jHYVSP7TCxKOV9AhHT2zCnc=;
        b=XJ60KIYqp93DgFEoMBlXoDTgg2bHb4wR0+fcXk3ANxesb1SBfvgysclj7tF+Nwznl0
         FIvTL9bubcGgEQnq3G2cUlZaUg5HcNGJvB5KU9XqVcG68Np+qvLrcDexI94/wd9OjePu
         fJ7e/0BY7bNHLWaELvEmxOLssLGyZM8Y9qGLKXnFBsEGPDXYoxLdgeT3qaDPExNd+4sP
         IBpS8Z6tw06eyI/Fw5pjp3acjzBhIxp7TrBCTySn8bbHOqDub/EeYCx0eiRdoID/e1bA
         obLxQNmG01WFUk94oYm+Lb0SkfsyvzPOdL9uzmOUm9cxuR5rasOh+CYOCllskXZ+lJVe
         6AOA==
X-Forwarded-Encrypted: i=1; AJvYcCVzBuZlk6f/RiAAdgJZvMaWESzaHk43PHDbZi7ORRgFcZJ44t5dYn2cWI+pW6/Z+mBufqx+CYnvnRC+znc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyQUiDlwdmDOek0yHn+idw77rrMScCrBO5a/pvysu+iBIlALPdv
	1cghe/Nm5UVInE81K+GwY1LwSSWidhOvDm/DVaIuaUSXsTecH6vZEnpwUuYfEcExUU/EOJiwyO5
	bL5P5lkf2yDnmof282IdCx0yJCsv4b1Lxt8dCx1skh1UQQjv5g4e/lP7Dt7wgTlrXBAM=
X-Gm-Gg: ASbGncvBTWA7GyAkZv8Jl+LDz8Y1Q7lCuiFs85UkW+d/1ext5e7UQik2LTAQfmaopyb
	41TY4yLUq9N8BwuOH0o+4bXcZ6WqWtJ/yFcaWSLpEft6hwwYq0DWKG/Uoq0zP2800XQfb5DiwYV
	uXOCmW0BGdvnb3X0wlV2wD2DEu/w3rQu3wxiVEA3TpPI9ppbK4+riFu6cE/moY+Q0sNYvWWa1FZ
	gQGM5Q+wVdLirNeMGoFDHFXaR08AVLGohsLSmaSgMhLYDac52KsHQy3qOJfpq3THtP7ayHTugrD
	FxNaXUXsk+XT7Y/MawX4AGlLjXqjA0143moMxS5BMciDP/mMGZMmNXzNhQ0L3T0+zF3+BgkRHgM
	lQxc7xvF0VZ07tut/QXX8cUktVNawHXKATcIJbJzeZyr5ZacPJHVL/5U1Tck7yNkEHuc=
X-Received: by 2002:adf:8b1b:0:b0:3e6:b06c:5b2b with SMTP id ffacd0b85a97d-3e6b06c5fe0mr6424804f8f.10.1757412591667;
        Tue, 09 Sep 2025 03:09:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+6kYqxQMhMlrUNgHhh5IEpwCukAjnB2iBRVYizcIa9qqydeyLJ0L3jlngBNKljI3RpH7CHw==
X-Received: by 2002:adf:8b1b:0:b0:3e6:b06c:5b2b with SMTP id ffacd0b85a97d-3e6b06c5fe0mr6424776f8f.10.1757412591141;
        Tue, 09 Sep 2025 03:09:51 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34? (p200300d82f239c00d1f6f7fe8f147e34.dip0.t-ipconnect.de. [2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7522562d1sm1945921f8f.63.2025.09.09.03.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 03:09:50 -0700 (PDT)
Message-ID: <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
Date: Tue, 9 Sep 2025 12:09:48 +0200
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vUk7ZjzId-ZLB9xRbWC6wzZjKhDIpEMd6sRriBt8nfs_1757412592
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 09.09.25 11:40, Alexander Gordeev wrote:
> On Tue, Sep 09, 2025 at 11:07:36AM +0200, David Hildenbrand wrote:
>> On 08.09.25 09:39, Kevin Brodsky wrote:
>>> arch_{enter,leave}_lazy_mmu_mode() currently have a stateless API
>>> (taking and returning no value). This is proving problematic in
>>> situations where leave() needs to restore some context back to its
>>> original state (before enter() was called). In particular, this
>>> makes it difficult to support the nesting of lazy_mmu sections -
>>> leave() does not know whether the matching enter() call occurred
>>> while lazy_mmu was already enabled, and whether to disable it or
>>> not.
>>>
>>> This patch gives all architectures the chance to store local state
>>> while inside a lazy_mmu section by making enter() return some value,
>>> storing it in a local variable, and having leave() take that value.
>>> That value is typed lazy_mmu_state_t - each architecture defining
>>> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is free to define it as it sees fit.
>>> For now we define it as int everywhere, which is sufficient to
>>> support nesting.
> ...
>>> {
>>> + lazy_mmu_state_t lazy_mmu_state;
>>> ...
>>> - arch_enter_lazy_mmu_mode();
>>> + lazy_mmu_state = arch_enter_lazy_mmu_mode();
>>> ...
>>> - arch_leave_lazy_mmu_mode();
>>> + arch_leave_lazy_mmu_mode(lazy_mmu_state);
>>> ...
>>> }
>>>
>>> * In a few cases (e.g. xen_flush_lazy_mmu()), a function knows that
>>>     lazy_mmu is already enabled, and it temporarily disables it by
>>>     calling leave() and then enter() again. Here we want to ensure
>>>     that any operation between the leave() and enter() calls is
>>>     completed immediately; for that reason we pass LAZY_MMU_DEFAULT to
>>>     leave() to fully disable lazy_mmu. enter() will then re-enable it
>>>     - this achieves the expected behaviour, whether nesting occurred
>>>     before that function was called or not.
>>>
>>> Note: it is difficult to provide a default definition of
>>> lazy_mmu_state_t for architectures implementing lazy_mmu, because
>>> that definition would need to be available in
>>> arch/x86/include/asm/paravirt_types.h and adding a new generic
>>>    #include there is very tricky due to the existing header soup.
>>
>> Yeah, I was wondering about exactly that.
>>
>> In particular because LAZY_MMU_DEFAULT etc resides somewehere compeltely
>> different.
>>
>> Which raises the question: is using a new type really of any benefit here?
>>
>> Can't we just use an "enum lazy_mmu_state" and call it a day?
> 
> I could envision something completely different for this type on s390,
> e.g. a pointer to a per-cpu structure. So I would really ask to stick
> with the current approach.

Would that integrate well with LAZY_MMU_DEFAULT etc?

-- 
Cheers

David / dhildenb


