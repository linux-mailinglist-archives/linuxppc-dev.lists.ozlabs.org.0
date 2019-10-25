Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D814AE483F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 12:12:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4700KJ62dvzDqbw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 21:12:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4700H32N3SzDqjn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 21:10:20 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4365B28;
 Fri, 25 Oct 2019 03:10:17 -0700 (PDT)
Received: from [10.162.41.137] (p8cg001049571a15.blr.arm.com [10.162.41.137])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 7FC723F6C4; Fri, 25 Oct 2019 03:10:05 -0700 (PDT)
Subject: Re: [PATCH V7] mm/debug: Add tests validating architecture page table
 helpers
To: Christophe Leroy <christophe.leroy@c-s.fr>, Qian Cai <cai@lca.pw>
References: <ccdd4f7a-c7dc-ca10-d30c-0bc05c7136c7@arm.com>
 <69256008-2235-4AF1-A3BA-0146C82CCB93@lca.pw>
 <3cfec421-4006-4159-ca32-313ff5196ff9@c-s.fr>
 <763d58b4-f532-0bba-bf2b-71433ac514fb@arm.com>
 <d811622e-0d35-3bc6-9568-36abc1bee355@c-s.fr>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <78d13292-0cfe-31b6-7a9c-daf7fb7f3d23@arm.com>
Date: Fri, 25 Oct 2019 15:40:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <d811622e-0d35-3bc6-9568-36abc1bee355@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-arm-kernel@lists.infradead.org,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/25/2019 02:22 PM, Christophe Leroy wrote:
> 
> 
> Le 25/10/2019 à 10:24, Anshuman Khandual a écrit :
>>
>>
>> On 10/25/2019 12:41 PM, Christophe Leroy wrote:
>>>
>>>
>>> Le 25/10/2019 à 07:52, Qian Cai a écrit :
>>>>
>>>>
>>>>> On Oct 24, 2019, at 11:45 PM, Anshuman Khandual <Anshuman.Khandual@arm.com> wrote:
>>>>>
>>>>> Nothing specific. But just tested this with x86 defconfig with relevant configs
>>>>> which are required for this test. Not sure if it involved W=1.
>>>>
>>>> No, it will not. It needs to run like,
>>>>
>>>> make W=1 -j 64 2>/tmp/warns
>>>>
>>>
>>> Are we talking about this peace of code ?
>>>
>>> +static unsigned long __init get_random_vaddr(void)
>>> +{
>>> +    unsigned long random_vaddr, random_pages, total_user_pages;
>>> +
>>> +    total_user_pages = (TASK_SIZE - FIRST_USER_ADDRESS) / PAGE_SIZE;
>>> +
>>> +    random_pages = get_random_long() % total_user_pages;
>>> +    random_vaddr = FIRST_USER_ADDRESS + random_pages * PAGE_SIZE;
>>> +
>>> +    WARN_ON((random_vaddr > TASK_SIZE) ||
>>> +        (random_vaddr < FIRST_USER_ADDRESS));
>>> +    return random_vaddr;
>>> +}
>>> +
>>>
>>> ramdom_vaddr is unsigned,
>>> random_pages is unsigned and lower than total_user_pages
>>>
>>> So the max value random_vaddr can get is FIRST_USER_ADDRESS + ((TASK_SIZE - FIRST_USER_ADDRESS - 1) / PAGE_SIZE) * PAGE_SIZE = TASK_SIZE - 1
>>> And the min value random_vaddr can get is FIRST_USER_ADDRESS (that's when random_pages = 0)
>>
>> That's right.
>>
>>>
>>> So the WARN_ON() is just unneeded, isn't it ?
>>
>> It is just a sanity check on possible vaddr values before it's corresponding
>> page table mappings could be created. If it's worth to drop this in favor of
>> avoiding these unwanted warning messages on x86, will go ahead with it as it
>> is not super important.
>>
> 
> But you are checking what ? That the compiler does calculation correctly or what ?

IIRC, probably this was for later if and when the vaddr calculation becomes
dependent on other factors rather than this simple arithmetic involving start
and end of process address space on a platform.

> As mentionned just above, based on the calculation done, what you are testing cannot happen, so I'm having a hard time understanding what kind of sanity check it can be.

You are right.

> 
> Can you give an exemple of a situation which could trigger the warning ?

I was mistaken. We dont need those checks for now, hence will drop them next time.

> 
> Christophe
> 
