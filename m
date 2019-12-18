Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1701247F1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 14:19:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dFwQ2fs3zDqg5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 00:19:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dFnv3YxWzDqVk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 00:13:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="NfyaHaGP"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47dFnp3pW4z9sS9;
 Thu, 19 Dec 2019 00:13:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1576674832;
 bh=jvXS9QaYUnBeyhFeR7eMtCXv8w7JTHZthgsAYwtfgoU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NfyaHaGP9zOdUM8yUYmFTOJTQD8ZA4DPbTcZZfO1UsuG6p8s+uA+Qusa3Hw+AT2Y9
 7nSZ7Q3zUruXevd2KInEdVnRTL6p7RPT1HDKV0lROjcLdmPUgDeSzQ9K5e9kutklPz
 NWkb15XZfl65oFmLC/jUpXMUna1cULqg/HdAY66dorouQmPnFogtr6HMCCDWcIAzEi
 RQW2yMfBhh5rMUasuFU+asmqljUaNKu16YQO4P0MOXhXNOrXQE7u/m3U4uOtN52dkD
 7f5qwiIESOiBBCieQ1eRi7gvF+y3fGob3KPFjn4L7eltOM7GCIGiWhkVxexhYclLfq
 8u2PXuWC8/Glw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH v2 2/3] mm/mmu_gather: Invalidate TLB correctly on batch
 allocation failure and flush
In-Reply-To: <0f0bea3b-b7b5-fa8c-f75c-396cf78c47b4@linux.ibm.com>
References: <20191218053530.73053-1-aneesh.kumar@linux.ibm.com>
 <20191218053530.73053-2-aneesh.kumar@linux.ibm.com>
 <20191218091733.GO2844@hirez.programming.kicks-ass.net>
 <0f0bea3b-b7b5-fa8c-f75c-396cf78c47b4@linux.ibm.com>
Date: Thu, 19 Dec 2019 00:13:48 +1100
Message-ID: <87v9qdn5df.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-arch@vger.kernel.org, will@kernel.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, Scott Wood <oss@buserror.net>, linux-mm@kvack.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> On 12/18/19 2:47 PM, Peter Zijlstra wrote:
>> On Wed, Dec 18, 2019 at 11:05:29AM +0530, Aneesh Kumar K.V wrote:
>>> From: Peter Zijlstra <peterz@infradead.org>
>>>
>>> Architectures for which we have hardware walkers of Linux page table should
>>> flush TLB on mmu gather batch allocation failures and batch flush. Some
>>> architectures like POWER supports multiple translation modes (hash and radix)
>> 
>> nohash, hash and radix in fact :-)
>> 
>>> and in the case of POWER only radix translation mode needs the above TLBI.
>> 
>>> This is because for hash translation mode kernel wants to avoid this extra
>>> flush since there are no hardware walkers of linux page table. With radix
>>> translation, the hardware also walks linux page table and with that, kernel
>>> needs to make sure to TLB invalidate page walk cache before page table pages are
>>> freed.
>>>
>>> More details in
>>> commit: d86564a2f085 ("mm/tlb, x86/mm: Support invalidating TLB caches for RCU_TABLE_FREE")
>>>
>>> Fixes: a46cc7a90fd8 ("powerpc/mm/radix: Improve TLB/PWC flushes")
>>> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>> 
>>> diff --git a/arch/powerpc/include/asm/tlb.h b/arch/powerpc/include/asm/tlb.h
>>> index b2c0be93929d..7f3a8b902325 100644
>>> --- a/arch/powerpc/include/asm/tlb.h
>>> +++ b/arch/powerpc/include/asm/tlb.h
>>> @@ -26,6 +26,17 @@
>>>   
>>>   #define tlb_flush tlb_flush
>>>   extern void tlb_flush(struct mmu_gather *tlb);
>>> +/*
>>> + * book3s:
>>> + * Hash does not use the linux page-tables, so we can avoid
>>> + * the TLB invalidate for page-table freeing, Radix otoh does use the
>>> + * page-tables and needs the TLBI.
>>> + *
>>> + * nohash:
>>> + * We still do TLB invalidate in the __pte_free_tlb routine before we
>>> + * add the page table pages to mmu gather table batch.
>> 
>> I'm a little confused though; if nohash is a software TLB fill, why do
>> you need a TLBI for tables?
>> 
>
> nohash (AKA book3e) has different mmu modes. I don't follow all the 
> details w.r.t book3e. Paul or Michael might be able to explain the need 
> for table flush with book3e.

Some of the Book3E CPUs have a partial hardware table walker. The IBM one (A2)
did, before we ripped that support out. And the Freescale (NXP) e6500
does, see eg:

  28efc35fe68d ("powerpc/e6500: TLB miss handler with hardware tablewalk support")

They only support walking one level IIRC, ie. you can create a TLB entry
that points to a PTE page, and the hardware will dereference that to get
a PTE and load that into the TLB.

cheers
