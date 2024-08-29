Return-Path: <linuxppc-dev+bounces-716-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D27AC9638F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 05:48:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvS1x4HhCz2ynn;
	Thu, 29 Aug 2024 13:48:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b7"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724903333;
	cv=none; b=GkAsgWiqCtNFFdcsI9Oslv3GU8wRR1rM6eVe7pW/0ZzO4l/6jzhk50QAelUPtd2tyuDuRB9NTSwC3/2kumIio9/JLvU2uBGViDyard083FyMIZ9Y00g4xP8sqM22+N0zjTJpMbMVM89V3vAa37ZE2rLQHYN3fVFVIaokgCFsol1WI1SgWTlr17BzBuRrrbhbEE0yERBbSNStdbyDyg3kpzvOuJEt9EoZs0vehkPzCGRTA00MrEj1o1rTxDuKEwG8+kHduPyptvl0FKpDNZpcLIvMqgaAJafahDRyHGJ0b/SM+VpuyMzl7tIDayojD2kquHnEeWPPG/wUnAAZnMuo0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724903333; c=relaxed/relaxed;
	bh=n+Lh2vHxUB+86yeUS0d5uwMJVWzCawU4cjiNowF9hs4=;
	h=X-Greylist:Message-ID:DKIM-Signature:Date:MIME-Version:Subject:To:
	 Cc:References:X-Report-Abuse:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Migadu-Flow; b=bj5qcC+PqOgLykYQbu0g8JDSeNCa75CaFWAo8rQmue1kYofECcKtscox4+ZwoW37nblZJFz2P6v2s4mbOU3p9VpUN9h26Iz1BQzUgAU5cVwIPsO0xOf1MuhWPOABoWv3zFJWsYRm1RjVXlXoJCO+cqqcqYJM6HOFOHg04X8RCpfW9q+bGq+lJz+IyYMakP0nymPuEAGmzBpbYnfMZSkJgIvFUMOtFA/jKvTbVJVmaxUM6Tj4a/ckRV+r4NYnh/kSds1lex0KYqBR0CNKbCVFtNhUEkC3uI4/KFwABPC2t+V4H4oha3RlU2MUy/9FI07AU63rcn//h+1djKBPiNSKOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RKYCS/bs; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::b7; helo=out-183.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RKYCS/bs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b7; helo=out-183.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 545 seconds by postgrey-1.37 at boromir; Thu, 29 Aug 2024 13:48:51 AEST
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvS1v1mLDz2yng
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 13:48:50 +1000 (AEST)
Message-ID: <7c2237bd-c1eb-4cf6-9135-420a321ebd3b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1724902758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n+Lh2vHxUB+86yeUS0d5uwMJVWzCawU4cjiNowF9hs4=;
	b=RKYCS/bs9Fuf2a0LIc6oZEc0Qxnsqv4A/6jg2vqw9A1X/vYr6M0gINoQ8cYiZo68t/9AW/
	7hTk0h0Q3vTIPdKJW1u/PDgjvwFtRiTbiKd6SkCPS50ico497y8yK/zh+jlcuEuMRbqZOL
	GN5HEvWBmr2PiMol50Z18Xh9PnBmcMA=
Date: Thu, 29 Aug 2024 11:39:09 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 02/14] arm: adjust_pte() use pte_offset_map_rw_nolock()
To: David Hildenbrand <david@redhat.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 hughd@google.com, willy@infradead.org, vbabka@kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, vishal.moola@gmail.com,
 peterx@redhat.com, ryan.roberts@arm.com, christophe.leroy2@cs-soprasteria.com
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <7915acf5887e7bf0c5cc71ff30ad2fe8447d005d.1724310149.git.zhengqi.arch@bytedance.com>
 <77f3f5ce-dd12-4ca2-90cd-0f2226fe26ba@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <77f3f5ce-dd12-4ca2-90cd-0f2226fe26ba@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2024/8/26 23:26, David Hildenbrand wrote:
> On 22.08.24 09:13, Qi Zheng wrote:
>> In do_adjust_pte(), we may modify the pte entry. At this time, the write
>> lock of mmap_lock is not held, and the pte_same() check is not performed
>> after the PTL held. The corresponding pmd entry may have been modified
>> concurrently. Therefore, in order to ensure the stability if pmd entry,
>> use pte_offset_map_rw_nolock() to replace pte_offset_map_nolock(), 
>> and do
>> pmd_same() check after holding the PTL.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

>> ---
>>   arch/arm/mm/fault-armv.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
>> index 831793cd6ff94..de6c7d8a2ddfc 100644
>> --- a/arch/arm/mm/fault-armv.c
>> +++ b/arch/arm/mm/fault-armv.c
>> @@ -94,6 +94,7 @@ static int adjust_pte(struct vm_area_struct *vma, 
>> unsigned long address,
>>       pud_t *pud;
>>       pmd_t *pmd;
>>       pte_t *pte;
>> +    pmd_t pmdval;
>>       int ret;
>>         pgd = pgd_offset(vma->vm_mm, address);
>> @@ -112,16 +113,22 @@ static int adjust_pte(struct vm_area_struct 
>> *vma, unsigned long address,
>>       if (pmd_none_or_clear_bad(pmd))
>>           return 0;
>>   +again:
>>       /*
>>        * This is called while another page table is mapped, so we
>>        * must use the nested version.  This also means we need to
>>        * open-code the spin-locking.
>>        */
>> -    pte = pte_offset_map_nolock(vma->vm_mm, pmd, address, &ptl);
>> +    pte = pte_offset_map_rw_nolock(vma->vm_mm, pmd, address, 
>> &pmdval, &ptl);
>>       if (!pte)
>>           return 0;
>>         do_pte_lock(ptl);
>> +    if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
>> +        do_pte_unlock(ptl);
>> +        pte_unmap(pte);
>> +        goto again;
>> +    }
>>         ret = do_adjust_pte(vma, address, pfn, pte);
>
> Looks correct to me, but I wonder why the missing pmd_same check is 
> not an issue so far ... any experts? THP on __LINUX_ARM_ARCH__ < 6 is 
> not really used/possible?

I think it is because it does not support THP.

TRANSPARENT_HUGEPAGE depends on HAVE_ARCH_TRANSPARENT_HUGEPAGE which
depends on ARM_LPAE. However, the Kconfig says ARM_LPAE is only
supported on ARMv7 processor.

config ARM_LPAE
          bool "Support for the Large Physical Address Extension"
          depends on MMU && CPU_32v7 && !CPU_32v6 && !CPU_32v5 && \
                  !CPU_32v4 && !CPU_32v3
          select PHYS_ADDR_T_64BIT
          select SWIOTLB
          help
            Say Y if you have an ARMv7 processor supporting the LPAE page
            table format and you would like to access memory beyond the
            4GB limit. The resulting kernel image will not run on
            processors without the LPA extension.

            If unsure, say N.

Thanks.
>
> Acked-by: David Hildenbrand <david@redhat.com>
>


