Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C4336A10
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 04:35:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45K8sG4KsMzDqfk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 12:35:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 45K8qt4F43zDqcF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 12:34:17 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4CC980D;
 Wed,  5 Jun 2019 19:34:15 -0700 (PDT)
Received: from [10.162.43.122] (p8cg001049571a15.blr.arm.com [10.162.43.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 B0AA13F690; Wed,  5 Jun 2019 19:34:05 -0700 (PDT)
Subject: Re: [RFC V2] mm: Generalize notify_page_fault()
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <1559630046-12940-1-git-send-email-anshuman.khandual@arm.com>
 <87sgsomg91.fsf@concordia.ellerman.id.au>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <6fdf7c1f-822b-22ec-f48c-cc0efc850644@arm.com>
Date: Thu, 6 Jun 2019 08:04:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <87sgsomg91.fsf@concordia.ellerman.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Will Deacon <will.deacon@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrey Konovalov <andreyknvl@google.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/05/2019 04:49 PM, Michael Ellerman wrote:
> Anshuman Khandual <anshuman.khandual@arm.com> writes:
>> Similar notify_page_fault() definitions are being used by architectures
>> duplicating much of the same code. This attempts to unify them into a
>> single implementation, generalize it and then move it to a common place.
>> kprobes_built_in() can detect CONFIG_KPROBES, hence notify_page_fault()
>> need not be wrapped again within CONFIG_KPROBES. Trap number argument can
>> now contain upto an 'unsigned int' accommodating all possible platforms.
> ...
>> diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
>> index 58f69fa..1bc3b18 100644
>> --- a/arch/arm/mm/fault.c
>> +++ b/arch/arm/mm/fault.c
>> @@ -30,28 +30,6 @@
>>  
>>  #ifdef CONFIG_MMU
>>  
>> -#ifdef CONFIG_KPROBES
>> -static inline int notify_page_fault(struct pt_regs *regs, unsigned int fsr)
>> -{
>> -	int ret = 0;
>> -
>> -	if (!user_mode(regs)) {
>> -		/* kprobe_running() needs smp_processor_id() */
>> -		preempt_disable();
>> -		if (kprobe_running() && kprobe_fault_handler(regs, fsr))
>> -			ret = 1;
>> -		preempt_enable();
>> -	}
>> -
>> -	return ret;
>> -}
>> -#else
> 
> You've changed several of the architectures from something like above,
> where it disables preemption around the call into the below:
> 
>> +int __kprobes notify_page_fault(struct pt_regs *regs, unsigned int trap)
>> +{
>> +	int ret = 0;
>> +
>> +	/*
>> +	 * To be potentially processing a kprobe fault and to be allowed
>> +	 * to call kprobe_running(), we have to be non-preemptible.
>> +	 */
>> +	if (kprobes_built_in() && !preemptible() && !user_mode(regs)) {
>> +		if (kprobe_running() && kprobe_fault_handler(regs, trap))
>> +			ret = 1;
>> +	}
>> +	return ret;
>> +}
> 
> Which skips everything if we're preemptible. Is that an equivalent

Right.

> change? If so can you please explain why in more detail.

It is probably not an equivalent change. The following explanation is extracted from
RFC V1 discussions (https://patchwork.kernel.org/patch/10968273/). Will explain the
rational for this behavior change in the commit message next time around.

----------------------------
a980c0ef9f6d ("x86/kprobes: Refactor kprobes_fault() like kprobe_exceptions_notify()")
b506a9d08bae ("x86: code clarification patch to Kprobes arch code")

In particular the later one (b506a9d08bae). It explains how the invoking context
in itself should be non-preemptible for the kprobes processing context irrespective
of whether kprobe_running() or perhaps smp_processor_id() is safe or not. Hence it
does not make much sense to continue when original invoking context is preemptible.
Instead just bail out earlier. This seems to be making more sense than preempt
disable-enable pair. If there are no concerns about this change from other platforms,
I will change the preemption behavior in proposed generic function next time around.
----------------------------

Do you see any concern changing preempt behavior in the x86 way ?

> 
> Also why not have it return bool?

Just that all architectures (except powerpc) had 'int' as return type. But we can
change that to 'bool'.
