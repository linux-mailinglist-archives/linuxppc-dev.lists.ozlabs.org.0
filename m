Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DB71D37A8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 19:11:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NJ3P71tfzDq8F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 03:11:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=W7JJTw6b; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NHvT73d3zDqlD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 03:04:21 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47783206F1;
 Thu, 14 May 2020 17:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589475859;
 bh=zxex2cVQ9RlRX55AcAU6gw4Sh+zXqKqMGtZ0ZWNIgZg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W7JJTw6bGSGjd26s8OOaN4jCp24gsI7SKcwtVDjrToKHrjN5MUIpdi9MkANRQDXUN
 4nK0+ujDnmD18AqK1a0ty447vcZFtDoldGqT+TSS5YmSB4mblVvEMmbypPt+8yyqex
 Dnsihx/VjmoHs2D+kPA+GAaAWXqi98QKfC0LjNK0=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/12] mm: introduce include/linux/pgtable.h
Date: Thu, 14 May 2020 20:03:17 +0300
Message-Id: <20200514170327.31389-3-rppt@kernel.org>
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

The include/linux/pgtable.h is going to be the home of generic page table
manipulation functions.
Start with moving asm-generic/pgtable.h to include/linux/pgtable.h and make
the latter include asm/pgtable.h.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/alpha/include/asm/pgtable.h                      | 2 --
 arch/alpha/kernel/proto.h                             | 2 +-
 arch/arc/include/asm/pgtable.h                        | 2 --
 arch/arc/mm/highmem.c                                 | 2 +-
 arch/arc/mm/tlbex.S                                   | 2 +-
 arch/arm/include/asm/efi.h                            | 2 +-
 arch/arm/include/asm/fixmap.h                         | 2 +-
 arch/arm/include/asm/idmap.h                          | 2 +-
 arch/arm/include/asm/pgtable-nommu.h                  | 2 --
 arch/arm/include/asm/pgtable.h                        | 2 --
 arch/arm/kernel/head.S                                | 2 +-
 arch/arm/kernel/suspend.c                             | 2 +-
 arch/arm/kernel/vmlinux.lds.S                         | 2 +-
 arch/arm/mach-integrator/core.c                       | 2 +-
 arch/arm/mach-keystone/platsmp.c                      | 2 +-
 arch/arm/mach-sa1100/hackkit.c                        | 2 +-
 arch/arm/mach-tegra/iomap.h                           | 2 +-
 arch/arm/mach-zynq/common.c                           | 2 +-
 arch/arm/mm/idmap.c                                   | 2 +-
 arch/arm/mm/mm.h                                      | 2 +-
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
 arch/arm64/include/asm/kernel-pgtable.h               | 2 +-
 arch/arm64/include/asm/kvm_mmu.h                      | 2 +-
 arch/arm64/include/asm/mmu_context.h                  | 2 +-
 arch/arm64/include/asm/pgtable.h                      | 4 +---
 arch/arm64/include/asm/stage2_pgtable.h               | 2 +-
 arch/arm64/include/asm/vmap_stack.h                   | 2 +-
 arch/arm64/kernel/acpi.c                              | 2 +-
 arch/arm64/kernel/head.S                              | 2 +-
 arch/arm64/kernel/kaslr.c                             | 2 +-
 arch/arm64/kernel/suspend.c                           | 2 +-
 arch/arm64/kernel/vmlinux.lds.S                       | 2 +-
 arch/arm64/mm/proc.S                                  | 2 +-
 arch/c6x/include/asm/pgtable.h                        | 2 --
 arch/csky/include/asm/io.h                            | 2 +-
 arch/csky/include/asm/pgtable.h                       | 2 --
 arch/h8300/include/asm/pgtable.h                      | 1 -
 arch/hexagon/include/asm/pgtable.h                    | 3 ---
 arch/hexagon/mm/uaccess.c                             | 2 +-
 arch/ia64/include/asm/pgtable.h                       | 1 -
 arch/ia64/include/asm/uaccess.h                       | 2 +-
 arch/ia64/kernel/entry.S                              | 2 +-
 arch/ia64/kernel/head.S                               | 2 +-
 arch/ia64/kernel/irq_ia64.c                           | 2 +-
 arch/ia64/kernel/ivt.S                                | 2 +-
 arch/ia64/kernel/kprobes.c                            | 2 +-
 arch/ia64/kernel/mca_asm.S                            | 2 +-
 arch/ia64/kernel/relocate_kernel.S                    | 2 +-
 arch/ia64/kernel/setup.c                              | 2 +-
 arch/ia64/kernel/uncached.c                           | 2 +-
 arch/ia64/kernel/vmlinux.lds.S                        | 2 +-
 arch/m68k/68000/m68EZ328.c                            | 2 +-
 arch/m68k/68000/m68VZ328.c                            | 2 +-
 arch/m68k/include/asm/pgtable_mm.h                    | 1 -
 arch/m68k/include/asm/pgtable_no.h                    | 2 --
 arch/m68k/include/asm/sun3xflop.h                     | 2 +-
 arch/m68k/kernel/head.S                               | 2 +-
 arch/microblaze/include/asm/pgalloc.h                 | 2 +-
 arch/microblaze/include/asm/pgtable.h                 | 2 --
 arch/microblaze/include/asm/uaccess.h                 | 2 +-
 arch/microblaze/kernel/hw_exception_handler.S         | 2 +-
 arch/microblaze/kernel/module.c                       | 2 +-
 arch/microblaze/kernel/setup.c                        | 2 +-
 arch/microblaze/mm/pgtable.c                          | 2 +-
 arch/mips/include/asm/pgtable.h                       | 2 --
 arch/mips/jazz/irq.c                                  | 2 +-
 arch/mips/jazz/setup.c                                | 2 +-
 arch/mips/kvm/mips.c                                  | 2 +-
 arch/mips/mm/tlbex.c                                  | 2 +-
 arch/nds32/include/asm/highmem.h                      | 2 +-
 arch/nds32/include/asm/pgtable.h                      | 2 --
 arch/nds32/kernel/head.S                              | 2 +-
 arch/nds32/kernel/module.c                            | 2 +-
 arch/nios2/include/asm/pgtable.h                      | 2 --
 arch/nios2/kernel/nios2_ksyms.c                       | 2 +-
 arch/openrisc/include/asm/io.h                        | 2 +-
 arch/openrisc/include/asm/pgtable.h                   | 2 --
 arch/openrisc/kernel/entry.S                          | 2 +-
 arch/openrisc/kernel/head.S                           | 2 +-
 arch/openrisc/kernel/or32_ksyms.c                     | 2 +-
 arch/openrisc/mm/ioremap.c                            | 2 +-
 arch/parisc/include/asm/io.h                          | 2 +-
 arch/parisc/include/asm/pgtable.h                     | 1 -
 arch/parisc/kernel/asm-offsets.c                      | 2 +-
 arch/parisc/kernel/entry.S                            | 2 +-
 arch/parisc/kernel/head.S                             | 2 +-
 arch/parisc/kernel/pacache.S                          | 2 +-
 arch/parisc/kernel/pdt.c                              | 2 +-
 arch/powerpc/include/asm/fixmap.h                     | 2 +-
 arch/powerpc/include/asm/kup.h                        | 2 +-
 arch/powerpc/include/asm/nohash/pgtable.h             | 2 +-
 arch/powerpc/include/asm/pgtable.h                    | 2 --
 arch/powerpc/include/asm/tlb.h                        | 2 +-
 arch/powerpc/kernel/btext.c                           | 2 +-
 arch/powerpc/kernel/fpu.S                             | 2 +-
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
 arch/powerpc/mm/book3s64/subpage_prot.c               | 2 +-
 arch/powerpc/mm/init-common.c                         | 2 +-
 arch/powerpc/mm/nohash/tlb_low_64e.S                  | 2 +-
 arch/powerpc/mm/ptdump/8xx.c                          | 2 +-
 arch/powerpc/mm/ptdump/bats.c                         | 2 +-
 arch/powerpc/mm/ptdump/book3s64.c                     | 2 +-
 arch/powerpc/mm/ptdump/shared.c                       | 2 +-
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
 arch/powerpc/sysdev/fsl_85xx_cache_sram.c             | 2 +-
 arch/powerpc/sysdev/mpic.c                            | 2 +-
 arch/riscv/include/asm/fixmap.h                       | 2 +-
 arch/riscv/include/asm/io.h                           | 2 +-
 arch/riscv/include/asm/kasan.h                        | 2 +-
 arch/riscv/include/asm/pgtable.h                      | 2 --
 arch/riscv/kernel/module.c                            | 2 +-
 arch/riscv/kernel/soc.c                               | 2 +-
 arch/riscv/mm/cacheflush.c                            | 2 +-
 arch/riscv/mm/kasan_init.c                            | 2 +-
 arch/riscv/mm/pageattr.c                              | 2 +-
 arch/riscv/mm/ptdump.c                                | 2 +-
 arch/s390/boot/ipl_parm.c                             | 2 +-
 arch/s390/boot/kaslr.c                                | 2 +-
 arch/s390/include/asm/hugetlb.h                       | 2 +-
 arch/s390/include/asm/kasan.h                         | 2 +-
 arch/s390/include/asm/pgtable.h                       | 2 --
 arch/s390/kernel/asm-offsets.c                        | 2 +-
 arch/s390/kvm/gaccess.c                               | 2 +-
 arch/s390/kvm/kvm-s390.c                              | 2 +-
 arch/s390/kvm/priv.c                                  | 2 +-
 arch/s390/mm/extmem.c                                 | 2 +-
 arch/s390/mm/gmap.c                                   | 2 +-
 arch/s390/mm/kasan_init.c                             | 2 +-
 arch/sh/include/asm/io.h                              | 2 +-
 arch/sh/include/asm/pgtable.h                         | 2 --
 arch/sh/mm/pmb.c                                      | 2 +-
 arch/sparc/include/asm/floppy_32.h                    | 2 +-
 arch/sparc/include/asm/highmem.h                      | 2 +-
 arch/sparc/include/asm/ide.h                          | 2 +-
 arch/sparc/include/asm/io-unit.h                      | 2 +-
 arch/sparc/include/asm/pgalloc_32.h                   | 2 +-
 arch/sparc/include/asm/pgtable_32.h                   | 2 --
 arch/sparc/include/asm/pgtable_64.h                   | 1 -
 arch/sparc/kernel/cpu.c                               | 2 +-
 arch/sparc/kernel/entry.S                             | 2 +-
 arch/sparc/kernel/head_64.S                           | 2 +-
 arch/sparc/kernel/ktlb.S                              | 2 +-
 arch/sparc/kernel/pci.c                               | 2 +-
 arch/sparc/kernel/sun4m_irq.c                         | 2 +-
 arch/sparc/kernel/trampoline_64.S                     | 2 +-
 arch/sparc/kernel/traps_32.c                          | 2 +-
 arch/sparc/lib/clear_page.S                           | 2 +-
 arch/sparc/lib/copy_page.S                            | 2 +-
 arch/sparc/mm/tsb.c                                   | 2 +-
 arch/sparc/mm/ultra.S                                 | 2 +-
 arch/um/include/asm/pgtable.h                         | 2 --
 arch/unicore32/include/asm/pgtable.h                  | 2 --
 arch/unicore32/kernel/hibernate.c                     | 2 +-
 arch/unicore32/kernel/hibernate_asm.S                 | 2 +-
 arch/unicore32/mm/alignment.c                         | 2 +-
 arch/unicore32/mm/proc-ucv2.S                         | 2 +-
 arch/x86/boot/compressed/kaslr_64.c                   | 2 +-
 arch/x86/include/asm/agp.h                            | 2 +-
 arch/x86/include/asm/asm-prototypes.h                 | 2 +-
 arch/x86/include/asm/efi.h                            | 2 +-
 arch/x86/include/asm/pgtable.h                        | 3 +--
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
 arch/x86/kernel/espfix_64.c                           | 2 +-
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
 arch/x86/mm/debug_pagetables.c                        | 2 +-
 arch/x86/mm/ioremap.c                                 | 2 +-
 arch/x86/mm/kaslr.c                                   | 2 +-
 arch/x86/mm/mem_encrypt_boot.S                        | 2 +-
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
 arch/xtensa/include/asm/initialize_mmu.h              | 2 +-
 arch/xtensa/include/asm/mmu_context.h                 | 2 +-
 arch/xtensa/include/asm/pgtable.h                     | 2 --
 arch/xtensa/kernel/entry.S                            | 2 +-
 arch/xtensa/kernel/traps.c                            | 2 +-
 arch/xtensa/kernel/vectors.S                          | 2 +-
 arch/xtensa/mm/cache.c                                | 2 +-
 arch/xtensa/mm/ioremap.c                              | 2 +-
 arch/xtensa/mm/misc.S                                 | 2 +-
 drivers/acpi/scan.c                                   | 2 +-
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
 drivers/misc/genwqe/card_utils.c                      | 2 +-
 drivers/mtd/ubi/ubi.h                                 | 2 +-
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
 include/asm-generic/io.h                              | 2 +-
 include/linux/crash_dump.h                            | 2 +-
 include/linux/dma-noncoherent.h                       | 2 +-
 include/linux/hmm.h                                   | 2 +-
 include/linux/hugetlb.h                               | 2 +-
 include/linux/io-mapping.h                            | 2 +-
 include/linux/kasan.h                                 | 2 +-
 include/linux/mm.h                                    | 2 +-
 include/{asm-generic => linux}/pgtable.h              | 5 +++--
 include/xen/arm/page.h                                | 2 +-
 kernel/bpf/syscall.c                                  | 2 +-
 mm/init-mm.c                                          | 2 +-
 mm/mincore.c                                          | 2 +-
 mm/mprotect.c                                         | 2 +-
 mm/page_reporting.h                                   | 2 +-
 mm/pgtable-generic.c                                  | 6 +++---
 mm/zsmalloc.c                                         | 2 +-
 sound/pci/hda/hda_intel.c                             | 2 +-
 sound/soc/intel/common/sst-firmware.c                 | 2 +-
 sound/soc/intel/haswell/sst-haswell-pcm.c             | 2 +-
 335 files changed, 313 insertions(+), 363 deletions(-)
 rename include/{asm-generic => linux}/pgtable.h (99%)

diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 0267aa8a4f86..1c263922beb3 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -355,8 +355,6 @@ extern inline pte_t mk_swap_pte(unsigned long type, unsigned long offset)
 
 extern void paging_init(void);
 
-#include <asm-generic/pgtable.h>
-
 /* We have our own get_unmapped_area to cope with ADDR_LIMIT_32BIT.  */
 #define HAVE_ARCH_UNMAPPED_AREA
 
diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
index f1fce942fddc..a093cd45ec79 100644
--- a/arch/alpha/kernel/proto.h
+++ b/arch/alpha/kernel/proto.h
@@ -2,7 +2,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 /* Prototypes of functions used across modules here in this directory.  */
 
diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index 12be7e1b7cc0..29137bcedd93 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -390,8 +390,6 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
 #include <asm/hugepage.h>
 #endif
 
-#include <asm-generic/pgtable.h>
-
 /* to cope with aliasing VIPT cache */
 #define HAVE_ARCH_UNMAPPED_AREA
 
diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
index 479b0d72d3cf..45e696dc3f0f 100644
--- a/arch/arc/mm/highmem.c
+++ b/arch/arc/mm/highmem.c
@@ -7,7 +7,7 @@
 #include <linux/export.h>
 #include <linux/highmem.h>
 #include <asm/processor.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 
diff --git a/arch/arc/mm/tlbex.S b/arch/arc/mm/tlbex.S
index 2efaf6ca0c06..2bbd4d28352b 100644
--- a/arch/arc/mm/tlbex.S
+++ b/arch/arc/mm/tlbex.S
@@ -35,7 +35,7 @@
 #include <linux/linkage.h>
 #include <asm/entry.h>
 #include <asm/mmu.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/arcregs.h>
 #include <asm/cache.h>
 #include <asm/processor.h>
diff --git a/arch/arm/include/asm/efi.h b/arch/arm/include/asm/efi.h
index 9383f236e795..62bc7f99c2ad 100644
--- a/arch/arm/include/asm/efi.h
+++ b/arch/arm/include/asm/efi.h
@@ -13,7 +13,7 @@
 #include <asm/highmem.h>
 #include <asm/mach/map.h>
 #include <asm/mmu_context.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 
 #ifdef CONFIG_EFI
diff --git a/arch/arm/include/asm/fixmap.h b/arch/arm/include/asm/fixmap.h
index 472c93db5dac..1ec9366f0f2a 100644
--- a/arch/arm/include/asm/fixmap.h
+++ b/arch/arm/include/asm/fixmap.h
@@ -7,7 +7,7 @@
 #define FIXADDR_TOP		(FIXADDR_END - PAGE_SIZE)
 
 #include <asm/kmap_types.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 enum fixed_addresses {
 	FIX_EARLYCON_MEM_BASE,
diff --git a/arch/arm/include/asm/idmap.h b/arch/arm/include/asm/idmap.h
index 73ba956e379f..aab7e8358e6a 100644
--- a/arch/arm/include/asm/idmap.h
+++ b/arch/arm/include/asm/idmap.h
@@ -3,7 +3,7 @@
 #define __ASM_IDMAP_H
 
 #include <linux/compiler.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 /* Tag a function as requiring to be executed via an identity mapping. */
 #define __idmap __section(.idmap.text) noinline notrace
diff --git a/arch/arm/include/asm/pgtable-nommu.h b/arch/arm/include/asm/pgtable-nommu.h
index 30fb2330f57b..1a758f14e0c3 100644
--- a/arch/arm/include/asm/pgtable-nommu.h
+++ b/arch/arm/include/asm/pgtable-nommu.h
@@ -73,8 +73,6 @@ extern unsigned int kobjsize(const void *objp);
 
 #define FIRST_USER_ADDRESS      0UL
 
-#include <asm-generic/pgtable.h>
-
 #else 
 
 /*
diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index fba20607c53c..38c7cd8b014b 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -339,8 +339,6 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 /* FIXME: this is not correct */
 #define kern_addr_valid(addr)	(1)
 
-#include <asm-generic/pgtable.h>
-
 /*
  * We provide our own arch_get_unmapped_area to cope with VIPT caches.
  */
diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
index c49b39340ddb..0290afdebd15 100644
--- a/arch/arm/kernel/head.S
+++ b/arch/arm/kernel/head.S
@@ -18,7 +18,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/memory.h>
 #include <asm/thread_info.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #if defined(CONFIG_DEBUG_LL) && !defined(CONFIG_DEBUG_SEMIHOSTING)
 #include CONFIG_DEBUG_LL_INCLUDE
diff --git a/arch/arm/kernel/suspend.c b/arch/arm/kernel/suspend.c
index d08099269e35..d46f07b67d30 100644
--- a/arch/arm/kernel/suspend.c
+++ b/arch/arm/kernel/suspend.c
@@ -7,7 +7,7 @@
 #include <asm/cacheflush.h>
 #include <asm/idmap.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/memory.h>
 #include <asm/smp_plat.h>
 #include <asm/suspend.h>
diff --git a/arch/arm/kernel/vmlinux.lds.S b/arch/arm/kernel/vmlinux.lds.S
index 88a720da443b..e111e606990d 100644
--- a/arch/arm/kernel/vmlinux.lds.S
+++ b/arch/arm/kernel/vmlinux.lds.S
@@ -14,7 +14,7 @@
 #include <asm/memory.h>
 #include <asm/mpu.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "vmlinux.lds.h"
 
diff --git a/arch/arm/mach-integrator/core.c b/arch/arm/mach-integrator/core.c
index 9da3ae232211..7cda45a2ddef 100644
--- a/arch/arm/mach-integrator/core.c
+++ b/arch/arm/mach-integrator/core.c
@@ -24,7 +24,7 @@
 
 #include <asm/mach-types.h>
 #include <asm/mach/time.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "hardware.h"
 #include "cm.h"
diff --git a/arch/arm/mach-keystone/platsmp.c b/arch/arm/mach-keystone/platsmp.c
index c810e23a8fa0..db05c56b6ca8 100644
--- a/arch/arm/mach-keystone/platsmp.c
+++ b/arch/arm/mach-keystone/platsmp.c
@@ -16,7 +16,7 @@
 #include <asm/smp_plat.h>
 #include <asm/prom.h>
 #include <asm/tlbflush.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "keystone.h"
 
diff --git a/arch/arm/mach-sa1100/hackkit.c b/arch/arm/mach-sa1100/hackkit.c
index 6d37d263e0d2..5f8b74ad4f4f 100644
--- a/arch/arm/mach-sa1100/hackkit.c
+++ b/arch/arm/mach-sa1100/hackkit.c
@@ -26,7 +26,7 @@
 #include <asm/mach-types.h>
 #include <asm/setup.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/flash.h>
diff --git a/arch/arm/mach-tegra/iomap.h b/arch/arm/mach-tegra/iomap.h
index 160cb18850f2..4cb7e5fee137 100644
--- a/arch/arm/mach-tegra/iomap.h
+++ b/arch/arm/mach-tegra/iomap.h
@@ -10,7 +10,7 @@
 #ifndef __MACH_TEGRA_IOMAP_H
 #define __MACH_TEGRA_IOMAP_H
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <linux/sizes.h>
 
 #define TEGRA_IRAM_BASE			0x40000000
diff --git a/arch/arm/mach-zynq/common.c b/arch/arm/mach-zynq/common.c
index a9dd2f71cd19..bfe572d76d1c 100644
--- a/arch/arm/mach-zynq/common.c
+++ b/arch/arm/mach-zynq/common.c
@@ -30,7 +30,7 @@
 #include <asm/mach/time.h>
 #include <asm/mach-types.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/smp_scu.h>
 #include <asm/system_info.h>
 #include <asm/hardware/cache-l2x0.h>
diff --git a/arch/arm/mm/idmap.c b/arch/arm/mm/idmap.c
index cd54411ef1b8..c3166810c3d1 100644
--- a/arch/arm/mm/idmap.c
+++ b/arch/arm/mm/idmap.c
@@ -8,7 +8,7 @@
 #include <asm/idmap.h>
 #include <asm/hwcap.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/sections.h>
 #include <asm/system_info.h>
 
diff --git a/arch/arm/mm/mm.h b/arch/arm/mm/mm.h
index 4f1f72b75890..534f68484383 100644
--- a/arch/arm/mm/mm.h
+++ b/arch/arm/mm/mm.h
@@ -3,7 +3,7 @@
 #include <linux/list.h>
 #include <linux/vmalloc.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 /* the upper-most page table pointer */
 extern pmd_t *top_pmd;
diff --git a/arch/arm/mm/proc-arm1020.S b/arch/arm/mm/proc-arm1020.S
index 2785da387c91..cab58358a744 100644
--- a/arch/arm/mm/proc-arm1020.S
+++ b/arch/arm/mm/proc-arm1020.S
@@ -15,7 +15,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm1020e.S b/arch/arm/mm/proc-arm1020e.S
index e9ea237ed785..283400780417 100644
--- a/arch/arm/mm/proc-arm1020e.S
+++ b/arch/arm/mm/proc-arm1020e.S
@@ -15,7 +15,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm1022.S b/arch/arm/mm/proc-arm1022.S
index 920c279e7879..73ba773f8102 100644
--- a/arch/arm/mm/proc-arm1022.S
+++ b/arch/arm/mm/proc-arm1022.S
@@ -15,7 +15,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm1026.S b/arch/arm/mm/proc-arm1026.S
index 0bdf25a95b10..20f76b7c2116 100644
--- a/arch/arm/mm/proc-arm1026.S
+++ b/arch/arm/mm/proc-arm1026.S
@@ -15,7 +15,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm720.S b/arch/arm/mm/proc-arm720.S
index 39361e196d61..83acd7aebd7f 100644
--- a/arch/arm/mm/proc-arm720.S
+++ b/arch/arm/mm/proc-arm720.S
@@ -24,7 +24,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm740.S b/arch/arm/mm/proc-arm740.S
index 1a94bbf6e53f..d395b91b005e 100644
--- a/arch/arm/mm/proc-arm740.S
+++ b/arch/arm/mm/proc-arm740.S
@@ -10,7 +10,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm7tdmi.S b/arch/arm/mm/proc-arm7tdmi.S
index 52b66cf0259e..2dd3cc169b5f 100644
--- a/arch/arm/mm/proc-arm7tdmi.S
+++ b/arch/arm/mm/proc-arm7tdmi.S
@@ -10,7 +10,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm920.S b/arch/arm/mm/proc-arm920.S
index 31ac8acc34dc..0a059485b2bf 100644
--- a/arch/arm/mm/proc-arm920.S
+++ b/arch/arm/mm/proc-arm920.S
@@ -16,7 +16,7 @@
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm922.S b/arch/arm/mm/proc-arm922.S
index ca2c7ca8af21..852a572fc8dd 100644
--- a/arch/arm/mm/proc-arm922.S
+++ b/arch/arm/mm/proc-arm922.S
@@ -17,7 +17,7 @@
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
index a381a0c9f109..5ada5925aa71 100644
--- a/arch/arm/mm/proc-arm925.S
+++ b/arch/arm/mm/proc-arm925.S
@@ -40,7 +40,7 @@
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm926.S b/arch/arm/mm/proc-arm926.S
index 1ba253c2bce1..260a849c84cf 100644
--- a/arch/arm/mm/proc-arm926.S
+++ b/arch/arm/mm/proc-arm926.S
@@ -16,7 +16,7 @@
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-arm940.S b/arch/arm/mm/proc-arm940.S
index 4b8a00220cc9..f90763f5080c 100644
--- a/arch/arm/mm/proc-arm940.S
+++ b/arch/arm/mm/proc-arm940.S
@@ -9,7 +9,7 @@
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 #include "proc-macros.S"
 
diff --git a/arch/arm/mm/proc-arm946.S b/arch/arm/mm/proc-arm946.S
index 555becf9c758..87beb81ab3bb 100644
--- a/arch/arm/mm/proc-arm946.S
+++ b/arch/arm/mm/proc-arm946.S
@@ -11,7 +11,7 @@
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 #include "proc-macros.S"
 
diff --git a/arch/arm/mm/proc-arm9tdmi.S b/arch/arm/mm/proc-arm9tdmi.S
index ef517530130b..88a22dd58f68 100644
--- a/arch/arm/mm/proc-arm9tdmi.S
+++ b/arch/arm/mm/proc-arm9tdmi.S
@@ -10,7 +10,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-fa526.S b/arch/arm/mm/proc-fa526.S
index dddf833fe000..38dc691b0ebf 100644
--- a/arch/arm/mm/proc-fa526.S
+++ b/arch/arm/mm/proc-fa526.S
@@ -14,7 +14,7 @@
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
 
diff --git a/arch/arm/mm/proc-feroceon.S b/arch/arm/mm/proc-feroceon.S
index b12b76bc8d30..33aa247943cb 100644
--- a/arch/arm/mm/proc-feroceon.S
+++ b/arch/arm/mm/proc-feroceon.S
@@ -11,7 +11,7 @@
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-mohawk.S b/arch/arm/mm/proc-mohawk.S
index d47d6c5cee63..2e2b4207e68e 100644
--- a/arch/arm/mm/proc-mohawk.S
+++ b/arch/arm/mm/proc-mohawk.S
@@ -12,7 +12,7 @@
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-sa110.S b/arch/arm/mm/proc-sa110.S
index baba503ba816..1cb988dc7c70 100644
--- a/arch/arm/mm/proc-sa110.S
+++ b/arch/arm/mm/proc-sa110.S
@@ -17,7 +17,7 @@
 #include <asm/hwcap.h>
 #include <mach/hardware.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-sa1100.S b/arch/arm/mm/proc-sa1100.S
index 75ebacc8e4e5..bc7cff5b6afa 100644
--- a/arch/arm/mm/proc-sa1100.S
+++ b/arch/arm/mm/proc-sa1100.S
@@ -22,7 +22,7 @@
 #include <asm/hwcap.h>
 #include <mach/hardware.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "proc-macros.S"
 
diff --git a/arch/arm/mm/proc-v6.S b/arch/arm/mm/proc-v6.S
index 1dd0d5ca27da..323d735031e7 100644
--- a/arch/arm/mm/proc-v6.S
+++ b/arch/arm/mm/proc-v6.S
@@ -13,7 +13,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "proc-macros.S"
 
diff --git a/arch/arm/mm/proc-v7.S b/arch/arm/mm/proc-v7.S
index 48e0ef6f0dcc..cfac7fd31689 100644
--- a/arch/arm/mm/proc-v7.S
+++ b/arch/arm/mm/proc-v7.S
@@ -13,7 +13,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/memory.h>
 
 #include "proc-macros.S"
diff --git a/arch/arm/mm/proc-xsc3.S b/arch/arm/mm/proc-xsc3.S
index 42eaecc43cfe..37d461a21093 100644
--- a/arch/arm/mm/proc-xsc3.S
+++ b/arch/arm/mm/proc-xsc3.S
@@ -25,7 +25,7 @@
 #include <linux/init.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/pgtable-hwdef.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
diff --git a/arch/arm/mm/proc-xscale.S b/arch/arm/mm/proc-xscale.S
index 18ac5a1f8922..06fea1348f82 100644
--- a/arch/arm/mm/proc-xscale.S
+++ b/arch/arm/mm/proc-xscale.S
@@ -21,7 +21,7 @@
 #include <linux/init.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/pgtable-hwdef.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
diff --git a/arch/arm/mm/pv-fixup-asm.S b/arch/arm/mm/pv-fixup-asm.S
index 769778928356..771f942a365a 100644
--- a/arch/arm/mm/pv-fixup-asm.S
+++ b/arch/arm/mm/pv-fixup-asm.S
@@ -9,7 +9,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/cp15.h>
 #include <asm/memory.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 	.section ".idmap.text", "ax"
 
diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 6facd1308e7c..1dbffe92739a 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -13,7 +13,7 @@
 #include <asm/byteorder.h>
 #include <asm/barrier.h>
 #include <asm/memory.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/early_ioremap.h>
 #include <asm/alternative.h>
 #include <asm/cpufeature.h>
diff --git a/arch/arm64/include/asm/kernel-pgtable.h b/arch/arm64/include/asm/kernel-pgtable.h
index a6e5da755359..3bf626f6fe0c 100644
--- a/arch/arm64/include/asm/kernel-pgtable.h
+++ b/arch/arm64/include/asm/kernel-pgtable.h
@@ -8,7 +8,7 @@
 #ifndef __ASM_KERNEL_PGTABLE_H
 #define __ASM_KERNEL_PGTABLE_H
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/sparsemem.h>
 
 /*
diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 8255fab2e441..7a6ce34ea353 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -87,7 +87,7 @@ alternative_cb_end
 #include <asm/cache.h>
 #include <asm/cacheflush.h>
 #include <asm/mmu_context.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 void kvm_update_va_mask(struct alt_instr *alt,
 			__le32 *origptr, __le32 *updptr, int nr_inst);
diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index ab46187c6300..67901dc864eb 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -20,7 +20,7 @@
 #include <asm/proc-fns.h>
 #include <asm-generic/mm_hooks.h>
 #include <asm/cputype.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/sysreg.h>
 #include <asm/tlbflush.h>
 
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 1f3218fc52fc..437c92ab2081 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -340,7 +340,7 @@ static inline pgprot_t mk_pmd_sect_prot(pgprot_t prot)
 
 #ifdef CONFIG_NUMA_BALANCING
 /*
- * See the comment in include/asm-generic/pgtable.h
+ * See the comment in include/linux/pgtable.h
  */
 static inline int pte_protnone(pte_t pte)
 {
@@ -853,8 +853,6 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 
 extern int kern_addr_valid(unsigned long addr);
 
-#include <asm-generic/pgtable.h>
-
 /*
  * On AArch64, the cache coherency is handled via the set_pte_at() function.
  */
diff --git a/arch/arm64/include/asm/stage2_pgtable.h b/arch/arm64/include/asm/stage2_pgtable.h
index 9a364aeae5fb..b767904f28b1 100644
--- a/arch/arm64/include/asm/stage2_pgtable.h
+++ b/arch/arm64/include/asm/stage2_pgtable.h
@@ -9,7 +9,7 @@
 #define __ARM64_S2_PGTABLE_H_
 
 #include <linux/hugetlb.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 /*
  * PGDIR_SHIFT determines the size a top-level page table entry can map
diff --git a/arch/arm64/include/asm/vmap_stack.h b/arch/arm64/include/asm/vmap_stack.h
index 0cc6636e3f15..8c0d68559f0b 100644
--- a/arch/arm64/include/asm/vmap_stack.h
+++ b/arch/arm64/include/asm/vmap_stack.h
@@ -8,7 +8,7 @@
 #include <linux/kconfig.h>
 #include <linux/vmalloc.h>
 #include <asm/memory.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/thread_info.h>
 
 /*
diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index a100483b47c4..d2c7138c6906 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -28,7 +28,7 @@
 #include <asm/cputype.h>
 #include <asm/cpu_ops.h>
 #include <asm/daifflags.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/smp_plat.h>
 
 int acpi_noirq = 1;		/* skip ACPI IRQ initialization */
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 340d60d2e218..ef65ebbe1cf6 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -26,7 +26,7 @@
 #include <asm/kvm_arm.h>
 #include <asm/memory.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/smp.h>
 #include <asm/sysreg.h>
diff --git a/arch/arm64/kernel/kaslr.c b/arch/arm64/kernel/kaslr.c
index 91a83104c6e8..c8c62ddbaaf7 100644
--- a/arch/arm64/kernel/kaslr.c
+++ b/arch/arm64/kernel/kaslr.c
@@ -17,7 +17,7 @@
 #include <asm/kernel-pgtable.h>
 #include <asm/memory.h>
 #include <asm/mmu.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/sections.h>
 
 enum kaslr_status {
diff --git a/arch/arm64/kernel/suspend.c b/arch/arm64/kernel/suspend.c
index 9405d1b7f4b0..10a1ee8a6eeb 100644
--- a/arch/arm64/kernel/suspend.c
+++ b/arch/arm64/kernel/suspend.c
@@ -9,7 +9,7 @@
 #include <asm/daifflags.h>
 #include <asm/debug-monitors.h>
 #include <asm/exec.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/memory.h>
 #include <asm/mmu_context.h>
 #include <asm/smp_plat.h>
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 3be632177631..8d08ef1dd57e 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -13,7 +13,7 @@
 #include <asm/thread_info.h>
 #include <asm/memory.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "image.h"
 
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 7d3bf1afba0c..3d248cb69198 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -13,7 +13,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/asm_pointer_auth.h>
 #include <asm/hwcap.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/pgtable-hwdef.h>
 #include <asm/cpufeature.h>
 #include <asm/alternative.h>
diff --git a/arch/c6x/include/asm/pgtable.h b/arch/c6x/include/asm/pgtable.h
index 197c473b796a..60a67d833989 100644
--- a/arch/c6x/include/asm/pgtable.h
+++ b/arch/c6x/include/asm/pgtable.h
@@ -64,6 +64,4 @@ extern unsigned long empty_zero_page;
  */
 #define pgprot_writecombine pgprot_noncached
 
-#include <asm-generic/pgtable.h>
-
 #endif /* _ASM_C6X_PGTABLE_H */
diff --git a/arch/csky/include/asm/io.h b/arch/csky/include/asm/io.h
index 332f51bc68fb..e909587f24c5 100644
--- a/arch/csky/include/asm/io.h
+++ b/arch/csky/include/asm/io.h
@@ -4,7 +4,7 @@
 #ifndef __ASM_CSKY_IO_H
 #define __ASM_CSKY_IO_H
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <linux/types.h>
 #include <linux/version.h>
 
diff --git a/arch/csky/include/asm/pgtable.h b/arch/csky/include/asm/pgtable.h
index 9ab4a445ad99..9d2d16db237d 100644
--- a/arch/csky/include/asm/pgtable.h
+++ b/arch/csky/include/asm/pgtable.h
@@ -306,6 +306,4 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
 #define io_remap_pfn_range(vma, vaddr, pfn, size, prot) \
 	remap_pfn_range(vma, vaddr, pfn, size, prot)
 
-#include <asm-generic/pgtable.h>
-
 #endif /* __ASM_CSKY_PGTABLE_H */
diff --git a/arch/h8300/include/asm/pgtable.h b/arch/h8300/include/asm/pgtable.h
index f00828720dc4..ea833a5d8bcf 100644
--- a/arch/h8300/include/asm/pgtable.h
+++ b/arch/h8300/include/asm/pgtable.h
@@ -2,7 +2,6 @@
 #ifndef _H8300_PGTABLE_H
 #define _H8300_PGTABLE_H
 #include <asm-generic/pgtable-nopud.h>
-#include <asm-generic/pgtable.h>
 extern void paging_init(void);
 #define PAGE_NONE		__pgprot(0)    /* these mean nothing to NO_MM */
 #define PAGE_SHARED		__pgprot(0)    /* these mean nothing to NO_MM */
diff --git a/arch/hexagon/include/asm/pgtable.h b/arch/hexagon/include/asm/pgtable.h
index 2a17d4eb2fa4..8df6e2702b53 100644
--- a/arch/hexagon/include/asm/pgtable.h
+++ b/arch/hexagon/include/asm/pgtable.h
@@ -460,7 +460,4 @@ static inline int pte_exec(pte_t pte)
 		((type << 1) | \
 		 ((offset & 0x7ffff0) << 9) | ((offset & 0xf) << 6)) })
 
-/*  Oh boy.  There are a lot of possible arch overrides found in this file.  */
-#include <asm-generic/pgtable.h>
-
 #endif
diff --git a/arch/hexagon/mm/uaccess.c b/arch/hexagon/mm/uaccess.c
index f8ddc35cf159..650bca92f0b7 100644
--- a/arch/hexagon/mm/uaccess.c
+++ b/arch/hexagon/mm/uaccess.c
@@ -11,7 +11,7 @@
  */
 #include <linux/types.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 /*
  * For clear_user(), exploit previously defined copy_to_user function
diff --git a/arch/ia64/include/asm/pgtable.h b/arch/ia64/include/asm/pgtable.h
index 787b0a91d255..3399824ad8a5 100644
--- a/arch/ia64/include/asm/pgtable.h
+++ b/arch/ia64/include/asm/pgtable.h
@@ -583,6 +583,5 @@ extern struct page *zero_page_memmap_ptr;
 #include <asm-generic/pgtable-nopud.h>
 #endif
 #include <asm-generic/pgtable-nop4d.h>
-#include <asm-generic/pgtable.h>
 
 #endif /* _ASM_IA64_PGTABLE_H */
diff --git a/arch/ia64/include/asm/uaccess.h b/arch/ia64/include/asm/uaccess.h
index 5c7e79eccaee..8aa473a4b0f4 100644
--- a/arch/ia64/include/asm/uaccess.h
+++ b/arch/ia64/include/asm/uaccess.h
@@ -37,7 +37,7 @@
 #include <linux/page-flags.h>
 
 #include <asm/intrinsics.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/io.h>
 #include <asm/extable.h>
 
diff --git a/arch/ia64/kernel/entry.S b/arch/ia64/kernel/entry.S
index 2ac926331500..e1d7573d304f 100644
--- a/arch/ia64/kernel/entry.S
+++ b/arch/ia64/kernel/entry.S
@@ -43,7 +43,7 @@
 #include <asm/errno.h>
 #include <asm/kregs.h>
 #include <asm/asm-offsets.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/percpu.h>
 #include <asm/processor.h>
 #include <asm/thread_info.h>
diff --git a/arch/ia64/kernel/head.S b/arch/ia64/kernel/head.S
index e6f45170a4b9..e6632c236324 100644
--- a/arch/ia64/kernel/head.S
+++ b/arch/ia64/kernel/head.S
@@ -27,7 +27,7 @@
 #include <asm/mmu_context.h>
 #include <asm/asm-offsets.h>
 #include <asm/pal.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/mca_asm.h>
diff --git a/arch/ia64/kernel/irq_ia64.c b/arch/ia64/kernel/irq_ia64.c
index e7862e4cb1e7..74a59d758995 100644
--- a/arch/ia64/kernel/irq_ia64.c
+++ b/arch/ia64/kernel/irq_ia64.c
@@ -37,7 +37,7 @@
 #include <asm/intrinsics.h>
 #include <asm/io.h>
 #include <asm/hw_irq.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/tlbflush.h>
 
 #ifdef CONFIG_PERFMON
diff --git a/arch/ia64/kernel/ivt.S b/arch/ia64/kernel/ivt.S
index 1efcbe5f0c78..055025dbbddb 100644
--- a/arch/ia64/kernel/ivt.S
+++ b/arch/ia64/kernel/ivt.S
@@ -52,7 +52,7 @@
 #include <asm/break.h>
 #include <asm/kregs.h>
 #include <asm/asm-offsets.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/thread_info.h>
diff --git a/arch/ia64/kernel/kprobes.c b/arch/ia64/kernel/kprobes.c
index a6d6a0556f08..66c1626c5cc7 100644
--- a/arch/ia64/kernel/kprobes.c
+++ b/arch/ia64/kernel/kprobes.c
@@ -18,7 +18,7 @@
 #include <linux/extable.h>
 #include <linux/kdebug.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/sections.h>
 #include <asm/exception.h>
 
diff --git a/arch/ia64/kernel/mca_asm.S b/arch/ia64/kernel/mca_asm.S
index 086cfa4999fd..e88aa5e28477 100644
--- a/arch/ia64/kernel/mca_asm.S
+++ b/arch/ia64/kernel/mca_asm.S
@@ -27,7 +27,7 @@
 #include <linux/threads.h>
 
 #include <asm/asmmacro.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/processor.h>
 #include <asm/mca_asm.h>
 #include <asm/mca.h>
diff --git a/arch/ia64/kernel/relocate_kernel.S b/arch/ia64/kernel/relocate_kernel.S
index 7124fe7bec7c..ddad8317ebbd 100644
--- a/arch/ia64/kernel/relocate_kernel.S
+++ b/arch/ia64/kernel/relocate_kernel.S
@@ -11,7 +11,7 @@
 #include <asm/asmmacro.h>
 #include <asm/kregs.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/mca_asm.h>
 
        /* Must be relocatable PIC code callable as a C function
diff --git a/arch/ia64/kernel/setup.c b/arch/ia64/kernel/setup.c
index 4009383453f7..c15e2fa7b3df 100644
--- a/arch/ia64/kernel/setup.c
+++ b/arch/ia64/kernel/setup.c
@@ -56,7 +56,7 @@
 #include <asm/meminit.h>
 #include <asm/page.h>
 #include <asm/patch.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/processor.h>
 #include <asm/sal.h>
 #include <asm/sections.h>
diff --git a/arch/ia64/kernel/uncached.c b/arch/ia64/kernel/uncached.c
index 3776ef225125..58f02d727053 100644
--- a/arch/ia64/kernel/uncached.c
+++ b/arch/ia64/kernel/uncached.c
@@ -21,7 +21,7 @@
 #include <linux/gfp.h>
 #include <asm/page.h>
 #include <asm/pal.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <linux/atomic.h>
 #include <asm/tlbflush.h>
 
diff --git a/arch/ia64/kernel/vmlinux.lds.S b/arch/ia64/kernel/vmlinux.lds.S
index 6b5652ee76f9..69efc4186318 100644
--- a/arch/ia64/kernel/vmlinux.lds.S
+++ b/arch/ia64/kernel/vmlinux.lds.S
@@ -2,7 +2,7 @@
 
 #include <asm/cache.h>
 #include <asm/ptrace.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/thread_info.h>
 
 #define EMITS_PT_NOTE
diff --git a/arch/m68k/68000/m68EZ328.c b/arch/m68k/68000/m68EZ328.c
index 6a309a3cfbfc..05f137dc257e 100644
--- a/arch/m68k/68000/m68EZ328.c
+++ b/arch/m68k/68000/m68EZ328.c
@@ -17,7 +17,7 @@
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/rtc.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/machdep.h>
 #include <asm/MC68EZ328.h>
 #ifdef CONFIG_UCSIMM
diff --git a/arch/m68k/68000/m68VZ328.c b/arch/m68k/68000/m68VZ328.c
index 81b5491685a4..c8c6f6d23138 100644
--- a/arch/m68k/68000/m68VZ328.c
+++ b/arch/m68k/68000/m68VZ328.c
@@ -23,7 +23,7 @@
 #include <linux/irq.h>
 #include <linux/rtc.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/machdep.h>
 #include <asm/MC68VZ328.h>
 #include <asm/bootstd.h>
diff --git a/arch/m68k/include/asm/pgtable_mm.h b/arch/m68k/include/asm/pgtable_mm.h
index f0e5167de834..aca22c2c1ee2 100644
--- a/arch/m68k/include/asm/pgtable_mm.h
+++ b/arch/m68k/include/asm/pgtable_mm.h
@@ -176,7 +176,6 @@ pgprot_t pgprot_dmacoherent(pgprot_t prot);
 #define pgprot_dmacoherent(prot)	pgprot_dmacoherent(prot)
 
 #endif /* CONFIG_COLDFIRE */
-#include <asm-generic/pgtable.h>
 #endif /* !__ASSEMBLY__ */
 
 #endif /* _M68K_PGTABLE_H */
diff --git a/arch/m68k/include/asm/pgtable_no.h b/arch/m68k/include/asm/pgtable_no.h
index ccc4568299e5..87151d67d91e 100644
--- a/arch/m68k/include/asm/pgtable_no.h
+++ b/arch/m68k/include/asm/pgtable_no.h
@@ -53,6 +53,4 @@ extern void paging_init(void);
 #define	KMAP_START	0
 #define	KMAP_END	0xffffffff
 
-#include <asm-generic/pgtable.h>
-
 #endif /* _M68KNOMMU_PGTABLE_H */
diff --git a/arch/m68k/include/asm/sun3xflop.h b/arch/m68k/include/asm/sun3xflop.h
index ef04c43acd13..cc2060f76953 100644
--- a/arch/m68k/include/asm/sun3xflop.h
+++ b/arch/m68k/include/asm/sun3xflop.h
@@ -11,7 +11,7 @@
 #define __ASM_SUN3X_FLOPPY_H
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/irq.h>
 #include <asm/sun3x.h>
 
diff --git a/arch/m68k/kernel/head.S b/arch/m68k/kernel/head.S
index a54788458ca3..e48c1bb13b19 100644
--- a/arch/m68k/kernel/head.S
+++ b/arch/m68k/kernel/head.S
@@ -264,7 +264,7 @@
 #include <asm/bootinfo-vme.h>
 #include <asm/setup.h>
 #include <asm/entry.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/asm-offsets.h>
 #ifdef CONFIG_MAC
diff --git a/arch/microblaze/include/asm/pgalloc.h b/arch/microblaze/include/asm/pgalloc.h
index 1d7a91252d03..c31a57d4aa0b 100644
--- a/arch/microblaze/include/asm/pgalloc.h
+++ b/arch/microblaze/include/asm/pgalloc.h
@@ -16,7 +16,7 @@
 #include <asm/io.h>
 #include <asm/page.h>
 #include <asm/cache.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #define __HAVE_ARCH_PTE_ALLOC_ONE_KERNEL
 #include <asm-generic/pgalloc.h>
diff --git a/arch/microblaze/include/asm/pgtable.h b/arch/microblaze/include/asm/pgtable.h
index 6b056f6545d8..ee2115abf405 100644
--- a/arch/microblaze/include/asm/pgtable.h
+++ b/arch/microblaze/include/asm/pgtable.h
@@ -507,8 +507,6 @@ void __init *early_get_page(void);
 #endif /* CONFIG_MMU */
 
 #ifndef __ASSEMBLY__
-#include <asm-generic/pgtable.h>
-
 extern unsigned long ioremap_bot, ioremap_base;
 
 void setup_memory(void);
diff --git a/arch/microblaze/include/asm/uaccess.h b/arch/microblaze/include/asm/uaccess.h
index 070ba6139a62..6723c56ec378 100644
--- a/arch/microblaze/include/asm/uaccess.h
+++ b/arch/microblaze/include/asm/uaccess.h
@@ -12,7 +12,7 @@
 
 #include <asm/mmu.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/extable.h>
 #include <linux/string.h>
 
diff --git a/arch/microblaze/kernel/hw_exception_handler.S b/arch/microblaze/kernel/hw_exception_handler.S
index 95558f32d60a..32add49d1bef 100644
--- a/arch/microblaze/kernel/hw_exception_handler.S
+++ b/arch/microblaze/kernel/hw_exception_handler.S
@@ -70,7 +70,7 @@
 #include <linux/linkage.h>
 
 #include <asm/mmu.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/signal.h>
 #include <asm/registers.h>
 #include <asm/asm-offsets.h>
diff --git a/arch/microblaze/kernel/module.c b/arch/microblaze/kernel/module.c
index d9a2014a222f..a18d59fe7bf0 100644
--- a/arch/microblaze/kernel/module.c
+++ b/arch/microblaze/kernel/module.c
@@ -12,7 +12,7 @@
 #include <linux/fs.h>
 #include <linux/string.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cacheflush.h>
 
 int apply_relocate_add(Elf32_Shdr *sechdrs, const char *strtab,
diff --git a/arch/microblaze/kernel/setup.c b/arch/microblaze/kernel/setup.c
index dd121e33b8e3..fd883a46a42f 100644
--- a/arch/microblaze/kernel/setup.c
+++ b/arch/microblaze/kernel/setup.c
@@ -33,7 +33,7 @@
 #include <asm/entry.h>
 #include <asm/cpuinfo.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 DEFINE_PER_CPU(unsigned int, KSP);	/* Saved kernel stack pointer */
 DEFINE_PER_CPU(unsigned int, KM);	/* Kernel/user mode */
diff --git a/arch/microblaze/mm/pgtable.c b/arch/microblaze/mm/pgtable.c
index 68c26cacd930..9db7dd5e897a 100644
--- a/arch/microblaze/mm/pgtable.c
+++ b/arch/microblaze/mm/pgtable.c
@@ -33,7 +33,7 @@
 #include <linux/init.h>
 #include <linux/mm_types.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/pgalloc.h>
 #include <linux/io.h>
 #include <asm/mmu.h>
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 4d9913f1644c..5a6f47bbda27 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -659,8 +659,6 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 
 #define gup_fast_permitted(start, end)	(!cpu_has_dc_aliases)
 
-#include <asm-generic/pgtable.h>
-
 /*
  * We provide our own get_unmapped area to cope with the virtual aliasing
  * constraints placed on us by the cache architecture.
diff --git a/arch/mips/jazz/irq.c b/arch/mips/jazz/irq.c
index 04b9c4068493..68f1b94d3b1f 100644
--- a/arch/mips/jazz/irq.c
+++ b/arch/mips/jazz/irq.c
@@ -19,7 +19,7 @@
 #include <asm/i8259.h>
 #include <asm/io.h>
 #include <asm/jazz.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/tlbmisc.h>
 
 static DEFINE_RAW_SPINLOCK(r4030_lock);
diff --git a/arch/mips/jazz/setup.c b/arch/mips/jazz/setup.c
index 1b5e121c3f0d..8283bbed77b0 100644
--- a/arch/mips/jazz/setup.c
+++ b/arch/mips/jazz/setup.c
@@ -21,7 +21,7 @@
 #include <asm/jazz.h>
 #include <asm/jazzdma.h>
 #include <asm/reboot.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/tlbmisc.h>
 
 extern asmlinkage void jazz_handle_int(void);
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 9f50ceef9978..da70b1e62d8d 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -25,7 +25,7 @@
 #include <asm/cacheflush.h>
 #include <asm/mmu_context.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include <linux/kvm_host.h>
 
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 38c204204529..a0c0c7eb25ad 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -32,7 +32,7 @@
 #include <asm/cacheflush.h>
 #include <asm/cpu-type.h>
 #include <asm/mmu_context.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/war.h>
 #include <asm/uasm.h>
 #include <asm/setup.h>
diff --git a/arch/nds32/include/asm/highmem.h b/arch/nds32/include/asm/highmem.h
index 5717647d14d1..127e535d4367 100644
--- a/arch/nds32/include/asm/highmem.h
+++ b/arch/nds32/include/asm/highmem.h
@@ -7,7 +7,7 @@
 #include <asm/proc-fns.h>
 #include <asm/kmap_types.h>
 #include <asm/fixmap.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 /*
  * Right now we initialize only a single pte table. It can be extended
diff --git a/arch/nds32/include/asm/pgtable.h b/arch/nds32/include/asm/pgtable.h
index 476cc4dd1709..51fe1c567702 100644
--- a/arch/nds32/include/asm/pgtable.h
+++ b/arch/nds32/include/asm/pgtable.h
@@ -374,8 +374,6 @@ extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
 /* Needs to be defined here and not in linux/mm.h, as it is arch dependent */
 #define kern_addr_valid(addr)	(1)
 
-#include <asm-generic/pgtable.h>
-
 /*
  * We provide our own arch_get_unmapped_area to cope with VIPT caches.
  */
diff --git a/arch/nds32/kernel/head.S b/arch/nds32/kernel/head.S
index fcefb62606ca..76de206009c6 100644
--- a/arch/nds32/kernel/head.S
+++ b/arch/nds32/kernel/head.S
@@ -6,7 +6,7 @@
 #include <asm/ptrace.h>
 #include <asm/asm-offsets.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <linux/sizes.h>
 #include <asm/thread_info.h>
 
diff --git a/arch/nds32/kernel/module.c b/arch/nds32/kernel/module.c
index 1e31829cbc2a..3897fd14a21d 100644
--- a/arch/nds32/kernel/module.c
+++ b/arch/nds32/kernel/module.c
@@ -5,7 +5,7 @@
 #include <linux/elf.h>
 #include <linux/vmalloc.h>
 #include <linux/moduleloader.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 void *module_alloc(unsigned long size)
 {
diff --git a/arch/nios2/include/asm/pgtable.h b/arch/nios2/include/asm/pgtable.h
index 47a1a3ea5734..f0d4921d05ad 100644
--- a/arch/nios2/include/asm/pgtable.h
+++ b/arch/nios2/include/asm/pgtable.h
@@ -285,8 +285,6 @@ static inline void pte_clear(struct mm_struct *mm,
 
 #define kern_addr_valid(addr)		(1)
 
-#include <asm-generic/pgtable.h>
-
 extern void __init paging_init(void);
 extern void __init mmu_init(void);
 
diff --git a/arch/nios2/kernel/nios2_ksyms.c b/arch/nios2/kernel/nios2_ksyms.c
index 4e704046a150..a9fdd8210db1 100644
--- a/arch/nios2/kernel/nios2_ksyms.c
+++ b/arch/nios2/kernel/nios2_ksyms.c
@@ -10,7 +10,7 @@
 #include <linux/string.h>
 
 #include <asm/cacheflush.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 /* string functions */
 
diff --git a/arch/openrisc/include/asm/io.h b/arch/openrisc/include/asm/io.h
index e18f038b2a6d..b90a09407141 100644
--- a/arch/openrisc/include/asm/io.h
+++ b/arch/openrisc/include/asm/io.h
@@ -26,7 +26,7 @@
 #define PIO_MASK		0
 
 #include <asm-generic/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 void __iomem *ioremap(phys_addr_t offset, unsigned long size);
 extern void iounmap(void *addr);
diff --git a/arch/openrisc/include/asm/pgtable.h b/arch/openrisc/include/asm/pgtable.h
index 219979e57790..f4273d387243 100644
--- a/arch/openrisc/include/asm/pgtable.h
+++ b/arch/openrisc/include/asm/pgtable.h
@@ -438,8 +438,6 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
 
 #define kern_addr_valid(addr)           (1)
 
-#include <asm-generic/pgtable.h>
-
 typedef pte_t *pte_addr_t;
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/openrisc/kernel/entry.S b/arch/openrisc/kernel/entry.S
index e4a78571f883..c2a3b36b8ee5 100644
--- a/arch/openrisc/kernel/entry.S
+++ b/arch/openrisc/kernel/entry.S
@@ -21,7 +21,7 @@
 #include <asm/spr_defs.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/asm-offsets.h>
 
 #define DISABLE_INTERRUPTS(t1,t2)			\
diff --git a/arch/openrisc/kernel/head.S b/arch/openrisc/kernel/head.S
index b0dc974f9a74..4d0636488829 100644
--- a/arch/openrisc/kernel/head.S
+++ b/arch/openrisc/kernel/head.S
@@ -19,7 +19,7 @@
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/thread_info.h>
 #include <asm/cache.h>
 #include <asm/spr_defs.h>
diff --git a/arch/openrisc/kernel/or32_ksyms.c b/arch/openrisc/kernel/or32_ksyms.c
index 7d6a62eee2ef..7c0cae7423e4 100644
--- a/arch/openrisc/kernel/or32_ksyms.c
+++ b/arch/openrisc/kernel/or32_ksyms.c
@@ -26,7 +26,7 @@
 #include <asm/hardirq.h>
 #include <asm/delay.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #define DECLARE_EXPORT(name) extern void name(void); EXPORT_SYMBOL(name)
 
diff --git a/arch/openrisc/mm/ioremap.c b/arch/openrisc/mm/ioremap.c
index 8f8e97f7eac9..a6b17d88c2fb 100644
--- a/arch/openrisc/mm/ioremap.c
+++ b/arch/openrisc/mm/ioremap.c
@@ -17,7 +17,7 @@
 #include <asm/kmap_types.h>
 #include <asm/fixmap.h>
 #include <asm/bug.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <linux/sched.h>
 #include <asm/tlbflush.h>
 
diff --git a/arch/parisc/include/asm/io.h b/arch/parisc/include/asm/io.h
index cab8f64ca4a2..116effe26143 100644
--- a/arch/parisc/include/asm/io.h
+++ b/arch/parisc/include/asm/io.h
@@ -3,7 +3,7 @@
 #define _ASM_IO_H
 
 #include <linux/types.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #define virt_to_phys(a) ((unsigned long)__pa(a))
 #define phys_to_virt(a) __va(a)
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 9832c73a7021..c1eb5a89b5e5 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -573,6 +573,5 @@ extern void arch_report_meminfo(struct seq_file *m);
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
 #define __HAVE_ARCH_PTE_SAME
-#include <asm-generic/pgtable.h>
 
 #endif /* _PARISC_PGTABLE_H */
diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
index aa79d35dedfa..e57b86009166 100644
--- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -21,7 +21,7 @@
 #include <linux/hardirq.h>
 #include <linux/kbuild.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/ptrace.h>
 #include <asm/processor.h>
 #include <asm/pdc.h>
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 9a03e29c8733..b77cf5993de3 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -19,7 +19,7 @@
 #include <asm/psw.h>
 #include <asm/cache.h>		/* for L1_CACHE_SHIFT */
 #include <asm/assembly.h>	/* for LDREG/STREG defines */
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/signal.h>
 #include <asm/unistd.h>
 #include <asm/ldcw.h>
diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
index 951a339369dd..ad333e8b7677 100644
--- a/arch/parisc/kernel/head.S
+++ b/arch/parisc/kernel/head.S
@@ -17,7 +17,7 @@
 #include <asm/pdc.h>
 	
 #include <asm/assembly.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include <linux/linkage.h>
 #include <linux/init.h>
diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index fa092ed1e837..80c8c6103ce0 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -21,7 +21,7 @@
 
 #include <asm/psw.h>
 #include <asm/assembly.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cache.h>
 #include <asm/ldcw.h>
 #include <asm/alternative.h>
diff --git a/arch/parisc/kernel/pdt.c b/arch/parisc/kernel/pdt.c
index 749c4579db0d..bdfe445c0ff3 100644
--- a/arch/parisc/kernel/pdt.c
+++ b/arch/parisc/kernel/pdt.c
@@ -21,7 +21,7 @@
 #include <asm/pdc.h>
 #include <asm/pdcpat.h>
 #include <asm/sections.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 enum pdt_access_type {
 	PDT_NONE,
diff --git a/arch/powerpc/include/asm/fixmap.h b/arch/powerpc/include/asm/fixmap.h
index 2ef155a3c821..27481b9e9b77 100644
--- a/arch/powerpc/include/asm/fixmap.h
+++ b/arch/powerpc/include/asm/fixmap.h
@@ -17,7 +17,7 @@
 #ifndef __ASSEMBLY__
 #include <linux/sizes.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #ifdef CONFIG_HIGHMEM
 #include <linux/threads.h>
 #include <asm/kmap_types.h>
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 92bcd1a26d73..ee03d1c63a82 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -37,7 +37,7 @@
 
 #else /* !__ASSEMBLY__ */
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 void setup_kup(void);
 
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 7fed9dc0f147..09adb1db357f 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -56,7 +56,7 @@ static inline bool pte_exec(pte_t pte)		{ return pte_val(pte) & _PAGE_EXEC; }
 #ifdef CONFIG_NUMA_BALANCING
 /*
  * These work without NUMA balancing but the kernel does not care. See the
- * comment in include/asm-generic/pgtable.h . On powerpc, this will only
+ * comment in include/linux/pgtable.h . On powerpc, this will only
  * work for user pages and always return true for kernel pages.
  */
 static inline int pte_protnone(pte_t pte)
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index bad9b324559d..a928bdad982f 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -96,8 +96,6 @@ extern unsigned long ioremap_bot;
  */
 #define kern_addr_valid(addr)	(1)
 
-#include <asm-generic/pgtable.h>
-
 #ifndef CONFIG_TRANSPARENT_HUGEPAGE
 #define pmd_large(pmd)		0
 #endif
diff --git a/arch/powerpc/include/asm/tlb.h b/arch/powerpc/include/asm/tlb.h
index 7f3a8b902325..862985cf5180 100644
--- a/arch/powerpc/include/asm/tlb.h
+++ b/arch/powerpc/include/asm/tlb.h
@@ -10,7 +10,7 @@
 #ifdef __KERNEL__
 
 #ifndef __powerpc64__
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #endif
 #include <asm/pgalloc.h>
 #ifndef __powerpc64__
diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
index f57712a55815..36dd553df8bb 100644
--- a/arch/powerpc/kernel/btext.c
+++ b/arch/powerpc/kernel/btext.c
@@ -15,7 +15,7 @@
 #include <asm/btext.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/io.h>
 #include <asm/processor.h>
 #include <asm/udbg.h>
diff --git a/arch/powerpc/kernel/fpu.S b/arch/powerpc/kernel/fpu.S
index 3235a8da6af7..e7463613dccd 100644
--- a/arch/powerpc/kernel/fpu.S
+++ b/arch/powerpc/kernel/fpu.S
@@ -12,7 +12,7 @@
 #include <asm/reg.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cputable.h>
 #include <asm/cache.h>
 #include <asm/thread_info.h>
diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index daaa153950c2..05796104e8ce 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -20,7 +20,7 @@
 #include <asm/reg.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cputable.h>
 #include <asm/cache.h>
 #include <asm/thread_info.h>
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 9bb663977e84..07d60626929f 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -29,7 +29,7 @@
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cputable.h>
 #include <asm/thread_info.h>
 #include <asm/ppc_asm.h>
diff --git a/arch/powerpc/kernel/head_44x.S b/arch/powerpc/kernel/head_44x.S
index 51dd01a27314..c67defec6847 100644
--- a/arch/powerpc/kernel/head_44x.S
+++ b/arch/powerpc/kernel/head_44x.S
@@ -28,7 +28,7 @@
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cputable.h>
 #include <asm/thread_info.h>
 #include <asm/ppc_asm.h>
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 073a651787df..ee2b9f48536b 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -20,7 +20,7 @@
 #include <asm/page.h>
 #include <asm/mmu.h>
 #include <asm/cache.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cputable.h>
 #include <asm/thread_info.h>
 #include <asm/ppc_asm.h>
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index 840af004041e..1b9e25e77cba 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -31,7 +31,7 @@
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cputable.h>
 #include <asm/thread_info.h>
 #include <asm/ppc_asm.h>
diff --git a/arch/powerpc/kernel/io-workarounds.c b/arch/powerpc/kernel/io-workarounds.c
index 0276bc8c8969..03185161772a 100644
--- a/arch/powerpc/kernel/io-workarounds.c
+++ b/arch/powerpc/kernel/io-workarounds.c
@@ -13,7 +13,7 @@
 
 #include <asm/io.h>
 #include <asm/machdep.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/ppc-pci.h>
 #include <asm/io-workarounds.h>
 #include <asm/pte-walk.h>
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 112d150354b2..2c09bffdce2f 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -54,7 +54,7 @@
 
 #include <linux/uaccess.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/irq.h>
 #include <asm/cache.h>
 #include <asm/prom.h>
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index 1d18991f3854..c54e8475fd24 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -15,7 +15,7 @@
 #include <asm/mmu.h>
 #include <asm/mce.h>
 #include <asm/machdep.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/pte-walk.h>
 #include <asm/sstep.h>
 #include <asm/exception-64s.h>
diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index 3f91ccaa9c74..fbddbae795bd 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -12,7 +12,7 @@
 #include <asm/lppaca.h>
 #include <asm/paca.h>
 #include <asm/sections.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/kexec.h>
 #include <asm/svm.h>
 #include <asm/ultravisor.h>
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 6620f37abe73..061cec01d2fa 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -41,7 +41,7 @@
 #include <asm/smp.h>
 #include <asm/mmu.h>
 #include <asm/paca.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/powernv.h>
 #include <asm/iommu.h>
 #include <asm/btext.h>
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 806be751c336..17b2a1ef8c1c 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -34,7 +34,7 @@
 #include <asm/io.h>
 #include <asm/smp.h>
 #include <asm/mmu.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/iommu.h>
 #include <asm/btext.h>
 #include <asm/sections.h>
diff --git a/arch/powerpc/kernel/rtas_pci.c b/arch/powerpc/kernel/rtas_pci.c
index ae5e43eaca48..ef7a87a7d6d6 100644
--- a/arch/powerpc/kernel/rtas_pci.c
+++ b/arch/powerpc/kernel/rtas_pci.c
@@ -15,7 +15,7 @@
 #include <linux/init.h>
 
 #include <asm/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/irq.h>
 #include <asm/prom.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index f9c0d888ce8a..301279c1979f 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -37,7 +37,7 @@
 #include <asm/prom.h>
 #include <asm/processor.h>
 #include <asm/vdso_datapage.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/smp.h>
 #include <asm/elf.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index 305ca89d856f..f38fe628ca55 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -23,7 +23,7 @@
 #include <asm/io.h>
 #include <asm/prom.h>
 #include <asm/processor.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/setup.h>
 #include <asm/smp.h>
 #include <asm/elf.h>
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 8105010b0e76..cd6870e0360a 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -36,7 +36,7 @@
 #include <asm/kdump.h>
 #include <asm/prom.h>
 #include <asm/processor.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/smp.h>
 #include <asm/elf.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 6d2a3a3666f0..7478b568c09b 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -41,7 +41,7 @@
 #include <asm/kvm_ppc.h>
 #include <asm/dbell.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/prom.h>
 #include <asm/smp.h>
 #include <asm/time.h>
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 07a1a873d367..78b87df5dab9 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -16,7 +16,7 @@
 #include <asm/kvm_book3s.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/pte-walk.h>
 #include <asm/ultravisor.h>
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 99011f1b772a..abaa83a504e3 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -15,7 +15,7 @@
 #include <asm/kvm_ppc.h>
 #include <asm/kvm_book3s.h>
 #include <asm/mmu.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/pte-walk.h>
 #include <asm/reg.h>
diff --git a/arch/powerpc/kvm/book3s_hv_rm_xics.c b/arch/powerpc/kvm/book3s_hv_rm_xics.c
index 287d5911df0f..ce594d39d1bf 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_xics.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_xics.c
@@ -15,7 +15,7 @@
 #include <asm/xics.h>
 #include <asm/synch.h>
 #include <asm/cputhreads.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/ppc-opcode.h>
 #include <asm/pnv-pci.h>
 #include <asm/opal.h>
diff --git a/arch/powerpc/kvm/book3s_hv_rm_xive.c b/arch/powerpc/kvm/book3s_hv_rm_xive.c
index 174d75e476fa..df0b567096d1 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_xive.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_xive.c
@@ -11,7 +11,7 @@
 #include <asm/debug.h>
 #include <asm/synch.h>
 #include <asm/cputhreads.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/ppc-opcode.h>
 #include <asm/pnv-pci.h>
 #include <asm/opal.h>
diff --git a/arch/powerpc/kvm/fpu.S b/arch/powerpc/kvm/fpu.S
index 3dfae0cb6228..0703d4480d3d 100644
--- a/arch/powerpc/kvm/fpu.S
+++ b/arch/powerpc/kvm/fpu.S
@@ -8,7 +8,7 @@
 #include <asm/reg.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cputable.h>
 #include <asm/cache.h>
 #include <asm/thread_info.h>
diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
index 6d236080cb1a..ebc9a7ef587a 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -16,7 +16,7 @@
 
 #include <asm/reg.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cputable.h>
 #include <asm/ppc_asm.h>
 #include <asm/thread_info.h>
diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index d2d8237ea9d5..d2a175576ff4 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -18,7 +18,7 @@
 #include <asm/machdep.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/trace.h>
 #include <asm/tlb.h>
 #include <asm/cputable.h>
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 3d727f73a8db..425ea50f185e 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -38,7 +38,7 @@
 
 #include <asm/debugfs.h>
 #include <asm/processor.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
 #include <asm/page.h>
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 716204aee3da..5f0ef6f6475e 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -10,7 +10,7 @@
  */
 
 #include <asm/asm-prototypes.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
 #include <asm/paca.h>
diff --git a/arch/powerpc/mm/book3s64/subpage_prot.c b/arch/powerpc/mm/book3s64/subpage_prot.c
index 25a0c044bd93..6c9d5415aa72 100644
--- a/arch/powerpc/mm/book3s64/subpage_prot.c
+++ b/arch/powerpc/mm/book3s64/subpage_prot.c
@@ -11,7 +11,7 @@
 #include <linux/hugetlb.h>
 #include <linux/syscalls.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <linux/uaccess.h>
 
 /*
diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
index 42ef7a6e6098..07acb2038fa4 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -18,7 +18,7 @@
 
 #include <linux/string.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/kup.h>
 
 phys_addr_t memstart_addr __ro_after_init = (phys_addr_t)~0ull;
diff --git a/arch/powerpc/mm/nohash/tlb_low_64e.S b/arch/powerpc/mm/nohash/tlb_low_64e.S
index 1f110c3c48fb..25cb8c18e02e 100644
--- a/arch/powerpc/mm/nohash/tlb_low_64e.S
+++ b/arch/powerpc/mm/nohash/tlb_low_64e.S
@@ -13,7 +13,7 @@
 #include <asm/ppc_asm.h>
 #include <asm/asm-offsets.h>
 #include <asm/cputable.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/exception-64e.h>
 #include <asm/ppc-opcode.h>
 #include <asm/kvm_asm.h>
diff --git a/arch/powerpc/mm/ptdump/8xx.c b/arch/powerpc/mm/ptdump/8xx.c
index 9e2d8e847d6e..fabc64721e1a 100644
--- a/arch/powerpc/mm/ptdump/8xx.c
+++ b/arch/powerpc/mm/ptdump/8xx.c
@@ -5,7 +5,7 @@
  *
  */
 #include <linux/kernel.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "ptdump.h"
 
diff --git a/arch/powerpc/mm/ptdump/bats.c b/arch/powerpc/mm/ptdump/bats.c
index d3a5d6b318d1..87ccef750c05 100644
--- a/arch/powerpc/mm/ptdump/bats.c
+++ b/arch/powerpc/mm/ptdump/bats.c
@@ -7,7 +7,7 @@
  */
 
 #include <asm/debugfs.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cpu_has_feature.h>
 
 static char *pp_601(int k, int pp)
diff --git a/arch/powerpc/mm/ptdump/book3s64.c b/arch/powerpc/mm/ptdump/book3s64.c
index 0dfca72cb9bd..14f73868db66 100644
--- a/arch/powerpc/mm/ptdump/book3s64.c
+++ b/arch/powerpc/mm/ptdump/book3s64.c
@@ -5,7 +5,7 @@
  *
  */
 #include <linux/kernel.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "ptdump.h"
 
diff --git a/arch/powerpc/mm/ptdump/shared.c b/arch/powerpc/mm/ptdump/shared.c
index f7ed2f187cb0..5f67bcf4def7 100644
--- a/arch/powerpc/mm/ptdump/shared.c
+++ b/arch/powerpc/mm/ptdump/shared.c
@@ -5,7 +5,7 @@
  *
  */
 #include <linux/kernel.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "ptdump.h"
 
diff --git a/arch/powerpc/platforms/85xx/corenet_generic.c b/arch/powerpc/platforms/85xx/corenet_generic.c
index 27ac38f7e1a9..3b82bb594436 100644
--- a/arch/powerpc/platforms/85xx/corenet_generic.c
+++ b/arch/powerpc/platforms/85xx/corenet_generic.c
@@ -16,7 +16,7 @@
 #include <asm/time.h>
 #include <asm/machdep.h>
 #include <asm/pci-bridge.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/ppc-pci.h>
 #include <mm/mmu_decl.h>
 #include <asm/prom.h>
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_cds.c b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
index 915ab6710b93..70494097f048 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_cds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
@@ -23,7 +23,7 @@
 #include <linux/fsl_devices.h>
 #include <linux/of_platform.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <linux/atomic.h>
 #include <asm/time.h>
diff --git a/arch/powerpc/platforms/85xx/qemu_e500.c b/arch/powerpc/platforms/85xx/qemu_e500.c
index a43b8c30157c..1f6f02769e21 100644
--- a/arch/powerpc/platforms/85xx/qemu_e500.c
+++ b/arch/powerpc/platforms/85xx/qemu_e500.c
@@ -14,7 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/of_fdt.h>
 #include <asm/machdep.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/time.h>
 #include <asm/udbg.h>
 #include <asm/mpic.h>
diff --git a/arch/powerpc/platforms/85xx/sbc8548.c b/arch/powerpc/platforms/85xx/sbc8548.c
index dd97ef277276..bec61b1ec0f0 100644
--- a/arch/powerpc/platforms/85xx/sbc8548.c
+++ b/arch/powerpc/platforms/85xx/sbc8548.c
@@ -25,7 +25,7 @@
 #include <linux/fsl_devices.h>
 #include <linux/of_platform.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <linux/atomic.h>
 #include <asm/time.h>
diff --git a/arch/powerpc/platforms/85xx/smp.c b/arch/powerpc/platforms/85xx/smp.c
index 48f7d96ae37d..28ca4d2afe5e 100644
--- a/arch/powerpc/platforms/85xx/smp.c
+++ b/arch/powerpc/platforms/85xx/smp.c
@@ -18,7 +18,7 @@
 #include <linux/fsl/guts.h>
 
 #include <asm/machdep.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/mpic.h>
 #include <asm/cacheflush.h>
diff --git a/arch/powerpc/platforms/86xx/mpc86xx_smp.c b/arch/powerpc/platforms/86xx/mpc86xx_smp.c
index 5b91ea5694e3..edad7a694f03 100644
--- a/arch/powerpc/platforms/86xx/mpc86xx_smp.c
+++ b/arch/powerpc/platforms/86xx/mpc86xx_smp.c
@@ -13,7 +13,7 @@
 
 #include <asm/code-patching.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/pci-bridge.h>
 #include <asm/mpic.h>
 #include <asm/cacheflush.h>
diff --git a/arch/powerpc/platforms/cell/cbe_regs.c b/arch/powerpc/platforms/cell/cbe_regs.c
index 0be212a27254..8962b0864802 100644
--- a/arch/powerpc/platforms/cell/cbe_regs.c
+++ b/arch/powerpc/platforms/cell/cbe_regs.c
@@ -14,7 +14,7 @@
 #include <linux/of_platform.h>
 
 #include <asm/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/prom.h>
 #include <asm/ptrace.h>
 #include <asm/cell-regs.h>
diff --git a/arch/powerpc/platforms/cell/interrupt.c b/arch/powerpc/platforms/cell/interrupt.c
index 5927ead4aed2..735c9cdc650f 100644
--- a/arch/powerpc/platforms/cell/interrupt.c
+++ b/arch/powerpc/platforms/cell/interrupt.c
@@ -25,7 +25,7 @@
 #include <linux/kernel_stat.h>
 
 #include <asm/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/prom.h>
 #include <asm/ptrace.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/cell/pervasive.c b/arch/powerpc/platforms/cell/pervasive.c
index 6af3a6e600a7..13d8a1b087ab 100644
--- a/arch/powerpc/platforms/cell/pervasive.c
+++ b/arch/powerpc/platforms/cell/pervasive.c
@@ -19,7 +19,7 @@
 #include <asm/io.h>
 #include <asm/machdep.h>
 #include <asm/prom.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/reg.h>
 #include <asm/cell-regs.h>
 #include <asm/cpu_has_feature.h>
diff --git a/arch/powerpc/platforms/cell/smp.c b/arch/powerpc/platforms/cell/smp.c
index 85d795d96a27..cc38e6a6d5a7 100644
--- a/arch/powerpc/platforms/cell/smp.c
+++ b/arch/powerpc/platforms/cell/smp.c
@@ -26,7 +26,7 @@
 #include <linux/atomic.h>
 #include <asm/irq.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/io.h>
 #include <asm/prom.h>
 #include <asm/smp.h>
diff --git a/arch/powerpc/platforms/cell/spider-pic.c b/arch/powerpc/platforms/cell/spider-pic.c
index 026b72c0a452..4da3cdd34116 100644
--- a/arch/powerpc/platforms/cell/spider-pic.c
+++ b/arch/powerpc/platforms/cell/spider-pic.c
@@ -11,7 +11,7 @@
 #include <linux/irq.h>
 #include <linux/ioport.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/prom.h>
 #include <asm/io.h>
 
diff --git a/arch/powerpc/platforms/chrp/pci.c b/arch/powerpc/platforms/chrp/pci.c
index b020c757d2bf..7c81f363db4d 100644
--- a/arch/powerpc/platforms/chrp/pci.c
+++ b/arch/powerpc/platforms/chrp/pci.c
@@ -10,7 +10,7 @@
 #include <linux/init.h>
 
 #include <asm/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/irq.h>
 #include <asm/hydra.h>
 #include <asm/prom.h>
diff --git a/arch/powerpc/platforms/chrp/smp.c b/arch/powerpc/platforms/chrp/smp.c
index f7bb6cb8d1e3..c21199a10a0f 100644
--- a/arch/powerpc/platforms/chrp/smp.c
+++ b/arch/powerpc/platforms/chrp/smp.c
@@ -21,7 +21,7 @@
 #include <linux/atomic.h>
 #include <asm/irq.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/sections.h>
 #include <asm/io.h>
 #include <asm/prom.h>
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index be2ab5b11e57..3b6f6f5ab7ac 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -36,7 +36,7 @@
 #include <asm/code-patching.h>
 #include <asm/irq.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/sections.h>
 #include <asm/io.h>
 #include <asm/prom.h>
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index e4ed5317f117..6945964ad002 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -24,7 +24,7 @@
 #include <asm/processor.h>
 #include <asm/mmu.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/machdep.h>
 #include <asm/mmu_context.h>
 #include <asm/iommu.h>
diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index ad61e90032da..112c47780679 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -25,7 +25,7 @@
 #include <linux/atomic.h>
 #include <asm/irq.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/io.h>
 #include <asm/prom.h>
 #include <asm/smp.h>
diff --git a/arch/powerpc/sysdev/fsl_85xx_cache_sram.c b/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
index f6c665dac725..a3aeaa5f0f1b 100644
--- a/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
+++ b/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
@@ -15,7 +15,7 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/of_platform.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/fsl_85xx_cache_sram.h>
 
 #include "fsl_85xx_cache_ctlr.h"
diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index a3a72b780e67..0cd031eae55f 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -33,7 +33,7 @@
 #include <asm/ptrace.h>
 #include <asm/signal.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/irq.h>
 #include <asm/machdep.h>
 #include <asm/mpic.h>
diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 2368d49eb4ef..e6aa7d5e85f1 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -9,7 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/sizes.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #ifdef CONFIG_MMU
 /*
diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 0f477206a4ed..05fcb95107a6 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -13,7 +13,7 @@
 
 #include <linux/types.h>
 #include <asm/mmiowb.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 /*
  * MMIO access functions are separated out to break dependency cycles
diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
index b47045cb85ce..660a9ecfacd8 100644
--- a/arch/riscv/include/asm/kasan.h
+++ b/arch/riscv/include/asm/kasan.h
@@ -8,7 +8,7 @@
 
 #ifdef CONFIG_KASAN
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #define KASAN_SHADOW_SCALE_SHIFT	3
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 780dd1d4f720..950c69539d1a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -493,8 +493,6 @@ void paging_init(void);
 extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
 #define ZERO_PAGE(vaddr) (virt_to_page(empty_zero_page))
 
-#include <asm-generic/pgtable.h>
-
 #endif /* !__ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PGTABLE_H */
diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 8bbe5dbe1341..7191342c54da 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -10,7 +10,7 @@
 #include <linux/moduleloader.h>
 #include <linux/vmalloc.h>
 #include <linux/sizes.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/sections.h>
 
 static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
diff --git a/arch/riscv/kernel/soc.c b/arch/riscv/kernel/soc.c
index 1fc87621c728..c7b0a73e382e 100644
--- a/arch/riscv/kernel/soc.c
+++ b/arch/riscv/kernel/soc.c
@@ -4,7 +4,7 @@
  */
 #include <linux/init.h>
 #include <linux/libfdt.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/soc.h>
 
 /*
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 8930ab7278e6..1594a679eea2 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -3,7 +3,7 @@
  * Copyright (C) 2017 SiFive
  */
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cacheflush.h>
 
 #ifdef CONFIG_SMP
diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index ec0ca90dd900..e3808175b798 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -7,7 +7,7 @@
 #include <linux/kernel.h>
 #include <linux/memblock.h>
 #include <asm/tlbflush.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/fixmap.h>
 
 extern pgd_t early_pg_dir[PTRS_PER_PGD];
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 728759eb530a..51165f73ce7d 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -4,7 +4,7 @@
  */
 
 #include <linux/pagewalk.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/bitops.h>
 
diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index 7eab76a93106..f193133f2603 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -9,7 +9,7 @@
 #include <linux/ptdump.h>
 
 #include <asm/ptdump.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/kasan.h>
 
 #define pt_dump_seq_printf(m, fmt, args...)	\
diff --git a/arch/s390/boot/ipl_parm.c b/arch/s390/boot/ipl_parm.c
index 357adad991d2..b765f2d4172e 100644
--- a/arch/s390/boot/ipl_parm.c
+++ b/arch/s390/boot/ipl_parm.c
@@ -7,7 +7,7 @@
 #include <asm/sections.h>
 #include <asm/boot_data.h>
 #include <asm/facility.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/uv.h>
 #include "boot.h"
 
diff --git a/arch/s390/boot/kaslr.c b/arch/s390/boot/kaslr.c
index 5591243d673e..95376a19c69a 100644
--- a/arch/s390/boot/kaslr.c
+++ b/arch/s390/boot/kaslr.c
@@ -3,7 +3,7 @@
  * Copyright IBM Corp. 2019
  */
 #include <asm/mem_detect.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cpacf.h>
 #include <asm/timex.h>
 #include <asm/sclp.h>
diff --git a/arch/s390/include/asm/hugetlb.h b/arch/s390/include/asm/hugetlb.h
index 9ddf4a43a590..d806d3d28134 100644
--- a/arch/s390/include/asm/hugetlb.h
+++ b/arch/s390/include/asm/hugetlb.h
@@ -10,7 +10,7 @@
 #define _ASM_S390_HUGETLB_H
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #define hugetlb_free_pgd_range			free_pgd_range
 #define hugepages_supported()			(MACHINE_HAS_EDAT1)
diff --git a/arch/s390/include/asm/kasan.h b/arch/s390/include/asm/kasan.h
index 70930fe5c496..d8f8e8d5abe0 100644
--- a/arch/s390/include/asm/kasan.h
+++ b/arch/s390/include/asm/kasan.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_KASAN_H
 #define __ASM_KASAN_H
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #ifdef CONFIG_KASAN
 
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index e2528e057980..22757203828d 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1683,6 +1683,4 @@ extern void s390_reset_cmma(struct mm_struct *mm);
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
 
-#include <asm-generic/pgtable.h>
-
 #endif /* _S390_PAGE_H */
diff --git a/arch/s390/kernel/asm-offsets.c b/arch/s390/kernel/asm-offsets.c
index e80f0e6f5972..f3daf5f8de3f 100644
--- a/arch/s390/kernel/asm-offsets.c
+++ b/arch/s390/kernel/asm-offsets.c
@@ -13,7 +13,7 @@
 #include <linux/purgatory.h>
 #include <asm/idle.h>
 #include <asm/vdso.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/gmap.h>
 #include <asm/nmi.h>
 #include <asm/stacktrace.h>
diff --git a/arch/s390/kvm/gaccess.c b/arch/s390/kvm/gaccess.c
index 47a67a958107..0fefb440fe74 100644
--- a/arch/s390/kvm/gaccess.c
+++ b/arch/s390/kvm/gaccess.c
@@ -10,7 +10,7 @@
 #include <linux/mm_types.h>
 #include <linux/err.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/gmap.h>
 #include "kvm-s390.h"
 #include "gaccess.h"
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 389ff1b7cd43..a8a432bf5566 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -35,7 +35,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/lowcore.h>
 #include <asm/stp.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/gmap.h>
 #include <asm/nmi.h>
 #include <asm/switch_to.h>
diff --git a/arch/s390/kvm/priv.c b/arch/s390/kvm/priv.c
index 893893642415..8ec0ab070a49 100644
--- a/arch/s390/kvm/priv.c
+++ b/arch/s390/kvm/priv.c
@@ -20,7 +20,7 @@
 #include <asm/debug.h>
 #include <asm/ebcdic.h>
 #include <asm/sysinfo.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/page-states.h>
 #include <asm/pgalloc.h>
 #include <asm/gmap.h>
diff --git a/arch/s390/mm/extmem.c b/arch/s390/mm/extmem.c
index fd0dae9d10f4..982c65d22175 100644
--- a/arch/s390/mm/extmem.c
+++ b/arch/s390/mm/extmem.c
@@ -22,7 +22,7 @@
 #include <linux/refcount.h>
 #include <asm/diag.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/ebcdic.h>
 #include <asm/errno.h>
 #include <asm/extmem.h>
diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
index 4b6903fbba4a..11b8fe47134d 100644
--- a/arch/s390/mm/gmap.c
+++ b/arch/s390/mm/gmap.c
@@ -18,7 +18,7 @@
 #include <linux/ksm.h>
 #include <linux/mman.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/gmap.h>
 #include <asm/tlb.h>
diff --git a/arch/s390/mm/kasan_init.c b/arch/s390/mm/kasan_init.c
index 06345616a646..6a5630731377 100644
--- a/arch/s390/mm/kasan_init.c
+++ b/arch/s390/mm/kasan_init.c
@@ -3,7 +3,7 @@
 #include <linux/sched/task.h>
 #include <linux/memblock.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/kasan.h>
 #include <asm/mem_detect.h>
 #include <asm/processor.h>
diff --git a/arch/sh/include/asm/io.h b/arch/sh/include/asm/io.h
index 39c9ead489e5..ef27e7c8446a 100644
--- a/arch/sh/include/asm/io.h
+++ b/arch/sh/include/asm/io.h
@@ -17,7 +17,7 @@
 #include <asm/cache.h>
 #include <asm/addrspace.h>
 #include <asm/machvec.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm-generic/iomap.h>
 
 #ifdef __KERNEL__
diff --git a/arch/sh/include/asm/pgtable.h b/arch/sh/include/asm/pgtable.h
index cbd0f3c55a0c..3df931703697 100644
--- a/arch/sh/include/asm/pgtable.h
+++ b/arch/sh/include/asm/pgtable.h
@@ -185,6 +185,4 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
 
-#include <asm-generic/pgtable.h>
-
 #endif /* __ASM_SH_PGTABLE_H */
diff --git a/arch/sh/mm/pmb.c b/arch/sh/mm/pmb.c
index b59bad86b31e..76bb1b55fab8 100644
--- a/arch/sh/mm/pmb.c
+++ b/arch/sh/mm/pmb.c
@@ -26,7 +26,7 @@
 #include <asm/cacheflush.h>
 #include <linux/sizes.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
diff --git a/arch/sparc/include/asm/floppy_32.h b/arch/sparc/include/asm/floppy_32.h
index b519acf4383d..cf2cf02c8ff1 100644
--- a/arch/sparc/include/asm/floppy_32.h
+++ b/arch/sparc/include/asm/floppy_32.h
@@ -10,7 +10,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/idprom.h>
 #include <asm/oplib.h>
 #include <asm/auxio.h>
diff --git a/arch/sparc/include/asm/highmem.h b/arch/sparc/include/asm/highmem.h
index ddb03c04f1f3..c9211454d500 100644
--- a/arch/sparc/include/asm/highmem.h
+++ b/arch/sparc/include/asm/highmem.h
@@ -24,7 +24,7 @@
 #include <linux/interrupt.h>
 #include <asm/vaddrs.h>
 #include <asm/kmap_types.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/pgtsrmmu.h>
 
 /* declarations for highmem.c */
diff --git a/arch/sparc/include/asm/ide.h b/arch/sparc/include/asm/ide.h
index 09f026585550..499aa2e6e276 100644
--- a/arch/sparc/include/asm/ide.h
+++ b/arch/sparc/include/asm/ide.h
@@ -18,7 +18,7 @@
 #include <asm/cacheflush.h>
 #include <asm/page.h>
 #else
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/psr.h>
 #endif
 
diff --git a/arch/sparc/include/asm/io-unit.h b/arch/sparc/include/asm/io-unit.h
index 3ce96e8c088f..88a976ccac39 100644
--- a/arch/sparc/include/asm/io-unit.h
+++ b/arch/sparc/include/asm/io-unit.h
@@ -8,7 +8,7 @@
 
 #include <linux/spinlock.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 /* The io-unit handles all virtual to physical address translations
  * that occur between the SBUS and physical memory.  Access by
diff --git a/arch/sparc/include/asm/pgalloc_32.h b/arch/sparc/include/asm/pgalloc_32.h
index eae0c92ec422..b0577ca846b7 100644
--- a/arch/sparc/include/asm/pgalloc_32.h
+++ b/arch/sparc/include/asm/pgalloc_32.h
@@ -6,7 +6,7 @@
 #include <linux/sched.h>
 
 #include <asm/pgtsrmmu.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/vaddrs.h>
 #include <asm/page.h>
 
diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
index 0de659ae0ba4..dc8f0f66bbf1 100644
--- a/arch/sparc/include/asm/pgtable_32.h
+++ b/arch/sparc/include/asm/pgtable_32.h
@@ -428,8 +428,6 @@ static inline int io_remap_pfn_range(struct vm_area_struct *vma,
 	__changed;							  \
 })
 
-#include <asm-generic/pgtable.h>
-
 #endif /* !(__ASSEMBLY__) */
 
 #define VMALLOC_START           _AC(0xfe600000,UL)
diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index da527b27cf7d..6754363b261d 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -1122,7 +1122,6 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
 #define pte_access_permitted pte_access_permitted
 
 #include <asm/tlbflush.h>
-#include <asm-generic/pgtable.h>
 
 /* We provide our own get_unmapped_area to cope with VA holes and
  * SHM area cache aliasing for userland.
diff --git a/arch/sparc/kernel/cpu.c b/arch/sparc/kernel/cpu.c
index 4401dee30018..36936b613d36 100644
--- a/arch/sparc/kernel/cpu.c
+++ b/arch/sparc/kernel/cpu.c
@@ -13,7 +13,7 @@
 #include <linux/threads.h>
 
 #include <asm/spitfire.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/oplib.h>
 #include <asm/setup.h>
 #include <asm/page.h>
diff --git a/arch/sparc/kernel/entry.S b/arch/sparc/kernel/entry.S
index 4d3696973325..5a666ca2bdf9 100644
--- a/arch/sparc/kernel/entry.S
+++ b/arch/sparc/kernel/entry.S
@@ -20,7 +20,7 @@
 #include <asm/psr.h>
 #include <asm/vaddrs.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/winmacro.h>
 #include <asm/signal.h>
 #include <asm/obio.h>
diff --git a/arch/sparc/kernel/head_64.S b/arch/sparc/kernel/head_64.S
index 540bfc98472c..d7269822e9dc 100644
--- a/arch/sparc/kernel/head_64.S
+++ b/arch/sparc/kernel/head_64.S
@@ -18,7 +18,7 @@
 #include <asm/ptrace.h>
 #include <asm/spitfire.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/errno.h>
 #include <asm/signal.h>
 #include <asm/processor.h>
diff --git a/arch/sparc/kernel/ktlb.S b/arch/sparc/kernel/ktlb.S
index 1cf91c05e275..0bd0a92337af 100644
--- a/arch/sparc/kernel/ktlb.S
+++ b/arch/sparc/kernel/ktlb.S
@@ -10,7 +10,7 @@
 #include <asm/head.h>
 #include <asm/asi.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/tsb.h>
 
 	.text
diff --git a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c
index 5ed43828e078..1c76e9c02e6b 100644
--- a/arch/sparc/kernel/pci.c
+++ b/arch/sparc/kernel/pci.c
@@ -23,7 +23,7 @@
 #include <linux/of_device.h>
 
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/irq.h>
 #include <asm/prom.h>
 #include <asm/apb.h>
diff --git a/arch/sparc/kernel/sun4m_irq.c b/arch/sparc/kernel/sun4m_irq.c
index c01767a0480e..afdac7ff174a 100644
--- a/arch/sparc/kernel/sun4m_irq.c
+++ b/arch/sparc/kernel/sun4m_irq.c
@@ -16,7 +16,7 @@
 #include <asm/timer.h>
 #include <asm/traps.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/irq.h>
 #include <asm/io.h>
 #include <asm/cacheflush.h>
diff --git a/arch/sparc/kernel/trampoline_64.S b/arch/sparc/kernel/trampoline_64.S
index fe59122d257d..ee2c51034ba4 100644
--- a/arch/sparc/kernel/trampoline_64.S
+++ b/arch/sparc/kernel/trampoline_64.S
@@ -13,7 +13,7 @@
 #include <asm/dcu.h>
 #include <asm/pstate.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/spitfire.h>
 #include <asm/processor.h>
 #include <asm/thread_info.h>
diff --git a/arch/sparc/kernel/traps_32.c b/arch/sparc/kernel/traps_32.c
index 4ceecad556a9..3131b2a6187f 100644
--- a/arch/sparc/kernel/traps_32.c
+++ b/arch/sparc/kernel/traps_32.c
@@ -23,7 +23,7 @@
 #include <asm/ptrace.h>
 #include <asm/oplib.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/unistd.h>
 #include <asm/traps.h>
 
diff --git a/arch/sparc/lib/clear_page.S b/arch/sparc/lib/clear_page.S
index 8a6c783a6301..9f3776b2a48b 100644
--- a/arch/sparc/lib/clear_page.S
+++ b/arch/sparc/lib/clear_page.S
@@ -8,7 +8,7 @@
 #include <asm/visasm.h>
 #include <asm/thread_info.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/spitfire.h>
 #include <asm/head.h>
 #include <asm/export.h>
diff --git a/arch/sparc/lib/copy_page.S b/arch/sparc/lib/copy_page.S
index c088e871e8e3..5ebcfd479f4f 100644
--- a/arch/sparc/lib/copy_page.S
+++ b/arch/sparc/lib/copy_page.S
@@ -8,7 +8,7 @@
 #include <asm/visasm.h>
 #include <asm/thread_info.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/spitfire.h>
 #include <asm/head.h>
 #include <asm/export.h>
diff --git a/arch/sparc/mm/tsb.c b/arch/sparc/mm/tsb.c
index f5edc28aa3a5..e47753186d18 100644
--- a/arch/sparc/mm/tsb.c
+++ b/arch/sparc/mm/tsb.c
@@ -10,7 +10,7 @@
 #include <linux/mm_types.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/mmu_context.h>
 #include <asm/setup.h>
 #include <asm/tsb.h>
diff --git a/arch/sparc/mm/ultra.S b/arch/sparc/mm/ultra.S
index d220b6848746..5fb6888dd0ed 100644
--- a/arch/sparc/mm/ultra.S
+++ b/arch/sparc/mm/ultra.S
@@ -6,7 +6,7 @@
  */
 
 #include <asm/asi.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/spitfire.h>
 #include <asm/mmu_context.h>
diff --git a/arch/um/include/asm/pgtable.h b/arch/um/include/asm/pgtable.h
index b5ddf5d98bd5..9618a0b8088c 100644
--- a/arch/um/include/asm/pgtable.h
+++ b/arch/um/include/asm/pgtable.h
@@ -353,8 +353,6 @@ extern pte_t *virt_to_pte(struct mm_struct *mm, unsigned long addr);
 
 #define kern_addr_valid(addr) (1)
 
-#include <asm-generic/pgtable.h>
-
 /* Clear a kernel PTE and flush it from the TLB */
 #define kpte_clear_flush(ptep, vaddr)		\
 do {						\
diff --git a/arch/unicore32/include/asm/pgtable.h b/arch/unicore32/include/asm/pgtable.h
index 826f49edd94e..9559e936d980 100644
--- a/arch/unicore32/include/asm/pgtable.h
+++ b/arch/unicore32/include/asm/pgtable.h
@@ -279,8 +279,6 @@ extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
 /* FIXME: this is not correct */
 #define kern_addr_valid(addr)	(1)
 
-#include <asm-generic/pgtable.h>
-
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __UNICORE_PGTABLE_H__ */
diff --git a/arch/unicore32/kernel/hibernate.c b/arch/unicore32/kernel/hibernate.c
index ccad051a79b6..3a216fd14b99 100644
--- a/arch/unicore32/kernel/hibernate.c
+++ b/arch/unicore32/kernel/hibernate.c
@@ -13,7 +13,7 @@
 #include <linux/memblock.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/sections.h>
 #include <asm/suspend.h>
diff --git a/arch/unicore32/kernel/hibernate_asm.S b/arch/unicore32/kernel/hibernate_asm.S
index 7e7499c49089..f854a847801b 100644
--- a/arch/unicore32/kernel/hibernate_asm.S
+++ b/arch/unicore32/kernel/hibernate_asm.S
@@ -13,7 +13,7 @@
 #include <linux/linkage.h>
 #include <generated/asm-offsets.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/assembler.h>
 
 @ restore_image(pgd_t *resume_pg_dir, struct pbe *restore_pblist)
diff --git a/arch/unicore32/mm/alignment.c b/arch/unicore32/mm/alignment.c
index a07ae5cc58e5..258ae0efccbb 100644
--- a/arch/unicore32/mm/alignment.c
+++ b/arch/unicore32/mm/alignment.c
@@ -19,7 +19,7 @@
 #include <linux/sched.h>
 #include <linux/uaccess.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/unaligned.h>
 
diff --git a/arch/unicore32/mm/proc-ucv2.S b/arch/unicore32/mm/proc-ucv2.S
index 8cc9a1b16d60..0295dd4bfcaf 100644
--- a/arch/unicore32/mm/proc-ucv2.S
+++ b/arch/unicore32/mm/proc-ucv2.S
@@ -11,7 +11,7 @@
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "proc-macros.S"
 
diff --git a/arch/x86/boot/compressed/kaslr_64.c b/arch/x86/boot/compressed/kaslr_64.c
index 9557c5a15b91..6953c2307257 100644
--- a/arch/x86/boot/compressed/kaslr_64.c
+++ b/arch/x86/boot/compressed/kaslr_64.c
@@ -23,7 +23,7 @@
 
 /* These actually do the work of building the kernel identity maps. */
 #include <asm/init.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 /* Use the static base for this part of the boot process */
 #undef __PAGE_OFFSET
 #define __PAGE_OFFSET __PAGE_OFFSET_BASE
diff --git a/arch/x86/include/asm/agp.h b/arch/x86/include/asm/agp.h
index 8e25bf4f323a..62da760d6d5a 100644
--- a/arch/x86/include/asm/agp.h
+++ b/arch/x86/include/asm/agp.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_X86_AGP_H
 #define _ASM_X86_AGP_H
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cacheflush.h>
 
 /*
diff --git a/arch/x86/include/asm/asm-prototypes.h b/arch/x86/include/asm/asm-prototypes.h
index 9bf2620ce817..cd773cbdf5a4 100644
--- a/arch/x86/include/asm/asm-prototypes.h
+++ b/arch/x86/include/asm/asm-prototypes.h
@@ -7,7 +7,7 @@
 
 #include <asm-generic/asm-prototypes.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/special_insns.h>
 #include <asm/preempt.h>
 #include <asm/asm.h>
diff --git a/arch/x86/include/asm/efi.h b/arch/x86/include/asm/efi.h
index cd0c3fbf6156..8f4c9838c7d3 100644
--- a/arch/x86/include/asm/efi.h
+++ b/arch/x86/include/asm/efi.h
@@ -3,7 +3,7 @@
 #define _ASM_X86_EFI_H
 
 #include <asm/fpu/api.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/processor-flags.h>
 #include <asm/tlb.h>
 #include <asm/nospec-branch.h>
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index f51d8997ed00..d24f8e1f7250 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -801,7 +801,7 @@ static inline int pmd_present(pmd_t pmd)
 #ifdef CONFIG_NUMA_BALANCING
 /*
  * These work without NUMA balancing but the kernel does not care. See the
- * comment in include/asm-generic/pgtable.h
+ * comment in include/linux/pgtable.h
  */
 static inline int pte_protnone(pte_t pte)
 {
@@ -1545,7 +1545,6 @@ static inline bool arch_faults_on_old_pte(void)
 	return false;
 }
 
-#include <asm-generic/pgtable.h>
 #endif	/* __ASSEMBLY__ */
 
 #endif /* _ASM_X86_PGTABLE_H */
diff --git a/arch/x86/include/asm/xen/hypercall.h b/arch/x86/include/asm/xen/hypercall.h
index d50c7b747d8b..9cb3a0cdcc8e 100644
--- a/arch/x86/include/asm/xen/hypercall.h
+++ b/arch/x86/include/asm/xen/hypercall.h
@@ -42,7 +42,7 @@
 #include <trace/events/xen.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/smap.h>
 #include <asm/nospec-branch.h>
 
diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
index 683ed9e12e6b..2f04f4505166 100644
--- a/arch/x86/kernel/acpi/boot.c
+++ b/arch/x86/kernel/acpi/boot.c
@@ -24,7 +24,7 @@
 #include <asm/e820/api.h>
 #include <asm/irqdomain.h>
 #include <asm/pci_x86.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/io_apic.h>
 #include <asm/apic.h>
 #include <asm/io.h>
diff --git a/arch/x86/kernel/acpi/sleep.c b/arch/x86/kernel/acpi/sleep.c
index ed3b04483972..c95a630f266e 100644
--- a/arch/x86/kernel/acpi/sleep.c
+++ b/arch/x86/kernel/acpi/sleep.c
@@ -12,7 +12,7 @@
 #include <linux/cpumask.h>
 #include <asm/segment.h>
 #include <asm/desc.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cacheflush.h>
 #include <asm/realmode.h>
 
diff --git a/arch/x86/kernel/apic/apic_numachip.c b/arch/x86/kernel/apic/apic_numachip.c
index cdf45b4700f2..5a58c85c22c7 100644
--- a/arch/x86/kernel/apic/apic_numachip.c
+++ b/arch/x86/kernel/apic/apic_numachip.c
@@ -16,7 +16,7 @@
 #include <asm/numachip/numachip.h>
 #include <asm/numachip/numachip_csr.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "local.h"
 
diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index ed54b3b21c39..f75a0cca1ab7 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -26,7 +26,7 @@
 #include <asm/vmx.h>
 #include <asm/paravirt.h>
 #include <asm/alternative.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/set_memory.h>
 #include <asm/intel-family.h>
 #include <asm/e820/api.h>
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 74682b8d09b0..efdeaf21aa5f 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -35,7 +35,7 @@
 #include <asm/vsyscall.h>
 #include <linux/topology.h>
 #include <linux/cpumask.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <linux/atomic.h>
 #include <asm/proto.h>
 #include <asm/setup.h>
diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 166d7c355896..1c00a443d6b9 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -11,7 +11,7 @@
 #include <linux/uaccess.h>
 
 #include <asm/cpufeature.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/msr.h>
 #include <asm/bugs.h>
 #include <asm/cpu.h>
diff --git a/arch/x86/kernel/crash_core_32.c b/arch/x86/kernel/crash_core_32.c
index c0159a7bca6d..dfa6ed2156fd 100644
--- a/arch/x86/kernel/crash_core_32.c
+++ b/arch/x86/kernel/crash_core_32.c
@@ -2,7 +2,7 @@
 
 #include <linux/crash_core.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/setup.h>
 
 void arch_crash_save_vmcoreinfo(void)
diff --git a/arch/x86/kernel/crash_core_64.c b/arch/x86/kernel/crash_core_64.c
index 845a57eb4eb7..15ddebde8741 100644
--- a/arch/x86/kernel/crash_core_64.c
+++ b/arch/x86/kernel/crash_core_64.c
@@ -2,7 +2,7 @@
 
 #include <linux/crash_core.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/setup.h>
 
 void arch_crash_save_vmcoreinfo(void)
diff --git a/arch/x86/kernel/early_printk.c b/arch/x86/kernel/early_printk.c
index 93fbdff2974f..dee2ea5223d8 100644
--- a/arch/x86/kernel/early_printk.c
+++ b/arch/x86/kernel/early_printk.c
@@ -15,7 +15,7 @@
 #include <xen/hvc-console.h>
 #include <asm/pci-direct.h>
 #include <asm/fixmap.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <linux/usb/ehci_def.h>
 #include <linux/usb/xhci-dbgp.h>
 #include <asm/pci_x86.h>
diff --git a/arch/x86/kernel/espfix_64.c b/arch/x86/kernel/espfix_64.c
index 12e7d4406c32..4fe7af58cfe1 100644
--- a/arch/x86/kernel/espfix_64.c
+++ b/arch/x86/kernel/espfix_64.c
@@ -29,7 +29,7 @@
 #include <linux/percpu.h>
 #include <linux/gfp.h>
 #include <linux/random.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/setup.h>
 #include <asm/espfix.h>
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 206a4b6144c2..b01373e7db7c 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -26,7 +26,7 @@
 #include <asm/smp.h>
 #include <asm/setup.h>
 #include <asm/desc.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/sections.h>
 #include <asm/kdebug.h>
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 4bbc770af632..a4147d80c9c5 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -14,7 +14,7 @@
 #include <linux/threads.h>
 #include <linux/init.h>
 #include <asm/segment.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/msr.h>
 #include <asm/cache.h>
diff --git a/arch/x86/kernel/i8259.c b/arch/x86/kernel/i8259.c
index 519649ddf100..33d56b7b8a4b 100644
--- a/arch/x86/kernel/i8259.c
+++ b/arch/x86/kernel/i8259.c
@@ -19,7 +19,7 @@
 #include <linux/atomic.h>
 #include <asm/timer.h>
 #include <asm/hw_irq.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/desc.h>
 #include <asm/apic.h>
 #include <asm/i8259.h>
diff --git a/arch/x86/kernel/irqinit.c b/arch/x86/kernel/irqinit.c
index 5aa523c2d573..6375df15e763 100644
--- a/arch/x86/kernel/irqinit.c
+++ b/arch/x86/kernel/irqinit.c
@@ -20,7 +20,7 @@
 #include <linux/atomic.h>
 #include <asm/timer.h>
 #include <asm/hw_irq.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/desc.h>
 #include <asm/apic.h>
 #include <asm/setup.h>
diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
index 4d7022a740ab..e939c606872f 100644
--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -45,7 +45,7 @@
 #include <asm/text-patching.h>
 #include <asm/cacheflush.h>
 #include <asm/desc.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <linux/uaccess.h>
 #include <asm/alternative.h>
 #include <asm/insn.h>
diff --git a/arch/x86/kernel/kprobes/opt.c b/arch/x86/kernel/kprobes/opt.c
index ea13f6888284..184402c0a3b1 100644
--- a/arch/x86/kernel/kprobes/opt.c
+++ b/arch/x86/kernel/kprobes/opt.c
@@ -20,7 +20,7 @@
 #include <asm/text-patching.h>
 #include <asm/cacheflush.h>
 #include <asm/desc.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <linux/uaccess.h>
 #include <asm/alternative.h>
 #include <asm/insn.h>
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 5638e4ae2ea6..90a94876c50f 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -19,7 +19,7 @@
 #include <asm/debugreg.h>
 #include <asm/desc.h>
 #include <asm/setup.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/time.h>
 #include <asm/pgalloc.h>
 #include <asm/irq.h>
diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index 3ca43be4f9cf..8bfeb4213b4a 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -17,7 +17,7 @@
 #include <asm/io_apic.h>
 #include <asm/desc.h>
 #include <asm/hpet.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/proto.h>
 #include <asm/reboot_fixups.h>
 #include <asm/reboot.h>
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 2467f3dd35d3..48caa588fd53 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -63,7 +63,7 @@
 #include <asm/realmode.h>
 #include <asm/cpu.h>
 #include <asm/numa.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/mtrr.h>
 #include <asm/mwait.h>
diff --git a/arch/x86/mm/cpu_entry_area.c b/arch/x86/mm/cpu_entry_area.c
index 5199d8a1daf1..bb7d114b5efb 100644
--- a/arch/x86/mm/cpu_entry_area.c
+++ b/arch/x86/mm/cpu_entry_area.c
@@ -6,7 +6,7 @@
 #include <linux/kcore.h>
 
 #include <asm/cpu_entry_area.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/fixmap.h>
 #include <asm/desc.h>
 
diff --git a/arch/x86/mm/debug_pagetables.c b/arch/x86/mm/debug_pagetables.c
index 4a3b62f780b4..092ea436c7e6 100644
--- a/arch/x86/mm/debug_pagetables.c
+++ b/arch/x86/mm/debug_pagetables.c
@@ -3,7 +3,7 @@
 #include <linux/efi.h>
 #include <linux/module.h>
 #include <linux/seq_file.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 static int ptdump_show(struct seq_file *m, void *v)
 {
diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index 986d57534fd6..0dbd37371107 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -21,7 +21,7 @@
 #include <asm/e820/api.h>
 #include <asm/efi.h>
 #include <asm/fixmap.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/pgalloc.h>
 #include <asm/memtype.h>
diff --git a/arch/x86/mm/kaslr.c b/arch/x86/mm/kaslr.c
index dc6182eecefa..b5968acddea8 100644
--- a/arch/x86/mm/kaslr.c
+++ b/arch/x86/mm/kaslr.c
@@ -26,7 +26,7 @@
 #include <linux/memblock.h>
 
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/setup.h>
 #include <asm/kaslr.h>
 
diff --git a/arch/x86/mm/mem_encrypt_boot.S b/arch/x86/mm/mem_encrypt_boot.S
index 106ead05bbe3..7a84fc8bc5c3 100644
--- a/arch/x86/mm/mem_encrypt_boot.S
+++ b/arch/x86/mm/mem_encrypt_boot.S
@@ -8,7 +8,7 @@
  */
 
 #include <linux/linkage.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/processor-flags.h>
 #include <asm/msr-index.h>
diff --git a/arch/x86/mm/mmio-mod.c b/arch/x86/mm/mmio-mod.c
index 109325d77b3e..a57501bc8044 100644
--- a/arch/x86/mm/mmio-mod.c
+++ b/arch/x86/mm/mmio-mod.c
@@ -17,7 +17,7 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <linux/mmiotrace.h>
 #include <asm/e820/api.h> /* for ISA_START_ADDRESS */
 #include <linux/atomic.h>
diff --git a/arch/x86/mm/pat/memtype_interval.c b/arch/x86/mm/pat/memtype_interval.c
index a07e4882bf36..81b6c2d4ece4 100644
--- a/arch/x86/mm/pat/memtype_interval.c
+++ b/arch/x86/mm/pat/memtype_interval.c
@@ -15,7 +15,7 @@
 #include <linux/sched.h>
 #include <linux/gfp.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/memtype.h>
 
 #include "memtype.h"
diff --git a/arch/x86/mm/setup_nx.c b/arch/x86/mm/setup_nx.c
index adb3c5784dac..e5e92b36e530 100644
--- a/arch/x86/mm/setup_nx.c
+++ b/arch/x86/mm/setup_nx.c
@@ -3,7 +3,7 @@
 #include <linux/errno.h>
 #include <linux/init.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/proto.h>
 #include <asm/cpufeature.h>
 
diff --git a/arch/x86/platform/efi/efi_32.c b/arch/x86/platform/efi/efi_32.c
index c049c432745d..818dda62a6bb 100644
--- a/arch/x86/platform/efi/efi_32.c
+++ b/arch/x86/platform/efi/efi_32.c
@@ -28,7 +28,7 @@
 #include <asm/io.h>
 #include <asm/desc.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/efi.h>
 
diff --git a/arch/x86/platform/olpc/olpc_ofw.c b/arch/x86/platform/olpc/olpc_ofw.c
index 20a064568463..77cf281ab8c5 100644
--- a/arch/x86/platform/olpc/olpc_ofw.c
+++ b/arch/x86/platform/olpc/olpc_ofw.c
@@ -8,7 +8,7 @@
 #include <asm/io.h>
 #include <asm/cpufeature.h>
 #include <asm/special_insns.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/olpc_ofw.h>
 
 /* address of OFW callback interface; will be NULL if OFW isn't found */
diff --git a/arch/x86/power/cpu.c b/arch/x86/power/cpu.c
index fc3b757afb2c..9559080695bf 100644
--- a/arch/x86/power/cpu.c
+++ b/arch/x86/power/cpu.c
@@ -14,7 +14,7 @@
 #include <linux/tboot.h>
 #include <linux/dmi.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/proto.h>
 #include <asm/mtrr.h>
 #include <asm/page.h>
diff --git a/arch/x86/power/hibernate.c b/arch/x86/power/hibernate.c
index fc413717a45f..c578c07a99e4 100644
--- a/arch/x86/power/hibernate.c
+++ b/arch/x86/power/hibernate.c
@@ -19,7 +19,7 @@
 #include <asm/init.h>
 #include <asm/proto.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/mtrr.h>
 #include <asm/sections.h>
 #include <asm/suspend.h>
diff --git a/arch/x86/power/hibernate_32.c b/arch/x86/power/hibernate_32.c
index a1061d471b73..2e17f388363e 100644
--- a/arch/x86/power/hibernate_32.c
+++ b/arch/x86/power/hibernate_32.c
@@ -10,7 +10,7 @@
 #include <linux/memblock.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/mmzone.h>
 #include <asm/sections.h>
 #include <asm/suspend.h>
diff --git a/arch/x86/power/hibernate_64.c b/arch/x86/power/hibernate_64.c
index 0197095d9637..b0469e9442f8 100644
--- a/arch/x86/power/hibernate_64.c
+++ b/arch/x86/power/hibernate_64.c
@@ -19,7 +19,7 @@
 #include <asm/init.h>
 #include <asm/proto.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/mtrr.h>
 #include <asm/sections.h>
 #include <asm/suspend.h>
diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
index 262f83cad355..cb3caf4aac1a 100644
--- a/arch/x86/realmode/init.c
+++ b/arch/x86/realmode/init.c
@@ -5,7 +5,7 @@
 #include <linux/mem_encrypt.h>
 
 #include <asm/set_memory.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/realmode.h>
 #include <asm/tlbflush.h>
 #include <asm/crash.h>
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index bbba8b17829a..b0aa0941eb98 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -57,7 +57,7 @@
 
 #include <trace/events/xen.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/fixmap.h>
 #include <asm/mmu_context.h>
diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index f2adb63b2d7c..ffda51eb2c21 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -26,7 +26,7 @@
 
 #include <asm/paravirt.h>
 #include <asm/desc.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cpu.h>
 
 #include <xen/interface/xen.h>
diff --git a/arch/xtensa/include/asm/fixmap.h b/arch/xtensa/include/asm/fixmap.h
index cfb8696917e9..1ff8a863b741 100644
--- a/arch/xtensa/include/asm/fixmap.h
+++ b/arch/xtensa/include/asm/fixmap.h
@@ -13,7 +13,7 @@
 #ifndef _ASM_FIXMAP_H
 #define _ASM_FIXMAP_H
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #ifdef CONFIG_HIGHMEM
 #include <linux/threads.h>
 #include <asm/kmap_types.h>
diff --git a/arch/xtensa/include/asm/highmem.h b/arch/xtensa/include/asm/highmem.h
index d6a10704307a..361bc2871701 100644
--- a/arch/xtensa/include/asm/highmem.h
+++ b/arch/xtensa/include/asm/highmem.h
@@ -16,7 +16,7 @@
 #include <asm/cacheflush.h>
 #include <asm/fixmap.h>
 #include <asm/kmap_types.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #define PKMAP_BASE		((FIXADDR_START - \
 				  (LAST_PKMAP + 1) * PAGE_SIZE) & PMD_MASK)
diff --git a/arch/xtensa/include/asm/initialize_mmu.h b/arch/xtensa/include/asm/initialize_mmu.h
index e3e1d9a1ef69..9ee0c1d004f9 100644
--- a/arch/xtensa/include/asm/initialize_mmu.h
+++ b/arch/xtensa/include/asm/initialize_mmu.h
@@ -24,7 +24,7 @@
 #define _XTENSA_INITIALIZE_MMU_H
 
 #include <linux/init.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/vectors.h>
 
 #if XCHAL_HAVE_PTP_MMU
diff --git a/arch/xtensa/include/asm/mmu_context.h b/arch/xtensa/include/asm/mmu_context.h
index de5e6cbbafe4..023ed57211ce 100644
--- a/arch/xtensa/include/asm/mmu_context.h
+++ b/arch/xtensa/include/asm/mmu_context.h
@@ -21,7 +21,7 @@
 
 #include <asm/vectors.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cacheflush.h>
 #include <asm/tlbflush.h>
 #include <asm-generic/mm_hooks.h>
diff --git a/arch/xtensa/include/asm/pgtable.h b/arch/xtensa/include/asm/pgtable.h
index 8be0c0568c50..c57bca3fe051 100644
--- a/arch/xtensa/include/asm/pgtable.h
+++ b/arch/xtensa/include/asm/pgtable.h
@@ -438,6 +438,4 @@ typedef pte_t *pte_addr_t;
  */
 #define HAVE_ARCH_UNMAPPED_AREA
 
-#include <asm-generic/pgtable.h>
-
 #endif /* _XTENSA_PGTABLE_H */
diff --git a/arch/xtensa/kernel/entry.S b/arch/xtensa/kernel/entry.S
index 06fbb0a171f1..278c1730a2bb 100644
--- a/arch/xtensa/kernel/entry.S
+++ b/arch/xtensa/kernel/entry.S
@@ -22,7 +22,7 @@
 #include <asm/unistd.h>
 #include <asm/ptrace.h>
 #include <asm/current.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <asm/signal.h>
 #include <asm/tlbflush.h>
diff --git a/arch/xtensa/kernel/traps.c b/arch/xtensa/kernel/traps.c
index e880460741d2..e0668ba84d6b 100644
--- a/arch/xtensa/kernel/traps.c
+++ b/arch/xtensa/kernel/traps.c
@@ -39,7 +39,7 @@
 #include <asm/ptrace.h>
 #include <asm/timex.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/processor.h>
 #include <asm/traps.h>
 #include <asm/hw_breakpoint.h>
diff --git a/arch/xtensa/kernel/vectors.S b/arch/xtensa/kernel/vectors.S
index 95ad1e773991..d0b2f1a34f14 100644
--- a/arch/xtensa/kernel/vectors.S
+++ b/arch/xtensa/kernel/vectors.S
@@ -47,7 +47,7 @@
 #include <asm/ptrace.h>
 #include <asm/current.h>
 #include <asm/asm-offsets.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/thread_info.h>
diff --git a/arch/xtensa/mm/cache.c b/arch/xtensa/mm/cache.c
index b27359e2a464..200cafeed460 100644
--- a/arch/xtensa/mm/cache.c
+++ b/arch/xtensa/mm/cache.c
@@ -31,7 +31,7 @@
 #include <asm/tlbflush.h>
 #include <asm/page.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 /* 
  * Note:
diff --git a/arch/xtensa/mm/ioremap.c b/arch/xtensa/mm/ioremap.c
index 9ea3f21d60c7..bfefe16da26d 100644
--- a/arch/xtensa/mm/ioremap.c
+++ b/arch/xtensa/mm/ioremap.c
@@ -9,7 +9,7 @@
 #include <linux/vmalloc.h>
 #include <asm/cacheflush.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 static void __iomem *xtensa_ioremap(unsigned long paddr, unsigned long size,
 				    pgprot_t prot)
diff --git a/arch/xtensa/mm/misc.S b/arch/xtensa/mm/misc.S
index 6aa036c427c3..d2d2cee1e6f8 100644
--- a/arch/xtensa/mm/misc.S
+++ b/arch/xtensa/mm/misc.S
@@ -15,7 +15,7 @@
 
 #include <linux/linkage.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/asmmacro.h>
 #include <asm/cacheasm.h>
 #include <asm/tlbflush.h>
diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 5287ab98b8c1..8df00430e80a 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -16,7 +16,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/platform_data/x86/apple.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "internal.h"
 
diff --git a/drivers/atm/fore200e.c b/drivers/atm/fore200e.c
index 8fbd36eb8941..ab3980fae042 100644
--- a/drivers/atm/fore200e.c
+++ b/drivers/atm/fore200e.c
@@ -40,7 +40,7 @@
 #include <asm/idprom.h>
 #include <asm/openprom.h>
 #include <asm/oplib.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #endif
 
 #if defined(CONFIG_ATM_FORE200E_USE_TASKLET) /* defer interrupt work to a tasklet */
diff --git a/drivers/block/z2ram.c b/drivers/block/z2ram.c
index 600430685e28..6413de7fa53b 100644
--- a/drivers/block/z2ram.c
+++ b/drivers/block/z2ram.c
@@ -38,7 +38,7 @@
 
 #include <asm/setup.h>
 #include <asm/amigahw.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include <linux/zorro.h>
 
diff --git a/drivers/firmware/efi/arm-runtime.c b/drivers/firmware/efi/arm-runtime.c
index b876373f2297..9f0de2b2ca5d 100644
--- a/drivers/firmware/efi/arm-runtime.c
+++ b/drivers/firmware/efi/arm-runtime.c
@@ -23,7 +23,7 @@
 #include <asm/efi.h>
 #include <asm/mmu.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #if defined(CONFIG_PTDUMP_DEBUGFS) && defined(CONFIG_ARM64)
 #include <asm/ptdump.h>
diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
index 56197ae0b2f9..5a696012b62b 100644
--- a/drivers/gpu/drm/drm_vm.c
+++ b/drivers/gpu/drm/drm_vm.c
@@ -44,7 +44,7 @@
 #endif
 #include <linux/mem_encrypt.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include <drm/drm_agpsupport.h>
 #include <drm/drm_device.h>
diff --git a/drivers/infiniband/hw/qib/qib_file_ops.c b/drivers/infiniband/hw/qib/qib_file_ops.c
index b0144229cf3b..84d8b7dbcdd6 100644
--- a/drivers/infiniband/hw/qib/qib_file_ops.c
+++ b/drivers/infiniband/hw/qib/qib_file_ops.c
@@ -40,7 +40,7 @@
 #include <linux/highmem.h>
 #include <linux/io.h>
 #include <linux/jiffies.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <linux/delay.h>
 #include <linux/export.h>
 #include <linux/uio.h>
diff --git a/drivers/macintosh/macio-adb.c b/drivers/macintosh/macio-adb.c
index eb3adfb7f88d..69fdcf1d07bf 100644
--- a/drivers/macintosh/macio-adb.c
+++ b/drivers/macintosh/macio-adb.c
@@ -12,7 +12,7 @@
 #include <asm/prom.h>
 #include <linux/adb.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/hydra.h>
 #include <asm/irq.h>
 #include <linux/init.h>
diff --git a/drivers/macintosh/mediabay.c b/drivers/macintosh/mediabay.c
index 74bf2938276b..de0709d137fd 100644
--- a/drivers/macintosh/mediabay.c
+++ b/drivers/macintosh/mediabay.c
@@ -17,7 +17,7 @@
 #include <linux/kthread.h>
 #include <linux/mutex.h>
 #include <asm/prom.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/io.h>
 #include <asm/machdep.h>
 #include <asm/pmac_feature.h>
diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
index 83eb05bf85ff..9be463afea47 100644
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -52,7 +52,7 @@
 #include <linux/uaccess.h>
 #include <asm/machdep.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/sections.h>
 #include <asm/irq.h>
 #ifdef CONFIG_PPC_PMAC
diff --git a/drivers/media/pci/bt8xx/bt878.c b/drivers/media/pci/bt8xx/bt878.c
index 53af26ad1dfb..d0a988775e3f 100644
--- a/drivers/media/pci/bt8xx/bt878.c
+++ b/drivers/media/pci/bt8xx/bt878.c
@@ -15,7 +15,7 @@
 #include <linux/pci.h>
 #include <asm/io.h>
 #include <linux/ioport.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/page.h>
 #include <linux/types.h>
 #include <linux/interrupt.h>
diff --git a/drivers/media/pci/bt8xx/btcx-risc.c b/drivers/media/pci/bt8xx/btcx-risc.c
index 1139a5ad2418..d01e8163bedf 100644
--- a/drivers/media/pci/bt8xx/btcx-risc.c
+++ b/drivers/media/pci/bt8xx/btcx-risc.c
@@ -18,7 +18,7 @@
 #include <linux/interrupt.h>
 #include <linux/videodev2.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "btcx-risc.h"
 
diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt8xx/bttv-risc.c
index fc8708047be8..4df0af840e68 100644
--- a/drivers/media/pci/bt8xx/bttv-risc.c
+++ b/drivers/media/pci/bt8xx/bttv-risc.c
@@ -21,7 +21,7 @@
 #include <linux/vmalloc.h>
 #include <linux/interrupt.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <media/v4l2-ioctl.h>
 
 #include "bttvp.h"
diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2-core/videobuf-dma-sg.c
index 13b65ed9e74c..5cd907748803 100644
--- a/drivers/media/v4l2-core/videobuf-dma-sg.c
+++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
@@ -27,7 +27,7 @@
 #include <linux/pagemap.h>
 #include <linux/scatterlist.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include <media/videobuf-dma-sg.h>
 
diff --git a/drivers/media/v4l2-core/videobuf-vmalloc.c b/drivers/media/v4l2-core/videobuf-vmalloc.c
index f8bd5a369560..f1c513906fd8 100644
--- a/drivers/media/v4l2-core/videobuf-vmalloc.c
+++ b/drivers/media/v4l2-core/videobuf-vmalloc.c
@@ -20,7 +20,7 @@
 #include <linux/vmalloc.h>
 #include <linux/pagemap.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include <media/videobuf-vmalloc.h>
 
diff --git a/drivers/misc/genwqe/card_utils.c b/drivers/misc/genwqe/card_utils.c
index 2e1c4d2905e8..2947ad1ed32f 100644
--- a/drivers/misc/genwqe/card_utils.c
+++ b/drivers/misc/genwqe/card_utils.c
@@ -27,7 +27,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "genwqe_driver.h"
 #include "card_base.h"
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 73c67e5c08f8..da0bee13fe7f 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -26,7 +26,7 @@
 #include <linux/notifier.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/ubi.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "ubi-media.h"
 
diff --git a/drivers/net/ethernet/amd/7990.c b/drivers/net/ethernet/amd/7990.c
index 50fb66369415..4b96960d0c1a 100644
--- a/drivers/net/ethernet/amd/7990.c
+++ b/drivers/net/ethernet/amd/7990.c
@@ -35,7 +35,7 @@
 
 #include <asm/io.h>
 #include <asm/dma.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #ifdef CONFIG_HP300
 #include <asm/blinken.h>
 #endif
diff --git a/drivers/net/ethernet/amd/hplance.c b/drivers/net/ethernet/amd/hplance.c
index 1381a474063f..90e82742297e 100644
--- a/drivers/net/ethernet/amd/hplance.c
+++ b/drivers/net/ethernet/amd/hplance.c
@@ -24,7 +24,7 @@
 #include <linux/skbuff.h>
 
 #include <asm/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "hplance.h"
 
diff --git a/drivers/net/ethernet/amd/mvme147.c b/drivers/net/ethernet/amd/mvme147.c
index 72abd3f82249..491e317a93a5 100644
--- a/drivers/net/ethernet/amd/mvme147.c
+++ b/drivers/net/ethernet/amd/mvme147.c
@@ -24,7 +24,7 @@
 #include <linux/skbuff.h>
 
 #include <asm/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/mvme147hw.h>
 
 /* We have 32K of RAM for the init block and buffers. This places
diff --git a/drivers/net/ethernet/amd/sun3lance.c b/drivers/net/ethernet/amd/sun3lance.c
index da7e3d4f4166..804246a99e87 100644
--- a/drivers/net/ethernet/amd/sun3lance.c
+++ b/drivers/net/ethernet/amd/sun3lance.c
@@ -42,7 +42,7 @@ static const char version[] =
 #include <asm/setup.h>
 #include <asm/irq.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/dvma.h>
 #include <asm/idprom.h>
 #include <asm/machines.h>
diff --git a/drivers/net/ethernet/amd/sunlance.c b/drivers/net/ethernet/amd/sunlance.c
index a21b2e60157e..fef236f57670 100644
--- a/drivers/net/ethernet/amd/sunlance.c
+++ b/drivers/net/ethernet/amd/sunlance.c
@@ -97,7 +97,7 @@ static char lancestr[] = "LANCE";
 
 #include <asm/io.h>
 #include <asm/dma.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/byteorder.h>	/* Used by the checksum routines */
 #include <asm/idprom.h>
 #include <asm/prom.h>
diff --git a/drivers/net/ethernet/apple/bmac.c b/drivers/net/ethernet/apple/bmac.c
index a58185b1d8bf..8ebf37cd2249 100644
--- a/drivers/net/ethernet/apple/bmac.c
+++ b/drivers/net/ethernet/apple/bmac.c
@@ -28,7 +28,7 @@
 #include <asm/dbdma.h>
 #include <asm/io.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/machdep.h>
 #include <asm/pmac_feature.h>
 #include <asm/macio.h>
diff --git a/drivers/net/ethernet/apple/mace.c b/drivers/net/ethernet/apple/mace.c
index b8ba2abf5b3a..6580976fef5c 100644
--- a/drivers/net/ethernet/apple/mace.c
+++ b/drivers/net/ethernet/apple/mace.c
@@ -22,7 +22,7 @@
 #include <asm/prom.h>
 #include <asm/dbdma.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/macio.h>
 
 #include "mace.h"
diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index ce85feaac357..07b85c2dfb3e 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -42,7 +42,7 @@
 #include <linux/of_net.h>
 
 #include <linux/vmalloc.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/irq.h>
 #include <linux/uaccess.h>
 
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
index 6e64989f8478..cd24fda1175a 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
@@ -40,7 +40,7 @@
 #include <asm/mpc8260.h>
 #include <asm/cpm2.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/irq.h>
 #include <linux/uaccess.h>
 
diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
index 1582d82483ec..0839b052d2b1 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
@@ -33,7 +33,7 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/irq.h>
 #include <linux/uaccess.h>
 #include <asm/mpc5xxx.h>
diff --git a/drivers/net/ethernet/i825xx/82596.c b/drivers/net/ethernet/i825xx/82596.c
index bef676d93339..667773007031 100644
--- a/drivers/net/ethernet/i825xx/82596.c
+++ b/drivers/net/ethernet/i825xx/82596.c
@@ -56,7 +56,7 @@
 
 #include <asm/io.h>
 #include <asm/dma.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cacheflush.h>
 
 static char version[] __initdata =
diff --git a/drivers/net/ethernet/korina.c b/drivers/net/ethernet/korina.c
index f1d84921e42b..2fa91ceaeb9a 100644
--- a/drivers/net/ethernet/korina.c
+++ b/drivers/net/ethernet/korina.c
@@ -56,7 +56,7 @@
 
 #include <asm/bootinfo.h>
 #include <asm/bitops.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/io.h>
 #include <asm/dma.h>
 
diff --git a/drivers/net/ethernet/marvell/pxa168_eth.c b/drivers/net/ethernet/marvell/pxa168_eth.c
index 7a0d785b826c..d18a9fcbd15c 100644
--- a/drivers/net/ethernet/marvell/pxa168_eth.c
+++ b/drivers/net/ethernet/marvell/pxa168_eth.c
@@ -32,7 +32,7 @@
 #include <linux/udp.h>
 #include <linux/workqueue.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cacheflush.h>
 
 #define DRIVER_NAME	"pxa168-eth"
diff --git a/drivers/net/ethernet/natsemi/jazzsonic.c b/drivers/net/ethernet/natsemi/jazzsonic.c
index 8b018ed37b1b..039b8c08a6bb 100644
--- a/drivers/net/ethernet/natsemi/jazzsonic.c
+++ b/drivers/net/ethernet/natsemi/jazzsonic.c
@@ -38,7 +38,7 @@
 #include <linux/slab.h>
 
 #include <asm/bootinfo.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/io.h>
 #include <asm/dma.h>
 #include <asm/jazz.h>
diff --git a/drivers/net/ethernet/natsemi/macsonic.c b/drivers/net/ethernet/natsemi/macsonic.c
index 1b5559aacb38..9f0b8d166274 100644
--- a/drivers/net/ethernet/natsemi/macsonic.c
+++ b/drivers/net/ethernet/natsemi/macsonic.c
@@ -52,7 +52,7 @@
 #include <linux/bitrev.h>
 #include <linux/slab.h>
 
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/io.h>
 #include <asm/hwtest.h>
 #include <asm/dma.h>
diff --git a/drivers/net/ethernet/natsemi/xtsonic.c b/drivers/net/ethernet/natsemi/xtsonic.c
index dda9ec7d9cee..74e62cbb87b3 100644
--- a/drivers/net/ethernet/natsemi/xtsonic.c
+++ b/drivers/net/ethernet/natsemi/xtsonic.c
@@ -37,7 +37,7 @@
 #include <linux/slab.h>
 
 #include <asm/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/dma.h>
 
 static char xtsonic_string[] = "xtsonic";
diff --git a/drivers/net/ethernet/sun/sunbmac.c b/drivers/net/ethernet/sun/sunbmac.c
index c5add0b45eed..b17105f0a29a 100644
--- a/drivers/net/ethernet/sun/sunbmac.c
+++ b/drivers/net/ethernet/sun/sunbmac.c
@@ -34,7 +34,7 @@
 #include <asm/io.h>
 #include <asm/openprom.h>
 #include <asm/oplib.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "sunbmac.h"
 
diff --git a/drivers/net/ethernet/sun/sunqe.c b/drivers/net/ethernet/sun/sunqe.c
index 2102b95ec347..361694621ca0 100644
--- a/drivers/net/ethernet/sun/sunqe.c
+++ b/drivers/net/ethernet/sun/sunqe.c
@@ -36,7 +36,7 @@
 #include <asm/openprom.h>
 #include <asm/oplib.h>
 #include <asm/auxio.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/irq.h>
 
 #include "sunqe.h"
diff --git a/drivers/scsi/53c700.c b/drivers/scsi/53c700.c
index 0068963bb933..7b814e7b4ba3 100644
--- a/drivers/scsi/53c700.c
+++ b/drivers/scsi/53c700.c
@@ -118,7 +118,7 @@
 #include <linux/device.h>
 #include <asm/dma.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/byteorder.h>
 
 #include <scsi/scsi.h>
diff --git a/drivers/scsi/arm/cumana_2.c b/drivers/scsi/arm/cumana_2.c
index a1f3e9ee4e63..eb4ecdf4e00a 100644
--- a/drivers/scsi/arm/cumana_2.c
+++ b/drivers/scsi/arm/cumana_2.c
@@ -27,7 +27,7 @@
 #include <asm/dma.h>
 #include <asm/ecard.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "../scsi.h"
 #include <scsi/scsi_host.h>
diff --git a/drivers/scsi/arm/eesox.c b/drivers/scsi/arm/eesox.c
index 134f040d58e2..a8772d4bcfe5 100644
--- a/drivers/scsi/arm/eesox.c
+++ b/drivers/scsi/arm/eesox.c
@@ -33,7 +33,7 @@
 #include <asm/io.h>
 #include <asm/dma.h>
 #include <asm/ecard.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "../scsi.h"
 #include <scsi/scsi_host.h>
diff --git a/drivers/scsi/arm/powertec.c b/drivers/scsi/arm/powertec.c
index c795537a671c..01aead2879df 100644
--- a/drivers/scsi/arm/powertec.c
+++ b/drivers/scsi/arm/powertec.c
@@ -18,7 +18,7 @@
 #include <asm/dma.h>
 #include <asm/ecard.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "../scsi.h"
 #include <scsi/scsi_host.h>
diff --git a/drivers/scsi/dpt_i2o.c b/drivers/scsi/dpt_i2o.c
index 2cf889512ece..049cda29e5ec 100644
--- a/drivers/scsi/dpt_i2o.c
+++ b/drivers/scsi/dpt_i2o.c
@@ -55,7 +55,7 @@ MODULE_DESCRIPTION("Adaptec I2O RAID Driver");
 #include <linux/mutex.h>
 
 #include <asm/processor.h>	/* for boot_cpu_data */
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/io.h>		/* for virt_to_bus, etc. */
 
 #include <scsi/scsi.h>
diff --git a/drivers/scsi/mac53c94.c b/drivers/scsi/mac53c94.c
index 35d3e322d6d5..d0d7928db6e8 100644
--- a/drivers/scsi/mac53c94.c
+++ b/drivers/scsi/mac53c94.c
@@ -22,7 +22,7 @@
 #include <linux/pci.h>
 #include <asm/dbdma.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/prom.h>
 #include <asm/macio.h>
 
diff --git a/drivers/scsi/mesh.c b/drivers/scsi/mesh.c
index 74fb50644678..d32f4415e503 100644
--- a/drivers/scsi/mesh.c
+++ b/drivers/scsi/mesh.c
@@ -33,7 +33,7 @@
 #include <linux/pci.h>
 #include <asm/dbdma.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/prom.h>
 #include <asm/irq.h>
 #include <asm/hydra.h>
diff --git a/drivers/scsi/qlogicpti.c b/drivers/scsi/qlogicpti.c
index d539beef3ce8..61949d91c25b 100644
--- a/drivers/scsi/qlogicpti.c
+++ b/drivers/scsi/qlogicpti.c
@@ -37,7 +37,7 @@
 
 #include <asm/dma.h>
 #include <asm/ptrace.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/oplib.h>
 #include <asm/io.h>
 #include <asm/irq.h>
diff --git a/drivers/scsi/zorro_esp.c b/drivers/scsi/zorro_esp.c
index c6727bcbc2e3..bfd50247b7eb 100644
--- a/drivers/scsi/zorro_esp.c
+++ b/drivers/scsi/zorro_esp.c
@@ -36,7 +36,7 @@
 #include <linux/slab.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cacheflush.h>
 #include <asm/amigahw.h>
 #include <asm/amigaints.h>
diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
index d39ac997dda8..7ef15078a717 100644
--- a/include/asm-generic/io.h
+++ b/include/asm-generic/io.h
@@ -948,7 +948,7 @@ static inline void iounmap(void __iomem *addr)
 }
 #endif
 #elif defined(CONFIG_GENERIC_IOREMAP)
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 void __iomem *ioremap_prot(phys_addr_t addr, size_t size, unsigned long prot);
 void iounmap(volatile void __iomem *addr);
diff --git a/include/linux/crash_dump.h b/include/linux/crash_dump.h
index bc156285d097..be79a45d7aa3 100644
--- a/include/linux/crash_dump.h
+++ b/include/linux/crash_dump.h
@@ -7,7 +7,7 @@
 #include <linux/elf.h>
 #include <uapi/linux/vmcore.h>
 
-#include <asm/pgtable.h> /* for pgprot_t */
+#include <linux/pgtable.h> /* for pgprot_t */
 
 #ifdef CONFIG_CRASH_DUMP
 #define ELFCORE_ADDR_MAX	(-1ULL)
diff --git a/include/linux/dma-noncoherent.h b/include/linux/dma-noncoherent.h
index b59f1b6be3e9..ca09a4e07d2d 100644
--- a/include/linux/dma-noncoherent.h
+++ b/include/linux/dma-noncoherent.h
@@ -3,7 +3,7 @@
 #define _LINUX_DMA_NONCOHERENT_H 1
 
 #include <linux/dma-mapping.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #ifdef CONFIG_ARCH_HAS_DMA_COHERENCE_H
 #include <asm/dma-coherence.h>
diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index e912b9dc4633..f4a09ed223ac 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -10,7 +10,7 @@
 #define LINUX_HMM_H
 
 #include <linux/kconfig.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include <linux/device.h>
 #include <linux/migrate.h>
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 0cced410e0bd..50650d0d01b9 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -9,7 +9,7 @@
 #include <linux/cgroup.h>
 #include <linux/list.h>
 #include <linux/kref.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 struct ctl_table;
 struct user_struct;
diff --git a/include/linux/io-mapping.h b/include/linux/io-mapping.h
index b336622612f3..94e24e58966d 100644
--- a/include/linux/io-mapping.h
+++ b/include/linux/io-mapping.h
@@ -99,7 +99,7 @@ io_mapping_unmap(void __iomem *vaddr)
 #else
 
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 /* Create the io_mapping object*/
 static inline struct io_mapping *
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 31314ca7c635..17d8915eaebb 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -12,7 +12,7 @@ struct task_struct;
 #ifdef CONFIG_KASAN
 
 #include <asm/kasan.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
 extern pte_t kasan_early_shadow_pte[PTRS_PER_PTE];
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 31ec312e8903..474a1ef3c379 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -92,7 +92,7 @@ extern int mmap_rnd_compat_bits __read_mostly;
 #endif
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/processor.h>
 
 /*
diff --git a/include/asm-generic/pgtable.h b/include/linux/pgtable.h
similarity index 99%
rename from include/asm-generic/pgtable.h
rename to include/linux/pgtable.h
index 34480ca98c84..2f71e586aa87 100644
--- a/include/asm-generic/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1,8 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_GENERIC_PGTABLE_H
-#define _ASM_GENERIC_PGTABLE_H
+#ifndef _LINUX_PGTABLE_H
+#define _LINUX_PGTABLE_H
 
 #include <linux/pfn.h>
+#include <asm/pgtable.h>
 
 #ifndef __ASSEMBLY__
 #ifdef CONFIG_MMU
diff --git a/include/xen/arm/page.h b/include/xen/arm/page.h
index f77dcbcba5a6..be35f64f2e43 100644
--- a/include/xen/arm/page.h
+++ b/include/xen/arm/page.h
@@ -3,7 +3,7 @@
 #define _ASM_ARM_XEN_PAGE_H
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include <linux/pfn.h>
 #include <linux/types.h>
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 7e83ddd101f1..983caaceac1a 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -25,7 +25,7 @@
 #include <linux/nospec.h>
 #include <linux/audit.h>
 #include <uapi/linux/btf.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <linux/bpf_lsm.h>
 
 #define IS_FD_ARRAY(map) ((map)->map_type == BPF_MAP_TYPE_PERF_EVENT_ARRAY || \
diff --git a/mm/init-mm.c b/mm/init-mm.c
index 19603302a77f..71eabeca33ef 100644
--- a/mm/init-mm.c
+++ b/mm/init-mm.c
@@ -9,7 +9,7 @@
 
 #include <linux/atomic.h>
 #include <linux/user_namespace.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/mmu.h>
 
 #ifndef INIT_MM_CONTEXT
diff --git a/mm/mincore.c b/mm/mincore.c
index 0e6dd9948f1a..edbcf3d54e4e 100644
--- a/mm/mincore.c
+++ b/mm/mincore.c
@@ -19,7 +19,7 @@
 #include <linux/hugetlb.h>
 
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 static int mincore_hugetlb(pte_t *pte, unsigned long hmask, unsigned long addr,
 			unsigned long end, struct mm_walk *walk)
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 494192ca954b..1eeb7b3cedf0 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -28,7 +28,7 @@
 #include <linux/ksm.h>
 #include <linux/uaccess.h>
 #include <linux/mm_inline.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/cacheflush.h>
 #include <asm/mmu_context.h>
 #include <asm/tlbflush.h>
diff --git a/mm/page_reporting.h b/mm/page_reporting.h
index aa6d37f4dc22..2c385dd4ddbd 100644
--- a/mm/page_reporting.h
+++ b/mm/page_reporting.h
@@ -7,7 +7,7 @@
 #include <linux/page-isolation.h>
 #include <linux/jump_label.h>
 #include <linux/slab.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <linux/scatterlist.h>
 
 #define PAGE_REPORTING_MIN_ORDER	pageblock_order
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index d18f0e1b6792..9578db83e312 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -2,15 +2,15 @@
 /*
  *  mm/pgtable-generic.c
  *
- *  Generic pgtable methods declared in asm-generic/pgtable.h
+ *  Generic pgtable methods declared in linux/pgtable.h
  *
  *  Copyright (C) 2010  Linus Torvalds
  */
 
 #include <linux/pagemap.h>
 #include <linux/hugetlb.h>
+#include <linux/pgtable.h>
 #include <asm/tlb.h>
-#include <asm-generic/pgtable.h>
 
 /*
  * If a p?d_bad entry is found while walking page tables, report
@@ -53,7 +53,7 @@ void pmd_clear_bad(pmd_t *pmd)
 
 #ifndef __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 /*
- * Only sets the access flags (dirty, accessed), as well as write 
+ * Only sets the access flags (dirty, accessed), as well as write
  * permission. Furthermore, we know it always gets set to a "more
  * permissive" setting, which allows most architectures to optimize
  * this. We return whether the PTE actually changed, which in turn
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index f6dc0673e62c..7790cd6a4df2 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -40,7 +40,7 @@
 #include <linux/string.h>
 #include <linux/slab.h>
 #include <asm/tlbflush.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <linux/cpumask.h>
 #include <linux/cpu.h>
 #include <linux/vmalloc.h>
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 0310193ea1bd..de405f4b8ef2 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -39,7 +39,7 @@
 
 #ifdef CONFIG_X86
 /* for snoop control */
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <asm/set_memory.h>
 #include <asm/cpufeature.h>
 #endif
diff --git a/sound/soc/intel/common/sst-firmware.c b/sound/soc/intel/common/sst-firmware.c
index d27947aeb079..85622f9f7047 100644
--- a/sound/soc/intel/common/sst-firmware.c
+++ b/sound/soc/intel/common/sst-firmware.c
@@ -21,7 +21,7 @@
 #include <linux/dma/dw.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 
 #include "sst-dsp.h"
 #include "sst-dsp-priv.h"
diff --git a/sound/soc/intel/haswell/sst-haswell-pcm.c b/sound/soc/intel/haswell/sst-haswell-pcm.c
index c183f8e94ee4..0bd4b7d1f271 100644
--- a/sound/soc/intel/haswell/sst-haswell-pcm.c
+++ b/sound/soc/intel/haswell/sst-haswell-pcm.c
@@ -11,7 +11,7 @@
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
+#include <linux/pgtable.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
-- 
2.26.2

