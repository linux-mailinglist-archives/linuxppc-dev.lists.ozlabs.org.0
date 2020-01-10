Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 190DE137639
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 19:41:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vWyf2QpYzDqjZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2020 05:40:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=james.morse@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 47vWwd6DtvzDqgl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2020 05:39:11 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED92330E;
 Fri, 10 Jan 2020 10:39:09 -0800 (PST)
Received: from [10.1.196.105] (eglon.cambridge.arm.com [10.1.196.105])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2C323F6C4;
 Fri, 10 Jan 2020 10:39:06 -0800 (PST)
Subject: Re: [RESEND PATCH v5 2/5] arm64/crash_core: Export TCR_EL1.T1SZ in
 vmcoreinfo
To: Bhupesh Sharma <bhsharma@redhat.com>
References: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
 <1575057559-25496-3-git-send-email-bhsharma@redhat.com>
 <63d6e63c-7218-d2dd-8767-4464be83603f@arm.com>
 <af0fd2b0-99db-9d58-bc8d-0dd9d640b1eb@redhat.com>
From: James Morse <james.morse@arm.com>
Message-ID: <f791e777-781c-86ce-7619-1de3fe3e7b90@arm.com>
Date: Fri, 10 Jan 2020 18:39:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <af0fd2b0-99db-9d58-bc8d-0dd9d640b1eb@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-doc@vger.kernel.org,
 Will Deacon <will@kernel.org>, x86@kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 Dave Anderson <anderson@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 bhupesh.linux@gmail.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Steve Capper <steve.capper@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Bhupesh,

On 25/12/2019 19:01, Bhupesh Sharma wrote:
> On 12/12/2019 04:02 PM, James Morse wrote:
>> On 29/11/2019 19:59, Bhupesh Sharma wrote:
>>> vabits_actual variable on arm64 indicates the actual VA space size,
>>> and allows a single binary to support both 48-bit and 52-bit VA
>>> spaces.
>>>
>>> If the ARMv8.2-LVA optional feature is present, and we are running
>>> with a 64KB page size; then it is possible to use 52-bits of address
>>> space for both userspace and kernel addresses. However, any kernel
>>> binary that supports 52-bit must also be able to fall back to 48-bit
>>> at early boot time if the hardware feature is not present.
>>>
>>> Since TCR_EL1.T1SZ indicates the size offset of the memory region
>>> addressed by TTBR1_EL1 (and hence can be used for determining the
>>> vabits_actual value) it makes more sense to export the same in
>>> vmcoreinfo rather than vabits_actual variable, as the name of the
>>> variable can change in future kernel versions, but the architectural
>>> constructs like TCR_EL1.T1SZ can be used better to indicate intended
>>> specific fields to user-space.
>>>
>>> User-space utilities like makedumpfile and crash-utility, need to
>>> read/write this value from/to vmcoreinfo
>>
>> (write?)
> 
> Yes, also write so that the vmcoreinfo from an (crashing) arm64 system can be used for
> analysis of the root-cause of panic/crash on say an x86_64 host using utilities like
> crash-utility/gdb.

I read this as as "User-space [...] needs to write to vmcoreinfo".


>>> for determining if a virtual address lies in the linear map range.
>>
>> I think this is a fragile example. The debugger shouldn't need to know this.
> 
> Well that the current user-space utility design, so I am not sure we can tweak that too much.
> 
>>> The user-space computation for determining whether an address lies in
>>> the linear map range is the same as we have in kernel-space:
>>>
>>>    #define __is_lm_address(addr)    (!(((u64)addr) & BIT(vabits_actual - 1)))
>>
>> This was changed with 14c127c957c1 ("arm64: mm: Flip kernel VA space"). If user-space
>> tools rely on 'knowing' the kernel memory layout, they must have to constantly be fixed
>> and updated. This is a poor argument for adding this to something that ends up as ABI.
> 
> See above. The user-space has to rely on some ABI/guaranteed hardware-symbols which can be
> used for 'determining' the kernel memory layout.

I disagree. Everything and anything in the kernel will change. The ABI rules apply to
stuff exposed via syscalls and kernel filesystems. It does not apply to kernel internals,
like the memory layout we used yesterday. 14c127c957c1 is a case in point.

A debugger trying to rely on this sort of thing would have to play catchup whenever it
changes.

I'm looking for a justification that isn't paper-thin. Putting 'for guessing the memory
map' in the commit message gives the impression we can support that.


>> I think a better argument is walking the kernel page tables from the core dump.
>> Core code's vmcoreinfo exports the location of the kernel page tables, but in the example
>> above you can't walk them without knowing how T1SZ was configured.
> 
> Sure, both makedumpfile and crash-utility (which walks the kernel page tables from the
> core dump) use this (and similar) information currently in the user-space.

[...]

>> (From-memory: one of vmcore/kcore is virtually addressed, the other physically. Does this
>> fix your poblem in both cases?)
>>
>>
>>> diff --git a/arch/arm64/kernel/crash_core.c b/arch/arm64/kernel/crash_core.c
>>> index ca4c3e12d8c5..f78310ba65ea 100644
>>> --- a/arch/arm64/kernel/crash_core.c
>>> +++ b/arch/arm64/kernel/crash_core.c
>>> @@ -7,6 +7,13 @@
>>>   #include <linux/crash_core.h>
>>>   #include <asm/memory.h>
>>
>> You need to include asm/sysreg.h for read_sysreg(), and asm/pgtable-hwdef.h for the macros
>> you added.
> 
> Ok. Will check as I did not get any compilation errors without the same and build-bot also
> did not raise a flag for the missing include files.

Don't trust the header jungle!


>>> +static inline u64 get_tcr_el1_t1sz(void);
> 
>> Why do you need to do this?
> 
> Without this I was getting a missing declaration error, while compiling the code.

Missing declaration?

>>> +static inline u64 get_tcr_el1_t1sz(void)
>>> +{
>>> +    return (read_sysreg(tcr_el1) & TCR_T1SZ_MASK) >> TCR_T1SZ_OFFSET;
>>> +}

Here it is! (I must be going mad...)


Thanks,

James
