Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2AB551AC3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 15:33:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRVvk2n6dz3cgX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 23:33:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRVvK1wxhz3bmV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 23:32:44 +1000 (AEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LRVtX61X4zDqq3;
	Mon, 20 Jun 2022 21:32:04 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 20 Jun 2022 21:32:36 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 20 Jun 2022 21:32:34 +0800
Message-ID: <09c8f2ce-7cfb-6653-6e44-c509d588bdc1@huawei.com>
Date: Mon, 20 Jun 2022 21:32:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v5 2/8] arm64: extable: make uaaccess helper use
 extable type EX_TYPE_UACCESS_ERR_ZERO
To: Mark Rutland <mark.rutland@arm.com>
References: <20220528065056.1034168-1-tongtiangen@huawei.com>
 <20220528065056.1034168-3-tongtiangen@huawei.com>
 <Yqw6TP3MhEqnQ+2o@FVFF77S0Q05N>
 <4371a7c9-8766-9fee-2558-e6f43f06ad19@huawei.com>
 <0da734f3-5743-3df3-3f90-d92e5bd585ce@huawei.com>
 <Yq3HoUyEcnKKk1AY@FVFF77S0Q05N>
 <684f0362-6e58-753d-32e1-112c6ffe6d12@huawei.com>
 <YrA5f44hySky8v5g@FVFF77S0Q05N>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <YrA5f44hySky8v5g@FVFF77S0Q05N>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, Guohanjun <guohanjun@huawei.com>, Will Deacon <will@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Ingo
 Molnar <mingo@redhat.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Xie XiuQi <xiexiuqi@huawei.com>, Borislav Petkov <bp@alien8.de>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2022/6/20 17:10, Mark Rutland 写道:
> On Mon, Jun 20, 2022 at 10:59:12AM +0800, Tong Tiangen wrote:
>> 在 2022/6/18 20:40, Mark Rutland 写道:
>>> On Sat, Jun 18, 2022 at 04:42:06PM +0800, Tong Tiangen wrote:
>>>>>>> diff --git a/arch/arm64/include/asm/asm-extable.h
>>>>>>> b/arch/arm64/include/asm/asm-extable.h
>>>>>>> index 56ebe183e78b..9c94ac1f082c 100644
>>>>>>> --- a/arch/arm64/include/asm/asm-extable.h
>>>>>>> +++ b/arch/arm64/include/asm/asm-extable.h
>>>>>>> @@ -28,6 +28,14 @@
>>>>>>>         __ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_FIXUP, 0)
>>>>>>>         .endm
>>>>>>> +/*
>>>>>>> + * Create an exception table entry for uaccess `insn`, which
>>>>>>> will branch to `fixup`
>>>>>>> + * when an unhandled fault is taken.
>>>>>>> + * ex->data = ~0 means both reg_err and reg_zero is set to wzr(x31).
>>>>>>> + */
>>>>>>> +    .macro          _asm_extable_uaccess, insn, fixup
>>>>>>> +    __ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_UACCESS_ERR_ZERO, ~0)
>>>>>>> +    .endm
>>>>>>
>>>>>> I'm not too keen on using `~0` here, since that also sets other bits
>>>>>> in the
>>>>>> data field, and its somewhat opaque.
>>>>>>
>>>>>> How painful is it to generate the data fields as with the C version
>>>>>> of this
>>>>>> macro, so that we can pass in wzr explciitly for the two sub-fields?
>>>>>>
>>>>>> Other than that, this looks good to me.
>>>>>>
>>>>>> Thanks,
>>>>>> Mark.
>>>>>
>>>>> ok, will fix next version.
>>>>>
>>>>> Thanks,
>>>>> Tong.
>>>>
>>>> I tried to using data filelds as with C version, but here assembly code we
>>>> can not using operator such as << and |, if we use lsl and orr instructions,
>>>> the gpr will be occupied.
>>>>
>>>> So how about using 0x3ff directly here? it means err register and zero
>>>> register both set to x31.
>>>
>>> I had a go at implementing this, and it seems simple enough. Please see:
>>>
>>>     https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/extable/asm-uaccess
>>>
>>
>> I made the following modifications, and the other parts are based on your
>> implementation:
>>
>> arch/arm64/include/asm/asm-extable.h
>> [...]
>> .macro          _asm_extable_uaccess, insn, fixup
>> _ASM_EXTABLE_UACCESS(\insn, \fixup)
>> .endm
>> [...]
> 
> I also made this same change locally when testing, and building with GCC 11.1.0
> or LLVM 14.0.0 I am not seeing any problem when building, and the result is as
> expected:
> 
> | [mark@lakrids:~/src/linux]% usekorg 11.1.0 make ARCH=arm64 CROSS_COMPILE=aarch64-linux- defconfig
> | *** Default configuration is based on 'defconfig'
> | #
> | # No change to .config
> | #
> | [mark@lakrids:~/src/linux]% usekorg 11.1.0 make ARCH=arm64 CROSS_COMPILE=aarch64-linux- -j50 arch/arm64/lib/
> |   CALL    scripts/atomic/check-atomics.sh
> |   CC      arch/arm64/kernel/asm-offsets.s
> |   CALL    scripts/checksyscalls.sh
> |   AS      arch/arm64/kernel/vdso/note.o
> |   AS      arch/arm64/kernel/vdso/sigreturn.o
> |   LD      arch/arm64/kernel/vdso/vdso.so.dbg
> |   VDSOSYM include/generated/vdso-offsets.h
> |   OBJCOPY arch/arm64/kernel/vdso/vdso.so
> | make[2]: Nothing to be done for 'arch/arm64/lib/'.
> |   AS      arch/arm64/lib/clear_page.o
> |   AS      arch/arm64/lib/clear_user.o
> |   AS      arch/arm64/lib/copy_from_user.o
> |   AS      arch/arm64/lib/copy_page.o
> |   AS      arch/arm64/lib/copy_to_user.o
> |   CC      arch/arm64/lib/csum.o
> |   CC      arch/arm64/lib/delay.o
> |   AS      arch/arm64/lib/memchr.o
> |   AS      arch/arm64/lib/memcmp.o
> |   AS      arch/arm64/lib/memcpy.o
> |   AS      arch/arm64/lib/memset.o
> |   AS      arch/arm64/lib/strchr.o
> |   AS      arch/arm64/lib/strcmp.o
> |   AS      arch/arm64/lib/strlen.o
> |   AS      arch/arm64/lib/strncmp.o
> |   AS      arch/arm64/lib/strnlen.o
> |   AS      arch/arm64/lib/strrchr.o
> |   AS      arch/arm64/lib/tishift.o
> |   AS      arch/arm64/lib/crc32.o
> |   AS      arch/arm64/lib/mte.o
> |   CC [M]  arch/arm64/lib/xor-neon.o
> |   AR      arch/arm64/lib/built-in.a
> |   AR      arch/arm64/lib/lib.a
> | [mark@lakrids:~/src/linux]% usekorg 12.1.0 aarch64-linux-objdump -j __ex_table -D arch/arm64/lib/clear_user.o
> |
> | arch/arm64/lib/clear_user.o:     file format elf64-littleaarch64
> |
> |
> | Disassembly of section __ex_table:
> |
> | 0000000000000000 <__ex_table>:
> |         ...
> |    8:   03ff0003        .inst   0x03ff0003 ; undefined
> |         ...
> |   14:   03ff0003        .inst   0x03ff0003 ; undefined
> |         ...
> |   20:   03ff0003        .inst   0x03ff0003 ; undefined
> |         ...
> |   2c:   03ff0003        .inst   0x03ff0003 ; undefined
> |         ...
> |   38:   03ff0003        .inst   0x03ff0003 ; undefined
> |         ...
> |   44:   03ff0003        .inst   0x03ff0003 ; undefined
> 
>> The following errors are reported during compilation:
>> [...]
>> arch/arm64/lib/clear_user.S:45: Error: invalid operands (*ABS* and *UND*
>> sections) for `<<'
>> [...]
> 
> As above, I'm not seeing this.
> 
> This suggests that the EX_DATA_REG() macro is going wrong somehow. Assuming the
> operand types correspond to the LHS and RHS of the expression, this would mean
> the GPR number is defined, but the REG value is not, and I can't currently see
> how that can happen.
> 
>> "<<" is invalid operands in assembly, is there something wrong with me?
> 
> At the moment I can only assume there is a local problem. I'd suspect a typo
> somewhere, but maybe you have a toolchain which behaves differently?
> 
> Thanks,
> Mark.

My gcc version is 9.4.0, let me try your gcc version first.

Thanks,
Tong.
> .
