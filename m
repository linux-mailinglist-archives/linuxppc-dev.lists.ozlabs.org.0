Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A45B8DC6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 11:29:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZT1S0jqKzF3D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 19:29:00 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZSxQ5pgFzF0kW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 19:25:29 +1000 (AEST)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4930CF2E48C3FC197365;
 Fri, 20 Sep 2019 17:25:24 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Fri, 20 Sep 2019
 17:25:16 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>,
 <diana.craciun@nxp.com>, <christophe.leroy@c-s.fr>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>
Subject: [PATCH v7 00/12] implement KASLR for powerpc/fsl_booke/32
Date: Fri, 20 Sep 2019 17:45:34 +0800
Message-ID: <20190920094546.44948-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
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
Cc: wangkefeng.wang@huawei.com, Jason Yan <yanaijie@huawei.com>,
 linux-kernel@vger.kernel.org, jingxiangfeng@huawei.com, oss@buserror.net,
 zhaohongjiang@huawei.com, thunder.leizhen@huawei.com, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series implements KASLR for powerpc/fsl_booke/32, as a security
feature that deters exploit attempts relying on knowledge of the location
of kernel internals.

Since CONFIG_RELOCATABLE has already supported, what we need to do is
map or copy kernel to a proper place and relocate. Freescale Book-E
parts expect lowmem to be mapped by fixed TLB entries(TLB1). The TLB1
entries are not suitable to map the kernel directly in a randomized
region, so we chose to copy the kernel to a proper place and restart to
relocate.

Entropy is derived from the banner and timer base, which will change every
build and boot. This not so much safe so additionally the bootloader may
pass entropy via the /chosen/kaslr-seed node in device tree.

We will use the first 512M of the low memory to randomize the kernel
image. The memory will be split in 64M zones. We will use the lower 8
bit of the entropy to decide the index of the 64M zone. Then we chose a
16K aligned offset inside the 64M zone to put the kernel in.

    KERNELBASE

        |-->   64M   <--|
        |               |
        +---------------+    +----------------+---------------+
        |               |....|    |kernel|    |               |
        +---------------+    +----------------+---------------+
        |                         |
        |----->   offset    <-----|

                              kernstart_virt_addr

We also check if we will overlap with some areas like the dtb area, the
initrd area or the crashkernel area. If we cannot find a proper area,
kaslr will be disabled and boot from the original kernel.

Changes since v6:
 - Rename create_tlb_entry() to create_kaslr_tlb_entry()
 - Remove MAS2_VAL since there is no more users.
 - Move kaslr_booke.c to arch/powerpc/mm/nohash.
 - Call flush_icache_range() after copying the kernel.
 - Warning if no kaslr-seed provided by the bootloader
 - Use the right physical address when checking if the new position will overlap with other regions.
 - Do not clear bss for the second pass because some global variables will not be initialized again 
 - Use tabs instead of spaces between the mnemonic and the arguments(in fsl_booke_entry_mapping.S).

Changes since v5:
 - Rename M_IF_NEEDED to MAS2_M_IF_NEEDED
 - Define some global variable as __ro_after_init
 - Replace kimage_vaddr with kernstart_virt_addr
 - Depend on RELOCATABLE, not select it
 - Modify the comment block below the SPDX tag
 - Remove some useless headers in kaslr_booke.c and move is_second_reloc
   declarationto mmu_decl.h
 - Remove DBG() and use pr_debug() and rewrite comment above get_boot_seed().
 - Add a patch to document the KASLR implementation.
 - Split a patch from patch #10 which exports kaslr offset in VMCOREINFO ELF notes.
 - Remove extra logic around finding nokaslr string in cmdline.
 - Make regions static global and __initdata

Changes since v4:
 - Add Reviewed-by tag from Christophe
 - Remove an unnecessary cast
 - Remove unnecessary parenthesis
 - Fix checkpatch warning

Changes since v3:
 - Add Reviewed-by and Tested-by tag from Diana
 - Change the comment in fsl_booke_entry_mapping.S to be consistent
   with the new code.

Changes since v2:
 - Remove unnecessary #ifdef
 - Use SZ_64M instead of0x4000000
 - Call early_init_dt_scan_chosen() to init boot_command_line
 - Rename kaslr_second_init() to kaslr_late_init()

Changes since v1:
 - Remove some useless 'extern' keyword.
 - Replace EXPORT_SYMBOL with EXPORT_SYMBOL_GPL
 - Improve some assembly code
 - Use memzero_explicit instead of memset
 - Use boot_command_line and remove early_command_line
 - Do not print kaslr offset if kaslr is disabled

Jason Yan (12):
  powerpc: unify definition of M_IF_NEEDED
  powerpc: move memstart_addr and kernstart_addr to init-common.c
  powerpc: introduce kernstart_virt_addr to store the kernel base
  powerpc/fsl_booke/32: introduce create_kaslr_tlb_entry() helper
  powerpc/fsl_booke/32: introduce reloc_kernel_entry() helper
  powerpc/fsl_booke/32: implement KASLR infrastructure
  powerpc/fsl_booke/32: randomize the kernel image offset
  powerpc/fsl_booke/kaslr: clear the original kernel if randomized
  powerpc/fsl_booke/kaslr: support nokaslr cmdline parameter
  powerpc/fsl_booke/kaslr: dump out kernel offset information on panic
  powerpc/fsl_booke/kaslr: export offset in VMCOREINFO ELF notes
  powerpc/fsl_booke/32: Document KASLR implementation

 Documentation/powerpc/kaslr-booke32.rst       |  42 ++
 arch/powerpc/Kconfig                          |  11 +
 arch/powerpc/include/asm/nohash/mmu-book3e.h  |  11 +-
 arch/powerpc/include/asm/page.h               |   7 +
 arch/powerpc/kernel/early_32.c                |   5 +-
 arch/powerpc/kernel/exceptions-64e.S          |  12 +-
 arch/powerpc/kernel/fsl_booke_entry_mapping.S |  25 +-
 arch/powerpc/kernel/head_fsl_booke.S          |  61 ++-
 arch/powerpc/kernel/machine_kexec.c           |   1 +
 arch/powerpc/kernel/misc_64.S                 |   7 +-
 arch/powerpc/kernel/setup-common.c            |  20 +
 arch/powerpc/mm/init-common.c                 |   7 +
 arch/powerpc/mm/init_32.c                     |   5 -
 arch/powerpc/mm/init_64.c                     |   5 -
 arch/powerpc/mm/mmu_decl.h                    |  11 +
 arch/powerpc/mm/nohash/Makefile               |   1 +
 arch/powerpc/mm/nohash/fsl_booke.c            |   8 +-
 arch/powerpc/mm/nohash/kaslr_booke.c          | 401 ++++++++++++++++++
 18 files changed, 587 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/powerpc/kaslr-booke32.rst
 create mode 100644 arch/powerpc/mm/nohash/kaslr_booke.c

-- 
2.17.2

