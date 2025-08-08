Return-Path: <linuxppc-dev+bounces-10751-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB468B1E31A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Aug 2025 09:21:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bywSw0zrWz3cPM;
	Fri,  8 Aug 2025 17:21:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::224"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754637712;
	cv=none; b=UG7TYOnSMU4/KENiqYWE6kJLJ7cxww/Ss67/oV3PFBYVZH23yioidNwRIoWnbk+V4iUCYFuUwb4j2duOWXzdp3VoQBuLYH0l6daGy9S4cUCTBzjY2+Fecf04lKPP1SuzbcqIId9DbP1w6MCKVMlSJx6tDNJKYy+vwH4dQqDiJqmJf0hLn4sUs4LobEYAg59AI2WCGpKBsR8jZufvpChouXpSQIUioROYq4s5oUYVR0dCRgp3OPvBKTeqnTgKHBsfkSPYCjeTuaSaKJYf0zBKCgZZimkjt/vk6ech72qCYoq8SEFsFDtx4pcWRNOO85e3FQuaQijj50A5T0CmLsdFZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754637712; c=relaxed/relaxed;
	bh=4/QklETFhE/HaMV63Zcte41AoyA4FbhUpoG+hqiHyGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOYH/a3unFsFAV+8LzpKhhctMMFjvntk0HmF0kTFuAIuEIjmiPlpB6yAfYf8447qAHYszhKyRhd8YovAbDe0Ttj10jFKENnV+VClG4VZUR56kablCSVJUimvdEBkIUzwezY+QdgKlt9wp9+zH4yxlP8HtC0SdKVhVSFfdCXShKKRp23cHXGi3+VxYOCXs0r5dJArRHB2B6oEdX3LtDkyMXiim8RyVkvYiEvy2OPOi2t0RKUNhbDkjdNh+9wqRjTNwhDztO+DrWK1psQ0FOL8W6HcENR7nUp2Wt9v9aB+mYg3TOXD/WH8qJ13KicwUEDrlvy3TZOAS79wuPSCLwVMRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org) smtp.mailfrom=ghiti.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ghiti.fr (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bywSs59q2z2xcC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Aug 2025 17:21:49 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37190443D6;
	Fri,  8 Aug 2025 07:21:33 +0000 (UTC)
Message-ID: <7487516c-3eb1-46fa-aed5-6dc72600c952@ghiti.fr>
Date: Fri, 8 Aug 2025 09:21:32 +0200
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
Subject: Re: [PATCH v5 2/2] kasan: call kasan_init_generic in kasan_init
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: ryabinin.a.a@gmail.com, bhe@redhat.com, hca@linux.ibm.com,
 andreyknvl@gmail.com, akpm@linux-foundation.org, zhangqing@loongson.cn,
 chenhuacai@loongson.cn, davidgow@google.co, glider@google.com,
 dvyukov@google.com, agordeev@linux.ibm.com, vincenzo.frascino@arm.com,
 elver@google.com, kasan-dev@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, linux-mm@kvack.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20250807194012.631367-1-snovitoll@gmail.com>
 <20250807194012.631367-3-snovitoll@gmail.com>
 <07ffb27c-3416-43c9-a50a-164a76e5ab60@csgroup.eu>
 <CACzwLxhahYWfRc5xKshayniV6SuFFnMT0NfHttippcASzZgtRw@mail.gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CACzwLxhahYWfRc5xKshayniV6SuFFnMT0NfHttippcASzZgtRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdefudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeduffeugedvtdegleeuhfeuteetueegfeefkefhheffvdduhfegvdehuddukeffgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhinhhfrhgruggvrggurdhorhhgnecukfhppeduleefrdeffedrheejrdduleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudelfedrfeefrdehjedrudelledphhgvlhhopegludelvddrudeikedrvddvrddutddungdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehsnhhovhhithholhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehrhigrsghinhhinhdrrgdrrgesghhmrghilhdrtghomhdprhgtphhtthhopegshhgvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehhtggrsehlihhnuhigr
 dhisghmrdgtohhmpdhrtghpthhtoheprghnughrvgihkhhnvhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopeiihhgrnhhgqhhinhhgsehlohhonhhgshhonhdrtghn
X-GND-Sasl: alex@ghiti.fr
X-Spam-Status: No, score=-0.7 required=3.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 8/8/25 08:44, Sabyrzhan Tasbolatov wrote:
> On Fri, Aug 8, 2025 at 10:07 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>>
>> Le 07/08/2025 à 21:40, Sabyrzhan Tasbolatov a écrit :
>>> Call kasan_init_generic() which handles Generic KASAN initialization.
>>> For architectures that do not select ARCH_DEFER_KASAN,
>>> this will be a no-op for the runtime flag but will
>>> print the initialization banner.
>>>
>>> For SW_TAGS and HW_TAGS modes, their respective init functions will
>>> handle the flag enabling, if they are enabled/implemented.
>>>
>>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
>>> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
>>> Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv
>>> Acked-by: Alexander Gordeev <agordeev@linux.ibm.com> # s390
>>> ---
>>> Changes in v5:
>>> - Unified arch patches into a single one, where we just call
>>>        kasan_init_generic()
>>> - Added Tested-by tag for riscv (tested the same change in v4)
>>> - Added Acked-by tag for s390 (tested the same change in v4)
>>> ---
>>>    arch/arm/mm/kasan_init.c    | 2 +-
>>>    arch/arm64/mm/kasan_init.c  | 4 +---
>>>    arch/riscv/mm/kasan_init.c  | 1 +
>>>    arch/s390/kernel/early.c    | 3 ++-
>>>    arch/x86/mm/kasan_init_64.c | 2 +-
>>>    arch/xtensa/mm/kasan_init.c | 2 +-
>>>    6 files changed, 7 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/arch/arm/mm/kasan_init.c b/arch/arm/mm/kasan_init.c
>>> index 111d4f70313..c6625e808bf 100644
>>> --- a/arch/arm/mm/kasan_init.c
>>> +++ b/arch/arm/mm/kasan_init.c
>>> @@ -300,6 +300,6 @@ void __init kasan_init(void)
>>>        local_flush_tlb_all();
>>>
>>>        memset(kasan_early_shadow_page, 0, PAGE_SIZE);
>>> -     pr_info("Kernel address sanitizer initialized\n");
>>>        init_task.kasan_depth = 0;
>>> +     kasan_init_generic();
>>>    }
>>> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
>>> index d541ce45dae..abeb81bf6eb 100644
>>> --- a/arch/arm64/mm/kasan_init.c
>>> +++ b/arch/arm64/mm/kasan_init.c
>>> @@ -399,14 +399,12 @@ void __init kasan_init(void)
>>>    {
>>>        kasan_init_shadow();
>>>        kasan_init_depth();
>>> -#if defined(CONFIG_KASAN_GENERIC)
>>> +     kasan_init_generic();
>>>        /*
>>>         * Generic KASAN is now fully initialized.
>>>         * Software and Hardware Tag-Based modes still require
>>>         * kasan_init_sw_tags() and kasan_init_hw_tags() correspondingly.
>>>         */
>>> -     pr_info("KernelAddressSanitizer initialized (generic)\n");
>>> -#endif
>>>    }
>>>
>>>    #endif /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
>>> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
>>> index 41c635d6aca..ba2709b1eec 100644
>>> --- a/arch/riscv/mm/kasan_init.c
>>> +++ b/arch/riscv/mm/kasan_init.c
>>> @@ -530,6 +530,7 @@ void __init kasan_init(void)
>>>
>>>        memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
>>>        init_task.kasan_depth = 0;
>>> +     kasan_init_generic();
>> I understood KASAN is really ready to function only once the csr_write()
>> and local_flush_tlb_all() below are done. Shouldn't kasan_init_generic()
>> be called after it ?
> I will try to test this in v6:
>
>          csr_write(CSR_SATP, PFN_DOWN(__pa(swapper_pg_dir)) | satp_mode);
>          local_flush_tlb_all();
>          kasan_init_generic();


Before setting the final kasan mapping, we still have the early one so 
we won't trap or anything on some kasan accesses. But if there is a v6, 
I agree it will be cleaner to do it this ^ way.

Thanks,

Alex


>
> Alexandre Ghiti said [1] it was not a problem, but I will check.
>
> [1] https://lore.kernel.org/all/20c1e656-512e-4424-9d4e-176af18bb7d6@ghiti.fr/
>
>>>        csr_write(CSR_SATP, PFN_DOWN(__pa(swapper_pg_dir)) | satp_mode);
>>>        local_flush_tlb_all();
>>> diff --git a/arch/s390/kernel/early.c b/arch/s390/kernel/early.c
>>> index 9adfbdd377d..544e5403dd9 100644
>>> --- a/arch/s390/kernel/early.c
>>> +++ b/arch/s390/kernel/early.c
>>> @@ -21,6 +21,7 @@
>>>    #include <linux/kernel.h>
>>>    #include <asm/asm-extable.h>
>>>    #include <linux/memblock.h>
>>> +#include <linux/kasan.h>
>>>    #include <asm/access-regs.h>
>>>    #include <asm/asm-offsets.h>
>>>    #include <asm/machine.h>
>>> @@ -65,7 +66,7 @@ static void __init kasan_early_init(void)
>>>    {
>>>    #ifdef CONFIG_KASAN
>>>        init_task.kasan_depth = 0;
>>> -     pr_info("KernelAddressSanitizer initialized\n");
>>> +     kasan_init_generic();
>>>    #endif
>>>    }
>>>
>>> diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
>>> index 0539efd0d21..998b6010d6d 100644
>>> --- a/arch/x86/mm/kasan_init_64.c
>>> +++ b/arch/x86/mm/kasan_init_64.c
>>> @@ -451,5 +451,5 @@ void __init kasan_init(void)
>>>        __flush_tlb_all();
>>>
>>>        init_task.kasan_depth = 0;
>>> -     pr_info("KernelAddressSanitizer initialized\n");
>>> +     kasan_init_generic();
>>>    }
>>> diff --git a/arch/xtensa/mm/kasan_init.c b/arch/xtensa/mm/kasan_init.c
>>> index f39c4d83173..0524b9ed5e6 100644
>>> --- a/arch/xtensa/mm/kasan_init.c
>>> +++ b/arch/xtensa/mm/kasan_init.c
>>> @@ -94,5 +94,5 @@ void __init kasan_init(void)
>>>
>>>        /* At this point kasan is fully initialized. Enable error messages. */
>>>        current->kasan_depth = 0;
>>> -     pr_info("KernelAddressSanitizer initialized\n");
>>> +     kasan_init_generic();
>>>    }
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

