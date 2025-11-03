Return-Path: <linuxppc-dev+bounces-13704-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CE0C2DAB9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 19:26:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0g5W6YX7z2yrm;
	Tue,  4 Nov 2025 05:26:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762194383;
	cv=none; b=MwKDRhOA+4+/peHUALzXXhpP6mRRKwfbhiU0ikoA7dn3sLuyCIZPEr88ldZyTdfjiG1yhyYPAbpTPpRNriHCfitZXc8puVTVmIolP2VFc7RTclRsHSrYjaS2qc4JyQ+sNa4koV6LypGwQdel8PDR2LwPr03UKkOsPiogl4b+GjEmQlKvp6GNbZUotI+CPFp4BGVhJ2sAohRYssmNubG+9o/h3BppH7hTc5ZBiCvPo7wUslzCsje/FbJPhSh1wsg9bSAcGoo651XoATerZoJESdCaKwBjcG/jAxOLWoj4IogoH7dtsg1hnjaBeqK8xmWN5J9U6Np0jCMMqxEKMlBxug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762194383; c=relaxed/relaxed;
	bh=6Xh/82epPYCxQQw2FW1rqZLFSQMgbCtmljXqcyGvdlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VnZuuI6gyEX6pwlNcJs+Z3X2WBlA6xn6KCi0o+mo38QMai0VZk7XRHlZMH6BtwN6JaZ+h9FWshPNXPv0eJk1GPLHfDlaq5TgN3fAyb+YrHq4yiKsRDxucmcxdRiFjc9U/QnWLigatiAO94UornAopwzkG1u4QLWYxlyyBIGAGTgaSIXOLXs9R+glFmNuo3zKifJjxV0ayWSDpp9wlilA9gqJKTaSQ1QirndHBfYMzo93DzKLZOnVllCZ3zw2oW/G2r4wwWxQchTNkEwRm93wZSJyUiusMg30TCXsZv/Q1g+ZDKmKwZm6Ng1+QM3Ogx6z9/54/i0FXn4s7zfGOxYa7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0g5W0Bqvz2xnx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 05:26:22 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EF862A6B;
	Mon,  3 Nov 2025 10:25:43 -0800 (PST)
Received: from [10.1.30.16] (unknown [10.1.30.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E06143F694;
	Mon,  3 Nov 2025 10:25:43 -0800 (PST)
Message-ID: <334d6272-a1c2-4075-a956-3f41908371a6@arm.com>
Date: Mon, 3 Nov 2025 18:25:41 +0000
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
Subject: Re: [PATCH v4 08/12] arm64: mm: replace TIF_LAZY_MMU with
 in_lazy_mmu_mode()
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
 <20251029100909.3381140-9-kevin.brodsky@arm.com>
 <b6f5b3cc-93a0-408a-b7e0-72462f3fd549@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <b6f5b3cc-93a0-408a-b7e0-72462f3fd549@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 03/11/2025 16:03, David Hildenbrand wrote:
> On 29.10.25 11:09, Kevin Brodsky wrote:
>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>> mode. As a result we no longer need a TIF flag for that purpose -
>> let's use the new in_lazy_mmu_mode() helper instead.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>   arch/arm64/include/asm/pgtable.h     | 16 +++-------------
>>   arch/arm64/include/asm/thread_info.h |  3 +--
>>   2 files changed, 4 insertions(+), 15 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h
>> b/arch/arm64/include/asm/pgtable.h
>> index 535435248923..61ca88f94551 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -62,30 +62,21 @@ static inline void emit_pte_barriers(void)
>>     static inline void queue_pte_barriers(void)
>>   {
>> -    unsigned long flags;
>> -
>>       if (in_interrupt()) {
>>           emit_pte_barriers();
>>           return;
>>       }
>>   -    flags = read_thread_flags();
>> -
>> -    if (flags & BIT(TIF_LAZY_MMU)) {
>> -        /* Avoid the atomic op if already set. */
>> -        if (!(flags & BIT(TIF_LAZY_MMU_PENDING)))
>> -            set_thread_flag(TIF_LAZY_MMU_PENDING);
>> -    } else {
>> +    if (in_lazy_mmu_mode())
>> +        test_and_set_thread_flag(TIF_LAZY_MMU_PENDING);
>
> You likely don't want a test_and_set here, which would do a
> test_and_set_bit() -- an atomic rmw.

Ah yes good point, the new version would do an atomic RMW in all cases.
Simpler code but also slower :/

>
> You only want to avoid the atomic write if already set.
>
> So keep the current
>
>     /* Avoid the atomic op if already set. */
>     if (!(flags & BIT(TIF_LAZY_MMU_PENDING)))
>         set_thread_flag(TIF_LAZY_MMU_PENDING); 

Pretty much, since we're now only considering one flag we can simplify
it to:

if (!test_thread_flag(TIF_LAZY_MMU_PENDING))
    set_thread_flag(TIF_LAZY_MMU_PENDING);

- Kevin

