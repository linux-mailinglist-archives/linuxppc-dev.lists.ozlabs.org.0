Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 124B2369C1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 04:05:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45K8B61tn9zDqhC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 12:05:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 45K88k2pmqzDqXd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 12:03:48 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1A9D80D;
 Wed,  5 Jun 2019 19:03:45 -0700 (PDT)
Received: from [10.162.43.122] (p8cg001049571a15.blr.arm.com [10.162.43.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 519F83F246; Wed,  5 Jun 2019 19:03:37 -0700 (PDT)
Subject: Re: [RFC V2] mm: Generalize notify_page_fault()
To: Matthew Wilcox <willy@infradead.org>
References: <1559630046-12940-1-git-send-email-anshuman.khandual@arm.com>
 <20190604215325.GA2025@bombadil.infradead.org>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <016a4808-527d-7164-b8a0-3173a4ecfa25@arm.com>
Date: Thu, 6 Jun 2019 07:33:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190604215325.GA2025@bombadil.infradead.org>
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
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrey Konovalov <andreyknvl@google.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/05/2019 03:23 AM, Matthew Wilcox wrote:
> On Tue, Jun 04, 2019 at 12:04:06PM +0530, Anshuman Khandual wrote:
>> +++ b/arch/x86/mm/fault.c
>> @@ -46,23 +46,6 @@ kmmio_fault(struct pt_regs *regs, unsigned long addr)
>>  	return 0;
>>  }
>>  
>> -static nokprobe_inline int kprobes_fault(struct pt_regs *regs)
>> -{
> ...
>> -}
> 
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 0e8834a..c5a8dcf 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -1778,6 +1778,7 @@ static inline int pte_devmap(pte_t pte)
>>  }
>>  #endif
>>  
>> +int notify_page_fault(struct pt_regs *regs, unsigned int trap);
> 
> Why is it now out-of-line?  

Did not get it. AFAICS it is the same from last version and does not cross
80 characters limit on that line.

> 
>> +++ b/mm/memory.c
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
>> +
> 
> I would argue this should be in kprobes.h as a static nokprobe_inline.

We can do that. Though it will be a stand alone (not inside #ifdef) as it
already takes care of CONFIG_KPROBES via kprobes_built_in(). Will change
it and in which case the above declaration in mm.h would not be required.
