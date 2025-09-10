Return-Path: <linuxppc-dev+bounces-11995-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1651AB51BDC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 17:38:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMPwG3jCQz3dGl;
	Thu, 11 Sep 2025 01:38:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757518686;
	cv=none; b=KWp+s8mBpqsHuUZDY/68PfBB/nK/n5PqN8lhRNxyl80dlR2EK54TITZzwrRzBKB97NnXkhreAhrJ08BYlzMuVOYtd5i3aJeiqdzZeAJurw/66Ih2rnCizsf83t1+XJUPu4AdL9f6mxJEH3VJphsYTuD/zBEpg8onBeCDe7afDkeL+O5rPHHo6tRalxiaLT7T58QQ5CAGo2yWbdhNOBICfph8Re738fQYniVd2H6B6fw4G13upvHGd9OIw5gyIXJ33mPRieA6XW2ehqqQYdcmKhqTTGLbffKYx+2aBpLvo8rPAQaMYN/NFzXoobdmM+DREKQfW+91Mukc2u3XLmPZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757518686; c=relaxed/relaxed;
	bh=xC5R7eYl9Rwp0IenYxoNNT2Mrkq2ifbsmCTO4MCCq6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpANrRdwSDrZs7lkUispxdanU8WzKTCF4kBcu0kTZkxObsO0oSduLJdJ1Rngk4D/L97p41+gWcdpiVexyIr5JHu4qHpfwGo/rJBSPpxcngWoyKqJCYcVwNeVrp0XJ0OKnYqIwp5Y6ZnSBklvlAmzXbPkYjUWUAv7JLndLYB0LY3rlsb2QDfK82ZNK4T/y07k3nr9qtfpAe5gfA9kby6RQpFT1jbe7aamkHmlxAipLIRkheXSemfQL7f/ZPeK69XIiX2+fUDXSdINyOiITTbCyLnU6PLWz2rARKX8+O/RPBkoxW0rbxPf2mFbhtvHbHxtJr6MMDlG17vb1bv1I4pFTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eKMqzqh2; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eb7etqn9; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eKMqzqh2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eb7etqn9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMPwF0XMtz3dDJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 01:38:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757518678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xC5R7eYl9Rwp0IenYxoNNT2Mrkq2ifbsmCTO4MCCq6w=;
	b=eKMqzqh2zsQ36w3mPs9dMI6+wm5PmBpcvBuUJ8+aiQd8+RcqOXtx3xd1XRNxLqOFr6UkhI
	kkvNaGlycizo9PO/whuHE5HOQPDaeMKYXg9uZgzSqk76nQ587eRn1j2uVpCYZSASSYbQag
	0kq59j5IzHGwNhV/3CQQSu3z+feygsw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757518679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xC5R7eYl9Rwp0IenYxoNNT2Mrkq2ifbsmCTO4MCCq6w=;
	b=eb7etqn9YY7E2AKb2M6EMTSYUCKcb6cVClk2NYycoiL78Q/zLO8Xe0oND/Y2wTQsTdziOz
	eyu6v8xpTizRXONfN0gcL9Pd9srovUvHqDE5k3oKYxWVwfSTIAatrKGAQG+HPbVdmXtEn6
	AAVmZ2rgaN+QE1VShv9OhE0t4+n2TyA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-cmw-ETlOMyCpMZJysMosHg-1; Wed, 10 Sep 2025 11:37:55 -0400
X-MC-Unique: cmw-ETlOMyCpMZJysMosHg-1
X-Mimecast-MFC-AGG-ID: cmw-ETlOMyCpMZJysMosHg_1757518674
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45a15f10f31so5031595e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 08:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757518674; x=1758123474;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xC5R7eYl9Rwp0IenYxoNNT2Mrkq2ifbsmCTO4MCCq6w=;
        b=t783fN3yR9KwieH4mXAyV5Yj2ncv4CtDDAo2Kj38WZs/OOoGs2ey+RZ0UmsZ7/BErb
         SCB7NfZ8n1dTopEJgJn1aa51aIIdRXihtEDhN0SvJYtVIlNTpDKxI7j9J5IgSQYe8dtw
         iqz2J+1n5QO9FHPAxNcXH9ALL88MxdGE2WCSRpUFiFm533kMnzEg4UjSxCTxT+U2S4Do
         AodfSDP04b4IHitcs7w/b3pc27jBAdKgRRukps03UtjYIP4YkoYya1K5ehqlyulQOx7Z
         lrGkE9zWIBrldaIhC3vJFsIJ5rZst9fehoxqlW0UfxKqx1zsvNTWmSE2vPEqchHaP4Oe
         52hw==
X-Forwarded-Encrypted: i=1; AJvYcCUAaMuPQCemlZuk5cC+IPXpVWIeCUb8go966ghzOAj2L1Unk8ULosbpVm+Xyij++Lz0IpRbsKACrD2gGNk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxAKJROfxdHoTcZqNS2M0HkmUaHT4k7dCD/5nve4DNk9n86yc8N
	H/wS2z0fHaa/3hrauJgWKc54YFs/c7UBvihwI5opYIv8SJGaQ3PuBE0vCE1lhONy69oBfHoeMY5
	pwzsrG0A3uA1/b3pwBAic/qHc5HsoLSpRVV2tZ6cXhexFI8rRGm2wdJZ3y3JieYabmKo=
X-Gm-Gg: ASbGncvEoTwOj9UwMYxeQlWszxEFMx1DtakDgfMmkCibS1KeInwi6OdYfRocICpZQit
	WN0e/aTXiUPAgNqHxebOWlkx4ivVwpxGgrCzljLOIErdFshbpYovH0JLOVfgNNu/hYE4CXi+mem
	x7b0pdwr3MDk6HLtH1JFEwaW+K7pqCQfiKaz+31tl1sydETrD5F9l2KagTjvBWiDqD2K92S7DfU
	yMaIWQ0Rz/UiTHTE+87Hy/Idl+LFQDXJuKU2d0PyhVuRKeQr6GT4xtZ9VUuF/iR6AKAY3m6gdIw
	6DkcANciVYG7EcE3uI7TMPzaKkqeb3HnHj8op0U7DRvSXQM7/Ufm42ITUe2awYbAAHpt28RFF3l
	iY1KWA9e8debP3hvg3g8WfNBQil7oK1yeu4StR9hlTsNMc+FoI2DeNviiXkPn6XuslyY=
X-Received: by 2002:a05:6000:400f:b0:3df:22a3:d240 with SMTP id ffacd0b85a97d-3e75e0f032cmr41444f8f.4.1757518674350;
        Wed, 10 Sep 2025 08:37:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSanGWB8lh0ls+MFHggdlE9XrwwjBOuob47gN7Go2sD22cOkG0a4ZQLy4lN4pGQUVx9DuyJw==
X-Received: by 2002:a05:6000:400f:b0:3df:22a3:d240 with SMTP id ffacd0b85a97d-3e75e0f032cmr41388f8f.4.1757518673785;
        Wed, 10 Sep 2025 08:37:53 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f17:9c00:d650:ab5f:74c2:2175? (p200300d82f179c00d650ab5f74c22175.dip0.t-ipconnect.de. [2003:d8:2f17:9c00:d650:ab5f:74c2:2175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9cdbsm7733009f8f.16.2025.09.10.08.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 08:37:53 -0700 (PDT)
Message-ID: <ef343405-c394-4763-a79f-21381f217b6c@redhat.com>
Date: Wed, 10 Sep 2025 17:37:51 +0200
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mark Rutland <Mark.Rutland@arm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
 <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
 <2fecfae7-1140-4a23-a352-9fd339fcbae5-agordeev@linux.ibm.com>
 <e521b1f4-3f2b-48cd-9568-b9a4cf4c4830@redhat.com>
 <47ee1df7-1602-4200-af94-475f84ca8d80@arm.com>
 <29383ee2-d6d6-4435-9052-d75a263a5c45@redhat.com>
 <9de08024-adfc-421b-8799-62653468cf63@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <9de08024-adfc-421b-8799-62653468cf63@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: irjdVG0aWOgJgpTyNYPSWxOxbWaD4VKPg44wrGb87lo_1757518674
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> 
> Somewhat, but in the regular case where enter() is called followed by
> leave() there is really no complexity for the caller, just an extra
> local variable.
> 
> There are complications where we want to exit lazy_mmu temporarily, as
> in mm/kasan/shadow.c [1k], but this is in fact unavoidable. Chatting
> with Mark Rutland, I realised that to truly support nested sections,
> this must be handled in a special way in any case. To be clear, I am
> referring to this situation:
> 
> __kasan_populate_vmalloc:
>      apply_to_page_range:
>          arch_enter_lazy_mmu_mode() {1}
> 
>          kasan_populate_vmalloc_pte:
>              arch_leave_lazy_mmu_mode() {2}
>              arch_enter_lazy_mmu_mode() {3}
> 
>          arch_leave_lazy_mmu_mode() {4}
> 
> With the approach this series takes, call {2} is made safe by passing a
> special parameter (say LAZY_MMU_FLUSH) that forces lazy_mmu to be fully
> exited - and call {3} will then re-enter lazy_mmu. This works regardless
> of whether __kasan_populate_vmalloc() has been called with lazy_mmu
> already enabled (i.e. calls {1} and {4} can be nested).
> 
> On the other hand, with a pagefault_disabled-like approach, there is no
> way to instruct call {3} to fully exit lazy_mmu regardless of the
> nesting level.

Sure there is, with a better API. See below. :)

> 
> It would be possible to make both approaches work by introducing a new
> API, along the lines of:
> - int arch_disable_save_lazy_mmu_mode() (the return value indicates the
> nesting level)
> - void arch_restore_lazy_mmu_mode(int state) (re-enter lazy_mmu at the
> given nesting level)

Yes, I think we really need a proper API.

> 
> This is arguably more self-documenting than passing LAZY_MMU_FLUSH in
> call {2}. This API is however no simpler when using a
> pagefault_disabled-like approach (and less consistent than when always
> saving state on the stack).

Yes, a proper API is warranted. In particular, thinking about the following:

arch_enter_lazy_mmu_mode() {1}
	arch_enter_lazy_mmu_mode() {2}

	kasan_populate_vmalloc_pte:
		arch_leave_lazy_mmu_mode() {3}
		arch_enter_lazy_mmu_mode() {4}

	arch_leave_lazy_mmu_mode() {5}
arch_leave_lazy_mmu_mode() {6}


Imagine if we have the following API instead:

lazy_mmu_enable() {1}
	lazy_mmu_enable() {2}

	kasan_populate_vmalloc_pte:
		lazy_mmu_pause() {3}
		lazy_mmu_continue() {4}

	lazy_mmu_disable() {5}
lazy_mmu_disable() {6}


I think it is crucial that after lazy_mmu_save/lazy_mmu_restore, no more 
nesting must happen.

Assume we store in the task_struct

uint8_t lazy_mmu_enabled_count;
bool lazy_mmu_paused;

We can do things like

a) Sanity check that while we are paused that we get no more 
enable/disable requests
b) Sanity check that while we are paused that we get no more pause requests.

[...]

>>
>> If LAZY_MMU_DEFAULT etc. are not for common code, then please
>> maintain them for the individual archs as well, just like you do with the
>> opaque type.
> 
> I see your point - having them defined in <linux/mm_types.h> could be
> misleading. I just wanted to avoid all 4 architectures defining the same
> macros. Maybe call them __LAZY_MMU_* to suggest they're not supposed to
> be used in generic code?

Maybe look into avoiding them completely :) Let's agree on the API first 
and then figure out how to pass the information we need to pass.

[...]

>> Worse, it does not
>>> truly enable states to be nested: it allows the outermost section to
>>> store some state, but nested sections cannot allocate extra space. This
>>> is really what the stack is for.
>>
>> If it's really just 8 bytes I don't really see the problem. So likely
>> there is
>> more to it?
> 
> I suppose 8 extra bytes per task is acceptable, but some architectures
> may want to add more state there.

Just for reference: we currently perform an order-2 allocation, 
effectively leaving ~4KiB "unused".

If there are any real such case on the horizon where we need to store 
significantly more (in which case storing it on the stack might probably 
also bad), please let me know.

> 
> The one case that is truly problematic (though not required at this
> point) is where each (nested) section needs to store its own state. With
> this series it works just fine as there is a lazy_mmu_state_t for each
> section, however if we use task_struct/thread_struct there can be only
> one member shared by all nested sections.

Do we have a use case for that on the horizon? If so, I fully agree, we 
have to store information per level. How/what information we have to 
store would be another question.

-- 
Cheers

David / dhildenb


