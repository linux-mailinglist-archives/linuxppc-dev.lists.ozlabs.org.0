Return-Path: <linuxppc-dev+bounces-13273-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6548C067D8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 15:27:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctNxX1Pv0z3bs7;
	Sat, 25 Oct 2025 00:27:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761312464;
	cv=none; b=fug/G70WcrLeb7WfUEK5lgixrrZPjuRPb7SZtvwnSheNvRh2eXrzyKS+lSS7ScAN2XwBgwfXa9JAS4sl8Zv8vfAghCyEeFtu8YFIMZ9wf2G7lp6I6rPbODxpIXJuVBxG3TYJRNVMqGLpDyMbC6KhExozentLtyQgJsO2ExTL32YORhkQ7+Ac4Gvte3dZT/YCspuP36d2iDrVUctBaa4vGD52EILelpG48zigdHXjdgsdvNHHCDs4sMs36AMVAVDIpD4YUv8kP2Jek3lwpTp/HuCwiH7pWZ5M7lYEzKejsr+Qsra80vYAxh8io8uwPIiA0qlWehWgLfhNH288E9OZuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761312464; c=relaxed/relaxed;
	bh=W95gCkBxowoa8sjYCMILYw6pqqluuwtxuEqICefNFQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/XX/YEiLof0H3zZSpsKzB4TzwxIZB4cdnzxIffG9/58caqlyDPkNhun4e+pjXBKVa/7GGWUx7PvrxEl17rfXnpQ4MpaCxxSm8q4su95QGlNw4zs3qYrVK7uChhag+B8eR/GCMwRFaljQnBgW8egx6JPk/3FhEIhZDcdAe/eVjevwYlQwqMDW9nND+MLrUZzNyfP2VugaOljToo95wePBy+HitiftLqbjkq1kn59MWa7IeM/VmxrluYQ3cfYv/iizihDl/4MtmCuMSSxNKH9UPncMYuCuxUMW94pqWFO01yTgXWJm3SWsfPuS1GPnQJEk6tJp2GSOyR1S/0fwFv3og==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ICFWIv3N; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ICFWIv3N; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ICFWIv3N;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ICFWIv3N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctNxW26kCz3bfQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 00:27:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761312460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=W95gCkBxowoa8sjYCMILYw6pqqluuwtxuEqICefNFQ8=;
	b=ICFWIv3NilQ71wQ2SYQhGyz8pbtEusNLhcpimqk7HoHaadqdqCnQuKvtgqFeVpgJ/cTUqb
	9oMQ0avEAl8BM0x4OC726vLOcCWeaGI2LylSWpJi1EfRecIcOZ+ryuq7u4LqBSeEXXQUCH
	GN9IpIqdx61opGTlqhpRziSwIVBFiBc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761312460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=W95gCkBxowoa8sjYCMILYw6pqqluuwtxuEqICefNFQ8=;
	b=ICFWIv3NilQ71wQ2SYQhGyz8pbtEusNLhcpimqk7HoHaadqdqCnQuKvtgqFeVpgJ/cTUqb
	9oMQ0avEAl8BM0x4OC726vLOcCWeaGI2LylSWpJi1EfRecIcOZ+ryuq7u4LqBSeEXXQUCH
	GN9IpIqdx61opGTlqhpRziSwIVBFiBc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-20EiuDQDNWu4GjCP3X_VBQ-1; Fri, 24 Oct 2025 09:27:36 -0400
X-MC-Unique: 20EiuDQDNWu4GjCP3X_VBQ-1
X-Mimecast-MFC-AGG-ID: 20EiuDQDNWu4GjCP3X_VBQ_1761312456
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-427a125c925so1302743f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 06:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761312455; x=1761917255;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W95gCkBxowoa8sjYCMILYw6pqqluuwtxuEqICefNFQ8=;
        b=YCac/0ThoHP9L4i0X1TjOBi6LJs2pEq5T3t6nB2+sWAaMHFkS/J5fSMcr9K6XgssOs
         rFH9XanAUXmeo0JujN8WBE/xXble6rcIIpUMPG+2ZapIuKXEMjKliG2/+VqsoVPZE8l+
         KA7Mp6bV9V7I+dxNDMMvpuZ9J16nfTS4mMcCkJGgPyo26ORQUx9rpyfkxEqf3YcTpFWI
         JUKsF31UC78hdsKHWiK4uTGUVR6rrc4A1HUQW4ivRx20EWXd9zv0DPhFB1aCXfDVlLWX
         Tcn6UsiOpC0eSskG4O25FEbvMChnMIaabOx3p/g3LdWiEsBXTUAun6YmtJny/eHwn/Eh
         My0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvNffVrO0Czklbjrqz16KlGhhd2QPCF1mSb6+TX9UB+JS0WcUvMxnN74MQXlPUcHGa3mKy+KoJGbxnvrU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxkxkxG4rfCcRwb7O1cWfEYoK3ZVdFQRVXjOjsSoduTewKw03SN
	+kr8QtHKgMT7h1mv7XcQcrwJe0JsMKlLWq05cBfW1TFRQ+jORbLIaeb7154tr6i8aic17/o5OI7
	pe3HYnjrXMggQ71AJkvEgjwRUrRBeo8NBGNLN2VLhjvpBdOJT+01dwrFxJFYt6zs+Deg=
X-Gm-Gg: ASbGncvNehuZfUQIsf3j0oX+Wel/iVOpYUwY8yOpvk142PoymkLJfooz+A+A2VPcesK
	PTDXL9+9jQLzqRdIMCjQBQsRCIkGg+adDMhYSUK/4W9jjH5yB7mmtTrj4UXJdX/6WzK/QeLmdVA
	tRGcMcrJXflU+deDJbn7Bmeh1L/OCIN8eBhXfD2rgkiJ8hDR5ubYmdzqv41NU+HZXZTPiS/bxW+
	nQZZuWzdMRaaLr5sCybP1/HEOpFiqHl4ZsHLHfJ9+LxRBKwoXLNKIOgF3sZspvZ8UZZGm3TCpMf
	9qneIY3+MNyXs5qMjAvEmS++p+CLLmsFu2h8yCVPQ4Y02rFN9weO1CPyBR4y+MWrtu5gfGKZxQ4
	dVIVkhW+fVhy3n/lWb7oDY40wTEzIf/yHJjVZWsjbzKbOi43yx3BNzjgxkUqsa8i4JNGsiOR8fN
	V6SKkWmD55AZBr5s2HcnUDP0wiL7Y=
X-Received: by 2002:a5d:5f82:0:b0:3fa:5925:4b07 with SMTP id ffacd0b85a97d-42704d74f9fmr17804274f8f.18.1761312455501;
        Fri, 24 Oct 2025 06:27:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6q4w15VA7XMPgV1osu1aNNaqJ9bER4GrjuNDgzSEl5cHuxzuUI4S5/OhMi/rPVse+Lx9Gyg==
X-Received: by 2002:a5d:5f82:0:b0:3fa:5925:4b07 with SMTP id ffacd0b85a97d-42704d74f9fmr17804231f8f.18.1761312454926;
        Fri, 24 Oct 2025 06:27:34 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898ccc60sm9453555f8f.34.2025.10.24.06.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 06:27:34 -0700 (PDT)
Message-ID: <f8d22ae0-4e36-4537-903f-28164c850fdb@redhat.com>
Date: Fri, 24 Oct 2025 15:27:32 +0200
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
Subject: Re: [PATCH v3 06/13] mm: introduce generic lazy_mmu helpers
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-7-kevin.brodsky@arm.com>
 <73b274b7-f419-4e2e-8620-d557bac30dc2@redhat.com>
 <390e41ae-4b66-40c1-935f-7a1794ba0b71@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <390e41ae-4b66-40c1-935f-7a1794ba0b71@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uDM53oRojQjOjHojmazNiLOhq959eN77fTmvGNV4ZTk_1761312456
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 24.10.25 14:13, Kevin Brodsky wrote:
> On 23/10/2025 21:52, David Hildenbrand wrote:
>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>> [...]
>>>
>>> * madvise_*_pte_range() call arch_leave() in multiple paths, some
>>>     followed by an immediate exit/rescheduling and some followed by a
>>>     conditional exit. These functions assume that they are called
>>>     with lazy MMU disabled and we cannot simply use pause()/resume()
>>>     to address that. This patch leaves the situation unchanged by
>>>     calling enable()/disable() in all cases.
>>
>> I'm confused, the function simply does
>>
>> (a) enables lazy mmu
>> (b) does something on the page table
>> (c) disables lazy mmu
>> (d) does something expensive (split folio -> take sleepable locks,
>>      flushes tlb)
>> (e) go to (a)
> 
> That step is conditional: we exit right away if pte_offset_map_lock()
> fails. The fundamental issue is that pause() must always be matched with
> resume(), but as those functions look today there is no situation where
> a pause() would always be matched with a resume().

We have matches enable/disable, so my question is rather "why" you are 
even thinking about using pause/resume?

What would be the benefit of that? If there is no benefit then just drop 
this from the patch description as it's more confusing than just ... 
doing what the existing code does :)

>>
>> Why would we use enable/disable instead?
>>
>>>
>>> * x86/Xen is currently the only case where explicit handling is
>>>     required for lazy MMU when context-switching. This is purely an
>>>     implementation detail and using the generic lazy_mmu_mode_*
>>>     functions would cause trouble when nesting support is introduced,
>>>     because the generic functions must be called from the current task.
>>>     For that reason we still use arch_leave() and arch_enter() there.
>>
>> How does this interact with patch #11?
> 
> It is a requirement for patch 11, in fact. If we called disable() when
> switching out a task, then lazy_mmu_state.enabled would (most likely) be
> false when scheduling it again.
> 
> By calling the arch_* helpers when context-switching, we ensure
> lazy_mmu_state remains unchanged. This is consistent with what happens
> on all other architectures (which don't do anything about lazy_mmu when
> context-switching). lazy_mmu_state is the lazy MMU status *when the task
> is scheduled*, and should be preserved on a context-switch.

Okay, thanks for clarifying. That whole XEN stuff here is rather horrible.

> 
>>
>>>
>>> Note: x86 calls arch_flush_lazy_mmu_mode() unconditionally in a few
>>> places, but only defines it if PARAVIRT_XXL is selected, and we are
>>> removing the fallback in <linux/pgtable.h>. Add a new fallback
>>> definition to <asm/pgtable.h> to keep things building.
>>
>> I can see a call in __kernel_map_pages() and
>> arch_kmap_local_post_map()/arch_kmap_local_post_unmap().
>>
>> I guess that is ... harmless/irrelevant in the context of this series?
> 
> It should be. arch_flush_lazy_mmu_mode() was only used by x86 before
> this series; we're adding new calls to it from the generic layer, but
> existing x86 calls shouldn't be affected.

Okay, I'd like to understand the rules when arch_flush_lazy_mmu_mode() 
would actually be required in such arch code, but that's outside of the 
scope of your patch series.


-- 
Cheers

David / dhildenb


