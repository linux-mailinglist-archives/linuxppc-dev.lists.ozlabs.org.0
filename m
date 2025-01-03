Return-Path: <linuxppc-dev+bounces-4615-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4451AA0055A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 08:47:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPbJK05YWz3011;
	Fri,  3 Jan 2025 18:47:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735890432;
	cv=none; b=mPTW840GHOxEQjV5hJybU9u1rWiB3WfbbLXCUgAozgi6MfVu1IxfvA6P1gaMzMkr5taCLkwF4v2ZZKsC6Zahsb/ds5L0wleUWWEhSRyoKO+0/0kWfXabqzymp7JJhtxU9b37JDxXlP84ZIxGmThC7qOgkvukzSNfenOnN95dWrHgB67bynyEWxBIMEpD5WSu8RI7dbiuEOWGwebV+WD+3jwsGXXQCfeAgeZ3oyUQS55SsOD2fENyZgRK0FGk1s3XQeFK1vb7HotkWgp80iRujIJGYKOAEl3QWcF5/r/jetR2FwQQoXEaEFBKvmhEVwH6UwlpPt06N5z9ta0XPUQbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735890432; c=relaxed/relaxed;
	bh=mzXoocIGNPwPKsYdLFaXMb11ojm1vKIwEO1w66c7Yo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5C0EL2pkSLyrdUJYd1uba4948ogdPHU4Koqop3YfyoKfcPPMWzXSsqVYpvGT+ZJRTZ+9W9575Gz4RW+BEVNgU2wyH8ph+fmzAnzLR9V/dfAK8btxvNBhI5LWYBbaGA0B9PSDW8Q2AkGSQWaV+J3zKzibyvnwCiXRM9rFTleOHj7+RypjG61c8pz6MTfQh1rPLkbtw/5jcD0QaCQz4nOHJwckP2lbJTUQhhAa1EtSPKPyTBl1T9EyKe4WbodXA+feIP8a4r39IGFqSuLyYPUcIirPoqDQnUSL3ugcMJS5AZ4DRldEC37trlPSy0b5qXG59DDeQf1JvhuP/dRAgiwzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPbJH3JNfz2yRF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 18:47:09 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21C9D1516;
	Thu,  2 Jan 2025 23:47:05 -0800 (PST)
Received: from [10.57.92.237] (unknown [10.57.92.237])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E1313F6A8;
	Thu,  2 Jan 2025 23:46:28 -0800 (PST)
Message-ID: <d7f079ea-6530-4f92-9cab-bee90b84e2c3@arm.com>
Date: Fri, 3 Jan 2025 08:46:25 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] mm: pgtable: add statistics for P4D level page
 table
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <2fa644e37ab917292f5c342e40fa805aa91afbbd.1735549103.git.zhengqi.arch@bytedance.com>
 <237a3bf6-c24f-4feb-8d3d-bb3beb2fd18e@arm.com>
 <77c202bf-e0a3-45e7-bf8d-eef7903e3c64@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <77c202bf-e0a3-45e7-bf8d-eef7903e3c64@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 03/01/2025 04:53, Qi Zheng wrote:
> On 2025/1/3 00:53, Kevin Brodsky wrote:
>> On 30/12/2024 10:07, Qi Zheng wrote:
>>> diff --git a/arch/riscv/include/asm/pgalloc.h
>>> b/arch/riscv/include/asm/pgalloc.h
>>> index 551d614d3369c..3466fbe2e508d 100644
>>> --- a/arch/riscv/include/asm/pgalloc.h
>>> +++ b/arch/riscv/include/asm/pgalloc.h
>>> @@ -108,8 +108,12 @@ static inline void __pud_free_tlb(struct
>>> mmu_gather *tlb, pud_t *pud,
>>>   static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
>>>                     unsigned long addr)
>>>   {
>>> -    if (pgtable_l5_enabled)
>>> +    if (pgtable_l5_enabled) {
>>> +        struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
>>> +
>>> +        pagetable_p4d_dtor(ptdesc);
>>>           riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
>>
>> Nit: could use the new ptdesc variable here instead of calling
>> virt_to_ptdesc().
>
> Right, but we will remove pagetable_p4d_dtor() in patch #10, so this
> may not matter.

You're right, I missed that. Makes sense not to create a diff that's
reverted later then :)

- Kevin

