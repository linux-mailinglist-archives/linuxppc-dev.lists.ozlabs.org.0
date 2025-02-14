Return-Path: <linuxppc-dev+bounces-6176-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C40A357C1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 08:20:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvNjs0TnCz30WQ;
	Fri, 14 Feb 2025 18:20:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739517617;
	cv=none; b=eufgktc1p4PpRBGn8Cu5Cpf90QXBh/YmMJoe6KIdpU9vJXPRphFM+Q5NwLJqU4Ov5gt2IiGc1gct3xdjjm9vfq5Hi1RA84rq8xAwCT9PLKYhtZOv65swBcOqdH2r5tRnJwZo3FYCqI6IwmMrhXZzb/o1jbaheK6Q4tz1hxbGqOha2QTfm9mI1IW0lQ9h43je2WfDV0sFe1fzHX8MsK5YmUN1/j86GJ6yFcZEfuMsHnJXPbgVzLFk6j5Uh0ZwSqP4lodpnsWbWjL1BK1xOqPrTTBYuQ3nF01JUsasKpy1+0GaREAO+mGGx15yV0d29vnp6vnx6ziW9wDWu039hFTZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739517617; c=relaxed/relaxed;
	bh=rDpMt5awBq4TY6TUR9KTajb7IJ7XbOB9taLnkbXepMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f+KSjsGz2EDaglhZ4nGxal9XLGtVsADbDB2tzrq5bX3UBhXeTSbG8NKxCDdfSjYulOBLNrBXf8ISVTbeGufWQpet3p+o8VCNpCwzKjzjH0dmulTizL5FDt7xZTOLS8AZ0GSCYpNjLTMCxvju7XZSpOWYv9JkppOmOKs1rNDCVZQI0IuUD7XCKZhjmiTCJreburP2rgkejl26vIMlxxdJZcUKEggdGmU9aU+WvSHiB1jCqxsYmaeD4X6ATxAxk6XhCmvCqfaMHSpumuqtcce5wYr8E2MHxW0AQnLSn+0LPofCRomCp0cmUJkc44X8PZEU3TEHbzB3tqmyTU1F6H2Csw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvNjr2GPmz30WL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 18:20:16 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B87B2113E;
	Thu, 13 Feb 2025 23:20:05 -0800 (PST)
Received: from [10.163.37.128] (unknown [10.163.37.128])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01C283F58B;
	Thu, 13 Feb 2025 23:19:35 -0800 (PST)
Message-ID: <8ebbc47f-c56a-49a0-bf04-930b0a9e84e8@arm.com>
Date: Fri, 14 Feb 2025 12:49:33 +0530
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
Subject: Re: [PATCH 4/4] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Steven Price <steven.price@arm.com>, linux-mm@kvack.org
Cc: christophe.leroy@csgroup.eu, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20250213040934.3245750-1-anshuman.khandual@arm.com>
 <20250213040934.3245750-5-anshuman.khandual@arm.com>
 <8e75c5ff-a97b-4a6f-9c8b-ac2598eafe60@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <8e75c5ff-a97b-4a6f-9c8b-ac2598eafe60@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2/13/25 16:53, Steven Price wrote:
> On 13/02/2025 04:09, Anshuman Khandual wrote:
>> Platforms subscribe into generic ptdump implementation via GENERIC_PTDUMP.
>> But generic ptdump gets enabled via PTDUMP_CORE. These configs combination
>> is confusing as they sound very similar and does not differentiate between
>> platform's feature subscription and feature enablement for ptdump. Rename
>> the configs as ARCH_HAS_PTDUMP and PTDUMP making it more clear and improve
>> readability.
> 
> I'm not going to bikeshed over the naming, but a few points below.
> 
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
>>  Documentation/arch/arm64/ptdump.rst       |  4 ++--
>>  arch/arm64/Kconfig                        |  2 +-
>>  arch/arm64/include/asm/ptdump.h           |  4 ++--
>>  arch/arm64/kvm/Kconfig                    |  4 ++--
>>  arch/arm64/mm/Makefile                    |  2 +-
>>  arch/powerpc/Kconfig                      |  2 +-
>>  arch/powerpc/configs/mpc885_ads_defconfig |  2 +-
>>  arch/powerpc/mm/Makefile                  |  2 +-
>>  arch/riscv/Kconfig                        |  2 +-
>>  arch/riscv/mm/Makefile                    |  2 +-
>>  arch/s390/Kconfig                         |  2 +-
>>  arch/s390/mm/Makefile                     |  2 +-
>>  arch/x86/Kconfig                          |  2 +-
>>  arch/x86/Kconfig.debug                    |  2 +-
>>  arch/x86/mm/Makefile                      |  2 +-
>>  mm/Kconfig.debug                          | 12 ++++++------
>>  mm/Makefile                               |  2 +-
>>  17 files changed, 25 insertions(+), 25 deletions(-)
>>
>> diff --git a/Documentation/arch/arm64/ptdump.rst b/Documentation/arch/arm64/ptdump.rst
>> index 5dcfc5d7cddf..a2e527377da3 100644
>> --- a/Documentation/arch/arm64/ptdump.rst
>> +++ b/Documentation/arch/arm64/ptdump.rst
>> @@ -22,8 +22,8 @@ offlining of memory being accessed by the ptdump code.
>>  In order to dump the kernel page tables, enable the following
>>  configurations and mount debugfs::
>>  
>> - CONFIG_GENERIC_PTDUMP=y
>> - CONFIG_PTDUMP_CORE=y
>> + CONFIG_ARCH_HAS_PTDUMP=y
>> + CONFIG_PTDUMP=y
>>   CONFIG_PTDUMP_DEBUGFS=y
> 
> I think we should drop CONFIG_GENERIC_PTDUMP/CONFIG_ARCH_HAS_PTDUMP from
> this list. It's not a user-selectable symbol so there's no need to be
> documenting it here.

Sure, will fold that in here.

> 
>>  
>>   mount -t debugfs nodev /sys/kernel/debug
> [...]
>> diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
>> index 77306be62e9e..db005618690b 100644
>> --- a/arch/powerpc/configs/mpc885_ads_defconfig
>> +++ b/arch/powerpc/configs/mpc885_ads_defconfig
>> @@ -78,4 +78,4 @@ CONFIG_DEBUG_VM_PGTABLE=y
>>  CONFIG_DETECT_HUNG_TASK=y
>>  CONFIG_BDI_SWITCH=y
>>  CONFIG_PPC_EARLY_DEBUG=y
>> -CONFIG_GENERIC_PTDUMP=y
>> +CONFIG_PTDUMP=y
> 
> I'd suggest dropp this from the defconfig too, just like patch 1 dropped
> it from debug.config.

Agreed.

