Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C0082D39
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 09:58:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462n784xMbzDr32
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 17:57:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="sD1Mk/1I"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462n5T6FcKzDqgD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 17:56:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 462n5P4B0qz9txYB;
 Tue,  6 Aug 2019 09:56:25 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=sD1Mk/1I; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id uOxT8aFbiBhy; Tue,  6 Aug 2019 09:56:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 462n5P2nLRz9txY9;
 Tue,  6 Aug 2019 09:56:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565078185; bh=exbILqtHWAbzCI2aKAx+UNXJ2ZIEmuAnB2WNoplJ2AY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=sD1Mk/1IPTF/mWmhMAOyYAgBuJQEOafiBOnKhWXSBkJ2T/mTNes5SyRPiXpiHoWPF
 f4tc9S+69+bJMnI2OSH/TDjUvlwgLbU1vBWVaWQCpIown1I/2wU1KkihATMut040AW
 M172noQ9m9O+NrjZzgnmm5lBz+Ectq5VNtY/vxrY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7DFE08B7E4;
 Tue,  6 Aug 2019 09:56:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mk5_9WsK2-lo; Tue,  6 Aug 2019 09:56:26 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 849FE8B7E2;
 Tue,  6 Aug 2019 09:56:25 +0200 (CEST)
Subject: Re: [PATCH v4 07/10] powerpc/fsl_booke/32: randomize the kernel image
 offset
To: Jason Yan <yanaijie@huawei.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, diana.craciun@nxp.com,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 keescook@chromium.org, kernel-hardening@lists.openwall.com
References: <20190805064335.19156-1-yanaijie@huawei.com>
 <20190805064335.19156-8-yanaijie@huawei.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <3edec35b-8d61-07ff-558d-2d7e0c28a0e2@c-s.fr>
Date: Tue, 6 Aug 2019 09:56:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805064335.19156-8-yanaijie@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: wangkefeng.wang@huawei.com, linux-kernel@vger.kernel.org,
 jingxiangfeng@huawei.com, zhaohongjiang@huawei.com, thunder.leizhen@huawei.com,
 fanchengyang@huawei.com, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/08/2019 à 08:43, Jason Yan a écrit :
> After we have the basic support of relocate the kernel in some
> appropriate place, we can start to randomize the offset now.
> 
> Entropy is derived from the banner and timer, which will change every
> build and boot. This not so much safe so additionally the bootloader may
> pass entropy via the /chosen/kaslr-seed node in device tree.
> 
> We will use the first 512M of the low memory to randomize the kernel
> image. The memory will be split in 64M zones. We will use the lower 8
> bit of the entropy to decide the index of the 64M zone. Then we chose a
> 16K aligned offset inside the 64M zone to put the kernel in.
> 
>      KERNELBASE
> 
>          |-->   64M   <--|
>          |               |
>          +---------------+    +----------------+---------------+
>          |               |....|    |kernel|    |               |
>          +---------------+    +----------------+---------------+
>          |                         |
>          |----->   offset    <-----|
> 
>                                kimage_vaddr
> 
> We also check if we will overlap with some areas like the dtb area, the
> initrd area or the crashkernel area. If we cannot find a proper area,
> kaslr will be disabled and boot from the original kernel.
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> Cc: Diana Craciun <diana.craciun@nxp.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Kees Cook <keescook@chromium.org>
> Reviewed-by: Diana Craciun <diana.craciun@nxp.com>
> Tested-by: Diana Craciun <diana.craciun@nxp.com>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

One small comment below

> ---
>   arch/powerpc/kernel/kaslr_booke.c | 322 +++++++++++++++++++++++++++++-
>   1 file changed, 320 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/kaslr_booke.c b/arch/powerpc/kernel/kaslr_booke.c
> index 30f84c0321b2..97250cad71de 100644
> --- a/arch/powerpc/kernel/kaslr_booke.c
> +++ b/arch/powerpc/kernel/kaslr_booke.c
> @@ -23,6 +23,8 @@
>   #include <linux/delay.h>
>   #include <linux/highmem.h>
>   #include <linux/memblock.h>
> +#include <linux/libfdt.h>
> +#include <linux/crash_core.h>
>   #include <asm/pgalloc.h>
>   #include <asm/prom.h>
>   #include <asm/io.h>
> @@ -34,15 +36,329 @@
>   #include <asm/machdep.h>
>   #include <asm/setup.h>
>   #include <asm/paca.h>
> +#include <asm/kdump.h>
>   #include <mm/mmu_decl.h>
> +#include <generated/compile.h>
> +#include <generated/utsrelease.h>
> +
> +#ifdef DEBUG
> +#define DBG(fmt...) printk(KERN_ERR fmt)
> +#else
> +#define DBG(fmt...)
> +#endif
> +
> +struct regions {
> +	unsigned long pa_start;
> +	unsigned long pa_end;
> +	unsigned long kernel_size;
> +	unsigned long dtb_start;
> +	unsigned long dtb_end;
> +	unsigned long initrd_start;
> +	unsigned long initrd_end;
> +	unsigned long crash_start;
> +	unsigned long crash_end;
> +	int reserved_mem;
> +	int reserved_mem_addr_cells;
> +	int reserved_mem_size_cells;
> +};
>   
>   extern int is_second_reloc;
>   
> +/* Simplified build-specific string for starting entropy. */
> +static const char build_str[] = UTS_RELEASE " (" LINUX_COMPILE_BY "@"
> +		LINUX_COMPILE_HOST ") (" LINUX_COMPILER ") " UTS_VERSION;
> +
> +static __init void kaslr_get_cmdline(void *fdt)
> +{
> +	int node = fdt_path_offset(fdt, "/chosen");
> +
> +	early_init_dt_scan_chosen(node, "chosen", 1, boot_command_line);
> +}
> +
> +static unsigned long __init rotate_xor(unsigned long hash, const void *area,
> +				       size_t size)
> +{
> +	size_t i;
> +	unsigned long *ptr = (unsigned long *)area;

As area is a void *, this cast shouldn't be necessary. Or maybe it is 
necessary because it discards the const ?

Christophe

> +
> +	for (i = 0; i < size / sizeof(hash); i++) {
> +		/* Rotate by odd number of bits and XOR. */
> +		hash = (hash << ((sizeof(hash) * 8) - 7)) | (hash >> 7);
> +		hash ^= ptr[i];
> +	}
> +
> +	return hash;
> +}
> +
> +/* Attempt to create a simple but unpredictable starting entropy. */
> +static unsigned long __init get_boot_seed(void *fdt)
> +{
> +	unsigned long hash = 0;
> +
> +	hash = rotate_xor(hash, build_str, sizeof(build_str));
> +	hash = rotate_xor(hash, fdt, fdt_totalsize(fdt));
> +
> +	return hash;
> +}
> +
> +static __init u64 get_kaslr_seed(void *fdt)
> +{
> +	int node, len;
> +	fdt64_t *prop;
> +	u64 ret;
> +
> +	node = fdt_path_offset(fdt, "/chosen");
> +	if (node < 0)
> +		return 0;
> +
> +	prop = fdt_getprop_w(fdt, node, "kaslr-seed", &len);
> +	if (!prop || len != sizeof(u64))
> +		return 0;
> +
> +	ret = fdt64_to_cpu(*prop);
> +	*prop = 0;
> +	return ret;
> +}
> +
> +static __init bool regions_overlap(u32 s1, u32 e1, u32 s2, u32 e2)
> +{
> +	return e1 >= s2 && e2 >= s1;
> +}
> +
> +static __init bool overlaps_reserved_region(const void *fdt, u32 start,
> +					    u32 end, struct regions *regions)
> +{
> +	int subnode, len, i;
> +	u64 base, size;
> +
> +	/* check for overlap with /memreserve/ entries */
> +	for (i = 0; i < fdt_num_mem_rsv(fdt); i++) {
> +		if (fdt_get_mem_rsv(fdt, i, &base, &size) < 0)
> +			continue;
> +		if (regions_overlap(start, end, base, base + size))
> +			return true;
> +	}
> +
> +	if (regions->reserved_mem < 0)
> +		return false;
> +
> +	/* check for overlap with static reservations in /reserved-memory */
> +	for (subnode = fdt_first_subnode(fdt, regions->reserved_mem);
> +	     subnode >= 0;
> +	     subnode = fdt_next_subnode(fdt, subnode)) {
> +		const fdt32_t *reg;
> +		u64 rsv_end;
> +
> +		len = 0;
> +		reg = fdt_getprop(fdt, subnode, "reg", &len);
> +		while (len >= (regions->reserved_mem_addr_cells +
> +			       regions->reserved_mem_size_cells)) {
> +			base = fdt32_to_cpu(reg[0]);
> +			if (regions->reserved_mem_addr_cells == 2)
> +				base = (base << 32) | fdt32_to_cpu(reg[1]);
> +
> +			reg += regions->reserved_mem_addr_cells;
> +			len -= 4 * regions->reserved_mem_addr_cells;
> +
> +			size = fdt32_to_cpu(reg[0]);
> +			if (regions->reserved_mem_size_cells == 2)
> +				size = (size << 32) | fdt32_to_cpu(reg[1]);
> +
> +			reg += regions->reserved_mem_size_cells;
> +			len -= 4 * regions->reserved_mem_size_cells;
> +
> +			if (base >= regions->pa_end)
> +				continue;
> +
> +			rsv_end = min(base + size, (u64)U32_MAX);
> +
> +			if (regions_overlap(start, end, base, rsv_end))
> +				return true;
> +		}
> +	}
> +	return false;
> +}
> +
> +static __init bool overlaps_region(const void *fdt, u32 start,
> +				   u32 end, struct regions *regions)
> +{
> +	if (regions_overlap(start, end, regions->dtb_start,
> +			    regions->dtb_end))
> +		return true;
> +
> +	if (regions_overlap(start, end, regions->initrd_start,
> +			    regions->initrd_end))
> +		return true;
> +
> +	if (regions_overlap(start, end, regions->crash_start,
> +			    regions->crash_end))
> +		return true;
> +
> +	return overlaps_reserved_region(fdt, start, end, regions);
> +}
> +
> +static void __init get_crash_kernel(void *fdt, unsigned long size,
> +				    struct regions *regions)
> +{
> +#ifdef CONFIG_CRASH_CORE
> +	unsigned long long crash_size, crash_base;
> +	int ret;
> +
> +	ret = parse_crashkernel(boot_command_line, size, &crash_size,
> +				&crash_base);
> +	if (ret != 0 || crash_size == 0)
> +		return;
> +	if (crash_base == 0)
> +		crash_base = KDUMP_KERNELBASE;
> +
> +	regions->crash_start = (unsigned long)crash_base;
> +	regions->crash_end = (unsigned long)(crash_base + crash_size);
> +
> +	DBG("crash_base=0x%llx crash_size=0x%llx\n", crash_base, crash_size);
> +#endif
> +}
> +
> +static void __init get_initrd_range(void *fdt, struct regions *regions)
> +{
> +	u64 start, end;
> +	int node, len;
> +	const __be32 *prop;
> +
> +	node = fdt_path_offset(fdt, "/chosen");
> +	if (node < 0)
> +		return;
> +
> +	prop = fdt_getprop(fdt, node, "linux,initrd-start", &len);
> +	if (!prop)
> +		return;
> +	start = of_read_number(prop, len / 4);
> +
> +	prop = fdt_getprop(fdt, node, "linux,initrd-end", &len);
> +	if (!prop)
> +		return;
> +	end = of_read_number(prop, len / 4);
> +
> +	regions->initrd_start = (unsigned long)start;
> +	regions->initrd_end = (unsigned long)end;
> +
> +	DBG("initrd_start=0x%llx  initrd_end=0x%llx\n", start, end);
> +}
> +
> +static __init unsigned long get_usable_offset(const void *fdt, struct regions *regions,
> +					      unsigned long start)
> +{
> +	unsigned long pa;
> +	unsigned long pa_end;
> +
> +	for (pa = start; pa > regions->pa_start; pa -= SZ_16K) {
> +		pa_end = pa + regions->kernel_size;
> +		if (overlaps_region(fdt, pa, pa_end, regions))
> +			continue;
> +
> +		return pa;
> +	}
> +	return 0;
> +}
> +
> +static __init void get_cell_sizes(const void *fdt, int node, int *addr_cells,
> +				  int *size_cells)
> +{
> +	const int *prop;
> +	int len;
> +
> +	/*
> +	 * Retrieve the #address-cells and #size-cells properties
> +	 * from the 'node', or use the default if not provided.
> +	 */
> +	*addr_cells = *size_cells = 1;
> +
> +	prop = fdt_getprop(fdt, node, "#address-cells", &len);
> +	if (len == 4)
> +		*addr_cells = fdt32_to_cpu(*prop);
> +	prop = fdt_getprop(fdt, node, "#size-cells", &len);
> +	if (len == 4)
> +		*size_cells = fdt32_to_cpu(*prop);
> +}
> +
>   static unsigned long __init kaslr_choose_location(void *dt_ptr, phys_addr_t size,
>   						  unsigned long kernel_sz)
>   {
> -	/* return a fixed offset of 64M for now */
> -	return SZ_64M;
> +	unsigned long offset, random;
> +	unsigned long ram, linear_sz;
> +	unsigned long kaslr_offset;
> +	u64 seed;
> +	struct regions regions;
> +	unsigned long index;
> +
> +	random = get_boot_seed(dt_ptr);
> +
> +	seed = get_tb() << 32;
> +	seed ^= get_tb();
> +	random = rotate_xor(random, &seed, sizeof(seed));
> +
> +	/*
> +	 * Retrieve (and wipe) the seed from the FDT
> +	 */
> +	seed = get_kaslr_seed(dt_ptr);
> +	if (seed)
> +		random = rotate_xor(random, &seed, sizeof(seed));
> +
> +	ram = min((phys_addr_t)__max_low_memory, size);
> +	ram = map_mem_in_cams(ram, CONFIG_LOWMEM_CAM_NUM, true);
> +	linear_sz = min(ram, (unsigned long)SZ_512M);
> +
> +	/* If the linear size is smaller than 64M, do not randmize */
> +	if (linear_sz < SZ_64M)
> +		return 0;
> +
> +	memset(&regions, 0, sizeof(regions));
> +
> +	/* check for a reserved-memory node and record its cell sizes */
> +	regions.reserved_mem = fdt_path_offset(dt_ptr, "/reserved-memory");
> +	if (regions.reserved_mem >= 0)
> +		get_cell_sizes(dt_ptr, regions.reserved_mem,
> +			       &regions.reserved_mem_addr_cells,
> +			       &regions.reserved_mem_size_cells);
> +
> +	regions.pa_start = 0;
> +	regions.pa_end = linear_sz;
> +	regions.dtb_start = __pa(dt_ptr);
> +	regions.dtb_end = __pa(dt_ptr) + fdt_totalsize(dt_ptr);
> +	regions.kernel_size = kernel_sz;
> +
> +	get_initrd_range(dt_ptr, &regions);
> +	get_crash_kernel(dt_ptr, ram, &regions);
> +
> +	/*
> +	 * Decide which 64M we want to start
> +	 * Only use the low 8 bits of the random seed
> +	 */
> +	index = random & 0xFF;
> +	index %= linear_sz / SZ_64M;
> +
> +	/* Decide offset inside 64M */
> +	if (index == 0) {
> +		offset = random % (SZ_64M - round_up(kernel_sz, SZ_16K) * 2);
> +		offset += round_up(kernel_sz, SZ_16K);
> +		offset = round_up(offset, SZ_16K);
> +	} else {
> +		offset = random % (SZ_64M - kernel_sz);
> +		offset = round_down(offset, SZ_16K);
> +	}
> +
> +	while (index >= 0) {
> +		offset = offset + index * SZ_64M;
> +		kaslr_offset = get_usable_offset(dt_ptr, &regions, offset);
> +		if (kaslr_offset)
> +			break;
> +		index--;
> +	}
> +
> +	/* Did not find any usable region? Give up randomize */
> +	if (index < 0)
> +		kaslr_offset = 0;
> +
> +	return kaslr_offset;
>   }
>   
>   /*
> @@ -59,6 +375,8 @@ notrace void __init kaslr_early_init(void *dt_ptr, phys_addr_t size)
>   
>   	kernel_sz = (unsigned long)_end - KERNELBASE;
>   
> +	kaslr_get_cmdline(dt_ptr);
> +
>   	offset = kaslr_choose_location(dt_ptr, size, kernel_sz);
>   
>   	if (offset == 0)
> 
