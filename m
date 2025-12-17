Return-Path: <linuxppc-dev+bounces-14853-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E84CCC9151
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 18:38:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWgxp4Rmgz30VT;
	Thu, 18 Dec 2025 04:38:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765993102;
	cv=none; b=kNploh+1wRH3o9c4PySYFmotfOt+kCurfB5gkCiiZIul8TeIMf0oIdaxmV+1NeCUZt+MhT1YENEpH7OILQg/X626NA8Od6qUt3RgIEu2b+r2tSwz5bNyiBvLy8RjDtHiqadViiciF8WzxyOQcezGfmiUUYicUzWnQslL8mZ2gFwm0aosfl034qatu4NbH+grKIwquu94KHEVqijr3ll/owLHPcrYqDoTsbJpqRpTrAbniZRTcGtduJoSa37oa++5CiubrbaZyPRVu5jKJ88P+6BeuxUsKOIo6M2HrjOe9dMfVHPrtgTJZuK0oplCKpMogFSfr1Ph1AmQRCAeOmHxgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765993102; c=relaxed/relaxed;
	bh=L6hJBK7unhyp+mHlUYEK5OS3YadK4hJIsPBlB04DdLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3zXzaUQedMrLaIPQmuHttx12OJ8SBPCjfL/tHMGQGTDiVuBMPOpRzMY/VLwl4eT9jOU/Y5U3/yeuw7C23KXccnt3SVdcVP5+p9WJxdWseEK/6H1WoPYbEi8MUSOoSYqDII0/ykQZB6BKUz9qCtpGVCSD8XfVMX74Mt7bTWA7ZVBMxsSio/hywkan2OLNU3gUkXi5MS7trJ7h/VnxYStp5eDWfcgAYQXGamXXR+8IPvHdtRfpBKOFNiaQiJfTlCdjwpXFYLfO91ayptqOb/WGPBb0rUbO7xAyBU2ke5KDK47NtADssDpaBydbq3o/YYsein5PKyg7TiO/ncQ+r5lZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWgxn6yS1z30Tx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 04:38:21 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3639FFEC;
	Wed, 17 Dec 2025 09:37:43 -0800 (PST)
Received: from [10.57.47.3] (unknown [10.57.47.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17F9B3F73F;
	Wed, 17 Dec 2025 09:37:48 -0800 (PST)
Message-ID: <7a26c273-ebe1-4b5a-8d6d-1b81cfa80656@arm.com>
Date: Wed, 17 Dec 2025 18:37:46 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/mm: export symbols for lazy_mmu_mode KUnit tests
To: Andrew Morton <akpm@linux-foundation.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: linux-kernel@vger.kernel.org, Ryan Roberts <ryan.roberts@arm.com>,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
References: <20251216201403.4647a4f9861d3122ee9e90d7@linux-foundation.org>
 <20251217163812.2633648-1-kevin.brodsky@arm.com>
 <878qf1kqg3.ritesh.list@gmail.com>
 <20251217093036.3231f9613ac8f9cf3943357f@linux-foundation.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20251217093036.3231f9613ac8f9cf3943357f@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 17/12/2025 18:30, Andrew Morton wrote:
> On Wed, 17 Dec 2025 22:15:16 +0530 Ritesh Harjani (IBM) <ritesh.list@gmail.com> wrote:
>
>> ../arch/powerpc/mm/book3s64/hash_tlb.c:158:1: error: type defaults to ‘int’ in declaration of ‘EXPORT_SYMBOL_IF_KUNIT’ [-Werror=implicit-int]
>> ../arch/powerpc/mm/book3s64/hash_tlb.c:158:1: error: parameter names (without types) in function declaration [-Werror]
>>   AR      init/built-in.a
>> cc1: all warnings being treated as errors
>> make[6]: *** [../scripts/Makefile.build:287: arch/powerpc/mm/book3s64/hash_tlb.o] Error 1
>> make[5]: *** [../scripts/Makefile.build:556: arch/powerpc/mm/book3s64] Error 2
>>
>>
>> IMO, we will need the following header in hash_tlb.c
>>
>> +#include <kunit/visibility.h>

Ha strange it built fine for me without it... Maybe different config
options.

> Yeah, I already added Ritesh's patch which had this include, so I
> think we're all good now.

Great thanks both!

- Kevin

