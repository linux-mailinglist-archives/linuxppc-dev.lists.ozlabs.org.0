Return-Path: <linuxppc-dev+bounces-6424-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 920B3A421D4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 14:50:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1hvS1npDz3064;
	Tue, 25 Feb 2025 00:50:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740405028;
	cv=none; b=GEuLJfXP5x3imedch/TnD9Eg9hAbTfoLjhq+NWq+8WiNHbfAzSqnAxDxTvGzsiXyY0Dw40F5ED7i+AwqKkwtTIeU+uKeAwhA72dj/7ySvgFR/H1wHGeS7og6ovH9o7X9rjckcthPFrXE/C1dOpD58buxH74DuLDV6nTpT4BfefQjS43gPEmhL2F/k1YG/G7XD1zOkRTYAuLrgzL87188mPxt8jgpsP0bRfz92cL2HxAZ+AwiNSYvKQWUpRX1/Iw27sfW6yNBDVi4bQVvPz2XdowioFldgveeCbUwax8G3L3Un1fnSiQFe5Greh7Q2OEIb6Yt/mSRDS09QFeIE/K+JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740405028; c=relaxed/relaxed;
	bh=s6Z9zgK/N3a/oWp1pz88cw7urkbX2EqTLSufEFZe38o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLiMYTIGDYRaJy92fQ0DWvE+3gDxCchU+9s4ort30FqDHdfHeU9Uj8Yt6R5HjnuWO5gVIxHeYYUAkIaecR5/DAe49gv2cYYly0fZ3OCShUL0AhERNggpQE+hNd4ws4Gla0CLo8CI0fzvZSitEzykYtpa945cKYyLvMu90/CXGdKdY45YH+2ir2hsaPmKNwmHmf15HrwZ3zaE6bcY290QN8AsG8/iKqtToaSfVWQ2n1oKMp+3kYiGfSghhr0IDJTDkGFmYkhlXTuOM9ZFASpGebJwuD/g6hmVrMzVgyZQfFziduhfqI7i4csPZtAx2011PFpJ3QEtaW7sM+VHl2WbkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1hvR3RpPz305m
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 00:50:27 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3ACCB1515;
	Mon, 24 Feb 2025 05:50:13 -0800 (PST)
Received: from [10.163.40.148] (unknown [10.163.40.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00D913F5A1;
	Mon, 24 Feb 2025 05:49:47 -0800 (PST)
Message-ID: <137a241a-324a-45a9-a60b-d65f27dc4fc2@arm.com>
Date: Mon, 24 Feb 2025 19:19:47 +0530
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
Subject: Re: [PATCH V2 5/5] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org
Cc: steven.price@arm.com, Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>
References: <20250217042220.32920-1-anshuman.khandual@arm.com>
 <20250217042220.32920-6-anshuman.khandual@arm.com>
 <ba5b12e4-850c-445b-a1b1-0dc5f3905dda@csgroup.eu>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <ba5b12e4-850c-445b-a1b1-0dc5f3905dda@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2/24/25 17:31, Christophe Leroy wrote:
> 
> 
> Le 17/02/2025 à 05:22, Anshuman Khandual a écrit :
>> Platforms subscribe into generic ptdump implementation via GENERIC_PTDUMP.
>> But generic ptdump gets enabled via PTDUMP_CORE. These configs combination
>> is confusing as they sound very similar and does not differentiate between
>> platform's feature subscription and feature enablement for ptdump. Rename
>> the configs as ARCH_HAS_PTDUMP and PTDUMP making it more clear and improve
>> readability.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Heiko Carstens <hca@linux.ibm.com>
>> Cc: Vasily Gorbik <gor@linux.ibm.com>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-doc@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: kvmarm@lists.linux.dev
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-riscv@lists.infradead.org
>> Cc: linux-s390@vger.kernel.org
>> Cc: linux-mm@kvack.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 7612c52e9b1e..5aef2aa4103c 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -43,6 +43,7 @@ config RISCV
>>       select ARCH_HAS_PMEM_API
>>       select ARCH_HAS_PREEMPT_LAZY
>>       select ARCH_HAS_PREPARE_SYNC_CORE_CMD
>> +    select ARCH_HAS_PTDUMP
> 
> Is it OK to drop the 'if MMU' from below ?

Sure, will add it back.

> 
>>       select ARCH_HAS_PTE_DEVMAP if 64BIT && MMU
>>       select ARCH_HAS_PTE_SPECIAL
>>       select ARCH_HAS_SET_DIRECT_MAP if MMU
>> @@ -112,7 +113,6 @@ config RISCV
>>       select GENERIC_IRQ_SHOW_LEVEL
>>       select GENERIC_LIB_DEVMEM_IS_ALLOWED
>>       select GENERIC_PCI_IOMAP
>> -    select GENERIC_PTDUMP if MMU
>>       select GENERIC_SCHED_CLOCK
>>       select GENERIC_SMP_IDLE_THREAD
>>       select GENERIC_TIME_VSYSCALL if MMU && 64BIT

