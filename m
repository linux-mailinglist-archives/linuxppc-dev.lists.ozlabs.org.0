Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A13491CFDAC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 20:46:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49M6Gm6FzbzDqP0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 04:46:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=MVgDfzv4; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49M6DT06kTzDqgq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 04:44:56 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 912BC20673;
 Tue, 12 May 2020 18:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589309094;
 bh=CBanT+z1cnvmJ55F2iNdRpmSSqw8fmg7USLNuMjnyTw=;
 h=From:To:Cc:Subject:Date:From;
 b=MVgDfzv4vrkGojDtggF0VfaGXopxrZjC0z/imiJ+C0Bw+HvR5WYStQ6DS/tgUXUmD
 M6VGSZ5GiMJtabuGgVtFnjQdFEBfLUgTmMvrFLqXN7NWNHSOMhT7pSa7i4DCd48t6z
 k+ijunJFrVyQ81G13vmqsP1Shh5RWZEQcrEveSzs=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 00/12] mm: consolidate definitions of page table accessors
Date: Tue, 12 May 2020 21:44:10 +0300
Message-Id: <20200512184422.12418-1-rppt@kernel.org>
X-Mailer: git-send-email 2.26.1
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
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
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
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
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

Hi,

The low level page table accessors (pXY_index(), pXY_offset()) are
duplicated across all architectures and sometimes more than once. For
instance, we have 31 definition of pgd_offset() for 25 supported
architectures.

Most of these definitions are actually identical and typically it boils
down to, e.g. 

static inline unsigned long pmd_index(unsigned long address)
{
        return (address >> PMD_SHIFT) & (PTRS_PER_PMD - 1);
}

static inline pmd_t *pmd_offset(pud_t *pud, unsigned long address)
{
        return (pmd_t *)pud_page_vaddr(*pud) + pmd_index(address);
}

These definitions can be shared among 90% of the arches provided XYZ_SHIFT,
PTRS_PER_XYZ and xyz_page_vaddr() are defined.

For architectures that really need a custom version there is always
possibility to override the generic version with the usual ifdefs magic.

These patches introduce include/linux/pgtable.h that replaces
include/asm-generic/pgtable.h and add the definitions of the page table
accessors to the new header.

The patches are vs the v5.7-rc5-mmots-2020-05-11-15-47

Mike Rapoport (12):
  mm: don't include asm/pgtable.h if linux/mm.h is already included
  mm: introduce include/linux/pgtable.h
  mm: reorder includes after introduction of linux/pgtable.h
  csky: replace definitions of __pXd_offset() with pXd_index()
  m68k/mm/motorola: move comment about page table allocation funcitons
  m68k/mm: move {cache,nocahe}_page() definitions close to their user
  x86/mm: simplify init_trampoline() and surrounding logic
  mm: pgtable: add shortcuts for accessing kernel PMD and PTE
  mm: consolidate pte_index() and pte_offset_*() definitions
  mm: consolidate pmd_index() and pmd_offset() definitions
  mm: consolidate pud_index() and pud_offset() definitions
  mm: consolidate pgd_index() and pgd_offset{_k}() definitions

 arch/alpha/boot/bootp.c                       |   1 -
 arch/alpha/boot/bootpz.c                      |   1 -
 arch/alpha/boot/main.c                        |   1 -
 arch/alpha/include/asm/io.h                   |   1 -
 arch/alpha/include/asm/pgtable.h              |  16 +--
 arch/alpha/kernel/process.c                   |   1 -
 arch/alpha/kernel/proto.h                     |   2 -
 arch/alpha/kernel/ptrace.c                    |   1 -
 arch/alpha/kernel/setup.c                     |   1 -
 arch/alpha/kernel/smp.c                       |   1 -
 arch/alpha/kernel/sys_alcor.c                 |   1 -
 arch/alpha/kernel/sys_cabriolet.c             |   1 -
 arch/alpha/kernel/sys_dp264.c                 |   1 -
 arch/alpha/kernel/sys_eb64p.c                 |   1 -
 arch/alpha/kernel/sys_eiger.c                 |   1 -
 arch/alpha/kernel/sys_jensen.c                |   1 -
 arch/alpha/kernel/sys_marvel.c                |   1 -
 arch/alpha/kernel/sys_miata.c                 |   1 -
 arch/alpha/kernel/sys_mikasa.c                |   1 -
 arch/alpha/kernel/sys_nautilus.c              |   1 -
 arch/alpha/kernel/sys_noritake.c              |   1 -
 arch/alpha/kernel/sys_rawhide.c               |   1 -
 arch/alpha/kernel/sys_ruffian.c               |   1 -
 arch/alpha/kernel/sys_rx164.c                 |   1 -
 arch/alpha/kernel/sys_sable.c                 |   1 -
 arch/alpha/kernel/sys_sio.c                   |   1 -
 arch/alpha/kernel/sys_sx164.c                 |   1 -
 arch/alpha/kernel/sys_takara.c                |   1 -
 arch/alpha/kernel/sys_titan.c                 |   1 -
 arch/alpha/kernel/sys_wildfire.c              |   1 -
 arch/alpha/mm/init.c                          |   1 -
 arch/arc/include/asm/pgtable.h                |  24 ----
 arch/arc/mm/highmem.c                         |  12 +-
 arch/arc/mm/tlbex.S                           |   2 +-
 arch/arm/include/asm/efi.h                    |   1 -
 arch/arm/include/asm/fixmap.h                 |   2 +-
 arch/arm/include/asm/idmap.h                  |   2 +-
 arch/arm/include/asm/pgtable-2level.h         |   1 +
 arch/arm/include/asm/pgtable-3level.h         |   7 --
 arch/arm/include/asm/pgtable-nommu.h          |   3 -
 arch/arm/include/asm/pgtable.h                |  25 ----
 arch/arm/kernel/head.S                        |   2 +-
 arch/arm/kernel/machine_kexec.c               |   1 -
 arch/arm/kernel/module.c                      |   1 -
 arch/arm/kernel/ptrace.c                      |   1 -
 arch/arm/kernel/smp.c                         |   1 -
 arch/arm/kernel/suspend.c                     |   2 +-
 arch/arm/kernel/vmlinux.lds.S                 |   2 +-
 arch/arm/mach-ebsa110/core.c                  |   1 -
 arch/arm/mach-footbridge/common.c             |   1 -
 arch/arm/mach-imx/mm-imx21.c                  |   1 -
 arch/arm/mach-imx/mm-imx27.c                  |   1 -
 arch/arm/mach-imx/mm-imx3.c                   |   1 -
 arch/arm/mach-integrator/core.c               |   2 +-
 arch/arm/mach-iop32x/i2c.c                    |   1 -
 arch/arm/mach-iop32x/iq31244.c                |   1 -
 arch/arm/mach-iop32x/iq80321.c                |   1 -
 arch/arm/mach-iop32x/n2100.c                  |   1 -
 arch/arm/mach-ixp4xx/common.c                 |   1 -
 arch/arm/mach-keystone/platsmp.c              |   2 +-
 arch/arm/mach-sa1100/assabet.c                |   3 +-
 arch/arm/mach-sa1100/hackkit.c                |   2 +-
 arch/arm/mach-tegra/iomap.h                   |   2 +-
 arch/arm/mach-zynq/common.c                   |   2 +-
 arch/arm/mm/copypage-v4mc.c                   |   1 -
 arch/arm/mm/copypage-v6.c                     |   1 -
 arch/arm/mm/copypage-xscale.c                 |   1 -
 arch/arm/mm/dump.c                            |   1 -
 arch/arm/mm/fault-armv.c                      |   1 -
 arch/arm/mm/fault.c                           |   1 -
 arch/arm/mm/highmem.c                         |   4 +-
 arch/arm/mm/idmap.c                           |   2 +-
 arch/arm/mm/ioremap.c                         |  31 +----
 arch/arm/mm/mm.h                              |   8 +-
 arch/arm/mm/mmu.c                             |   7 +-
 arch/arm/mm/pageattr.c                        |   1 -
 arch/arm/mm/proc-arm1020.S                    |   2 +-
 arch/arm/mm/proc-arm1020e.S                   |   2 +-
 arch/arm/mm/proc-arm1022.S                    |   2 +-
 arch/arm/mm/proc-arm1026.S                    |   2 +-
 arch/arm/mm/proc-arm720.S                     |   2 +-
 arch/arm/mm/proc-arm740.S                     |   2 +-
 arch/arm/mm/proc-arm7tdmi.S                   |   2 +-
 arch/arm/mm/proc-arm920.S                     |   2 +-
 arch/arm/mm/proc-arm922.S                     |   2 +-
 arch/arm/mm/proc-arm925.S                     |   2 +-
 arch/arm/mm/proc-arm926.S                     |   2 +-
 arch/arm/mm/proc-arm940.S                     |   2 +-
 arch/arm/mm/proc-arm946.S                     |   2 +-
 arch/arm/mm/proc-arm9tdmi.S                   |   2 +-
 arch/arm/mm/proc-fa526.S                      |   2 +-
 arch/arm/mm/proc-feroceon.S                   |   2 +-
 arch/arm/mm/proc-mohawk.S                     |   2 +-
 arch/arm/mm/proc-sa110.S                      |   2 +-
 arch/arm/mm/proc-sa1100.S                     |   2 +-
 arch/arm/mm/proc-v6.S                         |   2 +-
 arch/arm/mm/proc-v7.S                         |   2 +-
 arch/arm/mm/proc-xsc3.S                       |   2 +-
 arch/arm/mm/proc-xscale.S                     |   2 +-
 arch/arm/mm/pv-fixup-asm.S                    |   2 +-
 arch/arm64/include/asm/io.h                   |   2 +-
 arch/arm64/include/asm/kernel-pgtable.h       |   2 +-
 arch/arm64/include/asm/kvm_mmu.h              |   2 +-
 arch/arm64/include/asm/mmu_context.h          |   2 +-
 arch/arm64/include/asm/pgtable.h              |  40 +++---
 arch/arm64/include/asm/stage2_pgtable.h       |   2 +-
 arch/arm64/include/asm/vmap_stack.h           |   2 +-
 arch/arm64/kernel/acpi.c                      |   2 +-
 arch/arm64/kernel/head.S                      |   2 +-
 arch/arm64/kernel/hibernate.c                 |   5 +-
 arch/arm64/kernel/kaslr.c                     |   2 +-
 arch/arm64/kernel/ptrace.c                    |   1 -
 arch/arm64/kernel/smp.c                       |   1 -
 arch/arm64/kernel/suspend.c                   |   2 +-
 arch/arm64/kernel/vmlinux.lds.S               |   1 -
 arch/arm64/mm/dump.c                          |   1 -
 arch/arm64/mm/fault.c                         |   1 -
 arch/arm64/mm/kasan_init.c                    |   3 +-
 arch/arm64/mm/mmu.c                           |   8 +-
 arch/arm64/mm/pageattr.c                      |   1 -
 arch/arm64/mm/proc.S                          |   2 +-
 arch/c6x/include/asm/pgtable.h                |   3 -
 arch/csky/include/asm/io.h                    |   2 +-
 arch/csky/include/asm/pgtable.h               |  33 -----
 arch/csky/kernel/module.c                     |   1 -
 arch/csky/kernel/ptrace.c                     |   1 -
 arch/csky/mm/fault.c                          |   2 +-
 arch/csky/mm/highmem.c                        |   2 +-
 arch/csky/mm/init.c                           |   7 +-
 arch/csky/mm/tlb.c                            |   1 -
 arch/h8300/include/asm/pgtable.h              |   1 -
 arch/h8300/kernel/process.c                   |   1 -
 arch/h8300/kernel/setup.c                     |   1 -
 arch/h8300/kernel/signal.c                    |   1 -
 arch/h8300/mm/fault.c                         |   1 -
 arch/h8300/mm/init.c                          |   1 -
 arch/h8300/mm/memory.c                        |   1 -
 arch/hexagon/include/asm/fixmap.h             |   4 -
 arch/hexagon/include/asm/pgtable.h            |  55 +-------
 arch/hexagon/mm/uaccess.c                     |   2 +-
 arch/hexagon/mm/vm_fault.c                    |   1 -
 arch/ia64/include/asm/pgtable.h               |  34 +----
 arch/ia64/include/asm/uaccess.h               |   2 +-
 arch/ia64/kernel/efi.c                        |   1 -
 arch/ia64/kernel/entry.S                      |   2 +-
 arch/ia64/kernel/head.S                       |   3 +-
 arch/ia64/kernel/irq_ia64.c                   |   2 +-
 arch/ia64/kernel/ivt.S                        |   2 +-
 arch/ia64/kernel/kprobes.c                    |   2 +-
 arch/ia64/kernel/mca_asm.S                    |   2 +-
 arch/ia64/kernel/ptrace.c                     |   1 -
 arch/ia64/kernel/relocate_kernel.S            |   4 +-
 arch/ia64/kernel/setup.c                      |   2 +-
 arch/ia64/kernel/smp.c                        |   1 -
 arch/ia64/kernel/smpboot.c                    |   1 -
 arch/ia64/kernel/uncached.c                   |   2 +-
 arch/ia64/kernel/vmlinux.lds.S                |   2 +-
 arch/ia64/mm/contig.c                         |   1 -
 arch/ia64/mm/fault.c                          |   1 -
 arch/m68k/68000/m68EZ328.c                    |   2 +-
 arch/m68k/68000/m68VZ328.c                    |   2 +-
 arch/m68k/68000/timers.c                      |   1 -
 arch/m68k/amiga/config.c                      |   1 -
 arch/m68k/apollo/config.c                     |   1 -
 arch/m68k/atari/atasound.c                    |   1 -
 arch/m68k/atari/stram.c                       |   1 -
 arch/m68k/bvme6000/config.c                   |   1 -
 arch/m68k/include/asm/mcf_pgtable.h           |  63 +---------
 arch/m68k/include/asm/motorola_pgalloc.h      |   8 +-
 arch/m68k/include/asm/motorola_pgtable.h      |  84 +------------
 arch/m68k/include/asm/pgtable_mm.h            |   1 -
 arch/m68k/include/asm/pgtable_no.h            |   2 -
 arch/m68k/include/asm/sun3_pgtable.h          |  24 +---
 arch/m68k/include/asm/sun3xflop.h             |   2 +-
 arch/m68k/kernel/head.S                       |   2 +-
 arch/m68k/kernel/process.c                    |   1 -
 arch/m68k/kernel/ptrace.c                     |   1 -
 arch/m68k/kernel/setup_no.c                   |   1 -
 arch/m68k/kernel/signal.c                     |   1 -
 arch/m68k/kernel/uboot.c                      |   1 -
 arch/m68k/mac/config.c                        |   1 -
 arch/m68k/mm/init.c                           |   2 +-
 arch/m68k/mm/mcfmmu.c                         |   1 -
 arch/m68k/mm/motorola.c                       |  25 ++++
 arch/m68k/mm/sun3kmap.c                       |   1 -
 arch/m68k/mm/sun3mmu.c                        |   1 -
 arch/m68k/mvme147/config.c                    |   1 -
 arch/m68k/mvme16x/config.c                    |   1 -
 arch/m68k/q40/config.c                        |   1 -
 arch/m68k/sun3/config.c                       |   1 -
 arch/m68k/sun3/dvma.c                         |   1 -
 arch/m68k/sun3/mmu_emu.c                      |   1 -
 arch/m68k/sun3/sun3dvma.c                     |   1 -
 arch/m68k/sun3x/dvma.c                        |   1 -
 arch/m68k/sun3x/prom.c                        |   1 -
 arch/microblaze/include/asm/pgalloc.h         |   2 +-
 arch/microblaze/include/asm/pgtable.h         |  23 +---
 arch/microblaze/include/asm/uaccess.h         |   2 +-
 arch/microblaze/kernel/hw_exception_handler.S |   2 +-
 arch/microblaze/kernel/module.c               |   2 +-
 arch/microblaze/kernel/setup.c                |   2 +-
 arch/microblaze/kernel/signal.c               |   9 +-
 arch/microblaze/mm/fault.c                    |   1 -
 arch/microblaze/mm/init.c                     |   9 --
 arch/microblaze/mm/pgtable.c                  |   2 +-
 arch/mips/fw/arc/memory.c                     |   1 -
 arch/mips/include/asm/fixmap.h                |   3 -
 arch/mips/include/asm/mach-generic/floppy.h   |   1 -
 arch/mips/include/asm/mach-jazz/floppy.h      |   1 -
 arch/mips/include/asm/pgtable-32.h            |  22 ----
 arch/mips/include/asm/pgtable-64.h            |  32 -----
 arch/mips/include/asm/pgtable.h               |   2 -
 arch/mips/jazz/irq.c                          |   2 +-
 arch/mips/jazz/jazzdma.c                      |   1 -
 arch/mips/jazz/setup.c                        |   2 +-
 arch/mips/kernel/module.c                     |   1 -
 arch/mips/kernel/process.c                    |   1 -
 arch/mips/kernel/ptrace.c                     |   1 -
 arch/mips/kernel/ptrace32.c                   |   1 -
 arch/mips/kernel/smp-bmips.c                  |   1 -
 arch/mips/kernel/traps.c                      |   1 -
 arch/mips/kvm/mips.c                          |   2 +-
 arch/mips/kvm/mmu.c                           |  20 +--
 arch/mips/kvm/tlb.c                           |   1 -
 arch/mips/kvm/trap_emul.c                     |   2 +-
 arch/mips/lib/dump_tlb.c                      |   1 -
 arch/mips/lib/r3k_dump_tlb.c                  |   1 -
 arch/mips/mm/c-octeon.c                       |   1 -
 arch/mips/mm/c-r3k.c                          |  11 +-
 arch/mips/mm/c-r4k.c                          |  11 +-
 arch/mips/mm/c-tx39.c                         |  11 +-
 arch/mips/mm/highmem.c                        |   2 +-
 arch/mips/mm/init.c                           |   1 -
 arch/mips/mm/page.c                           |   1 -
 arch/mips/mm/pgtable-32.c                     |   1 -
 arch/mips/mm/pgtable-64.c                     |   1 -
 arch/mips/mm/sc-ip22.c                        |   1 -
 arch/mips/mm/sc-mips.c                        |   1 -
 arch/mips/mm/sc-r5k.c                         |   1 -
 arch/mips/mm/tlb-r3k.c                        |   1 -
 arch/mips/mm/tlb-r4k.c                        |   1 -
 arch/mips/mm/tlbex.c                          |   2 +-
 arch/mips/sgi-ip27/ip27-init.c                |   1 -
 arch/mips/sgi-ip27/ip27-timer.c               |   1 -
 arch/mips/sgi-ip32/ip32-memory.c              |   1 -
 arch/nds32/include/asm/highmem.h              |   1 -
 arch/nds32/include/asm/pgtable.h              |  22 +---
 arch/nds32/kernel/head.S                      |   2 +-
 arch/nds32/kernel/module.c                    |   2 +-
 arch/nds32/mm/fault.c                         |   1 -
 arch/nds32/mm/init.c                          |  13 +-
 arch/nds32/mm/proc.c                          |   7 +-
 arch/nios2/include/asm/pgtable.h              |  24 +---
 arch/nios2/kernel/module.c                    |   1 -
 arch/nios2/kernel/nios2_ksyms.c               |   2 +-
 arch/nios2/mm/init.c                          |   1 -
 arch/nios2/mm/pgtable.c                       |   1 -
 arch/nios2/mm/tlb.c                           |   1 -
 arch/openrisc/include/asm/io.h                |   1 -
 arch/openrisc/include/asm/pgtable.h           |  33 +----
 arch/openrisc/include/asm/tlbflush.h          |   1 -
 arch/openrisc/kernel/asm-offsets.c            |   1 -
 arch/openrisc/kernel/entry.S                  |   2 +-
 arch/openrisc/kernel/head.S                   |   2 +-
 arch/openrisc/kernel/or32_ksyms.c             |   2 +-
 arch/openrisc/kernel/process.c                |   1 -
 arch/openrisc/kernel/ptrace.c                 |   1 -
 arch/openrisc/kernel/setup.c                  |   1 -
 arch/openrisc/kernel/traps.c                  |   1 -
 arch/openrisc/mm/init.c                       |   1 -
 arch/openrisc/mm/ioremap.c                    |   2 +-
 arch/openrisc/mm/tlb.c                        |   1 -
 arch/parisc/include/asm/io.h                  |   2 +-
 arch/parisc/include/asm/mmu_context.h         |   1 -
 arch/parisc/include/asm/pgtable.h             |  33 +----
 arch/parisc/kernel/asm-offsets.c              |   2 +-
 arch/parisc/kernel/entry.S                    |   2 +-
 arch/parisc/kernel/head.S                     |   2 +-
 arch/parisc/kernel/module.c                   |   1 -
 arch/parisc/kernel/pacache.S                  |   2 +-
 arch/parisc/kernel/pci-dma.c                  |   2 +-
 arch/parisc/kernel/pdt.c                      |   2 +-
 arch/parisc/kernel/ptrace.c                   |   1 -
 arch/parisc/kernel/smp.c                      |   1 -
 arch/parisc/mm/fixmap.c                       |   6 +-
 arch/parisc/mm/init.c                         |   1 -
 arch/powerpc/include/asm/book3s/32/pgtable.h  |  20 +--
 arch/powerpc/include/asm/book3s/64/pgtable.h  |  28 -----
 arch/powerpc/include/asm/fixmap.h             |   2 +-
 arch/powerpc/include/asm/io.h                 |   1 -
 arch/powerpc/include/asm/kup.h                |   2 +-
 arch/powerpc/include/asm/nohash/32/pgtable.h  |  20 +--
 .../include/asm/nohash/64/pgtable-4k.h        |   4 -
 arch/powerpc/include/asm/nohash/64/pgtable.h  |  22 ----
 arch/powerpc/include/asm/nohash/pgtable.h     |   2 +-
 arch/powerpc/include/asm/pgtable.h            |  28 ++---
 arch/powerpc/include/asm/tlb.h                |   2 +-
 arch/powerpc/kernel/asm-offsets.c             |   1 -
 arch/powerpc/kernel/btext.c                   |   2 +-
 arch/powerpc/kernel/fpu.S                     |   1 -
 arch/powerpc/kernel/head_32.S                 |   2 +-
 arch/powerpc/kernel/head_40x.S                |   2 +-
 arch/powerpc/kernel/head_44x.S                |   2 +-
 arch/powerpc/kernel/head_8xx.S                |   2 +-
 arch/powerpc/kernel/head_fsl_booke.S          |   2 +-
 arch/powerpc/kernel/io-workarounds.c          |   2 +-
 arch/powerpc/kernel/irq.c                     |   2 +-
 arch/powerpc/kernel/mce_power.c               |   2 +-
 arch/powerpc/kernel/paca.c                    |   2 +-
 arch/powerpc/kernel/process.c                 |   1 -
 arch/powerpc/kernel/prom.c                    |   2 +-
 arch/powerpc/kernel/prom_init.c               |   2 +-
 arch/powerpc/kernel/rtas_pci.c                |   2 +-
 arch/powerpc/kernel/setup-common.c            |   2 +-
 arch/powerpc/kernel/setup_32.c                |   2 +-
 arch/powerpc/kernel/setup_64.c                |   2 +-
 arch/powerpc/kernel/signal_32.c               |   1 -
 arch/powerpc/kernel/signal_64.c               |   1 -
 arch/powerpc/kernel/smp.c                     |   2 +-
 arch/powerpc/kernel/traps.c                   |   1 -
 arch/powerpc/kernel/vdso.c                    |   1 -
 arch/powerpc/kvm/book3s_64_mmu_radix.c        |   2 +-
 arch/powerpc/kvm/book3s_hv_nested.c           |   2 +-
 arch/powerpc/kvm/book3s_hv_rm_xics.c          |   2 +-
 arch/powerpc/kvm/book3s_hv_rm_xive.c          |   2 +-
 arch/powerpc/kvm/fpu.S                        |   2 +-
 arch/powerpc/lib/code-patching.c              |   1 -
 arch/powerpc/mm/book3s32/hash_low.S           |   2 +-
 arch/powerpc/mm/book3s32/mmu.c                |   2 +-
 arch/powerpc/mm/book3s32/tlb.c                |   4 +-
 arch/powerpc/mm/book3s64/hash_hugetlbpage.c   |   1 -
 arch/powerpc/mm/book3s64/hash_native.c        |   2 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c       |   1 -
 arch/powerpc/mm/book3s64/hash_utils.c         |   2 +-
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |   1 -
 arch/powerpc/mm/book3s64/radix_pgtable.c      |   1 -
 arch/powerpc/mm/book3s64/slb.c                |   2 +-
 arch/powerpc/mm/book3s64/subpage_prot.c       |   2 +-
 arch/powerpc/mm/fault.c                       |   1 -
 arch/powerpc/mm/hugetlbpage.c                 |   1 -
 arch/powerpc/mm/init-common.c                 |   2 +-
 arch/powerpc/mm/init_32.c                     |   1 -
 arch/powerpc/mm/init_64.c                     |   1 -
 arch/powerpc/mm/kasan/kasan_init_32.c         |   8 +-
 arch/powerpc/mm/mem.c                         |   1 -
 arch/powerpc/mm/nohash/40x.c                  |   5 +-
 arch/powerpc/mm/nohash/fsl_booke.c            |   1 -
 arch/powerpc/mm/nohash/tlb_low_64e.S          |   2 +-
 arch/powerpc/mm/pgtable_32.c                  |   3 +-
 arch/powerpc/mm/pgtable_64.c                  |   1 -
 arch/powerpc/mm/ptdump/8xx.c                  |   2 +-
 arch/powerpc/mm/ptdump/bats.c                 |   2 +-
 arch/powerpc/mm/ptdump/book3s64.c             |   2 +-
 arch/powerpc/mm/ptdump/hashpagetable.c        |   1 -
 arch/powerpc/mm/ptdump/ptdump.c               |   1 -
 arch/powerpc/mm/ptdump/shared.c               |   2 +-
 arch/powerpc/perf/callchain.c                 |   1 -
 arch/powerpc/perf/callchain_32.c              |   1 -
 arch/powerpc/perf/callchain_64.c              |   1 -
 arch/powerpc/platforms/85xx/corenet_generic.c |   2 +-
 arch/powerpc/platforms/85xx/mpc85xx_cds.c     |   2 +-
 arch/powerpc/platforms/85xx/qemu_e500.c       |   2 +-
 arch/powerpc/platforms/85xx/sbc8548.c         |   2 +-
 arch/powerpc/platforms/85xx/smp.c             |   2 +-
 arch/powerpc/platforms/86xx/mpc86xx_smp.c     |   2 +-
 arch/powerpc/platforms/8xx/cpm1.c             |   1 -
 arch/powerpc/platforms/8xx/micropatch.c       |   1 -
 arch/powerpc/platforms/cell/cbe_regs.c        |   2 +-
 arch/powerpc/platforms/cell/interrupt.c       |   2 +-
 arch/powerpc/platforms/cell/pervasive.c       |   2 +-
 arch/powerpc/platforms/cell/setup.c           |   1 -
 arch/powerpc/platforms/cell/smp.c             |   2 +-
 arch/powerpc/platforms/cell/spider-pic.c      |   2 +-
 arch/powerpc/platforms/chrp/pci.c             |   2 +-
 arch/powerpc/platforms/chrp/setup.c           |   1 -
 arch/powerpc/platforms/chrp/smp.c             |   2 +-
 arch/powerpc/platforms/maple/setup.c          |   1 -
 arch/powerpc/platforms/maple/time.c           |   1 -
 arch/powerpc/platforms/powermac/setup.c       |   1 -
 arch/powerpc/platforms/powermac/smp.c         |   2 +-
 arch/powerpc/platforms/powermac/time.c        |   1 -
 arch/powerpc/platforms/pseries/lpar.c         |   2 +-
 arch/powerpc/platforms/pseries/setup.c        |   1 -
 arch/powerpc/platforms/pseries/smp.c          |   2 +-
 arch/powerpc/sysdev/cpm2.c                    |   1 -
 arch/powerpc/sysdev/fsl_85xx_cache_sram.c     |   2 +-
 arch/powerpc/sysdev/mpic.c                    |   2 +-
 arch/powerpc/xmon/xmon.c                      |   1 -
 arch/riscv/include/asm/fixmap.h               |   2 +-
 arch/riscv/include/asm/io.h                   |   2 +-
 arch/riscv/include/asm/kasan.h                |   2 -
 arch/riscv/include/asm/pgtable-64.h           |   7 --
 arch/riscv/include/asm/pgtable.h              |  22 ----
 arch/riscv/kernel/module.c                    |   2 +-
 arch/riscv/kernel/setup.c                     |   1 -
 arch/riscv/kernel/soc.c                       |   2 +-
 arch/riscv/mm/cacheflush.c                    |   1 -
 arch/riscv/mm/init.c                          |  31 +++--
 arch/riscv/mm/kasan_init.c                    |   2 +-
 arch/riscv/mm/pageattr.c                      |   2 +-
 arch/riscv/mm/ptdump.c                        |   2 +-
 arch/s390/boot/ipl_parm.c                     |   2 +-
 arch/s390/boot/kaslr.c                        |   2 +-
 arch/s390/include/asm/hugetlb.h               |   2 +-
 arch/s390/include/asm/kasan.h                 |   2 -
 arch/s390/include/asm/pgtable.h               |  15 +--
 arch/s390/include/asm/tlbflush.h              |   1 -
 arch/s390/kernel/asm-offsets.c                |   2 +-
 arch/s390/kernel/machine_kexec.c              |   1 -
 arch/s390/kernel/ptrace.c                     |   1 -
 arch/s390/kernel/vdso.c                       |   1 -
 arch/s390/kvm/gaccess.c                       |   2 +-
 arch/s390/kvm/kvm-s390.c                      |   2 +-
 arch/s390/kvm/priv.c                          |   2 +-
 arch/s390/mm/dump_pagetables.c                |   1 -
 arch/s390/mm/extmem.c                         |   2 +-
 arch/s390/mm/fault.c                          |   1 -
 arch/s390/mm/gmap.c                           |   2 +-
 arch/s390/mm/init.c                           |   1 -
 arch/s390/mm/kasan_init.c                     |   2 +-
 arch/s390/mm/pageattr.c                       |  13 +-
 arch/s390/mm/pgtable.c                        |   1 -
 arch/s390/mm/vmem.c                           |   1 -
 arch/sh/include/asm/io.h                      |   2 +-
 arch/sh/include/asm/pgtable-3level.h          |   7 --
 arch/sh/include/asm/pgtable.h                 |   2 -
 arch/sh/include/asm/pgtable_32.h              |  25 +---
 arch/sh/include/asm/pgtable_64.h              |  26 ----
 arch/sh/kernel/machine_kexec.c                |   1 -
 arch/sh/kernel/process_64.c                   |   1 -
 arch/sh/kernel/ptrace_32.c                    |   1 -
 arch/sh/kernel/ptrace_64.c                    |   1 -
 arch/sh/kernel/signal_32.c                    |   1 -
 arch/sh/kernel/signal_64.c                    |   1 -
 arch/sh/kernel/traps_64.c                     |   1 -
 arch/sh/mm/cache-sh3.c                        |   1 -
 arch/sh/mm/cache-sh4.c                        |   9 +-
 arch/sh/mm/cache-sh7705.c                     |   1 -
 arch/sh/mm/kmap.c                             |   5 +-
 arch/sh/mm/nommu.c                            |   1 -
 arch/sh/mm/pmb.c                              |   2 +-
 arch/sparc/include/asm/floppy_32.h            |   2 +-
 arch/sparc/include/asm/highmem.h              |   2 +-
 arch/sparc/include/asm/ide.h                  |   2 +-
 arch/sparc/include/asm/io-unit.h              |   2 +-
 arch/sparc/include/asm/pgalloc_32.h           |   2 +-
 arch/sparc/include/asm/pgalloc_64.h           |   2 +-
 arch/sparc/include/asm/pgtable_32.h           |  34 ++---
 arch/sparc/include/asm/pgtable_64.h           |  32 +----
 arch/sparc/kernel/cpu.c                       |   2 +-
 arch/sparc/kernel/entry.S                     |   2 +-
 arch/sparc/kernel/head_64.S                   |   2 +-
 arch/sparc/kernel/ktlb.S                      |   2 +-
 arch/sparc/kernel/leon_smp.c                  |   1 -
 arch/sparc/kernel/pci.c                       |   2 +-
 arch/sparc/kernel/process_32.c                |   1 -
 arch/sparc/kernel/process_64.c                |   1 -
 arch/sparc/kernel/ptrace_32.c                 |   1 -
 arch/sparc/kernel/ptrace_64.c                 |   1 -
 arch/sparc/kernel/setup_32.c                  |   1 -
 arch/sparc/kernel/setup_64.c                  |   1 -
 arch/sparc/kernel/signal32.c                  |   1 -
 arch/sparc/kernel/signal_32.c                 |   1 -
 arch/sparc/kernel/signal_64.c                 |   1 -
 arch/sparc/kernel/smp_32.c                    |   1 -
 arch/sparc/kernel/smp_64.c                    |   1 -
 arch/sparc/kernel/sun4m_irq.c                 |   2 +-
 arch/sparc/kernel/trampoline_64.S             |   2 +-
 arch/sparc/kernel/traps_32.c                  |   2 +-
 arch/sparc/kernel/traps_64.c                  |   1 -
 arch/sparc/lib/clear_page.S                   |   2 +-
 arch/sparc/lib/copy_page.S                    |   2 +-
 arch/sparc/mm/fault_32.c                      |   1 -
 arch/sparc/mm/fault_64.c                      |   1 -
 arch/sparc/mm/highmem.c                       |  12 +-
 arch/sparc/mm/hugetlbpage.c                   |   1 -
 arch/sparc/mm/init_32.c                       |   1 -
 arch/sparc/mm/init_64.c                       |   7 +-
 arch/sparc/mm/io-unit.c                       |  11 +-
 arch/sparc/mm/iommu.c                         |   9 +-
 arch/sparc/mm/srmmu.c                         |  45 +------
 arch/sparc/mm/tlb.c                           |   1 -
 arch/sparc/mm/tsb.c                           |   2 +-
 arch/sparc/mm/ultra.S                         |   2 +-
 arch/um/include/asm/pgtable-3level.h          |   4 -
 arch/um/include/asm/pgtable.h                 |  69 +++--------
 arch/um/kernel/mem.c                          |  10 +-
 arch/um/kernel/process.c                      |   1 -
 arch/um/kernel/skas/mmu.c                     |   1 -
 arch/um/kernel/skas/uaccess.c                 |   1 -
 arch/um/kernel/tlb.c                          |   1 -
 arch/um/kernel/trap.c                         |   9 +-
 arch/um/kernel/um_arch.c                      |   1 -
 arch/unicore32/include/asm/pgtable.h          |  19 ---
 arch/unicore32/kernel/hibernate.c             |   2 +-
 arch/unicore32/kernel/hibernate_asm.S         |   2 +-
 arch/unicore32/kernel/module.c                |   1 -
 arch/unicore32/mm/alignment.c                 |   2 +-
 arch/unicore32/mm/fault.c                     |   1 -
 arch/unicore32/mm/mm.h                        |  10 --
 arch/unicore32/mm/proc-ucv2.S                 |   2 +-
 arch/x86/boot/compressed/kaslr_64.c           |   2 +-
 arch/x86/include/asm/agp.h                    |   2 +-
 arch/x86/include/asm/asm-prototypes.h         |   2 +-
 arch/x86/include/asm/efi.h                    |   2 +-
 arch/x86/include/asm/iomap.h                  |   1 -
 arch/x86/include/asm/kaslr.h                  |   2 +
 arch/x86/include/asm/pgtable.h                |  89 +------------
 arch/x86/include/asm/pgtable_32.h             |  11 --
 arch/x86/include/asm/pgtable_64.h             |   4 -
 arch/x86/include/asm/setup.h                  |   9 ++
 arch/x86/include/asm/xen/hypercall.h          |   2 +-
 arch/x86/include/asm/xen/page.h               |   1 -
 arch/x86/kernel/acpi/boot.c                   |   2 +-
 arch/x86/kernel/acpi/sleep.c                  |   2 +-
 arch/x86/kernel/alternative.c                 |   1 -
 arch/x86/kernel/amd_gart_64.c                 |   1 -
 arch/x86/kernel/apic/apic_numachip.c          |   2 +-
 arch/x86/kernel/cpu/bugs.c                    |   2 +-
 arch/x86/kernel/cpu/common.c                  |   2 +-
 arch/x86/kernel/cpu/intel.c                   |   2 +-
 arch/x86/kernel/crash_core_32.c               |   2 +-
 arch/x86/kernel/crash_core_64.c               |   2 +-
 arch/x86/kernel/doublefault_32.c              |   1 -
 arch/x86/kernel/early_printk.c                |   2 +-
 arch/x86/kernel/espfix_64.c                   |   2 +-
 arch/x86/kernel/head64.c                      |   2 +-
 arch/x86/kernel/head_64.S                     |   2 +-
 arch/x86/kernel/i8259.c                       |   2 +-
 arch/x86/kernel/irqinit.c                     |   2 +-
 arch/x86/kernel/kprobes/core.c                |   2 +-
 arch/x86/kernel/kprobes/opt.c                 |   2 +-
 arch/x86/kernel/machine_kexec_32.c            |   1 -
 arch/x86/kernel/machine_kexec_64.c            |   1 -
 arch/x86/kernel/module.c                      |   1 -
 arch/x86/kernel/paravirt.c                    |   2 +-
 arch/x86/kernel/process_32.c                  |   1 -
 arch/x86/kernel/process_64.c                  |   1 -
 arch/x86/kernel/ptrace.c                      |   1 -
 arch/x86/kernel/reboot.c                      |   2 +-
 arch/x86/kernel/smpboot.c                     |   2 +-
 arch/x86/kernel/tboot.c                       |   1 -
 arch/x86/mm/cpu_entry_area.c                  |   2 +-
 arch/x86/mm/debug_pagetables.c                |   2 +-
 arch/x86/mm/dump_pagetables.c                 |   1 -
 arch/x86/mm/init.c                            |  22 ++++
 arch/x86/mm/init_32.c                         |  27 +---
 arch/x86/mm/init_64.c                         |   1 -
 arch/x86/mm/ioremap.c                         |   2 +-
 arch/x86/mm/kasan_init_64.c                   |   1 -
 arch/x86/mm/kaslr.c                           |  35 +-----
 arch/x86/mm/mem_encrypt_boot.S                |   2 +-
 arch/x86/mm/mmio-mod.c                        |   2 +-
 arch/x86/mm/pat/cpa-test.c                    |   1 -
 arch/x86/mm/pat/memtype.c                     |   1 -
 arch/x86/mm/pat/memtype_interval.c            |   2 +-
 arch/x86/mm/pgtable.c                         |   1 -
 arch/x86/mm/pgtable_32.c                      |   1 -
 arch/x86/mm/pti.c                             |   1 -
 arch/x86/mm/setup_nx.c                        |   2 +-
 arch/x86/platform/efi/efi_32.c                |   2 +-
 arch/x86/platform/efi/efi_64.c                |   1 -
 arch/x86/platform/olpc/olpc_ofw.c             |   2 +-
 arch/x86/power/cpu.c                          |   2 +-
 arch/x86/power/hibernate.c                    |   2 +-
 arch/x86/power/hibernate_32.c                 |   2 +-
 arch/x86/power/hibernate_64.c                 |   2 +-
 arch/x86/realmode/init.c                      |   2 +-
 arch/x86/xen/enlighten_pv.c                   |   1 -
 arch/x86/xen/grant-table.c                    |   1 -
 arch/x86/xen/mmu_pv.c                         |   2 +-
 arch/x86/xen/smp_pv.c                         |   2 +-
 arch/xtensa/include/asm/fixmap.h              |  10 +-
 arch/xtensa/include/asm/highmem.h             |   2 +-
 arch/xtensa/include/asm/initialize_mmu.h      |   2 +-
 arch/xtensa/include/asm/mmu_context.h         |   2 +-
 arch/xtensa/include/asm/pgtable.h             |  20 +--
 arch/xtensa/kernel/entry.S                    |   2 +-
 arch/xtensa/kernel/process.c                  |   1 -
 arch/xtensa/kernel/ptrace.c                   |   1 -
 arch/xtensa/kernel/setup.c                    |   1 -
 arch/xtensa/kernel/traps.c                    |   2 +-
 arch/xtensa/kernel/vectors.S                  |   2 +-
 arch/xtensa/mm/cache.c                        |   2 +-
 arch/xtensa/mm/highmem.c                      |   2 +-
 arch/xtensa/mm/ioremap.c                      |   2 +-
 arch/xtensa/mm/kasan_init.c                   |  10 +-
 arch/xtensa/mm/misc.S                         |   2 +-
 arch/xtensa/mm/mmu.c                          |   5 +-
 drivers/acpi/scan.c                           |   3 +-
 drivers/atm/fore200e.c                        |   2 +-
 drivers/block/z2ram.c                         |   2 +-
 drivers/char/agp/frontend.c                   |   1 -
 drivers/char/agp/generic.c                    |   1 -
 drivers/char/bsr.c                            |   1 -
 drivers/char/mspec.c                          |   1 -
 drivers/firmware/efi/arm-runtime.c            |   2 +-
 drivers/gpu/drm/drm_vm.c                      |   2 +-
 drivers/gpu/drm/i915/i915_mm.c                |   1 -
 drivers/infiniband/hw/qib/qib_file_ops.c      |   2 +-
 drivers/infiniband/sw/rdmavt/mmap.c           |   1 -
 drivers/infiniband/sw/rxe/rxe_mmap.c          |   1 -
 drivers/macintosh/macio-adb.c                 |   2 +-
 drivers/macintosh/mediabay.c                  |   2 +-
 drivers/macintosh/via-pmu.c                   |   2 +-
 drivers/media/pci/bt8xx/bt878.c               |   2 +-
 drivers/media/pci/bt8xx/btcx-risc.c           |   2 +-
 drivers/media/pci/bt8xx/bttv-risc.c           |   2 +-
 drivers/media/platform/davinci/vpbe_display.c |   1 -
 drivers/media/v4l2-core/v4l2-common.c         |   1 -
 drivers/media/v4l2-core/videobuf-dma-sg.c     |   2 +-
 drivers/media/v4l2-core/videobuf-vmalloc.c    |   2 +-
 drivers/misc/genwqe/card_utils.c              |   2 +-
 drivers/misc/sgi-gru/grufault.c               |   1 -
 drivers/mtd/ubi/ubi.h                         |   2 +-
 drivers/net/ethernet/amd/7990.c               |   2 +-
 drivers/net/ethernet/amd/hplance.c            |   2 +-
 drivers/net/ethernet/amd/mvme147.c            |   2 +-
 drivers/net/ethernet/amd/sun3lance.c          |   2 +-
 drivers/net/ethernet/amd/sunlance.c           |   2 +-
 drivers/net/ethernet/apple/bmac.c             |   2 +-
 drivers/net/ethernet/apple/mace.c             |   2 +-
 .../ethernet/freescale/fs_enet/fs_enet-main.c |   2 +-
 .../net/ethernet/freescale/fs_enet/mac-fcc.c  |   2 +-
 .../net/ethernet/freescale/fs_enet/mii-fec.c  |   2 +-
 drivers/net/ethernet/i825xx/82596.c           |   2 +-
 drivers/net/ethernet/korina.c                 |   2 +-
 drivers/net/ethernet/marvell/pxa168_eth.c     |   2 +-
 drivers/net/ethernet/natsemi/jazzsonic.c      |   2 +-
 drivers/net/ethernet/natsemi/macsonic.c       |   2 +-
 drivers/net/ethernet/natsemi/xtsonic.c        |   2 +-
 drivers/net/ethernet/sun/sunbmac.c            |   2 +-
 drivers/net/ethernet/sun/sunhme.c             |   1 -
 drivers/net/ethernet/sun/sunqe.c              |   2 +-
 drivers/sbus/char/flash.c                     |   1 -
 drivers/sbus/char/uctrl.c                     |   1 -
 drivers/scsi/53c700.c                         |   2 +-
 drivers/scsi/a2091.c                          |   1 -
 drivers/scsi/a3000.c                          |   1 -
 drivers/scsi/arm/cumana_2.c                   |   2 +-
 drivers/scsi/arm/eesox.c                      |   2 +-
 drivers/scsi/arm/powertec.c                   |   2 +-
 drivers/scsi/dpt_i2o.c                        |   2 +-
 drivers/scsi/gvp11.c                          |   1 -
 drivers/scsi/lasi700.c                        |   1 -
 drivers/scsi/mac53c94.c                       |   2 +-
 drivers/scsi/mesh.c                           |   2 +-
 drivers/scsi/mvme147.c                        |   1 -
 drivers/scsi/qlogicpti.c                      |   2 +-
 drivers/scsi/sni_53c710.c                     |   1 -
 drivers/scsi/zorro_esp.c                      |   2 +-
 drivers/video/console/newport_con.c           |   1 -
 drivers/video/fbdev/acornfb.c                 |   1 -
 drivers/video/fbdev/atafb.c                   |   1 -
 drivers/video/fbdev/cirrusfb.c                |   1 -
 drivers/video/fbdev/cyber2000fb.c             |   1 -
 drivers/video/fbdev/fb-puv3.c                 |   1 -
 drivers/video/fbdev/hitfb.c                   |   1 -
 drivers/video/fbdev/neofb.c                   |   1 -
 drivers/video/fbdev/q40fb.c                   |   1 -
 drivers/video/fbdev/savage/savagefb_driver.c  |   1 -
 drivers/xen/balloon.c                         |   1 -
 drivers/xen/grant-table.c                     |   1 -
 drivers/xen/privcmd.c                         |   1 -
 drivers/xen/xenbus/xenbus_probe.c             |   1 -
 drivers/xen/xenbus/xenbus_probe_backend.c     |   1 -
 drivers/xen/xenbus/xenbus_probe_frontend.c    |   1 -
 fs/proc/array.c                               |   1 -
 fs/proc/meminfo.c                             |   1 -
 fs/proc/nommu.c                               |   1 -
 fs/proc/vmcore.c                              |   1 -
 include/asm-generic/io.h                      |   2 +-
 include/asm-generic/pgtable-nopmd.h           |   1 +
 include/asm-generic/pgtable-nopud.h           |   1 +
 include/linux/crash_dump.h                    |   3 +-
 include/linux/dax.h                           |   1 -
 include/linux/dma-noncoherent.h               |   2 +-
 include/linux/hmm.h                           |   2 +-
 include/linux/hugetlb.h                       |   2 +-
 include/linux/io-mapping.h                    |   2 +-
 include/linux/kasan.h                         |   2 +-
 include/linux/mm.h                            |   2 +-
 include/{asm-generic => linux}/pgtable.h      | 117 +++++++++++++++++-
 include/xen/arm/page.h                        |   2 +-
 init/init_task.c                              |   1 -
 kernel/bpf/syscall.c                          |   2 +-
 kernel/exit.c                                 |   1 -
 kernel/fork.c                                 |   1 -
 kernel/power/snapshot.c                       |   1 -
 lib/ioremap.c                                 |   1 -
 mm/debug_vm_pgtable.c                         |   1 -
 mm/gup.c                                      |   1 -
 mm/hugetlb.c                                  |   1 -
 mm/init-mm.c                                  |   2 +-
 mm/memory.c                                   |   1 -
 mm/mincore.c                                  |   2 +-
 mm/mprotect.c                                 |   2 +-
 mm/page_io.c                                  |   1 -
 mm/page_reporting.h                           |   2 +-
 mm/pgtable-generic.c                          |   6 +-
 mm/shmem.c                                    |   1 -
 mm/sparse-vmemmap.c                           |   1 -
 mm/sparse.c                                   |   1 -
 mm/swap_state.c                               |   1 -
 mm/swapfile.c                                 |   1 -
 mm/vmacache.c                                 |   1 -
 mm/zsmalloc.c                                 |   2 +-
 sound/core/sgbuf.c                            |   1 -
 sound/pci/hda/hda_intel.c                     |   2 +-
 sound/soc/intel/common/sst-firmware.c         |   2 +-
 sound/soc/intel/haswell/sst-haswell-pcm.c     |   2 +-
 virt/kvm/kvm_main.c                           |   1 -
 712 files changed, 678 insertions(+), 2021 deletions(-)
 rename include/{asm-generic => linux}/pgtable.h (91%)

-- 
2.26.1

