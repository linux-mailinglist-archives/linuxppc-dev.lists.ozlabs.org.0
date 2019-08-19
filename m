Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA9A91CEB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 08:13:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BkC06npnzDr3B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 16:13:48 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Bk9S0YGrzDqZH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 16:12:25 +1000 (AEST)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D3D17D4A0B0F36AA5310;
 Mon, 19 Aug 2019 14:12:19 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.203) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Mon, 19 Aug 2019
 14:12:11 +0800
Subject: Re: [PATCH v6 00/12] implement KASLR for powerpc/fsl_booke/32
To: <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>,
 <diana.craciun@nxp.com>, <christophe.leroy@c-s.fr>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>
References: <20190809100800.5426-1-yanaijie@huawei.com>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <ed96199d-715c-3f1c-39db-10a569ba6601@huawei.com>
Date: Mon, 19 Aug 2019 14:12:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190809100800.5426-1-yanaijie@huawei.com>
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

Hi Michael,

Is there anything more I should do to get this feature meeting the 
requirements of the mainline?

Thanks,
Jason

On 2019/8/9 18:07, Jason Yan wrote:
> This series implements KASLR for powerpc/fsl_booke/32, as a security
> feature that deters exploit attempts relying on knowledge of the location
> of kernel internals.
> 
> Since CONFIG_RELOCATABLE has already supported, what we need to do is
> map or copy kernel to a proper place and relocate. Freescale Book-E
> parts expect lowmem to be mapped by fixed TLB entries(TLB1). The TLB1
> entries are not suitable to map the kernel directly in a randomized
> region, so we chose to copy the kernel to a proper place and restart to
> relocate.
> 
> Entropy is derived from the banner and timer base, which will change every
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
>                                kernstart_virt_addr
> 
> We also check if we will overlap with some areas like the dtb area, the
> initrd area or the crashkernel area. If we cannot find a proper area,
> kaslr will be disabled and boot from the original kernel.
> 
> Changes since v5:
>   - Rename M_IF_NEEDED to MAS2_M_IF_NEEDED
>   - Define some global variable as __ro_after_init
>   - Replace kimage_vaddr with kernstart_virt_addr
>   - Depend on RELOCATABLE, not select it
>   - Modify the comment block below the SPDX tag
>   - Remove some useless headers in kaslr_booke.c and move is_second_reloc
>     declarationto mmu_decl.h
>   - Remove DBG() and use pr_debug() and rewrite comment above get_boot_seed().
>   - Add a patch to document the KASLR implementation.
>   - Split a patch from patch #10 which exports kaslr offset in VMCOREINFO ELF notes.
>   - Remove extra logic around finding nokaslr string in cmdline.
>   - Make regions static global and __initdata
> 
> Changes since v4:
>   - Add Reviewed-by tag from Christophe
>   - Remove an unnecessary cast
>   - Remove unnecessary parenthesis
>   - Fix checkpatch warning
> 
> Changes since v3:
>   - Add Reviewed-by and Tested-by tag from Diana
>   - Change the comment in fsl_booke_entry_mapping.S to be consistent
>     with the new code.
> 
> Changes since v2:
>   - Remove unnecessary #ifdef
>   - Use SZ_64M instead of0x4000000
>   - Call early_init_dt_scan_chosen() to init boot_command_line
>   - Rename kaslr_second_init() to kaslr_late_init()
> 
> Changes since v1:
>   - Remove some useless 'extern' keyword.
>   - Replace EXPORT_SYMBOL with EXPORT_SYMBOL_GPL
>   - Improve some assembly code
>   - Use memzero_explicit instead of memset
>   - Use boot_command_line and remove early_command_line
>   - Do not print kaslr offset if kaslr is disabled
> 
> Jason Yan (12):
>    powerpc: unify definition of M_IF_NEEDED
>    powerpc: move memstart_addr and kernstart_addr to init-common.c
>    powerpc: introduce kernstart_virt_addr to store the kernel base
>    powerpc/fsl_booke/32: introduce create_tlb_entry() helper
>    powerpc/fsl_booke/32: introduce reloc_kernel_entry() helper
>    powerpc/fsl_booke/32: implement KASLR infrastructure
>    powerpc/fsl_booke/32: randomize the kernel image offset
>    powerpc/fsl_booke/kaslr: clear the original kernel if randomized
>    powerpc/fsl_booke/kaslr: support nokaslr cmdline parameter
>    powerpc/fsl_booke/kaslr: dump out kernel offset information on panic
>    powerpc/fsl_booke/kaslr: export offset in VMCOREINFO ELF notes
>    powerpc/fsl_booke/32: Document KASLR implementation
> 
>   Documentation/powerpc/kaslr-booke32.rst       |  42 ++
>   arch/powerpc/Kconfig                          |  11 +
>   arch/powerpc/include/asm/nohash/mmu-book3e.h  |  10 +
>   arch/powerpc/include/asm/page.h               |   7 +
>   arch/powerpc/kernel/Makefile                  |   1 +
>   arch/powerpc/kernel/early_32.c                |   2 +-
>   arch/powerpc/kernel/exceptions-64e.S          |  12 +-
>   arch/powerpc/kernel/fsl_booke_entry_mapping.S |  27 +-
>   arch/powerpc/kernel/head_fsl_booke.S          |  55 ++-
>   arch/powerpc/kernel/kaslr_booke.c             | 393 ++++++++++++++++++
>   arch/powerpc/kernel/machine_kexec.c           |   1 +
>   arch/powerpc/kernel/misc_64.S                 |   7 +-
>   arch/powerpc/kernel/setup-common.c            |  20 +
>   arch/powerpc/mm/init-common.c                 |   7 +
>   arch/powerpc/mm/init_32.c                     |   5 -
>   arch/powerpc/mm/init_64.c                     |   5 -
>   arch/powerpc/mm/mmu_decl.h                    |  11 +
>   arch/powerpc/mm/nohash/fsl_booke.c            |   8 +-
>   18 files changed, 572 insertions(+), 52 deletions(-)
>   create mode 100644 Documentation/powerpc/kaslr-booke32.rst
>   create mode 100644 arch/powerpc/kernel/kaslr_booke.c
> 

