Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FCA12A8F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Dec 2019 20:03:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47jjCz6H6FzDqLN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Dec 2019 06:03:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-1.mimecast.com; envelope-from=bhsharma@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="ALQngWlD"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47jjB20LmgzDqLC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Dec 2019 06:01:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577300500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vXL6M/v1cLO/JOoBiBUbtLoMBRFpX7bcoPYQWy5enEk=;
 b=ALQngWlDmO/ii2VmzetMGpeTVOBKhx7HcNwzudGgfah68kMcSI/u/pHz4EP15eHSkvHa6h
 4LHhYsH8LWyBu+iaptOSe0FIUqeV92NFwK+XF0vOBfcWBTvzlt6PY1qQtq/SZOExaBZ08h
 LhwW6bHjTzTjrxe075UAAg0ahrm2Drk=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-6LEweYlHNUmDMZH-ORjhWg-1; Wed, 25 Dec 2019 14:01:36 -0500
Received: by mail-pg1-f197.google.com with SMTP id w21so10125385pgf.19
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Dec 2019 11:01:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vXL6M/v1cLO/JOoBiBUbtLoMBRFpX7bcoPYQWy5enEk=;
 b=pM98OTGiXG5FQhPbwTWGDtjmxt7D2i1Nd00V5c+Nvvk0TFt06FGMqKlOXlSBsaTAc0
 bepUCQ8xHxKs516+mq7UY7mWMO7hu+NvLUZ4ckChOevKI47w3/4WAOScfvaZfmpc8gdU
 fE0xClWM56CSIN1L+t37tEWkcg/V0oBudQLpYzWzNn4iOmOUfGfgq3OLe+FobQeueQ9e
 rycoDBUP7jd2QJVxkYR7bJ1kSBOd1bWoIPS4aDvvvRoWsGqVhEe7G2Nj/dVE6iHin5na
 rzoE2M6Q9yjhOxM8Vao2wbT7zklNkgCjqUnUyjMb+I/5N1GKTacWta4O7zcddP2bAYgA
 5wOA==
X-Gm-Message-State: APjAAAWjyR3bmzYlYnuFXswY/lPoET/CieR7GjHykmeWfztm1mW8Nib/
 A7ff+xLn9zujpwdCkSJHJGssvEP/CwSP6GDLbplcfPDVPG9drOr8Iai+96dead+akH656tFuCrV
 odf6nXPXyGMCbpgiWwBMdqj5jQQ==
X-Received: by 2002:a62:1746:: with SMTP id 67mr28390459pfx.45.1577300495264; 
 Wed, 25 Dec 2019 11:01:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqxIwvYJF0Vmy7pc049WdLIXroBQQIkXYRns8gxHAM77TrZXjaETfikXFa/P4h4Wb8/yLyJk/A==
X-Received: by 2002:a62:1746:: with SMTP id 67mr28390426pfx.45.1577300494996; 
 Wed, 25 Dec 2019 11:01:34 -0800 (PST)
Received: from localhost.localdomain ([122.177.237.105])
 by smtp.gmail.com with ESMTPSA id hg11sm7447136pjb.14.2019.12.25.11.01.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Dec 2019 11:01:34 -0800 (PST)
Subject: Re: [RESEND PATCH v5 2/5] arm64/crash_core: Export TCR_EL1.T1SZ in
 vmcoreinfo
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
References: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
 <1575057559-25496-3-git-send-email-bhsharma@redhat.com>
 <63d6e63c-7218-d2dd-8767-4464be83603f@arm.com>
From: Bhupesh Sharma <bhsharma@redhat.com>
Message-ID: <af0fd2b0-99db-9d58-bc8d-0dd9d640b1eb@redhat.com>
Date: Thu, 26 Dec 2019 00:31:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <63d6e63c-7218-d2dd-8767-4464be83603f@arm.com>
Content-Language: en-US
X-MC-Unique: 6LEweYlHNUmDMZH-ORjhWg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-doc@vger.kernel.org,
 Will Deacon <will@kernel.org>, x86@kernel.org, kexec@lists.infradead.org,
 Kazuhito Hagio <k-hagio@ab.jp.nec.com>, Dave Anderson <anderson@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, bhupesh.linux@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Steve Capper <steve.capper@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi James,

On 12/12/2019 04:02 PM, James Morse wrote:
> Hi Bhupesh,
> 
> On 29/11/2019 19:59, Bhupesh Sharma wrote:
>> vabits_actual variable on arm64 indicates the actual VA space size,
>> and allows a single binary to support both 48-bit and 52-bit VA
>> spaces.
>>
>> If the ARMv8.2-LVA optional feature is present, and we are running
>> with a 64KB page size; then it is possible to use 52-bits of address
>> space for both userspace and kernel addresses. However, any kernel
>> binary that supports 52-bit must also be able to fall back to 48-bit
>> at early boot time if the hardware feature is not present.
>>
>> Since TCR_EL1.T1SZ indicates the size offset of the memory region
>> addressed by TTBR1_EL1 (and hence can be used for determining the
>> vabits_actual value) it makes more sense to export the same in
>> vmcoreinfo rather than vabits_actual variable, as the name of the
>> variable can change in future kernel versions, but the architectural
>> constructs like TCR_EL1.T1SZ can be used better to indicate intended
>> specific fields to user-space.
>>
>> User-space utilities like makedumpfile and crash-utility, need to
>> read/write this value from/to vmcoreinfo
> 
> (write?)

Yes, also write so that the vmcoreinfo from an (crashing) arm64 system 
can be used for analysis of the root-cause of panic/crash on say an 
x86_64 host using utilities like crash-utility/gdb.

>> for determining if a virtual address lies in the linear map range.
> 
> I think this is a fragile example. The debugger shouldn't need to know this.

Well that the current user-space utility design, so I am not sure we can 
tweak that too much.

>> The user-space computation for determining whether an address lies in
>> the linear map range is the same as we have in kernel-space:
>>
>>    #define __is_lm_address(addr)	(!(((u64)addr) & BIT(vabits_actual - 1)))
> 
> This was changed with 14c127c957c1 ("arm64: mm: Flip kernel VA space"). If user-space
> tools rely on 'knowing' the kernel memory layout, they must have to constantly be fixed
> and updated. This is a poor argument for adding this to something that ends up as ABI.

See above. The user-space has to rely on some ABI/guaranteed 
hardware-symbols which can be used for 'determining' the kernel memory 
layout.

> I think a better argument is walking the kernel page tables from the core dump.
> Core code's vmcoreinfo exports the location of the kernel page tables, but in the example
> above you can't walk them without knowing how T1SZ was configured.

Sure, both makedumpfile and crash-utility (which walks the kernel page 
tables from the core dump) use this (and similar) information currently 
in the user-space.

> On older kernels, user-space that needs this would have to assume the value it computes
> from VA_BITs (also in vmcoreinfo) is the value in use.

Yes, backward compatibility has been handled in the user-space already.

> ---%<---
>> I have sent out user-space patches for makedumpfile and crash-utility
>> to add features for obtaining vabits_actual value from TCR_EL1.T1SZ (see
>> [0] and [1]).
>>
>> Akashi reported that he was able to use this patchset and the user-space
>> changes to get user-space working fine with the 52-bit kernel VA
>> changes (see [2]).
>>
>> [0]. http://lists.infradead.org/pipermail/kexec/2019-November/023966.html
>> [1]. http://lists.infradead.org/pipermail/kexec/2019-November/024006.html
>> [2]. http://lists.infradead.org/pipermail/kexec/2019-November/023992.html
> ---%<---
> 
> This probably belongs in the cover letter instead of the commit log.

Ok.

> (From-memory: one of vmcore/kcore is virtually addressed, the other physically. Does this
> fix your poblem in both cases?)
> 
> 
>> diff --git a/arch/arm64/kernel/crash_core.c b/arch/arm64/kernel/crash_core.c
>> index ca4c3e12d8c5..f78310ba65ea 100644
>> --- a/arch/arm64/kernel/crash_core.c
>> +++ b/arch/arm64/kernel/crash_core.c
>> @@ -7,6 +7,13 @@
>>   #include <linux/crash_core.h>
>>   #include <asm/memory.h>
> 
> You need to include asm/sysreg.h for read_sysreg(), and asm/pgtable-hwdef.h for the macros
> you added.

Ok. Will check as I did not get any compilation errors without the same 
and build-bot also did not raise a flag for the missing include files.

>> +static inline u64 get_tcr_el1_t1sz(void);

> Why do you need to do this?

Without this I was getting a missing declaration error, while compiling 
the code.

>> +static inline u64 get_tcr_el1_t1sz(void)
>> +{
>> +	return (read_sysreg(tcr_el1) & TCR_T1SZ_MASK) >> TCR_T1SZ_OFFSET;
>> +}
> 
> (We don't modify this one, and its always the same one very CPU, so this is fine.
> This function is only called once when the stringy vmcoreinfo elf_note is created...)

Right.

>>   void arch_crash_save_vmcoreinfo(void)
>>   {
>>   	VMCOREINFO_NUMBER(VA_BITS);
>> @@ -15,5 +22,7 @@ void arch_crash_save_vmcoreinfo(void)
>>   						kimage_voffset);
>>   	vmcoreinfo_append_str("NUMBER(PHYS_OFFSET)=0x%llx\n",
>>   						PHYS_OFFSET);
>> +	vmcoreinfo_append_str("NUMBER(tcr_el1_t1sz)=0x%llx\n",
>> +						get_tcr_el1_t1sz());
> 
> You document the name as being upper-case.
> The two values either values either side are upper-case.
Ok, will fix this in v6. Thanks for your inputs.

>>   	vmcoreinfo_append_str("KERNELOFFSET=%lx\n", kaslr_offset());
>>   }

Thanks,
Bhupesh

