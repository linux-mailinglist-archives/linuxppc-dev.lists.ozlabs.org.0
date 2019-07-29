Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC3D78D47
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 15:57:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y1T55hQTzDqMW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 23:56:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.35; helo=huawei.com; envelope-from=yanaijie@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y1PG22XFzDqKR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 23:53:36 +1000 (AEST)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 60CB9DB428828E36AA06;
 Mon, 29 Jul 2019 21:53:34 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.203) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Mon, 29 Jul 2019
 21:53:24 +0800
Subject: Re: [RFC PATCH 07/10] powerpc/fsl_booke/32: randomize the kernel
 image offset
To: Christophe Leroy <christophe.leroy@c-s.fr>, <mpe@ellerman.id.au>,
 <linuxppc-dev@lists.ozlabs.org>, <diana.craciun@nxp.com>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>
References: <20190717080621.40424-1-yanaijie@huawei.com>
 <20190717080621.40424-8-yanaijie@huawei.com>
 <d2ed1821-96a2-d7eb-4c1e-4787c7dd467a@c-s.fr>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <fe790bd9-c8b8-ca72-fa4a-40b54107af0f@huawei.com>
Date: Mon, 29 Jul 2019 21:53:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <d2ed1821-96a2-d7eb-4c1e-4787c7dd467a@c-s.fr>
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
 jingxiangfeng@huawei.com, thunder.leizhen@huawei.com, fanchengyang@huawei.com,
 yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2019/7/29 19:33, Christophe Leroy wrote:
> 
> 
> Le 17/07/2019 à 10:06, Jason Yan a écrit :
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
>> ---
>>   arch/powerpc/kernel/kaslr_booke.c | 335 +++++++++++++++++++++++++++++-
>>   1 file changed, 333 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/kaslr_booke.c 
>> b/arch/powerpc/kernel/kaslr_booke.c
>> index 72d8e9432048..90357f4bd313 100644
>> --- a/arch/powerpc/kernel/kaslr_booke.c
>> +++ b/arch/powerpc/kernel/kaslr_booke.c
>> @@ -22,6 +22,8 @@
>>   #include <linux/delay.h>
>>   #include <linux/highmem.h>
>>   #include <linux/memblock.h>
>> +#include <linux/libfdt.h>
>> +#include <linux/crash_core.h>
>>   #include <asm/pgalloc.h>
>>   #include <asm/prom.h>
>>   #include <asm/io.h>
>> @@ -33,15 +35,342 @@
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
>> +static char __initdata early_command_line[COMMAND_LINE_SIZE];
>> +
>> +static __init void kaslr_get_cmdline(void *fdt)
>> +{
>> +    const char *cmdline = CONFIG_CMDLINE;
>> +    if (!IS_ENABLED(CONFIG_CMDLINE_FORCE)) {
>> +        int node;
>> +        const u8 *prop;
>> +        node = fdt_path_offset(fdt, "/chosen");
>> +        if (node < 0)
>> +            goto out;
>> +
>> +        prop = fdt_getprop(fdt, node, "bootargs", NULL);
>> +        if (!prop)
>> +            goto out;
>> +        cmdline = prop;
>> +    }
>> +out:
>> +    strscpy(early_command_line, cmdline, COMMAND_LINE_SIZE);
>> +}
>> +
> 
> Can you explain why we need that and can't use the already existing 
> cmdline stuff ?
> 

I'm afraid of breaking the other initializing code of the cmdline
buffer at first. I will have a try to use it to see if there is any 
problems.

> Christophe
> 
>> +static unsigned long __init rotate_xor(unsigned long hash, const void 
>> *area,
>> +                size_t size)
>> +{
>> +    size_t i;
>> +    unsigned long *ptr = (unsigned long *)area;
>> +
>> +    for (i = 0; i < size / sizeof(hash); i++) {
>> +        /* Rotate by odd number of bits and XOR. */
>> +        hash = (hash << ((sizeof(hash) * 8) - 7)) | (hash >> 7);
>> +        hash ^= ptr[i];
>> +    }
>> +
>> +    return hash;
>> +}
>> +
>> +/* Attempt to create a simple but unpredictable starting entropy. */
>> +static unsigned long __init get_boot_seed(void *fdt)
>> +{
>> +    unsigned long hash = 0;
>> +
>> +    hash = rotate_xor(hash, build_str, sizeof(build_str));
>> +    hash = rotate_xor(hash, fdt, fdt_totalsize(fdt));
>> +
>> +    return hash;
>> +}
>> +
>> +static __init u64 get_kaslr_seed(void *fdt)
>> +{
>> +    int node, len;
>> +    fdt64_t *prop;
>> +    u64 ret;
>> +
>> +    node = fdt_path_offset(fdt, "/chosen");
>> +    if (node < 0)
>> +        return 0;
>> +
>> +    prop = fdt_getprop_w(fdt, node, "kaslr-seed", &len);
>> +    if (!prop || len != sizeof(u64))
>> +        return 0;
>> +
>> +    ret = fdt64_to_cpu(*prop);
>> +    *prop = 0;
>> +    return ret;
>> +}
>> +
>> +static __init bool regions_overlap(u32 s1, u32 e1, u32 s2, u32 e2)
>> +{
>> +    return e1 >= s2 && e2 >= s1;
>> +}
>> +
>> +static __init bool overlaps_reserved_region(const void *fdt, u32 start,
>> +                       u32 end, struct regions *regions)
>> +{
>> +    int subnode, len, i;
>> +    u64 base, size;
>> +
>> +    /* check for overlap with /memreserve/ entries */
>> +    for (i = 0; i < fdt_num_mem_rsv(fdt); i++) {
>> +        if (fdt_get_mem_rsv(fdt, i, &base, &size) < 0)
>> +            continue;
>> +        if (regions_overlap(start, end, base, base + size))
>> +            return true;
>> +    }
>> +
>> +    if (regions->reserved_mem < 0)
>> +        return false;
>> +
>> +    /* check for overlap with static reservations in /reserved-memory */
>> +    for (subnode = fdt_first_subnode(fdt, regions->reserved_mem);
>> +         subnode >= 0;
>> +         subnode = fdt_next_subnode(fdt, subnode)) {
>> +        const fdt32_t *reg;
>> +        u64 rsv_end;
>> +
>> +        len = 0;
>> +        reg = fdt_getprop(fdt, subnode, "reg", &len);
>> +        while (len >= (regions->reserved_mem_addr_cells +
>> +                   regions->reserved_mem_size_cells)) {
>> +            base = fdt32_to_cpu(reg[0]);
>> +            if (regions->reserved_mem_addr_cells == 2)
>> +                base = (base << 32) | fdt32_to_cpu(reg[1]);
>> +
>> +            reg += regions->reserved_mem_addr_cells;
>> +            len -= 4 * regions->reserved_mem_addr_cells;
>> +
>> +            size = fdt32_to_cpu(reg[0]);
>> +            if (regions->reserved_mem_size_cells == 2)
>> +                size = (size << 32) | fdt32_to_cpu(reg[1]);
>> +
>> +            reg += regions->reserved_mem_size_cells;
>> +            len -= 4 * regions->reserved_mem_size_cells;
>> +
>> +            if (base >= regions->pa_end)
>> +                continue;
>> +
>> +            rsv_end = min(base + size, (u64)U32_MAX);
>> +
>> +            if (regions_overlap(start, end, base, rsv_end))
>> +                return true;
>> +        }
>> +    }
>> +    return false;
>> +}
>> +
>> +static __init bool overlaps_region(const void *fdt, u32 start,
>> +                       u32 end, struct regions *regions)
>> +{
>> +    if (regions_overlap(start, end, regions->dtb_start,
>> +                  regions->dtb_end))
>> +        return true;
>> +
>> +    if (regions_overlap(start, end, regions->initrd_start,
>> +                  regions->initrd_end))
>> +        return true;
>> +
>> +    if (regions_overlap(start, end, regions->crash_start,
>> +                  regions->crash_end))
>> +        return true;
>> +
>> +    return overlaps_reserved_region(fdt, start, end, regions);
>> +}
>> +
>> +static void __init get_crash_kernel(void *fdt, unsigned long size,
>> +                struct regions *regions)
>> +{
>> +#ifdef CONFIG_KEXEC_CORE
>> +    unsigned long long crash_size, crash_base;
>> +    int ret;
>> +
>> +    ret = parse_crashkernel(early_command_line, size, &crash_size,
>> +            &crash_base);
>> +    if (ret != 0 || crash_size == 0)
>> +        return;
>> +    if (crash_base == 0)
>> +        crash_base = KDUMP_KERNELBASE;
>> +
>> +    regions->crash_start = (unsigned long)crash_base;
>> +    regions->crash_end = (unsigned long)(crash_base + crash_size);
>> +
>> +    DBG("crash_base=0x%llx crash_size=0x%llx\n", crash_base, 
>> crash_size);
>> +#endif
>> +}
>> +
>> +static void __init get_initrd_range(void *fdt, struct regions *regions)
>> +{
>> +    u64 start, end;
>> +    int node, len;
>> +    const __be32 *prop;
>> +
>> +    node = fdt_path_offset(fdt, "/chosen");
>> +    if (node < 0)
>> +        return;
>> +
>> +    prop = fdt_getprop(fdt, node, "linux,initrd-start", &len);
>> +    if (!prop)
>> +        return;
>> +    start = of_read_number(prop, len / 4);
>> +
>> +    prop = fdt_getprop(fdt, node, "linux,initrd-end", &len);
>> +    if (!prop)
>> +        return;
>> +    end = of_read_number(prop, len / 4);
>> +
>> +    regions->initrd_start = (unsigned long)start;
>> +    regions->initrd_end = (unsigned long)end;
>> +
>> +    DBG("initrd_start=0x%llx  initrd_end=0x%llx\n", start, end);
>> +}
>> +
>> +static __init unsigned long get_usable_offset(const void *fdt, struct 
>> regions *regions,
>> +                unsigned long start)
>> +{
>> +    unsigned long pa;
>> +    unsigned long pa_end;
>> +
>> +    for (pa = start; pa > regions->pa_start; pa -= SZ_16K) {
>> +        pa_end = pa + regions->kernel_size;
>> +        if (overlaps_region(fdt, pa, pa_end, regions))
>> +            continue;
>> +
>> +        return pa;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static __init void get_cell_sizes(const void *fdt, int node, int 
>> *addr_cells,
>> +               int *size_cells)
>> +{
>> +    const int *prop;
>> +    int len;
>> +
>> +    /*
>> +     * Retrieve the #address-cells and #size-cells properties
>> +     * from the 'node', or use the default if not provided.
>> +     */
>> +    *addr_cells = *size_cells = 1;
>> +
>> +    prop = fdt_getprop(fdt, node, "#address-cells", &len);
>> +    if (len == 4)
>> +        *addr_cells = fdt32_to_cpu(*prop);
>> +    prop = fdt_getprop(fdt, node, "#size-cells", &len);
>> +    if (len == 4)
>> +        *size_cells = fdt32_to_cpu(*prop);
>> +}
>> +
>>   static unsigned long __init kaslr_choose_location(void *dt_ptr, 
>> phys_addr_t size,
>>                       unsigned long kernel_sz)
>>   {
>> -    /* return a fixed offset of 64M for now */
>> -    return 0x4000000;
>> +    unsigned long offset, random;
>> +    unsigned long ram, linear_sz;
>> +    unsigned long kaslr_offset;
>> +    u64 seed;
>> +    struct regions regions;
>> +    unsigned long index;
>> +
>> +    random = get_boot_seed(dt_ptr);
>> +
>> +    seed = get_tb() << 32;
>> +    seed ^= get_tb();
>> +    random = rotate_xor(random, &seed, sizeof(seed));
>> +
>> +    /*
>> +     * Retrieve (and wipe) the seed from the FDT
>> +     */
>> +    seed = get_kaslr_seed(dt_ptr);
>> +    if (seed)
>> +        random = rotate_xor(random, &seed, sizeof(seed));
>> +
>> +    ram = min((phys_addr_t)__max_low_memory, size);
>> +    ram = map_mem_in_cams(ram, CONFIG_LOWMEM_CAM_NUM, true);
>> +    linear_sz = min(ram, (unsigned long)SZ_512M);
>> +
>> +    /* If the linear size is smaller than 64M, do not randmize */
>> +    if (linear_sz < SZ_64M)
>> +        return 0;
>> +
>> +    memset(&regions, 0, sizeof(regions));
>> +
>> +    /* check for a reserved-memory node and record its cell sizes */
>> +    regions.reserved_mem = fdt_path_offset(dt_ptr, "/reserved-memory");
>> +    if (regions.reserved_mem >= 0)
>> +        get_cell_sizes(dt_ptr, regions.reserved_mem,
>> +                   &regions.reserved_mem_addr_cells,
>> +                   &regions.reserved_mem_size_cells);
>> +
>> +    regions.pa_start = 0;
>> +    regions.pa_end = linear_sz;
>> +    regions.dtb_start = __pa(dt_ptr);
>> +    regions.dtb_end = __pa(dt_ptr) + fdt_totalsize(dt_ptr);
>> +    regions.kernel_size = kernel_sz;
>> +
>> +    get_initrd_range(dt_ptr, &regions);
>> +    get_crash_kernel(dt_ptr, ram, &regions);
>> +
>> +    /*
>> +     * Decide which 64M we want to start
>> +     * Only use the low 8 bits of the random seed
>> +     */
>> +    index = random & 0xFF;
>> +    index %= linear_sz / SZ_64M;
>> +
>> +    /* Decide offset inside 64M */
>> +    if (index == 0) {
>> +        offset = random % (SZ_64M - round_up(kernel_sz, SZ_16K) * 2);
>> +        offset += round_up(kernel_sz, SZ_16K);
>> +        offset = round_up(offset, SZ_16K);
>> +    } else {
>> +        offset = random % (SZ_64M - kernel_sz);
>> +        offset = round_down(offset, SZ_16K);
>> +    }
>> +
>> +    while (index >= 0) {
>> +        offset = offset + index * SZ_64M;
>> +        kaslr_offset = get_usable_offset(dt_ptr, &regions, offset);
>> +        if (kaslr_offset)
>> +            break;
>> +        index--;
>> +    }
>> +
>> +    /* Did not find any usable region? Give up randomize */
>> +    if (index < 0)
>> +        kaslr_offset = 0;
>> +
>> +    return kaslr_offset;
>>   }
>>   /*
>> @@ -58,6 +387,8 @@ notrace void __init kaslr_early_init(void *dt_ptr, 
>> phys_addr_t size)
>>       kernel_sz = (unsigned long)_end - KERNELBASE;
>> +    kaslr_get_cmdline(dt_ptr);
>> +
>>       offset = kaslr_choose_location(dt_ptr, size, kernel_sz);
>>       if (offset == 0)
>>
> 
> .
> 

