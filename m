Return-Path: <linuxppc-dev+bounces-6178-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AE6A357DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 08:26:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvNsQ2RhCz30WS;
	Fri, 14 Feb 2025 18:26:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739518010;
	cv=none; b=Pw7eZ0F64ZjlmEWhvte7vESy7c0OSE2Hc3FeBLR4C+0Jai2RK0TZtRLMxdGrjds7gQxvpbAXoAtJG5FFt45orki3+rR+vaDf8IZtWK35cytDGXCGqLsxGuhRfJZuaqbyxvG6gre/Z2uNbi23rlR1UfX4gP6hyz8+kaQ2NhSu8VyAWe/MdFxHSAJWIEq+vt1ojUhNc0F/ZK5t1TwKREHPxOOsDpeGwFVn/Uk1VgtkeBj6VEobZh+pX8DAuQM8FysS1shi+/3Ia0QWrwHDibGYx1f7cFG0h5HIh6sfI4GBYBhUHgBqhp+K1e+bQ7klU01c8NGcWkXfjLchig7iJtRvvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739518010; c=relaxed/relaxed;
	bh=zSCjFfR20TU7hwUMrS4urDZFjwQFxtUiglQqA7+Ae/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HbW54xcCFFs2dN3nqjRcEnKI8fAiJ12tbi49VBZ8ReoATaenT8wqdGqp2H/E/iXr1OwJy2Ln4N8kRVqtwZW+J8qNiLPyMHVhi6JAgzwxHwGHn+8cptEpNCiQY6kA0PloK7BGpf+fdrBv1NGqekS/91eODBSnKbZave2FzLhCLEjtDNaYgOSxX2d2J6OqMXd/jcgjyOZS2WxHTgG0i/uu8GsoYRNikxxRmbftWls9OoITugA4qUVRtR320ct/81SbiN0VS3In1ZvznrabZtihkEIJA3CeRNYjTs9ks/bnCVrQzBDgJva62udJbc4Hqmt7mv5TA9XPsgBUf2m46pC30w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvNsP5K6mz30WL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 18:26:49 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2A3D113E;
	Thu, 13 Feb 2025 23:26:38 -0800 (PST)
Received: from [10.163.37.128] (unknown [10.163.37.128])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57E413F58B;
	Thu, 13 Feb 2025 23:26:08 -0800 (PST)
Message-ID: <03b042ec-1cb7-4419-8741-c65e74e49d51@arm.com>
Date: Fri, 14 Feb 2025 12:56:01 +0530
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
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Steven Price <steven.price@arm.com>, linux-mm@kvack.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20250213040934.3245750-1-anshuman.khandual@arm.com>
 <20250213040934.3245750-5-anshuman.khandual@arm.com>
 <8e75c5ff-a97b-4a6f-9c8b-ac2598eafe60@arm.com>
 <6e1201a1-60c1-40a3-951f-d603b6341a11@csgroup.eu>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <6e1201a1-60c1-40a3-951f-d603b6341a11@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2/13/25 17:19, Christophe Leroy wrote:
> 
> 
> Le 13/02/2025 à 12:23, Steven Price a écrit :
>> On 13/02/2025 04:09, Anshuman Khandual wrote:
>>> Platforms subscribe into generic ptdump implementation via GENERIC_PTDUMP.
>>> But generic ptdump gets enabled via PTDUMP_CORE. These configs combination
>>> is confusing as they sound very similar and does not differentiate between
>>> platform's feature subscription and feature enablement for ptdump. Rename
>>> the configs as ARCH_HAS_PTDUMP and PTDUMP making it more clear and improve
>>> readability.
>>
>> [...]
>>> diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
>>> index 77306be62e9e..db005618690b 100644
>>> --- a/arch/powerpc/configs/mpc885_ads_defconfig
>>> +++ b/arch/powerpc/configs/mpc885_ads_defconfig
>>> @@ -78,4 +78,4 @@ CONFIG_DEBUG_VM_PGTABLE=y
>>>   CONFIG_DETECT_HUNG_TASK=y
>>>   CONFIG_BDI_SWITCH=y
>>>   CONFIG_PPC_EARLY_DEBUG=y
>>> -CONFIG_GENERIC_PTDUMP=y
>>> +CONFIG_PTDUMP=y
>>
>> I'd suggest dropp this from the defconfig too, just like patch 1 dropped
>> it from debug.config.
>>
> 
> Thanks for spotting that.
> 
> That one is wrong. Was introduced by commit d210ee3fdfe8 ("powerpc/configs: Update config files for removed/renamed symbols") which aimed at fixing commit e084728393a5 ("powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP") but it did it wrong.
> 
> It is CONFIG_PTDUMP_DEBUGFS that is wanted.

Should this replacement be done in the series or would you like it
to be handled in powerpc later ?

