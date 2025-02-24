Return-Path: <linuxppc-dev+bounces-6421-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 558D9A421CC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 14:48:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1hsX6JCZz2ysh;
	Tue, 25 Feb 2025 00:48:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740404928;
	cv=none; b=OpQVpv4bAD9Iio0Y/+h/0ooxQUXCBeL3dVxrDe6IMsLB6YsglwKAt4DughZ4vXdmf0znv2zxkjPoeRIWuLVW2qWC6blo1fNa3cb/fTwCM41kAjtfIb3VH77j9rn0f1Rny1yWuODfvBnMjnw0szX76Fii1XF9BNFqwmh7HBMgn3DzboMnQX0sqVCg8+w+ZLM7gq33Jy7W7gu3lqZ1HSBBLJTClldSgS9xzG9avSIZew01wSlX+7zNIZC4riZooTnY7t35osS2mmn886h2kRNj+dLsXrCOWe83vf/DYcmri/xa/UYm7OeLffqcJjVJVZrRyCyYe6h1PT5OZUYvQZldTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740404928; c=relaxed/relaxed;
	bh=pDq4bowWlNtsbGxlMOQr0ORJvI5CIykp22503yzMS2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HKPkqjuovDnKJ7aTQ7DWc9wLhsu5uLmGfKsfSgubQ6oRMrpjz2RjK9YBvQrtooTJxn23JVfsKcdG6xamE77vc8xa8mAx0nc7RdGtZsjJPzEX2IthDKd1wJa848NIjGbt507KvwkCI2Meh4iMg3iLt+yv5t8PF0Xe55jf+dQDBpKDVrC6xjxoGt3GH/lsEWMx3RCR454Xc6evweOsW5ZPQkkadxbUpjnEwKHe1nBbCW6SMd2Vqz7k5NS9eMAEJ136YX+BjCAHWzG6dwp/SvNEt9RLg31xBz267N35O8B0dvwSyb4XgVvUpm9uwBN5jyxRO11B7wl03gro4Xw3gEMusA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1hsX0HlCz2yPG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 00:48:46 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 990B31515;
	Mon, 24 Feb 2025 05:48:30 -0800 (PST)
Received: from [10.163.40.148] (unknown [10.163.40.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 716D33F5A1;
	Mon, 24 Feb 2025 05:48:07 -0800 (PST)
Message-ID: <acc7eb95-a0d2-4f35-96a8-7a370cc1eff6@arm.com>
Date: Mon, 24 Feb 2025 19:18:02 +0530
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
Subject: Re: [PATCH V2 2/5] arch/powerpc: Drop GENERIC_PTDUMP from
 mpc885_ads_defconfig
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org
Cc: steven.price@arm.com, Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <20250217042220.32920-1-anshuman.khandual@arm.com>
 <20250217042220.32920-3-anshuman.khandual@arm.com>
 <93e96586-13a2-4800-9dc7-5b35177a328e@csgroup.eu>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <93e96586-13a2-4800-9dc7-5b35177a328e@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2/24/25 17:34, Christophe Leroy wrote:
> 
> 
> Le 17/02/2025 à 05:22, Anshuman Khandual a écrit :
>> GENERIC_PTDUMP gets selected on powerpc explicitly and hence can be dropped
>> off from mpc885_ads_defconfig.
>>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> Just wondering - Should CONFIG_PTDUMP_DEBUGFS be added instead ?
> 
> Yes please do that as a fix to commit e084728393a5 ("powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP")

Sure, does the following updated commit message look okay ?

arch/powerpc: Drop GENERIC_PTDUMP from mpc885_ads_defconfig

GENERIC_PTDUMP gets selected on powerpc explicitly and hence can be dropped
off from mpc885_ads_defconfig. Just add CONFIG_PTDUMP_DEBUGFS instead.

Fixes: e084728393a5 ("powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP")
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

> 
>>
>>   arch/powerpc/configs/mpc885_ads_defconfig | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
>> index 77306be62e9e..ea6f836407d2 100644
>> --- a/arch/powerpc/configs/mpc885_ads_defconfig
>> +++ b/arch/powerpc/configs/mpc885_ads_defconfig
>> @@ -78,4 +78,3 @@ CONFIG_DEBUG_VM_PGTABLE=y
>>   CONFIG_DETECT_HUNG_TASK=y
>>   CONFIG_BDI_SWITCH=y
>>   CONFIG_PPC_EARLY_DEBUG=y
>> -CONFIG_GENERIC_PTDUMP=y
> 

