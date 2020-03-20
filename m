Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A79A218C759
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 07:18:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kD9C30B8zDrQR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 17:18:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=yanaijie@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kD7J4pJwzDrNr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 17:16:23 +1100 (AEDT)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3C57286598A0FBBAB9AA;
 Fri, 20 Mar 2020 14:16:16 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.195) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0;
 Fri, 20 Mar 2020 14:16:06 +0800
Subject: Re: [PATCH v4 0/6] implement KASLR for powerpc/fsl_booke/64
To: Daniel Axtens <dja@axtens.net>, <mpe@ellerman.id.au>,
 <linuxppc-dev@lists.ozlabs.org>, <diana.craciun@nxp.com>,
 <christophe.leroy@c-s.fr>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <npiggin@gmail.com>, <keescook@chromium.org>,
 <kernel-hardening@lists.openwall.com>, <oss@buserror.net>
References: <20200306064033.3398-1-yanaijie@huawei.com>
 <87imizww4i.fsf@dja-thinkpad.axtens.net>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <6546b653-c7d6-41cf-3954-0587600127e3@huawei.com>
Date: Fri, 20 Mar 2020 14:16:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <87imizww4i.fsf@dja-thinkpad.axtens.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.221.195]
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
Cc: linux-kernel@vger.kernel.org, zhaohongjiang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2020/3/20 11:19, Daniel Axtens 写道:
> Hi Jason,
> 
> I tried to compile this series and got the following error:
> 
> /home/dja/dev/linux/linux/arch/powerpc/mm/nohash/kaslr_booke.c: In function ‘kaslr_early_init’:
> /home/dja/dev/linux/linux/arch/powerpc/mm/nohash/kaslr_booke.c:357:33: error: ‘linear_sz’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    357 |  regions.pa_end = memstart_addr + linear_sz;
>        |                   ~~~~~~~~~~~~~~^~~~~~~~~~~
> /home/dja/dev/linux/linux/arch/powerpc/mm/nohash/kaslr_booke.c:317:21: note: ‘linear_sz’ was declared here
>    317 |  unsigned long ram, linear_sz;
>        |                     ^~~~~~~~~
> /home/dja/dev/linux/linux/arch/powerpc/mm/nohash/kaslr_booke.c:187:8: error: ‘ram’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    187 |  ret = parse_crashkernel(boot_command_line, size, &crash_size,
>        |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    188 |     &crash_base);
>        |     ~~~~~~~~~~~~
> /home/dja/dev/linux/linux/arch/powerpc/mm/nohash/kaslr_booke.c:317:16: note: ‘ram’ was declared here
>    317 |  unsigned long ram, linear_sz;
>        |                ^~~
> cc1: all warnings being treated as errors
> make[4]: *** [/home/dja/dev/linux/linux/scripts/Makefile.build:268: arch/powerpc/mm/nohash/kaslr_booke.o] Error 1
> make[3]: *** [/home/dja/dev/linux/linux/scripts/Makefile.build:505: arch/powerpc/mm/nohash] Error 2
> make[2]: *** [/home/dja/dev/linux/linux/scripts/Makefile.build:505: arch/powerpc/mm] Error 2
> make[2]: *** Waiting for unfinished jobs....
> 
> I have attached my .config file.
> 

Thanks Daniel,

My config had CC_DISABLE_WARN_MAYBE_UNINITIALIZED=y enabled so I missed 
this warning. I will fix it.

Thanks again.

Jason

> I'm using
> powerpc64-linux-gnu-gcc (Ubuntu 9.2.1-9ubuntu1) 9.2.1 20191008
> 
> Regards,
> Daniel
> 
> 
> 
> 
>> This is a try to implement KASLR for Freescale BookE64 which is based on
>> my earlier implementation for Freescale BookE32:
>> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=131718&state=*
>>
>> The implementation for Freescale BookE64 is similar as BookE32. One
>> difference is that Freescale BookE64 set up a TLB mapping of 1G during
>> booting. Another difference is that ppc64 needs the kernel to be
>> 64K-aligned. So we can randomize the kernel in this 1G mapping and make
>> it 64K-aligned. This can save some code to creat another TLB map at
>> early boot. The disadvantage is that we only have about 1G/64K = 16384
>> slots to put the kernel in.
>>
>>      KERNELBASE
>>
>>            64K                     |--> kernel <--|
>>             |                      |              |
>>          +--+--+--+    +--+--+--+--+--+--+--+--+--+    +--+--+
>>          |  |  |  |....|  |  |  |  |  |  |  |  |  |....|  |  |
>>          +--+--+--+    +--+--+--+--+--+--+--+--+--+    +--+--+
>>          |                         |                        1G
>>          |----->   offset    <-----|
>>
>>                                kernstart_virt_addr
>>
>> I'm not sure if the slot numbers is enough or the design has any
>> defects. If you have some better ideas, I would be happy to hear that.
>>
>> Thank you all.
>>
>> v3->v4:
>>    Do not define __kaslr_offset as a fixed symbol. Reference __run_at_load and
>>      __kaslr_offset by symbol instead of magic offsets.
>>    Use IS_ENABLED(CONFIG_PPC32) instead of #ifdef CONFIG_PPC32.
>>    Change kaslr-booke32 to kaslr-booke in index.rst
>>    Switch some instructions to 64-bit.
>> v2->v3:
>>    Fix build error when KASLR is disabled.
>> v1->v2:
>>    Add __kaslr_offset for the secondary cpu boot up.
>>
>> Jason Yan (6):
>>    powerpc/fsl_booke/kaslr: refactor kaslr_legal_offset() and
>>      kaslr_early_init()
>>    powerpc/fsl_booke/64: introduce reloc_kernel_entry() helper
>>    powerpc/fsl_booke/64: implement KASLR for fsl_booke64
>>    powerpc/fsl_booke/64: do not clear the BSS for the second pass
>>    powerpc/fsl_booke/64: clear the original kernel if randomized
>>    powerpc/fsl_booke/kaslr: rename kaslr-booke32.rst to kaslr-booke.rst
>>      and add 64bit part
>>
>>   Documentation/powerpc/index.rst               |  2 +-
>>   .../{kaslr-booke32.rst => kaslr-booke.rst}    | 35 +++++++-
>>   arch/powerpc/Kconfig                          |  2 +-
>>   arch/powerpc/kernel/exceptions-64e.S          | 23 +++++
>>   arch/powerpc/kernel/head_64.S                 | 13 +++
>>   arch/powerpc/kernel/setup_64.c                |  3 +
>>   arch/powerpc/mm/mmu_decl.h                    | 23 ++---
>>   arch/powerpc/mm/nohash/kaslr_booke.c          | 88 +++++++++++++------
>>   8 files changed, 144 insertions(+), 45 deletions(-)
>>   rename Documentation/powerpc/{kaslr-booke32.rst => kaslr-booke.rst} (59%)
>>
>> -- 
>> 2.17.2

