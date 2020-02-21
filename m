Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9987167BD7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 12:16:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48P85p6kx6zDqlQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 22:15:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=amit.kachhap@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 48P5DC4FQKzDqbD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 20:06:13 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2835A31B;
 Fri, 21 Feb 2020 01:06:09 -0800 (PST)
Received: from [10.162.16.116] (a075563-lin.blr.arm.com [10.162.16.116])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 233B23F68F;
 Fri, 21 Feb 2020 01:06:04 -0800 (PST)
Subject: Re: [RESEND PATCH v5 2/5] arm64/crash_core: Export TCR_EL1.T1SZ in
 vmcoreinfo
To: Bhupesh Sharma <bhsharma@redhat.com>, Dave Anderson
 <anderson@redhat.com>, James Morse <james.morse@arm.com>
References: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
 <1575057559-25496-3-git-send-email-bhsharma@redhat.com>
 <63d6e63c-7218-d2dd-8767-4464be83603f@arm.com>
 <af0fd2b0-99db-9d58-bc8d-0dd9d640b1eb@redhat.com>
 <f791e777-781c-86ce-7619-1de3fe3e7b90@arm.com>
 <351975548.1986001.1578682810951.JavaMail.zimbra@redhat.com>
 <04287d60-e99e-631b-c134-d6dc39e6a193@redhat.com>
From: Amit Kachhap <amit.kachhap@arm.com>
Message-ID: <974f3601-25f8-f4e6-43a8-ff4275e9c174@arm.com>
Date: Fri, 21 Feb 2020 14:36:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <04287d60-e99e-631b-c134-d6dc39e6a193@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 21 Feb 2020 22:14:10 +1100
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
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 bhupesh linux <bhupesh.linux@gmail.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Steve Capper <steve.capper@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Bhupesh,

On 1/13/20 5:44 PM, Bhupesh Sharma wrote:
> Hi James,
> 
> On 01/11/2020 12:30 AM, Dave Anderson wrote:
>>
>> ----- Original Message -----
>>> Hi Bhupesh,
>>>
>>> On 25/12/2019 19:01, Bhupesh Sharma wrote:
>>>> On 12/12/2019 04:02 PM, James Morse wrote:
>>>>> On 29/11/2019 19:59, Bhupesh Sharma wrote:
>>>>>> vabits_actual variable on arm64 indicates the actual VA space size,
>>>>>> and allows a single binary to support both 48-bit and 52-bit VA
>>>>>> spaces.
>>>>>>
>>>>>> If the ARMv8.2-LVA optional feature is present, and we are running
>>>>>> with a 64KB page size; then it is possible to use 52-bits of address
>>>>>> space for both userspace and kernel addresses. However, any kernel
>>>>>> binary that supports 52-bit must also be able to fall back to 48-bit
>>>>>> at early boot time if the hardware feature is not present.
>>>>>>
>>>>>> Since TCR_EL1.T1SZ indicates the size offset of the memory region
>>>>>> addressed by TTBR1_EL1 (and hence can be used for determining the
>>>>>> vabits_actual value) it makes more sense to export the same in
>>>>>> vmcoreinfo rather than vabits_actual variable, as the name of the
>>>>>> variable can change in future kernel versions, but the architectural
>>>>>> constructs like TCR_EL1.T1SZ can be used better to indicate intended
>>>>>> specific fields to user-space.
>>>>>>
>>>>>> User-space utilities like makedumpfile and crash-utility, need to
>>>>>> read/write this value from/to vmcoreinfo
>>>>>
>>>>> (write?)
>>>>
>>>> Yes, also write so that the vmcoreinfo from an (crashing) arm64 
>>>> system can
>>>> be used for
>>>> analysis of the root-cause of panic/crash on say an x86_64 host using
>>>> utilities like
>>>> crash-utility/gdb.
>>>
>>> I read this as as "User-space [...] needs to write to vmcoreinfo".
> 
> That's correct. But for writing to vmcore dump in the kdump kernel, we 
> need to read the symbols from the vmcoreinfo in the primary kernel.
> 
>>>>>> for determining if a virtual address lies in the linear map range.
>>>>>
>>>>> I think this is a fragile example. The debugger shouldn't need to know
>>>>> this.
>>>>
>>>> Well that the current user-space utility design, so I am not sure we 
>>>> can
>>>> tweak that too much.
>>>>
>>>>>> The user-space computation for determining whether an address lies in
>>>>>> the linear map range is the same as we have in kernel-space:
>>>>>>
>>>>>>     #define __is_lm_address(addr)    (!(((u64)addr) & 
>>>>>> BIT(vabits_actual -
>>>>>>     1)))
>>>>>
>>>>> This was changed with 14c127c957c1 ("arm64: mm: Flip kernel VA 
>>>>> space"). If
>>>>> user-space
>>>>> tools rely on 'knowing' the kernel memory layout, they must have to
>>>>> constantly be fixed
>>>>> and updated. This is a poor argument for adding this to something that
>>>>> ends up as ABI.
>>>>
>>>> See above. The user-space has to rely on some ABI/guaranteed
>>>> hardware-symbols which can be
>>>> used for 'determining' the kernel memory layout.
>>>
>>> I disagree. Everything and anything in the kernel will change. The 
>>> ABI rules apply to
>>> stuff exposed via syscalls and kernel filesystems. It does not apply 
>>> to kernel internals,
>>> like the memory layout we used yesterday. 14c127c957c1 is a case in 
>>> point.
>>>
>>> A debugger trying to rely on this sort of thing would have to play 
>>> catchup whenever it
>>> changes.
>>
>> Exactly.  That's the whole point.
>>
>> The crash utility and makedumpfile are not in the same league as other 
>> user-space tools.
>> They have always had to "play catchup" precisely because they depend 
>> upon kernel internals,
>> which constantly change.
> 
> I agree with you and DaveA here. Software user-space debuggers are 
> dependent on kernel internals (which can change from time-to-time) and 
> will have to play catch-up (which has been the case since the very start).
> 
> Unfortunately we don't have any clear ABI for software debugging tools - 
> may be something to look for in future.
> 
> A case in point is gdb/kgdb, which still needs to run with KASLR 
> turned-off (nokaslr) for debugging, as it confuses gdb which resolve 
> kernel symbol address from symbol table of vmlinux. But we can 
> work-around the same in makedumpfile/crash by reading the 'kaslr_offset' 
> value. And I have several users telling me now they cannot use gdb on 
> KASLR enabled kernel to debug panics, but can makedumpfile + crash 
> combination to achieve the same.
> 
> So, we should be looking to fix these utilities which are broken since 
> the 52-bit changes for arm64. Accordingly, I will try to send the v6
> soon while incorporating the comments posted on the v5.

Any update on the next v6 version. Since this patch series is fixing the 
current broken kdump so need this series to add some more fields in 
vmcoreinfo for Pointer Authentication work.

Thanks,
Amit Daniel
> 
> Thanks,
> Bhupesh
> 
> 
> 
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
