Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE2A81284
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2019 08:45:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4627YX2G46zDqfb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2019 16:45:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46278P037qzDqXW
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Aug 2019 16:26:44 +1000 (AEST)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1045643B73685290DE0C;
 Mon,  5 Aug 2019 14:26:32 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Mon, 5 Aug 2019
 14:26:25 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>,
 <diana.craciun@nxp.com>, <christophe.leroy@c-s.fr>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>
Subject: [PATCH v4 00/10] implement KASLR for powerpc/fsl_booke/32
Date: Mon, 5 Aug 2019 14:43:25 +0800
Message-ID: <20190805064335.19156-1-yanaijie@huawei.com>
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
 linux-kernel@vger.kernel.org, jingxiangfeng@huawei.com,
 zhaohongjiang@huawei.com, thunder.leizhen@huawei.com, fanchengyang@huawei.com,
 yebin10@huawei.com
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

                              kimage_vaddr

We also check if we will overlap with some areas like the dtb area, the
initrd area or the crashkernel area. If we cannot find a proper area,
kaslr will be disabled and boot from the original kernel.

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

Jason Yan (10):
  powerpc: unify definition of M_IF_NEEDED
  powerpc: move memstart_addr and kernstart_addr to init-common.c
  powerpc: introduce kimage_vaddr to store the kernel base
  powerpc/fsl_booke/32: introduce create_tlb_entry() helper
  powerpc/fsl_booke/32: introduce reloc_kernel_entry() helper
  powerpc/fsl_booke/32: implement KASLR infrastructure
  powerpc/fsl_booke/32: randomize the kernel image offset
  powerpc/fsl_booke/kaslr: clear the original kernel if randomized
  powerpc/fsl_booke/kaslr: support nokaslr cmdline parameter
  powerpc/fsl_booke/kaslr: dump out kernel offset information on panic

 arch/powerpc/Kconfig                          |  11 +
 arch/powerpc/include/asm/nohash/mmu-book3e.h  |  10 +
 arch/powerpc/include/asm/page.h               |   7 +
 arch/powerpc/kernel/Makefile                  |   1 +
 arch/powerpc/kernel/early_32.c                |   2 +-
 arch/powerpc/kernel/exceptions-64e.S          |  10 -
 arch/powerpc/kernel/fsl_booke_entry_mapping.S |  27 +-
 arch/powerpc/kernel/head_fsl_booke.S          |  55 ++-
 arch/powerpc/kernel/kaslr_booke.c             | 427 ++++++++++++++++++
 arch/powerpc/kernel/machine_kexec.c           |   1 +
 arch/powerpc/kernel/misc_64.S                 |   5 -
 arch/powerpc/kernel/setup-common.c            |  19 +
 arch/powerpc/mm/init-common.c                 |   7 +
 arch/powerpc/mm/init_32.c                     |   5 -
 arch/powerpc/mm/init_64.c                     |   5 -
 arch/powerpc/mm/mmu_decl.h                    |  10 +
 arch/powerpc/mm/nohash/fsl_booke.c            |   8 +-
 17 files changed, 560 insertions(+), 50 deletions(-)
 create mode 100644 arch/powerpc/kernel/kaslr_booke.c

-- 
2.17.2

