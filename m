Return-Path: <linuxppc-dev+bounces-11970-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EECECB4FF65
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 16:29:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLmQx296gz30FR;
	Wed, 10 Sep 2025 00:28:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757428137;
	cv=none; b=b9moyRmnut+P5B+++ogJDBI2ZwupYGm2CZglHVmoAD2nuc6N7WoF/Iz5IGR5TDxmoW5kb67sJH8MlcrbIe3z+QdwLF073epKNZH8WZQdL+6lL5vn4CAcaZSqufcv0C73+iYhQCKv8DR+FFIE9zF2DMKDLwwmZ93FsNbk79D+knx7pi9n+YdXgOocm4vQwTMVf90JDzQ6LDOQaRzDQo0H5yrY2+XQIHf7fgMylSMeycUHLbfAdotKMaNKJ5/rBGEQYzQ/MeKYlHCw6rcHdk9Qu/MzF8mCR0F5YY0lnjhz/O7sKE3Bj1W8lIo/C7VYzJfD+wPL74QpOCIHzyqGmT2ekA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757428137; c=relaxed/relaxed;
	bh=D4QRi7hDsi9OF+uq4PfR985/VTCgDFYnf6cObBRAB+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GL9YozdLgVL+coEqoyiUsnUPlsuU4x4Uyy1njAgFVRQQr6ooPWbOm9rzhtD8/ho6zycvaYGfk3a8uHLT+Wg1Sfdq72exNPiBI3BB3zxvKfU8vXFolg1TYQVh/cg2b8eEh3u9bj6YFLdxUec9ZBlqAXSEmuMIOpe98TVMPRoomJ0/jZxjKDzi0AvCN+InMsurE6vYyfXvgUb5PgnKGN0VGkVtYQO2Gt8MztsOaUd2UzhMi6qm5PCkU/vw6b8ja42216ROgBUfcmHqTUISx+x1EoASk9SModtIQYk0zvizEO4SafGQfYODgDnhCWUg1oqOZPxePtFfoOjTaJlbYRWuqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f2SWvfkM; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bF89EFSL; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f2SWvfkM;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bF89EFSL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLmQv6NRDz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 00:28:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757428129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=D4QRi7hDsi9OF+uq4PfR985/VTCgDFYnf6cObBRAB+8=;
	b=f2SWvfkMQUOZdt3NP39GIKxjgDtCvpFGjWyi/FhhuKmXC8ir85mkJXL3iC467iJZDVWUh/
	u0VJbxKjREulLhnXnB34nnjL6lngjlIoVXPvnhtC8bm8e0UwANcbQ4/bf8f/L/gRfHVSyT
	cNyisjVfSQWlQ43aiT082Lm3/UTSOqg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757428130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=D4QRi7hDsi9OF+uq4PfR985/VTCgDFYnf6cObBRAB+8=;
	b=bF89EFSL6t12eqX6o/XJSXKiLB3H9AIrFC07mXiOtPxox2t1H5l5CsMgis40upjj3IK57y
	LesEafH+HgbTWH2QkLBV/EPMBMPl5jD58nwfAvSvGARge76mw9nlsAhO1SdsXS2NMCrzrB
	KcoReIY005N8mR6wyMvsUgmycOPU7Ow=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-CpY4S5GfOxmD-D97iiDR0w-1; Tue, 09 Sep 2025 10:28:48 -0400
X-MC-Unique: CpY4S5GfOxmD-D97iiDR0w-1
X-Mimecast-MFC-AGG-ID: CpY4S5GfOxmD-D97iiDR0w_1757428127
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3dc3f943e6eso3602250f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Sep 2025 07:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757428127; x=1758032927;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4QRi7hDsi9OF+uq4PfR985/VTCgDFYnf6cObBRAB+8=;
        b=ZUSlSJtRpYU2dkMf3NOEweSsVUUJn7tnt+UfeAJYb7b86r77KHLYrw3o0CEUYA3BKL
         v+P5gzRvmpeWPbWdDB+W0gybIO4tUcjVfahMjJ2aL01SbADv+4v90cpIK2AnqhiEhecv
         ahBBaKYs8gsE3XyGEBHGme2JhfywNfSq1QsjHRv44Xl0oWUGkl2/l0rzhydoZQwE2ERy
         JQCGfZqaJGaBZsH4i1QaJ4GWd27I8K6yWjXvGcyCmTJb7tcqPaSG9jjls9O4A0r1sXi6
         18PQwZWgPa7HqSJx+3YYKzvLIYXm3lqKfTc0aA4fzrZj/xG/sKCDYlzaihlyzTJGWF7O
         /qqg==
X-Forwarded-Encrypted: i=1; AJvYcCUrnpCR+FXZC5LAqw6sXJ3wcWPxurfDr7hhXopVPh0+troF/XHrS/1CWjBzJwcZuHFXe1qUokBieDS4gbY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzTmyf4MVMFxKDhoxypQ1+M1SUICxAivwUbBhY8QxIOYvLagCk/
	NPPgL+jMlQ1f8XUbwapl6C8r+59AplOxB1JoD13ky9Psf7yLrW3XKHxwZ3WcPW96VcctzjbPuxs
	J5mdCIJnKgGZIlXzXb2ve1c51WIf9ISoaeEo2BJc6lMnPWtZ1QW3CkD5sRCvVAL5fR4U=
X-Gm-Gg: ASbGncuSgLNPkuTfffrbE2jCSd4Rx3BeH590GSsQ8sc/GVq6HEeVIDsWaBmIRbMmeDs
	GZjTrfjzwanj3geynjK0GnGCkYJUSmUlnZdZVA/0phgOf7ZVa/wCrQg447aX9YM7RIahDoYNzUa
	D0XlAxvxDpF7/643UzPLHxq16f0k3XdCOq0eCkAEyo9+iSeWAx543E772ap4vt2fUQm+QZgTBan
	PotdbboNt8yfvtzAsIOV2Q8lMjemJKNVI5hZw9XO+50I9NuzNHUpeYFJt3y/ZANYq06zrsQML8e
	VHJVujkg4XEjei6Mdj9CuxPKF0d/3tAn5aKT6vZu/v7ShT795Gn7OVACa4+y0TCRdt0qwvY9LjF
	xX9Q8Hrl6gXxJxWJqQbObUYTHCcDf1rSYqVDF9GMEhSYDM05KXHT6AoYheyd0gV+67VM=
X-Received: by 2002:a05:6000:40dc:b0:3b7:9c79:32bb with SMTP id ffacd0b85a97d-3e643741232mr9630229f8f.44.1757428126498;
        Tue, 09 Sep 2025 07:28:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHD6jqBYDWaPdeHuZLYdYngedHnwSRwLh5c9r19frL6eN+mcEvQ/xbzM3ef+SL3HLWhKdEABQ==
X-Received: by 2002:a05:6000:40dc:b0:3b7:9c79:32bb with SMTP id ffacd0b85a97d-3e643741232mr9630184f8f.44.1757428125875;
        Tue, 09 Sep 2025 07:28:45 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34? (p200300d82f239c00d1f6f7fe8f147e34.dip0.t-ipconnect.de. [2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521be57esm2887963f8f.2.2025.09.09.07.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 07:28:45 -0700 (PDT)
Message-ID: <29383ee2-d6d6-4435-9052-d75a263a5c45@redhat.com>
Date: Tue, 9 Sep 2025 16:28:43 +0200
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
To: Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andreas Larsson <andreas@gaisler.com>,
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
 <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
 <2fecfae7-1140-4a23-a352-9fd339fcbae5-agordeev@linux.ibm.com>
 <e521b1f4-3f2b-48cd-9568-b9a4cf4c4830@redhat.com>
 <47ee1df7-1602-4200-af94-475f84ca8d80@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <47ee1df7-1602-4200-af94-475f84ca8d80@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _GCxgBFnP3Xz-DQyJYA4ohh6hsxGD2oy8oRR6zd3cu0_1757428127
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

>>>>>> Can't we just use an "enum lazy_mmu_state" and call it a day?
>>>>>
>>>>> I could envision something completely different for this type on s390,
>>>>> e.g. a pointer to a per-cpu structure. So I would really ask to stick
>>>>> with the current approach.
> 
> This is indeed the motivation - let every arch do whatever it sees fit.
> lazy_mmu_state_t is basically an opaque type as far as generic code is
> concerned, which also means that this API change is the first and last
> one we need (famous last words, I know).

It makes the API more complicated, though. :)

> 
> I mentioned in the cover letter that the pkeys-based page table
> protection series [1] would have an immediate use for lazy_mmu_state_t.
> In that proposal, any helper writing to pgtables needs to modify the
> pkey register and then restore it. To reduce the overhead, lazy_mmu is
> used to set the pkey register only once in enter(), and then restore it
> in leave() [2]. This currently relies on storing the original pkey
> register value in thread_struct, which is suboptimal and most

Can you elaborate why this is suboptimal? See below regarding the size of task_struct.

> importantly doesn't work if lazy_mmu sections nest.

Can you elaborate why it would be problematic with nesting (if we would have a count
and can handle the transition from 0->1 and 1->0)?

> With this series, we
> could instead store the pkey register value in lazy_mmu_state_t
> (enlarging it to 64 bits or more).

Yes.

> 
> I also considered going further and making lazy_mmu_state_t a pointer as
> Alexander suggested - more complex to manage, but also a lot more flexible.
> 
>>>> Would that integrate well with LAZY_MMU_DEFAULT etc?
>>>
>>> Hmm... I though the idea is to use LAZY_MMU_* by architectures that
>>> want to use it - at least that is how I read the description above.
>>>
>>> It is only kasan_populate|depopulate_vmalloc_pte() in generic code
>>> that do not follow this pattern, and it looks as a problem to me.
> 
> This discussion also made me realise that this is problematic, as the
> LAZY_MMU_{DEFAULT,NESTED} macros were meant only for architectures'
> convenience, not for generic code (where lazy_mmu_state_t should ideally
> be an opaque type as mentioned above). It almost feels like the kasan
> case deserves a different API, because this is not how enter() and
> leave() are meant to be used. This would mean quite a bit of churn
> though, so maybe just introduce another arch-defined value to pass to
> leave() for such a situation - for instance,
> arch_leave_lazy_mmu_mode(LAZY_MMU_FLUSH)?

The discussion made me realize that it's a bit hack right now :)

If LAZY_MMU_DEFAULT etc. are not for common code, then please
maintain them for the individual archs as well, just like you do with the
opaque type.

> 
>>
>> Yes, that's why I am asking.
>>
>> What kind of information (pointer to a per-cpu structure) would you
>> want to return, and would handling it similar to how
>> pagefault_disable()/pagefault_enable() e.g., using a variable in
>> "current" to track the nesting level avoid having s390x to do that?
> 
> The pagefault_disabled approach works fine for simple use-cases, but it
> doesn't scale well. The space allocated in task_struct/thread_struct to
> track that state is wasted (unused) most of the time.

I'm not sure that's a concern. Fitting an int into existing holes should work
and even another 64bit (8byte )...

I just checked with pahole using the Fedora config on current mm-unstable.


/* size: 9792, cachelines: 153, members: 276 */
/* sum members: 9619, holes: 20, sum holes: 125 */
/* sum bitfield members: 85 bits, bit holes: 2, sum bit holes: 43 bits */
/* padding: 32 */
/* member types with holes: 4, total: 6, bit holes: 2, total: 2 */
/* paddings: 6, sum paddings: 49 */
/* forced alignments: 12, forced holes: 2, sum forced holes: 60 */

Due to some "arch_task_struct_size" we might actually allocate more space.


Staring at my live system:

$ sudo slabinfo
Name                   Objects Objsize           Space Slabs/Part/Cpu  O/S O %Fr %Ef Flg
...
task_struct               1491   12376           24.8M      721/25/37    2 3   3  74


I am not sure if even an additional 8byte would move the needle here.


Worse, it does not
> truly enable states to be nested: it allows the outermost section to
> store some state, but nested sections cannot allocate extra space. This
> is really what the stack is for.

If it's really just 8 bytes I don't really see the problem. So likely there is
more to it?

-- 
Cheers

David / dhildenb


