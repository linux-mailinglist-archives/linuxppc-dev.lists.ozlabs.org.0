Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 259D82FB61
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 14:02:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45F5mt31cfzDqXS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 22:02:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 45F5lG00hHzDqTL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 22:01:12 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3F10374;
 Thu, 30 May 2019 05:01:09 -0700 (PDT)
Received: from [10.162.40.143] (p8cg001049571a15.blr.arm.com [10.162.40.143])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 B2F953F5AF; Thu, 30 May 2019 05:01:02 -0700 (PDT)
Subject: Re: [RFC] mm: Generalize notify_page_fault()
To: Matthew Wilcox <willy@infradead.org>
References: <1559195713-6956-1-git-send-email-anshuman.khandual@arm.com>
 <20190530110639.GC23461@bombadil.infradead.org>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <4f9a610d-e856-60f6-4467-09e9c3836771@arm.com>
Date: Thu, 30 May 2019 17:31:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190530110639.GC23461@bombadil.infradead.org>
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Russell King <linux@armlinux.org.uk>, Fenghua Yu <fenghua.yu@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrey Konovalov <andreyknvl@google.com>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 05/30/2019 04:36 PM, Matthew Wilcox wrote:
> On Thu, May 30, 2019 at 11:25:13AM +0530, Anshuman Khandual wrote:
>> Similar notify_page_fault() definitions are being used by architectures
>> duplicating much of the same code. This attempts to unify them into a
>> single implementation, generalize it and then move it to a common place.
>> kprobes_built_in() can detect CONFIG_KPROBES, hence notify_page_fault()
>> must not be wrapped again within CONFIG_KPROBES. Trap number argument can
> 
> This is a funny quirk of the English language.  "must not" means "is not
> allowed to be", not "does not have to be".

You are right. Noted for future. Thanks !

> 
>> @@ -141,6 +142,19 @@ static int __init init_zero_pfn(void)
>>  core_initcall(init_zero_pfn);
>>  
>>  
>> +int __kprobes notify_page_fault(struct pt_regs *regs, unsigned int trap)
>> +{
>> +	int ret = 0;
>> +
>> +	if (kprobes_built_in() && !user_mode(regs)) {
>> +		preempt_disable();
>> +		if (kprobe_running() && kprobe_fault_handler(regs, trap))
>> +			ret = 1;
>> +		preempt_enable();
>> +	}
>> +	return ret;
>> +}
>> +
>>  #if defined(SPLIT_RSS_COUNTING)
> 
> Comparing this to the canonical implementation (ie x86), it looks similar.
> 
> static nokprobe_inline int kprobes_fault(struct pt_regs *regs)
> {
>         if (!kprobes_built_in())
>                 return 0;
>         if (user_mode(regs))
>                 return 0;
>         /*
>          * To be potentially processing a kprobe fault and to be allowed to call
>          * kprobe_running(), we have to be non-preemptible.
>          */
>         if (preemptible())
>                 return 0;
>         if (!kprobe_running())
>                 return 0;
>         return kprobe_fault_handler(regs, X86_TRAP_PF);
> }
> 
> The two handle preemption differently.  Why is x86 wrong and this one
> correct?

Here it expects context to be already non-preemptible where as the proposed
generic function makes it non-preemptible with a preempt_[disable|enable]()
pair for the required code section, irrespective of it's present state. Is
not this better ?
