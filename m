Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F703DFBA7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 08:59:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfjKj63H9z3cWh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 16:59:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=H/U7iHRh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=H/U7iHRh; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfjKF27MQz2yNL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 16:59:28 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GfjKC2Cn2z9sRN;
 Wed,  4 Aug 2021 16:59:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1628060367;
 bh=t+u6zfLZ7zycmW7hqY9clsCXlEeHHrKzdg1cusO/g04=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=H/U7iHRh26Imk5lw1J7bUffm4LUCEi2VKtIg5t08rVJnGtXFkdk7QgCliJPJBM6KA
 onlPmVQY0+LNSFQR2zf3+PmY2GtT1TYZJxHHq6a7RHIB8cQ1zGUU5E80d5+uhishKj
 HjpsdTfYIk5X7idxEZPymdDzx//3oIk62C6lAvh/pHGg9AJ85pgB+eYcjsjAUJa444
 BqSlyv7ol3UmTEup+vuFgitbhxTR53xOkMyRd0OjCiQJdMfMzc1CQ11GfUOrnNc+9D
 9qzrzBk+OeEkGv3BuhqTCm3pD7QscZzCCp6yfhQ+NT6sQlFJwH02Sc5hXM0dcwh7Z3
 tJJy8Lh03tjLw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH] powerpc/book3s64/radix: Upgrade va tlbie to PID
 tlbie if we cross PMD_SIZE
In-Reply-To: <1628053302.0qclx0xcj9.astroid@bobo.none>
References: <20210803143725.615186-1-aneesh.kumar@linux.ibm.com>
 <1628053302.0qclx0xcj9.astroid@bobo.none>
Date: Wed, 04 Aug 2021 16:59:25 +1000
Message-ID: <87im0lofua.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Aneesh Kumar K.V's message of August 4, 2021 12:37 am:
>> With shared mapping, even though we are unmapping a large range, the kernel
>> will force a TLB flush with ptl lock held to avoid the race mentioned in
>> commit 1cf35d47712d ("mm: split 'tlb_flush_mmu()' into tlb flushing and memory freeing parts")
>> This results in the kernel issuing a high number of TLB flushes even for a large
>> range. This can be improved by making sure the kernel switch to pid based flush if the
>> kernel is unmapping a 2M range.
>
> It would be good to have a bit more description here.
>
> In any patch that changes a heuristic like this, I would like to see 
> some justification or reasoning that could be refuted or used as a 
> supporting argument if we ever wanted to change the heuristic later.
> Ideally with some of the obvious downsides listed as well.
>
> This "improves" things here, but what if it hurt things elsewhere, how 
> would we come in later and decide to change it back?
>
> THP flushes for example, I think now they'll do PID flushes (if they 
> have to be broadcast, which they will tend to be when khugepaged does
> them). So now that might increase jitter for THP and cause it to be a
> loss for more workloads.
>
> So where do you notice this? What's the benefit?

Ack. Needs some numbers and supporting evidence.

>> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
>> index aefc100d79a7..21d0f098e43b 100644
>> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
>> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
>> @@ -1106,7 +1106,7 @@ EXPORT_SYMBOL(radix__flush_tlb_kernel_range);
>>   * invalidating a full PID, so it has a far lower threshold to change from
>>   * individual page flushes to full-pid flushes.
>>   */
>> -static unsigned long tlb_single_page_flush_ceiling __read_mostly = 33;
>> +static unsigned long tlb_single_page_flush_ceiling __read_mostly = 32;
>>  static unsigned long tlb_local_single_page_flush_ceiling __read_mostly = POWER9_TLB_SETS_RADIX * 2;
>>  
>>  static inline void __radix__flush_tlb_range(struct mm_struct *mm,
>> @@ -1133,7 +1133,7 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
>>  	if (fullmm)
>>  		flush_pid = true;
>>  	else if (type == FLUSH_TYPE_GLOBAL)
>> -		flush_pid = nr_pages > tlb_single_page_flush_ceiling;
>> +		flush_pid = nr_pages >= tlb_single_page_flush_ceiling;
>
> Arguably >= is nicer than > here, but this shouldn't be in the same 
> patch as the value change.
>
>>  	else
>>  		flush_pid = nr_pages > tlb_local_single_page_flush_ceiling;
>
> And it should change everything to be consistent. Although I'm not sure 
> it's worth changing even though I highly doubt any administrator would
> be tweaking this.

This made me look at how an administrator tweaks these thresholds, and
AFAICS the answer is "recompile the kernel"?

It looks like x86 have a debugfs file for tlb_single_page_flush_ceiling,
but we don't. I guess we meant to copy that but never did?

So at the moment both thresholds could just be #defines.

Making them tweakable at runtime would be nice, it would give us an
escape hatch if we ever hit a workload in production that wants a
different value.

cheers
