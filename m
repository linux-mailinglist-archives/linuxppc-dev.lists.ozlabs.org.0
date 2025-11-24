Return-Path: <linuxppc-dev+bounces-14440-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB85DC8090A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 13:48:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFQc84x5Jz2xQs;
	Mon, 24 Nov 2025 23:48:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763988520;
	cv=none; b=c3AR93o5J+SnX94QbCkW0Fk7x4IGX4HlVprURfNqm3x3JylmvQ02FmVffOqm4X8A3W5qRgheysoFLH3UJ6ONJ1ZeifUq3ZEKucyLj/RQRiK9/eDiWheA5/P22jraNLAURiqtxAEE2vihaXz50by0jyqOU4BZjvwyqlhNpQ9mediuZXEigdWfVxRLbV+57JP3BzBrZeL6CaLKzIFRFdREPheyVud1BFlK1qket21fjvECwtluzTbkvsFRhc1MQhtRJpe7yTdZ9rnotnMlEZkieYK6xNaBn+oQpd0Diux0c807zMjDLA1rjukPmcD7aR0kZz5LzG9VIikGQgWmx8qKMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763988520; c=relaxed/relaxed;
	bh=pU+jnmvgd+G4YbcI1jrZhswEj1b5jzOEmkm4kKdxr30=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=A/jqbxEepWeKFZwe58/OSFNVRHDdB7XFPFmjENJ2ri0cQUosihxTFwPNni0HVJ97CenzhawydpvwPzaISU45GYK+cDABAOs68j2CVua7mUVEpu4MswesptvwImqTUXDSOX6glNbXMT6eFWPWneYjq8XPuzpGd9TIM0gsykJaghTJiVauSPb2qAGwmE3Owlg6iq3fjurramcNtmZNq1tyHwgVXYxsrRsFHIj+t6Cs8OjBoZOuv1WLFbPa8kaSHaWcePhdi6tpoozdd50VvzFsiV0FfD667IDDN13h6rCuoo7Wh1ximJGqs4Glb0XrW7doY1f5mFRbr3UM6Ac4HPLgow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFQc71pVZz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Nov 2025 23:48:37 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57038497;
	Mon, 24 Nov 2025 04:47:57 -0800 (PST)
Received: from [10.57.40.193] (unknown [10.57.40.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEF4F3F6A8;
	Mon, 24 Nov 2025 04:47:56 -0800 (PST)
Message-ID: <f36ebc15-c724-487a-8e4a-9ca95edc544a@arm.com>
Date: Mon, 24 Nov 2025 13:47:53 +0100
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
Subject: Re: [PATCH v4 06/12] mm: introduce generic lazy_mmu helpers
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-7-kevin.brodsky@arm.com>
 <71418b31-aedb-4600-9558-842515dd6c44@arm.com>
 <b44825dd-aef9-4d3e-91fd-a44122264c23@arm.com>
Content-Language: en-GB
In-Reply-To: <b44825dd-aef9-4d3e-91fd-a44122264c23@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 10/11/2025 11:45, Kevin Brodsky wrote:
>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>> index b8d37eb037fc..d9c8e94f140f 100644
>>> --- a/arch/arm64/mm/mmu.c
>>> +++ b/arch/arm64/mm/mmu.c
>>> @@ -731,7 +731,7 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>>>  		return -EINVAL;
>>>  
>>>  	mutex_lock(&pgtable_split_lock);
>>> -	arch_enter_lazy_mmu_mode();
>>> +	lazy_mmu_mode_enable();
>>>  
>>>  	/*
>>>  	 * The split_kernel_leaf_mapping_locked() may sleep, it is not a
>> This is a bit unfortunate, IMHO. The rest of this comment explains that although
>> you're not supposed to sleep inside lazy mmu mode, it's fine for arm64's
>> implementation. But we are no longer calling arm64's implementation; we are
>> calling a generic function, which does who knows what.
>>
>> I think it all still works, but we are no longer containing our assumptions in
>> arm64 code. We are relying on implementation details of generic code.
> I see your point. The change itself is still correct (and required
> considering patch 8), but maybe the documentation of the generic
> interface should be clarified to guarantee that the generic layer can
> itself cope with sleeping - without any guarantee regarding the
> behaviour of arch_*_lazy_mmu_mode.

Re-reading the existing comment in <linux/pgtable.h>, I think it already
makes clear that sleeping is not forbidden by design:

>  * In the general case, no lock is guaranteed to be held between entry
> and exit
>  * of the lazy mode. So the implementation must assume preemption may
> be enabled
>  * and cpu migration is possible; it must take steps to be robust
> against this.

The arch implementation may disable preemption, but arm64 code can rely
on the arm64 implementation allowing sleeping.

- Kevin


