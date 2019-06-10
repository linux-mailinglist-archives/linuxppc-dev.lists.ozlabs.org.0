Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABCD3AE2F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 06:36:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45MgLw1QkczDqQN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 14:36:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 45MgK45VDVzDqPC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 14:34:46 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69043337;
 Sun,  9 Jun 2019 21:34:43 -0700 (PDT)
Received: from [10.162.42.131] (p8cg001049571a15.blr.arm.com [10.162.42.131])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 B2CA33F557; Sun,  9 Jun 2019 21:34:31 -0700 (PDT)
Subject: Re: [RFC V3] mm: Generalize and rename notify_page_fault() as
 kprobe_page_fault()
To: Matthew Wilcox <willy@infradead.org>
References: <1559903655-5609-1-git-send-email-anshuman.khandual@arm.com>
 <20190607201202.GA32656@bombadil.infradead.org>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <f1b109a3-ef4c-359c-a124-e219e84a6266@arm.com>
Date: Mon, 10 Jun 2019 10:04:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190607201202.GA32656@bombadil.infradead.org>
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
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@redhat.com>, James Hogan <jhogan@kernel.org>,
 linux-snps-arc@lists.infradead.org, Fenghua Yu <fenghua.yu@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrey Konovalov <andreyknvl@google.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/08/2019 01:42 AM, Matthew Wilcox wrote:
> Before:
> 
>> @@ -46,23 +46,6 @@ kmmio_fault(struct pt_regs *regs, unsigned long addr)
>>  	return 0;
>>  }
>>  
>> -static nokprobe_inline int kprobes_fault(struct pt_regs *regs)
>> -{
>> -	if (!kprobes_built_in())
>> -		return 0;
>> -	if (user_mode(regs))
>> -		return 0;
>> -	/*
>> -	 * To be potentially processing a kprobe fault and to be allowed to call
>> -	 * kprobe_running(), we have to be non-preemptible.
>> -	 */
>> -	if (preemptible())
>> -		return 0;
>> -	if (!kprobe_running())
>> -		return 0;
>> -	return kprobe_fault_handler(regs, X86_TRAP_PF);
>> -}
> 
> After:
> 
>> +++ b/include/linux/kprobes.h
>> @@ -458,4 +458,20 @@ static inline bool is_kprobe_optinsn_slot(unsigned long addr)
>>  }
>>  #endif
>>  
>> +static nokprobe_inline bool kprobe_page_fault(struct pt_regs *regs,
>> +					      unsigned int trap)
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
> Do you really think this is easier to read?
> 
> Why not just move the x86 version to include/linux/kprobes.h, and replace
> the int with bool?

Will just return bool directly without an additional variable here as suggested
before. But for the conditional statement, I guess the proposed one here is more
compact than the x86 one.

> 
> On Fri, Jun 07, 2019 at 04:04:15PM +0530, Anshuman Khandual wrote:
>> Very similar definitions for notify_page_fault() are being used by multiple
>> architectures duplicating much of the same code. This attempts to unify all
>> of them into a generic implementation, rename it as kprobe_page_fault() and
>> then move it to a common header.
> 
> I think this description suffers from having been written for v1 of
> this patch.  It describes what you _did_, but it's not what this patch
> currently _is_.
> 
> Why not something like:
> 
> Architectures which support kprobes have very similar boilerplate around
> calling kprobe_fault_handler().  Use a helper function in kprobes.h to
> unify them, based on the x86 code.
> 
> This changes the behaviour for other architectures when preemption
> is enabled.  Previously, they would have disabled preemption while
> calling the kprobe handler.  However, preemption would be disabled
> if this fault was due to a kprobe, so we know the fault was not due
> to a kprobe handler and can simply return failure.  This behaviour was
> introduced in commit a980c0ef9f6d ("x86/kprobes: Refactor kprobes_fault()
> like kprobe_exceptions_notify()")

Will replace commit message with above.

> 
>>  arch/arm/mm/fault.c      | 24 +-----------------------
>>  arch/arm64/mm/fault.c    | 24 +-----------------------
>>  arch/ia64/mm/fault.c     | 24 +-----------------------
>>  arch/powerpc/mm/fault.c  | 23 ++---------------------
>>  arch/s390/mm/fault.c     | 16 +---------------
>>  arch/sh/mm/fault.c       | 18 ++----------------
>>  arch/sparc/mm/fault_64.c | 16 +---------------
>>  arch/x86/mm/fault.c      | 21 ++-------------------
>>  include/linux/kprobes.h  | 16 ++++++++++++++++
> 
> What about arc and mips?

+ Vineet Gupta <vgupta@synopsys.com> 
+ linux-snps-arc@lists.infradead.org

+ James Hogan <jhogan@kernel.org>
+ Paul Burton <paul.burton@mips.com>
+ Ralf Baechle <ralf@linux-mips.org>
+ linux-mips@vger.kernel.org

Both the above architectures dont call kprobe_fault_handler() from the
page fault context (do_page_fault() to be specific). Though it gets called
from mips kprobe_exceptions_notify (DIE_PAGE_FAULT). Am I missing something
here ?
