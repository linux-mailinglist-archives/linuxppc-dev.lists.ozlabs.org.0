Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 917C71CFDC2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 20:49:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49M6KR6jDPzDqPK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 04:49:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=CUTC2Sim; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49M6Dk580QzDqjl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 04:45:10 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EA6723127;
 Tue, 12 May 2020 18:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589309108;
 bh=YLs3yr6C4i0D5gFCZ0nWDDJvlAxiFCfgpDIrUi0pEVM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CUTC2Sim3DpvaUiW4Hn6D3PMDI9GheLzrCguhV2k79z6PRfhd6F5vGeGdmi+B93ZT
 wDZOXQwWMxHXlxsvfzU7A5nUpVaKgxi4d2Gq8V1M0dFIBTBM9adxi4GUN13n7GmUNr
 juOovJc3QGT48XmfBmhuMlS2gwnFi/SUyDWf37Y0=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 01/12] mm: don't include asm/pgtable.h if linux/mm.h is
 already included
Date: Tue, 12 May 2020 21:44:11 +0300
Message-Id: <20200512184422.12418-2-rppt@kernel.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200512184422.12418-1-rppt@kernel.org>
References: <20200512184422.12418-1-rppt@kernel.org>
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

The linux/mm.h header includes <asm/pgtable.h> to allow inlining of the
functions involving page table manipulations, e.g. pte_alloc() and
pmd_alloc(). So, there is no point to explicitly include <asm/pgtable.h> in
the files that include <linux/mm.h>.

The include statements in such cases are remove with a simple loop:

	for f in $(git grep -l "include <linux/mm.h>") ; do
		sed -i -e '/include <asm\/pgtable.h>/ d' $f
	done

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/alpha/boot/bootp.c                       | 1 -
 arch/alpha/boot/bootpz.c                      | 1 -
 arch/alpha/boot/main.c                        | 1 -
 arch/alpha/include/asm/io.h                   | 1 -
 arch/alpha/kernel/process.c                   | 1 -
 arch/alpha/kernel/ptrace.c                    | 1 -
 arch/alpha/kernel/setup.c                     | 1 -
 arch/alpha/kernel/smp.c                       | 1 -
 arch/alpha/kernel/sys_alcor.c                 | 1 -
 arch/alpha/kernel/sys_cabriolet.c             | 1 -
 arch/alpha/kernel/sys_dp264.c                 | 1 -
 arch/alpha/kernel/sys_eb64p.c                 | 1 -
 arch/alpha/kernel/sys_eiger.c                 | 1 -
 arch/alpha/kernel/sys_jensen.c                | 1 -
 arch/alpha/kernel/sys_marvel.c                | 1 -
 arch/alpha/kernel/sys_miata.c                 | 1 -
 arch/alpha/kernel/sys_mikasa.c                | 1 -
 arch/alpha/kernel/sys_nautilus.c              | 1 -
 arch/alpha/kernel/sys_noritake.c              | 1 -
 arch/alpha/kernel/sys_rawhide.c               | 1 -
 arch/alpha/kernel/sys_ruffian.c               | 1 -
 arch/alpha/kernel/sys_rx164.c                 | 1 -
 arch/alpha/kernel/sys_sable.c                 | 1 -
 arch/alpha/kernel/sys_sio.c                   | 1 -
 arch/alpha/kernel/sys_sx164.c                 | 1 -
 arch/alpha/kernel/sys_takara.c                | 1 -
 arch/alpha/kernel/sys_titan.c                 | 1 -
 arch/alpha/kernel/sys_wildfire.c              | 1 -
 arch/alpha/mm/init.c                          | 1 -
 arch/arm/kernel/machine_kexec.c               | 1 -
 arch/arm/kernel/module.c                      | 1 -
 arch/arm/kernel/ptrace.c                      | 1 -
 arch/arm/kernel/smp.c                         | 1 -
 arch/arm/mach-ebsa110/core.c                  | 1 -
 arch/arm/mach-footbridge/common.c             | 1 -
 arch/arm/mach-imx/mm-imx21.c                  | 1 -
 arch/arm/mach-imx/mm-imx27.c                  | 1 -
 arch/arm/mach-imx/mm-imx3.c                   | 1 -
 arch/arm/mach-iop32x/i2c.c                    | 1 -
 arch/arm/mach-iop32x/iq31244.c                | 1 -
 arch/arm/mach-iop32x/iq80321.c                | 1 -
 arch/arm/mach-iop32x/n2100.c                  | 1 -
 arch/arm/mach-ixp4xx/common.c                 | 1 -
 arch/arm/mach-sa1100/assabet.c                | 1 -
 arch/arm/mm/copypage-v4mc.c                   | 1 -
 arch/arm/mm/copypage-v6.c                     | 1 -
 arch/arm/mm/copypage-xscale.c                 | 1 -
 arch/arm/mm/dump.c                            | 1 -
 arch/arm/mm/fault-armv.c                      | 1 -
 arch/arm/mm/fault.c                           | 1 -
 arch/arm/mm/pageattr.c                        | 1 -
 arch/arm64/kernel/hibernate.c                 | 1 -
 arch/arm64/kernel/ptrace.c                    | 1 -
 arch/arm64/kernel/smp.c                       | 1 -
 arch/arm64/mm/dump.c                          | 1 -
 arch/arm64/mm/fault.c                         | 1 -
 arch/arm64/mm/kasan_init.c                    | 1 -
 arch/arm64/mm/pageattr.c                      | 1 -
 arch/csky/kernel/module.c                     | 1 -
 arch/csky/kernel/ptrace.c                     | 1 -
 arch/csky/mm/init.c                           | 1 -
 arch/csky/mm/tlb.c                            | 1 -
 arch/h8300/kernel/process.c                   | 1 -
 arch/h8300/kernel/setup.c                     | 1 -
 arch/h8300/kernel/signal.c                    | 1 -
 arch/h8300/mm/fault.c                         | 1 -
 arch/h8300/mm/init.c                          | 1 -
 arch/h8300/mm/memory.c                        | 1 -
 arch/hexagon/mm/vm_fault.c                    | 1 -
 arch/ia64/kernel/efi.c                        | 1 -
 arch/ia64/kernel/ptrace.c                     | 1 -
 arch/ia64/kernel/smp.c                        | 1 -
 arch/ia64/kernel/smpboot.c                    | 1 -
 arch/ia64/mm/contig.c                         | 1 -
 arch/ia64/mm/fault.c                          | 1 -
 arch/m68k/68000/timers.c                      | 1 -
 arch/m68k/amiga/config.c                      | 1 -
 arch/m68k/apollo/config.c                     | 1 -
 arch/m68k/atari/atasound.c                    | 1 -
 arch/m68k/atari/stram.c                       | 1 -
 arch/m68k/bvme6000/config.c                   | 1 -
 arch/m68k/kernel/process.c                    | 1 -
 arch/m68k/kernel/ptrace.c                     | 1 -
 arch/m68k/kernel/setup_no.c                   | 1 -
 arch/m68k/kernel/signal.c                     | 1 -
 arch/m68k/kernel/uboot.c                      | 1 -
 arch/m68k/mac/config.c                        | 1 -
 arch/m68k/mm/mcfmmu.c                         | 1 -
 arch/m68k/mm/sun3kmap.c                       | 1 -
 arch/m68k/mm/sun3mmu.c                        | 1 -
 arch/m68k/mvme147/config.c                    | 1 -
 arch/m68k/mvme16x/config.c                    | 1 -
 arch/m68k/q40/config.c                        | 1 -
 arch/m68k/sun3/config.c                       | 1 -
 arch/m68k/sun3/dvma.c                         | 1 -
 arch/m68k/sun3/mmu_emu.c                      | 1 -
 arch/m68k/sun3/sun3dvma.c                     | 1 -
 arch/m68k/sun3x/dvma.c                        | 1 -
 arch/m68k/sun3x/prom.c                        | 1 -
 arch/microblaze/kernel/signal.c               | 1 -
 arch/microblaze/mm/fault.c                    | 1 -
 arch/mips/fw/arc/memory.c                     | 1 -
 arch/mips/include/asm/mach-generic/floppy.h   | 1 -
 arch/mips/include/asm/mach-jazz/floppy.h      | 1 -
 arch/mips/jazz/jazzdma.c                      | 1 -
 arch/mips/kernel/module.c                     | 1 -
 arch/mips/kernel/process.c                    | 1 -
 arch/mips/kernel/ptrace.c                     | 1 -
 arch/mips/kernel/ptrace32.c                   | 1 -
 arch/mips/kernel/smp-bmips.c                  | 1 -
 arch/mips/kernel/traps.c                      | 1 -
 arch/mips/kvm/tlb.c                           | 1 -
 arch/mips/lib/dump_tlb.c                      | 1 -
 arch/mips/lib/r3k_dump_tlb.c                  | 1 -
 arch/mips/mm/c-octeon.c                       | 1 -
 arch/mips/mm/c-r3k.c                          | 1 -
 arch/mips/mm/c-r4k.c                          | 1 -
 arch/mips/mm/c-tx39.c                         | 1 -
 arch/mips/mm/init.c                           | 1 -
 arch/mips/mm/page.c                           | 1 -
 arch/mips/mm/pgtable-32.c                     | 1 -
 arch/mips/mm/pgtable-64.c                     | 1 -
 arch/mips/mm/sc-ip22.c                        | 1 -
 arch/mips/mm/sc-mips.c                        | 1 -
 arch/mips/mm/sc-r5k.c                         | 1 -
 arch/mips/mm/tlb-r3k.c                        | 1 -
 arch/mips/mm/tlb-r4k.c                        | 1 -
 arch/mips/sgi-ip27/ip27-init.c                | 1 -
 arch/mips/sgi-ip27/ip27-timer.c               | 1 -
 arch/mips/sgi-ip32/ip32-memory.c              | 1 -
 arch/nds32/mm/fault.c                         | 1 -
 arch/nds32/mm/proc.c                          | 1 -
 arch/nios2/kernel/module.c                    | 1 -
 arch/nios2/mm/init.c                          | 1 -
 arch/nios2/mm/pgtable.c                       | 1 -
 arch/nios2/mm/tlb.c                           | 1 -
 arch/openrisc/include/asm/tlbflush.h          | 1 -
 arch/openrisc/kernel/asm-offsets.c            | 1 -
 arch/openrisc/kernel/process.c                | 1 -
 arch/openrisc/kernel/ptrace.c                 | 1 -
 arch/openrisc/kernel/setup.c                  | 1 -
 arch/openrisc/kernel/traps.c                  | 1 -
 arch/openrisc/mm/init.c                       | 1 -
 arch/openrisc/mm/tlb.c                        | 1 -
 arch/parisc/include/asm/mmu_context.h         | 1 -
 arch/parisc/kernel/module.c                   | 1 -
 arch/parisc/kernel/ptrace.c                   | 1 -
 arch/parisc/kernel/smp.c                      | 1 -
 arch/parisc/mm/init.c                         | 1 -
 arch/powerpc/include/asm/io.h                 | 1 -
 arch/powerpc/kernel/asm-offsets.c             | 1 -
 arch/powerpc/kernel/process.c                 | 1 -
 arch/powerpc/kernel/signal_32.c               | 1 -
 arch/powerpc/kernel/signal_64.c               | 1 -
 arch/powerpc/kernel/traps.c                   | 1 -
 arch/powerpc/kernel/vdso.c                    | 1 -
 arch/powerpc/lib/code-patching.c              | 1 -
 arch/powerpc/mm/book3s64/hash_hugetlbpage.c   | 1 -
 arch/powerpc/mm/book3s64/hash_pgtable.c       | 1 -
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c  | 1 -
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 1 -
 arch/powerpc/mm/fault.c                       | 1 -
 arch/powerpc/mm/hugetlbpage.c                 | 1 -
 arch/powerpc/mm/init_32.c                     | 1 -
 arch/powerpc/mm/init_64.c                     | 1 -
 arch/powerpc/mm/mem.c                         | 1 -
 arch/powerpc/mm/nohash/40x.c                  | 1 -
 arch/powerpc/mm/nohash/fsl_booke.c            | 1 -
 arch/powerpc/mm/pgtable_32.c                  | 1 -
 arch/powerpc/mm/pgtable_64.c                  | 1 -
 arch/powerpc/mm/ptdump/hashpagetable.c        | 1 -
 arch/powerpc/mm/ptdump/ptdump.c               | 1 -
 arch/powerpc/perf/callchain.c                 | 1 -
 arch/powerpc/perf/callchain_32.c              | 1 -
 arch/powerpc/perf/callchain_64.c              | 1 -
 arch/powerpc/platforms/8xx/cpm1.c             | 1 -
 arch/powerpc/platforms/8xx/micropatch.c       | 1 -
 arch/powerpc/platforms/cell/setup.c           | 1 -
 arch/powerpc/platforms/chrp/setup.c           | 1 -
 arch/powerpc/platforms/maple/setup.c          | 1 -
 arch/powerpc/platforms/maple/time.c           | 1 -
 arch/powerpc/platforms/powermac/setup.c       | 1 -
 arch/powerpc/platforms/powermac/time.c        | 1 -
 arch/powerpc/platforms/pseries/setup.c        | 1 -
 arch/powerpc/sysdev/cpm2.c                    | 1 -
 arch/powerpc/xmon/xmon.c                      | 1 -
 arch/riscv/kernel/setup.c                     | 1 -
 arch/riscv/mm/init.c                          | 1 -
 arch/s390/include/asm/tlbflush.h              | 1 -
 arch/s390/kernel/machine_kexec.c              | 1 -
 arch/s390/kernel/ptrace.c                     | 1 -
 arch/s390/kernel/vdso.c                       | 1 -
 arch/s390/mm/dump_pagetables.c                | 1 -
 arch/s390/mm/fault.c                          | 1 -
 arch/s390/mm/init.c                           | 1 -
 arch/s390/mm/pageattr.c                       | 1 -
 arch/s390/mm/pgtable.c                        | 1 -
 arch/s390/mm/vmem.c                           | 1 -
 arch/sh/kernel/machine_kexec.c                | 1 -
 arch/sh/kernel/process_64.c                   | 1 -
 arch/sh/kernel/ptrace_32.c                    | 1 -
 arch/sh/kernel/ptrace_64.c                    | 1 -
 arch/sh/kernel/signal_32.c                    | 1 -
 arch/sh/kernel/signal_64.c                    | 1 -
 arch/sh/kernel/traps_64.c                     | 1 -
 arch/sh/mm/cache-sh3.c                        | 1 -
 arch/sh/mm/cache-sh4.c                        | 1 -
 arch/sh/mm/cache-sh7705.c                     | 1 -
 arch/sh/mm/nommu.c                            | 1 -
 arch/sparc/kernel/leon_smp.c                  | 1 -
 arch/sparc/kernel/process_32.c                | 1 -
 arch/sparc/kernel/process_64.c                | 1 -
 arch/sparc/kernel/ptrace_32.c                 | 1 -
 arch/sparc/kernel/ptrace_64.c                 | 1 -
 arch/sparc/kernel/setup_32.c                  | 1 -
 arch/sparc/kernel/setup_64.c                  | 1 -
 arch/sparc/kernel/signal32.c                  | 1 -
 arch/sparc/kernel/signal_32.c                 | 1 -
 arch/sparc/kernel/signal_64.c                 | 1 -
 arch/sparc/kernel/smp_32.c                    | 1 -
 arch/sparc/kernel/smp_64.c                    | 1 -
 arch/sparc/kernel/traps_64.c                  | 1 -
 arch/sparc/mm/fault_32.c                      | 1 -
 arch/sparc/mm/fault_64.c                      | 1 -
 arch/sparc/mm/hugetlbpage.c                   | 1 -
 arch/sparc/mm/init_32.c                       | 1 -
 arch/sparc/mm/init_64.c                       | 1 -
 arch/sparc/mm/io-unit.c                       | 1 -
 arch/sparc/mm/iommu.c                         | 1 -
 arch/sparc/mm/srmmu.c                         | 1 -
 arch/sparc/mm/tlb.c                           | 1 -
 arch/um/kernel/process.c                      | 1 -
 arch/um/kernel/skas/mmu.c                     | 1 -
 arch/um/kernel/skas/uaccess.c                 | 1 -
 arch/um/kernel/tlb.c                          | 1 -
 arch/um/kernel/trap.c                         | 1 -
 arch/um/kernel/um_arch.c                      | 1 -
 arch/unicore32/kernel/module.c                | 1 -
 arch/unicore32/mm/fault.c                     | 1 -
 arch/x86/include/asm/iomap.h                  | 1 -
 arch/x86/include/asm/xen/page.h               | 1 -
 arch/x86/kernel/alternative.c                 | 1 -
 arch/x86/kernel/amd_gart_64.c                 | 1 -
 arch/x86/kernel/doublefault_32.c              | 1 -
 arch/x86/kernel/machine_kexec_32.c            | 1 -
 arch/x86/kernel/machine_kexec_64.c            | 1 -
 arch/x86/kernel/module.c                      | 1 -
 arch/x86/kernel/process_32.c                  | 1 -
 arch/x86/kernel/process_64.c                  | 1 -
 arch/x86/kernel/ptrace.c                      | 1 -
 arch/x86/kernel/tboot.c                       | 1 -
 arch/x86/mm/dump_pagetables.c                 | 1 -
 arch/x86/mm/init_32.c                         | 1 -
 arch/x86/mm/init_64.c                         | 1 -
 arch/x86/mm/kasan_init_64.c                   | 1 -
 arch/x86/mm/pat/cpa-test.c                    | 1 -
 arch/x86/mm/pat/memtype.c                     | 1 -
 arch/x86/mm/pgtable.c                         | 1 -
 arch/x86/mm/pgtable_32.c                      | 1 -
 arch/x86/mm/pti.c                             | 1 -
 arch/x86/platform/efi/efi_64.c                | 1 -
 arch/x86/xen/enlighten_pv.c                   | 1 -
 arch/x86/xen/grant-table.c                    | 1 -
 arch/xtensa/kernel/process.c                  | 1 -
 arch/xtensa/kernel/ptrace.c                   | 1 -
 arch/xtensa/kernel/setup.c                    | 1 -
 drivers/char/agp/frontend.c                   | 1 -
 drivers/char/agp/generic.c                    | 1 -
 drivers/char/bsr.c                            | 1 -
 drivers/char/mspec.c                          | 1 -
 drivers/gpu/drm/i915/i915_mm.c                | 1 -
 drivers/infiniband/sw/rdmavt/mmap.c           | 1 -
 drivers/infiniband/sw/rxe/rxe_mmap.c          | 1 -
 drivers/media/platform/davinci/vpbe_display.c | 1 -
 drivers/media/v4l2-core/v4l2-common.c         | 1 -
 drivers/misc/sgi-gru/grufault.c               | 1 -
 drivers/net/ethernet/sun/sunhme.c             | 1 -
 drivers/sbus/char/flash.c                     | 1 -
 drivers/sbus/char/uctrl.c                     | 1 -
 drivers/scsi/a2091.c                          | 1 -
 drivers/scsi/a3000.c                          | 1 -
 drivers/scsi/gvp11.c                          | 1 -
 drivers/scsi/lasi700.c                        | 1 -
 drivers/scsi/mvme147.c                        | 1 -
 drivers/scsi/sni_53c710.c                     | 1 -
 drivers/video/console/newport_con.c           | 1 -
 drivers/video/fbdev/acornfb.c                 | 1 -
 drivers/video/fbdev/atafb.c                   | 1 -
 drivers/video/fbdev/cirrusfb.c                | 1 -
 drivers/video/fbdev/cyber2000fb.c             | 1 -
 drivers/video/fbdev/fb-puv3.c                 | 1 -
 drivers/video/fbdev/hitfb.c                   | 1 -
 drivers/video/fbdev/neofb.c                   | 1 -
 drivers/video/fbdev/q40fb.c                   | 1 -
 drivers/video/fbdev/savage/savagefb_driver.c  | 1 -
 drivers/xen/balloon.c                         | 1 -
 drivers/xen/grant-table.c                     | 1 -
 drivers/xen/privcmd.c                         | 1 -
 drivers/xen/xenbus/xenbus_probe.c             | 1 -
 drivers/xen/xenbus/xenbus_probe_backend.c     | 1 -
 drivers/xen/xenbus/xenbus_probe_frontend.c    | 1 -
 fs/proc/array.c                               | 1 -
 fs/proc/meminfo.c                             | 1 -
 fs/proc/nommu.c                               | 1 -
 fs/proc/vmcore.c                              | 1 -
 include/linux/dax.h                           | 1 -
 init/init_task.c                              | 1 -
 kernel/exit.c                                 | 1 -
 kernel/fork.c                                 | 1 -
 kernel/power/snapshot.c                       | 1 -
 lib/ioremap.c                                 | 1 -
 mm/debug_vm_pgtable.c                         | 1 -
 mm/gup.c                                      | 1 -
 mm/hugetlb.c                                  | 1 -
 mm/memory.c                                   | 1 -
 mm/page_io.c                                  | 1 -
 mm/shmem.c                                    | 1 -
 mm/sparse-vmemmap.c                           | 1 -
 mm/sparse.c                                   | 1 -
 mm/swap_state.c                               | 1 -
 mm/swapfile.c                                 | 1 -
 mm/vmacache.c                                 | 1 -
 sound/core/sgbuf.c                            | 1 -
 virt/kvm/kvm_main.c                           | 1 -
 324 files changed, 324 deletions(-)

diff --git a/arch/alpha/boot/bootp.c b/arch/alpha/boot/bootp.c
index 95c0359f4858..00266e6e1b71 100644
--- a/arch/alpha/boot/bootp.c
+++ b/arch/alpha/boot/bootp.c
@@ -16,7 +16,6 @@
 
 #include <asm/console.h>
 #include <asm/hwrpb.h>
-#include <asm/pgtable.h>
 #include <asm/io.h>
 
 #include <stdarg.h>
diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
index 99b8d7dc344b..43af71835adf 100644
--- a/arch/alpha/boot/bootpz.c
+++ b/arch/alpha/boot/bootpz.c
@@ -18,7 +18,6 @@
 
 #include <asm/console.h>
 #include <asm/hwrpb.h>
-#include <asm/pgtable.h>
 #include <asm/io.h>
 
 #include <stdarg.h>
diff --git a/arch/alpha/boot/main.c b/arch/alpha/boot/main.c
index 8f5ed8610970..e5347a080008 100644
--- a/arch/alpha/boot/main.c
+++ b/arch/alpha/boot/main.c
@@ -14,7 +14,6 @@
 
 #include <asm/console.h>
 #include <asm/hwrpb.h>
-#include <asm/pgtable.h>
 
 #include <stdarg.h>
 
diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index d1ed5a8133c5..13bea465f1c0 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -7,7 +7,6 @@
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <asm/compiler.h>
-#include <asm/pgtable.h>
 #include <asm/machvec.h>
 #include <asm/hwrpb.h>
 
diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 48b81d015d8a..b45f0b0d6511 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -37,7 +37,6 @@
 #include <asm/reg.h>
 #include <linux/uaccess.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/hwrpb.h>
 #include <asm/fpu.h>
 
diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
index cb8d599e72d6..8c43212ae38e 100644
--- a/arch/alpha/kernel/ptrace.c
+++ b/arch/alpha/kernel/ptrace.c
@@ -19,7 +19,6 @@
 #include <linux/audit.h>
 
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/fpu.h>
 
 #include "proto.h"
diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index f19aa577354b..36043f109dc9 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -55,7 +55,6 @@ static struct notifier_block alpha_panic_block = {
 };
 
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/hwrpb.h>
 #include <asm/dma.h>
 #include <asm/mmu_context.h>
diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 5f90df30be20..9f1354f6c6ab 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -36,7 +36,6 @@
 
 #include <asm/io.h>
 #include <asm/irq.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/mmu_context.h>
 #include <asm/tlbflush.h>
diff --git a/arch/alpha/kernel/sys_alcor.c b/arch/alpha/kernel/sys_alcor.c
index ce5430056f65..e063b3857b3d 100644
--- a/arch/alpha/kernel/sys_alcor.c
+++ b/arch/alpha/kernel/sys_alcor.c
@@ -23,7 +23,6 @@
 #include <asm/dma.h>
 #include <asm/mmu_context.h>
 #include <asm/irq.h>
-#include <asm/pgtable.h>
 #include <asm/core_cia.h>
 #include <asm/tlbflush.h>
 
diff --git a/arch/alpha/kernel/sys_cabriolet.c b/arch/alpha/kernel/sys_cabriolet.c
index 0aa6a27d0e2f..47459b73cdb7 100644
--- a/arch/alpha/kernel/sys_cabriolet.c
+++ b/arch/alpha/kernel/sys_cabriolet.c
@@ -23,7 +23,6 @@
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/core_apecs.h>
 #include <asm/core_cia.h>
 #include <asm/core_lca.h>
diff --git a/arch/alpha/kernel/sys_dp264.c b/arch/alpha/kernel/sys_dp264.c
index d33508621820..9fb445d7dca5 100644
--- a/arch/alpha/kernel/sys_dp264.c
+++ b/arch/alpha/kernel/sys_dp264.c
@@ -26,7 +26,6 @@
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/core_tsunami.h>
 #include <asm/hwrpb.h>
 #include <asm/tlbflush.h>
diff --git a/arch/alpha/kernel/sys_eb64p.c b/arch/alpha/kernel/sys_eb64p.c
index 1cdfe55fb987..3c43fd347526 100644
--- a/arch/alpha/kernel/sys_eb64p.c
+++ b/arch/alpha/kernel/sys_eb64p.c
@@ -22,7 +22,6 @@
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/core_apecs.h>
 #include <asm/core_lca.h>
 #include <asm/hwrpb.h>
diff --git a/arch/alpha/kernel/sys_eiger.c b/arch/alpha/kernel/sys_eiger.c
index 016f79251141..bf99dcfd40c4 100644
--- a/arch/alpha/kernel/sys_eiger.c
+++ b/arch/alpha/kernel/sys_eiger.c
@@ -23,7 +23,6 @@
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/core_tsunami.h>
 #include <asm/hwrpb.h>
 #include <asm/tlbflush.h>
diff --git a/arch/alpha/kernel/sys_jensen.c b/arch/alpha/kernel/sys_jensen.c
index d0d44f543d77..0a2ab6cb18db 100644
--- a/arch/alpha/kernel/sys_jensen.c
+++ b/arch/alpha/kernel/sys_jensen.c
@@ -25,7 +25,6 @@
 #include <asm/dma.h>
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 
 #include "proto.h"
diff --git a/arch/alpha/kernel/sys_marvel.c b/arch/alpha/kernel/sys_marvel.c
index 533899a4a1a1..83d6c53d6d4d 100644
--- a/arch/alpha/kernel/sys_marvel.c
+++ b/arch/alpha/kernel/sys_marvel.c
@@ -18,7 +18,6 @@
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/core_marvel.h>
 #include <asm/hwrpb.h>
 #include <asm/tlbflush.h>
diff --git a/arch/alpha/kernel/sys_miata.c b/arch/alpha/kernel/sys_miata.c
index 702292af2225..e1bee8f84c58 100644
--- a/arch/alpha/kernel/sys_miata.c
+++ b/arch/alpha/kernel/sys_miata.c
@@ -22,7 +22,6 @@
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/core_cia.h>
 #include <asm/tlbflush.h>
 
diff --git a/arch/alpha/kernel/sys_mikasa.c b/arch/alpha/kernel/sys_mikasa.c
index 3af4f94113e1..7690dfd57cb6 100644
--- a/arch/alpha/kernel/sys_mikasa.c
+++ b/arch/alpha/kernel/sys_mikasa.c
@@ -23,7 +23,6 @@
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/core_apecs.h>
 #include <asm/core_cia.h>
 #include <asm/tlbflush.h>
diff --git a/arch/alpha/kernel/sys_nautilus.c b/arch/alpha/kernel/sys_nautilus.c
index 32850e45834b..53adf43dcd44 100644
--- a/arch/alpha/kernel/sys_nautilus.c
+++ b/arch/alpha/kernel/sys_nautilus.c
@@ -40,7 +40,6 @@
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/core_irongate.h>
 #include <asm/hwrpb.h>
 #include <asm/tlbflush.h>
diff --git a/arch/alpha/kernel/sys_noritake.c b/arch/alpha/kernel/sys_noritake.c
index b106f327f765..47f3ce4f719a 100644
--- a/arch/alpha/kernel/sys_noritake.c
+++ b/arch/alpha/kernel/sys_noritake.c
@@ -24,7 +24,6 @@
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/core_apecs.h>
 #include <asm/core_cia.h>
 #include <asm/tlbflush.h>
diff --git a/arch/alpha/kernel/sys_rawhide.c b/arch/alpha/kernel/sys_rawhide.c
index b76f65d0e8b5..b5846ffdadce 100644
--- a/arch/alpha/kernel/sys_rawhide.c
+++ b/arch/alpha/kernel/sys_rawhide.c
@@ -21,7 +21,6 @@
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/core_mcpcia.h>
 #include <asm/tlbflush.h>
 
diff --git a/arch/alpha/kernel/sys_ruffian.c b/arch/alpha/kernel/sys_ruffian.c
index d33074011960..4b1c8d85c4f0 100644
--- a/arch/alpha/kernel/sys_ruffian.c
+++ b/arch/alpha/kernel/sys_ruffian.c
@@ -23,7 +23,6 @@
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/core_cia.h>
 #include <asm/tlbflush.h>
 
diff --git a/arch/alpha/kernel/sys_rx164.c b/arch/alpha/kernel/sys_rx164.c
index 4d85eaeb44aa..94046f9aea08 100644
--- a/arch/alpha/kernel/sys_rx164.c
+++ b/arch/alpha/kernel/sys_rx164.c
@@ -22,7 +22,6 @@
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/core_polaris.h>
 #include <asm/tlbflush.h>
 
diff --git a/arch/alpha/kernel/sys_sable.c b/arch/alpha/kernel/sys_sable.c
index 3cf0d32da5d8..930005b2f630 100644
--- a/arch/alpha/kernel/sys_sable.c
+++ b/arch/alpha/kernel/sys_sable.c
@@ -21,7 +21,6 @@
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/core_t2.h>
 #include <asm/tlbflush.h>
 
diff --git a/arch/alpha/kernel/sys_sio.c b/arch/alpha/kernel/sys_sio.c
index a6bdc1da47ad..7c420d8dac53 100644
--- a/arch/alpha/kernel/sys_sio.c
+++ b/arch/alpha/kernel/sys_sio.c
@@ -25,7 +25,6 @@
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/core_apecs.h>
 #include <asm/core_lca.h>
 #include <asm/tlbflush.h>
diff --git a/arch/alpha/kernel/sys_sx164.c b/arch/alpha/kernel/sys_sx164.c
index 17cc203176c8..dd9de84b630c 100644
--- a/arch/alpha/kernel/sys_sx164.c
+++ b/arch/alpha/kernel/sys_sx164.c
@@ -22,7 +22,6 @@
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/core_cia.h>
 #include <asm/hwrpb.h>
 #include <asm/tlbflush.h>
diff --git a/arch/alpha/kernel/sys_takara.c b/arch/alpha/kernel/sys_takara.c
index e230c6864088..9e2adb69bc74 100644
--- a/arch/alpha/kernel/sys_takara.c
+++ b/arch/alpha/kernel/sys_takara.c
@@ -21,7 +21,6 @@
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/core_cia.h>
 #include <asm/tlbflush.h>
 
diff --git a/arch/alpha/kernel/sys_titan.c b/arch/alpha/kernel/sys_titan.c
index c8390d8de140..b1f3b4fcf99b 100644
--- a/arch/alpha/kernel/sys_titan.c
+++ b/arch/alpha/kernel/sys_titan.c
@@ -26,7 +26,6 @@
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/core_titan.h>
 #include <asm/hwrpb.h>
 #include <asm/tlbflush.h>
diff --git a/arch/alpha/kernel/sys_wildfire.c b/arch/alpha/kernel/sys_wildfire.c
index 2191bde161fd..2c54d707142a 100644
--- a/arch/alpha/kernel/sys_wildfire.c
+++ b/arch/alpha/kernel/sys_wildfire.c
@@ -20,7 +20,6 @@
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/core_wildfire.h>
 #include <asm/hwrpb.h>
 #include <asm/tlbflush.h>
diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
index 667cd21393b5..3c42b3147fd6 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -24,7 +24,6 @@
 #include <linux/gfp.h>
 
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/hwrpb.h>
 #include <asm/dma.h>
diff --git a/arch/arm/kernel/machine_kexec.c b/arch/arm/kernel/machine_kexec.c
index 76300f3813e8..974b6c64d3e6 100644
--- a/arch/arm/kernel/machine_kexec.c
+++ b/arch/arm/kernel/machine_kexec.c
@@ -10,7 +10,6 @@
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/memblock.h>
-#include <asm/pgtable.h>
 #include <linux/of_fdt.h>
 #include <asm/pgalloc.h>
 #include <asm/mmu_context.h>
diff --git a/arch/arm/kernel/module.c b/arch/arm/kernel/module.c
index deef17f34bd2..f6141f482cb3 100644
--- a/arch/arm/kernel/module.c
+++ b/arch/arm/kernel/module.c
@@ -17,7 +17,6 @@
 #include <linux/string.h>
 #include <linux/gfp.h>
 
-#include <asm/pgtable.h>
 #include <asm/sections.h>
 #include <asm/smp_plat.h>
 #include <asm/unwind.h>
diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
index b606cded90cd..2e43ff584325 100644
--- a/arch/arm/kernel/ptrace.c
+++ b/arch/arm/kernel/ptrace.c
@@ -25,7 +25,6 @@
 #include <linux/tracehook.h>
 #include <linux/unistd.h>
 
-#include <asm/pgtable.h>
 #include <asm/traps.h>
 
 #define CREATE_TRACE_POINTS
diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 46e1be9e57a8..9a6432557871 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -37,7 +37,6 @@
 #include <asm/idmap.h>
 #include <asm/topology.h>
 #include <asm/mmu_context.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/procinfo.h>
 #include <asm/processor.h>
diff --git a/arch/arm/mach-ebsa110/core.c b/arch/arm/mach-ebsa110/core.c
index 575b2e2b6759..5960e3dfd2bf 100644
--- a/arch/arm/mach-ebsa110/core.c
+++ b/arch/arm/mach-ebsa110/core.c
@@ -17,7 +17,6 @@
 #include <asm/irq.h>
 #include <asm/setup.h>
 #include <asm/mach-types.h>
-#include <asm/pgtable.h>
 #include <asm/page.h>
 #include <asm/system_misc.h>
 
diff --git a/arch/arm/mach-footbridge/common.c b/arch/arm/mach-footbridge/common.c
index 015f75d1c98d..eee095f0e2f6 100644
--- a/arch/arm/mach-footbridge/common.c
+++ b/arch/arm/mach-footbridge/common.c
@@ -14,7 +14,6 @@
 #include <linux/spinlock.h>
 #include <video/vga.h>
 
-#include <asm/pgtable.h>
 #include <asm/page.h>
 #include <asm/irq.h>
 #include <asm/mach-types.h>
diff --git a/arch/arm/mach-imx/mm-imx21.c b/arch/arm/mach-imx/mm-imx21.c
index e117d2883df9..50a2edac8513 100644
--- a/arch/arm/mach-imx/mm-imx21.c
+++ b/arch/arm/mach-imx/mm-imx21.c
@@ -8,7 +8,6 @@
 #include <linux/mm.h>
 #include <linux/init.h>
 #include <linux/pinctrl/machine.h>
-#include <asm/pgtable.h>
 #include <asm/mach/map.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-imx/mm-imx27.c b/arch/arm/mach-imx/mm-imx27.c
index dcbe7ec6d543..4e4125140025 100644
--- a/arch/arm/mach-imx/mm-imx27.c
+++ b/arch/arm/mach-imx/mm-imx27.c
@@ -8,7 +8,6 @@
 #include <linux/mm.h>
 #include <linux/init.h>
 #include <linux/pinctrl/machine.h>
-#include <asm/pgtable.h>
 #include <asm/mach/map.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-imx/mm-imx3.c b/arch/arm/mach-imx/mm-imx3.c
index 67264c48ed68..ea2d58a63903 100644
--- a/arch/arm/mach-imx/mm-imx3.c
+++ b/arch/arm/mach-imx/mm-imx3.c
@@ -13,7 +13,6 @@
 #include <linux/io.h>
 #include <linux/pinctrl/machine.h>
 
-#include <asm/pgtable.h>
 #include <asm/system_misc.h>
 #include <asm/hardware/cache-l2x0.h>
 #include <asm/mach/map.h>
diff --git a/arch/arm/mach-iop32x/i2c.c b/arch/arm/mach-iop32x/i2c.c
index dc9f6a14ab1b..e422286af469 100644
--- a/arch/arm/mach-iop32x/i2c.c
+++ b/arch/arm/mach-iop32x/i2c.c
@@ -17,7 +17,6 @@
 #include <linux/serial_core.h>
 #include <linux/io.h>
 #include <linux/gpio/machine.h>
-#include <asm/pgtable.h>
 #include <asm/page.h>
 #include <asm/mach/map.h>
 #include <asm/setup.h>
diff --git a/arch/arm/mach-iop32x/iq31244.c b/arch/arm/mach-iop32x/iq31244.c
index 04a7d389d365..49caaa703881 100644
--- a/arch/arm/mach-iop32x/iq31244.c
+++ b/arch/arm/mach-iop32x/iq31244.c
@@ -31,7 +31,6 @@
 #include <asm/mach/time.h>
 #include <asm/mach-types.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 
 #include "hardware.h"
 #include "irqs.h"
diff --git a/arch/arm/mach-iop32x/iq80321.c b/arch/arm/mach-iop32x/iq80321.c
index 4bd596d6c9c1..b455d7073296 100644
--- a/arch/arm/mach-iop32x/iq80321.c
+++ b/arch/arm/mach-iop32x/iq80321.c
@@ -27,7 +27,6 @@
 #include <asm/mach/time.h>
 #include <asm/mach-types.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 
 #include "hardware.h"
 #include "irqs.h"
diff --git a/arch/arm/mach-iop32x/n2100.c b/arch/arm/mach-iop32x/n2100.c
index 5382a93ad0f8..78b9a5ee41c9 100644
--- a/arch/arm/mach-iop32x/n2100.c
+++ b/arch/arm/mach-iop32x/n2100.c
@@ -35,7 +35,6 @@
 #include <asm/mach/time.h>
 #include <asm/mach-types.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 
 #include "hardware.h"
 #include "irqs.h"
diff --git a/arch/arm/mach-ixp4xx/common.c b/arch/arm/mach-ixp4xx/common.c
index 381f452de28d..184262d660ba 100644
--- a/arch/arm/mach-ixp4xx/common.c
+++ b/arch/arm/mach-ixp4xx/common.c
@@ -33,7 +33,6 @@
 #include <mach/hardware.h>
 #include <mach/io.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/page.h>
 #include <asm/exception.h>
 #include <asm/irq.h>
diff --git a/arch/arm/mach-sa1100/assabet.c b/arch/arm/mach-sa1100/assabet.c
index 0631a7b02678..8e3f5fdb4883 100644
--- a/arch/arm/mach-sa1100/assabet.c
+++ b/arch/arm/mach-sa1100/assabet.c
@@ -34,7 +34,6 @@
 #include <asm/setup.h>
 #include <asm/page.h>
 #include <asm/pgtable-hwdef.h>
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 
 #include <asm/mach/arch.h>
diff --git a/arch/arm/mm/copypage-v4mc.c b/arch/arm/mm/copypage-v4mc.c
index a94bd08fdec2..44f7292ec27b 100644
--- a/arch/arm/mm/copypage-v4mc.c
+++ b/arch/arm/mm/copypage-v4mc.c
@@ -14,7 +14,6 @@
 #include <linux/mm.h>
 #include <linux/highmem.h>
 
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
 
diff --git a/arch/arm/mm/copypage-v6.c b/arch/arm/mm/copypage-v6.c
index a6488bb6cfa9..6a769a6c314e 100644
--- a/arch/arm/mm/copypage-v6.c
+++ b/arch/arm/mm/copypage-v6.c
@@ -9,7 +9,6 @@
 #include <linux/mm.h>
 #include <linux/highmem.h>
 
-#include <asm/pgtable.h>
 #include <asm/shmparam.h>
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
diff --git a/arch/arm/mm/copypage-xscale.c b/arch/arm/mm/copypage-xscale.c
index 382e1c2855e8..eb5d338657d1 100644
--- a/arch/arm/mm/copypage-xscale.c
+++ b/arch/arm/mm/copypage-xscale.c
@@ -14,7 +14,6 @@
 #include <linux/mm.h>
 #include <linux/highmem.h>
 
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
 
diff --git a/arch/arm/mm/dump.c b/arch/arm/mm/dump.c
index 677549d6854c..c18d23a5e5f1 100644
--- a/arch/arm/mm/dump.c
+++ b/arch/arm/mm/dump.c
@@ -16,7 +16,6 @@
 #include <asm/domain.h>
 #include <asm/fixmap.h>
 #include <asm/memory.h>
-#include <asm/pgtable.h>
 #include <asm/ptdump.h>
 
 static struct addr_marker address_markers[] = {
diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
index 489aaafa6ebd..0e49154454a6 100644
--- a/arch/arm/mm/fault-armv.c
+++ b/arch/arm/mm/fault-armv.c
@@ -17,7 +17,6 @@
 #include <asm/bugs.h>
 #include <asm/cacheflush.h>
 #include <asm/cachetype.h>
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 
 #include "mm.h"
diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index ff230e9affc4..6229e9d2da6e 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -18,7 +18,6 @@
 #include <linux/highmem.h>
 #include <linux/perf_event.h>
 
-#include <asm/pgtable.h>
 #include <asm/system_misc.h>
 #include <asm/system_info.h>
 #include <asm/tlbflush.h>
diff --git a/arch/arm/mm/pageattr.c b/arch/arm/mm/pageattr.c
index d546efad7e97..9790ae3a8c68 100644
--- a/arch/arm/mm/pageattr.c
+++ b/arch/arm/mm/pageattr.c
@@ -5,7 +5,6 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/set_memory.h>
 
diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index a8a4b55f3a09..668903c94a2b 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -32,7 +32,6 @@
 #include <asm/memory.h>
 #include <asm/mmu_context.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/pgtable-hwdef.h>
 #include <asm/sections.h>
 #include <asm/smp.h>
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 585dd7f5c826..dfdfd383dbeb 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -34,7 +34,6 @@
 #include <asm/cpufeature.h>
 #include <asm/debug-monitors.h>
 #include <asm/fpsimd.h>
-#include <asm/pgtable.h>
 #include <asm/pointer_auth.h>
 #include <asm/stacktrace.h>
 #include <asm/syscall.h>
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 0516a43b555b..31ec7a555074 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -43,7 +43,6 @@
 #include <asm/kvm_mmu.h>
 #include <asm/mmu_context.h>
 #include <asm/numa.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/processor.h>
 #include <asm/smp_plat.h>
diff --git a/arch/arm64/mm/dump.c b/arch/arm64/mm/dump.c
index 78163b7a7dde..16f9c2985375 100644
--- a/arch/arm64/mm/dump.c
+++ b/arch/arm64/mm/dump.c
@@ -22,7 +22,6 @@
 #include <asm/fixmap.h>
 #include <asm/kasan.h>
 #include <asm/memory.h>
-#include <asm/pgtable.h>
 #include <asm/pgtable-hwdef.h>
 #include <asm/ptdump.h>
 
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index a529877daa13..4b700e58992b 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -36,7 +36,6 @@
 #include <asm/processor.h>
 #include <asm/sysreg.h>
 #include <asm/system_misc.h>
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/traps.h>
 
diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index 2339811f317b..ca77eb8a0ccd 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -18,7 +18,6 @@
 #include <asm/kernel-pgtable.h>
 #include <asm/page.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/sections.h>
 #include <asm/tlbflush.h>
 
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 4175bcb8ccb3..23f648c2a199 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -8,7 +8,6 @@
 #include <linux/sched.h>
 #include <linux/vmalloc.h>
 
-#include <asm/pgtable.h>
 #include <asm/set_memory.h>
 #include <asm/tlbflush.h>
 
diff --git a/arch/csky/kernel/module.c b/arch/csky/kernel/module.c
index b5ad7d9de18c..6cd82d69c655 100644
--- a/arch/csky/kernel/module.c
+++ b/arch/csky/kernel/module.c
@@ -10,7 +10,6 @@
 #include <linux/string.h>
 #include <linux/kernel.h>
 #include <linux/spinlock.h>
-#include <asm/pgtable.h>
 
 #ifdef CONFIG_CPU_CK810
 #define IS_BSR32(hi16, lo16)		(((hi16) & 0xFC00) == 0xE000)
diff --git a/arch/csky/kernel/ptrace.c b/arch/csky/kernel/ptrace.c
index bbd801f86eb5..944ca2fdcdd9 100644
--- a/arch/csky/kernel/ptrace.c
+++ b/arch/csky/kernel/ptrace.c
@@ -18,7 +18,6 @@
 
 #include <asm/thread_info.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/asm-offsets.h>
 
diff --git a/arch/csky/mm/init.c b/arch/csky/mm/init.c
index cb64d8647a78..eda2b4291485 100644
--- a/arch/csky/mm/init.c
+++ b/arch/csky/mm/init.c
@@ -24,7 +24,6 @@
 #include <asm/setup.h>
 #include <asm/cachectl.h>
 #include <asm/dma.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/mmu_context.h>
 #include <asm/sections.h>
diff --git a/arch/csky/mm/tlb.c b/arch/csky/mm/tlb.c
index eb3ba6c9c927..ed1512381112 100644
--- a/arch/csky/mm/tlb.c
+++ b/arch/csky/mm/tlb.c
@@ -7,7 +7,6 @@
 #include <linux/sched.h>
 
 #include <asm/mmu_context.h>
-#include <asm/pgtable.h>
 #include <asm/setup.h>
 
 /*
diff --git a/arch/h8300/kernel/process.c b/arch/h8300/kernel/process.c
index e35cdf092e07..0ef55e3052c9 100644
--- a/arch/h8300/kernel/process.c
+++ b/arch/h8300/kernel/process.c
@@ -45,7 +45,6 @@
 #include <linux/uaccess.h>
 #include <asm/traps.h>
 #include <asm/setup.h>
-#include <asm/pgtable.h>
 
 void (*pm_power_off)(void) = NULL;
 EXPORT_SYMBOL(pm_power_off);
diff --git a/arch/h8300/kernel/setup.c b/arch/h8300/kernel/setup.c
index 23a979a85f14..28ac88358a89 100644
--- a/arch/h8300/kernel/setup.c
+++ b/arch/h8300/kernel/setup.c
@@ -31,7 +31,6 @@
 
 #include <asm/setup.h>
 #include <asm/irq.h>
-#include <asm/pgtable.h>
 #include <asm/sections.h>
 #include <asm/page.h>
 
diff --git a/arch/h8300/kernel/signal.c b/arch/h8300/kernel/signal.c
index ef7489b7c459..38d335488a54 100644
--- a/arch/h8300/kernel/signal.c
+++ b/arch/h8300/kernel/signal.c
@@ -43,7 +43,6 @@
 
 #include <asm/setup.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/traps.h>
 #include <asm/ucontext.h>
 
diff --git a/arch/h8300/mm/fault.c b/arch/h8300/mm/fault.c
index fabffb83930a..d4bc9c16f2df 100644
--- a/arch/h8300/mm/fault.c
+++ b/arch/h8300/mm/fault.c
@@ -18,7 +18,6 @@
 #include <linux/kernel.h>
 #include <linux/ptrace.h>
 
-#include <asm/pgtable.h>
 
 void die(const char *str, struct pt_regs *fp, unsigned long err);
 
diff --git a/arch/h8300/mm/init.c b/arch/h8300/mm/init.c
index 27a0020e3771..1f3b345d68b9 100644
--- a/arch/h8300/mm/init.c
+++ b/arch/h8300/mm/init.c
@@ -36,7 +36,6 @@
 #include <asm/setup.h>
 #include <asm/segment.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/sections.h>
 
 /*
diff --git a/arch/h8300/mm/memory.c b/arch/h8300/mm/memory.c
index 3785f72bf3fc..4a60e2b5eb96 100644
--- a/arch/h8300/mm/memory.c
+++ b/arch/h8300/mm/memory.c
@@ -26,7 +26,6 @@
 #include <asm/setup.h>
 #include <asm/segment.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/traps.h>
 #include <asm/io.h>
 
diff --git a/arch/hexagon/mm/vm_fault.c b/arch/hexagon/mm/vm_fault.c
index 72334b26317a..6ed099351c06 100644
--- a/arch/hexagon/mm/vm_fault.c
+++ b/arch/hexagon/mm/vm_fault.c
@@ -11,7 +11,6 @@
  * execptions.
  */
 
-#include <asm/pgtable.h>
 #include <asm/traps.h>
 #include <linux/uaccess.h>
 #include <linux/mm.h>
diff --git a/arch/ia64/kernel/efi.c b/arch/ia64/kernel/efi.c
index a54eacbc61a9..f932b25fb817 100644
--- a/arch/ia64/kernel/efi.c
+++ b/arch/ia64/kernel/efi.c
@@ -37,7 +37,6 @@
 #include <asm/io.h>
 #include <asm/kregs.h>
 #include <asm/meminit.h>
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/mca.h>
 #include <asm/setup.h>
diff --git a/arch/ia64/kernel/ptrace.c b/arch/ia64/kernel/ptrace.c
index bf9c24d9ce84..82aaacf64583 100644
--- a/arch/ia64/kernel/ptrace.c
+++ b/arch/ia64/kernel/ptrace.c
@@ -25,7 +25,6 @@
 #include <linux/elf.h>
 #include <linux/tracehook.h>
 
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/ptrace_offsets.h>
 #include <asm/rse.h>
diff --git a/arch/ia64/kernel/smp.c b/arch/ia64/kernel/smp.c
index de35c54f033d..bbfd421e6deb 100644
--- a/arch/ia64/kernel/smp.c
+++ b/arch/ia64/kernel/smp.c
@@ -40,7 +40,6 @@
 #include <asm/irq.h>
 #include <asm/page.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/sal.h>
diff --git a/arch/ia64/kernel/smpboot.c b/arch/ia64/kernel/smpboot.c
index 6501d9a9a21b..016683b743c2 100644
--- a/arch/ia64/kernel/smpboot.c
+++ b/arch/ia64/kernel/smpboot.c
@@ -50,7 +50,6 @@
 #include <asm/mca.h>
 #include <asm/page.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/sal.h>
diff --git a/arch/ia64/mm/contig.c b/arch/ia64/mm/contig.c
index 8786fa5c7612..d7d31c718d2d 100644
--- a/arch/ia64/mm/contig.c
+++ b/arch/ia64/mm/contig.c
@@ -22,7 +22,6 @@
 
 #include <asm/meminit.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/sections.h>
 #include <asm/mca.h>
 
diff --git a/arch/ia64/mm/fault.c b/arch/ia64/mm/fault.c
index 12242aa0dad1..1bad5be5e61a 100644
--- a/arch/ia64/mm/fault.c
+++ b/arch/ia64/mm/fault.c
@@ -15,7 +15,6 @@
 #include <linux/prefetch.h>
 #include <linux/uaccess.h>
 
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/exception.h>
 
diff --git a/arch/m68k/68000/timers.c b/arch/m68k/68000/timers.c
index 1c8e8a83c325..e8dfdd2556a5 100644
--- a/arch/m68k/68000/timers.c
+++ b/arch/m68k/68000/timers.c
@@ -22,7 +22,6 @@
 #include <linux/clocksource.h>
 #include <linux/rtc.h>
 #include <asm/setup.h>
-#include <asm/pgtable.h>
 #include <asm/machdep.h>
 #include <asm/MC68VZ328.h>
 
diff --git a/arch/m68k/amiga/config.c b/arch/m68k/amiga/config.c
index 4eb911d64e8d..8f23b2fab64c 100644
--- a/arch/m68k/amiga/config.c
+++ b/arch/m68k/amiga/config.c
@@ -32,7 +32,6 @@
 #include <asm/bootinfo-amiga.h>
 #include <asm/byteorder.h>
 #include <asm/setup.h>
-#include <asm/pgtable.h>
 #include <asm/amigahw.h>
 #include <asm/amigaints.h>
 #include <asm/irq.h>
diff --git a/arch/m68k/apollo/config.c b/arch/m68k/apollo/config.c
index 7d168e6dfb01..762da5d7a415 100644
--- a/arch/m68k/apollo/config.c
+++ b/arch/m68k/apollo/config.c
@@ -13,7 +13,6 @@
 #include <asm/bootinfo.h>
 #include <asm/bootinfo-apollo.h>
 #include <asm/byteorder.h>
-#include <asm/pgtable.h>
 #include <asm/apollohw.h>
 #include <asm/irq.h>
 #include <asm/machdep.h>
diff --git a/arch/m68k/atari/atasound.c b/arch/m68k/atari/atasound.c
index 1c1181ebb947..a8724d998c39 100644
--- a/arch/m68k/atari/atasound.c
+++ b/arch/m68k/atari/atasound.c
@@ -26,7 +26,6 @@
 
 #include <asm/atarihw.h>
 #include <asm/irq.h>
-#include <asm/pgtable.h>
 #include <asm/atariints.h>
 
 
diff --git a/arch/m68k/atari/stram.c b/arch/m68k/atari/stram.c
index 6152f9f631d2..ce79b322a99c 100644
--- a/arch/m68k/atari/stram.c
+++ b/arch/m68k/atari/stram.c
@@ -26,7 +26,6 @@
 #include <asm/setup.h>
 #include <asm/machdep.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/atarihw.h>
 #include <asm/atari_stram.h>
 #include <asm/io.h>
diff --git a/arch/m68k/bvme6000/config.c b/arch/m68k/bvme6000/config.c
index 8ebaabc931cd..50f4d01363df 100644
--- a/arch/m68k/bvme6000/config.c
+++ b/arch/m68k/bvme6000/config.c
@@ -31,7 +31,6 @@
 #include <asm/bootinfo.h>
 #include <asm/bootinfo-vme.h>
 #include <asm/byteorder.h>
-#include <asm/pgtable.h>
 #include <asm/setup.h>
 #include <asm/irq.h>
 #include <asm/traps.h>
diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index 8f0d9140700f..90ae376b7ab1 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -36,7 +36,6 @@
 #include <asm/traps.h>
 #include <asm/machdep.h>
 #include <asm/setup.h>
-#include <asm/pgtable.h>
 
 
 asmlinkage void ret_from_fork(void);
diff --git a/arch/m68k/kernel/ptrace.c b/arch/m68k/kernel/ptrace.c
index 748c63bd0081..94b3b274186d 100644
--- a/arch/m68k/kernel/ptrace.c
+++ b/arch/m68k/kernel/ptrace.c
@@ -23,7 +23,6 @@
 
 #include <linux/uaccess.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 
 /*
diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index a63483de7a42..e779b19e0193 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -38,7 +38,6 @@
 #include <asm/bootinfo.h>
 #include <asm/irq.h>
 #include <asm/machdep.h>
-#include <asm/pgtable.h>
 #include <asm/sections.h>
 
 unsigned long memory_start;
diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
index 05610e6924c1..b3ff39588f36 100644
--- a/arch/m68k/kernel/signal.c
+++ b/arch/m68k/kernel/signal.c
@@ -47,7 +47,6 @@
 
 #include <asm/setup.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/traps.h>
 #include <asm/ucontext.h>
 #include <asm/cacheflush.h>
diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
index 1b4c562753da..928dbd33fc4a 100644
--- a/arch/m68k/kernel/uboot.c
+++ b/arch/m68k/kernel/uboot.c
@@ -26,7 +26,6 @@
 #include <asm/setup.h>
 #include <asm/irq.h>
 #include <asm/machdep.h>
-#include <asm/pgtable.h>
 #include <asm/sections.h>
 
 /*
diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
index 611f73bfc87c..26510b0e94f5 100644
--- a/arch/m68k/mac/config.c
+++ b/arch/m68k/mac/config.c
@@ -36,7 +36,6 @@
 
 #include <asm/io.h>
 #include <asm/irq.h>
-#include <asm/pgtable.h>
 #include <asm/machdep.h>
 
 #include <asm/macintosh.h>
diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index 80064e6d064f..29f47923aa46 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -17,7 +17,6 @@
 
 #include <asm/setup.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/mmu_context.h>
 #include <asm/mcf_pgalloc.h>
 #include <asm/tlbflush.h>
diff --git a/arch/m68k/mm/sun3kmap.c b/arch/m68k/mm/sun3kmap.c
index ae03555449b8..4f2a7ef8348b 100644
--- a/arch/m68k/mm/sun3kmap.c
+++ b/arch/m68k/mm/sun3kmap.c
@@ -15,7 +15,6 @@
 #include <linux/vmalloc.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/io.h>
 #include <asm/sun3mmu.h>
 
diff --git a/arch/m68k/mm/sun3mmu.c b/arch/m68k/mm/sun3mmu.c
index 5d8d956d9329..dad494224497 100644
--- a/arch/m68k/mm/sun3mmu.c
+++ b/arch/m68k/mm/sun3mmu.c
@@ -21,7 +21,6 @@
 #include <asm/setup.h>
 #include <linux/uaccess.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/machdep.h>
 #include <asm/io.h>
 
diff --git a/arch/m68k/mvme147/config.c b/arch/m68k/mvme147/config.c
index 545a1fe0e119..490700aa2212 100644
--- a/arch/m68k/mvme147/config.c
+++ b/arch/m68k/mvme147/config.c
@@ -29,7 +29,6 @@
 #include <asm/bootinfo.h>
 #include <asm/bootinfo-vme.h>
 #include <asm/byteorder.h>
-#include <asm/pgtable.h>
 #include <asm/setup.h>
 #include <asm/irq.h>
 #include <asm/traps.h>
diff --git a/arch/m68k/mvme16x/config.c b/arch/m68k/mvme16x/config.c
index 9bc2da69f80c..5b86d10e0f84 100644
--- a/arch/m68k/mvme16x/config.c
+++ b/arch/m68k/mvme16x/config.c
@@ -32,7 +32,6 @@
 #include <asm/bootinfo.h>
 #include <asm/bootinfo-vme.h>
 #include <asm/byteorder.h>
-#include <asm/pgtable.h>
 #include <asm/setup.h>
 #include <asm/irq.h>
 #include <asm/traps.h>
diff --git a/arch/m68k/q40/config.c b/arch/m68k/q40/config.c
index f31890078197..4627de3c0603 100644
--- a/arch/m68k/q40/config.c
+++ b/arch/m68k/q40/config.c
@@ -29,7 +29,6 @@
 
 #include <asm/io.h>
 #include <asm/bootinfo.h>
-#include <asm/pgtable.h>
 #include <asm/setup.h>
 #include <asm/irq.h>
 #include <asm/traps.h>
diff --git a/arch/m68k/sun3/config.c b/arch/m68k/sun3/config.c
index 229ea37dfe1b..7204c0ea0dc7 100644
--- a/arch/m68k/sun3/config.c
+++ b/arch/m68k/sun3/config.c
@@ -22,7 +22,6 @@
 #include <asm/setup.h>
 #include <asm/contregs.h>
 #include <asm/movs.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/sun3-head.h>
 #include <asm/sun3mmu.h>
diff --git a/arch/m68k/sun3/dvma.c b/arch/m68k/sun3/dvma.c
index a2c1c9304895..f15ff16b9997 100644
--- a/arch/m68k/sun3/dvma.c
+++ b/arch/m68k/sun3/dvma.c
@@ -14,7 +14,6 @@
 #include <linux/memblock.h>
 #include <linux/list.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/sun3mmu.h>
 #include <asm/dvma.h>
 
diff --git a/arch/m68k/sun3/mmu_emu.c b/arch/m68k/sun3/mmu_emu.c
index 582a1284059a..7aa879b7c7ff 100644
--- a/arch/m68k/sun3/mmu_emu.c
+++ b/arch/m68k/sun3/mmu_emu.c
@@ -22,7 +22,6 @@
 #include <asm/traps.h>
 #include <linux/uaccess.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/sun3mmu.h>
 #include <asm/segment.h>
 #include <asm/oplib.h>
diff --git a/arch/m68k/sun3/sun3dvma.c b/arch/m68k/sun3/sun3dvma.c
index 399f3d06125f..4b560f4d3960 100644
--- a/arch/m68k/sun3/sun3dvma.c
+++ b/arch/m68k/sun3/sun3dvma.c
@@ -16,7 +16,6 @@
 #include <linux/list.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/dvma.h>
 
 #undef DVMA_DEBUG
diff --git a/arch/m68k/sun3x/dvma.c b/arch/m68k/sun3x/dvma.c
index c4b8aa1d80f4..fef52d222d46 100644
--- a/arch/m68k/sun3x/dvma.c
+++ b/arch/m68k/sun3x/dvma.c
@@ -22,7 +22,6 @@
 #include <asm/dvma.h>
 #include <asm/io.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 
 /* IOMMU support */
diff --git a/arch/m68k/sun3x/prom.c b/arch/m68k/sun3x/prom.c
index be14c899ab7d..74d2fe57524b 100644
--- a/arch/m68k/sun3x/prom.c
+++ b/arch/m68k/sun3x/prom.c
@@ -10,7 +10,6 @@
 #include <linux/string.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/setup.h>
 #include <asm/traps.h>
 #include <asm/sun3xprom.h>
diff --git a/arch/microblaze/kernel/signal.c b/arch/microblaze/kernel/signal.c
index c9125c328949..7dcd2e4d430e 100644
--- a/arch/microblaze/kernel/signal.c
+++ b/arch/microblaze/kernel/signal.c
@@ -35,7 +35,6 @@
 #include <asm/entry.h>
 #include <asm/ucontext.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <linux/syscalls.h>
 #include <asm/cacheflush.h>
diff --git a/arch/microblaze/mm/fault.c b/arch/microblaze/mm/fault.c
index 3248141f8ed5..77dabc91d192 100644
--- a/arch/microblaze/mm/fault.c
+++ b/arch/microblaze/mm/fault.c
@@ -30,7 +30,6 @@
 #include <linux/interrupt.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/mmu.h>
 #include <linux/mmu_context.h>
 #include <linux/uaccess.h>
diff --git a/arch/mips/fw/arc/memory.c b/arch/mips/fw/arc/memory.c
index 89fa6e62a3b3..da0712ad85f5 100644
--- a/arch/mips/fw/arc/memory.c
+++ b/arch/mips/fw/arc/memory.c
@@ -22,7 +22,6 @@
 
 #include <asm/sgialib.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/bootinfo.h>
 
 #undef DEBUG
diff --git a/arch/mips/include/asm/mach-generic/floppy.h b/arch/mips/include/asm/mach-generic/floppy.h
index 9ec2f6a5200b..a0979d4c8ff6 100644
--- a/arch/mips/include/asm/mach-generic/floppy.h
+++ b/arch/mips/include/asm/mach-generic/floppy.h
@@ -21,7 +21,6 @@
 #include <asm/floppy.h>
 #include <asm/io.h>
 #include <asm/irq.h>
-#include <asm/pgtable.h>
 
 /*
  * How to access the FDC's registers.
diff --git a/arch/mips/include/asm/mach-jazz/floppy.h b/arch/mips/include/asm/mach-jazz/floppy.h
index 4b86c88a03b7..e769e6a9048a 100644
--- a/arch/mips/include/asm/mach-jazz/floppy.h
+++ b/arch/mips/include/asm/mach-jazz/floppy.h
@@ -15,7 +15,6 @@
 #include <asm/addrspace.h>
 #include <asm/jazz.h>
 #include <asm/jazzdma.h>
-#include <asm/pgtable.h>
 
 static inline unsigned char fd_inb(unsigned int port)
 {
diff --git a/arch/mips/jazz/jazzdma.c b/arch/mips/jazz/jazzdma.c
index c64a297e82b3..014773f0bfcd 100644
--- a/arch/mips/jazz/jazzdma.c
+++ b/arch/mips/jazz/jazzdma.c
@@ -24,7 +24,6 @@
 #include <linux/uaccess.h>
 #include <asm/dma.h>
 #include <asm/jazzdma.h>
-#include <asm/pgtable.h>
 
 /*
  * Set this to one to enable additional vdma debug code.
diff --git a/arch/mips/kernel/module.c b/arch/mips/kernel/module.c
index 8713b69c5048..3c0c3d1260c1 100644
--- a/arch/mips/kernel/module.c
+++ b/arch/mips/kernel/module.c
@@ -21,7 +21,6 @@
 #include <linux/spinlock.h>
 #include <linux/jump_label.h>
 
-#include <asm/pgtable.h>	/* MODULE_START */
 
 struct mips_hi16 {
 	struct mips_hi16 *next;
diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index b2a797557825..ff5320b79100 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -42,7 +42,6 @@
 #include <asm/irq.h>
 #include <asm/mips-cps.h>
 #include <asm/msa.h>
-#include <asm/pgtable.h>
 #include <asm/mipsregs.h>
 #include <asm/processor.h>
 #include <asm/reg.h>
diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
index 414b6e9c900b..2a61641c680b 100644
--- a/arch/mips/kernel/ptrace.c
+++ b/arch/mips/kernel/ptrace.c
@@ -39,7 +39,6 @@
 #include <asm/fpu.h>
 #include <asm/mipsregs.h>
 #include <asm/mipsmtregs.h>
-#include <asm/pgtable.h>
 #include <asm/page.h>
 #include <asm/processor.h>
 #include <asm/syscall.h>
diff --git a/arch/mips/kernel/ptrace32.c b/arch/mips/kernel/ptrace32.c
index 2525eca9c962..afcf27a877cb 100644
--- a/arch/mips/kernel/ptrace32.c
+++ b/arch/mips/kernel/ptrace32.c
@@ -30,7 +30,6 @@
 #include <asm/fpu.h>
 #include <asm/mipsregs.h>
 #include <asm/mipsmtregs.h>
-#include <asm/pgtable.h>
 #include <asm/page.h>
 #include <asm/reg.h>
 #include <asm/syscall.h>
diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index 9058e9dcf080..2f513506a3d5 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -28,7 +28,6 @@
 #include <linux/kexec.h>
 
 #include <asm/time.h>
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/bootinfo.h>
 #include <asm/cacheflush.h>
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 427c28dbb598..41816f609992 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -57,7 +57,6 @@
 #include <asm/mipsmtregs.h>
 #include <asm/module.h>
 #include <asm/msa.h>
-#include <asm/pgtable.h>
 #include <asm/ptrace.h>
 #include <asm/sections.h>
 #include <asm/siginfo.h>
diff --git a/arch/mips/kvm/tlb.c b/arch/mips/kvm/tlb.c
index 7cd92166a0b9..f7f3a9007402 100644
--- a/arch/mips/kvm/tlb.c
+++ b/arch/mips/kvm/tlb.c
@@ -21,7 +21,6 @@
 #include <asm/cpu.h>
 #include <asm/bootinfo.h>
 #include <asm/mmu_context.h>
-#include <asm/pgtable.h>
 #include <asm/cacheflush.h>
 #include <asm/tlb.h>
 #include <asm/tlbdebug.h>
diff --git a/arch/mips/lib/dump_tlb.c b/arch/mips/lib/dump_tlb.c
index 83ed37298e66..5a418ba5e75f 100644
--- a/arch/mips/lib/dump_tlb.c
+++ b/arch/mips/lib/dump_tlb.c
@@ -12,7 +12,6 @@
 #include <asm/mipsregs.h>
 #include <asm/mmu_context.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/tlbdebug.h>
 
 void dump_tlb_regs(void)
diff --git a/arch/mips/lib/r3k_dump_tlb.c b/arch/mips/lib/r3k_dump_tlb.c
index b97d9c5d8323..10b4bf7f70a3 100644
--- a/arch/mips/lib/r3k_dump_tlb.c
+++ b/arch/mips/lib/r3k_dump_tlb.c
@@ -12,7 +12,6 @@
 #include <asm/mipsregs.h>
 #include <asm/mmu_context.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/tlbdebug.h>
 
 extern int r3k_have_wired_reg;
diff --git a/arch/mips/mm/c-octeon.c b/arch/mips/mm/c-octeon.c
index 4baf965e6fe8..8ae181e08311 100644
--- a/arch/mips/mm/c-octeon.c
+++ b/arch/mips/mm/c-octeon.c
@@ -20,7 +20,6 @@
 #include <asm/cpu-features.h>
 #include <asm/cpu-type.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/r4kcache.h>
 #include <asm/traps.h>
 #include <asm/mmu_context.h>
diff --git a/arch/mips/mm/c-r3k.c b/arch/mips/mm/c-r3k.c
index 780dd2a567c1..9f4a93f8b996 100644
--- a/arch/mips/mm/c-r3k.c
+++ b/arch/mips/mm/c-r3k.c
@@ -16,7 +16,6 @@
 #include <linux/mm.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/mmu_context.h>
 #include <asm/isadep.h>
 #include <asm/io.h>
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 54c18b8a2406..5fe840c1b897 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -29,7 +29,6 @@
 #include <asm/cpu-type.h>
 #include <asm/io.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/r4kcache.h>
 #include <asm/sections.h>
 #include <asm/mmu_context.h>
diff --git a/arch/mips/mm/c-tx39.c b/arch/mips/mm/c-tx39.c
index 2d479cc7e66b..204059d28f21 100644
--- a/arch/mips/mm/c-tx39.c
+++ b/arch/mips/mm/c-tx39.c
@@ -17,7 +17,6 @@
 
 #include <asm/cacheops.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/mmu_context.h>
 #include <asm/isadep.h>
 #include <asm/io.h>
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 19719e8b41a5..72be86c79d7b 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -40,7 +40,6 @@
 #include <asm/maar.h>
 #include <asm/mmu_context.h>
 #include <asm/sections.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
 #include <asm/fixmap.h>
diff --git a/arch/mips/mm/page.c b/arch/mips/mm/page.c
index c5578897a4fa..cd805b005509 100644
--- a/arch/mips/mm/page.c
+++ b/arch/mips/mm/page.c
@@ -20,7 +20,6 @@
 #include <asm/inst.h>
 #include <asm/io.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/prefetch.h>
 #include <asm/bootinfo.h>
 #include <asm/mipsregs.h>
diff --git a/arch/mips/mm/pgtable-32.c b/arch/mips/mm/pgtable-32.c
index 37c7a01427d2..bd4b0656add3 100644
--- a/arch/mips/mm/pgtable-32.c
+++ b/arch/mips/mm/pgtable-32.c
@@ -10,7 +10,6 @@
 #include <linux/memblock.h>
 #include <linux/highmem.h>
 #include <asm/fixmap.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 
diff --git a/arch/mips/mm/pgtable-64.c b/arch/mips/mm/pgtable-64.c
index 6fd6e96fdebb..183ff9f9c026 100644
--- a/arch/mips/mm/pgtable-64.c
+++ b/arch/mips/mm/pgtable-64.c
@@ -10,7 +10,6 @@
 #include <linux/init.h>
 #include <linux/mm.h>
 #include <asm/fixmap.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 
diff --git a/arch/mips/mm/sc-ip22.c b/arch/mips/mm/sc-ip22.c
index ea059cd86496..d7238687d790 100644
--- a/arch/mips/mm/sc-ip22.c
+++ b/arch/mips/mm/sc-ip22.c
@@ -12,7 +12,6 @@
 
 #include <asm/bcache.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/bootinfo.h>
 #include <asm/sgi/ip22.h>
 #include <asm/sgi/mc.h>
diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
index dbdbfe5d8408..5479852876f4 100644
--- a/arch/mips/mm/sc-mips.c
+++ b/arch/mips/mm/sc-mips.c
@@ -12,7 +12,6 @@
 #include <asm/bcache.h>
 #include <asm/cacheops.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/mmu_context.h>
 #include <asm/r4kcache.h>
 #include <asm/mips-cps.h>
diff --git a/arch/mips/mm/sc-r5k.c b/arch/mips/mm/sc-r5k.c
index c7b94c951d98..736615d68f7a 100644
--- a/arch/mips/mm/sc-r5k.c
+++ b/arch/mips/mm/sc-r5k.c
@@ -12,7 +12,6 @@
 #include <asm/bcache.h>
 #include <asm/cacheops.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/mmu_context.h>
 #include <asm/r4kcache.h>
 
diff --git a/arch/mips/mm/tlb-r3k.c b/arch/mips/mm/tlb-r3k.c
index 50f207591b6d..a36622ebea55 100644
--- a/arch/mips/mm/tlb-r3k.c
+++ b/arch/mips/mm/tlb-r3k.c
@@ -17,7 +17,6 @@
 #include <linux/mm.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/mmu_context.h>
 #include <asm/tlbmisc.h>
 #include <asm/isadep.h>
diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index d7a9d5f211f0..6677dcb72580 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -21,7 +21,6 @@
 #include <asm/bootinfo.h>
 #include <asm/hazards.h>
 #include <asm/mmu_context.h>
-#include <asm/pgtable.h>
 #include <asm/tlb.h>
 #include <asm/tlbmisc.h>
 
diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index 32bcb8d1dd88..a4daf8ccd16c 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -16,7 +16,6 @@
 #include <asm/bootinfo.h>
 #include <asm/cpu.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/sgialib.h>
 #include <asm/time.h>
 #include <asm/sn/agent.h>
diff --git a/arch/mips/sgi-ip27/ip27-timer.c b/arch/mips/sgi-ip27/ip27-timer.c
index 61f3565f3645..c5bf647d80f0 100644
--- a/arch/mips/sgi-ip27/ip27-timer.c
+++ b/arch/mips/sgi-ip27/ip27-timer.c
@@ -19,7 +19,6 @@
 #include <linux/platform_device.h>
 
 #include <asm/time.h>
-#include <asm/pgtable.h>
 #include <asm/sgialib.h>
 #include <asm/sn/ioc3.h>
 #include <asm/sn/klconfig.h>
diff --git a/arch/mips/sgi-ip32/ip32-memory.c b/arch/mips/sgi-ip32/ip32-memory.c
index 828ce131c228..be1b2cfc4c3e 100644
--- a/arch/mips/sgi-ip32/ip32-memory.c
+++ b/arch/mips/sgi-ip32/ip32-memory.c
@@ -14,7 +14,6 @@
 #include <asm/ip32/crime.h>
 #include <asm/bootinfo.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 
 extern void crime_init(void);
diff --git a/arch/nds32/mm/fault.c b/arch/nds32/mm/fault.c
index f331e533edc2..ccd70004f97c 100644
--- a/arch/nds32/mm/fault.c
+++ b/arch/nds32/mm/fault.c
@@ -11,7 +11,6 @@
 #include <linux/uaccess.h>
 #include <linux/perf_event.h>
 
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 
 extern void die(const char *str, struct pt_regs *regs, long err);
diff --git a/arch/nds32/mm/proc.c b/arch/nds32/mm/proc.c
index 837ae7728830..a2b9aacc5f89 100644
--- a/arch/nds32/mm/proc.c
+++ b/arch/nds32/mm/proc.c
@@ -5,7 +5,6 @@
 #include <linux/sched.h>
 #include <linux/mm.h>
 #include <asm/nds32.h>
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
 #include <asm/l2_cache.h>
diff --git a/arch/nios2/kernel/module.c b/arch/nios2/kernel/module.c
index e2e3f13f98d5..76e0a42d6e36 100644
--- a/arch/nios2/kernel/module.c
+++ b/arch/nios2/kernel/module.c
@@ -19,7 +19,6 @@
 #include <linux/string.h>
 #include <linux/kernel.h>
 
-#include <asm/pgtable.h>
 #include <asm/cacheflush.h>
 
 /*
diff --git a/arch/nios2/mm/init.c b/arch/nios2/mm/init.c
index 9afca77d10b1..2ab0a16f36a8 100644
--- a/arch/nios2/mm/init.c
+++ b/arch/nios2/mm/init.c
@@ -29,7 +29,6 @@
 
 #include <asm/setup.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/sections.h>
 #include <asm/tlb.h>
 #include <asm/mmu_context.h>
diff --git a/arch/nios2/mm/pgtable.c b/arch/nios2/mm/pgtable.c
index 61e24a25f71a..9b587fd592dd 100644
--- a/arch/nios2/mm/pgtable.c
+++ b/arch/nios2/mm/pgtable.c
@@ -10,7 +10,6 @@
 #include <linux/mm.h>
 #include <linux/sched.h>
 
-#include <asm/pgtable.h>
 #include <asm/cpuinfo.h>
 
 /* pteaddr:
diff --git a/arch/nios2/mm/tlb.c b/arch/nios2/mm/tlb.c
index 7fea59e53f94..f90ac35f05f3 100644
--- a/arch/nios2/mm/tlb.c
+++ b/arch/nios2/mm/tlb.c
@@ -16,7 +16,6 @@
 
 #include <asm/tlb.h>
 #include <asm/mmu_context.h>
-#include <asm/pgtable.h>
 #include <asm/cpuinfo.h>
 
 #define TLB_INDEX_MASK		\
diff --git a/arch/openrisc/include/asm/tlbflush.h b/arch/openrisc/include/asm/tlbflush.h
index e9a7f0b35a15..4a4639c65cbb 100644
--- a/arch/openrisc/include/asm/tlbflush.h
+++ b/arch/openrisc/include/asm/tlbflush.h
@@ -17,7 +17,6 @@
 
 #include <linux/mm.h>
 #include <asm/processor.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/current.h>
 #include <linux/sched.h>
diff --git a/arch/openrisc/kernel/asm-offsets.c b/arch/openrisc/kernel/asm-offsets.c
index e435ae01c600..18c703d1d761 100644
--- a/arch/openrisc/kernel/asm-offsets.c
+++ b/arch/openrisc/kernel/asm-offsets.c
@@ -32,7 +32,6 @@
 #include <linux/thread_info.h>
 #include <linux/kbuild.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 
 int main(void)
diff --git a/arch/openrisc/kernel/process.c b/arch/openrisc/kernel/process.c
index 6bcdca424e11..d7010e72450c 100644
--- a/arch/openrisc/kernel/process.c
+++ b/arch/openrisc/kernel/process.c
@@ -36,7 +36,6 @@
 #include <linux/fs.h>
 
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/io.h>
 #include <asm/processor.h>
 #include <asm/spr_defs.h>
diff --git a/arch/openrisc/kernel/ptrace.c b/arch/openrisc/kernel/ptrace.c
index 6a5a91c76338..c8f47a623754 100644
--- a/arch/openrisc/kernel/ptrace.c
+++ b/arch/openrisc/kernel/ptrace.c
@@ -27,7 +27,6 @@
 
 #include <asm/thread_info.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 
 /*
  * Copy the thread state to a regset that can be interpreted by userspace.
diff --git a/arch/openrisc/kernel/setup.c b/arch/openrisc/kernel/setup.c
index c0a774b51e45..8aa438e1f51f 100644
--- a/arch/openrisc/kernel/setup.c
+++ b/arch/openrisc/kernel/setup.c
@@ -35,7 +35,6 @@
 #include <linux/device.h>
 
 #include <asm/sections.h>
-#include <asm/pgtable.h>
 #include <asm/types.h>
 #include <asm/setup.h>
 #include <asm/io.h>
diff --git a/arch/openrisc/kernel/traps.c b/arch/openrisc/kernel/traps.c
index 3022b0ad142c..206e5325e61b 100644
--- a/arch/openrisc/kernel/traps.c
+++ b/arch/openrisc/kernel/traps.c
@@ -31,7 +31,6 @@
 #include <linux/uaccess.h>
 
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/unwinder.h>
 #include <asm/sections.h>
 
diff --git a/arch/openrisc/mm/init.c b/arch/openrisc/mm/init.c
index 3bcdc1c26b23..3d7c79c7745d 100644
--- a/arch/openrisc/mm/init.c
+++ b/arch/openrisc/mm/init.c
@@ -29,7 +29,6 @@
 #include <linux/pagemap.h>
 
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/dma.h>
 #include <asm/io.h>
 #include <asm/tlb.h>
diff --git a/arch/openrisc/mm/tlb.c b/arch/openrisc/mm/tlb.c
index dd4f2007f7c9..4b680aed8f5f 100644
--- a/arch/openrisc/mm/tlb.c
+++ b/arch/openrisc/mm/tlb.c
@@ -23,7 +23,6 @@
 #include <linux/init.h>
 
 #include <asm/tlbflush.h>
-#include <asm/pgtable.h>
 #include <asm/mmu_context.h>
 #include <asm/spr_defs.h>
 
diff --git a/arch/parisc/include/asm/mmu_context.h b/arch/parisc/include/asm/mmu_context.h
index 697a906ab1b0..07b89c74abeb 100644
--- a/arch/parisc/include/asm/mmu_context.h
+++ b/arch/parisc/include/asm/mmu_context.h
@@ -6,7 +6,6 @@
 #include <linux/sched.h>
 #include <linux/atomic.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm-generic/mm_hooks.h>
 
 static inline void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index 1c50093e2ebe..a0878a89bb9b 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -50,7 +50,6 @@
 #include <linux/mm.h>
 #include <linux/slab.h>
 
-#include <asm/pgtable.h>
 #include <asm/unwind.h>
 #include <asm/sections.h>
 
diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
index f8c07dcbfb49..b51418ad8655 100644
--- a/arch/parisc/kernel/ptrace.c
+++ b/arch/parisc/kernel/ptrace.c
@@ -26,7 +26,6 @@
 #include <linux/audit.h>
 
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/asm-offsets.h>
 
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index e202c37e56af..f8a842ddd82d 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -39,7 +39,6 @@
 #include <asm/irq.h>		/* for CPU_IRQ_REGION and friends */
 #include <asm/mmu_context.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 02d2fdb85dcc..cb0c07d805db 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -26,7 +26,6 @@
 #include <linux/compat.h>
 
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/tlb.h>
 #include <asm/pdc_chassis.h>
 #include <asm/mmzone.h>
diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 13f90dd03450..58635960403c 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -34,7 +34,6 @@ extern struct pci_dev *isa_bridge_pcidev;
 #include <asm/mmiowb.h>
 #include <asm/mmu.h>
 #include <asm/ppc_asm.h>
-#include <asm/pgtable.h>
 
 #define SIO_CONFIG_RA	0x398
 #define SIO_CONFIG_RD	0x399
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index fcf24a365fc0..254debe00c90 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -30,7 +30,6 @@
 
 #include <asm/io.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/cputable.h>
 #include <asm/thread_info.h>
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 60ff743b2fcf..cdbcbc642df8 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -41,7 +41,6 @@
 #include <linux/pkeys.h>
 #include <linux/seq_buf.h>
 
-#include <asm/pgtable.h>
 #include <asm/io.h>
 #include <asm/processor.h>
 #include <asm/mmu.h>
diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 4f96d29a22bf..6f3bce0cafc1 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -47,7 +47,6 @@
 #include <asm/unistd.h>
 #else
 #include <asm/ucontext.h>
-#include <asm/pgtable.h>
 #endif
 
 #include "signal.h"
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index adfde59cf4ba..5b688d73279b 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -25,7 +25,6 @@
 #include <asm/sigcontext.h>
 #include <asm/ucontext.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/unistd.h>
 #include <asm/cacheflush.h>
 #include <asm/syscalls.h>
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 3fca22276bb1..75f54c016ee6 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -39,7 +39,6 @@
 #include <linux/kmsg_dump.h>
 
 #include <asm/emulated_ops.h>
-#include <asm/pgtable.h>
 #include <linux/uaccess.h>
 #include <asm/debugfs.h>
 #include <asm/io.h>
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index f38f26e844b6..74782129a84e 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -18,7 +18,6 @@
 #include <linux/security.h>
 #include <linux/memblock.h>
 
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 7a59f6863cec..b986d4867468 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -12,7 +12,6 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/page.h>
 #include <asm/code-patching.h>
diff --git a/arch/powerpc/mm/book3s64/hash_hugetlbpage.c b/arch/powerpc/mm/book3s64/hash_hugetlbpage.c
index eefa89c6117b..25acb9c5ee1b 100644
--- a/arch/powerpc/mm/book3s64/hash_hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/hash_hugetlbpage.c
@@ -10,7 +10,6 @@
 
 #include <linux/mm.h>
 #include <linux/hugetlb.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/cacheflush.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index 8b4b0a602158..00af58cc8714 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -10,7 +10,6 @@
 #include <linux/mm.h>
 
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/sections.h>
 #include <asm/mmu.h>
 #include <asm/tlb.h>
diff --git a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
index cab06331c0c0..c812b401b66c 100644
--- a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
@@ -2,7 +2,6 @@
 #include <linux/mm.h>
 #include <linux/hugetlb.h>
 #include <linux/security.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/cacheflush.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 29cb6263c73a..d6cd87943e86 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -17,7 +17,6 @@
 #include <linux/string_helpers.h>
 #include <linux/stop_machine.h>
 
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/mmu_context.h>
 #include <asm/dma.h>
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 44457bae77a0..ff84e7f2105e 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -35,7 +35,6 @@
 
 #include <asm/firmware.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
 #include <asm/siginfo.h>
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 7df8059471eb..75e8731df1e8 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -19,7 +19,6 @@
 #include <linux/swap.h>
 #include <linux/swapops.h>
 #include <linux/kmemleak.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
 #include <asm/setup.h>
diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
index 872df48ae41b..cde693b699f3 100644
--- a/arch/powerpc/mm/init_32.c
+++ b/arch/powerpc/mm/init_32.c
@@ -32,7 +32,6 @@
 #include <asm/pgalloc.h>
 #include <asm/prom.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/mmu.h>
 #include <asm/smp.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 4002ced3596f..b7acdff5c111 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -47,7 +47,6 @@
 #include <asm/rtas.h>
 #include <asm/io.h>
 #include <asm/mmu_context.h>
-#include <asm/pgtable.h>
 #include <asm/mmu.h>
 #include <linux/uaccess.h>
 #include <asm/smp.h>
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 7cebb9c818d3..9921b36808a2 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -37,7 +37,6 @@
 #include <asm/prom.h>
 #include <asm/io.h>
 #include <asm/mmu_context.h>
-#include <asm/pgtable.h>
 #include <asm/mmu.h>
 #include <asm/smp.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/mm/nohash/40x.c b/arch/powerpc/mm/nohash/40x.c
index 82862723ab42..723512b71758 100644
--- a/arch/powerpc/mm/nohash/40x.c
+++ b/arch/powerpc/mm/nohash/40x.c
@@ -36,7 +36,6 @@
 #include <asm/prom.h>
 #include <asm/io.h>
 #include <asm/mmu_context.h>
-#include <asm/pgtable.h>
 #include <asm/mmu.h>
 #include <linux/uaccess.h>
 #include <asm/smp.h>
diff --git a/arch/powerpc/mm/nohash/fsl_booke.c b/arch/powerpc/mm/nohash/fsl_booke.c
index b4eb06ceb189..c06dfbb771f4 100644
--- a/arch/powerpc/mm/nohash/fsl_booke.c
+++ b/arch/powerpc/mm/nohash/fsl_booke.c
@@ -41,7 +41,6 @@
 #include <asm/prom.h>
 #include <asm/io.h>
 #include <asm/mmu_context.h>
-#include <asm/pgtable.h>
 #include <asm/mmu.h>
 #include <linux/uaccess.h>
 #include <asm/smp.h>
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index f62de06e3d07..738e5e38a4be 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -24,7 +24,6 @@
 #include <linux/memblock.h>
 #include <linux/slab.h>
 
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/fixmap.h>
 #include <asm/setup.h>
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 1f86a88fd4bb..bb43a8c04bee 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -35,7 +35,6 @@
 #include <asm/page.h>
 #include <asm/prom.h>
 #include <asm/mmu_context.h>
-#include <asm/pgtable.h>
 #include <asm/mmu.h>
 #include <asm/smp.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/mm/ptdump/hashpagetable.c b/arch/powerpc/mm/ptdump/hashpagetable.c
index 6aaeb1eb3b9c..a2c33efc7ce8 100644
--- a/arch/powerpc/mm/ptdump/hashpagetable.c
+++ b/arch/powerpc/mm/ptdump/hashpagetable.c
@@ -15,7 +15,6 @@
 #include <linux/mm.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
-#include <asm/pgtable.h>
 #include <linux/const.h>
 #include <asm/page.h>
 #include <asm/pgalloc.h>
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 507cb9793b26..1b21369ce82b 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -19,7 +19,6 @@
 #include <linux/sched.h>
 #include <linux/seq_file.h>
 #include <asm/fixmap.h>
-#include <asm/pgtable.h>
 #include <linux/const.h>
 #include <asm/page.h>
 #include <asm/pgalloc.h>
diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index dd5051015008..6c028ee513c0 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -11,7 +11,6 @@
 #include <linux/uaccess.h>
 #include <linux/mm.h>
 #include <asm/ptrace.h>
-#include <asm/pgtable.h>
 #include <asm/sigcontext.h>
 #include <asm/ucontext.h>
 #include <asm/vdso.h>
diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
index 8aa951003141..f7d888d39cd3 100644
--- a/arch/powerpc/perf/callchain_32.c
+++ b/arch/powerpc/perf/callchain_32.c
@@ -11,7 +11,6 @@
 #include <linux/uaccess.h>
 #include <linux/mm.h>
 #include <asm/ptrace.h>
-#include <asm/pgtable.h>
 #include <asm/sigcontext.h>
 #include <asm/ucontext.h>
 #include <asm/vdso.h>
diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
index b63086b663ef..1bff896dea03 100644
--- a/arch/powerpc/perf/callchain_64.c
+++ b/arch/powerpc/perf/callchain_64.c
@@ -11,7 +11,6 @@
 #include <linux/uaccess.h>
 #include <linux/mm.h>
 #include <asm/ptrace.h>
-#include <asm/pgtable.h>
 #include <asm/sigcontext.h>
 #include <asm/ucontext.h>
 #include <asm/vdso.h>
diff --git a/arch/powerpc/platforms/8xx/cpm1.c b/arch/powerpc/platforms/8xx/cpm1.c
index 4db4ca2e1222..c58b6f1c40e3 100644
--- a/arch/powerpc/platforms/8xx/cpm1.c
+++ b/arch/powerpc/platforms/8xx/cpm1.c
@@ -34,7 +34,6 @@
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/8xx_immap.h>
 #include <asm/cpm1.h>
 #include <asm/io.h>
diff --git a/arch/powerpc/platforms/8xx/micropatch.c b/arch/powerpc/platforms/8xx/micropatch.c
index c80bd7afd6c5..aed4bc75f352 100644
--- a/arch/powerpc/platforms/8xx/micropatch.c
+++ b/arch/powerpc/platforms/8xx/micropatch.c
@@ -16,7 +16,6 @@
 #include <linux/interrupt.h>
 #include <asm/irq.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/8xx_immap.h>
 #include <asm/cpm.h>
 #include <asm/cpm1.h>
diff --git a/arch/powerpc/platforms/cell/setup.c b/arch/powerpc/platforms/cell/setup.c
index 855eedb8d7d7..edefa785d2ef 100644
--- a/arch/powerpc/platforms/cell/setup.c
+++ b/arch/powerpc/platforms/cell/setup.c
@@ -31,7 +31,6 @@
 #include <asm/mmu.h>
 #include <asm/processor.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/prom.h>
 #include <asm/rtas.h>
 #include <asm/pci-bridge.h>
diff --git a/arch/powerpc/platforms/chrp/setup.c b/arch/powerpc/platforms/chrp/setup.c
index 65a7e01a8f7d..c45435aa5e36 100644
--- a/arch/powerpc/platforms/chrp/setup.c
+++ b/arch/powerpc/platforms/chrp/setup.c
@@ -34,7 +34,6 @@
 #include <linux/timer.h>
 
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/prom.h>
 #include <asm/pci-bridge.h>
 #include <asm/dma.h>
diff --git a/arch/powerpc/platforms/maple/setup.c b/arch/powerpc/platforms/maple/setup.c
index 15b2c6eb506d..f7e66a2005b4 100644
--- a/arch/powerpc/platforms/maple/setup.c
+++ b/arch/powerpc/platforms/maple/setup.c
@@ -42,7 +42,6 @@
 #include <asm/processor.h>
 #include <asm/sections.h>
 #include <asm/prom.h>
-#include <asm/pgtable.h>
 #include <asm/io.h>
 #include <asm/pci-bridge.h>
 #include <asm/iommu.h>
diff --git a/arch/powerpc/platforms/maple/time.c b/arch/powerpc/platforms/maple/time.c
index 701c4e098fe9..78209bb7629c 100644
--- a/arch/powerpc/platforms/maple/time.c
+++ b/arch/powerpc/platforms/maple/time.c
@@ -23,7 +23,6 @@
 #include <asm/sections.h>
 #include <asm/prom.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/machdep.h>
 #include <asm/time.h>
 
diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index 95fb4feb6ccc..f002b0fa69b8 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -51,7 +51,6 @@
 #include <asm/reg.h>
 #include <asm/sections.h>
 #include <asm/prom.h>
-#include <asm/pgtable.h>
 #include <asm/io.h>
 #include <asm/pci-bridge.h>
 #include <asm/ohare.h>
diff --git a/arch/powerpc/platforms/powermac/time.c b/arch/powerpc/platforms/powermac/time.c
index b36ddee17c87..31d6213a6c8f 100644
--- a/arch/powerpc/platforms/powermac/time.c
+++ b/arch/powerpc/platforms/powermac/time.c
@@ -28,7 +28,6 @@
 #include <asm/sections.h>
 #include <asm/prom.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/machdep.h>
 #include <asm/time.h>
 #include <asm/nvram.h>
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 1b55e804927d..29f0f6a227b6 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -43,7 +43,6 @@
 #include <asm/mmu.h>
 #include <asm/processor.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 #include <asm/prom.h>
 #include <asm/rtas.h>
 #include <asm/pci-bridge.h>
diff --git a/arch/powerpc/sysdev/cpm2.c b/arch/powerpc/sysdev/cpm2.c
index 07718b9a2c99..68538b8329f7 100644
--- a/arch/powerpc/sysdev/cpm2.c
+++ b/arch/powerpc/sysdev/cpm2.c
@@ -39,7 +39,6 @@
 #include <asm/irq.h>
 #include <asm/mpc8260.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/cpm2.h>
 #include <asm/rheap.h>
 #include <asm/fs_pd.h>
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 64be69cb0b13..506fd93fcf1e 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -35,7 +35,6 @@
 #include <asm/machdep.h>
 #include <asm/xmon.h>
 #include <asm/processor.h>
-#include <asm/pgtable.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
 #include <asm/plpar_wrappers.h>
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 3e528312f615..f04373be54a6 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -22,7 +22,6 @@
 #include <asm/cpu_ops.h>
 #include <asm/setup.h>
 #include <asm/sections.h>
-#include <asm/pgtable.h>
 #include <asm/sbi.h>
 #include <asm/tlbflush.h>
 #include <asm/thread_info.h>
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index dfcaebc3928f..504b41d528cf 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -18,7 +18,6 @@
 #include <asm/tlbflush.h>
 #include <asm/sections.h>
 #include <asm/soc.h>
-#include <asm/pgtable.h>
 #include <asm/io.h>
 #include <asm/ptdump.h>
 
diff --git a/arch/s390/include/asm/tlbflush.h b/arch/s390/include/asm/tlbflush.h
index 82703e03f35d..2204704840ea 100644
--- a/arch/s390/include/asm/tlbflush.h
+++ b/arch/s390/include/asm/tlbflush.h
@@ -6,7 +6,6 @@
 #include <linux/sched.h>
 #include <asm/processor.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 
 /*
  * Flush all TLB entries on the local CPU.
diff --git a/arch/s390/kernel/machine_kexec.c b/arch/s390/kernel/machine_kexec.c
index 3a854cb5a4c6..93c6b8932fbd 100644
--- a/arch/s390/kernel/machine_kexec.c
+++ b/arch/s390/kernel/machine_kexec.c
@@ -16,7 +16,6 @@
 #include <linux/debug_locks.h>
 #include <asm/cio.h>
 #include <asm/setup.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/smp.h>
 #include <asm/ipl.h>
diff --git a/arch/s390/kernel/ptrace.c b/arch/s390/kernel/ptrace.c
index 994a8b86edae..ce60a459a143 100644
--- a/arch/s390/kernel/ptrace.c
+++ b/arch/s390/kernel/ptrace.c
@@ -25,7 +25,6 @@
 #include <linux/compat.h>
 #include <trace/syscall.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <linux/uaccess.h>
 #include <asm/unistd.h>
diff --git a/arch/s390/kernel/vdso.c b/arch/s390/kernel/vdso.c
index bcc9bdb39ba2..0e98a5d1bbfb 100644
--- a/arch/s390/kernel/vdso.c
+++ b/arch/s390/kernel/vdso.c
@@ -21,7 +21,6 @@
 #include <linux/memblock.h>
 #include <linux/compat.h>
 #include <asm/asm-offsets.h>
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
diff --git a/arch/s390/mm/dump_pagetables.c b/arch/s390/mm/dump_pagetables.c
index 5d67b81c704a..c2ac9b8ae612 100644
--- a/arch/s390/mm/dump_pagetables.c
+++ b/arch/s390/mm/dump_pagetables.c
@@ -6,7 +6,6 @@
 #include <linux/kasan.h>
 #include <asm/kasan.h>
 #include <asm/sections.h>
-#include <asm/pgtable.h>
 
 static unsigned long max_addr;
 
diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
index dedc28be27ab..2082323e2e59 100644
--- a/arch/s390/mm/fault.c
+++ b/arch/s390/mm/fault.c
@@ -33,7 +33,6 @@
 #include <linux/hugetlb.h>
 #include <asm/asm-offsets.h>
 #include <asm/diag.h>
-#include <asm/pgtable.h>
 #include <asm/gmap.h>
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index b11bcf4da531..6dc7c3b60ef6 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -33,7 +33,6 @@
 #include <linux/dma-direct.h>
 #include <asm/processor.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/dma.h>
 #include <asm/lowcore.h>
diff --git a/arch/s390/mm/pageattr.c b/arch/s390/mm/pageattr.c
index e22c06d5f206..732c12145d04 100644
--- a/arch/s390/mm/pageattr.c
+++ b/arch/s390/mm/pageattr.c
@@ -7,7 +7,6 @@
 #include <linux/mm.h>
 #include <asm/cacheflush.h>
 #include <asm/facility.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/page.h>
 #include <asm/set_memory.h>
diff --git a/arch/s390/mm/pgtable.c b/arch/s390/mm/pgtable.c
index 9ebd01219812..2e0cc19f4cd7 100644
--- a/arch/s390/mm/pgtable.c
+++ b/arch/s390/mm/pgtable.c
@@ -19,7 +19,6 @@
 #include <linux/ksm.h>
 #include <linux/mman.h>
 
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
 #include <asm/tlbflush.h>
diff --git a/arch/s390/mm/vmem.c b/arch/s390/mm/vmem.c
index f810930aff42..8b6282cf7d13 100644
--- a/arch/s390/mm/vmem.c
+++ b/arch/s390/mm/vmem.c
@@ -13,7 +13,6 @@
 #include <linux/slab.h>
 #include <asm/cacheflush.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/setup.h>
 #include <asm/tlbflush.h>
 #include <asm/sections.h>
diff --git a/arch/sh/kernel/machine_kexec.c b/arch/sh/kernel/machine_kexec.c
index 63d63a36f6f2..4a98980b8a07 100644
--- a/arch/sh/kernel/machine_kexec.c
+++ b/arch/sh/kernel/machine_kexec.c
@@ -14,7 +14,6 @@
 #include <linux/ftrace.h>
 #include <linux/suspend.h>
 #include <linux/memblock.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/mmu_context.h>
 #include <asm/io.h>
diff --git a/arch/sh/kernel/process_64.c b/arch/sh/kernel/process_64.c
index 4c2144225c8e..19d25a6f5d4a 100644
--- a/arch/sh/kernel/process_64.c
+++ b/arch/sh/kernel/process_64.c
@@ -27,7 +27,6 @@
 #include <linux/sched/task_stack.h>
 #include <asm/syscalls.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/mmu_context.h>
 #include <asm/fpu.h>
 #include <asm/switch_to.h>
diff --git a/arch/sh/kernel/ptrace_32.c b/arch/sh/kernel/ptrace_32.c
index d5052c30a0e9..64bfb714943e 100644
--- a/arch/sh/kernel/ptrace_32.c
+++ b/arch/sh/kernel/ptrace_32.c
@@ -25,7 +25,6 @@
 #include <linux/regset.h>
 #include <linux/hw_breakpoint.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/mmu_context.h>
 #include <asm/syscalls.h>
diff --git a/arch/sh/kernel/ptrace_64.c b/arch/sh/kernel/ptrace_64.c
index 11085e48eaa6..8c79221aab2a 100644
--- a/arch/sh/kernel/ptrace_64.c
+++ b/arch/sh/kernel/ptrace_64.c
@@ -31,7 +31,6 @@
 #include <linux/regset.h>
 #include <asm/io.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/mmu_context.h>
 #include <asm/syscalls.h>
diff --git a/arch/sh/kernel/signal_32.c b/arch/sh/kernel/signal_32.c
index 24473fa6c3b6..a0fbb8427b39 100644
--- a/arch/sh/kernel/signal_32.c
+++ b/arch/sh/kernel/signal_32.c
@@ -28,7 +28,6 @@
 #include <linux/tracehook.h>
 #include <asm/ucontext.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/cacheflush.h>
 #include <asm/syscalls.h>
 #include <asm/fpu.h>
diff --git a/arch/sh/kernel/signal_64.c b/arch/sh/kernel/signal_64.c
index b9aaa9266b34..f629f1b4807f 100644
--- a/arch/sh/kernel/signal_64.c
+++ b/arch/sh/kernel/signal_64.c
@@ -21,7 +21,6 @@
 #include <linux/tracehook.h>
 #include <asm/ucontext.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/cacheflush.h>
 #include <asm/fpu.h>
 
diff --git a/arch/sh/kernel/traps_64.c b/arch/sh/kernel/traps_64.c
index 37046f3a26d3..463ba587b653 100644
--- a/arch/sh/kernel/traps_64.c
+++ b/arch/sh/kernel/traps_64.c
@@ -27,7 +27,6 @@
 #include <asm/io.h>
 #include <asm/alignment.h>
 #include <asm/processor.h>
-#include <asm/pgtable.h>
 #include <asm/fpu.h>
 
 static int read_opcode(reg_size_t pc, insn_size_t *result_opcode, int from_user_mode)
diff --git a/arch/sh/mm/cache-sh3.c b/arch/sh/mm/cache-sh3.c
index 8172a171d727..26f3bd43e850 100644
--- a/arch/sh/mm/cache-sh3.c
+++ b/arch/sh/mm/cache-sh3.c
@@ -12,7 +12,6 @@
 #include <linux/threads.h>
 #include <asm/addrspace.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/cache.h>
 #include <asm/io.h>
diff --git a/arch/sh/mm/cache-sh4.c b/arch/sh/mm/cache-sh4.c
index 45943bcb7042..ed599dadd698 100644
--- a/arch/sh/mm/cache-sh4.c
+++ b/arch/sh/mm/cache-sh4.c
@@ -16,7 +16,6 @@
 #include <linux/mutex.h>
 #include <linux/fs.h>
 #include <linux/highmem.h>
-#include <asm/pgtable.h>
 #include <asm/mmu_context.h>
 #include <asm/cache_insns.h>
 #include <asm/cacheflush.h>
diff --git a/arch/sh/mm/cache-sh7705.c b/arch/sh/mm/cache-sh7705.c
index ed25eba80667..48978293226c 100644
--- a/arch/sh/mm/cache-sh7705.c
+++ b/arch/sh/mm/cache-sh7705.c
@@ -16,7 +16,6 @@
 #include <linux/threads.h>
 #include <asm/addrspace.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/cache.h>
 #include <asm/io.h>
diff --git a/arch/sh/mm/nommu.c b/arch/sh/mm/nommu.c
index dca946f426c6..8b4504413c5f 100644
--- a/arch/sh/mm/nommu.c
+++ b/arch/sh/mm/nommu.c
@@ -10,7 +10,6 @@
 #include <linux/init.h>
 #include <linux/string.h>
 #include <linux/mm.h>
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/page.h>
 #include <linux/uaccess.h>
diff --git a/arch/sparc/kernel/leon_smp.c b/arch/sparc/kernel/leon_smp.c
index da6f1486318e..41829c024f92 100644
--- a/arch/sparc/kernel/leon_smp.c
+++ b/arch/sparc/kernel/leon_smp.c
@@ -39,7 +39,6 @@
 #include <asm/irq.h>
 #include <asm/page.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/oplib.h>
 #include <asm/cpudata.h>
 #include <asm/asi.h>
diff --git a/arch/sparc/kernel/process_32.c b/arch/sparc/kernel/process_32.c
index 65c0d5207b0c..13cb5638fab8 100644
--- a/arch/sparc/kernel/process_32.c
+++ b/arch/sparc/kernel/process_32.c
@@ -35,7 +35,6 @@
 #include <linux/uaccess.h>
 #include <asm/page.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/delay.h>
 #include <asm/processor.h>
 #include <asm/psr.h>
diff --git a/arch/sparc/kernel/process_64.c b/arch/sparc/kernel/process_64.c
index b2e3fe729b7e..ddab6c87c306 100644
--- a/arch/sparc/kernel/process_64.c
+++ b/arch/sparc/kernel/process_64.c
@@ -41,7 +41,6 @@
 #include <linux/uaccess.h>
 #include <asm/page.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/pstate.h>
 #include <asm/elf.h>
diff --git a/arch/sparc/kernel/ptrace_32.c b/arch/sparc/kernel/ptrace_32.c
index 16b50afe7b52..6aa5e923600c 100644
--- a/arch/sparc/kernel/ptrace_32.c
+++ b/arch/sparc/kernel/ptrace_32.c
@@ -23,7 +23,6 @@
 #include <linux/elf.h>
 #include <linux/tracehook.h>
 
-#include <asm/pgtable.h>
 #include <linux/uaccess.h>
 #include <asm/cacheflush.h>
 
diff --git a/arch/sparc/kernel/ptrace_64.c b/arch/sparc/kernel/ptrace_64.c
index c9d41a96468f..151b28e933ae 100644
--- a/arch/sparc/kernel/ptrace_64.c
+++ b/arch/sparc/kernel/ptrace_64.c
@@ -32,7 +32,6 @@
 #include <linux/context_tracking.h>
 
 #include <asm/asi.h>
-#include <asm/pgtable.h>
 #include <linux/uaccess.h>
 #include <asm/psrcompat.h>
 #include <asm/visasm.h>
diff --git a/arch/sparc/kernel/setup_32.c b/arch/sparc/kernel/setup_32.c
index 5d1bcfce05d8..6d07b85b9e24 100644
--- a/arch/sparc/kernel/setup_32.c
+++ b/arch/sparc/kernel/setup_32.c
@@ -40,7 +40,6 @@
 #include <asm/processor.h>
 #include <asm/oplib.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/traps.h>
 #include <asm/vaddrs.h>
 #include <asm/mbus.h>
diff --git a/arch/sparc/kernel/setup_64.c b/arch/sparc/kernel/setup_64.c
index 75e3992203b6..f765fda871eb 100644
--- a/arch/sparc/kernel/setup_64.c
+++ b/arch/sparc/kernel/setup_64.c
@@ -39,7 +39,6 @@
 #include <asm/processor.h>
 #include <asm/oplib.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/idprom.h>
 #include <asm/head.h>
 #include <asm/starfire.h>
diff --git a/arch/sparc/kernel/signal32.c b/arch/sparc/kernel/signal32.c
index 2a734ecd0a40..e2c6f0abda00 100644
--- a/arch/sparc/kernel/signal32.c
+++ b/arch/sparc/kernel/signal32.c
@@ -24,7 +24,6 @@
 
 #include <linux/uaccess.h>
 #include <asm/ptrace.h>
-#include <asm/pgtable.h>
 #include <asm/psrcompat.h>
 #include <asm/fpumacro.h>
 #include <asm/visasm.h>
diff --git a/arch/sparc/kernel/signal_32.c b/arch/sparc/kernel/signal_32.c
index 42c3de313fd6..3b005b6c3e0f 100644
--- a/arch/sparc/kernel/signal_32.c
+++ b/arch/sparc/kernel/signal_32.c
@@ -24,7 +24,6 @@
 #include <linux/uaccess.h>
 #include <asm/ptrace.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/cacheflush.h>	/* flush_sig_insns */
 #include <asm/switch_to.h>
 
diff --git a/arch/sparc/kernel/signal_64.c b/arch/sparc/kernel/signal_64.c
index 69ae814b7e90..6937339a272c 100644
--- a/arch/sparc/kernel/signal_64.c
+++ b/arch/sparc/kernel/signal_64.c
@@ -25,7 +25,6 @@
 
 #include <linux/uaccess.h>
 #include <asm/ptrace.h>
-#include <asm/pgtable.h>
 #include <asm/fpumacro.h>
 #include <asm/uctx.h>
 #include <asm/siginfo.h>
diff --git a/arch/sparc/kernel/smp_32.c b/arch/sparc/kernel/smp_32.c
index e078680a1768..76ce290c67cf 100644
--- a/arch/sparc/kernel/smp_32.c
+++ b/arch/sparc/kernel/smp_32.c
@@ -30,7 +30,6 @@
 #include <asm/irq.h>
 #include <asm/page.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/oplib.h>
 #include <asm/cacheflush.h>
 #include <asm/tlbflush.h>
diff --git a/arch/sparc/kernel/smp_64.c b/arch/sparc/kernel/smp_64.c
index 80f20b3808ee..0085e28bf019 100644
--- a/arch/sparc/kernel/smp_64.c
+++ b/arch/sparc/kernel/smp_64.c
@@ -43,7 +43,6 @@
 #include <asm/irq.h>
 #include <asm/irq_regs.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/oplib.h>
 #include <linux/uaccess.h>
 #include <asm/starfire.h>
diff --git a/arch/sparc/kernel/traps_64.c b/arch/sparc/kernel/traps_64.c
index 96d92f107551..d92e5eaa4c1d 100644
--- a/arch/sparc/kernel/traps_64.c
+++ b/arch/sparc/kernel/traps_64.c
@@ -30,7 +30,6 @@
 #include <asm/ptrace.h>
 #include <asm/oplib.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/unistd.h>
 #include <linux/uaccess.h>
 #include <asm/fpumacro.h>
diff --git a/arch/sparc/mm/fault_32.c b/arch/sparc/mm/fault_32.c
index f6e0e601f857..9489513888eb 100644
--- a/arch/sparc/mm/fault_32.c
+++ b/arch/sparc/mm/fault_32.c
@@ -25,7 +25,6 @@
 #include <linux/uaccess.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/openprom.h>
 #include <asm/oplib.h>
 #include <asm/setup.h>
diff --git a/arch/sparc/mm/fault_64.c b/arch/sparc/mm/fault_64.c
index c0c0dd471b6b..d8cd85a5f4ca 100644
--- a/arch/sparc/mm/fault_64.c
+++ b/arch/sparc/mm/fault_64.c
@@ -27,7 +27,6 @@
 #include <linux/uaccess.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/openprom.h>
 #include <asm/oplib.h>
 #include <asm/asi.h>
diff --git a/arch/sparc/mm/hugetlbpage.c b/arch/sparc/mm/hugetlbpage.c
index 7b9fa861b67c..ec423b5f17dd 100644
--- a/arch/sparc/mm/hugetlbpage.c
+++ b/arch/sparc/mm/hugetlbpage.c
@@ -14,7 +14,6 @@
 
 #include <asm/mman.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/tlb.h>
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
diff --git a/arch/sparc/mm/init_32.c b/arch/sparc/mm/init_32.c
index 906eda1158b4..e45160839f79 100644
--- a/arch/sparc/mm/init_32.c
+++ b/arch/sparc/mm/init_32.c
@@ -29,7 +29,6 @@
 
 #include <asm/sections.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/vaddrs.h>
 #include <asm/setup.h>
 #include <asm/tlb.h>
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 2ef6826a6ca6..141614f19084 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -31,7 +31,6 @@
 #include <asm/head.h>
 #include <asm/page.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/oplib.h>
 #include <asm/iommu.h>
 #include <asm/io.h>
diff --git a/arch/sparc/mm/io-unit.c b/arch/sparc/mm/io-unit.c
index 08238d989cfd..4aeed580b4d4 100644
--- a/arch/sparc/mm/io-unit.c
+++ b/arch/sparc/mm/io-unit.c
@@ -16,7 +16,6 @@
 #include <linux/of_device.h>
 
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/io.h>
 #include <asm/io-unit.h>
 #include <asm/mxcc.h>
diff --git a/arch/sparc/mm/iommu.c b/arch/sparc/mm/iommu.c
index f1e08e30b64e..fa9e298fd985 100644
--- a/arch/sparc/mm/iommu.c
+++ b/arch/sparc/mm/iommu.c
@@ -17,7 +17,6 @@
 #include <linux/of_device.h>
 
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/io.h>
 #include <asm/mxcc.h>
 #include <asm/mbus.h>
diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index cc071dd7d8da..30648c1f8786 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -28,7 +28,6 @@
 #include <asm/tlbflush.h>
 #include <asm/io-unit.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/bitext.h>
 #include <asm/vaddrs.h>
 #include <asm/cache.h>
diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
index 3d72d2deb13b..a32a16c18617 100644
--- a/arch/sparc/mm/tlb.c
+++ b/arch/sparc/mm/tlb.c
@@ -10,7 +10,6 @@
 #include <linux/swap.h>
 #include <linux/preempt.h>
 
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
diff --git a/arch/um/kernel/process.c b/arch/um/kernel/process.c
index cbe33af2a880..e3a2cf92a373 100644
--- a/arch/um/kernel/process.c
+++ b/arch/um/kernel/process.c
@@ -25,7 +25,6 @@
 #include <linux/threads.h>
 #include <linux/tracehook.h>
 #include <asm/current.h>
-#include <asm/pgtable.h>
 #include <asm/mmu_context.h>
 #include <linux/uaccess.h>
 #include <as-layout.h>
diff --git a/arch/um/kernel/skas/mmu.c b/arch/um/kernel/skas/mmu.c
index 3f0d9a573fd6..60ea924e551d 100644
--- a/arch/um/kernel/skas/mmu.c
+++ b/arch/um/kernel/skas/mmu.c
@@ -9,7 +9,6 @@
 #include <linux/slab.h>
 
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/sections.h>
 #include <as-layout.h>
 #include <os.h>
diff --git a/arch/um/kernel/skas/uaccess.c b/arch/um/kernel/skas/uaccess.c
index d617f8dc9c19..2dec915abe6f 100644
--- a/arch/um/kernel/skas/uaccess.c
+++ b/arch/um/kernel/skas/uaccess.c
@@ -10,7 +10,6 @@
 #include <linux/sched.h>
 #include <asm/current.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <kern_util.h>
 #include <os.h>
 
diff --git a/arch/um/kernel/tlb.c b/arch/um/kernel/tlb.c
index 80a358c6d652..ed7f024c7f2b 100644
--- a/arch/um/kernel/tlb.c
+++ b/arch/um/kernel/tlb.c
@@ -7,7 +7,6 @@
 #include <linux/module.h>
 #include <linux/sched/signal.h>
 
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 #include <as-layout.h>
 #include <mem_user.h>
diff --git a/arch/um/kernel/trap.c b/arch/um/kernel/trap.c
index 8f18cf56b3dd..b6ba694923e4 100644
--- a/arch/um/kernel/trap.c
+++ b/arch/um/kernel/trap.c
@@ -10,7 +10,6 @@
 #include <linux/uaccess.h>
 #include <linux/sched/debug.h>
 #include <asm/current.h>
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 #include <arch.h>
 #include <as-layout.h>
diff --git a/arch/um/kernel/um_arch.c b/arch/um/kernel/um_arch.c
index 375ab720e4aa..00141e70de56 100644
--- a/arch/um/kernel/um_arch.c
+++ b/arch/um/kernel/um_arch.c
@@ -14,7 +14,6 @@
 #include <linux/sched/task.h>
 #include <linux/kmsg_dump.h>
 
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/sections.h>
 #include <asm/setup.h>
diff --git a/arch/unicore32/kernel/module.c b/arch/unicore32/kernel/module.c
index 717ee1b78350..67c89ef2d6ee 100644
--- a/arch/unicore32/kernel/module.c
+++ b/arch/unicore32/kernel/module.c
@@ -16,7 +16,6 @@
 #include <linux/string.h>
 #include <linux/gfp.h>
 
-#include <asm/pgtable.h>
 #include <asm/sections.h>
 
 void *module_alloc(unsigned long size)
diff --git a/arch/unicore32/mm/fault.c b/arch/unicore32/mm/fault.c
index 3022104aa613..0549d5baa11b 100644
--- a/arch/unicore32/mm/fault.c
+++ b/arch/unicore32/mm/fault.c
@@ -17,7 +17,6 @@
 #include <linux/sched/signal.h>
 #include <linux/io.h>
 
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 
 /*
diff --git a/arch/x86/include/asm/iomap.h b/arch/x86/include/asm/iomap.h
index 2a7b3211ee7a..bacf68c4d70e 100644
--- a/arch/x86/include/asm/iomap.h
+++ b/arch/x86/include/asm/iomap.h
@@ -10,7 +10,6 @@
 #include <linux/mm.h>
 #include <linux/uaccess.h>
 #include <asm/cacheflush.h>
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 
 void __iomem *
diff --git a/arch/x86/include/asm/xen/page.h b/arch/x86/include/asm/xen/page.h
index 790ce08e41f2..5941e18edd5a 100644
--- a/arch/x86/include/asm/xen/page.h
+++ b/arch/x86/include/asm/xen/page.h
@@ -11,7 +11,6 @@
 
 #include <asm/extable.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 
 #include <xen/interface/xen.h>
 #include <xen/interface/grant_table.h>
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index cd617979b7fc..a9195ce8265d 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -18,7 +18,6 @@
 #include <asm/text-patching.h>
 #include <asm/alternative.h>
 #include <asm/sections.h>
-#include <asm/pgtable.h>
 #include <asm/mce.h>
 #include <asm/nmi.h>
 #include <asm/cacheflush.h>
diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index 5f816861f5d2..17cb5b933dcf 100644
--- a/arch/x86/kernel/amd_gart_64.c
+++ b/arch/x86/kernel/amd_gart_64.c
@@ -33,7 +33,6 @@
 #include <linux/atomic.h>
 #include <linux/dma-direct.h>
 #include <asm/mtrr.h>
-#include <asm/pgtable.h>
 #include <asm/proto.h>
 #include <asm/iommu.h>
 #include <asm/gart.h>
diff --git a/arch/x86/kernel/doublefault_32.c b/arch/x86/kernel/doublefault_32.c
index 3793646f0fb5..2ccc57f152a4 100644
--- a/arch/x86/kernel/doublefault_32.c
+++ b/arch/x86/kernel/doublefault_32.c
@@ -6,7 +6,6 @@
 #include <linux/fs.h>
 
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/desc.h>
 #include <asm/traps.h>
diff --git a/arch/x86/kernel/machine_kexec_32.c b/arch/x86/kernel/machine_kexec_32.c
index 02bddfc122a4..64b00b0d7fe8 100644
--- a/arch/x86/kernel/machine_kexec_32.c
+++ b/arch/x86/kernel/machine_kexec_32.c
@@ -13,7 +13,6 @@
 #include <linux/gfp.h>
 #include <linux/io.h>
 
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 #include <asm/mmu_context.h>
diff --git a/arch/x86/kernel/machine_kexec_64.c b/arch/x86/kernel/machine_kexec_64.c
index ad5cdd6a5f23..a29a44a98e5b 100644
--- a/arch/x86/kernel/machine_kexec_64.c
+++ b/arch/x86/kernel/machine_kexec_64.c
@@ -19,7 +19,6 @@
 #include <linux/efi.h>
 
 #include <asm/init.h>
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/mmu_context.h>
 #include <asm/io_apic.h>
diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
index 23c95a53d20e..34b153cbd4ac 100644
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@ -22,7 +22,6 @@
 
 #include <asm/text-patching.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/setup.h>
 #include <asm/unwind.h>
 
diff --git a/arch/x86/kernel/process_32.c b/arch/x86/kernel/process_32.c
index 538d4e8d6589..acfd6d2a0cbf 100644
--- a/arch/x86/kernel/process_32.c
+++ b/arch/x86/kernel/process_32.c
@@ -39,7 +39,6 @@
 #include <linux/kdebug.h>
 #include <linux/syscalls.h>
 
-#include <asm/pgtable.h>
 #include <asm/ldt.h>
 #include <asm/processor.h>
 #include <asm/fpu/internal.h>
diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
index 0c169a5687e1..9a97415b2139 100644
--- a/arch/x86/kernel/process_64.c
+++ b/arch/x86/kernel/process_64.c
@@ -40,7 +40,6 @@
 #include <linux/ftrace.h>
 #include <linux/syscalls.h>
 
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/fpu/internal.h>
 #include <asm/mmu_context.h>
diff --git a/arch/x86/kernel/ptrace.c b/arch/x86/kernel/ptrace.c
index f0e1ddbc2fd7..44130588987f 100644
--- a/arch/x86/kernel/ptrace.c
+++ b/arch/x86/kernel/ptrace.c
@@ -28,7 +28,6 @@
 #include <linux/nospec.h>
 
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/fpu/internal.h>
 #include <asm/fpu/signal.h>
diff --git a/arch/x86/kernel/tboot.c b/arch/x86/kernel/tboot.c
index b2942b2dbfcf..cbc0c82e55b7 100644
--- a/arch/x86/kernel/tboot.c
+++ b/arch/x86/kernel/tboot.c
@@ -23,7 +23,6 @@
 #include <asm/realmode.h>
 #include <asm/processor.h>
 #include <asm/bootparam.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/swiotlb.h>
 #include <asm/fixmap.h>
diff --git a/arch/x86/mm/dump_pagetables.c b/arch/x86/mm/dump_pagetables.c
index 69309cd56fdf..7d367830def0 100644
--- a/arch/x86/mm/dump_pagetables.c
+++ b/arch/x86/mm/dump_pagetables.c
@@ -19,7 +19,6 @@
 #include <linux/ptdump.h>
 
 #include <asm/e820/types.h>
-#include <asm/pgtable.h>
 
 /*
  * The dumper groups pagetable entries of the same type into one, and for
diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index 4222a010057a..6a821727ceaf 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -35,7 +35,6 @@
 #include <asm/bios_ebda.h>
 #include <asm/processor.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/dma.h>
 #include <asm/fixmap.h>
 #include <asm/e820/api.h>
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index c7a1c6c23431..74ea39c17425 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -37,7 +37,6 @@
 #include <asm/processor.h>
 #include <asm/bios_ebda.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/dma.h>
 #include <asm/fixmap.h>
diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
index 763e71abc0fe..1a50434c8a4d 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -17,7 +17,6 @@
 #include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 #include <asm/sections.h>
-#include <asm/pgtable.h>
 #include <asm/cpu_entry_area.h>
 
 extern struct range pfn_mapped[E820_MAX_ENTRIES];
diff --git a/arch/x86/mm/pat/cpa-test.c b/arch/x86/mm/pat/cpa-test.c
index facce271e8b9..0612a73638a8 100644
--- a/arch/x86/mm/pat/cpa-test.c
+++ b/arch/x86/mm/pat/cpa-test.c
@@ -14,7 +14,6 @@
 #include <linux/vmalloc.h>
 
 #include <asm/cacheflush.h>
-#include <asm/pgtable.h>
 #include <asm/kdebug.h>
 
 /*
diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index 394be8611748..8f665c352bf0 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -46,7 +46,6 @@
 #include <asm/processor.h>
 #include <asm/tlbflush.h>
 #include <asm/x86_init.h>
-#include <asm/pgtable.h>
 #include <asm/fcntl.h>
 #include <asm/e820/api.h>
 #include <asm/mtrr.h>
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index d88e9064c28e..dfd82f51ba66 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -3,7 +3,6 @@
 #include <linux/gfp.h>
 #include <linux/hugetlb.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/tlb.h>
 #include <asm/fixmap.h>
 #include <asm/mtrr.h>
diff --git a/arch/x86/mm/pgtable_32.c b/arch/x86/mm/pgtable_32.c
index e1ce59dc558f..1953685c2ddf 100644
--- a/arch/x86/mm/pgtable_32.c
+++ b/arch/x86/mm/pgtable_32.c
@@ -11,7 +11,6 @@
 #include <linux/spinlock.h>
 
 #include <asm/cpu_entry_area.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/fixmap.h>
 #include <asm/e820/api.h>
diff --git a/arch/x86/mm/pti.c b/arch/x86/mm/pti.c
index 843aa10a4cb6..934504118bc0 100644
--- a/arch/x86/mm/pti.c
+++ b/arch/x86/mm/pti.c
@@ -34,7 +34,6 @@
 #include <asm/vsyscall.h>
 #include <asm/cmdline.h>
 #include <asm/pti.h>
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 #include <asm/desc.h>
diff --git a/arch/x86/platform/efi/efi_64.c b/arch/x86/platform/efi/efi_64.c
index c5e393f8bb3f..8e364c4c6768 100644
--- a/arch/x86/platform/efi/efi_64.c
+++ b/arch/x86/platform/efi/efi_64.c
@@ -39,7 +39,6 @@
 #include <asm/setup.h>
 #include <asm/page.h>
 #include <asm/e820/api.h>
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/proto.h>
 #include <asm/efi.h>
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 507f4fb88fa7..c2c97faaf004 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -63,7 +63,6 @@
 #include <asm/setup.h>
 #include <asm/desc.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/reboot.h>
 #include <asm/stackprotector.h>
diff --git a/arch/x86/xen/grant-table.c b/arch/x86/xen/grant-table.c
index ecb0d5450334..4988e19598c8 100644
--- a/arch/x86/xen/grant-table.c
+++ b/arch/x86/xen/grant-table.c
@@ -21,7 +21,6 @@
 #include <xen/grant_table.h>
 #include <xen/xen.h>
 
-#include <asm/pgtable.h>
 
 static struct gnttab_vm_area {
 	struct vm_struct *area;
diff --git a/arch/xtensa/kernel/process.c b/arch/xtensa/kernel/process.c
index 3edecc41ef8c..b7fe6f443b42 100644
--- a/arch/xtensa/kernel/process.c
+++ b/arch/xtensa/kernel/process.c
@@ -37,7 +37,6 @@
 #include <linux/slab.h>
 #include <linux/rcupdate.h>
 
-#include <asm/pgtable.h>
 #include <linux/uaccess.h>
 #include <asm/io.h>
 #include <asm/processor.h>
diff --git a/arch/xtensa/kernel/ptrace.c b/arch/xtensa/kernel/ptrace.c
index 145742d70a9f..b4c07bd890fe 100644
--- a/arch/xtensa/kernel/ptrace.c
+++ b/arch/xtensa/kernel/ptrace.c
@@ -33,7 +33,6 @@
 #include <asm/coprocessor.h>
 #include <asm/elf.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/ptrace.h>
 
 static int gpr_get(struct task_struct *target,
diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
index 3880c765d448..d9204dc2656e 100644
--- a/arch/xtensa/kernel/setup.c
+++ b/arch/xtensa/kernel/setup.c
@@ -37,7 +37,6 @@
 #include <asm/bootparam.h>
 #include <asm/kasan.h>
 #include <asm/mmu_context.h>
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/timex.h>
 #include <asm/platform.h>
diff --git a/drivers/char/agp/frontend.c b/drivers/char/agp/frontend.c
index 47098648502d..00ff5fcb808a 100644
--- a/drivers/char/agp/frontend.c
+++ b/drivers/char/agp/frontend.c
@@ -39,7 +39,6 @@
 #include <linux/fs.h>
 #include <linux/sched.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include "agp.h"
 
 struct agp_front_data agp_fe;
diff --git a/drivers/char/agp/generic.c b/drivers/char/agp/generic.c
index 9e84239f88d4..3ffbb1c80c5c 100644
--- a/drivers/char/agp/generic.c
+++ b/drivers/char/agp/generic.c
@@ -42,7 +42,6 @@
 #ifdef CONFIG_X86
 #include <asm/set_memory.h>
 #endif
-#include <asm/pgtable.h>
 #include "agp.h"
 
 __u32 *agp_gatt_table;
diff --git a/drivers/char/bsr.c b/drivers/char/bsr.c
index e5e5333f302d..cce2af5df7b4 100644
--- a/drivers/char/bsr.c
+++ b/drivers/char/bsr.c
@@ -17,7 +17,6 @@
 #include <linux/list.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
-#include <asm/pgtable.h>
 #include <asm/io.h>
 
 /*
diff --git a/drivers/char/mspec.c b/drivers/char/mspec.c
index 7d583222e8fa..d620e48bb8f7 100644
--- a/drivers/char/mspec.c
+++ b/drivers/char/mspec.c
@@ -39,7 +39,6 @@
 #include <linux/numa.h>
 #include <linux/refcount.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <linux/atomic.h>
 #include <asm/tlbflush.h>
 #include <asm/uncached.h>
diff --git a/drivers/gpu/drm/i915/i915_mm.c b/drivers/gpu/drm/i915/i915_mm.c
index b6376b25ef63..43039dc8c607 100644
--- a/drivers/gpu/drm/i915/i915_mm.c
+++ b/drivers/gpu/drm/i915/i915_mm.c
@@ -25,7 +25,6 @@
 #include <linux/mm.h>
 #include <linux/io-mapping.h>
 
-#include <asm/pgtable.h>
 
 #include "i915_drv.h"
 
diff --git a/drivers/infiniband/sw/rdmavt/mmap.c b/drivers/infiniband/sw/rdmavt/mmap.c
index 37853aa3bcf7..f5d0e33cf3d7 100644
--- a/drivers/infiniband/sw/rdmavt/mmap.c
+++ b/drivers/infiniband/sw/rdmavt/mmap.c
@@ -48,7 +48,6 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include <linux/mm.h>
-#include <asm/pgtable.h>
 #include <rdma/uverbs_ioctl.h>
 #include "mmap.h"
 
diff --git a/drivers/infiniband/sw/rxe/rxe_mmap.c b/drivers/infiniband/sw/rxe/rxe_mmap.c
index 6a413d73b95d..7887f623f62c 100644
--- a/drivers/infiniband/sw/rxe/rxe_mmap.c
+++ b/drivers/infiniband/sw/rxe/rxe_mmap.c
@@ -35,7 +35,6 @@
 #include <linux/vmalloc.h>
 #include <linux/mm.h>
 #include <linux/errno.h>
-#include <asm/pgtable.h>
 #include <rdma/uverbs_ioctl.h>
 
 #include "rxe.h"
diff --git a/drivers/media/platform/davinci/vpbe_display.c b/drivers/media/platform/davinci/vpbe_display.c
index 38d3088d4d38..7ab13eb7527d 100644
--- a/drivers/media/platform/davinci/vpbe_display.c
+++ b/drivers/media/platform/davinci/vpbe_display.c
@@ -17,7 +17,6 @@
 #include <linux/videodev2.h>
 #include <linux/slab.h>
 
-#include <asm/pgtable.h>
 
 #include <media/v4l2-dev.h>
 #include <media/v4l2-common.h>
diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 9e8eb45a5b03..3dc17ebe14fa 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -41,7 +41,6 @@
 #include <linux/string.h>
 #include <linux/errno.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/io.h>
 #include <asm/div64.h>
 #include <media/v4l2-common.h>
diff --git a/drivers/misc/sgi-gru/grufault.c b/drivers/misc/sgi-gru/grufault.c
index 4b713a80b572..ddd7312e7c0c 100644
--- a/drivers/misc/sgi-gru/grufault.c
+++ b/drivers/misc/sgi-gru/grufault.c
@@ -21,7 +21,6 @@
 #include <linux/uaccess.h>
 #include <linux/security.h>
 #include <linux/prefetch.h>
-#include <asm/pgtable.h>
 #include "gru.h"
 #include "grutables.h"
 #include "grulib.h"
diff --git a/drivers/net/ethernet/sun/sunhme.c b/drivers/net/ethernet/sun/sunhme.c
index f0fe7bb2a750..54b53dbdb33c 100644
--- a/drivers/net/ethernet/sun/sunhme.c
+++ b/drivers/net/ethernet/sun/sunhme.c
@@ -52,7 +52,6 @@
 #endif
 #include <linux/uaccess.h>
 
-#include <asm/pgtable.h>
 #include <asm/irq.h>
 
 #ifdef CONFIG_PCI
diff --git a/drivers/sbus/char/flash.c b/drivers/sbus/char/flash.c
index 4147d22fd448..3adfef210d8e 100644
--- a/drivers/sbus/char/flash.c
+++ b/drivers/sbus/char/flash.c
@@ -17,7 +17,6 @@
 #include <linux/of_device.h>
 
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/io.h>
 #include <asm/upa.h>
 
diff --git a/drivers/sbus/char/uctrl.c b/drivers/sbus/char/uctrl.c
index 37d252f2548d..05de0ce79cb9 100644
--- a/drivers/sbus/char/uctrl.c
+++ b/drivers/sbus/char/uctrl.c
@@ -21,7 +21,6 @@
 #include <asm/oplib.h>
 #include <asm/irq.h>
 #include <asm/io.h>
-#include <asm/pgtable.h>
 
 #define DEBUG 1
 #ifdef DEBUG
diff --git a/drivers/scsi/a2091.c b/drivers/scsi/a2091.c
index 564b35473672..5853db36eceb 100644
--- a/drivers/scsi/a2091.c
+++ b/drivers/scsi/a2091.c
@@ -9,7 +9,6 @@
 #include <linux/module.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/amigaints.h>
 #include <asm/amigahw.h>
 
diff --git a/drivers/scsi/a3000.c b/drivers/scsi/a3000.c
index b6a0432f305a..86f1da22aaa5 100644
--- a/drivers/scsi/a3000.c
+++ b/drivers/scsi/a3000.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/amigaints.h>
 #include <asm/amigahw.h>
 
diff --git a/drivers/scsi/gvp11.c b/drivers/scsi/gvp11.c
index 11df0eca0293..727f8c8f30b5 100644
--- a/drivers/scsi/gvp11.c
+++ b/drivers/scsi/gvp11.c
@@ -9,7 +9,6 @@
 #include <linux/module.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/amigaints.h>
 #include <asm/amigahw.h>
 
diff --git a/drivers/scsi/lasi700.c b/drivers/scsi/lasi700.c
index c48a73a0f517..de71d240a56f 100644
--- a/drivers/scsi/lasi700.c
+++ b/drivers/scsi/lasi700.c
@@ -31,7 +31,6 @@
 #include <linux/slab.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/irq.h>
 #include <asm/hardware.h>
 #include <asm/parisc-device.h>
diff --git a/drivers/scsi/mvme147.c b/drivers/scsi/mvme147.c
index ca96d6d9c350..869b8b058a43 100644
--- a/drivers/scsi/mvme147.c
+++ b/drivers/scsi/mvme147.c
@@ -8,7 +8,6 @@
 #include <linux/module.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/mvme147hw.h>
 #include <asm/irq.h>
 
diff --git a/drivers/scsi/sni_53c710.c b/drivers/scsi/sni_53c710.c
index f8397978f8ab..03d43f016397 100644
--- a/drivers/scsi/sni_53c710.c
+++ b/drivers/scsi/sni_53c710.c
@@ -28,7 +28,6 @@
 #include <linux/platform_device.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/irq.h>
 #include <asm/delay.h>
 
diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 00dddf6e08b0..504cda38763e 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -24,7 +24,6 @@
 #include <asm/io.h>
 #include <linux/uaccess.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/gio_device.h>
 
 #include <video/newport.h>
diff --git a/drivers/video/fbdev/acornfb.c b/drivers/video/fbdev/acornfb.c
index a3af49529173..09a9ad901dad 100644
--- a/drivers/video/fbdev/acornfb.c
+++ b/drivers/video/fbdev/acornfb.c
@@ -30,7 +30,6 @@
 #include <mach/hardware.h>
 #include <asm/irq.h>
 #include <asm/mach-types.h>
-#include <asm/pgtable.h>
 
 #include "acornfb.h"
 
diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index 51f5d1c56fd9..f253daa05d9d 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -58,7 +58,6 @@
 
 #include <asm/setup.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/irq.h>
 #include <asm/io.h>
 
diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index c3a3e344cee3..3df64a973194 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -42,7 +42,6 @@
 #include <linux/delay.h>
 #include <linux/fb.h>
 #include <linux/init.h>
-#include <asm/pgtable.h>
 
 #ifdef CONFIG_ZORRO
 #include <linux/zorro.h>
diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 513f58f28b0f..42d37bed518a 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -47,7 +47,6 @@
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
 
-#include <asm/pgtable.h>
 
 #ifdef __arm__
 #include <asm/mach-types.h>
diff --git a/drivers/video/fbdev/fb-puv3.c b/drivers/video/fbdev/fb-puv3.c
index 75df6aabac21..030e85c11a78 100644
--- a/drivers/video/fbdev/fb-puv3.c
+++ b/drivers/video/fbdev/fb-puv3.c
@@ -18,7 +18,6 @@
 #include <linux/mm.h>
 
 #include <linux/sizes.h>
-#include <asm/pgtable.h>
 #include <mach/hardware.h>
 
 /* Platform_data reserved for unifb registers. */
diff --git a/drivers/video/fbdev/hitfb.c b/drivers/video/fbdev/hitfb.c
index 009e5d2aa100..bbb0f1d953cc 100644
--- a/drivers/video/fbdev/hitfb.c
+++ b/drivers/video/fbdev/hitfb.c
@@ -23,7 +23,6 @@
 
 #include <asm/machvec.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/io.h>
 #include <asm/hd64461.h>
 #include <cpu/dac.h>
diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
index e6ea853c1723..f5a676bfd67a 100644
--- a/drivers/video/fbdev/neofb.c
+++ b/drivers/video/fbdev/neofb.c
@@ -70,7 +70,6 @@
 
 #include <asm/io.h>
 #include <asm/irq.h>
-#include <asm/pgtable.h>
 #include <video/vga.h>
 #include <video/neomagic.h>
 
diff --git a/drivers/video/fbdev/q40fb.c b/drivers/video/fbdev/q40fb.c
index 79ff14a35c85..079a2a7fb2c5 100644
--- a/drivers/video/fbdev/q40fb.c
+++ b/drivers/video/fbdev/q40fb.c
@@ -23,7 +23,6 @@
 #include <asm/q40_master.h>
 #include <linux/fb.h>
 #include <linux/module.h>
-#include <asm/pgtable.h>
 
 #define Q40_PHYS_SCREEN_ADDR 0xFE800000
 
diff --git a/drivers/video/fbdev/savage/savagefb_driver.c b/drivers/video/fbdev/savage/savagefb_driver.c
index aab312a7d9da..3c8ae87f0ea7 100644
--- a/drivers/video/fbdev/savage/savagefb_driver.c
+++ b/drivers/video/fbdev/savage/savagefb_driver.c
@@ -55,7 +55,6 @@
 
 #include <asm/io.h>
 #include <asm/irq.h>
-#include <asm/pgtable.h>
 
 #include "savagefb.h"
 
diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 0c142bcab79d..77c57568e5d7 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -59,7 +59,6 @@
 
 #include <asm/page.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/tlb.h>
 
 #include <asm/xen/hypervisor.h>
diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 7b36b51cdb9f..8d06bf1cc347 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -64,7 +64,6 @@
 #include <asm/xen/hypercall.h>
 #include <asm/xen/interface.h>
 
-#include <asm/pgtable.h>
 #include <asm/sync_bitops.h>
 
 /* External tools reserve first few grant table entries. */
diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index b8ccb8990bfd..989ae9bd02c0 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -26,7 +26,6 @@
 #include <linux/moduleparam.h>
 
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 #include <asm/xen/hypervisor.h>
 #include <asm/xen/hypercall.h>
 
diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 8c4d05b687b7..dc81e9926a76 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -51,7 +51,6 @@
 #include <linux/module.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/xen/hypervisor.h>
 
 #include <xen/xen.h>
diff --git a/drivers/xen/xenbus/xenbus_probe_backend.c b/drivers/xen/xenbus/xenbus_probe_backend.c
index 9b2fbe69bccc..2ba699897e6d 100644
--- a/drivers/xen/xenbus/xenbus_probe_backend.c
+++ b/drivers/xen/xenbus/xenbus_probe_backend.c
@@ -48,7 +48,6 @@
 #include <linux/semaphore.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/xen/hypervisor.h>
 #include <asm/hypervisor.h>
 #include <xen/xenbus.h>
diff --git a/drivers/xen/xenbus/xenbus_probe_frontend.c b/drivers/xen/xenbus/xenbus_probe_frontend.c
index 8a1650bbe18f..15379089853b 100644
--- a/drivers/xen/xenbus/xenbus_probe_frontend.c
+++ b/drivers/xen/xenbus/xenbus_probe_frontend.c
@@ -19,7 +19,6 @@
 #include <linux/module.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/xen/hypervisor.h>
 #include <xen/xenbus.h>
 #include <xen/events.h>
diff --git a/fs/proc/array.c b/fs/proc/array.c
index c4ac25fdb230..f8d152abcdec 100644
--- a/fs/proc/array.c
+++ b/fs/proc/array.c
@@ -92,7 +92,6 @@
 #include <linux/user_namespace.h>
 #include <linux/fs_struct.h>
 
-#include <asm/pgtable.h>
 #include <asm/processor.h>
 #include "internal.h"
 
diff --git a/fs/proc/meminfo.c b/fs/proc/meminfo.c
index 8c1f1bb1a5ce..4463dabce534 100644
--- a/fs/proc/meminfo.c
+++ b/fs/proc/meminfo.c
@@ -17,7 +17,6 @@
 #include <linux/cma.h>
 #endif
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include "internal.h"
 
 void __attribute__((weak)) arch_report_meminfo(struct seq_file *m)
diff --git a/fs/proc/nommu.c b/fs/proc/nommu.c
index 14c2badb8fd9..13452b32e2bd 100644
--- a/fs/proc/nommu.c
+++ b/fs/proc/nommu.c
@@ -22,7 +22,6 @@
 #include <linux/hugetlb.h>
 #include <linux/vmalloc.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 #include <asm/tlb.h>
 #include <asm/div64.h>
 #include "internal.h"
diff --git a/fs/proc/vmcore.c b/fs/proc/vmcore.c
index c663202da8de..c3a345c28a93 100644
--- a/fs/proc/vmcore.c
+++ b/fs/proc/vmcore.c
@@ -27,7 +27,6 @@
 #include <linux/pagemap.h>
 #include <linux/uaccess.h>
 #include <linux/mem_encrypt.h>
-#include <asm/pgtable.h>
 #include <asm/io.h>
 #include "internal.h"
 
diff --git a/include/linux/dax.h b/include/linux/dax.h
index d7af5d243f24..6904d4e0b2e0 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -5,7 +5,6 @@
 #include <linux/fs.h>
 #include <linux/mm.h>
 #include <linux/radix-tree.h>
-#include <asm/pgtable.h>
 
 /* Flag for synchronous flush */
 #define DAXDEV_F_SYNC (1UL << 0)
diff --git a/init/init_task.c b/init/init_task.c
index 537c70cc0d0f..d8eb009ff65a 100644
--- a/init/init_task.c
+++ b/init/init_task.c
@@ -12,7 +12,6 @@
 #include <linux/audit.h>
 #include <linux/numa.h>
 
-#include <asm/pgtable.h>
 #include <linux/uaccess.h>
 
 static struct signal_struct init_signals = {
diff --git a/kernel/exit.c b/kernel/exit.c
index 237e21d9202f..24eed0bff0a7 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -66,7 +66,6 @@
 
 #include <linux/uaccess.h>
 #include <asm/unistd.h>
-#include <asm/pgtable.h>
 #include <asm/mmu_context.h>
 
 static void __unhash_process(struct task_struct *p, bool group_dead)
diff --git a/kernel/fork.c b/kernel/fork.c
index a773bdd67289..7a7c6935b634 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -95,7 +95,6 @@
 #include <linux/stackleak.h>
 #include <linux/kasan.h>
 
-#include <asm/pgtable.h>
 #include <asm/pgalloc.h>
 #include <linux/uaccess.h>
 #include <asm/mmu_context.h>
diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
index 659800157b17..881128b9351e 100644
--- a/kernel/power/snapshot.c
+++ b/kernel/power/snapshot.c
@@ -34,7 +34,6 @@
 
 #include <linux/uaccess.h>
 #include <asm/mmu_context.h>
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 #include <asm/io.h>
 
diff --git a/lib/ioremap.c b/lib/ioremap.c
index 3f0e18543de8..4b33fd7c69fe 100644
--- a/lib/ioremap.c
+++ b/lib/ioremap.c
@@ -12,7 +12,6 @@
 #include <linux/io.h>
 #include <linux/export.h>
 #include <asm/cacheflush.h>
-#include <asm/pgtable.h>
 
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
 static int __read_mostly ioremap_p4d_capable;
diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 188c18908964..9ec59c38d6a2 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -28,7 +28,6 @@
 #include <linux/start_kernel.h>
 #include <linux/sched/mm.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 
 #define VMFLAGS	(VM_READ|VM_WRITE|VM_EXEC)
 
diff --git a/mm/gup.c b/mm/gup.c
index 0d64ea82b4c5..85e72889e8a3 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -19,7 +19,6 @@
 #include <linux/sched/mm.h>
 
 #include <asm/mmu_context.h>
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 
 #include "internal.h"
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index dcb34d7f5562..f102eb82f81d 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -31,7 +31,6 @@
 #include <linux/cma.h>
 
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/tlb.h>
 
 #include <linux/io.h>
diff --git a/mm/memory.c b/mm/memory.c
index 7f19a73db0f0..9ab00dcb95d4 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -80,7 +80,6 @@
 #include <linux/uaccess.h>
 #include <asm/tlb.h>
 #include <asm/tlbflush.h>
-#include <asm/pgtable.h>
 
 #include "internal.h"
 
diff --git a/mm/page_io.c b/mm/page_io.c
index 26935db0676c..44f8fdd8283a 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -25,7 +25,6 @@
 #include <linux/psi.h>
 #include <linux/uio.h>
 #include <linux/sched/task.h>
-#include <asm/pgtable.h>
 
 static struct bio *get_swap_bio(gfp_t gfp_flags,
 				struct page *page, bio_end_io_t end_io)
diff --git a/mm/shmem.c b/mm/shmem.c
index e83de27ce8f4..a8ae38f4f2e2 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -82,7 +82,6 @@ static struct vfsmount *shm_mnt;
 #include <linux/uuid.h>
 
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 
 #include "internal.h"
 
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 200aef686722..0db7738d76e9 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -29,7 +29,6 @@
 #include <linux/sched.h>
 #include <asm/dma.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 
 /*
  * Allocate a block of memory to be used to back the virtual memory map
diff --git a/mm/sparse.c b/mm/sparse.c
index 6284328cd9f2..b2b9a3e34696 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -17,7 +17,6 @@
 #include "internal.h"
 #include <asm/dma.h>
 #include <asm/pgalloc.h>
-#include <asm/pgtable.h>
 
 /*
  * Permanent SPARSEMEM data:
diff --git a/mm/swap_state.c b/mm/swap_state.c
index 3a66ed4e3574..b2cd8ebddd6b 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -22,7 +22,6 @@
 #include <linux/swap_slots.h>
 #include <linux/huge_mm.h>
 
-#include <asm/pgtable.h>
 
 /*
  * swapper_space is a fiction, retained to simplify the path through
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 3bc7acc68ba8..8488b2e39ca7 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -40,7 +40,6 @@
 #include <linux/swap_slots.h>
 #include <linux/sort.h>
 
-#include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 #include <linux/swapops.h>
 #include <linux/swap_cgroup.h>
diff --git a/mm/vmacache.c b/mm/vmacache.c
index ceedbab82106..01a6e6688ec1 100644
--- a/mm/vmacache.c
+++ b/mm/vmacache.c
@@ -6,7 +6,6 @@
 #include <linux/sched/task.h>
 #include <linux/mm.h>
 #include <linux/vmacache.h>
-#include <asm/pgtable.h>
 
 /*
  * Hash based on the pmd of addr if configured with MMU, which provides a good
diff --git a/sound/core/sgbuf.c b/sound/core/sgbuf.c
index feefdfc3bcca..c42217e2dd19 100644
--- a/sound/core/sgbuf.c
+++ b/sound/core/sgbuf.c
@@ -9,7 +9,6 @@
 #include <linux/mm.h>
 #include <linux/vmalloc.h>
 #include <linux/export.h>
-#include <asm/pgtable.h>
 #include <sound/memalloc.h>
 
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 33e1eee96f75..6c7af48b063e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -55,7 +55,6 @@
 #include <asm/processor.h>
 #include <asm/ioctl.h>
 #include <linux/uaccess.h>
-#include <asm/pgtable.h>
 
 #include "coalesced_mmio.h"
 #include "async_pf.h"
-- 
2.26.1

