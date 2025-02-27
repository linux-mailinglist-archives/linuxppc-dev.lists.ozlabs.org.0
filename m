Return-Path: <linuxppc-dev+bounces-6519-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3942A46FD0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2025 01:07:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3BV41wZzz2xPL;
	Thu, 27 Feb 2025 11:07:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740614828;
	cv=none; b=mHBpsjimX2k2RzUJenn6728PpBm8yIqJTw+syx9/yGj83q/iRf3cStA519TO/MXzW/fQOMpIAUosr+ArcRZHIy72yE+xqxPSqAcTs589VEVecxN726gbQLR0hINZwOMuDyGwhgmpOkr9Rm6EsSGYpBN0xpNq0xMYbWe3lixahcVMasYQy2/WQiF9pVTHBBmhQLkrjxqPTwEcUGGLw4WxlBl9frAJgYQu8r79bkSzVM8fC2hISUVuAoOevDmXFvAk7NyXFA5OIl0OjBm2jMGSsAAGrWk1TWTRl675yErRdKEO90VNMTaXD3+7zKVpSk7TzbduDPuHiu2sd2WyAoyCIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740614828; c=relaxed/relaxed;
	bh=XAQJ9hVbCH22Qcmgm3BpIe9og2DlEBB/bE11Ejk0MI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EweAhJg7w2duL8vmu+WF3lIZbPi4St9r6bXlXS9p/Iz4NM0qu3dhpwnssk50BRRjJLeR+PC+K4/f+sHImH5mkDjmP1axeGSF+gUoj/P3dH0zIFPuwe+OiIIeM3LU5FFarrDEf97vZ1j2zc104iuot5gi1F/TO4Qd5rdNhxF16R7xWNnnZHx94a7pusfAkvfyV3unci2SFXD7JEM3D8h4izlduLcXj1PJi1o0/Qa/2USOR36526td4JjBy9XndrDCPTI+dPUGD/nbRJQBZ2E/6A294l4kCuYctvdOsdibl3hWgcriZ28YozHeGC0KE5Ly47KG0hJZgEQq7mfJAE85vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3BV25hrsz2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2025 11:07:04 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5564812FC;
	Wed, 26 Feb 2025 16:06:48 -0800 (PST)
Received: from [10.163.39.237] (unknown [10.163.39.237])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2DD63F5A1;
	Wed, 26 Feb 2025 16:06:25 -0800 (PST)
Message-ID: <39986b7d-7a82-4f28-9289-5620a2bec2b5@arm.com>
Date: Thu, 27 Feb 2025 05:36:25 +0530
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
Subject: Re: [PATCH V3 5/5] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>
References: <20250226122404.1927473-1-anshuman.khandual@arm.com>
 <20250226122404.1927473-6-anshuman.khandual@arm.com>
 <Z79xK3xJWm0vH5jH@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <Z79xK3xJWm0vH5jH@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

 

On 2/27/25 01:23, Catalin Marinas wrote:
> On Wed, Feb 26, 2025 at 05:54:04PM +0530, Anshuman Khandual wrote:
>> diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
>> index 6cf4aae05219..b2931d1ae0fb 100644
>> --- a/arch/arm64/include/asm/ptdump.h
>> +++ b/arch/arm64/include/asm/ptdump.h
>> @@ -7,7 +7,7 @@
>>  
>>  #include <linux/ptdump.h>
>>  
>> -#ifdef CONFIG_PTDUMP_CORE
>> +#ifdef CONFIG_PTDUMP
> 
> Do we need this #ifdef at all? I haven't tried but usually, if the
> feature is not enabled, the header file on its own should be harmless.

With or without the #ifdef CONFIG_PTDUMP in place here, this does not cause
any build warnings even without CONFIG_PTDUMP enabled. But dropping #ifdef
while renaming the config option itself, might have caused unrelated code
churn. So probably if required we could drop this later on.

> 
> For arm64:
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

