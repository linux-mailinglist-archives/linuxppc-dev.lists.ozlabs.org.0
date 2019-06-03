Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D7C327D9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 06:54:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HN4x3nwFzDqP1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 14:54:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 45HN3k5gtfzDqNF
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 14:53:21 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A87D1341;
 Sun,  2 Jun 2019 21:53:18 -0700 (PDT)
Received: from [10.162.40.144] (p8cg001049571a15.blr.arm.com [10.162.40.144])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 CC0BB3F5AF; Sun,  2 Jun 2019 21:53:11 -0700 (PDT)
Subject: Re: [RFC] mm: Generalize notify_page_fault()
To: Matthew Wilcox <willy@infradead.org>
References: <1559195713-6956-1-git-send-email-anshuman.khandual@arm.com>
 <20190530110639.GC23461@bombadil.infradead.org>
 <4f9a610d-e856-60f6-4467-09e9c3836771@arm.com>
 <20190530133954.GA2024@bombadil.infradead.org>
 <f1995445-d5ab-f292-d26c-809581002184@arm.com>
 <20190531174854.GA31852@bombadil.infradead.org>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <6338fef8-e097-a76e-5c07-455d0d9b6e24@arm.com>
Date: Mon, 3 Jun 2019 10:23:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190531174854.GA31852@bombadil.infradead.org>
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



On 05/31/2019 11:18 PM, Matthew Wilcox wrote:
> On Fri, May 31, 2019 at 02:17:43PM +0530, Anshuman Khandual wrote:
>> On 05/30/2019 07:09 PM, Matthew Wilcox wrote:
>>> On Thu, May 30, 2019 at 05:31:15PM +0530, Anshuman Khandual wrote:
>>>> On 05/30/2019 04:36 PM, Matthew Wilcox wrote:
>>>>> The two handle preemption differently.  Why is x86 wrong and this one
>>>>> correct?
>>>>
>>>> Here it expects context to be already non-preemptible where as the proposed
>>>> generic function makes it non-preemptible with a preempt_[disable|enable]()
>>>> pair for the required code section, irrespective of it's present state. Is
>>>> not this better ?
>>>
>>> git log -p arch/x86/mm/fault.c
>>>
>>> search for 'kprobes'.
>>>
>>> tell me what you think.
>>
>> Are you referring to these following commits
>>
>> a980c0ef9f6d ("x86/kprobes: Refactor kprobes_fault() like kprobe_exceptions_notify()")
>> b506a9d08bae ("x86: code clarification patch to Kprobes arch code")
>>
>> In particular the later one (b506a9d08bae). It explains how the invoking context
>> in itself should be non-preemptible for the kprobes processing context irrespective
>> of whether kprobe_running() or perhaps smp_processor_id() is safe or not. Hence it
>> does not make much sense to continue when original invoking context is preemptible.
>> Instead just bail out earlier. This seems to be making more sense than preempt
>> disable-enable pair. If there are no concerns about this change from other platforms,
>> I will change the preemption behavior in proposed generic function next time around.
> 
> Exactly.
> 
> So, any of the arch maintainers know of a reason they behave differently
> from x86 in this regard?  Or can Anshuman use the x86 implementation
> for all the architectures supporting kprobes?

So the generic notify_page_fault() will be like this.

int __kprobes notify_page_fault(struct pt_regs *regs, unsigned int trap)
{
        int ret = 0;

        /*
         * To be potentially processing a kprobe fault and to be allowed
         * to call kprobe_running(), we have to be non-preemptible.
         */
        if (kprobes_built_in() && !preemptible() && !user_mode(regs)) {
                if (kprobe_running() && kprobe_fault_handler(regs, trap))
                        ret = 1;
        }
        return ret;
}
