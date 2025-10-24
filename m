Return-Path: <linuxppc-dev+bounces-13269-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF7CC06349
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 14:17:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctMNn1Cgsz3c5f;
	Fri, 24 Oct 2025 23:17:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761308265;
	cv=none; b=kTnaxzIA3P32MLNec+59cGxJqjul6oPy4ClU4Ak1IRs2GUBi1f/8Bk+cYU8Sjx0uxzfwCM5vX+HNVAaLcw+mZy53p9LXJSlgMa+3ZKqH5zeZyr5TKZqebkoij/AT8a+w/98pImO3UG/yOog84NlffKodooDS0WqDC8Kdve69bIwDkFGAVAOvoSuZgDJZ0dW62FtCkIB2Au8SlqcgscCv1bTEZbzGddBSWHYF/MWrtm3hy9TMkga5vBFVWAtV8JhemshzzynjtzZILGtAtbpR5lmg2n4qHBo7+sn5ddEvgNiwUDmQputbnNKB7Lp66Qjvb8dXvzPGB355klZCk+R3kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761308265; c=relaxed/relaxed;
	bh=YioWD/IqA/1JOGO8+Y7wTQHhF26d2UKTg8w6nlGrrCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQJuU5fGUoyynXPJ9cik0Q4I319Gi7eYb0J0E+VALfvfCepdnit/xEAd3gTEguhOklGJM6VVLuAeZjga1n3Y7HvRaNjQ/h5OYU7goaPJJJTP1XdNsSXju+Qn+nskCHO64cZLNTrgk0H2eQSLHClnqmK3Qa6aO1jYOd0dxurBaYSMxcCg1Y0gTQoxnJqF3Psl0ifU3GLnHSBXHfrofYeGxsQJ7IJCf0s8RJphduEC+1QDY/OSM8KNYEhUxvI/o7TQP8HcDgcfnRP45TTZ9ywANdJmWyotEaRIm0JTa7kxKGH2S2puZbDcqp/wOrollJuy1FAXZI30sRLe38ms+hdWPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctMNm348Zz3bv1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 23:17:44 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F3401E2F;
	Fri, 24 Oct 2025 05:17:05 -0700 (PDT)
Received: from [10.44.160.74] (e126510-lin.lund.arm.com [10.44.160.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 881823F66E;
	Fri, 24 Oct 2025 05:17:04 -0700 (PDT)
Message-ID: <ed949468-5425-4f82-826b-249c43a0df05@arm.com>
Date: Fri, 24 Oct 2025 14:17:04 +0200
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
Subject: Re: [PATCH v3 12/13] mm: bail out of lazy_mmu_mode_* in interrupt
 context
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
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
 <20251015082727.2395128-13-kevin.brodsky@arm.com>
 <28f2ebe9-cfed-41c3-803f-8756dca0e300@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <28f2ebe9-cfed-41c3-803f-8756dca0e300@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 23/10/2025 22:08, David Hildenbrand wrote:
> On 15.10.25 10:27, Kevin Brodsky wrote:
>> The lazy MMU mode cannot be used in interrupt context. This is
>> documented in <linux/pgtable.h>, but isn't consistently handled
>> across architectures.
>>
>> arm64 ensures that calls to lazy_mmu_mode_* have no effect in
>> interrupt context, because such calls do occur in certain
>> configurations - see commit b81c688426a9 ("arm64/mm: Disable barrier
>> batching in interrupt contexts"). Other architectures do not check
>> this situation, most likely because it hasn't occurred so far.
>>
>> Both arm64 and x86/Xen also ensure that any lazy MMU optimisation is
>> disabled while in interrupt mode (see queue_pte_barriers() and
>> xen_get_lazy_mode() respectively).
>>
>> Let's handle this in the new generic lazy_mmu layer, in the same
>> fashion as arm64: bail out of lazy_mmu_mode_* if in_interrupt(), and
>> have in_lazy_mmu_mode() return false to disable any optimisation.
>> Also remove the arm64 handling that is now redundant; x86/Xen has
>> its own internal tracking so it is left unchanged.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>   arch/arm64/include/asm/pgtable.h | 17 +----------------
>>   include/linux/pgtable.h          | 16 ++++++++++++++--
>>   include/linux/sched.h            |  3 +++
>>   3 files changed, 18 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h
>> b/arch/arm64/include/asm/pgtable.h
>> index 944e512767db..a37f417c30be 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -62,37 +62,22 @@ static inline void emit_pte_barriers(void)
>>     static inline void queue_pte_barriers(void)
>>   {
>> -    if (in_interrupt()) {
>> -        emit_pte_barriers();
>> -        return;
>> -    }
>> -
>
> That took me a while. I guess this works because in_lazy_mmu_mode() ==
> 0 in interrupt context, so we keep calling emit_pte_barriers?

Yes exactly.

- Kevin

