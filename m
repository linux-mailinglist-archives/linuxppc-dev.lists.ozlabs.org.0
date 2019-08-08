Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5AC85B49
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 09:10:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463zzV66W9zDqgM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 17:10:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.191; helo=huawei.com; envelope-from=yanaijie@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463zxw5CRczDqdX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 17:09:08 +1000 (AEST)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B66ECAD010A301BCE132;
 Thu,  8 Aug 2019 15:09:05 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.203) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Thu, 8 Aug 2019
 15:08:55 +0800
Subject: Re: [PATCH v5 07/10] powerpc/fsl_booke/32: randomize the kernel image
 offset
To: Michael Ellerman <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>,
 <diana.craciun@nxp.com>, <christophe.leroy@c-s.fr>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>
References: <20190807065706.11411-1-yanaijie@huawei.com>
 <20190807065706.11411-8-yanaijie@huawei.com>
 <871rxxunz4.fsf@concordia.ellerman.id.au>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <2826ad57-c081-a22c-32c8-d7d28c1b5acb@huawei.com>
Date: Thu, 8 Aug 2019 15:08:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <871rxxunz4.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 2019/8/7 21:03, Michael Ellerman wrote:
> Jason Yan <yanaijie@huawei.com> writes:
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
>>      KERNELBASE
>>
>>          |-->   64M   <--|
>>          |               |
>>          +---------------+    +----------------+---------------+
>>          |               |....|    |kernel|    |               |
>>          +---------------+    +----------------+---------------+
>>          |                         |
>>          |----->   offset    <-----|
>>
>>                                kimage_vaddr
> 
> Can you drop this description / diagram and any other relevant design
> details in eg. Documentation/powerpc/kaslr-booke32.rst please?
> 

No problem.

> See cpu_families.rst for an example of how to incorporate the ASCII
> diagram.
>  >> diff --git a/arch/powerpc/kernel/kaslr_booke.c 
b/arch/powerpc/kernel/kaslr_booke.c
>> index 30f84c0321b2..52b59b05f906 100644
>> --- a/arch/powerpc/kernel/kaslr_booke.c
>> +++ b/arch/powerpc/kernel/kaslr_booke.c
>> @@ -34,15 +36,329 @@
>>   #include <asm/machdep.h>
>>   #include <asm/setup.h>
>>   #include <asm/paca.h>
>> +#include <asm/kdump.h>
>>   #include <mm/mmu_decl.h>
>> +#include <generated/compile.h>
>> +#include <generated/utsrelease.h>
>> +
>> +#ifdef DEBUG
>> +#define DBG(fmt...) pr_info(fmt)
>> +#else
>> +#define DBG(fmt...)
>> +#endif
> 
> Just use pr_debug()?
> 

Sounds better.

>> +struct regions {
>> +	unsigned long pa_start;
>> +	unsigned long pa_end;
>> +	unsigned long kernel_size;
>> +	unsigned long dtb_start;
>> +	unsigned long dtb_end;
>> +	unsigned long initrd_start;
>> +	unsigned long initrd_end;
>> +	unsigned long crash_start;
>> +	unsigned long crash_end;
>> +	int reserved_mem;
>> +	int reserved_mem_addr_cells;
>> +	int reserved_mem_size_cells;
>> +};
>>   
>>   extern int is_second_reloc;
>>   
>> +/* Simplified build-specific string for starting entropy. */
>> +static const char build_str[] = UTS_RELEASE " (" LINUX_COMPILE_BY "@"
>> +		LINUX_COMPILE_HOST ") (" LINUX_COMPILER ") " UTS_VERSION;
>> +
>> +static __init void kaslr_get_cmdline(void *fdt)
>> +{
>> +	int node = fdt_path_offset(fdt, "/chosen");
>> +
>> +	early_init_dt_scan_chosen(node, "chosen", 1, boot_command_line);
>> +}
>> +
>> +static unsigned long __init rotate_xor(unsigned long hash, const void *area,
>> +				       size_t size)
>> +{
>> +	size_t i;
>> +	const unsigned long *ptr = area;
>> +
>> +	for (i = 0; i < size / sizeof(hash); i++) {
>> +		/* Rotate by odd number of bits and XOR. */
>> +		hash = (hash << ((sizeof(hash) * 8) - 7)) | (hash >> 7);
>> +		hash ^= ptr[i];
>> +	}
>> +
>> +	return hash;
>> +}
> 
> That looks suspiciously like the version Kees wrote in 2013 in
> arch/x86/boot/compressed/kaslr.c ?
> 
> You should mention that in the change log at least.
> 

Oh yes, I should have do that. Thanks for reminding me.

>> +
>> +/* Attempt to create a simple but unpredictable starting entropy. */
> 
> It's simple, but I would argue unpredictable is not really true. A local
> attacker can probably fingerprint the kernel version, and also has
> access to the unflattened device tree, which means they can make
> educated guesses about the flattened tree size.
> 
> Be careful when copying comments :)
> 

It's true that the comment is not so precise. It's an 'attempt' to
create unpredictable entropy. And apparently the 'attempt' was failed.
I will try to rewrite the comment to reflect the code more precisely.

>> +static unsigned long __init get_boot_seed(void *fdt)
>> +{
>> +	unsigned long hash = 0;
>> +
>> +	hash = rotate_xor(hash, build_str, sizeof(build_str));
>> +	hash = rotate_xor(hash, fdt, fdt_totalsize(fdt));
>> +
>> +	return hash;
>> +}
>> +
>> +static __init u64 get_kaslr_seed(void *fdt)
>> +{
>> +	int node, len;
>> +	fdt64_t *prop;
>> +	u64 ret;
>> +
>> +	node = fdt_path_offset(fdt, "/chosen");
>> +	if (node < 0)
>> +		return 0;
>> +
>> +	prop = fdt_getprop_w(fdt, node, "kaslr-seed", &len);
>> +	if (!prop || len != sizeof(u64))
>> +		return 0;
>> +
>> +	ret = fdt64_to_cpu(*prop);
>> +	*prop = 0;
>> +	return ret;
>> +}
>> +
>> +static __init bool regions_overlap(u32 s1, u32 e1, u32 s2, u32 e2)
>> +{
>> +	return e1 >= s2 && e2 >= s1;
>> +}
> 
> There's a generic helper called memory_intersects(), though it takes
> void*. Might not be worth using, not sure.
> 

I will have a try to see if this can save some codes or not.

> ...
>>   static unsigned long __init kaslr_choose_location(void *dt_ptr, phys_addr_t size,
>>   						  unsigned long kernel_sz)
>>   {
>> -	/* return a fixed offset of 64M for now */
>> -	return SZ_64M;
>> +	unsigned long offset, random;
>> +	unsigned long ram, linear_sz;
>> +	unsigned long kaslr_offset;
>> +	u64 seed;
>> +	struct regions regions;
> 
> You pass that around to a lot of the functions, would it be simpler just
> to make it static global and __initdata ?
> 

Not sure if it's simpler. Let me have a try.

> cheers
> 
> 
> .
> 

