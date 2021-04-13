Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADCD35D4AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 03:08:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FK6tb3s7Wz3c1b
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 11:08:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FK6tG18W9z2xy3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 11:08:20 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7EB5106F;
 Mon, 12 Apr 2021 18:08:16 -0700 (PDT)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB2793F792;
 Mon, 12 Apr 2021 18:08:11 -0700 (PDT)
Subject: Re: [PATCH V2 4/6] mm: Drop redundant
 ARCH_ENABLE_[HUGEPAGE|THP]_MIGRATION
To: Oscar Salvador <osalvador@suse.de>
References: <1617259448-22529-1-git-send-email-anshuman.khandual@arm.com>
 <1617259448-22529-5-git-send-email-anshuman.khandual@arm.com>
 <20210412115952.GC27818@linux>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <3ae8627b-68dc-8a86-fbf0-5e65e25ebffb@arm.com>
Date: Tue, 13 Apr 2021 06:38:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210412115952.GC27818@linux>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Catalin Marinas <catalin.marinas@arm.com>,
 akpm@linux-foundation.org, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/12/21 5:29 PM, Oscar Salvador wrote:
> On Thu, Apr 01, 2021 at 12:14:06PM +0530, Anshuman Khandual wrote:
>> ARCH_ENABLE_[HUGEPAGE|THP]_MIGRATION configs have duplicate definitions on
>> platforms that subscribe them. Drop these reduntant definitions and instead
>> just select them appropriately.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: "H. Peter Anvin" <hpa@zytor.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: x86@kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-mm@kvack.org
>> Cc: linux-kernel@vger.kernel.org
>> Acked-by: Catalin Marinas <catalin.marinas@arm.com> (arm64)
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> Hi Anshuman, 
> 
> X86 needs fixing, see below:
> 
>> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>> index 503d8b2e8676..10702ef1eb57 100644
>> --- a/arch/x86/Kconfig
>> +++ b/arch/x86/Kconfig
>> @@ -60,8 +60,10 @@ config X86
>>  	select ACPI_SYSTEM_POWER_STATES_SUPPORT	if ACPI
>>  	select ARCH_32BIT_OFF_T			if X86_32
>>  	select ARCH_CLOCKSOURCE_INIT
>> +	select ARCH_ENABLE_HUGEPAGE_MIGRATION if x86_64 && HUGETLB_PAGE && MIGRATION
>>  	select ARCH_ENABLE_MEMORY_HOTPLUG if X86_64 || (X86_32 && HIGHMEM)
>>  	select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
>> +	select ARCH_ENABLE_THP_MIGRATION if x86_64 && TRANSPARENT_HUGEPAGE
> 
> you need s/x86_64/X86_64/, otherwise we are left with no migration :-)

Ahh, right. I guess this could not have got detected during a build test.
As the series is in mmotm tree, wondering if Andrew could help fix these
typos in this patch.
