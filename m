Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FAE3ECEF5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 09:04:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp4sg3xHxz3cLk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 17:04:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RQgo7Joz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=RQgo7Joz; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp4ry1pwwz3029
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 17:04:01 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gp4rv1D9rz9s5R;
 Mon, 16 Aug 2021 17:03:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629097440;
 bh=X3W1gmobkXpJ4MUwr/c3fD7eD9+viYYLFJDyWgZigEI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RQgo7JozeNMfHj13tmzhx/bOHZa2sbWHhCjq78t7Y+gaqcPO7V1qplvUrs3+gdj8H
 DRQ/8pIl9dWw4zhmx7o3TxTAuLANTa+vzHdTwdi5QNHy2qfYGzS9saWhpiU2QRU3gI
 in8YabWPrGiq2o3LejtrVBcz+rkH/uEV4ugjW+thvcHNr6vKhirizWbNUSaFpHqxpw
 n5xjdHVKbYA0Sj2hys5BISHCqWzPHFLpDbnIFQgfKqHim4YJXij9L6YIvVmAG4NQ40
 xLQqk2ipNHaaSM5z9mv3dhegDjq3np8C/PCPuSKWRB/ijAo/bDZjVRkZKhXfmdd0T/
 9nRI/pODtOxbA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Puvichakravarthy
 Ramachandran <puvichakravarthy@in.ibm.com>
Subject: Re: [RFC PATCH] powerpc/book3s64/radix: Upgrade va tlbie to PID
 tlbie if we cross PMD_SIZE
In-Reply-To: <c157f9c9-d340-24f7-1aa0-40bbd4e1386e@linux.ibm.com>
References: <OFAE67F802.E3873360-ON00258729.0020407B-65258729.002BAB12@ibm.com>
 <87fsven7yv.fsf@mpe.ellerman.id.au>
 <c157f9c9-d340-24f7-1aa0-40bbd4e1386e@linux.ibm.com>
Date: Mon, 16 Aug 2021 17:03:55 +1000
Message-ID: <87czqdhnvo.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> On 8/12/21 6:19 PM, Michael Ellerman wrote:
>> "Puvichakravarthy Ramachandran" <puvichakravarthy@in.ibm.com> writes:
>>>> With shared mapping, even though we are unmapping a large range, the kernel
>>>> will force a TLB flush with ptl lock held to avoid the race mentioned in
>>>> commit 1cf35d47712d ("mm: split 'tlb_flush_mmu()' into tlb flushing and memory freeing parts")
>>>> This results in the kernel issuing a high number of TLB flushes even for a large
>>>> range. This can be improved by making sure the kernel switch to pid based flush if the
>>>> kernel is unmapping a 2M range.
>>>>
>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>> ---
>>>>   arch/powerpc/mm/book3s64/radix_tlb.c | 8 ++++----
>>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c > b/arch/powerpc/mm/book3s64/radix_tlb.c
>>>> index aefc100d79a7..21d0f098e43b 100644
>>>> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
>>>> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
>>>> @@ -1106,7 +1106,7 @@ EXPORT_SYMBOL(radix__flush_tlb_kernel_range);
>>>>    * invalidating a full PID, so it has a far lower threshold to change > from
>>>>    * individual page flushes to full-pid flushes.
>>>>    */
>>>> -static unsigned long tlb_single_page_flush_ceiling __read_mostly = 33;
>>>> +static unsigned long tlb_single_page_flush_ceiling __read_mostly = 32;
>>>>   static unsigned long tlb_local_single_page_flush_ceiling __read_mostly > = POWER9_TLB_SETS_RADIX * 2;
>>>>
>>>>   static inline void __radix__flush_tlb_range(struct mm_struct *mm,
>>>> @@ -1133,7 +1133,7 @@ static inline void __radix__flush_tlb_range(struct > mm_struct *mm,
>>>>        if (fullmm)
>>>>                flush_pid = true;
>>>>        else if (type == FLUSH_TYPE_GLOBAL)
>>>> -             flush_pid = nr_pages > tlb_single_page_flush_ceiling;
>>>> +             flush_pid = nr_pages >= tlb_single_page_flush_ceiling;
>>>>        else
>>>>                flush_pid = nr_pages > tlb_local_single_page_flush_ceiling;
>>>
>>> Additional details on the test environment. This was tested on a 2 Node/8
>>> socket Power10 system.
>>> The LPAR had 105 cores and the LPAR spanned across all the sockets.
>>>
>>> # perf stat -I 1000 -a -e cycles,instructions -e
>>> "{cpu/config=0x030008,name=PM_EXEC_STALL/}" -e
>>> "{cpu/config=0x02E01C,name=PM_EXEC_STALL_TLBIE/}" ./tlbie -i 10 -c 1  -t 1
>>>   Rate of work: = 176
>>> #           time             counts unit events
>>>       1.029206442         4198594519      cycles
>>>       1.029206442         2458254252      instructions              # 0.59 insn per cycle
>>>       1.029206442         3004031488      PM_EXEC_STALL
>>>       1.029206442         1798186036      PM_EXEC_STALL_TLBIE
>>>   Rate of work: = 181
>>>       2.054288539         4183883450      cycles
>>>       2.054288539         2472178171      instructions              # 0.59 insn per cycle
>>>       2.054288539         3014609313      PM_EXEC_STALL
>>>       2.054288539         1797851642      PM_EXEC_STALL_TLBIE
>>>   Rate of work: = 180
>>>       3.078306883         4171250717      cycles
>>>       3.078306883         2468341094      instructions              # 0.59 insn per cycle
>>>       3.078306883         2993036205      PM_EXEC_STALL
>>>       3.078306883         1798181890      PM_EXEC_STALL_TLBIE
>>> .
>>> .
>>>
>>> # cat /sys/kernel/debug/powerpc/tlb_single_page_flush_ceiling
>>> 34
>>>
>>> # echo 32 > /sys/kernel/debug/powerpc/tlb_single_page_flush_ceiling
>>>
>>> # perf stat -I 1000 -a -e cycles,instructions -e
>>> "{cpu/config=0x030008,name=PM_EXEC_STALL/}" -e
>>> "{cpu/config=0x02E01C,name=PM_EXEC_STALL_TLBIE/}" ./tlbie -i 10 -c 1  -t 1
>>>   Rate of work: = 313
>>> #           time             counts unit events
>>>       1.030310506         4206071143      cycles
>>>       1.030310506         4314716958      instructions              # 1.03 insn per cycle
>>>       1.030310506         2157762167      PM_EXEC_STALL
>>>       1.030310506          110825573      PM_EXEC_STALL_TLBIE
>>>   Rate of work: = 322
>>>       2.056034068         4331745630      cycles
>>>       2.056034068         4531658304      instructions              # 1.05 insn per cycle
>>>       2.056034068         2288971361      PM_EXEC_STALL
>>>       2.056034068          111267927      PM_EXEC_STALL_TLBIE
>>>   Rate of work: = 321
>>>       3.081216434         4327050349      cycles
>>>       3.081216434         4379679508      instructions              # 1.01 insn per cycle
>>>       3.081216434         2252602550      PM_EXEC_STALL
>>>       3.081216434          110974887      PM_EXEC_STALL_TLBIE
>> 
>> 
>> What is the tlbie test actually doing?
>> 
>> Does it do anything to measure the cost of refilling after the full mm flush?
>
> That is essentially
>
> for ()
> {
>    shmat()
>    fillshm()
>    shmdt()
>
> }
>
> for a 256MB range. So it is not really a fair benchmark because it 
> doesn't take into account the impact of throwing away the full pid 
> translation. But even then the TLBIE stalls is an important data point?

Choosing the ceiling is a trade-off, and this test only measures one
side of the trade-off.

It tells us that the actual time taken to execute the full flush is less
than doing 32 individual flushes, but that's not the full story.

To decide I think we need some numbers for some more "real" workloads,
to at least see that there's no change, or preferably some improvement.

Another interesting test might be to do the shmat/fillshm/shmdt, and
then chase some pointers to provoke TLB misses. Then we could work out
the relative cost of TLB misses vs the time to do the flush.

cheers
