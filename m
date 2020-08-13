Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A60E2431B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 02:29:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRnWk3TCDzDqdh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 10:29:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRnTz45PCzDqYL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 10:28:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aoiBi/8v; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BRnTz2Z2wz9sTM;
 Thu, 13 Aug 2020 10:28:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597278487;
 bh=vUVGgjAiIinQuqbbVQ9j02vhNrxf8wFAnBkVe09OsFs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aoiBi/8vq0qrh91pCQ6quXScPf4LDUpbd/t8OYVmi8bPeRaJgHSGjvJVWLJLhm5a9
 uyAn/MujYGj5nQkOMjup/z85PX9qv11S7v2/NfVIX62nWdH0QnB4xeYdtG4kSS89+R
 1gDuT9V9c2k2OLfeeffOUp2WKaY4z29lsyiSl1fsMliE9Ky7rp2neoPUk8RSPRqUBj
 n62c61G1tfw75dzxlpggUgL2zuOshowkipCYI7CIL8ILgdQZxQ+bm9ck1MjcufOWBs
 rbdyOEGNCYnUEKldiYEs14dILz1ls320udRRQymsNbd7ND2SdNtVP6ZFxho+afmue2
 EqzfFcEFBLZOQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Tyrel Datwyler <tyreld@linux.ibm.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/pseries: explicitly reschedule during
 drmem_lmb list traversal
In-Reply-To: <5e8213a6-802b-f7ca-b43b-a3de8a03d1da@linux.ibm.com>
References: <20200812012005.1919255-1-nathanl@linux.ibm.com>
 <5e8213a6-802b-f7ca-b43b-a3de8a03d1da@linux.ibm.com>
Date: Thu, 13 Aug 2020 10:28:05 +1000
Message-ID: <87lfij9yp6.fsf@mpe.ellerman.id.au>
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
Cc: cheloha@linux.ibm.com, ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tyrel Datwyler <tyreld@linux.ibm.com> writes:
> On 8/11/20 6:20 PM, Nathan Lynch wrote:
>> The drmem lmb list can have hundreds of thousands of entries, and
>> unfortunately lookups take the form of linear searches. As long as
>> this is the case, traversals have the potential to monopolize the CPU
>> and provoke lockup reports, workqueue stalls, and the like unless
>> they explicitly yield.
>> 
>> Rather than placing cond_resched() calls within various
>> for_each_drmem_lmb() loop blocks in the code, put it in the iteration
>> expression of the loop macro itself so users can't omit it.
>> 
>> Call cond_resched() on every 20th element. Each iteration of the loop
>> in DLPAR code paths can involve around ten RTAS calls which can each
>> take up to 250us, so this ensures the check is performed at worst
>> every few milliseconds.
>> 
>> Fixes: 6c6ea53725b3 ("powerpc/mm: Separate ibm, dynamic-memory data from DT format")
>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>> ---
>>  arch/powerpc/include/asm/drmem.h | 18 +++++++++++++++++-
>>  1 file changed, 17 insertions(+), 1 deletion(-)
>> 
>> Changes since v1:
>> * Add bounds assertions in drmem_lmb_next().
>> * Call cond_resched() in the iterator on only every 20th element
>>   instead of on every iteration, to reduce overhead in tight loops.
>> 
>> diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
>> index 17ccc6474ab6..583277e30dd2 100644
>> --- a/arch/powerpc/include/asm/drmem.h
>> +++ b/arch/powerpc/include/asm/drmem.h
>> @@ -8,6 +8,9 @@
>>  #ifndef _ASM_POWERPC_LMB_H
>>  #define _ASM_POWERPC_LMB_H
>>  
>> +#include <linux/bug.h>
>> +#include <linux/sched.h>
>> +
>>  struct drmem_lmb {
>>  	u64     base_addr;
>>  	u32     drc_index;
>> @@ -26,8 +29,21 @@ struct drmem_lmb_info {
>>  
>>  extern struct drmem_lmb_info *drmem_info;
>>  
>> +static inline struct drmem_lmb *drmem_lmb_next(struct drmem_lmb *lmb)
>> +{
>> +	const unsigned int resched_interval = 20;
>> +
>> +	BUG_ON(lmb < drmem_info->lmbs);
>> +	BUG_ON(lmb >= drmem_info->lmbs + drmem_info->n_lmbs);
>
> I think BUG_ON is a pretty big no-no these days unless there is no other option.

It's complicated, but yes we would like to avoid adding them if we can.

In a case like this there is no other option, *if* the check has to be
in drmem_lmb_next().

But I don't think we really need to check that there.

If for some reason this was called with an *lmb pointing outside of the
lmbs array it would confuse the cond_resched() logic, but it's not worth
crashing the box for that IMHO.

cheers
