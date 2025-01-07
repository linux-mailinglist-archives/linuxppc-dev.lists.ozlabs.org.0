Return-Path: <linuxppc-dev+bounces-4760-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3AAA03B00
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 10:24:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YS5Gx37bYz30h8;
	Tue,  7 Jan 2025 20:24:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736241881;
	cv=none; b=Qdm5XmEgdHISr+GLs/3AkZ7+0Ev545Zw2adn+B9zMuXfYG3eCKWCu+OP/MySqjbuYNc/FQQE+nc0Gu7AD+3Xi7sZFH+l6MCPJK1bKHNvT83j0a/T/xR/qwcTMoU6hBlD4tAx1AQ7KeY6fck9AOed/YsFySkr7Z1zrCVbFxgzeHAu9nADOk2Q4WPZb9Xarf+Hs0TjHEed0FVJTdO/happMFLyfQBTdGdEwcsPF4ZidE/29CUlzTux7/jhjiHQzPuVsYEgGD95wlpA9Z2k9k7tgh/IDLuX1heiMV1n7cZwZJcNeAcUwMg7ICz9kyKhR2HUGUOVvR6gcWcGuI6nzGYkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736241881; c=relaxed/relaxed;
	bh=B6jA30ID1W/7/7ogTwqiCTGjsVA+UOtm0dKxYnyJ8+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=medLOGiJzdy0vkxd2Gewq8RtULYWPTeJTQeiMpCLQ/ho0cNSkZbxHuClgm4tBhJCZO0DW1vMZccNFpVEcmwiNLFzcUcm8pD9SMEBUgN1+vLGViUk3G2HEPrs+tykqeVy/vitep75BkcG6eebckMiBYep49a3scTPSAqcgHpd7GAKu74SrYrqPb5kOGIb0sTgFVqHeh1NEc/RLYefXq40yfEDa7vdf/2criroP+zMW1R6jgxS97tnZzqHiWtvCxPzrs8H1gdr9rWEI+9akesZaO2ELXEg9qDhIMSrgidaA+O2RdOBwcJYu+K82TotqAYyyyPnbagDrbUtctbh7mPt3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YS5Gv5xBnz30gM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 20:24:37 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADFCE143D;
	Tue,  7 Jan 2025 01:24:31 -0800 (PST)
Received: from [10.57.93.53] (unknown [10.57.93.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96F593F66E;
	Tue,  7 Jan 2025 01:23:54 -0800 (PST)
Message-ID: <83df51a5-5eb9-4470-92a1-e69fd12b98b4@arm.com>
Date: Tue, 7 Jan 2025 10:23:52 +0100
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
Subject: Re: [PATCH v4 07/15] mm: pgtable: introduce pagetable_dtor()
To: Qi Zheng <zhengqi.arch@bytedance.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Cc: peterz@infradead.org, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, akpm@linux-foundation.org, rientjes@google.com,
 vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
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
 <8ada95453180c71b7fca92b9a9f11fa0f92d45a6.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uxwiEhYHDqdTh3@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <e1de887c-6193-48ee-a9b3-04c8a0cdda45@bytedance.com>
 <Z3vOZ18jcCpHIcPD@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <bce4bb4e-459a-44c8-945b-8889149377fd@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <bce4bb4e-459a-44c8-945b-8889149377fd@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 06/01/2025 14:23, Qi Zheng wrote:
> On 2025/1/6 20:36, Alexander Gordeev wrote:
>> On Mon, Jan 06, 2025 at 06:55:58PM +0800, Qi Zheng wrote:
>>>>> +static inline void pagetable_dtor(struct ptdesc *ptdesc)
>>>>> +{
>>>>> +    struct folio *folio = ptdesc_folio(ptdesc);
>>>>> +
>>>>> +    ptlock_free(ptdesc);
>>>>> +    __folio_clear_pgtable(folio);
>>>>> +    lruvec_stat_sub_folio(folio, NR_PAGETABLE);
>>>>> +}
>>>>> +
>>>>
>>>> If I am not mistaken, it is just pagetable_pte_dtor() rename.
>>>> What is the point in moving the code around?
>>>
>>> No, this is to unify pagetable_p*_dtor() into pagetable_dtor(), so
>>> that we can move pagetable_dtor() to __tlb_remove_table(), and then
>>> ptlock and PTE page can be freed together through RCU, which is
>>> also the main purpose of this patch series.
>>
>> I am only talking about this patch. pagetable_dtor() code above is
>> the same pagetable_pte_dtor() below - it is only the function name
>> that changed. So why to move the function body? Anyway, that is
>
> Ah, I just don't want to put pagetable_dtor() in between
> pagetable_pte_ctor() and ___pte_offset_map(), so I moved it above
> pagetable_pte_ctor(). No other special reason. 😉 

I think inserting pagetable_dtor() there makes sense. I wouldn't say
that pagetable_pte_dtor() is being renamed to pagetable_dtor(), because
in fact this patch replaces all of pagetable_{pte,pmd,pud}_dtor() with
pagetable_dtor(), and it is arguably clearer to insert the latter higher
up in mm.h.

FWIW my follow-up series introduces a common __pagetable_dtor(),
inserted below pagetable_ctor() [1].

- Kevin

[1]
https://lore.kernel.org/linux-mm/20250103184415.2744423-2-kevin.brodsky@arm.com/

