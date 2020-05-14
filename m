Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB611D37B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 19:13:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NJ5m3tc1zDqyk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 03:13:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=UiNIJV/T; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NHvm53KbzDqrm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 03:04:36 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2EC192074A;
 Thu, 14 May 2020 17:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589475874;
 bh=xweJf8JbBXv2N0m+Xkp28lrJp2sn8rF2oIaIC1/vAcU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UiNIJV/TKPvKb6Y462xOwwXv2HRP7UQve4lNaGEvdj8LQETTxEQRQGCbq1Uw2NEl0
 l1Qq7qCt/JRKyIYHxX8+1PE+TjHgXBcv11A2Mlz0M3RIGorU6U1Y1QxU833BGs9ZZC
 MLbm1mdl3F+UHqdDh5+O6s6UKtTvVcwB/w3WR8pU=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/12] mm: reorder includes after introduction of
 linux/pgtable.h
Date: Thu, 14 May 2020 20:03:18 +0300
Message-Id: <20200514170327.31389-4-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514170327.31389-1-rppt@kernel.org>
References: <20200514170327.31389-1-rppt@kernel.org>
MIME-Version: 1.0
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Brian Cain <bcain@codeaurora.org>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-parisc@vger.kernel.org,
 Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, linux-csky@vger.kernel.org,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Thomas Gleixner <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

The replacement of <asm/pgrable.h> with <linux/pgtable.h> made the include
of the latter in the middle of asm includes. Fix this up with the aid of
the below script and manual adjustments here and there.

	import sys
	import re

	if len(sys.argv) is not 3:
	    print "USAGE: %s <file> <header>" % (sys.argv[0])
	    sys.exit(1)

	hdr_to_move="#include <linux/%s>" % sys.argv[2]
	moved = False
	in_hdrs = False

	with open(sys.argv[1], "r") as f:
	    lines = f.readlines()
	    for _line in lines:
		line = _line.rstrip('\n')
		if line == hdr_to_move:
		    continue
		if line.startswith("#include <linux/"):
		    in_hdrs = True
		elif not moved and in_hdrs:
		    moved = True
		    print hdr_to_move
		print line

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/alpha/kernel/proto.h                             | 2 --
 arch/arc/mm/highmem.c                                 | 2 +-
 arch/arc/mm/tlbex.S                                   | 2 +-
 arch/arm/include/asm/efi.h                            | 1 -
 arch/arm/include/asm/fixmap.h                         | 2 +-
 arch/arm/kernel/head.S                                | 2 +-
 arch/arm/kernel/suspend.c                             | 2 +-
 arch/arm/kernel/vmlinux.lds.S                         | 2 +-
 arch/arm/mach-integrator/core.c                       | 2 +-
 arch/arm/mach-keystone/platsmp.c                      | 2 +-
 arch/arm/mach-sa1100/hackkit.c                        | 2 +-
 arch/arm/mach-zynq/common.c                           | 2 +-
 arch/arm/mm/idmap.c                                   | 2 +-
 arch/arm/mm/mm.h                                      | 1 -
 arch/arm/mm/proc-arm1020.S                            | 2 +-
 arch/arm/mm/proc-arm1020e.S                           | 2 +-
 arch/arm/mm/proc-arm1022.S                            | 2 +-
 arch/arm/mm/proc-arm1026.S                            | 2 +-
 arch/arm/mm/proc-arm720.S                             | 2 +-
 arch/arm/mm/proc-arm740.S                             | 2 +-
 arch/arm/mm/proc-arm7tdmi.S                           | 2 +-
 arch/arm/mm/proc-arm920.S                             | 2 +-
 arch/arm/mm/proc-arm922.S                             | 2 +-
 arch/arm/mm/proc-arm925.S                             | 2 +-
 arch/arm/mm/proc-arm926.S                             | 2 +-
 arch/arm/mm/proc-arm940.S                             | 2 +-
 arch/arm/mm/proc-arm946.S                             | 2 +-
 arch/arm/mm/proc-arm9tdmi.S                           | 2 +-
 arch/arm/mm/proc-fa526.S                              | 2 +-
 arch/arm/mm/proc-feroceon.S                           | 2 +-
 arch/arm/mm/proc-mohawk.S                             | 2 +-
 arch/arm/mm/proc-sa110.S                              | 2 +-
 arch/arm/mm/proc-sa1100.S                             | 2 +-
 arch/arm/mm/proc-v6.S                                 | 2 +-
 arch/arm/mm/proc-v7.S                                 | 2 +-
 arch/arm/mm/proc-xsc3.S                               | 2 +-
 arch/arm/mm/proc-xscale.S                             | 2 +-
 arch/arm/mm/pv-fixup-asm.S                            | 2 +-
 arch/arm64/include/asm/io.h                           | 2 +-
 arch/arm64/include/asm/kvm_mmu.h                      | 2 +-
 arch/arm64/include/asm/mmu_context.h                  | 2 +-
 arch/arm64/include/asm/vmap_stack.h                   | 2 +-
 arch/arm64/kernel/acpi.c                              | 2 +-
 arch/arm64/kernel/head.S                              | 2 +-
 arch/arm64/kernel/kaslr.c                             | 2 +-
 arch/arm64/kernel/suspend.c                           | 2 +-
 arch/arm64/kernel/vmlinux.lds.S                       | 1 -
 arch/arm64/mm/proc.S                                  | 2 +-
 arch/ia64/kernel/entry.S                              | 2 +-
 arch/ia64/kernel/head.S                               | 3 ++-
 arch/ia64/kernel/irq_ia64.c                           | 2 +-
 arch/ia64/kernel/ivt.S                                | 2 +-
 arch/ia64/kernel/kprobes.c                            | 2 +-
 arch/ia64/kernel/mca_asm.S                            | 2 +-
 arch/ia64/kernel/relocate_kernel.S                    | 4 +---
 arch/ia64/kernel/setup.c                              | 2 +-
 arch/ia64/kernel/uncached.c                           | 2 +-
 arch/ia64/kernel/vmlinux.lds.S                        | 2 +-
 arch/m68k/68000/m68VZ328.c                            | 2 +-
 arch/m68k/include/asm/sun3xflop.h                     | 2 +-
 arch/m68k/kernel/head.S                               | 2 +-
 arch/microblaze/include/asm/pgalloc.h                 | 2 +-
 arch/microblaze/kernel/hw_exception_handler.S         | 2 +-
 arch/microblaze/kernel/module.c                       | 2 +-
 arch/microblaze/kernel/setup.c                        | 2 +-
 arch/microblaze/mm/pgtable.c                          | 2 +-
 arch/mips/jazz/irq.c                                  | 2 +-
 arch/mips/jazz/setup.c                                | 2 +-
 arch/mips/kvm/mips.c                                  | 2 +-
 arch/mips/mm/tlbex.c                                  | 2 +-
 arch/nds32/include/asm/highmem.h                      | 1 -
 arch/nds32/kernel/head.S                              | 2 +-
 arch/nios2/kernel/nios2_ksyms.c                       | 2 +-
 arch/openrisc/include/asm/io.h                        | 1 -
 arch/openrisc/kernel/entry.S                          | 2 +-
 arch/openrisc/kernel/head.S                           | 2 +-
 arch/openrisc/kernel/or32_ksyms.c                     | 2 +-
 arch/openrisc/mm/ioremap.c                            | 2 +-
 arch/parisc/kernel/asm-offsets.c                      | 2 +-
 arch/parisc/kernel/entry.S                            | 2 +-
 arch/parisc/kernel/head.S                             | 2 +-
 arch/parisc/kernel/pacache.S                          | 2 +-
 arch/parisc/kernel/pdt.c                              | 2 +-
 arch/powerpc/include/asm/fixmap.h                     | 2 +-
 arch/powerpc/kernel/btext.c                           | 2 +-
 arch/powerpc/kernel/fpu.S                             | 1 -
 arch/powerpc/kernel/head_32.S                         | 2 +-
 arch/powerpc/kernel/head_40x.S                        | 2 +-
 arch/powerpc/kernel/head_44x.S                        | 2 +-
 arch/powerpc/kernel/head_8xx.S                        | 2 +-
 arch/powerpc/kernel/head_fsl_booke.S                  | 2 +-
 arch/powerpc/kernel/io-workarounds.c                  | 2 +-
 arch/powerpc/kernel/irq.c                             | 2 +-
 arch/powerpc/kernel/mce_power.c                       | 2 +-
 arch/powerpc/kernel/paca.c                            | 2 +-
 arch/powerpc/kernel/prom.c                            | 2 +-
 arch/powerpc/kernel/prom_init.c                       | 2 +-
 arch/powerpc/kernel/rtas_pci.c                        | 2 +-
 arch/powerpc/kernel/setup-common.c                    | 2 +-
 arch/powerpc/kernel/setup_32.c                        | 2 +-
 arch/powerpc/kernel/setup_64.c                        | 2 +-
 arch/powerpc/kernel/smp.c                             | 2 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c                | 2 +-
 arch/powerpc/kvm/book3s_hv_nested.c                   | 2 +-
 arch/powerpc/kvm/book3s_hv_rm_xics.c                  | 2 +-
 arch/powerpc/kvm/book3s_hv_rm_xive.c                  | 2 +-
 arch/powerpc/kvm/fpu.S                                | 2 +-
 arch/powerpc/mm/book3s32/hash_low.S                   | 2 +-
 arch/powerpc/mm/book3s64/hash_native.c                | 2 +-
 arch/powerpc/mm/book3s64/hash_utils.c                 | 2 +-
 arch/powerpc/mm/book3s64/slb.c                        | 2 +-
 arch/powerpc/mm/init-common.c                         | 2 +-
 arch/powerpc/mm/nohash/tlb_low_64e.S                  | 2 +-
 arch/powerpc/mm/ptdump/bats.c                         | 2 +-
 arch/powerpc/platforms/85xx/corenet_generic.c         | 2 +-
 arch/powerpc/platforms/85xx/mpc85xx_cds.c             | 2 +-
 arch/powerpc/platforms/85xx/qemu_e500.c               | 2 +-
 arch/powerpc/platforms/85xx/sbc8548.c                 | 2 +-
 arch/powerpc/platforms/85xx/smp.c                     | 2 +-
 arch/powerpc/platforms/86xx/mpc86xx_smp.c             | 2 +-
 arch/powerpc/platforms/cell/cbe_regs.c                | 2 +-
 arch/powerpc/platforms/cell/interrupt.c               | 2 +-
 arch/powerpc/platforms/cell/pervasive.c               | 2 +-
 arch/powerpc/platforms/cell/smp.c                     | 2 +-
 arch/powerpc/platforms/cell/spider-pic.c              | 2 +-
 arch/powerpc/platforms/chrp/pci.c                     | 2 +-
 arch/powerpc/platforms/chrp/smp.c                     | 2 +-
 arch/powerpc/platforms/powermac/smp.c                 | 2 +-
 arch/powerpc/platforms/pseries/lpar.c                 | 2 +-
 arch/powerpc/platforms/pseries/smp.c                  | 2 +-
 arch/powerpc/sysdev/mpic.c                            | 2 +-
 arch/riscv/include/asm/fixmap.h                       | 2 +-
 arch/riscv/include/asm/io.h                           | 2 +-
 arch/riscv/include/asm/kasan.h                        | 2 --
 arch/riscv/mm/cacheflush.c                            | 1 -
 arch/riscv/mm/kasan_init.c                            | 2 +-
 arch/s390/boot/ipl_parm.c                             | 2 +-
 arch/s390/boot/kaslr.c                                | 2 +-
 arch/s390/include/asm/hugetlb.h                       | 2 +-
 arch/s390/include/asm/kasan.h                         | 2 --
 arch/s390/kernel/asm-offsets.c                        | 2 +-
 arch/s390/kvm/gaccess.c                               | 2 +-
 arch/s390/kvm/kvm-s390.c                              | 2 +-
 arch/s390/kvm/priv.c                                  | 2 +-
 arch/s390/mm/extmem.c                                 | 2 +-
 arch/s390/mm/gmap.c                                   | 2 +-
 arch/s390/mm/kasan_init.c                             | 2 +-
 arch/sh/mm/pmb.c                                      | 2 +-
 arch/sparc/include/asm/floppy_32.h                    | 2 +-
 arch/sparc/include/asm/highmem.h                      | 2 +-
 arch/sparc/include/asm/io-unit.h                      | 2 +-
 arch/sparc/include/asm/pgalloc_32.h                   | 2 +-
 arch/sparc/kernel/cpu.c                               | 2 +-
 arch/sparc/kernel/entry.S                             | 2 +-
 arch/sparc/kernel/head_64.S                           | 2 +-
 arch/sparc/kernel/ktlb.S                              | 2 +-
 arch/sparc/kernel/pci.c                               | 2 +-
 arch/sparc/kernel/sun4m_irq.c                         | 2 +-
 arch/sparc/kernel/trampoline_64.S                     | 2 +-
 arch/sparc/kernel/traps_32.c                          | 2 +-
 arch/sparc/lib/clear_page.S                           | 2 +-
 arch/sparc/mm/tsb.c                                   | 2 +-
 arch/sparc/mm/ultra.S                                 | 2 +-
 arch/unicore32/kernel/hibernate.c                     | 2 +-
 arch/unicore32/kernel/hibernate_asm.S                 | 2 +-
 arch/unicore32/mm/alignment.c                         | 2 +-
 arch/unicore32/mm/proc-ucv2.S                         | 2 +-
 arch/x86/boot/compressed/kaslr_64.c                   | 2 +-
 arch/x86/include/asm/asm-prototypes.h                 | 2 +-
 arch/x86/include/asm/efi.h                            | 2 +-
 arch/x86/include/asm/xen/hypercall.h                  | 2 +-
 arch/x86/kernel/acpi/boot.c                           | 2 +-
 arch/x86/kernel/acpi/sleep.c                          | 2 +-
 arch/x86/kernel/apic/apic_numachip.c                  | 2 +-
 arch/x86/kernel/cpu/bugs.c                            | 2 +-
 arch/x86/kernel/cpu/common.c                          | 2 +-
 arch/x86/kernel/cpu/intel.c                           | 2 +-
 arch/x86/kernel/crash_core_32.c                       | 2 +-
 arch/x86/kernel/crash_core_64.c                       | 2 +-
 arch/x86/kernel/early_printk.c                        | 2 +-
 arch/x86/kernel/head64.c                              | 2 +-
 arch/x86/kernel/head_64.S                             | 2 +-
 arch/x86/kernel/i8259.c                               | 2 +-
 arch/x86/kernel/irqinit.c                             | 2 +-
 arch/x86/kernel/kprobes/core.c                        | 2 +-
 arch/x86/kernel/kprobes/opt.c                         | 2 +-
 arch/x86/kernel/paravirt.c                            | 2 +-
 arch/x86/kernel/reboot.c                              | 2 +-
 arch/x86/kernel/smpboot.c                             | 2 +-
 arch/x86/mm/cpu_entry_area.c                          | 2 +-
 arch/x86/mm/ioremap.c                                 | 2 +-
 arch/x86/mm/kaslr.c                                   | 2 +-
 arch/x86/mm/mmio-mod.c                                | 2 +-
 arch/x86/mm/pat/memtype_interval.c                    | 2 +-
 arch/x86/mm/setup_nx.c                                | 2 +-
 arch/x86/platform/efi/efi_32.c                        | 2 +-
 arch/x86/platform/olpc/olpc_ofw.c                     | 2 +-
 arch/x86/power/cpu.c                                  | 2 +-
 arch/x86/power/hibernate.c                            | 2 +-
 arch/x86/power/hibernate_32.c                         | 2 +-
 arch/x86/power/hibernate_64.c                         | 2 +-
 arch/x86/realmode/init.c                              | 2 +-
 arch/x86/xen/mmu_pv.c                                 | 2 +-
 arch/x86/xen/smp_pv.c                                 | 2 +-
 arch/xtensa/include/asm/fixmap.h                      | 2 +-
 arch/xtensa/include/asm/highmem.h                     | 2 +-
 arch/xtensa/include/asm/mmu_context.h                 | 2 +-
 arch/xtensa/kernel/entry.S                            | 2 +-
 arch/xtensa/kernel/traps.c                            | 2 +-
 arch/xtensa/kernel/vectors.S                          | 2 +-
 arch/xtensa/mm/cache.c                                | 2 +-
 arch/xtensa/mm/ioremap.c                              | 2 +-
 arch/xtensa/mm/misc.S                                 | 2 +-
 drivers/acpi/scan.c                                   | 1 -
 drivers/atm/fore200e.c                                | 2 +-
 drivers/block/z2ram.c                                 | 2 +-
 drivers/firmware/efi/arm-runtime.c                    | 2 +-
 drivers/gpu/drm/drm_vm.c                              | 2 +-
 drivers/infiniband/hw/qib/qib_file_ops.c              | 2 +-
 drivers/macintosh/macio-adb.c                         | 2 +-
 drivers/macintosh/mediabay.c                          | 2 +-
 drivers/macintosh/via-pmu.c                           | 2 +-
 drivers/media/pci/bt8xx/bt878.c                       | 2 +-
 drivers/media/pci/bt8xx/btcx-risc.c                   | 2 +-
 drivers/media/pci/bt8xx/bttv-risc.c                   | 2 +-
 drivers/media/v4l2-core/videobuf-dma-sg.c             | 2 +-
 drivers/media/v4l2-core/videobuf-vmalloc.c            | 2 +-
 drivers/net/ethernet/amd/7990.c                       | 2 +-
 drivers/net/ethernet/amd/hplance.c                    | 2 +-
 drivers/net/ethernet/amd/mvme147.c                    | 2 +-
 drivers/net/ethernet/amd/sun3lance.c                  | 2 +-
 drivers/net/ethernet/amd/sunlance.c                   | 2 +-
 drivers/net/ethernet/apple/bmac.c                     | 2 +-
 drivers/net/ethernet/apple/mace.c                     | 2 +-
 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 2 +-
 drivers/net/ethernet/freescale/fs_enet/mac-fcc.c      | 2 +-
 drivers/net/ethernet/freescale/fs_enet/mii-fec.c      | 2 +-
 drivers/net/ethernet/i825xx/82596.c                   | 2 +-
 drivers/net/ethernet/korina.c                         | 2 +-
 drivers/net/ethernet/marvell/pxa168_eth.c             | 2 +-
 drivers/net/ethernet/natsemi/jazzsonic.c              | 2 +-
 drivers/net/ethernet/natsemi/macsonic.c               | 2 +-
 drivers/net/ethernet/natsemi/xtsonic.c                | 2 +-
 drivers/net/ethernet/sun/sunbmac.c                    | 2 +-
 drivers/net/ethernet/sun/sunqe.c                      | 2 +-
 drivers/scsi/53c700.c                                 | 2 +-
 drivers/scsi/arm/cumana_2.c                           | 2 +-
 drivers/scsi/arm/eesox.c                              | 2 +-
 drivers/scsi/arm/powertec.c                           | 2 +-
 drivers/scsi/dpt_i2o.c                                | 2 +-
 drivers/scsi/mac53c94.c                               | 2 +-
 drivers/scsi/mesh.c                                   | 2 +-
 drivers/scsi/qlogicpti.c                              | 2 +-
 drivers/scsi/zorro_esp.c                              | 2 +-
 include/linux/crash_dump.h                            | 1 +
 include/linux/io-mapping.h                            | 2 +-
 include/linux/kasan.h                                 | 2 +-
 include/linux/mm.h                                    | 2 +-
 include/xen/arm/page.h                                | 2 +-
 mm/init-mm.c                                          | 2 +-
 mm/mincore.c                                          | 2 +-
 mm/zsmalloc.c                                         | 2 +-
 sound/pci/hda/hda_intel.c                             | 2 +-
 sound/soc/intel/common/sst-firmware.c                 | 2 +-
 sound/soc/intel/haswell/sst-haswell-pcm.c             | 2 +-
 265 files changed, 255 insertions(+), 269 deletions(-)

diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
index a093cd45ec79..701a05090141 100644
--- a/arch/alpha/kernel/proto.h
+++ b/arch/alpha/kernel/proto.h
@@ -2,8 +2,6 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 
-#include <linux/pgtable.h>
-
 /* Prototypes of functions used across modules here in this directory.  */
 
 #define vucp	volatile unsigned char  *
diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
index 45e696dc3f0f..d6b74883fd1f 100644
--- a/arch/arc/mm/highmem.c
+++ b/arch/arc/mm/highmem.c
@@ -6,8 +6,8 @@
 #include <linux/memblock.h>
 #include <linux/export.h>
 #include <linux/highmem.h>
-#include <asm/processor.h>
 #include <linux/pgtable.h>
+#include <asm/processor.h>
 #include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 
diff --git a/arch/arc/mm/tlbex.S b/arch/arc/mm/tlbex.S
index 2bbd4d28352b..31f54bdd95f2 100644
--- a/arch/arc/mm/tlbex.S
+++ b/arch/arc/mm/tlbex.S
@@ -33,9 +33,9 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/pgtable.h>
 #include <asm/entry.h>
 #include <asm/mmu.h>
-#include <linux/pgtable.h>
 #include <asm/arcregs.h>
 #include <asm/cache.h>
 #include <asm/processor.h>
diff --git a/arch/arm/include/asm/efi.h b/arch/arm/include/asm/efi.h
index 62bc7f99c2ad..84dc0ba822f5 100644
--- a/arch/arm/include/asm/efi.h
+++ b/arch/arm/include/asm/efi.h
@@ -13,7 +13,6 @@
 #include <asm/highmem.h>
 #include <asm/mach/map.h>
 #include <asm/mmu_context.h>
-#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 
 #ifdef CONFIG_EFI
diff --git a/arch/arm/include/asm/fixmap.h b/arch/arm/include/asm/fixmap.h
index 1ec9366f0f2a..fc56fc3e1931 100644
--- a/arch/arm/include/asm/fixmap.h
+++ b/arch/arm/include/asm/fixmap.h
@@ -6,8 +6,8 @@
 #define FIXADDR_END		0xfff00000UL
 #define FIXADDR_TOP		(FIXADDR_END - PAGE_SIZE)
 
-#include <asm/kmap_types.h>
 #include <linux/pgtable.h>
+#include <asm/kmap_types.h>
 
 enum fixed_addresses {
 	FIX_EARLYCON_MEM_BASE,
diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
index 0290afdebd15..f8904227e7fd 100644
--- a/arch/arm/kernel/head.S
+++ b/arch/arm/kernel/head.S
@@ -10,6 +10,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 
 #include <asm/assembler.h>
 #include <asm/cp15.h>
@@ -18,7 +19,6 @@
 #include <asm/asm-offsets.h>
 #include <asm/memory.h>
 #include <asm/thread_info.h>
-#include <linux/pgtable.h>
 
 #if defined(CONFIG_DEBUG_LL) && !defined(CONFIG_DEBUG_SEMIHOSTING)
 #include CONFIG_DEBUG_LL_INCLUDE
diff --git a/arch/arm/kernel/suspend.c b/arch/arm/kernel/suspend.c
index d46f07b67d30..d2c9338d74e8 100644
--- a/arch/arm/kernel/suspend.c
+++ b/arch/arm/kernel/suspend.c
@@ -2,12 +2,12 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/mm_types.h>
+#include <linux/pgtable.h>
 
 #include <asm/bugs.h>
 #include <asm/cacheflush.h>
 #include <asm/idmap.h>
 #include <asm/pgalloc.h>
-#include <linux/pgtable.h>
 #include <asm/memory.h>
 #include <asm/smp_plat.h>
 #include <asm/suspend.h>
diff --git a/arch/arm/kernel/vmlinux.lds.S b/arch/arm/kernel/vmlinux.lds.S
index e111e606990d..7f24bc08403e 100644
--- a/arch/arm/kernel/vmlinux.lds.S
+++ b/arch/arm/kernel/vmlinux.lds.S
@@ -8,13 +8,13 @@
 #include "vmlinux-xip.lds.S"
 #else
 
+#include <linux/pgtable.h>
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/cache.h>
 #include <asm/thread_info.h>
 #include <asm/memory.h>
 #include <asm/mpu.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 
 #include "vmlinux.lds.h"
 
diff --git a/arch/arm/mach-integrator/core.c b/arch/arm/mach-integrator/core.c
index 7cda45a2ddef..0fe5e1dc9d89 100644
--- a/arch/arm/mach-integrator/core.c
+++ b/arch/arm/mach-integrator/core.c
@@ -21,10 +21,10 @@
 #include <linux/stat.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/pgtable.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/time.h>
-#include <linux/pgtable.h>
 
 #include "hardware.h"
 #include "cm.h"
diff --git a/arch/arm/mach-keystone/platsmp.c b/arch/arm/mach-keystone/platsmp.c
index db05c56b6ca8..673fcf3b34b1 100644
--- a/arch/arm/mach-keystone/platsmp.c
+++ b/arch/arm/mach-keystone/platsmp.c
@@ -12,11 +12,11 @@
 #include <linux/init.h>
 #include <linux/smp.h>
 #include <linux/io.h>
+#include <linux/pgtable.h>
 
 #include <asm/smp_plat.h>
 #include <asm/prom.h>
 #include <asm/tlbflush.h>
-#include <linux/pgtable.h>
 
 #include "keystone.h"
 
diff --git a/arch/arm/mach-sa1100/hackkit.c b/arch/arm/mach-sa1100/hackkit.c
index 5f8b74ad4f4f..3085f1c2e586 100644
--- a/arch/arm/mach-sa1100/hackkit.c
+++ b/arch/arm/mach-sa1100/hackkit.c
@@ -22,11 +22,11 @@
 #include <linux/gpio.h>
 #include <linux/leds.h>
 #include <linux/platform_device.h>
+#include <linux/pgtable.h>
 
 #include <asm/mach-types.h>
 #include <asm/setup.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/flash.h>
diff --git a/arch/arm/mach-zynq/common.c b/arch/arm/mach-zynq/common.c
index bfe572d76d1c..e1ca6a5732d2 100644
--- a/arch/arm/mach-zynq/common.c
+++ b/arch/arm/mach-zynq/common.c
@@ -24,13 +24,13 @@
 #include <linux/irqchip/arm-gic.h>
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
+#include <linux/pgtable.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 #include <asm/mach/time.h>
 #include <asm/mach-types.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/smp_scu.h>
 #include <asm/system_info.h>
 #include <asm/hardware/cache-l2x0.h>
diff --git a/arch/arm/mm/idmap.c b/arch/arm/mm/idmap.c
index c3166810c3d1..448e57c6f653 100644
--- a/arch/arm/mm/idmap.c
+++ b/arch/arm/mm/idmap.c
@@ -3,12 +3,12 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/mm_types.h>
+#include <linux/pgtable.h>
 
 #include <asm/cputype.h>
 #include <asm/idmap.h>
 #include <asm/hwcap.h>
 #include <asm/pgalloc.h>
-#include <linux/pgtable.h>
 #include <asm/sections.h>
 #include <asm/system_info.h>
 
diff --git a/arch/arm/mm/mm.h b/arch/arm/mm/mm.h
index 534f68484383..f9587d5fa8a4 100644
--- a/arch/arm/mm/mm.h
+++ b/arch/arm/mm/mm.h
@@ -2,7 +2,6 @@
 #ifdef CONFIG_MMU
 #include <linux/list.h>
 #include <linux/vmalloc.h>
-
 #include <linux/pgtable.h>
 
 /* the upper-most page table pointer */
diff --git a/arch/arm/mm/proc-arm1020.S b/arch/arm/mm/proc-arm1020.S
index cab58358a744..6837cf7a4812 100644
--- a/arch/arm/mm/proc-arm1020.S
+++ b/arch/arm/mm/proc-arm1020.S
@@ -11,11 +11,11 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm1020e.S b/arch/arm/mm/proc-arm1020e.S
index 283400780417..df49b10250b8 100644
--- a/arch/arm/mm/proc-arm1020e.S
+++ b/arch/arm/mm/proc-arm1020e.S
@@ -11,11 +11,11 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm1022.S b/arch/arm/mm/proc-arm1022.S
index 73ba773f8102..e89ce467f672 100644
--- a/arch/arm/mm/proc-arm1022.S
+++ b/arch/arm/mm/proc-arm1022.S
@@ -11,11 +11,11 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm1026.S b/arch/arm/mm/proc-arm1026.S
index 20f76b7c2116..7fdd1a205e8e 100644
--- a/arch/arm/mm/proc-arm1026.S
+++ b/arch/arm/mm/proc-arm1026.S
@@ -11,11 +11,11 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm720.S b/arch/arm/mm/proc-arm720.S
index 83acd7aebd7f..3b687e6dd9fd 100644
--- a/arch/arm/mm/proc-arm720.S
+++ b/arch/arm/mm/proc-arm720.S
@@ -20,11 +20,11 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm740.S b/arch/arm/mm/proc-arm740.S
index d395b91b005e..f2ec3bc60874 100644
--- a/arch/arm/mm/proc-arm740.S
+++ b/arch/arm/mm/proc-arm740.S
@@ -6,11 +6,11 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm7tdmi.S b/arch/arm/mm/proc-arm7tdmi.S
index 2dd3cc169b5f..01bbe7576c1c 100644
--- a/arch/arm/mm/proc-arm7tdmi.S
+++ b/arch/arm/mm/proc-arm7tdmi.S
@@ -6,11 +6,11 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm920.S b/arch/arm/mm/proc-arm920.S
index 0a059485b2bf..a234cd8ba5e6 100644
--- a/arch/arm/mm/proc-arm920.S
+++ b/arch/arm/mm/proc-arm920.S
@@ -13,10 +13,10 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm922.S b/arch/arm/mm/proc-arm922.S
index 852a572fc8dd..53c029dcfd83 100644
--- a/arch/arm/mm/proc-arm922.S
+++ b/arch/arm/mm/proc-arm922.S
@@ -14,10 +14,10 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
index 5ada5925aa71..0bfad62ea858 100644
--- a/arch/arm/mm/proc-arm925.S
+++ b/arch/arm/mm/proc-arm925.S
@@ -37,10 +37,10 @@
 
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm926.S b/arch/arm/mm/proc-arm926.S
index 260a849c84cf..0487a2c3439b 100644
--- a/arch/arm/mm/proc-arm926.S
+++ b/arch/arm/mm/proc-arm926.S
@@ -13,10 +13,10 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm940.S b/arch/arm/mm/proc-arm940.S
index f90763f5080c..cf9bfcc825ca 100644
--- a/arch/arm/mm/proc-arm940.S
+++ b/arch/arm/mm/proc-arm940.S
@@ -6,10 +6,10 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 #include "proc-macros.S"
 
diff --git a/arch/arm/mm/proc-arm946.S b/arch/arm/mm/proc-arm946.S
index 87beb81ab3bb..6fb3898ad1cd 100644
--- a/arch/arm/mm/proc-arm946.S
+++ b/arch/arm/mm/proc-arm946.S
@@ -8,10 +8,10 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 #include "proc-macros.S"
 
diff --git a/arch/arm/mm/proc-arm9tdmi.S b/arch/arm/mm/proc-arm9tdmi.S
index 88a22dd58f68..a054c0e9c034 100644
--- a/arch/arm/mm/proc-arm9tdmi.S
+++ b/arch/arm/mm/proc-arm9tdmi.S
@@ -6,11 +6,11 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-fa526.S b/arch/arm/mm/proc-fa526.S
index 38dc691b0ebf..2c73e0d47d08 100644
--- a/arch/arm/mm/proc-fa526.S
+++ b/arch/arm/mm/proc-fa526.S
@@ -11,10 +11,10 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
 
diff --git a/arch/arm/mm/proc-feroceon.S b/arch/arm/mm/proc-feroceon.S
index 33aa247943cb..61ce82aca6f0 100644
--- a/arch/arm/mm/proc-feroceon.S
+++ b/arch/arm/mm/proc-feroceon.S
@@ -8,10 +8,10 @@
 
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-mohawk.S b/arch/arm/mm/proc-mohawk.S
index 2e2b4207e68e..1645ccaffe96 100644
--- a/arch/arm/mm/proc-mohawk.S
+++ b/arch/arm/mm/proc-mohawk.S
@@ -9,10 +9,10 @@
 
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-sa110.S b/arch/arm/mm/proc-sa110.S
index 1cb988dc7c70..4071f7a61cb6 100644
--- a/arch/arm/mm/proc-sa110.S
+++ b/arch/arm/mm/proc-sa110.S
@@ -12,12 +12,12 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <mach/hardware.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-sa1100.S b/arch/arm/mm/proc-sa1100.S
index bc7cff5b6afa..e723bd4119d3 100644
--- a/arch/arm/mm/proc-sa1100.S
+++ b/arch/arm/mm/proc-sa1100.S
@@ -17,12 +17,12 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <mach/hardware.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 
 #include "proc-macros.S"
 
diff --git a/arch/arm/mm/proc-v6.S b/arch/arm/mm/proc-v6.S
index 323d735031e7..a0618f3e6836 100644
--- a/arch/arm/mm/proc-v6.S
+++ b/arch/arm/mm/proc-v6.S
@@ -9,11 +9,11 @@
  */
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 
 #include "proc-macros.S"
 
diff --git a/arch/arm/mm/proc-v7.S b/arch/arm/mm/proc-v7.S
index cfac7fd31689..28c9d32fa99a 100644
--- a/arch/arm/mm/proc-v7.S
+++ b/arch/arm/mm/proc-v7.S
@@ -9,11 +9,11 @@
 #include <linux/arm-smccc.h>
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 #include <asm/memory.h>
 
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-xsc3.S b/arch/arm/mm/proc-xsc3.S
index 37d461a21093..a17afe7e195a 100644
--- a/arch/arm/mm/proc-xsc3.S
+++ b/arch/arm/mm/proc-xsc3.S
@@ -23,9 +23,9 @@
 
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
-#include <linux/pgtable.h>
 #include <asm/pgtable-hwdef.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
diff --git a/arch/arm/mm/proc-xscale.S b/arch/arm/mm/proc-xscale.S
index 06fea1348f82..d82590aa71c0 100644
--- a/arch/arm/mm/proc-xscale.S
+++ b/arch/arm/mm/proc-xscale.S
@@ -19,9 +19,9 @@
 
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
-#include <linux/pgtable.h>
 #include <asm/pgtable-hwdef.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
diff --git a/arch/arm/mm/pv-fixup-asm.S b/arch/arm/mm/pv-fixup-asm.S
index 771f942a365a..8eade0416739 100644
--- a/arch/arm/mm/pv-fixup-asm.S
+++ b/arch/arm/mm/pv-fixup-asm.S
@@ -6,10 +6,10 @@
  * for Keystone 2
  */
 #include <linux/linkage.h>
+#include <linux/pgtable.h>
 #include <asm/asm-offsets.h>
 #include <asm/cp15.h>
 #include <asm/memory.h>
-#include <linux/pgtable.h>
 
 	.section ".idmap.text", "ax"
 
diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 1dbffe92739a..ff50dd731852 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -9,11 +9,11 @@
 #define __ASM_IO_H
 
 #include <linux/types.h>
+#include <linux/pgtable.h>
 
 #include <asm/byteorder.h>
 #include <asm/barrier.h>
 #include <asm/memory.h>
-#include <linux/pgtable.h>
 #include <asm/early_ioremap.h>
 #include <asm/alternative.h>
 #include <asm/cpufeature.h>
diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 7a6ce34ea353..f879274016bb 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -83,11 +83,11 @@ alternative_cb_end
 
 #else
 
+#include <linux/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/cache.h>
 #include <asm/cacheflush.h>
 #include <asm/mmu_context.h>
-#include <linux/pgtable.h>
 
 void kvm_update_va_mask(struct alt_instr *alt,
 			__le32 *origptr, __le32 *updptr, int nr_inst);
diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 67901dc864eb..b0bd9b55594c 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -14,13 +14,13 @@
 #include <linux/sched.h>
 #include <linux/sched/hotplug.h>
 #include <linux/mm_types.h>
+#include <linux/pgtable.h>
 
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/proc-fns.h>
 #include <asm-generic/mm_hooks.h>
 #include <asm/cputype.h>
-#include <linux/pgtable.h>
 #include <asm/sysreg.h>
 #include <asm/tlbflush.h>
 
diff --git a/arch/arm64/include/asm/vmap_stack.h b/arch/arm64/include/asm/vmap_stack.h
index 8c0d68559f0b..894e031b28d2 100644
--- a/arch/arm64/include/asm/vmap_stack.h
+++ b/arch/arm64/include/asm/vmap_stack.h
@@ -7,8 +7,8 @@
 #include <linux/gfp.h>
 #include <linux/kconfig.h>
 #include <linux/vmalloc.h>
-#include <asm/memory.h>
 #include <linux/pgtable.h>
+#include <asm/memory.h>
 #include <asm/thread_info.h>
 
 /*
diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index d2c7138c6906..177c2cecc3db 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -23,12 +23,12 @@
 #include <linux/of_fdt.h>
 #include <linux/smp.h>
 #include <linux/serial_core.h>
+#include <linux/pgtable.h>
 
 #include <acpi/ghes.h>
 #include <asm/cputype.h>
 #include <asm/cpu_ops.h>
 #include <asm/daifflags.h>
-#include <linux/pgtable.h>
 #include <asm/smp_plat.h>
 
 int acpi_noirq = 1;		/* skip ACPI IRQ initialization */
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index ef65ebbe1cf6..ff59e2de1329 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -12,6 +12,7 @@
 #include <linux/linkage.h>
 #include <linux/init.h>
 #include <linux/irqchip/arm-gic-v3.h>
+#include <linux/pgtable.h>
 
 #include <asm/asm_pointer_auth.h>
 #include <asm/assembler.h>
@@ -26,7 +27,6 @@
 #include <asm/kvm_arm.h>
 #include <asm/memory.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/smp.h>
 #include <asm/sysreg.h>
diff --git a/arch/arm64/kernel/kaslr.c b/arch/arm64/kernel/kaslr.c
index c8c62ddbaaf7..07c4c8cc4a67 100644
--- a/arch/arm64/kernel/kaslr.c
+++ b/arch/arm64/kernel/kaslr.c
@@ -10,6 +10,7 @@
 #include <linux/mm_types.h>
 #include <linux/sched.h>
 #include <linux/types.h>
+#include <linux/pgtable.h>
 
 #include <asm/archrandom.h>
 #include <asm/cacheflush.h>
@@ -17,7 +18,6 @@
 #include <asm/kernel-pgtable.h>
 #include <asm/memory.h>
 #include <asm/mmu.h>
-#include <linux/pgtable.h>
 #include <asm/sections.h>
 
 enum kaslr_status {
diff --git a/arch/arm64/kernel/suspend.c b/arch/arm64/kernel/suspend.c
index 10a1ee8a6eeb..c1dee9066ff9 100644
--- a/arch/arm64/kernel/suspend.c
+++ b/arch/arm64/kernel/suspend.c
@@ -3,13 +3,13 @@
 #include <linux/percpu.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/pgtable.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/daifflags.h>
 #include <asm/debug-monitors.h>
 #include <asm/exec.h>
-#include <linux/pgtable.h>
 #include <asm/memory.h>
 #include <asm/mmu_context.h>
 #include <asm/smp_plat.h>
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 8d08ef1dd57e..6827da7f3aa5 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -13,7 +13,6 @@
 #include <asm/thread_info.h>
 #include <asm/memory.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 
 #include "image.h"
 
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 3d248cb69198..756fc75f6eeb 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -9,11 +9,11 @@
 
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/asm_pointer_auth.h>
 #include <asm/hwcap.h>
-#include <linux/pgtable.h>
 #include <asm/pgtable-hwdef.h>
 #include <asm/cpufeature.h>
 #include <asm/alternative.h>
diff --git a/arch/ia64/kernel/entry.S b/arch/ia64/kernel/entry.S
index e1d7573d304f..c5efac285bc3 100644
--- a/arch/ia64/kernel/entry.S
+++ b/arch/ia64/kernel/entry.S
@@ -38,12 +38,12 @@
  */
 
 
+#include <linux/pgtable.h>
 #include <asm/asmmacro.h>
 #include <asm/cache.h>
 #include <asm/errno.h>
 #include <asm/kregs.h>
 #include <asm/asm-offsets.h>
-#include <linux/pgtable.h>
 #include <asm/percpu.h>
 #include <asm/processor.h>
 #include <asm/thread_info.h>
diff --git a/arch/ia64/kernel/head.S b/arch/ia64/kernel/head.S
index e6632c236324..30f1ef760136 100644
--- a/arch/ia64/kernel/head.S
+++ b/arch/ia64/kernel/head.S
@@ -21,18 +21,19 @@
  */
 
 
+#include <linux/pgtable.h>
 #include <asm/asmmacro.h>
 #include <asm/fpu.h>
 #include <asm/kregs.h>
 #include <asm/mmu_context.h>
 #include <asm/asm-offsets.h>
 #include <asm/pal.h>
-#include <linux/pgtable.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/mca_asm.h>
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <linux/pgtable.h>
 #include <asm/export.h>
 
 #ifdef CONFIG_HOTPLUG_CPU
diff --git a/arch/ia64/kernel/irq_ia64.c b/arch/ia64/kernel/irq_ia64.c
index 74a59d758995..6fff934150eb 100644
--- a/arch/ia64/kernel/irq_ia64.c
+++ b/arch/ia64/kernel/irq_ia64.c
@@ -16,6 +16,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/pgtable.h>
 
 #include <linux/jiffies.h>
 #include <linux/errno.h>
@@ -37,7 +38,6 @@
 #include <asm/intrinsics.h>
 #include <asm/io.h>
 #include <asm/hw_irq.h>
-#include <linux/pgtable.h>
 #include <asm/tlbflush.h>
 
 #ifdef CONFIG_PERFMON
diff --git a/arch/ia64/kernel/ivt.S b/arch/ia64/kernel/ivt.S
index 055025dbbddb..d6d4229b28db 100644
--- a/arch/ia64/kernel/ivt.S
+++ b/arch/ia64/kernel/ivt.S
@@ -48,11 +48,11 @@
  */
 
 
+#include <linux/pgtable.h>
 #include <asm/asmmacro.h>
 #include <asm/break.h>
 #include <asm/kregs.h>
 #include <asm/asm-offsets.h>
-#include <linux/pgtable.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/thread_info.h>
diff --git a/arch/ia64/kernel/kprobes.c b/arch/ia64/kernel/kprobes.c
index 66c1626c5cc7..7a7df944d798 100644
--- a/arch/ia64/kernel/kprobes.c
+++ b/arch/ia64/kernel/kprobes.c
@@ -17,8 +17,8 @@
 #include <linux/preempt.h>
 #include <linux/extable.h>
 #include <linux/kdebug.h>
-
 #include <linux/pgtable.h>
+
 #include <asm/sections.h>
 #include <asm/exception.h>
 
diff --git a/arch/ia64/kernel/mca_asm.S b/arch/ia64/kernel/mca_asm.S
index e88aa5e28477..0d6b8cf9d1d0 100644
--- a/arch/ia64/kernel/mca_asm.S
+++ b/arch/ia64/kernel/mca_asm.S
@@ -25,9 +25,9 @@
  *		Use per cpu MCA/INIT stacks for all data.
  */
 #include <linux/threads.h>
+#include <linux/pgtable.h>
 
 #include <asm/asmmacro.h>
-#include <linux/pgtable.h>
 #include <asm/processor.h>
 #include <asm/mca_asm.h>
 #include <asm/mca.h>
diff --git a/arch/ia64/kernel/relocate_kernel.S b/arch/ia64/kernel/relocate_kernel.S
index ddad8317ebbd..527a7b896a6e 100644
--- a/arch/ia64/kernel/relocate_kernel.S
+++ b/arch/ia64/kernel/relocate_kernel.S
@@ -8,10 +8,10 @@
  * Copyright (C) 2005 Khalid Aziz  <khalid.aziz@hp.com>
  * Copyright (C) 2005 Intel Corp,  Zou Nan hai <nanhai.zou@intel.com>
  */
+#include <linux/pgtable.h>
 #include <asm/asmmacro.h>
 #include <asm/kregs.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/mca_asm.h>
 
        /* Must be relocatable PIC code callable as a C function
@@ -319,5 +319,3 @@ GLOBAL_ENTRY(ia64_dump_cpu_regs)
         ;;
         br.ret.sptk.many rp
 END(ia64_dump_cpu_regs)
-
-
diff --git a/arch/ia64/kernel/setup.c b/arch/ia64/kernel/setup.c
index c15e2fa7b3df..d2d440fe855b 100644
--- a/arch/ia64/kernel/setup.c
+++ b/arch/ia64/kernel/setup.c
@@ -25,6 +25,7 @@
  */
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 
 #include <linux/acpi.h>
 #include <linux/console.h>
@@ -56,7 +57,6 @@
 #include <asm/meminit.h>
 #include <asm/page.h>
 #include <asm/patch.h>
-#include <linux/pgtable.h>
 #include <asm/processor.h>
 #include <asm/sal.h>
 #include <asm/sections.h>
diff --git a/arch/ia64/kernel/uncached.c b/arch/ia64/kernel/uncached.c
index 58f02d727053..0750f367837d 100644
--- a/arch/ia64/kernel/uncached.c
+++ b/arch/ia64/kernel/uncached.c
@@ -19,9 +19,9 @@
 #include <linux/nmi.h>
 #include <linux/genalloc.h>
 #include <linux/gfp.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/pal.h>
-#include <linux/pgtable.h>
 #include <linux/atomic.h>
 #include <asm/tlbflush.h>
 
diff --git a/arch/ia64/kernel/vmlinux.lds.S b/arch/ia64/kernel/vmlinux.lds.S
index 69efc4186318..d259690eb91a 100644
--- a/arch/ia64/kernel/vmlinux.lds.S
+++ b/arch/ia64/kernel/vmlinux.lds.S
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
+#include <linux/pgtable.h>
 #include <asm/cache.h>
 #include <asm/ptrace.h>
-#include <linux/pgtable.h>
 #include <asm/thread_info.h>
 
 #define EMITS_PT_NOTE
diff --git a/arch/m68k/68000/m68VZ328.c b/arch/m68k/68000/m68VZ328.c
index c8c6f6d23138..ada87b23afdc 100644
--- a/arch/m68k/68000/m68VZ328.c
+++ b/arch/m68k/68000/m68VZ328.c
@@ -22,8 +22,8 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/rtc.h>
-
 #include <linux/pgtable.h>
+
 #include <asm/machdep.h>
 #include <asm/MC68VZ328.h>
 #include <asm/bootstd.h>
diff --git a/arch/m68k/include/asm/sun3xflop.h b/arch/m68k/include/asm/sun3xflop.h
index cc2060f76953..93f2a8431c0e 100644
--- a/arch/m68k/include/asm/sun3xflop.h
+++ b/arch/m68k/include/asm/sun3xflop.h
@@ -10,8 +10,8 @@
 #ifndef __ASM_SUN3X_FLOPPY_H
 #define __ASM_SUN3X_FLOPPY_H
 
-#include <asm/page.h>
 #include <linux/pgtable.h>
+#include <asm/page.h>
 #include <asm/irq.h>
 #include <asm/sun3x.h>
 
diff --git a/arch/m68k/kernel/head.S b/arch/m68k/kernel/head.S
index e48c1bb13b19..29de2b3108ea 100644
--- a/arch/m68k/kernel/head.S
+++ b/arch/m68k/kernel/head.S
@@ -255,6 +255,7 @@
 
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/bootinfo.h>
 #include <asm/bootinfo-amiga.h>
 #include <asm/bootinfo-atari.h>
@@ -264,7 +265,6 @@
 #include <asm/bootinfo-vme.h>
 #include <asm/setup.h>
 #include <asm/entry.h>
-#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/asm-offsets.h>
 #ifdef CONFIG_MAC
diff --git a/arch/microblaze/include/asm/pgalloc.h b/arch/microblaze/include/asm/pgalloc.h
index c31a57d4aa0b..ebb6b7939bb8 100644
--- a/arch/microblaze/include/asm/pgalloc.h
+++ b/arch/microblaze/include/asm/pgalloc.h
@@ -12,11 +12,11 @@
 
 #include <linux/kernel.h>	/* For min/max macros */
 #include <linux/highmem.h>
+#include <linux/pgtable.h>
 #include <asm/setup.h>
 #include <asm/io.h>
 #include <asm/page.h>
 #include <asm/cache.h>
-#include <linux/pgtable.h>
 
 #define __HAVE_ARCH_PTE_ALLOC_ONE_KERNEL
 #include <asm-generic/pgalloc.h>
diff --git a/arch/microblaze/kernel/hw_exception_handler.S b/arch/microblaze/kernel/hw_exception_handler.S
index 32add49d1bef..54411de22fa6 100644
--- a/arch/microblaze/kernel/hw_exception_handler.S
+++ b/arch/microblaze/kernel/hw_exception_handler.S
@@ -68,9 +68,9 @@
 #include <asm/entry.h>
 #include <asm/current.h>
 #include <linux/linkage.h>
+#include <linux/pgtable.h>
 
 #include <asm/mmu.h>
-#include <linux/pgtable.h>
 #include <asm/signal.h>
 #include <asm/registers.h>
 #include <asm/asm-offsets.h>
diff --git a/arch/microblaze/kernel/module.c b/arch/microblaze/kernel/module.c
index a18d59fe7bf0..9f12e3c2bb42 100644
--- a/arch/microblaze/kernel/module.c
+++ b/arch/microblaze/kernel/module.c
@@ -11,8 +11,8 @@
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
 #include <linux/string.h>
-
 #include <linux/pgtable.h>
+
 #include <asm/cacheflush.h>
 
 int apply_relocate_add(Elf32_Shdr *sechdrs, const char *strtab,
diff --git a/arch/microblaze/kernel/setup.c b/arch/microblaze/kernel/setup.c
index fd883a46a42f..2310daff1f8a 100644
--- a/arch/microblaze/kernel/setup.c
+++ b/arch/microblaze/kernel/setup.c
@@ -18,6 +18,7 @@
 #include <linux/console.h>
 #include <linux/debugfs.h>
 #include <linux/of_fdt.h>
+#include <linux/pgtable.h>
 
 #include <asm/setup.h>
 #include <asm/sections.h>
@@ -33,7 +34,6 @@
 #include <asm/entry.h>
 #include <asm/cpuinfo.h>
 
-#include <linux/pgtable.h>
 
 DEFINE_PER_CPU(unsigned int, KSP);	/* Saved kernel stack pointer */
 DEFINE_PER_CPU(unsigned int, KM);	/* Kernel/user mode */
diff --git a/arch/microblaze/mm/pgtable.c b/arch/microblaze/mm/pgtable.c
index 9db7dd5e897a..38ccb909bc9d 100644
--- a/arch/microblaze/mm/pgtable.c
+++ b/arch/microblaze/mm/pgtable.c
@@ -32,8 +32,8 @@
 #include <linux/vmalloc.h>
 #include <linux/init.h>
 #include <linux/mm_types.h>
-
 #include <linux/pgtable.h>
+
 #include <asm/pgalloc.h>
 #include <linux/io.h>
 #include <asm/mmu.h>
diff --git a/arch/mips/jazz/irq.c b/arch/mips/jazz/irq.c
index 68f1b94d3b1f..495ba7cc56ec 100644
--- a/arch/mips/jazz/irq.c
+++ b/arch/mips/jazz/irq.c
@@ -14,12 +14,12 @@
 #include <linux/smp.h>
 #include <linux/spinlock.h>
 #include <linux/irq.h>
+#include <linux/pgtable.h>
 
 #include <asm/irq_cpu.h>
 #include <asm/i8259.h>
 #include <asm/io.h>
 #include <asm/jazz.h>
-#include <linux/pgtable.h>
 #include <asm/tlbmisc.h>
 
 static DEFINE_RAW_SPINLOCK(r4030_lock);
diff --git a/arch/mips/jazz/setup.c b/arch/mips/jazz/setup.c
index 8283bbed77b0..04aab419a0fc 100644
--- a/arch/mips/jazz/setup.c
+++ b/arch/mips/jazz/setup.c
@@ -17,11 +17,11 @@
 #include <linux/platform_device.h>
 #include <linux/serial_8250.h>
 #include <linux/dma-mapping.h>
+#include <linux/pgtable.h>
 
 #include <asm/jazz.h>
 #include <asm/jazzdma.h>
 #include <asm/reboot.h>
-#include <linux/pgtable.h>
 #include <asm/tlbmisc.h>
 
 extern asmlinkage void jazz_handle_int(void);
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index da70b1e62d8d..e8acc7e6317a 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -19,13 +19,13 @@
 #include <linux/sched/signal.h>
 #include <linux/fs.h>
 #include <linux/memblock.h>
+#include <linux/pgtable.h>
 
 #include <asm/fpu.h>
 #include <asm/page.h>
 #include <asm/cacheflush.h>
 #include <asm/mmu_context.h>
 #include <asm/pgalloc.h>
-#include <linux/pgtable.h>
 
 #include <linux/kvm_host.h>
 
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index a0c0c7eb25ad..14f8ba93367f 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -28,11 +28,11 @@
 #include <linux/smp.h>
 #include <linux/string.h>
 #include <linux/cache.h>
+#include <linux/pgtable.h>
 
 #include <asm/cacheflush.h>
 #include <asm/cpu-type.h>
 #include <asm/mmu_context.h>
-#include <linux/pgtable.h>
 #include <asm/war.h>
 #include <asm/uasm.h>
 #include <asm/setup.h>
diff --git a/arch/nds32/include/asm/highmem.h b/arch/nds32/include/asm/highmem.h
index 127e535d4367..fe986d0e6e3f 100644
--- a/arch/nds32/include/asm/highmem.h
+++ b/arch/nds32/include/asm/highmem.h
@@ -7,7 +7,6 @@
 #include <asm/proc-fns.h>
 #include <asm/kmap_types.h>
 #include <asm/fixmap.h>
-#include <linux/pgtable.h>
 
 /*
  * Right now we initialize only a single pte table. It can be extended
diff --git a/arch/nds32/kernel/head.S b/arch/nds32/kernel/head.S
index 76de206009c6..7347f00451a9 100644
--- a/arch/nds32/kernel/head.S
+++ b/arch/nds32/kernel/head.S
@@ -3,10 +3,10 @@
 
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 #include <asm/asm-offsets.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <linux/sizes.h>
 #include <asm/thread_info.h>
 
diff --git a/arch/nios2/kernel/nios2_ksyms.c b/arch/nios2/kernel/nios2_ksyms.c
index a9fdd8210db1..54f7b23df1bf 100644
--- a/arch/nios2/kernel/nios2_ksyms.c
+++ b/arch/nios2/kernel/nios2_ksyms.c
@@ -8,9 +8,9 @@
 
 #include <linux/export.h>
 #include <linux/string.h>
+#include <linux/pgtable.h>
 
 #include <asm/cacheflush.h>
-#include <linux/pgtable.h>
 
 /* string functions */
 
diff --git a/arch/openrisc/include/asm/io.h b/arch/openrisc/include/asm/io.h
index b90a09407141..db02fb2077d9 100644
--- a/arch/openrisc/include/asm/io.h
+++ b/arch/openrisc/include/asm/io.h
@@ -26,7 +26,6 @@
 #define PIO_MASK		0
 
 #include <asm-generic/io.h>
-#include <linux/pgtable.h>
 
 void __iomem *ioremap(phys_addr_t offset, unsigned long size);
 extern void iounmap(void *addr);
diff --git a/arch/openrisc/kernel/entry.S b/arch/openrisc/kernel/entry.S
index c2a3b36b8ee5..a1d25c3e28d1 100644
--- a/arch/openrisc/kernel/entry.S
+++ b/arch/openrisc/kernel/entry.S
@@ -13,6 +13,7 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/pgtable.h>
 
 #include <asm/processor.h>
 #include <asm/unistd.h>
@@ -21,7 +22,6 @@
 #include <asm/spr_defs.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
-#include <linux/pgtable.h>
 #include <asm/asm-offsets.h>
 
 #define DISABLE_INTERRUPTS(t1,t2)			\
diff --git a/arch/openrisc/kernel/head.S b/arch/openrisc/kernel/head.S
index 4d0636488829..af355e3f4619 100644
--- a/arch/openrisc/kernel/head.S
+++ b/arch/openrisc/kernel/head.S
@@ -16,10 +16,10 @@
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/serial_reg.h>
+#include <linux/pgtable.h>
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
-#include <linux/pgtable.h>
 #include <asm/thread_info.h>
 #include <asm/cache.h>
 #include <asm/spr_defs.h>
diff --git a/arch/openrisc/kernel/or32_ksyms.c b/arch/openrisc/kernel/or32_ksyms.c
index 7c0cae7423e4..277ac7a55752 100644
--- a/arch/openrisc/kernel/or32_ksyms.c
+++ b/arch/openrisc/kernel/or32_ksyms.c
@@ -18,6 +18,7 @@
 #include <linux/interrupt.h>
 #include <linux/vmalloc.h>
 #include <linux/semaphore.h>
+#include <linux/pgtable.h>
 
 #include <asm/processor.h>
 #include <linux/uaccess.h>
@@ -26,7 +27,6 @@
 #include <asm/hardirq.h>
 #include <asm/delay.h>
 #include <asm/pgalloc.h>
-#include <linux/pgtable.h>
 
 #define DECLARE_EXPORT(name) extern void name(void); EXPORT_SYMBOL(name)
 
diff --git a/arch/openrisc/mm/ioremap.c b/arch/openrisc/mm/ioremap.c
index a6b17d88c2fb..a978590d802d 100644
--- a/arch/openrisc/mm/ioremap.c
+++ b/arch/openrisc/mm/ioremap.c
@@ -13,11 +13,11 @@
 
 #include <linux/vmalloc.h>
 #include <linux/io.h>
+#include <linux/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/kmap_types.h>
 #include <asm/fixmap.h>
 #include <asm/bug.h>
-#include <linux/pgtable.h>
 #include <linux/sched.h>
 #include <asm/tlbflush.h>
 
diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
index e57b86009166..305768a40773 100644
--- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -20,8 +20,8 @@
 #include <linux/ptrace.h>
 #include <linux/hardirq.h>
 #include <linux/kbuild.h>
-
 #include <linux/pgtable.h>
+
 #include <asm/ptrace.h>
 #include <asm/processor.h>
 #include <asm/pdc.h>
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index b77cf5993de3..4b484ec7c7da 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -19,7 +19,6 @@
 #include <asm/psw.h>
 #include <asm/cache.h>		/* for L1_CACHE_SHIFT */
 #include <asm/assembly.h>	/* for LDREG/STREG defines */
-#include <linux/pgtable.h>
 #include <asm/signal.h>
 #include <asm/unistd.h>
 #include <asm/ldcw.h>
@@ -28,6 +27,7 @@
 #include <asm/alternative.h>
 
 #include <linux/linkage.h>
+#include <linux/pgtable.h>
 
 #ifdef CONFIG_64BIT
 	.level 2.0w
diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
index ad333e8b7677..aa93d775c34d 100644
--- a/arch/parisc/kernel/head.S
+++ b/arch/parisc/kernel/head.S
@@ -17,10 +17,10 @@
 #include <asm/pdc.h>
 	
 #include <asm/assembly.h>
-#include <linux/pgtable.h>
 
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 
 	.level	PA_ASM_LEVEL
 
diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 80c8c6103ce0..b2ba6d633065 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -21,12 +21,12 @@
 
 #include <asm/psw.h>
 #include <asm/assembly.h>
-#include <linux/pgtable.h>
 #include <asm/cache.h>
 #include <asm/ldcw.h>
 #include <asm/alternative.h>
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 
 	.section .text.hot
 	.align	16
diff --git a/arch/parisc/kernel/pdt.c b/arch/parisc/kernel/pdt.c
index bdfe445c0ff3..6e8550fefad6 100644
--- a/arch/parisc/kernel/pdt.c
+++ b/arch/parisc/kernel/pdt.c
@@ -17,11 +17,11 @@
 #include <linux/seq_file.h>
 #include <linux/kthread.h>
 #include <linux/initrd.h>
+#include <linux/pgtable.h>
 
 #include <asm/pdc.h>
 #include <asm/pdcpat.h>
 #include <asm/sections.h>
-#include <linux/pgtable.h>
 
 enum pdt_access_type {
 	PDT_NONE,
diff --git a/arch/powerpc/include/asm/fixmap.h b/arch/powerpc/include/asm/fixmap.h
index 27481b9e9b77..e8063f37c7cd 100644
--- a/arch/powerpc/include/asm/fixmap.h
+++ b/arch/powerpc/include/asm/fixmap.h
@@ -16,8 +16,8 @@
 
 #ifndef __ASSEMBLY__
 #include <linux/sizes.h>
-#include <asm/page.h>
 #include <linux/pgtable.h>
+#include <asm/page.h>
 #ifdef CONFIG_HIGHMEM
 #include <linux/threads.h>
 #include <asm/kmap_types.h>
diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
index 36dd553df8bb..02300edc6989 100644
--- a/arch/powerpc/kernel/btext.c
+++ b/arch/powerpc/kernel/btext.c
@@ -9,13 +9,13 @@
 #include <linux/init.h>
 #include <linux/export.h>
 #include <linux/memblock.h>
+#include <linux/pgtable.h>
 
 #include <asm/sections.h>
 #include <asm/prom.h>
 #include <asm/btext.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
-#include <linux/pgtable.h>
 #include <asm/io.h>
 #include <asm/processor.h>
 #include <asm/udbg.h>
diff --git a/arch/powerpc/kernel/fpu.S b/arch/powerpc/kernel/fpu.S
index e7463613dccd..8a43ae3023fe 100644
--- a/arch/powerpc/kernel/fpu.S
+++ b/arch/powerpc/kernel/fpu.S
@@ -12,7 +12,6 @@
 #include <asm/reg.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
-#include <linux/pgtable.h>
 #include <asm/cputable.h>
 #include <asm/cache.h>
 #include <asm/thread_info.h>
diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index 05796104e8ce..087ea6bde560 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -17,10 +17,10 @@
  */
 
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/reg.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
-#include <linux/pgtable.h>
 #include <asm/cputable.h>
 #include <asm/cache.h>
 #include <asm/thread_info.h>
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 07d60626929f..ec651034b5e3 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -26,10 +26,10 @@
  */
 
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
-#include <linux/pgtable.h>
 #include <asm/cputable.h>
 #include <asm/thread_info.h>
 #include <asm/ppc_asm.h>
diff --git a/arch/powerpc/kernel/head_44x.S b/arch/powerpc/kernel/head_44x.S
index c67defec6847..8e36718f3167 100644
--- a/arch/powerpc/kernel/head_44x.S
+++ b/arch/powerpc/kernel/head_44x.S
@@ -25,10 +25,10 @@
  */
 
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
-#include <linux/pgtable.h>
 #include <asm/cputable.h>
 #include <asm/thread_info.h>
 #include <asm/ppc_asm.h>
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index ee2b9f48536b..39fc4eadf2c5 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -16,11 +16,11 @@
 
 #include <linux/init.h>
 #include <linux/magic.h>
+#include <linux/pgtable.h>
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
 #include <asm/cache.h>
-#include <linux/pgtable.h>
 #include <asm/cputable.h>
 #include <asm/thread_info.h>
 #include <asm/ppc_asm.h>
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index 1b9e25e77cba..586a6ac501e9 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -28,10 +28,10 @@
 
 #include <linux/init.h>
 #include <linux/threads.h>
+#include <linux/pgtable.h>
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
-#include <linux/pgtable.h>
 #include <asm/cputable.h>
 #include <asm/thread_info.h>
 #include <asm/ppc_asm.h>
diff --git a/arch/powerpc/kernel/io-workarounds.c b/arch/powerpc/kernel/io-workarounds.c
index 03185161772a..51bbaae94ccc 100644
--- a/arch/powerpc/kernel/io-workarounds.c
+++ b/arch/powerpc/kernel/io-workarounds.c
@@ -10,10 +10,10 @@
 
 #include <linux/kernel.h>
 #include <linux/sched/mm.h>	/* for init_mm */
+#include <linux/pgtable.h>
 
 #include <asm/io.h>
 #include <asm/machdep.h>
-#include <linux/pgtable.h>
 #include <asm/ppc-pci.h>
 #include <asm/io-workarounds.h>
 #include <asm/pte-walk.h>
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 2c09bffdce2f..05b1cc0e009e 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -51,10 +51,10 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/vmalloc.h>
+#include <linux/pgtable.h>
 
 #include <linux/uaccess.h>
 #include <asm/io.h>
-#include <linux/pgtable.h>
 #include <asm/irq.h>
 #include <asm/cache.h>
 #include <asm/prom.h>
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index c54e8475fd24..f0456e1e0033 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -12,10 +12,10 @@
 #include <linux/types.h>
 #include <linux/ptrace.h>
 #include <linux/extable.h>
+#include <linux/pgtable.h>
 #include <asm/mmu.h>
 #include <asm/mce.h>
 #include <asm/machdep.h>
-#include <linux/pgtable.h>
 #include <asm/pte-walk.h>
 #include <asm/sstep.h>
 #include <asm/exception-64s.h>
diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index fbddbae795bd..12e81832280d 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -8,11 +8,11 @@
 #include <linux/memblock.h>
 #include <linux/sched/task.h>
 #include <linux/numa.h>
+#include <linux/pgtable.h>
 
 #include <asm/lppaca.h>
 #include <asm/paca.h>
 #include <asm/sections.h>
-#include <linux/pgtable.h>
 #include <asm/kexec.h>
 #include <asm/svm.h>
 #include <asm/ultravisor.h>
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 061cec01d2fa..841ed6b9e570 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -30,6 +30,7 @@
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
 #include <linux/cpu.h>
+#include <linux/pgtable.h>
 
 #include <asm/prom.h>
 #include <asm/rtas.h>
@@ -41,7 +42,6 @@
 #include <asm/smp.h>
 #include <asm/mmu.h>
 #include <asm/paca.h>
-#include <linux/pgtable.h>
 #include <asm/powernv.h>
 #include <asm/iommu.h>
 #include <asm/btext.h>
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 17b2a1ef8c1c..df3f59983f2a 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -26,6 +26,7 @@
 #include <linux/delay.h>
 #include <linux/initrd.h>
 #include <linux/bitops.h>
+#include <linux/pgtable.h>
 #include <asm/prom.h>
 #include <asm/rtas.h>
 #include <asm/page.h>
@@ -34,7 +35,6 @@
 #include <asm/io.h>
 #include <asm/smp.h>
 #include <asm/mmu.h>
-#include <linux/pgtable.h>
 #include <asm/iommu.h>
 #include <asm/btext.h>
 #include <asm/sections.h>
diff --git a/arch/powerpc/kernel/rtas_pci.c b/arch/powerpc/kernel/rtas_pci.c
index ef7a87a7d6d6..781c1869902e 100644
--- a/arch/powerpc/kernel/rtas_pci.c
+++ b/arch/powerpc/kernel/rtas_pci.c
@@ -13,9 +13,9 @@
 #include <linux/pci.h>
 #include <linux/string.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 
 #include <asm/io.h>
-#include <linux/pgtable.h>
 #include <asm/irq.h>
 #include <asm/prom.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 301279c1979f..8e8fb43855d7 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -31,13 +31,13 @@
 #include <linux/memblock.h>
 #include <linux/of_platform.h>
 #include <linux/hugetlb.h>
+#include <linux/pgtable.h>
 #include <asm/debugfs.h>
 #include <asm/io.h>
 #include <asm/paca.h>
 #include <asm/prom.h>
 #include <asm/processor.h>
 #include <asm/vdso_datapage.h>
-#include <linux/pgtable.h>
 #include <asm/smp.h>
 #include <asm/elf.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index f38fe628ca55..233767aa37b1 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -19,11 +19,11 @@
 #include <linux/memblock.h>
 #include <linux/export.h>
 #include <linux/nvram.h>
+#include <linux/pgtable.h>
 
 #include <asm/io.h>
 #include <asm/prom.h>
 #include <asm/processor.h>
-#include <linux/pgtable.h>
 #include <asm/setup.h>
 #include <asm/smp.h>
 #include <asm/elf.h>
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index cd6870e0360a..64f18299627d 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -30,13 +30,13 @@
 #include <linux/lockdep.h>
 #include <linux/memory.h>
 #include <linux/nmi.h>
+#include <linux/pgtable.h>
 
 #include <asm/debugfs.h>
 #include <asm/io.h>
 #include <asm/kdump.h>
 #include <asm/prom.h>
 #include <asm/processor.h>
-#include <linux/pgtable.h>
 #include <asm/smp.h>
 #include <asm/elf.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 7478b568c09b..e88606b31cf6 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -33,6 +33,7 @@
 #include <linux/processor.h>
 #include <linux/random.h>
 #include <linux/stackprotector.h>
+#include <linux/pgtable.h>
 
 #include <asm/ptrace.h>
 #include <linux/atomic.h>
@@ -41,7 +42,6 @@
 #include <asm/kvm_ppc.h>
 #include <asm/dbell.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/prom.h>
 #include <asm/smp.h>
 #include <asm/time.h>
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 78b87df5dab9..3248f789832b 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -11,12 +11,12 @@
 #include <linux/anon_inodes.h>
 #include <linux/file.h>
 #include <linux/debugfs.h>
+#include <linux/pgtable.h>
 
 #include <asm/kvm_ppc.h>
 #include <asm/kvm_book3s.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
-#include <linux/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/pte-walk.h>
 #include <asm/ultravisor.h>
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index abaa83a504e3..2e94e152dad4 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -11,11 +11,11 @@
 #include <linux/kernel.h>
 #include <linux/kvm_host.h>
 #include <linux/llist.h>
+#include <linux/pgtable.h>
 
 #include <asm/kvm_ppc.h>
 #include <asm/kvm_book3s.h>
 #include <asm/mmu.h>
-#include <linux/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/pte-walk.h>
 #include <asm/reg.h>
diff --git a/arch/powerpc/kvm/book3s_hv_rm_xics.c b/arch/powerpc/kvm/book3s_hv_rm_xics.c
index ce594d39d1bf..4d7e5610731a 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_xics.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_xics.c
@@ -8,6 +8,7 @@
 #include <linux/kvm_host.h>
 #include <linux/err.h>
 #include <linux/kernel_stat.h>
+#include <linux/pgtable.h>
 
 #include <asm/kvm_book3s.h>
 #include <asm/kvm_ppc.h>
@@ -15,7 +16,6 @@
 #include <asm/xics.h>
 #include <asm/synch.h>
 #include <asm/cputhreads.h>
-#include <linux/pgtable.h>
 #include <asm/ppc-opcode.h>
 #include <asm/pnv-pci.h>
 #include <asm/opal.h>
diff --git a/arch/powerpc/kvm/book3s_hv_rm_xive.c b/arch/powerpc/kvm/book3s_hv_rm_xive.c
index df0b567096d1..6f18632e30e9 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_xive.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_xive.c
@@ -3,6 +3,7 @@
 #include <linux/kvm_host.h>
 #include <linux/err.h>
 #include <linux/kernel_stat.h>
+#include <linux/pgtable.h>
 
 #include <asm/kvm_book3s.h>
 #include <asm/kvm_ppc.h>
@@ -11,7 +12,6 @@
 #include <asm/debug.h>
 #include <asm/synch.h>
 #include <asm/cputhreads.h>
-#include <linux/pgtable.h>
 #include <asm/ppc-opcode.h>
 #include <asm/pnv-pci.h>
 #include <asm/opal.h>
diff --git a/arch/powerpc/kvm/fpu.S b/arch/powerpc/kvm/fpu.S
index 0703d4480d3d..315c94946bad 100644
--- a/arch/powerpc/kvm/fpu.S
+++ b/arch/powerpc/kvm/fpu.S
@@ -5,10 +5,10 @@
  *    Copyright (C) 2010 Alexander Graf (agraf@suse.de)
  */
 
+#include <linux/pgtable.h>
 #include <asm/reg.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
-#include <linux/pgtable.h>
 #include <asm/cputable.h>
 #include <asm/cache.h>
 #include <asm/thread_info.h>
diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
index ebc9a7ef587a..76c12eb00335 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -14,9 +14,9 @@
  *  hash table, so this file is not used on them.)
  */
 
+#include <linux/pgtable.h>
 #include <asm/reg.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/cputable.h>
 #include <asm/ppc_asm.h>
 #include <asm/thread_info.h>
diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index d2a175576ff4..cf20e5229ce1 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -14,11 +14,11 @@
 #include <linux/processor.h>
 #include <linux/threads.h>
 #include <linux/smp.h>
+#include <linux/pgtable.h>
 
 #include <asm/machdep.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
-#include <linux/pgtable.h>
 #include <asm/trace.h>
 #include <asm/tlb.h>
 #include <asm/cputable.h>
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 425ea50f185e..51e3c15f7aff 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -35,10 +35,10 @@
 #include <linux/pkeys.h>
 #include <linux/hugetlb.h>
 #include <linux/cpu.h>
+#include <linux/pgtable.h>
 
 #include <asm/debugfs.h>
 #include <asm/processor.h>
-#include <linux/pgtable.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
 #include <asm/page.h>
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 5f0ef6f6475e..8c4ca4d62848 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -10,7 +10,6 @@
  */
 
 #include <asm/asm-prototypes.h>
-#include <linux/pgtable.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
 #include <asm/paca.h>
@@ -21,6 +20,7 @@
 #include <linux/compiler.h>
 #include <linux/context_tracking.h>
 #include <linux/mm_types.h>
+#include <linux/pgtable.h>
 
 #include <asm/udbg.h>
 #include <asm/code-patching.h>
diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
index 07acb2038fa4..8e0d792ac296 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -17,8 +17,8 @@
 #undef DEBUG
 
 #include <linux/string.h>
-#include <asm/pgalloc.h>
 #include <linux/pgtable.h>
+#include <asm/pgalloc.h>
 #include <asm/kup.h>
 
 phys_addr_t memstart_addr __ro_after_init = (phys_addr_t)~0ull;
diff --git a/arch/powerpc/mm/nohash/tlb_low_64e.S b/arch/powerpc/mm/nohash/tlb_low_64e.S
index 25cb8c18e02e..d5e2704d0096 100644
--- a/arch/powerpc/mm/nohash/tlb_low_64e.S
+++ b/arch/powerpc/mm/nohash/tlb_low_64e.S
@@ -6,6 +6,7 @@
  *      Ben. Herrenschmidt (benh@kernel.crashing.org), IBM Corp.
  */
 
+#include <linux/pgtable.h>
 #include <asm/processor.h>
 #include <asm/reg.h>
 #include <asm/page.h>
@@ -13,7 +14,6 @@
 #include <asm/ppc_asm.h>
 #include <asm/asm-offsets.h>
 #include <asm/cputable.h>
-#include <linux/pgtable.h>
 #include <asm/exception-64e.h>
 #include <asm/ppc-opcode.h>
 #include <asm/kvm_asm.h>
diff --git a/arch/powerpc/mm/ptdump/bats.c b/arch/powerpc/mm/ptdump/bats.c
index 87ccef750c05..f7063fd5f06b 100644
--- a/arch/powerpc/mm/ptdump/bats.c
+++ b/arch/powerpc/mm/ptdump/bats.c
@@ -6,8 +6,8 @@
  * This dumps the content of BATS
  */
 
-#include <asm/debugfs.h>
 #include <linux/pgtable.h>
+#include <asm/debugfs.h>
 #include <asm/cpu_has_feature.h>
 
 static char *pp_601(int k, int pp)
diff --git a/arch/powerpc/platforms/85xx/corenet_generic.c b/arch/powerpc/platforms/85xx/corenet_generic.c
index 3b82bb594436..6aa8defb5857 100644
--- a/arch/powerpc/platforms/85xx/corenet_generic.c
+++ b/arch/powerpc/platforms/85xx/corenet_generic.c
@@ -12,11 +12,11 @@
 #include <linux/kdev_t.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/pgtable.h>
 
 #include <asm/time.h>
 #include <asm/machdep.h>
 #include <asm/pci-bridge.h>
-#include <linux/pgtable.h>
 #include <asm/ppc-pci.h>
 #include <mm/mmu_decl.h>
 #include <asm/prom.h>
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_cds.c b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
index 70494097f048..172d2b7cfeb7 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_cds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
@@ -22,8 +22,8 @@
 #include <linux/interrupt.h>
 #include <linux/fsl_devices.h>
 #include <linux/of_platform.h>
-
 #include <linux/pgtable.h>
+
 #include <asm/page.h>
 #include <linux/atomic.h>
 #include <asm/time.h>
diff --git a/arch/powerpc/platforms/85xx/qemu_e500.c b/arch/powerpc/platforms/85xx/qemu_e500.c
index 1f6f02769e21..a4127b0b161f 100644
--- a/arch/powerpc/platforms/85xx/qemu_e500.c
+++ b/arch/powerpc/platforms/85xx/qemu_e500.c
@@ -13,8 +13,8 @@
 
 #include <linux/kernel.h>
 #include <linux/of_fdt.h>
-#include <asm/machdep.h>
 #include <linux/pgtable.h>
+#include <asm/machdep.h>
 #include <asm/time.h>
 #include <asm/udbg.h>
 #include <asm/mpic.h>
diff --git a/arch/powerpc/platforms/85xx/sbc8548.c b/arch/powerpc/platforms/85xx/sbc8548.c
index bec61b1ec0f0..e4acf5ce6b07 100644
--- a/arch/powerpc/platforms/85xx/sbc8548.c
+++ b/arch/powerpc/platforms/85xx/sbc8548.c
@@ -24,8 +24,8 @@
 #include <linux/interrupt.h>
 #include <linux/fsl_devices.h>
 #include <linux/of_platform.h>
-
 #include <linux/pgtable.h>
+
 #include <asm/page.h>
 #include <linux/atomic.h>
 #include <asm/time.h>
diff --git a/arch/powerpc/platforms/85xx/smp.c b/arch/powerpc/platforms/85xx/smp.c
index 28ca4d2afe5e..fda108bae95f 100644
--- a/arch/powerpc/platforms/85xx/smp.c
+++ b/arch/powerpc/platforms/85xx/smp.c
@@ -16,9 +16,9 @@
 #include <linux/highmem.h>
 #include <linux/cpu.h>
 #include <linux/fsl/guts.h>
+#include <linux/pgtable.h>
 
 #include <asm/machdep.h>
-#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/mpic.h>
 #include <asm/cacheflush.h>
diff --git a/arch/powerpc/platforms/86xx/mpc86xx_smp.c b/arch/powerpc/platforms/86xx/mpc86xx_smp.c
index edad7a694f03..2b0b08489fab 100644
--- a/arch/powerpc/platforms/86xx/mpc86xx_smp.c
+++ b/arch/powerpc/platforms/86xx/mpc86xx_smp.c
@@ -10,10 +10,10 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/delay.h>
+#include <linux/pgtable.h>
 
 #include <asm/code-patching.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/pci-bridge.h>
 #include <asm/mpic.h>
 #include <asm/cacheflush.h>
diff --git a/arch/powerpc/platforms/cell/cbe_regs.c b/arch/powerpc/platforms/cell/cbe_regs.c
index 8962b0864802..c2a0678d85db 100644
--- a/arch/powerpc/platforms/cell/cbe_regs.c
+++ b/arch/powerpc/platforms/cell/cbe_regs.c
@@ -12,9 +12,9 @@
 #include <linux/export.h>
 #include <linux/of_device.h>
 #include <linux/of_platform.h>
+#include <linux/pgtable.h>
 
 #include <asm/io.h>
-#include <linux/pgtable.h>
 #include <asm/prom.h>
 #include <asm/ptrace.h>
 #include <asm/cell-regs.h>
diff --git a/arch/powerpc/platforms/cell/interrupt.c b/arch/powerpc/platforms/cell/interrupt.c
index 735c9cdc650f..c0ab62ba6f16 100644
--- a/arch/powerpc/platforms/cell/interrupt.c
+++ b/arch/powerpc/platforms/cell/interrupt.c
@@ -23,9 +23,9 @@
 #include <linux/types.h>
 #include <linux/ioport.h>
 #include <linux/kernel_stat.h>
+#include <linux/pgtable.h>
 
 #include <asm/io.h>
-#include <linux/pgtable.h>
 #include <asm/prom.h>
 #include <asm/ptrace.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/cell/pervasive.c b/arch/powerpc/platforms/cell/pervasive.c
index 13d8a1b087ab..9068edef71f7 100644
--- a/arch/powerpc/platforms/cell/pervasive.c
+++ b/arch/powerpc/platforms/cell/pervasive.c
@@ -15,11 +15,11 @@
 #include <linux/percpu.h>
 #include <linux/types.h>
 #include <linux/kallsyms.h>
+#include <linux/pgtable.h>
 
 #include <asm/io.h>
 #include <asm/machdep.h>
 #include <asm/prom.h>
-#include <linux/pgtable.h>
 #include <asm/reg.h>
 #include <asm/cell-regs.h>
 #include <asm/cpu_has_feature.h>
diff --git a/arch/powerpc/platforms/cell/smp.c b/arch/powerpc/platforms/cell/smp.c
index cc38e6a6d5a7..c855a0aeb49c 100644
--- a/arch/powerpc/platforms/cell/smp.c
+++ b/arch/powerpc/platforms/cell/smp.c
@@ -21,12 +21,12 @@
 #include <linux/err.h>
 #include <linux/device.h>
 #include <linux/cpu.h>
+#include <linux/pgtable.h>
 
 #include <asm/ptrace.h>
 #include <linux/atomic.h>
 #include <asm/irq.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/io.h>
 #include <asm/prom.h>
 #include <asm/smp.h>
diff --git a/arch/powerpc/platforms/cell/spider-pic.c b/arch/powerpc/platforms/cell/spider-pic.c
index 4da3cdd34116..210785f59271 100644
--- a/arch/powerpc/platforms/cell/spider-pic.c
+++ b/arch/powerpc/platforms/cell/spider-pic.c
@@ -10,8 +10,8 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/ioport.h>
-
 #include <linux/pgtable.h>
+
 #include <asm/prom.h>
 #include <asm/io.h>
 
diff --git a/arch/powerpc/platforms/chrp/pci.c b/arch/powerpc/platforms/chrp/pci.c
index 7c81f363db4d..b2c2bf35b76c 100644
--- a/arch/powerpc/platforms/chrp/pci.c
+++ b/arch/powerpc/platforms/chrp/pci.c
@@ -8,9 +8,9 @@
 #include <linux/delay.h>
 #include <linux/string.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 
 #include <asm/io.h>
-#include <linux/pgtable.h>
 #include <asm/irq.h>
 #include <asm/hydra.h>
 #include <asm/prom.h>
diff --git a/arch/powerpc/platforms/chrp/smp.c b/arch/powerpc/platforms/chrp/smp.c
index c21199a10a0f..e30cd2915e54 100644
--- a/arch/powerpc/platforms/chrp/smp.c
+++ b/arch/powerpc/platforms/chrp/smp.c
@@ -16,12 +16,12 @@
 #include <linux/kernel_stat.h>
 #include <linux/delay.h>
 #include <linux/spinlock.h>
+#include <linux/pgtable.h>
 
 #include <asm/ptrace.h>
 #include <linux/atomic.h>
 #include <asm/irq.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/sections.h>
 #include <asm/io.h>
 #include <asm/prom.h>
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index 3b6f6f5ab7ac..3b879ee913ee 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -30,13 +30,13 @@
 #include <linux/hardirq.h>
 #include <linux/cpu.h>
 #include <linux/compiler.h>
+#include <linux/pgtable.h>
 
 #include <asm/ptrace.h>
 #include <linux/atomic.h>
 #include <asm/code-patching.h>
 #include <asm/irq.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/sections.h>
 #include <asm/io.h>
 #include <asm/prom.h>
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 6945964ad002..fd26f3d21d7b 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -21,10 +21,10 @@
 #include <linux/cpuhotplug.h>
 #include <linux/workqueue.h>
 #include <linux/proc_fs.h>
+#include <linux/pgtable.h>
 #include <asm/processor.h>
 #include <asm/mmu.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/machdep.h>
 #include <asm/mmu_context.h>
 #include <asm/iommu.h>
diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index 112c47780679..6891710833be 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -20,12 +20,12 @@
 #include <linux/err.h>
 #include <linux/device.h>
 #include <linux/cpu.h>
+#include <linux/pgtable.h>
 
 #include <asm/ptrace.h>
 #include <linux/atomic.h>
 #include <asm/irq.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/io.h>
 #include <asm/prom.h>
 #include <asm/smp.h>
diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index 0cd031eae55f..b0426f28946a 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -29,11 +29,11 @@
 #include <linux/slab.h>
 #include <linux/syscore_ops.h>
 #include <linux/ratelimit.h>
+#include <linux/pgtable.h>
 
 #include <asm/ptrace.h>
 #include <asm/signal.h>
 #include <asm/io.h>
-#include <linux/pgtable.h>
 #include <asm/irq.h>
 #include <asm/machdep.h>
 #include <asm/mpic.h>
diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index e6aa7d5e85f1..1ff075a8dfc7 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -8,8 +8,8 @@
 
 #include <linux/kernel.h>
 #include <linux/sizes.h>
-#include <asm/page.h>
 #include <linux/pgtable.h>
+#include <asm/page.h>
 
 #ifdef CONFIG_MMU
 /*
diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 05fcb95107a6..3835c3295dc5 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -12,8 +12,8 @@
 #define _ASM_RISCV_IO_H
 
 #include <linux/types.h>
-#include <asm/mmiowb.h>
 #include <linux/pgtable.h>
+#include <asm/mmiowb.h>
 
 /*
  * MMIO access functions are separated out to break dependency cycles
diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
index 660a9ecfacd8..b04028c6218c 100644
--- a/arch/riscv/include/asm/kasan.h
+++ b/arch/riscv/include/asm/kasan.h
@@ -8,8 +8,6 @@
 
 #ifdef CONFIG_KASAN
 
-#include <linux/pgtable.h>
-
 #define KASAN_SHADOW_SCALE_SHIFT	3
 
 #define KASAN_SHADOW_SIZE	(UL(1) << (38 - KASAN_SHADOW_SCALE_SHIFT))
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 1594a679eea2..094118663285 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -3,7 +3,6 @@
  * Copyright (C) 2017 SiFive
  */
 
-#include <linux/pgtable.h>
 #include <asm/cacheflush.h>
 
 #ifdef CONFIG_SMP
diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index e3808175b798..4a8b61806633 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -6,8 +6,8 @@
 #include <linux/kasan.h>
 #include <linux/kernel.h>
 #include <linux/memblock.h>
-#include <asm/tlbflush.h>
 #include <linux/pgtable.h>
+#include <asm/tlbflush.h>
 #include <asm/fixmap.h>
 
 extern pgd_t early_pg_dir[PTRS_PER_PGD];
diff --git a/arch/s390/boot/ipl_parm.c b/arch/s390/boot/ipl_parm.c
index b765f2d4172e..8e222a666025 100644
--- a/arch/s390/boot/ipl_parm.c
+++ b/arch/s390/boot/ipl_parm.c
@@ -2,12 +2,12 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/ctype.h>
+#include <linux/pgtable.h>
 #include <asm/ebcdic.h>
 #include <asm/sclp.h>
 #include <asm/sections.h>
 #include <asm/boot_data.h>
 #include <asm/facility.h>
-#include <linux/pgtable.h>
 #include <asm/uv.h>
 #include "boot.h"
 
diff --git a/arch/s390/boot/kaslr.c b/arch/s390/boot/kaslr.c
index 95376a19c69a..d4442163ffa9 100644
--- a/arch/s390/boot/kaslr.c
+++ b/arch/s390/boot/kaslr.c
@@ -2,8 +2,8 @@
 /*
  * Copyright IBM Corp. 2019
  */
-#include <asm/mem_detect.h>
 #include <linux/pgtable.h>
+#include <asm/mem_detect.h>
 #include <asm/cpacf.h>
 #include <asm/timex.h>
 #include <asm/sclp.h>
diff --git a/arch/s390/include/asm/hugetlb.h b/arch/s390/include/asm/hugetlb.h
index d806d3d28134..60f9241e5e4a 100644
--- a/arch/s390/include/asm/hugetlb.h
+++ b/arch/s390/include/asm/hugetlb.h
@@ -9,8 +9,8 @@
 #ifndef _ASM_S390_HUGETLB_H
 #define _ASM_S390_HUGETLB_H
 
-#include <asm/page.h>
 #include <linux/pgtable.h>
+#include <asm/page.h>
 
 #define hugetlb_free_pgd_range			free_pgd_range
 #define hugepages_supported()			(MACHINE_HAS_EDAT1)
diff --git a/arch/s390/include/asm/kasan.h b/arch/s390/include/asm/kasan.h
index d8f8e8d5abe0..89d6886040c8 100644
--- a/arch/s390/include/asm/kasan.h
+++ b/arch/s390/include/asm/kasan.h
@@ -2,8 +2,6 @@
 #ifndef __ASM_KASAN_H
 #define __ASM_KASAN_H
 
-#include <linux/pgtable.h>
-
 #ifdef CONFIG_KASAN
 
 #define KASAN_SHADOW_SCALE_SHIFT 3
diff --git a/arch/s390/kernel/asm-offsets.c b/arch/s390/kernel/asm-offsets.c
index f3daf5f8de3f..165031bd3370 100644
--- a/arch/s390/kernel/asm-offsets.c
+++ b/arch/s390/kernel/asm-offsets.c
@@ -11,9 +11,9 @@
 #include <linux/kvm_host.h>
 #include <linux/sched.h>
 #include <linux/purgatory.h>
+#include <linux/pgtable.h>
 #include <asm/idle.h>
 #include <asm/vdso.h>
-#include <linux/pgtable.h>
 #include <asm/gmap.h>
 #include <asm/nmi.h>
 #include <asm/stacktrace.h>
diff --git a/arch/s390/kvm/gaccess.c b/arch/s390/kvm/gaccess.c
index 0fefb440fe74..4e6fb34c7d90 100644
--- a/arch/s390/kvm/gaccess.c
+++ b/arch/s390/kvm/gaccess.c
@@ -9,8 +9,8 @@
 #include <linux/vmalloc.h>
 #include <linux/mm_types.h>
 #include <linux/err.h>
-
 #include <linux/pgtable.h>
+
 #include <asm/gmap.h>
 #include "kvm-s390.h"
 #include "gaccess.h"
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index a8a432bf5566..fe15413a5ba3 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -31,11 +31,11 @@
 #include <linux/bitmap.h>
 #include <linux/sched/signal.h>
 #include <linux/string.h>
+#include <linux/pgtable.h>
 
 #include <asm/asm-offsets.h>
 #include <asm/lowcore.h>
 #include <asm/stp.h>
-#include <linux/pgtable.h>
 #include <asm/gmap.h>
 #include <asm/nmi.h>
 #include <asm/switch_to.h>
diff --git a/arch/s390/kvm/priv.c b/arch/s390/kvm/priv.c
index 8ec0ab070a49..b579b77deea6 100644
--- a/arch/s390/kvm/priv.c
+++ b/arch/s390/kvm/priv.c
@@ -13,6 +13,7 @@
 #include <linux/errno.h>
 #include <linux/compat.h>
 #include <linux/mm_types.h>
+#include <linux/pgtable.h>
 
 #include <asm/asm-offsets.h>
 #include <asm/facility.h>
@@ -20,7 +21,6 @@
 #include <asm/debug.h>
 #include <asm/ebcdic.h>
 #include <asm/sysinfo.h>
-#include <linux/pgtable.h>
 #include <asm/page-states.h>
 #include <asm/pgalloc.h>
 #include <asm/gmap.h>
diff --git a/arch/s390/mm/extmem.c b/arch/s390/mm/extmem.c
index 982c65d22175..9e0aa7aa03ba 100644
--- a/arch/s390/mm/extmem.c
+++ b/arch/s390/mm/extmem.c
@@ -20,9 +20,9 @@
 #include <linux/ctype.h>
 #include <linux/ioport.h>
 #include <linux/refcount.h>
+#include <linux/pgtable.h>
 #include <asm/diag.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/ebcdic.h>
 #include <asm/errno.h>
 #include <asm/extmem.h>
diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
index 11b8fe47134d..223e14d4fcff 100644
--- a/arch/s390/mm/gmap.c
+++ b/arch/s390/mm/gmap.c
@@ -17,8 +17,8 @@
 #include <linux/swapops.h>
 #include <linux/ksm.h>
 #include <linux/mman.h>
-
 #include <linux/pgtable.h>
+
 #include <asm/pgalloc.h>
 #include <asm/gmap.h>
 #include <asm/tlb.h>
diff --git a/arch/s390/mm/kasan_init.c b/arch/s390/mm/kasan_init.c
index 6a5630731377..99dd1c63a065 100644
--- a/arch/s390/mm/kasan_init.c
+++ b/arch/s390/mm/kasan_init.c
@@ -2,8 +2,8 @@
 #include <linux/kasan.h>
 #include <linux/sched/task.h>
 #include <linux/memblock.h>
-#include <asm/pgalloc.h>
 #include <linux/pgtable.h>
+#include <asm/pgalloc.h>
 #include <asm/kasan.h>
 #include <asm/mem_detect.h>
 #include <asm/processor.h>
diff --git a/arch/sh/mm/pmb.c b/arch/sh/mm/pmb.c
index 76bb1b55fab8..b20aba6e1b37 100644
--- a/arch/sh/mm/pmb.c
+++ b/arch/sh/mm/pmb.c
@@ -23,10 +23,10 @@
 #include <linux/io.h>
 #include <linux/spinlock.h>
 #include <linux/vmalloc.h>
+#include <linux/pgtable.h>
 #include <asm/cacheflush.h>
 #include <linux/sizes.h>
 #include <linux/uaccess.h>
-#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
diff --git a/arch/sparc/include/asm/floppy_32.h b/arch/sparc/include/asm/floppy_32.h
index cf2cf02c8ff1..db191312b05f 100644
--- a/arch/sparc/include/asm/floppy_32.h
+++ b/arch/sparc/include/asm/floppy_32.h
@@ -9,8 +9,8 @@
 
 #include <linux/of.h>
 #include <linux/of_device.h>
-
 #include <linux/pgtable.h>
+
 #include <asm/idprom.h>
 #include <asm/oplib.h>
 #include <asm/auxio.h>
diff --git a/arch/sparc/include/asm/highmem.h b/arch/sparc/include/asm/highmem.h
index c9211454d500..6c35f0d27ee1 100644
--- a/arch/sparc/include/asm/highmem.h
+++ b/arch/sparc/include/asm/highmem.h
@@ -22,9 +22,9 @@
 #ifdef __KERNEL__
 
 #include <linux/interrupt.h>
+#include <linux/pgtable.h>
 #include <asm/vaddrs.h>
 #include <asm/kmap_types.h>
-#include <linux/pgtable.h>
 #include <asm/pgtsrmmu.h>
 
 /* declarations for highmem.c */
diff --git a/arch/sparc/include/asm/io-unit.h b/arch/sparc/include/asm/io-unit.h
index 88a976ccac39..8c38f5b9f927 100644
--- a/arch/sparc/include/asm/io-unit.h
+++ b/arch/sparc/include/asm/io-unit.h
@@ -7,8 +7,8 @@
 #define _SPARC_IO_UNIT_H
 
 #include <linux/spinlock.h>
-#include <asm/page.h>
 #include <linux/pgtable.h>
+#include <asm/page.h>
 
 /* The io-unit handles all virtual to physical address translations
  * that occur between the SBUS and physical memory.  Access by
diff --git a/arch/sparc/include/asm/pgalloc_32.h b/arch/sparc/include/asm/pgalloc_32.h
index b0577ca846b7..56ac98383258 100644
--- a/arch/sparc/include/asm/pgalloc_32.h
+++ b/arch/sparc/include/asm/pgalloc_32.h
@@ -4,9 +4,9 @@
 
 #include <linux/kernel.h>
 #include <linux/sched.h>
+#include <linux/pgtable.h>
 
 #include <asm/pgtsrmmu.h>
-#include <linux/pgtable.h>
 #include <asm/vaddrs.h>
 #include <asm/page.h>
 
diff --git a/arch/sparc/kernel/cpu.c b/arch/sparc/kernel/cpu.c
index 36936b613d36..79cd6ccfeac0 100644
--- a/arch/sparc/kernel/cpu.c
+++ b/arch/sparc/kernel/cpu.c
@@ -11,9 +11,9 @@
 #include <linux/init.h>
 #include <linux/smp.h>
 #include <linux/threads.h>
+#include <linux/pgtable.h>
 
 #include <asm/spitfire.h>
-#include <linux/pgtable.h>
 #include <asm/oplib.h>
 #include <asm/setup.h>
 #include <asm/page.h>
diff --git a/arch/sparc/kernel/entry.S b/arch/sparc/kernel/entry.S
index 5a666ca2bdf9..f636acf3312f 100644
--- a/arch/sparc/kernel/entry.S
+++ b/arch/sparc/kernel/entry.S
@@ -10,6 +10,7 @@
 
 #include <linux/linkage.h>
 #include <linux/errno.h>
+#include <linux/pgtable.h>
 
 #include <asm/head.h>
 #include <asm/asi.h>
@@ -20,7 +21,6 @@
 #include <asm/psr.h>
 #include <asm/vaddrs.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/winmacro.h>
 #include <asm/signal.h>
 #include <asm/obio.h>
diff --git a/arch/sparc/kernel/head_64.S b/arch/sparc/kernel/head_64.S
index d7269822e9dc..c5ff2472b3d9 100644
--- a/arch/sparc/kernel/head_64.S
+++ b/arch/sparc/kernel/head_64.S
@@ -12,13 +12,13 @@
 #include <linux/threads.h>
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <linux/pgtable.h>
 #include <asm/thread_info.h>
 #include <asm/asi.h>
 #include <asm/pstate.h>
 #include <asm/ptrace.h>
 #include <asm/spitfire.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/errno.h>
 #include <asm/signal.h>
 #include <asm/processor.h>
diff --git a/arch/sparc/kernel/ktlb.S b/arch/sparc/kernel/ktlb.S
index 0bd0a92337af..6bfaf73ce8a0 100644
--- a/arch/sparc/kernel/ktlb.S
+++ b/arch/sparc/kernel/ktlb.S
@@ -7,10 +7,10 @@
  * Copyright (C) 1996,98,99 Jakub Jelinek  (jj@sunsite.mff.cuni.cz)
  */
 
+#include <linux/pgtable.h>
 #include <asm/head.h>
 #include <asm/asi.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/tsb.h>
 
 	.text
diff --git a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c
index 1c76e9c02e6b..ca293ad05649 100644
--- a/arch/sparc/kernel/pci.c
+++ b/arch/sparc/kernel/pci.c
@@ -21,9 +21,9 @@
 #include <linux/init.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pgtable.h>
 
 #include <linux/uaccess.h>
-#include <linux/pgtable.h>
 #include <asm/irq.h>
 #include <asm/prom.h>
 #include <asm/apb.h>
diff --git a/arch/sparc/kernel/sun4m_irq.c b/arch/sparc/kernel/sun4m_irq.c
index afdac7ff174a..91b61f012d19 100644
--- a/arch/sparc/kernel/sun4m_irq.c
+++ b/arch/sparc/kernel/sun4m_irq.c
@@ -12,11 +12,11 @@
 
 #include <linux/slab.h>
 #include <linux/sched/debug.h>
+#include <linux/pgtable.h>
 
 #include <asm/timer.h>
 #include <asm/traps.h>
 #include <asm/pgalloc.h>
-#include <linux/pgtable.h>
 #include <asm/irq.h>
 #include <asm/io.h>
 #include <asm/cacheflush.h>
diff --git a/arch/sparc/kernel/trampoline_64.S b/arch/sparc/kernel/trampoline_64.S
index ee2c51034ba4..51bf1eb92a36 100644
--- a/arch/sparc/kernel/trampoline_64.S
+++ b/arch/sparc/kernel/trampoline_64.S
@@ -6,6 +6,7 @@
  */
 
 
+#include <linux/pgtable.h>
 #include <asm/head.h>
 #include <asm/asi.h>
 #include <asm/lsu.h>
@@ -13,7 +14,6 @@
 #include <asm/dcu.h>
 #include <asm/pstate.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/spitfire.h>
 #include <asm/processor.h>
 #include <asm/thread_info.h>
diff --git a/arch/sparc/kernel/traps_32.c b/arch/sparc/kernel/traps_32.c
index 3131b2a6187f..247a0d9683b2 100644
--- a/arch/sparc/kernel/traps_32.c
+++ b/arch/sparc/kernel/traps_32.c
@@ -18,12 +18,12 @@
 #include <linux/smp.h>
 #include <linux/kdebug.h>
 #include <linux/export.h>
+#include <linux/pgtable.h>
 
 #include <asm/delay.h>
 #include <asm/ptrace.h>
 #include <asm/oplib.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/unistd.h>
 #include <asm/traps.h>
 
diff --git a/arch/sparc/lib/clear_page.S b/arch/sparc/lib/clear_page.S
index 9f3776b2a48b..302d3454a994 100644
--- a/arch/sparc/lib/clear_page.S
+++ b/arch/sparc/lib/clear_page.S
@@ -5,10 +5,10 @@
  * Copyright (C) 1997 Jakub Jelinek (jakub@redhat.com)
  */
 
+#include <linux/pgtable.h>
 #include <asm/visasm.h>
 #include <asm/thread_info.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/spitfire.h>
 #include <asm/head.h>
 #include <asm/export.h>
diff --git a/arch/sparc/mm/tsb.c b/arch/sparc/mm/tsb.c
index e47753186d18..0dce4b7ff73e 100644
--- a/arch/sparc/mm/tsb.c
+++ b/arch/sparc/mm/tsb.c
@@ -8,9 +8,9 @@
 #include <linux/preempt.h>
 #include <linux/slab.h>
 #include <linux/mm_types.h>
+#include <linux/pgtable.h>
 
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/mmu_context.h>
 #include <asm/setup.h>
 #include <asm/tsb.h>
diff --git a/arch/sparc/mm/ultra.S b/arch/sparc/mm/ultra.S
index 5fb6888dd0ed..70e658d107e0 100644
--- a/arch/sparc/mm/ultra.S
+++ b/arch/sparc/mm/ultra.S
@@ -5,8 +5,8 @@
  * Copyright (C) 1997, 2000, 2008 David S. Miller (davem@davemloft.net)
  */
 
-#include <asm/asi.h>
 #include <linux/pgtable.h>
+#include <asm/asi.h>
 #include <asm/page.h>
 #include <asm/spitfire.h>
 #include <asm/mmu_context.h>
diff --git a/arch/unicore32/kernel/hibernate.c b/arch/unicore32/kernel/hibernate.c
index 3a216fd14b99..4cdf3c846a2d 100644
--- a/arch/unicore32/kernel/hibernate.c
+++ b/arch/unicore32/kernel/hibernate.c
@@ -11,9 +11,9 @@
 #include <linux/gfp.h>
 #include <linux/suspend.h>
 #include <linux/memblock.h>
+#include <linux/pgtable.h>
 
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/sections.h>
 #include <asm/suspend.h>
diff --git a/arch/unicore32/kernel/hibernate_asm.S b/arch/unicore32/kernel/hibernate_asm.S
index f854a847801b..a589bc189e24 100644
--- a/arch/unicore32/kernel/hibernate_asm.S
+++ b/arch/unicore32/kernel/hibernate_asm.S
@@ -11,9 +11,9 @@
 #include <linux/sys.h>
 #include <linux/errno.h>
 #include <linux/linkage.h>
+#include <linux/pgtable.h>
 #include <generated/asm-offsets.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/assembler.h>
 
 @ restore_image(pgd_t *resume_pg_dir, struct pbe *restore_pblist)
diff --git a/arch/unicore32/mm/alignment.c b/arch/unicore32/mm/alignment.c
index 258ae0efccbb..2ea98f7a4156 100644
--- a/arch/unicore32/mm/alignment.c
+++ b/arch/unicore32/mm/alignment.c
@@ -18,8 +18,8 @@
 #include <linux/init.h>
 #include <linux/sched.h>
 #include <linux/uaccess.h>
-
 #include <linux/pgtable.h>
+
 #include <asm/tlbflush.h>
 #include <asm/unaligned.h>
 
diff --git a/arch/unicore32/mm/proc-ucv2.S b/arch/unicore32/mm/proc-ucv2.S
index 0295dd4bfcaf..18f8c4fb21a0 100644
--- a/arch/unicore32/mm/proc-ucv2.S
+++ b/arch/unicore32/mm/proc-ucv2.S
@@ -8,10 +8,10 @@
  */
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <linux/pgtable.h>
 
 #include "proc-macros.S"
 
diff --git a/arch/x86/boot/compressed/kaslr_64.c b/arch/x86/boot/compressed/kaslr_64.c
index 6953c2307257..f9c5c13d979b 100644
--- a/arch/x86/boot/compressed/kaslr_64.c
+++ b/arch/x86/boot/compressed/kaslr_64.c
@@ -22,8 +22,8 @@
 #include "misc.h"
 
 /* These actually do the work of building the kernel identity maps. */
-#include <asm/init.h>
 #include <linux/pgtable.h>
+#include <asm/init.h>
 /* Use the static base for this part of the boot process */
 #undef __PAGE_OFFSET
 #define __PAGE_OFFSET __PAGE_OFFSET_BASE
diff --git a/arch/x86/include/asm/asm-prototypes.h b/arch/x86/include/asm/asm-prototypes.h
index cd773cbdf5a4..5a42f9206138 100644
--- a/arch/x86/include/asm/asm-prototypes.h
+++ b/arch/x86/include/asm/asm-prototypes.h
@@ -1,13 +1,13 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <asm/ftrace.h>
 #include <linux/uaccess.h>
+#include <linux/pgtable.h>
 #include <asm/string.h>
 #include <asm/page.h>
 #include <asm/checksum.h>
 
 #include <asm-generic/asm-prototypes.h>
 
-#include <linux/pgtable.h>
 #include <asm/special_insns.h>
 #include <asm/preempt.h>
 #include <asm/asm.h>
diff --git a/arch/x86/include/asm/efi.h b/arch/x86/include/asm/efi.h
index 8f4c9838c7d3..027b2a9d380f 100644
--- a/arch/x86/include/asm/efi.h
+++ b/arch/x86/include/asm/efi.h
@@ -3,12 +3,12 @@
 #define _ASM_X86_EFI_H
 
 #include <asm/fpu/api.h>
-#include <linux/pgtable.h>
 #include <asm/processor-flags.h>
 #include <asm/tlb.h>
 #include <asm/nospec-branch.h>
 #include <asm/mmu_context.h>
 #include <linux/build_bug.h>
+#include <linux/pgtable.h>
 
 extern unsigned long efi_fw_vendor, efi_config_table;
 
diff --git a/arch/x86/include/asm/xen/hypercall.h b/arch/x86/include/asm/xen/hypercall.h
index 9cb3a0cdcc8e..ba4c1b15908b 100644
--- a/arch/x86/include/asm/xen/hypercall.h
+++ b/arch/x86/include/asm/xen/hypercall.h
@@ -38,11 +38,11 @@
 #include <linux/errno.h>
 #include <linux/string.h>
 #include <linux/types.h>
+#include <linux/pgtable.h>
 
 #include <trace/events/xen.h>
 
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/smap.h>
 #include <asm/nospec-branch.h>
 
diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
index 2f04f4505166..7bdc0239a943 100644
--- a/arch/x86/kernel/acpi/boot.c
+++ b/arch/x86/kernel/acpi/boot.c
@@ -20,11 +20,11 @@
 #include <linux/pci.h>
 #include <linux/efi-bgrt.h>
 #include <linux/serial_core.h>
+#include <linux/pgtable.h>
 
 #include <asm/e820/api.h>
 #include <asm/irqdomain.h>
 #include <asm/pci_x86.h>
-#include <linux/pgtable.h>
 #include <asm/io_apic.h>
 #include <asm/apic.h>
 #include <asm/io.h>
diff --git a/arch/x86/kernel/acpi/sleep.c b/arch/x86/kernel/acpi/sleep.c
index c95a630f266e..cc1fea76aab0 100644
--- a/arch/x86/kernel/acpi/sleep.c
+++ b/arch/x86/kernel/acpi/sleep.c
@@ -10,9 +10,9 @@
 #include <linux/memblock.h>
 #include <linux/dmi.h>
 #include <linux/cpumask.h>
+#include <linux/pgtable.h>
 #include <asm/segment.h>
 #include <asm/desc.h>
-#include <linux/pgtable.h>
 #include <asm/cacheflush.h>
 #include <asm/realmode.h>
 
diff --git a/arch/x86/kernel/apic/apic_numachip.c b/arch/x86/kernel/apic/apic_numachip.c
index 5a58c85c22c7..35edd57f064a 100644
--- a/arch/x86/kernel/apic/apic_numachip.c
+++ b/arch/x86/kernel/apic/apic_numachip.c
@@ -12,11 +12,11 @@
  */
 #include <linux/types.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 
 #include <asm/numachip/numachip.h>
 #include <asm/numachip/numachip_csr.h>
 
-#include <linux/pgtable.h>
 
 #include "local.h"
 
diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index f75a0cca1ab7..c901b086bbdb 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -15,6 +15,7 @@
 #include <linux/nospec.h>
 #include <linux/prctl.h>
 #include <linux/sched/smt.h>
+#include <linux/pgtable.h>
 
 #include <asm/spec-ctrl.h>
 #include <asm/cmdline.h>
@@ -26,7 +27,6 @@
 #include <asm/vmx.h>
 #include <asm/paravirt.h>
 #include <asm/alternative.h>
-#include <linux/pgtable.h>
 #include <asm/set_memory.h>
 #include <asm/intel-family.h>
 #include <asm/e820/api.h>
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index efdeaf21aa5f..b367df8f54e7 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -21,6 +21,7 @@
 #include <linux/smp.h>
 #include <linux/io.h>
 #include <linux/syscore_ops.h>
+#include <linux/pgtable.h>
 
 #include <asm/stackprotector.h>
 #include <asm/perf_event.h>
@@ -35,7 +36,6 @@
 #include <asm/vsyscall.h>
 #include <linux/topology.h>
 #include <linux/cpumask.h>
-#include <linux/pgtable.h>
 #include <linux/atomic.h>
 #include <asm/proto.h>
 #include <asm/setup.h>
diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 1c00a443d6b9..63926c94eb5f 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/kernel.h>
+#include <linux/pgtable.h>
 
 #include <linux/string.h>
 #include <linux/bitops.h>
@@ -11,7 +12,6 @@
 #include <linux/uaccess.h>
 
 #include <asm/cpufeature.h>
-#include <linux/pgtable.h>
 #include <asm/msr.h>
 #include <asm/bugs.h>
 #include <asm/cpu.h>
diff --git a/arch/x86/kernel/crash_core_32.c b/arch/x86/kernel/crash_core_32.c
index dfa6ed2156fd..8a89c109e20a 100644
--- a/arch/x86/kernel/crash_core_32.c
+++ b/arch/x86/kernel/crash_core_32.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <linux/crash_core.h>
-
 #include <linux/pgtable.h>
+
 #include <asm/setup.h>
 
 void arch_crash_save_vmcoreinfo(void)
diff --git a/arch/x86/kernel/crash_core_64.c b/arch/x86/kernel/crash_core_64.c
index 15ddebde8741..7d255f882afe 100644
--- a/arch/x86/kernel/crash_core_64.c
+++ b/arch/x86/kernel/crash_core_64.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <linux/crash_core.h>
-
 #include <linux/pgtable.h>
+
 #include <asm/setup.h>
 
 void arch_crash_save_vmcoreinfo(void)
diff --git a/arch/x86/kernel/early_printk.c b/arch/x86/kernel/early_printk.c
index dee2ea5223d8..d3c531d3b244 100644
--- a/arch/x86/kernel/early_printk.c
+++ b/arch/x86/kernel/early_printk.c
@@ -8,6 +8,7 @@
 #include <linux/pci_regs.h>
 #include <linux/pci_ids.h>
 #include <linux/errno.h>
+#include <linux/pgtable.h>
 #include <asm/io.h>
 #include <asm/processor.h>
 #include <asm/fcntl.h>
@@ -15,7 +16,6 @@
 #include <xen/hvc-console.h>
 #include <asm/pci-direct.h>
 #include <asm/fixmap.h>
-#include <linux/pgtable.h>
 #include <linux/usb/ehci_def.h>
 #include <linux/usb/xhci-dbgp.h>
 #include <asm/pci_x86.h>
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index b01373e7db7c..cbb71c1b574f 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -20,13 +20,13 @@
 #include <linux/io.h>
 #include <linux/memblock.h>
 #include <linux/mem_encrypt.h>
+#include <linux/pgtable.h>
 
 #include <asm/processor.h>
 #include <asm/proto.h>
 #include <asm/smp.h>
 #include <asm/setup.h>
 #include <asm/desc.h>
-#include <linux/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/sections.h>
 #include <asm/kdebug.h>
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index a4147d80c9c5..4fc33fdf0f16 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -13,8 +13,8 @@
 #include <linux/linkage.h>
 #include <linux/threads.h>
 #include <linux/init.h>
-#include <asm/segment.h>
 #include <linux/pgtable.h>
+#include <asm/segment.h>
 #include <asm/page.h>
 #include <asm/msr.h>
 #include <asm/cache.h>
diff --git a/arch/x86/kernel/i8259.c b/arch/x86/kernel/i8259.c
index 33d56b7b8a4b..f3c76252247d 100644
--- a/arch/x86/kernel/i8259.c
+++ b/arch/x86/kernel/i8259.c
@@ -15,11 +15,11 @@
 #include <linux/acpi.h>
 #include <linux/io.h>
 #include <linux/delay.h>
+#include <linux/pgtable.h>
 
 #include <linux/atomic.h>
 #include <asm/timer.h>
 #include <asm/hw_irq.h>
-#include <linux/pgtable.h>
 #include <asm/desc.h>
 #include <asm/apic.h>
 #include <asm/i8259.h>
diff --git a/arch/x86/kernel/irqinit.c b/arch/x86/kernel/irqinit.c
index 6375df15e763..dd73135d7cee 100644
--- a/arch/x86/kernel/irqinit.c
+++ b/arch/x86/kernel/irqinit.c
@@ -16,11 +16,11 @@
 #include <linux/acpi.h>
 #include <linux/io.h>
 #include <linux/delay.h>
+#include <linux/pgtable.h>
 
 #include <linux/atomic.h>
 #include <asm/timer.h>
 #include <asm/hw_irq.h>
-#include <linux/pgtable.h>
 #include <asm/desc.h>
 #include <asm/apic.h>
 #include <asm/setup.h>
diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
index e939c606872f..85de8fa69b24 100644
--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -41,11 +41,11 @@
 #include <linux/kasan.h>
 #include <linux/moduleloader.h>
 #include <linux/vmalloc.h>
+#include <linux/pgtable.h>
 
 #include <asm/text-patching.h>
 #include <asm/cacheflush.h>
 #include <asm/desc.h>
-#include <linux/pgtable.h>
 #include <linux/uaccess.h>
 #include <asm/alternative.h>
 #include <asm/insn.h>
diff --git a/arch/x86/kernel/kprobes/opt.c b/arch/x86/kernel/kprobes/opt.c
index 184402c0a3b1..234f58e0fe8c 100644
--- a/arch/x86/kernel/kprobes/opt.c
+++ b/arch/x86/kernel/kprobes/opt.c
@@ -16,11 +16,11 @@
 #include <linux/kallsyms.h>
 #include <linux/ftrace.h>
 #include <linux/frame.h>
+#include <linux/pgtable.h>
 
 #include <asm/text-patching.h>
 #include <asm/cacheflush.h>
 #include <asm/desc.h>
-#include <linux/pgtable.h>
 #include <linux/uaccess.h>
 #include <asm/alternative.h>
 #include <asm/insn.h>
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 90a94876c50f..674a7d66d960 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -13,13 +13,13 @@
 #include <linux/bcd.h>
 #include <linux/highmem.h>
 #include <linux/kprobes.h>
+#include <linux/pgtable.h>
 
 #include <asm/bug.h>
 #include <asm/paravirt.h>
 #include <asm/debugreg.h>
 #include <asm/desc.h>
 #include <asm/setup.h>
-#include <linux/pgtable.h>
 #include <asm/time.h>
 #include <asm/pgalloc.h>
 #include <asm/irq.h>
diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index 8bfeb4213b4a..e040ba6be27b 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -11,13 +11,13 @@
 #include <linux/tboot.h>
 #include <linux/delay.h>
 #include <linux/frame.h>
+#include <linux/pgtable.h>
 #include <acpi/reboot.h>
 #include <asm/io.h>
 #include <asm/apic.h>
 #include <asm/io_apic.h>
 #include <asm/desc.h>
 #include <asm/hpet.h>
-#include <linux/pgtable.h>
 #include <asm/proto.h>
 #include <asm/reboot_fixups.h>
 #include <asm/reboot.h>
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 48caa588fd53..ffbd9a3d78d8 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -55,6 +55,7 @@
 #include <linux/gfp.h>
 #include <linux/cpuidle.h>
 #include <linux/numa.h>
+#include <linux/pgtable.h>
 
 #include <asm/acpi.h>
 #include <asm/desc.h>
@@ -63,7 +64,6 @@
 #include <asm/realmode.h>
 #include <asm/cpu.h>
 #include <asm/numa.h>
-#include <linux/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/mtrr.h>
 #include <asm/mwait.h>
diff --git a/arch/x86/mm/cpu_entry_area.c b/arch/x86/mm/cpu_entry_area.c
index bb7d114b5efb..6f8b48f545f4 100644
--- a/arch/x86/mm/cpu_entry_area.c
+++ b/arch/x86/mm/cpu_entry_area.c
@@ -4,9 +4,9 @@
 #include <linux/percpu.h>
 #include <linux/kallsyms.h>
 #include <linux/kcore.h>
+#include <linux/pgtable.h>
 
 #include <asm/cpu_entry_area.h>
-#include <linux/pgtable.h>
 #include <asm/fixmap.h>
 #include <asm/desc.h>
 
diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index 0dbd37371107..84d85dbd1dad 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -16,12 +16,12 @@
 #include <linux/mmiotrace.h>
 #include <linux/mem_encrypt.h>
 #include <linux/efi.h>
+#include <linux/pgtable.h>
 
 #include <asm/set_memory.h>
 #include <asm/e820/api.h>
 #include <asm/efi.h>
 #include <asm/fixmap.h>
-#include <linux/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/pgalloc.h>
 #include <asm/memtype.h>
diff --git a/arch/x86/mm/kaslr.c b/arch/x86/mm/kaslr.c
index b5968acddea8..faf02e1e1517 100644
--- a/arch/x86/mm/kaslr.c
+++ b/arch/x86/mm/kaslr.c
@@ -24,9 +24,9 @@
 #include <linux/init.h>
 #include <linux/random.h>
 #include <linux/memblock.h>
+#include <linux/pgtable.h>
 
 #include <asm/pgalloc.h>
-#include <linux/pgtable.h>
 #include <asm/setup.h>
 #include <asm/kaslr.h>
 
diff --git a/arch/x86/mm/mmio-mod.c b/arch/x86/mm/mmio-mod.c
index a57501bc8044..626eb6dd315b 100644
--- a/arch/x86/mm/mmio-mod.c
+++ b/arch/x86/mm/mmio-mod.c
@@ -17,8 +17,8 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/io.h>
-#include <linux/pgtable.h>
 #include <linux/mmiotrace.h>
+#include <linux/pgtable.h>
 #include <asm/e820/api.h> /* for ISA_START_ADDRESS */
 #include <linux/atomic.h>
 #include <linux/percpu.h>
diff --git a/arch/x86/mm/pat/memtype_interval.c b/arch/x86/mm/pat/memtype_interval.c
index 81b6c2d4ece4..645613d59942 100644
--- a/arch/x86/mm/pat/memtype_interval.c
+++ b/arch/x86/mm/pat/memtype_interval.c
@@ -14,8 +14,8 @@
 #include <linux/interval_tree_generic.h>
 #include <linux/sched.h>
 #include <linux/gfp.h>
-
 #include <linux/pgtable.h>
+
 #include <asm/memtype.h>
 
 #include "memtype.h"
diff --git a/arch/x86/mm/setup_nx.c b/arch/x86/mm/setup_nx.c
index e5e92b36e530..ed5667f5169f 100644
--- a/arch/x86/mm/setup_nx.c
+++ b/arch/x86/mm/setup_nx.c
@@ -2,8 +2,8 @@
 #include <linux/spinlock.h>
 #include <linux/errno.h>
 #include <linux/init.h>
-
 #include <linux/pgtable.h>
+
 #include <asm/proto.h>
 #include <asm/cpufeature.h>
 
diff --git a/arch/x86/platform/efi/efi_32.c b/arch/x86/platform/efi/efi_32.c
index 818dda62a6bb..826ead67753d 100644
--- a/arch/x86/platform/efi/efi_32.c
+++ b/arch/x86/platform/efi/efi_32.c
@@ -24,11 +24,11 @@
 #include <linux/types.h>
 #include <linux/ioport.h>
 #include <linux/efi.h>
+#include <linux/pgtable.h>
 
 #include <asm/io.h>
 #include <asm/desc.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/efi.h>
 
diff --git a/arch/x86/platform/olpc/olpc_ofw.c b/arch/x86/platform/olpc/olpc_ofw.c
index 77cf281ab8c5..6bab0f0aa8f3 100644
--- a/arch/x86/platform/olpc/olpc_ofw.c
+++ b/arch/x86/platform/olpc/olpc_ofw.c
@@ -3,12 +3,12 @@
 #include <linux/export.h>
 #include <linux/spinlock_types.h>
 #include <linux/init.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/setup.h>
 #include <asm/io.h>
 #include <asm/cpufeature.h>
 #include <asm/special_insns.h>
-#include <linux/pgtable.h>
 #include <asm/olpc_ofw.h>
 
 /* address of OFW callback interface; will be NULL if OFW isn't found */
diff --git a/arch/x86/power/cpu.c b/arch/x86/power/cpu.c
index 9559080695bf..7c65102debaf 100644
--- a/arch/x86/power/cpu.c
+++ b/arch/x86/power/cpu.c
@@ -13,8 +13,8 @@
 #include <linux/perf_event.h>
 #include <linux/tboot.h>
 #include <linux/dmi.h>
-
 #include <linux/pgtable.h>
+
 #include <asm/proto.h>
 #include <asm/mtrr.h>
 #include <asm/page.h>
diff --git a/arch/x86/power/hibernate.c b/arch/x86/power/hibernate.c
index c578c07a99e4..d147f1b2c925 100644
--- a/arch/x86/power/hibernate.c
+++ b/arch/x86/power/hibernate.c
@@ -12,6 +12,7 @@
 #include <linux/scatterlist.h>
 #include <linux/kdebug.h>
 #include <linux/cpu.h>
+#include <linux/pgtable.h>
 
 #include <crypto/hash.h>
 
@@ -19,7 +20,6 @@
 #include <asm/init.h>
 #include <asm/proto.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/mtrr.h>
 #include <asm/sections.h>
 #include <asm/suspend.h>
diff --git a/arch/x86/power/hibernate_32.c b/arch/x86/power/hibernate_32.c
index 2e17f388363e..223d5bca29b8 100644
--- a/arch/x86/power/hibernate_32.c
+++ b/arch/x86/power/hibernate_32.c
@@ -8,9 +8,9 @@
 #include <linux/gfp.h>
 #include <linux/suspend.h>
 #include <linux/memblock.h>
+#include <linux/pgtable.h>
 
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/mmzone.h>
 #include <asm/sections.h>
 #include <asm/suspend.h>
diff --git a/arch/x86/power/hibernate_64.c b/arch/x86/power/hibernate_64.c
index b0469e9442f8..a595953f1d6d 100644
--- a/arch/x86/power/hibernate_64.c
+++ b/arch/x86/power/hibernate_64.c
@@ -12,6 +12,7 @@
 #include <linux/suspend.h>
 #include <linux/scatterlist.h>
 #include <linux/kdebug.h>
+#include <linux/pgtable.h>
 
 #include <crypto/hash.h>
 
@@ -19,7 +20,6 @@
 #include <asm/init.h>
 #include <asm/proto.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/mtrr.h>
 #include <asm/sections.h>
 #include <asm/suspend.h>
diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
index cb3caf4aac1a..1ed1208931e0 100644
--- a/arch/x86/realmode/init.c
+++ b/arch/x86/realmode/init.c
@@ -3,9 +3,9 @@
 #include <linux/slab.h>
 #include <linux/memblock.h>
 #include <linux/mem_encrypt.h>
+#include <linux/pgtable.h>
 
 #include <asm/set_memory.h>
-#include <linux/pgtable.h>
 #include <asm/realmode.h>
 #include <asm/tlbflush.h>
 #include <asm/crash.h>
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index b0aa0941eb98..a58d9c69807a 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -51,13 +51,13 @@
 #include <linux/memblock.h>
 #include <linux/seq_file.h>
 #include <linux/crash_dump.h>
+#include <linux/pgtable.h>
 #ifdef CONFIG_KEXEC_CORE
 #include <linux/kexec.h>
 #endif
 
 #include <trace/events/xen.h>
 
-#include <linux/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/fixmap.h>
 #include <asm/mmu_context.h>
diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index ffda51eb2c21..8fa01c545460 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -23,10 +23,10 @@
 #include <linux/nmi.h>
 #include <linux/cpuhotplug.h>
 #include <linux/stackprotector.h>
+#include <linux/pgtable.h>
 
 #include <asm/paravirt.h>
 #include <asm/desc.h>
-#include <linux/pgtable.h>
 #include <asm/cpu.h>
 
 #include <xen/interface/xen.h>
diff --git a/arch/xtensa/include/asm/fixmap.h b/arch/xtensa/include/asm/fixmap.h
index 1ff8a863b741..89a6d1b7994d 100644
--- a/arch/xtensa/include/asm/fixmap.h
+++ b/arch/xtensa/include/asm/fixmap.h
@@ -13,9 +13,9 @@
 #ifndef _ASM_FIXMAP_H
 #define _ASM_FIXMAP_H
 
-#include <linux/pgtable.h>
 #ifdef CONFIG_HIGHMEM
 #include <linux/threads.h>
+#include <linux/pgtable.h>
 #include <asm/kmap_types.h>
 #endif
 
diff --git a/arch/xtensa/include/asm/highmem.h b/arch/xtensa/include/asm/highmem.h
index 361bc2871701..eac503215f17 100644
--- a/arch/xtensa/include/asm/highmem.h
+++ b/arch/xtensa/include/asm/highmem.h
@@ -13,10 +13,10 @@
 #define _XTENSA_HIGHMEM_H
 
 #include <linux/wait.h>
+#include <linux/pgtable.h>
 #include <asm/cacheflush.h>
 #include <asm/fixmap.h>
 #include <asm/kmap_types.h>
-#include <linux/pgtable.h>
 
 #define PKMAP_BASE		((FIXADDR_START - \
 				  (LAST_PKMAP + 1) * PAGE_SIZE) & PMD_MASK)
diff --git a/arch/xtensa/include/asm/mmu_context.h b/arch/xtensa/include/asm/mmu_context.h
index 023ed57211ce..74923ef3b228 100644
--- a/arch/xtensa/include/asm/mmu_context.h
+++ b/arch/xtensa/include/asm/mmu_context.h
@@ -18,10 +18,10 @@
 #include <linux/stringify.h>
 #include <linux/sched.h>
 #include <linux/mm_types.h>
+#include <linux/pgtable.h>
 
 #include <asm/vectors.h>
 
-#include <linux/pgtable.h>
 #include <asm/cacheflush.h>
 #include <asm/tlbflush.h>
 #include <asm-generic/mm_hooks.h>
diff --git a/arch/xtensa/kernel/entry.S b/arch/xtensa/kernel/entry.S
index 278c1730a2bb..bc21e0c6243b 100644
--- a/arch/xtensa/kernel/entry.S
+++ b/arch/xtensa/kernel/entry.S
@@ -13,6 +13,7 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/pgtable.h>
 #include <asm/asm-offsets.h>
 #include <asm/asmmacro.h>
 #include <asm/processor.h>
@@ -22,7 +23,6 @@
 #include <asm/unistd.h>
 #include <asm/ptrace.h>
 #include <asm/current.h>
-#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/signal.h>
 #include <asm/tlbflush.h>
diff --git a/arch/xtensa/kernel/traps.c b/arch/xtensa/kernel/traps.c
index e0668ba84d6b..efc3a29cde80 100644
--- a/arch/xtensa/kernel/traps.c
+++ b/arch/xtensa/kernel/traps.c
@@ -34,12 +34,12 @@
 #include <linux/delay.h>
 #include <linux/hardirq.h>
 #include <linux/ratelimit.h>
+#include <linux/pgtable.h>
 
 #include <asm/stacktrace.h>
 #include <asm/ptrace.h>
 #include <asm/timex.h>
 #include <linux/uaccess.h>
-#include <linux/pgtable.h>
 #include <asm/processor.h>
 #include <asm/traps.h>
 #include <asm/hw_breakpoint.h>
diff --git a/arch/xtensa/kernel/vectors.S b/arch/xtensa/kernel/vectors.S
index d0b2f1a34f14..1a7538ccfc5a 100644
--- a/arch/xtensa/kernel/vectors.S
+++ b/arch/xtensa/kernel/vectors.S
@@ -43,11 +43,11 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/pgtable.h>
 #include <asm/asmmacro.h>
 #include <asm/ptrace.h>
 #include <asm/current.h>
 #include <asm/asm-offsets.h>
-#include <linux/pgtable.h>
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/thread_info.h>
diff --git a/arch/xtensa/mm/cache.c b/arch/xtensa/mm/cache.c
index 200cafeed460..2369433b734a 100644
--- a/arch/xtensa/mm/cache.c
+++ b/arch/xtensa/mm/cache.c
@@ -24,6 +24,7 @@
 #include <linux/memblock.h>
 #include <linux/swap.h>
 #include <linux/pagemap.h>
+#include <linux/pgtable.h>
 
 #include <asm/bootparam.h>
 #include <asm/mmu_context.h>
@@ -31,7 +32,6 @@
 #include <asm/tlbflush.h>
 #include <asm/page.h>
 #include <asm/pgalloc.h>
-#include <linux/pgtable.h>
 
 /* 
  * Note:
diff --git a/arch/xtensa/mm/ioremap.c b/arch/xtensa/mm/ioremap.c
index bfefe16da26d..a400188c16b9 100644
--- a/arch/xtensa/mm/ioremap.c
+++ b/arch/xtensa/mm/ioremap.c
@@ -7,9 +7,9 @@
 
 #include <linux/io.h>
 #include <linux/vmalloc.h>
+#include <linux/pgtable.h>
 #include <asm/cacheflush.h>
 #include <asm/io.h>
-#include <linux/pgtable.h>
 
 static void __iomem *xtensa_ioremap(unsigned long paddr, unsigned long size,
 				    pgprot_t prot)
diff --git a/arch/xtensa/mm/misc.S b/arch/xtensa/mm/misc.S
index d2d2cee1e6f8..25cd67debee6 100644
--- a/arch/xtensa/mm/misc.S
+++ b/arch/xtensa/mm/misc.S
@@ -14,8 +14,8 @@
 
 
 #include <linux/linkage.h>
-#include <asm/page.h>
 #include <linux/pgtable.h>
+#include <asm/page.h>
 #include <asm/asmmacro.h>
 #include <asm/cacheasm.h>
 #include <asm/tlbflush.h>
diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 8df00430e80a..4da23e751bce 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -15,7 +15,6 @@
 #include <linux/nls.h>
 #include <linux/dma-mapping.h>
 #include <linux/platform_data/x86/apple.h>
-
 #include <linux/pgtable.h>
 
 #include "internal.h"
diff --git a/drivers/atm/fore200e.c b/drivers/atm/fore200e.c
index ab3980fae042..f4ad7ce25ae8 100644
--- a/drivers/atm/fore200e.c
+++ b/drivers/atm/fore200e.c
@@ -25,6 +25,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/delay.h>
 #include <linux/firmware.h>
+#include <linux/pgtable.h>
 #include <asm/io.h>
 #include <asm/string.h>
 #include <asm/page.h>
@@ -40,7 +41,6 @@
 #include <asm/idprom.h>
 #include <asm/openprom.h>
 #include <asm/oplib.h>
-#include <linux/pgtable.h>
 #endif
 
 #if defined(CONFIG_ATM_FORE200E_USE_TASKLET) /* defer interrupt work to a tasklet */
diff --git a/drivers/block/z2ram.c b/drivers/block/z2ram.c
index 6413de7fa53b..0e734802ee7c 100644
--- a/drivers/block/z2ram.c
+++ b/drivers/block/z2ram.c
@@ -35,10 +35,10 @@
 #include <linux/bitops.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
+#include <linux/pgtable.h>
 
 #include <asm/setup.h>
 #include <asm/amigahw.h>
-#include <linux/pgtable.h>
 
 #include <linux/zorro.h>
 
diff --git a/drivers/firmware/efi/arm-runtime.c b/drivers/firmware/efi/arm-runtime.c
index 9f0de2b2ca5d..3359ae2adf24 100644
--- a/drivers/firmware/efi/arm-runtime.c
+++ b/drivers/firmware/efi/arm-runtime.c
@@ -18,12 +18,12 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/pgtable.h>
 
 #include <asm/cacheflush.h>
 #include <asm/efi.h>
 #include <asm/mmu.h>
 #include <asm/pgalloc.h>
-#include <linux/pgtable.h>
 
 #if defined(CONFIG_PTDUMP_DEBUGFS) && defined(CONFIG_ARM64)
 #include <asm/ptdump.h>
diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
index 5a696012b62b..4391e242356d 100644
--- a/drivers/gpu/drm/drm_vm.c
+++ b/drivers/gpu/drm/drm_vm.c
@@ -37,6 +37,7 @@
 #include <linux/pci.h>
 #include <linux/seq_file.h>
 #include <linux/vmalloc.h>
+#include <linux/pgtable.h>
 
 #if defined(__ia64__)
 #include <linux/efi.h>
@@ -44,7 +45,6 @@
 #endif
 #include <linux/mem_encrypt.h>
 
-#include <linux/pgtable.h>
 
 #include <drm/drm_agpsupport.h>
 #include <drm/drm_device.h>
diff --git a/drivers/infiniband/hw/qib/qib_file_ops.c b/drivers/infiniband/hw/qib/qib_file_ops.c
index 84d8b7dbcdd6..ff87a67dd7b7 100644
--- a/drivers/infiniband/hw/qib/qib_file_ops.c
+++ b/drivers/infiniband/hw/qib/qib_file_ops.c
@@ -40,10 +40,10 @@
 #include <linux/highmem.h>
 #include <linux/io.h>
 #include <linux/jiffies.h>
-#include <linux/pgtable.h>
 #include <linux/delay.h>
 #include <linux/export.h>
 #include <linux/uio.h>
+#include <linux/pgtable.h>
 
 #include <rdma/ib.h>
 
diff --git a/drivers/macintosh/macio-adb.c b/drivers/macintosh/macio-adb.c
index 69fdcf1d07bf..d4759db002c6 100644
--- a/drivers/macintosh/macio-adb.c
+++ b/drivers/macintosh/macio-adb.c
@@ -9,10 +9,10 @@
 #include <linux/delay.h>
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
+#include <linux/pgtable.h>
 #include <asm/prom.h>
 #include <linux/adb.h>
 #include <asm/io.h>
-#include <linux/pgtable.h>
 #include <asm/hydra.h>
 #include <asm/irq.h>
 #include <linux/init.h>
diff --git a/drivers/macintosh/mediabay.c b/drivers/macintosh/mediabay.c
index de0709d137fd..eab7e83c11c4 100644
--- a/drivers/macintosh/mediabay.c
+++ b/drivers/macintosh/mediabay.c
@@ -16,8 +16,8 @@
 #include <linux/init.h>
 #include <linux/kthread.h>
 #include <linux/mutex.h>
-#include <asm/prom.h>
 #include <linux/pgtable.h>
+#include <asm/prom.h>
 #include <asm/io.h>
 #include <asm/machdep.h>
 #include <asm/pmac_feature.h>
diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
index 9be463afea47..8f90fd77149b 100644
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -50,9 +50,9 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/uaccess.h>
+#include <linux/pgtable.h>
 #include <asm/machdep.h>
 #include <asm/io.h>
-#include <linux/pgtable.h>
 #include <asm/sections.h>
 #include <asm/irq.h>
 #ifdef CONFIG_PPC_PMAC
diff --git a/drivers/media/pci/bt8xx/bt878.c b/drivers/media/pci/bt8xx/bt878.c
index d0a988775e3f..79ba15a9385a 100644
--- a/drivers/media/pci/bt8xx/bt878.c
+++ b/drivers/media/pci/bt8xx/bt878.c
@@ -13,9 +13,9 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
+#include <linux/pgtable.h>
 #include <asm/io.h>
 #include <linux/ioport.h>
-#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <linux/types.h>
 #include <linux/interrupt.h>
diff --git a/drivers/media/pci/bt8xx/btcx-risc.c b/drivers/media/pci/bt8xx/btcx-risc.c
index d01e8163bedf..51257980f539 100644
--- a/drivers/media/pci/bt8xx/btcx-risc.c
+++ b/drivers/media/pci/bt8xx/btcx-risc.c
@@ -17,8 +17,8 @@
 #include <linux/pci.h>
 #include <linux/interrupt.h>
 #include <linux/videodev2.h>
-#include <asm/page.h>
 #include <linux/pgtable.h>
+#include <asm/page.h>
 
 #include "btcx-risc.h"
 
diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt8xx/bttv-risc.c
index 4df0af840e68..4af72826b006 100644
--- a/drivers/media/pci/bt8xx/bttv-risc.c
+++ b/drivers/media/pci/bt8xx/bttv-risc.c
@@ -20,8 +20,8 @@
 #include <linux/pci.h>
 #include <linux/vmalloc.h>
 #include <linux/interrupt.h>
-#include <asm/page.h>
 #include <linux/pgtable.h>
+#include <asm/page.h>
 #include <media/v4l2-ioctl.h>
 
 #include "bttvp.h"
diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2-core/videobuf-dma-sg.c
index 5cd907748803..5999aad17ed0 100644
--- a/drivers/media/v4l2-core/videobuf-dma-sg.c
+++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
@@ -21,13 +21,13 @@
 #include <linux/sched/mm.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
+#include <linux/pgtable.h>
 
 #include <linux/dma-mapping.h>
 #include <linux/vmalloc.h>
 #include <linux/pagemap.h>
 #include <linux/scatterlist.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 
 #include <media/videobuf-dma-sg.h>
 
diff --git a/drivers/media/v4l2-core/videobuf-vmalloc.c b/drivers/media/v4l2-core/videobuf-vmalloc.c
index f1c513906fd8..9b2443720ab0 100644
--- a/drivers/media/v4l2-core/videobuf-vmalloc.c
+++ b/drivers/media/v4l2-core/videobuf-vmalloc.c
@@ -15,12 +15,12 @@
 #include <linux/moduleparam.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
+#include <linux/pgtable.h>
 
 #include <linux/pci.h>
 #include <linux/vmalloc.h>
 #include <linux/pagemap.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 
 #include <media/videobuf-vmalloc.h>
 
diff --git a/drivers/net/ethernet/amd/7990.c b/drivers/net/ethernet/amd/7990.c
index 4b96960d0c1a..ef512cf89abf 100644
--- a/drivers/net/ethernet/amd/7990.c
+++ b/drivers/net/ethernet/amd/7990.c
@@ -28,6 +28,7 @@
 #include <linux/route.h>
 #include <linux/string.h>
 #include <linux/skbuff.h>
+#include <linux/pgtable.h>
 #include <asm/irq.h>
 /* Used for the temporal inet entries and routing */
 #include <linux/socket.h>
@@ -35,7 +36,6 @@
 
 #include <asm/io.h>
 #include <asm/dma.h>
-#include <linux/pgtable.h>
 #ifdef CONFIG_HP300
 #include <asm/blinken.h>
 #endif
diff --git a/drivers/net/ethernet/amd/hplance.c b/drivers/net/ethernet/amd/hplance.c
index 90e82742297e..e10aceb2b767 100644
--- a/drivers/net/ethernet/amd/hplance.c
+++ b/drivers/net/ethernet/amd/hplance.c
@@ -15,6 +15,7 @@
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/errno.h>
+#include <linux/pgtable.h>
 /* Used for the temporal inet entries and routing */
 #include <linux/socket.h>
 #include <linux/route.h>
@@ -24,7 +25,6 @@
 #include <linux/skbuff.h>
 
 #include <asm/io.h>
-#include <linux/pgtable.h>
 
 #include "hplance.h"
 
diff --git a/drivers/net/ethernet/amd/mvme147.c b/drivers/net/ethernet/amd/mvme147.c
index 491e317a93a5..3f2e4cdd0b83 100644
--- a/drivers/net/ethernet/amd/mvme147.c
+++ b/drivers/net/ethernet/amd/mvme147.c
@@ -16,6 +16,7 @@
 #include <linux/init.h>
 #include <linux/errno.h>
 #include <linux/gfp.h>
+#include <linux/pgtable.h>
 /* Used for the temporal inet entries and routing */
 #include <linux/socket.h>
 #include <linux/route.h>
@@ -24,7 +25,6 @@
 #include <linux/skbuff.h>
 
 #include <asm/io.h>
-#include <linux/pgtable.h>
 #include <asm/mvme147hw.h>
 
 /* We have 32K of RAM for the init block and buffers. This places
diff --git a/drivers/net/ethernet/amd/sun3lance.c b/drivers/net/ethernet/amd/sun3lance.c
index 804246a99e87..e1fde585fd0d 100644
--- a/drivers/net/ethernet/amd/sun3lance.c
+++ b/drivers/net/ethernet/amd/sun3lance.c
@@ -37,12 +37,12 @@ static const char version[] =
 #include <linux/etherdevice.h>
 #include <linux/skbuff.h>
 #include <linux/bitops.h>
+#include <linux/pgtable.h>
 
 #include <asm/cacheflush.h>
 #include <asm/setup.h>
 #include <asm/irq.h>
 #include <asm/io.h>
-#include <linux/pgtable.h>
 #include <asm/dvma.h>
 #include <asm/idprom.h>
 #include <asm/machines.h>
diff --git a/drivers/net/ethernet/amd/sunlance.c b/drivers/net/ethernet/amd/sunlance.c
index fef236f57670..ddece276ae23 100644
--- a/drivers/net/ethernet/amd/sunlance.c
+++ b/drivers/net/ethernet/amd/sunlance.c
@@ -94,10 +94,10 @@ static char lancestr[] = "LANCE";
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/gfp.h>
+#include <linux/pgtable.h>
 
 #include <asm/io.h>
 #include <asm/dma.h>
-#include <linux/pgtable.h>
 #include <asm/byteorder.h>	/* Used by the checksum routines */
 #include <asm/idprom.h>
 #include <asm/prom.h>
diff --git a/drivers/net/ethernet/apple/bmac.c b/drivers/net/ethernet/apple/bmac.c
index 8ebf37cd2249..f9842bc20ae6 100644
--- a/drivers/net/ethernet/apple/bmac.c
+++ b/drivers/net/ethernet/apple/bmac.c
@@ -24,11 +24,11 @@
 #include <linux/bitrev.h>
 #include <linux/ethtool.h>
 #include <linux/slab.h>
+#include <linux/pgtable.h>
 #include <asm/prom.h>
 #include <asm/dbdma.h>
 #include <asm/io.h>
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/machdep.h>
 #include <asm/pmac_feature.h>
 #include <asm/macio.h>
diff --git a/drivers/net/ethernet/apple/mace.c b/drivers/net/ethernet/apple/mace.c
index 6580976fef5c..9e5006e59215 100644
--- a/drivers/net/ethernet/apple/mace.c
+++ b/drivers/net/ethernet/apple/mace.c
@@ -19,10 +19,10 @@
 #include <linux/spinlock.h>
 #include <linux/bitrev.h>
 #include <linux/slab.h>
+#include <linux/pgtable.h>
 #include <asm/prom.h>
 #include <asm/dbdma.h>
 #include <asm/io.h>
-#include <linux/pgtable.h>
 #include <asm/macio.h>
 
 #include "mace.h"
diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index 07b85c2dfb3e..b0d4b1984a70 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -40,9 +40,9 @@
 #include <linux/of_platform.h>
 #include <linux/of_gpio.h>
 #include <linux/of_net.h>
+#include <linux/pgtable.h>
 
 #include <linux/vmalloc.h>
-#include <linux/pgtable.h>
 #include <asm/irq.h>
 #include <linux/uaccess.h>
 
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
index cd24fda1175a..b47490be872c 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
@@ -35,12 +35,12 @@
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/gfp.h>
+#include <linux/pgtable.h>
 
 #include <asm/immap_cpm2.h>
 #include <asm/mpc8260.h>
 #include <asm/cpm2.h>
 
-#include <linux/pgtable.h>
 #include <asm/irq.h>
 #include <linux/uaccess.h>
 
diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
index 0839b052d2b1..8b51ee142fa3 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
@@ -32,8 +32,8 @@
 #include <linux/platform_device.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
-
 #include <linux/pgtable.h>
+
 #include <asm/irq.h>
 #include <linux/uaccess.h>
 #include <asm/mpc5xxx.h>
diff --git a/drivers/net/ethernet/i825xx/82596.c b/drivers/net/ethernet/i825xx/82596.c
index 667773007031..fc8c7cd67471 100644
--- a/drivers/net/ethernet/i825xx/82596.c
+++ b/drivers/net/ethernet/i825xx/82596.c
@@ -53,10 +53,10 @@
 #include <linux/init.h>
 #include <linux/bitops.h>
 #include <linux/gfp.h>
+#include <linux/pgtable.h>
 
 #include <asm/io.h>
 #include <asm/dma.h>
-#include <linux/pgtable.h>
 #include <asm/cacheflush.h>
 
 static char version[] __initdata =
diff --git a/drivers/net/ethernet/korina.c b/drivers/net/ethernet/korina.c
index 2fa91ceaeb9a..03e034918d14 100644
--- a/drivers/net/ethernet/korina.c
+++ b/drivers/net/ethernet/korina.c
@@ -53,10 +53,10 @@
 #include <linux/mii.h>
 #include <linux/ethtool.h>
 #include <linux/crc32.h>
+#include <linux/pgtable.h>
 
 #include <asm/bootinfo.h>
 #include <asm/bitops.h>
-#include <linux/pgtable.h>
 #include <asm/io.h>
 #include <asm/dma.h>
 
diff --git a/drivers/net/ethernet/marvell/pxa168_eth.c b/drivers/net/ethernet/marvell/pxa168_eth.c
index d18a9fcbd15c..d3f0fd5c094a 100644
--- a/drivers/net/ethernet/marvell/pxa168_eth.c
+++ b/drivers/net/ethernet/marvell/pxa168_eth.c
@@ -31,8 +31,8 @@
 #include <linux/types.h>
 #include <linux/udp.h>
 #include <linux/workqueue.h>
-
 #include <linux/pgtable.h>
+
 #include <asm/cacheflush.h>
 
 #define DRIVER_NAME	"pxa168-eth"
diff --git a/drivers/net/ethernet/natsemi/jazzsonic.c b/drivers/net/ethernet/natsemi/jazzsonic.c
index 039b8c08a6bb..ce3eca5d152b 100644
--- a/drivers/net/ethernet/natsemi/jazzsonic.c
+++ b/drivers/net/ethernet/natsemi/jazzsonic.c
@@ -36,9 +36,9 @@
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
+#include <linux/pgtable.h>
 
 #include <asm/bootinfo.h>
-#include <linux/pgtable.h>
 #include <asm/io.h>
 #include <asm/dma.h>
 #include <asm/jazz.h>
diff --git a/drivers/net/ethernet/natsemi/macsonic.c b/drivers/net/ethernet/natsemi/macsonic.c
index 9f0b8d166274..776b7d264dc3 100644
--- a/drivers/net/ethernet/natsemi/macsonic.c
+++ b/drivers/net/ethernet/natsemi/macsonic.c
@@ -51,8 +51,8 @@
 #include <linux/dma-mapping.h>
 #include <linux/bitrev.h>
 #include <linux/slab.h>
-
 #include <linux/pgtable.h>
+
 #include <asm/io.h>
 #include <asm/hwtest.h>
 #include <asm/dma.h>
diff --git a/drivers/net/ethernet/natsemi/xtsonic.c b/drivers/net/ethernet/natsemi/xtsonic.c
index 74e62cbb87b3..afa166ff7aef 100644
--- a/drivers/net/ethernet/natsemi/xtsonic.c
+++ b/drivers/net/ethernet/natsemi/xtsonic.c
@@ -35,9 +35,9 @@
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
+#include <linux/pgtable.h>
 
 #include <asm/io.h>
-#include <linux/pgtable.h>
 #include <asm/dma.h>
 
 static char xtsonic_string[] = "xtsonic";
diff --git a/drivers/net/ethernet/sun/sunbmac.c b/drivers/net/ethernet/sun/sunbmac.c
index b17105f0a29a..34fdbc6d6031 100644
--- a/drivers/net/ethernet/sun/sunbmac.c
+++ b/drivers/net/ethernet/sun/sunbmac.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/pgtable.h>
 
 #include <linux/kernel.h>
 #include <linux/types.h>
@@ -34,7 +35,6 @@
 #include <asm/io.h>
 #include <asm/openprom.h>
 #include <asm/oplib.h>
-#include <linux/pgtable.h>
 
 #include "sunbmac.h"
 
diff --git a/drivers/net/ethernet/sun/sunqe.c b/drivers/net/ethernet/sun/sunqe.c
index 361694621ca0..577cd9753d8e 100644
--- a/drivers/net/ethernet/sun/sunqe.c
+++ b/drivers/net/ethernet/sun/sunqe.c
@@ -28,6 +28,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pgtable.h>
 
 #include <asm/io.h>
 #include <asm/dma.h>
@@ -36,7 +37,6 @@
 #include <asm/openprom.h>
 #include <asm/oplib.h>
 #include <asm/auxio.h>
-#include <linux/pgtable.h>
 #include <asm/irq.h>
 
 #include "sunqe.h"
diff --git a/drivers/scsi/53c700.c b/drivers/scsi/53c700.c
index 7b814e7b4ba3..461b3babb601 100644
--- a/drivers/scsi/53c700.c
+++ b/drivers/scsi/53c700.c
@@ -116,9 +116,9 @@
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/device.h>
+#include <linux/pgtable.h>
 #include <asm/dma.h>
 #include <asm/io.h>
-#include <linux/pgtable.h>
 #include <asm/byteorder.h>
 
 #include <scsi/scsi.h>
diff --git a/drivers/scsi/arm/cumana_2.c b/drivers/scsi/arm/cumana_2.c
index eb4ecdf4e00a..65691c21f133 100644
--- a/drivers/scsi/arm/cumana_2.c
+++ b/drivers/scsi/arm/cumana_2.c
@@ -23,11 +23,11 @@
 #include <linux/interrupt.h>
 #include <linux/init.h>
 #include <linux/dma-mapping.h>
+#include <linux/pgtable.h>
 
 #include <asm/dma.h>
 #include <asm/ecard.h>
 #include <asm/io.h>
-#include <linux/pgtable.h>
 
 #include "../scsi.h"
 #include <scsi/scsi_host.h>
diff --git a/drivers/scsi/arm/eesox.c b/drivers/scsi/arm/eesox.c
index a8772d4bcfe5..6e204a2e0c8d 100644
--- a/drivers/scsi/arm/eesox.c
+++ b/drivers/scsi/arm/eesox.c
@@ -29,11 +29,11 @@
 #include <linux/interrupt.h>
 #include <linux/init.h>
 #include <linux/dma-mapping.h>
+#include <linux/pgtable.h>
 
 #include <asm/io.h>
 #include <asm/dma.h>
 #include <asm/ecard.h>
-#include <linux/pgtable.h>
 
 #include "../scsi.h"
 #include <scsi/scsi_host.h>
diff --git a/drivers/scsi/arm/powertec.c b/drivers/scsi/arm/powertec.c
index 01aead2879df..772a13e5fd91 100644
--- a/drivers/scsi/arm/powertec.c
+++ b/drivers/scsi/arm/powertec.c
@@ -14,11 +14,11 @@
 #include <linux/interrupt.h>
 #include <linux/init.h>
 #include <linux/dma-mapping.h>
+#include <linux/pgtable.h>
 
 #include <asm/dma.h>
 #include <asm/ecard.h>
 #include <asm/io.h>
-#include <linux/pgtable.h>
 
 #include "../scsi.h"
 #include <scsi/scsi_host.h>
diff --git a/drivers/scsi/dpt_i2o.c b/drivers/scsi/dpt_i2o.c
index 049cda29e5ec..0497ef6a9453 100644
--- a/drivers/scsi/dpt_i2o.c
+++ b/drivers/scsi/dpt_i2o.c
@@ -27,6 +27,7 @@
 /*#define UARTDELAY 1 */
 
 #include <linux/module.h>
+#include <linux/pgtable.h>
 
 MODULE_AUTHOR("Deanna Bonds, with _lots_ of help from Mark Salyzyn");
 MODULE_DESCRIPTION("Adaptec I2O RAID Driver");
@@ -55,7 +56,6 @@ MODULE_DESCRIPTION("Adaptec I2O RAID Driver");
 #include <linux/mutex.h>
 
 #include <asm/processor.h>	/* for boot_cpu_data */
-#include <linux/pgtable.h>
 #include <asm/io.h>		/* for virt_to_bus, etc. */
 
 #include <scsi/scsi.h>
diff --git a/drivers/scsi/mac53c94.c b/drivers/scsi/mac53c94.c
index d0d7928db6e8..43edf83fdb62 100644
--- a/drivers/scsi/mac53c94.c
+++ b/drivers/scsi/mac53c94.c
@@ -20,9 +20,9 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/pgtable.h>
 #include <asm/dbdma.h>
 #include <asm/io.h>
-#include <linux/pgtable.h>
 #include <asm/prom.h>
 #include <asm/macio.h>
 
diff --git a/drivers/scsi/mesh.c b/drivers/scsi/mesh.c
index d32f4415e503..f9f8f4921654 100644
--- a/drivers/scsi/mesh.c
+++ b/drivers/scsi/mesh.c
@@ -31,9 +31,9 @@
 #include <linux/reboot.h>
 #include <linux/spinlock.h>
 #include <linux/pci.h>
+#include <linux/pgtable.h>
 #include <asm/dbdma.h>
 #include <asm/io.h>
-#include <linux/pgtable.h>
 #include <asm/prom.h>
 #include <asm/irq.h>
 #include <asm/hydra.h>
diff --git a/drivers/scsi/qlogicpti.c b/drivers/scsi/qlogicpti.c
index 61949d91c25b..3790e8b70bba 100644
--- a/drivers/scsi/qlogicpti.c
+++ b/drivers/scsi/qlogicpti.c
@@ -30,6 +30,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/firmware.h>
+#include <linux/pgtable.h>
 
 #include <asm/byteorder.h>
 
@@ -37,7 +38,6 @@
 
 #include <asm/dma.h>
 #include <asm/ptrace.h>
-#include <linux/pgtable.h>
 #include <asm/oplib.h>
 #include <asm/io.h>
 #include <asm/irq.h>
diff --git a/drivers/scsi/zorro_esp.c b/drivers/scsi/zorro_esp.c
index bfd50247b7eb..928c8adf5cb3 100644
--- a/drivers/scsi/zorro_esp.c
+++ b/drivers/scsi/zorro_esp.c
@@ -34,9 +34,9 @@
 #include <linux/delay.h>
 #include <linux/zorro.h>
 #include <linux/slab.h>
+#include <linux/pgtable.h>
 
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/cacheflush.h>
 #include <asm/amigahw.h>
 #include <asm/amigaints.h>
diff --git a/include/linux/crash_dump.h b/include/linux/crash_dump.h
index be79a45d7aa3..a5192b718dbe 100644
--- a/include/linux/crash_dump.h
+++ b/include/linux/crash_dump.h
@@ -5,6 +5,7 @@
 #include <linux/kexec.h>
 #include <linux/proc_fs.h>
 #include <linux/elf.h>
+#include <linux/pgtable.h>
 #include <uapi/linux/vmcore.h>
 
 #include <linux/pgtable.h> /* for pgprot_t */
diff --git a/include/linux/io-mapping.h b/include/linux/io-mapping.h
index 94e24e58966d..0beaa3eba155 100644
--- a/include/linux/io-mapping.h
+++ b/include/linux/io-mapping.h
@@ -10,6 +10,7 @@
 #include <linux/slab.h>
 #include <linux/bug.h>
 #include <linux/io.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 
 /*
@@ -99,7 +100,6 @@ io_mapping_unmap(void __iomem *vaddr)
 #else
 
 #include <linux/uaccess.h>
-#include <linux/pgtable.h>
 
 /* Create the io_mapping object*/
 static inline struct io_mapping *
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 17d8915eaebb..82522e996c76 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -11,8 +11,8 @@ struct task_struct;
 
 #ifdef CONFIG_KASAN
 
-#include <asm/kasan.h>
 #include <linux/pgtable.h>
+#include <asm/kasan.h>
 
 extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
 extern pte_t kasan_early_shadow_pte[PTRS_PER_PTE];
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 474a1ef3c379..d184c47079da 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -28,6 +28,7 @@
 #include <linux/overflow.h>
 #include <linux/sizes.h>
 #include <linux/sched.h>
+#include <linux/pgtable.h>
 
 struct mempolicy;
 struct anon_vma;
@@ -92,7 +93,6 @@ extern int mmap_rnd_compat_bits __read_mostly;
 #endif
 
 #include <asm/page.h>
-#include <linux/pgtable.h>
 #include <asm/processor.h>
 
 /*
diff --git a/include/xen/arm/page.h b/include/xen/arm/page.h
index be35f64f2e43..d7f6af50e200 100644
--- a/include/xen/arm/page.h
+++ b/include/xen/arm/page.h
@@ -3,11 +3,11 @@
 #define _ASM_ARM_XEN_PAGE_H
 
 #include <asm/page.h>
-#include <linux/pgtable.h>
 
 #include <linux/pfn.h>
 #include <linux/types.h>
 #include <linux/dma-mapping.h>
+#include <linux/pgtable.h>
 
 #include <xen/xen.h>
 #include <xen/interface/grant_table.h>
diff --git a/mm/init-mm.c b/mm/init-mm.c
index 71eabeca33ef..b29dd73be5aa 100644
--- a/mm/init-mm.c
+++ b/mm/init-mm.c
@@ -6,10 +6,10 @@
 #include <linux/list.h>
 #include <linux/cpumask.h>
 #include <linux/mman.h>
+#include <linux/pgtable.h>
 
 #include <linux/atomic.h>
 #include <linux/user_namespace.h>
-#include <linux/pgtable.h>
 #include <asm/mmu.h>
 
 #ifndef INIT_MM_CONTEXT
diff --git a/mm/mincore.c b/mm/mincore.c
index edbcf3d54e4e..de3e9fa5e458 100644
--- a/mm/mincore.c
+++ b/mm/mincore.c
@@ -17,9 +17,9 @@
 #include <linux/swapops.h>
 #include <linux/shmem_fs.h>
 #include <linux/hugetlb.h>
+#include <linux/pgtable.h>
 
 #include <linux/uaccess.h>
-#include <linux/pgtable.h>
 
 static int mincore_hugetlb(pte_t *pte, unsigned long hmask, unsigned long addr,
 			unsigned long end, struct mm_walk *walk)
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 7790cd6a4df2..952a01e45c6a 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -39,8 +39,8 @@
 #include <linux/highmem.h>
 #include <linux/string.h>
 #include <linux/slab.h>
-#include <asm/tlbflush.h>
 #include <linux/pgtable.h>
+#include <asm/tlbflush.h>
 #include <linux/cpumask.h>
 #include <linux/cpu.h>
 #include <linux/vmalloc.h>
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index de405f4b8ef2..5fd8fbc80624 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -36,10 +36,10 @@
 #include <linux/time.h>
 #include <linux/completion.h>
 #include <linux/acpi.h>
+#include <linux/pgtable.h>
 
 #ifdef CONFIG_X86
 /* for snoop control */
-#include <linux/pgtable.h>
 #include <asm/set_memory.h>
 #include <asm/cpufeature.h>
 #endif
diff --git a/sound/soc/intel/common/sst-firmware.c b/sound/soc/intel/common/sst-firmware.c
index 85622f9f7047..0594f89ea7f2 100644
--- a/sound/soc/intel/common/sst-firmware.c
+++ b/sound/soc/intel/common/sst-firmware.c
@@ -16,12 +16,12 @@
 #include <linux/dmaengine.h>
 #include <linux/pci.h>
 #include <linux/acpi.h>
+#include <linux/pgtable.h>
 
 /* supported DMA engine drivers */
 #include <linux/dma/dw.h>
 
 #include <asm/page.h>
-#include <linux/pgtable.h>
 
 #include "sst-dsp.h"
 #include "sst-dsp-priv.h"
diff --git a/sound/soc/intel/haswell/sst-haswell-pcm.c b/sound/soc/intel/haswell/sst-haswell-pcm.c
index 0bd4b7d1f271..16ac16f5a641 100644
--- a/sound/soc/intel/haswell/sst-haswell-pcm.c
+++ b/sound/soc/intel/haswell/sst-haswell-pcm.c
@@ -10,8 +10,8 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
-#include <asm/page.h>
 #include <linux/pgtable.h>
+#include <asm/page.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
-- 
2.26.2

