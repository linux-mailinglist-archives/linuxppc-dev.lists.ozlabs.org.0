Return-Path: <linuxppc-dev+bounces-13702-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DC1C2D971
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 19:07:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0fgL0dkDz2yrm;
	Tue,  4 Nov 2025 05:07:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762193229;
	cv=none; b=XWZdWQF0QzLNV9viSPo4axKADchts0QfTR5RFTZaExPFeWlfscJR7cAF6OLbblew2Lq93y0TUgP/yTT4+S4kIvNtRM6MFsqM1MQG95lZgpx7oUFaVkVUmja7tW7hSKmYyET5BlKZFr8frO6iUKAXz326ir06Iav1ZBWD8MGvXDCklLzs0dUDBOXWt6OkwDD85CqhryOcfj+fKcFw7eESw+GVFDVbwCFjH24WreryxHDeG4TWtONIv2of/zSp4uIY5ncy+U2OKDWkrQ8zVIc5oHS58d8VNUt6dLccGC7GsVbwEVuGIiIEJliGs6VYbCRWDEMrdG5Z7H/jSrWA8hJG7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762193229; c=relaxed/relaxed;
	bh=eU7WK/1PqFlvzgHgAfgHxGbQJbuUHY5MaiGqpoJ3158=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LkA8cRQT60/5paO8KgGylc6lvBcF15vMUZ7ZncOg0X+35XgY1rxEnq+gJarMUKyE9XU6U9U4qnS7onPfRIIyZ2rsDICA9McEpaoPkRyN72nm8Ar5Bg1pXQQUPgTm4c82Cj4+cMLEIH9yaWKO/sgQuECQ2IetO5NH85UZ57r0N2BzUVGxAnLVBkVky0rV7ZEc/5/crNy44n8vAYukl357hefAL+cr+FMAYTH5789TYuaLv5oIipQ2rmbMSunNGZ/NqAH9Mo0E6aKMEb0NHhb0VpvEZuUPu/8pQxz2sRBlpDpeVzo32IRsucSzIl2uuRNHjGvzfqrOcsvCmxcU31mDyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0fgK05wNz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 05:07:07 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 183932A6B;
	Mon,  3 Nov 2025 10:06:27 -0800 (PST)
Received: from [10.1.30.16] (unknown [10.1.30.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67BAA3F694;
	Mon,  3 Nov 2025 10:06:27 -0800 (PST)
Message-ID: <bcc78ea0-5eca-49e5-bafd-84a16e06ab98@arm.com>
Date: Mon, 3 Nov 2025 18:06:24 +0000
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
Subject: Re: [PATCH v4 02/12] x86/xen: simplify flush_lazy_mmu()
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
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
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-3-kevin.brodsky@arm.com>
 <5a3ccb7e-9d36-4ac8-9634-c8dec3d6a47c@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <5a3ccb7e-9d36-4ac8-9634-c8dec3d6a47c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 01/11/2025 12:14, David Hildenbrand wrote:
> On 29.10.25 11:08, Kevin Brodsky wrote:
>> arch_flush_lazy_mmu_mode() is called when outstanding batched
>> pgtable operations must be completed immediately. There should
>> however be no need to leave and re-enter lazy MMU completely. The
>> only part of that sequence that we really need is xen_mc_flush();
>> call it directly.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>   arch/x86/xen/mmu_pv.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
>> index 2a4a8deaf612..7a35c3393df4 100644
>> --- a/arch/x86/xen/mmu_pv.c
>> +++ b/arch/x86/xen/mmu_pv.c
>> @@ -2139,10 +2139,8 @@ static void xen_flush_lazy_mmu(void)
>>   {
>>       preempt_disable();
>>   -    if (xen_get_lazy_mode() == XEN_LAZY_MMU) {
>> -        arch_leave_lazy_mmu_mode();
>> -        arch_enter_lazy_mmu_mode();
>> -    }
>> +    if (xen_get_lazy_mode() == XEN_LAZY_MMU)
>> +        xen_mc_flush();
>>         preempt_enable();
>>   }
>
> Looks like that was moved to XEN code in
>
> commit a4a7644c15096f57f92252dd6e1046bf269c87d8
> Author: Juergen Gross <jgross@suse.com>
> Date:   Wed Sep 13 13:38:27 2023 +0200
>
>     x86/xen: move paravirt lazy code
>
>
> And essentially the previous implementation lived in
> arch/x86/kernel/paravirt.c:paravirt_flush_lazy_mmu(void) in an
> implementation-agnostic way:
>
> void paravirt_flush_lazy_mmu(void)
> {
>        preempt_disable();
>
>        if (paravirt_get_lazy_mode() == PARAVIRT_LAZY_MMU) {
>                arch_leave_lazy_mmu_mode();
>                arch_enter_lazy_mmu_mode();
>        }
>
>        preempt_enable();
> }

Indeed, I saw that too. Calling the generic leave/enter functions made
some sense at that point, but now that the implementation is
Xen-specific we can directly call xen_mc_flush().

>
> So indeed, I assume just doing the flush here is sufficient.
>
> Reviewed-by: David Hildenbrand <david@redhat.com> 

Thanks for the review!

- Kevin

