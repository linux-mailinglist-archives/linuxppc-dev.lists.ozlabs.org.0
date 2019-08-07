Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25215842D4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 05:18:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463Gsd5ZSGzDr6f
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 13:17:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.32; helo=huawei.com; envelope-from=yanaijie@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463Gr20YZ4zDqxs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 13:16:33 +1000 (AEST)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 10C93FA9AE40F21242A4;
 Wed,  7 Aug 2019 11:16:28 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.203) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Wed, 7 Aug 2019
 11:16:20 +0800
Subject: Re: [PATCH v4 07/10] powerpc/fsl_booke/32: randomize the kernel image
 offset
To: Christophe Leroy <christophe.leroy@c-s.fr>, <mpe@ellerman.id.au>,
 <linuxppc-dev@lists.ozlabs.org>, <diana.craciun@nxp.com>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>
References: <20190805064335.19156-1-yanaijie@huawei.com>
 <20190805064335.19156-8-yanaijie@huawei.com>
 <3edec35b-8d61-07ff-558d-2d7e0c28a0e2@c-s.fr>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <16e058a4-9794-6998-46e4-0e63b9fce7e3@huawei.com>
Date: Wed, 7 Aug 2019 11:16:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <3edec35b-8d61-07ff-558d-2d7e0c28a0e2@c-s.fr>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.96.203]
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
Cc: wangkefeng.wang@huawei.com, linux-kernel@vger.kernel.org,
 jingxiangfeng@huawei.com, zhaohongjiang@huawei.com, thunder.leizhen@huawei.com,
 fanchengyang@huawei.com, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2019/8/6 15:56, Christophe Leroy wrote:
> 
> 
> Le 05/08/2019 à 08:43, Jason Yan a écrit :
>> After we have the basic support of relocate the kernel in some
>> appropriate place, we can start to randomize the offset now.
>>
>> Entropy is derived from the banner and timer, which will change every
>> build and boot. This not so much safe so additionally the bootloader may
>> pass entropy via the /chosen/kaslr-seed node in device tree.
>>
>> We will use the first 512M of the low memory to randomize the kernel
>> image. The memory will be split in 64M zones. We will use the lower 8
>> bit of the entropy to decide the index of the 64M zone. Then we chose a
>> 16K aligned offset inside the 64M zone to put the kernel in.
>>
>>      KERNELBASE
>>
>>          |-->   64M   <--|
>>          |               |
>>          +---------------+    +----------------+---------------+
>>          |               |....|    |kernel|    |               |
>>          +---------------+    +----------------+---------------+
>>          |                         |
>>          |----->   offset    <-----|
>>
>>                                kimage_vaddr
>>
>> We also check if we will overlap with some areas like the dtb area, the
>> initrd area or the crashkernel area. If we cannot find a proper area,
>> kaslr will be disabled and boot from the original kernel.
>>
>> Signed-off-by: Jason Yan <yanaijie@huawei.com>
>> Cc: Diana Craciun <diana.craciun@nxp.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Kees Cook <keescook@chromium.org>
>> Reviewed-by: Diana Craciun <diana.craciun@nxp.com>
>> Tested-by: Diana Craciun <diana.craciun@nxp.com>
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
> 

Thanks for your help,

> One small comment below
> 
>> ---
>>   arch/powerpc/kernel/kaslr_booke.c | 322 +++++++++++++++++++++++++++++-
>>   1 file changed, 320 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/kaslr_booke.c 
>> b/arch/powerpc/kernel/kaslr_booke.c
>> index 30f84c0321b2..97250cad71de 100644
>> --- a/arch/powerpc/kernel/kaslr_booke.c
>> +++ b/arch/powerpc/kernel/kaslr_booke.c
>> @@ -23,6 +23,8 @@
>>   #include <linux/delay.h>
>>   #include <linux/highmem.h>
>>   #include <linux/memblock.h>
>> +#include <linux/libfdt.h>
>> +#include <linux/crash_core.h>
>>   #include <asm/pgalloc.h>
>>   #include <asm/prom.h>
>>   #include <asm/io.h>
>> @@ -34,15 +36,329 @@
>>   #include <asm/machdep.h>
>>   #include <asm/setup.h>
>>   #include <asm/paca.h>
>> +#include <asm/kdump.h>
>>   #include <mm/mmu_decl.h>
>> +#include <generated/compile.h>
>> +#include <generated/utsrelease.h>
>> +
>> +#ifdef DEBUG
>> +#define DBG(fmt...) printk(KERN_ERR fmt)
>> +#else
>> +#define DBG(fmt...)
>> +#endif
>> +
>> +struct regions {
>> +    unsigned long pa_start;
>> +    unsigned long pa_end;
>> +    unsigned long kernel_size;
>> +    unsigned long dtb_start;
>> +    unsigned long dtb_end;
>> +    unsigned long initrd_start;
>> +    unsigned long initrd_end;
>> +    unsigned long crash_start;
>> +    unsigned long crash_end;
>> +    int reserved_mem;
>> +    int reserved_mem_addr_cells;
>> +    int reserved_mem_size_cells;
>> +};
>>   extern int is_second_reloc;
>> +/* Simplified build-specific string for starting entropy. */
>> +static const char build_str[] = UTS_RELEASE " (" LINUX_COMPILE_BY "@"
>> +        LINUX_COMPILE_HOST ") (" LINUX_COMPILER ") " UTS_VERSION;
>> +
>> +static __init void kaslr_get_cmdline(void *fdt)
>> +{
>> +    int node = fdt_path_offset(fdt, "/chosen");
>> +
>> +    early_init_dt_scan_chosen(node, "chosen", 1, boot_command_line);
>> +}
>> +
>> +static unsigned long __init rotate_xor(unsigned long hash, const void 
>> *area,
>> +                       size_t size)
>> +{
>> +    size_t i;
>> +    unsigned long *ptr = (unsigned long *)area;
> 
> As area is a void *, this cast shouldn't be necessary. Or maybe it is 
> necessary because it discards the const ?
> 

It's true the cast is not necessary. The ptr can be made const and then 
remove the cast.

> Christophe
> 

