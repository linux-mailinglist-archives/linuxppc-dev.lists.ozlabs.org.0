Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFA566519
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 05:39:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lJYv5MKxzDqXr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 13:38:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.alibaba.com
 (client-ip=115.124.30.130; helo=out30-130.freemail.mail.aliyun.com;
 envelope-from=alex.shi@linux.alibaba.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.alibaba.com
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lGqg3Qw9zDql9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 12:20:40 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R591e4; CH=green; DM=||false|;
 FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420; MF=alex.shi@linux.alibaba.com; NM=1;
 PH=DS; RN=18; SR=0; TI=SMTPD_---0TWfIdRd_1562898026; 
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com
 fp:SMTPD_---0TWfIdRd_1562898026) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 12 Jul 2019 10:20:27 +0800
From: Alex Shi <alex.shi@linux.alibaba.com>
To: linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 01/12] Documentation: move architectures together
Date: Fri, 12 Jul 2019 10:20:07 +0800
Message-Id: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 12 Jul 2019 13:28:54 +1000
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
Cc: linux-s390@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Alex Shi <alex.shi@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are many different archs in Documentation/ dir, it's better to
move them together in 'Documentation/arch' which follows from kernel source.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-omap@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-ia64@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: kvm@vger.kernel.org
Cc: linux-sh@vger.kernel.org
---
 Documentation/{ => arch}/arm/Booting                             | 0
 Documentation/{ => arch}/arm/IXP4xx                              | 0
 Documentation/{ => arch}/arm/Interrupts                          | 0
 Documentation/{ => arch}/arm/Marvell/README                      | 0
 Documentation/{ => arch}/arm/Microchip/README                    | 0
 Documentation/{ => arch}/arm/Netwinder                           | 0
 Documentation/{ => arch}/arm/OMAP/DSS                            | 0
 Documentation/{ => arch}/arm/OMAP/README                         | 0
 Documentation/{ => arch}/arm/OMAP/omap_pm                        | 0
 Documentation/{ => arch}/arm/Porting                             | 0
 Documentation/{ => arch}/arm/README                              | 0
 Documentation/{ => arch}/arm/SA1100/ADSBitsy                     | 0
 Documentation/{ => arch}/arm/SA1100/Assabet                      | 0
 Documentation/{ => arch}/arm/SA1100/Brutus                       | 0
 Documentation/{ => arch}/arm/SA1100/CERF                         | 0
 Documentation/{ => arch}/arm/SA1100/FreeBird                     | 0
 Documentation/{ => arch}/arm/SA1100/GraphicsClient               | 0
 Documentation/{ => arch}/arm/SA1100/GraphicsMaster               | 0
 Documentation/{ => arch}/arm/SA1100/HUW_WEBPANEL                 | 0
 Documentation/{ => arch}/arm/SA1100/Itsy                         | 0
 Documentation/{ => arch}/arm/SA1100/LART                         | 0
 Documentation/{ => arch}/arm/SA1100/PLEB                         | 0
 Documentation/{ => arch}/arm/SA1100/Pangolin                     | 0
 Documentation/{ => arch}/arm/SA1100/Tifon                        | 0
 Documentation/{ => arch}/arm/SA1100/Yopy                         | 0
 Documentation/{ => arch}/arm/SA1100/empeg                        | 0
 Documentation/{ => arch}/arm/SA1100/nanoEngine                   | 0
 Documentation/{ => arch}/arm/SA1100/serial_UART                  | 0
 Documentation/{ => arch}/arm/SH-Mobile/.gitignore                | 0
 Documentation/{ => arch}/arm/SPEAr/overview.txt                  | 0
 Documentation/{ => arch}/arm/Samsung-S3C24XX/CPUfreq.txt         | 0
 Documentation/{ => arch}/arm/Samsung-S3C24XX/EB2410ITX.txt       | 0
 Documentation/{ => arch}/arm/Samsung-S3C24XX/GPIO.txt            | 0
 Documentation/{ => arch}/arm/Samsung-S3C24XX/H1940.txt           | 0
 Documentation/{ => arch}/arm/Samsung-S3C24XX/NAND.txt            | 0
 Documentation/{ => arch}/arm/Samsung-S3C24XX/Overview.txt        | 0
 Documentation/{ => arch}/arm/Samsung-S3C24XX/S3C2412.txt         | 0
 Documentation/{ => arch}/arm/Samsung-S3C24XX/S3C2413.txt         | 0
 Documentation/{ => arch}/arm/Samsung-S3C24XX/SMDK2440.txt        | 0
 Documentation/{ => arch}/arm/Samsung-S3C24XX/Suspend.txt         | 0
 Documentation/{ => arch}/arm/Samsung-S3C24XX/USB-Host.txt        | 0
 Documentation/{ => arch}/arm/Samsung/Bootloader-interface.txt    | 0
 Documentation/{ => arch}/arm/Samsung/GPIO.txt                    | 0
 Documentation/{ => arch}/arm/Samsung/Overview.txt                | 0
 Documentation/{ => arch}/arm/Samsung/clksrc-change-registers.awk | 0
 Documentation/{ => arch}/arm/Setup                               | 0
 Documentation/{ => arch}/arm/VFP/release-notes.txt               | 0
 Documentation/{ => arch}/arm/cluster-pm-race-avoidance.txt       | 0
 Documentation/{ => arch}/arm/firmware.txt                        | 0
 Documentation/{ => arch}/arm/kernel_mode_neon.txt                | 0
 Documentation/{ => arch}/arm/kernel_user_helpers.txt             | 0
 Documentation/{ => arch}/arm/keystone/Overview.txt               | 0
 Documentation/{ => arch}/arm/keystone/knav-qmss.txt              | 0
 Documentation/{ => arch}/arm/mem_alignment                       | 0
 Documentation/{ => arch}/arm/memory.txt                          | 0
 Documentation/{ => arch}/arm/nwfpe/NOTES                         | 0
 Documentation/{ => arch}/arm/nwfpe/README                        | 0
 Documentation/{ => arch}/arm/nwfpe/README.FPE                    | 0
 Documentation/{ => arch}/arm/nwfpe/TODO                          | 0
 Documentation/{ => arch}/arm/pxa/mfp.txt                         | 0
 Documentation/{ => arch}/arm/sti/overview.txt                    | 0
 Documentation/{ => arch}/arm/sti/stih407-overview.txt            | 0
 Documentation/{ => arch}/arm/sti/stih415-overview.txt            | 0
 Documentation/{ => arch}/arm/sti/stih416-overview.txt            | 0
 Documentation/{ => arch}/arm/sti/stih418-overview.txt            | 0
 Documentation/{ => arch}/arm/stm32/overview.rst                  | 0
 Documentation/{ => arch}/arm/stm32/stm32f429-overview.rst        | 0
 Documentation/{ => arch}/arm/stm32/stm32f746-overview.rst        | 0
 Documentation/{ => arch}/arm/stm32/stm32f769-overview.rst        | 0
 Documentation/{ => arch}/arm/stm32/stm32h743-overview.rst        | 0
 Documentation/{ => arch}/arm/stm32/stm32mp157-overview.rst       | 0
 Documentation/{ => arch}/arm/sunxi/README                        | 0
 Documentation/{ => arch}/arm/sunxi/clocks.txt                    | 0
 Documentation/{ => arch}/arm/swp_emulation                       | 0
 Documentation/{ => arch}/arm/tcm.txt                             | 0
 Documentation/{ => arch}/arm/uefi.txt                            | 0
 Documentation/{ => arch}/arm/vlocks.txt                          | 0
 Documentation/{ => arch}/arm64/acpi_object_usage.rst             | 0
 Documentation/{ => arch}/arm64/arm-acpi.rst                      | 0
 Documentation/{ => arch}/arm64/booting.rst                       | 0
 Documentation/{ => arch}/arm64/cpu-feature-registers.rst         | 0
 Documentation/{ => arch}/arm64/elf_hwcaps.rst                    | 0
 Documentation/{ => arch}/arm64/hugetlbpage.rst                   | 0
 Documentation/{ => arch}/arm64/index.rst                         | 0
 Documentation/{ => arch}/arm64/legacy_instructions.rst           | 0
 Documentation/{ => arch}/arm64/memory.rst                        | 0
 Documentation/{ => arch}/arm64/perf.txt                          | 0
 Documentation/{ => arch}/arm64/pointer-authentication.rst        | 0
 Documentation/{ => arch}/arm64/silicon-errata.rst                | 0
 Documentation/{ => arch}/arm64/sve.rst                           | 0
 Documentation/{ => arch}/arm64/tagged-pointers.rst               | 0
 Documentation/{ => arch}/ia64/IRQ-redir.txt                      | 0
 Documentation/{ => arch}/ia64/README                             | 0
 Documentation/{ => arch}/ia64/aliasing.txt                       | 0
 Documentation/{ => arch}/ia64/efirtc.txt                         | 0
 Documentation/{ => arch}/ia64/err_inject.txt                     | 0
 Documentation/{ => arch}/ia64/fsys.txt                           | 0
 Documentation/{ => arch}/ia64/mca.txt                            | 0
 Documentation/{ => arch}/ia64/serial.txt                         | 0
 Documentation/{ => arch}/ia64/xen.txt                            | 0
 Documentation/{ => arch}/m68k/README.buddha                      | 0
 Documentation/{ => arch}/m68k/kernel-options.txt                 | 0
 Documentation/{ => arch}/mips/AU1xxx_IDE.README                  | 0
 Documentation/{ => arch}/nios2/README                            | 0
 Documentation/{ => arch}/parisc/debugging                        | 0
 Documentation/{ => arch}/parisc/registers                        | 0
 Documentation/{ => arch}/powerpc/DAWR-POWER9.txt                 | 0
 Documentation/{ => arch}/powerpc/bootwrapper.txt                 | 0
 Documentation/{ => arch}/powerpc/cpu_families.txt                | 0
 Documentation/{ => arch}/powerpc/cpu_features.txt                | 0
 Documentation/{ => arch}/powerpc/cxl.txt                         | 0
 Documentation/{ => arch}/powerpc/cxlflash.txt                    | 0
 Documentation/{ => arch}/powerpc/dscr.txt                        | 0
 Documentation/{ => arch}/powerpc/eeh-pci-error-recovery.txt      | 0
 Documentation/{ => arch}/powerpc/firmware-assisted-dump.txt      | 0
 Documentation/{ => arch}/powerpc/hvcs.txt                        | 0
 Documentation/{ => arch}/powerpc/isa-versions.rst                | 0
 Documentation/{ => arch}/powerpc/mpc52xx.txt                     | 0
 Documentation/{ => arch}/powerpc/pci_iov_resource_on_powernv.txt | 0
 Documentation/{ => arch}/powerpc/pmu-ebb.txt                     | 0
 Documentation/{ => arch}/powerpc/ptrace.txt                      | 0
 Documentation/{ => arch}/powerpc/qe_firmware.txt                 | 0
 Documentation/{ => arch}/powerpc/syscall64-abi.txt               | 0
 Documentation/{ => arch}/powerpc/transactional_memory.txt        | 0
 Documentation/{ => arch}/riscv/index.rst                         | 0
 Documentation/{ => arch}/riscv/pmu.rst                           | 0
 Documentation/{ => arch}/s390/3270.ChangeLog                     | 0
 Documentation/{ => arch}/s390/3270.rst                           | 0
 Documentation/{ => arch}/s390/cds.rst                            | 0
 Documentation/{ => arch}/s390/common_io.rst                      | 0
 Documentation/{ => arch}/s390/config3270.sh                      | 0
 Documentation/{ => arch}/s390/dasd.rst                           | 0
 Documentation/{ => arch}/s390/debugging390.rst                   | 0
 Documentation/{ => arch}/s390/driver-model.rst                   | 0
 Documentation/{ => arch}/s390/index.rst                          | 0
 Documentation/{ => arch}/s390/monreader.rst                      | 0
 Documentation/{ => arch}/s390/qeth.rst                           | 0
 Documentation/{ => arch}/s390/s390dbf.rst                        | 0
 Documentation/{ => arch}/s390/text_files.rst                     | 0
 Documentation/{ => arch}/s390/vfio-ap.rst                        | 0
 Documentation/{ => arch}/s390/vfio-ccw.rst                       | 0
 Documentation/{ => arch}/s390/zfcpdump.rst                       | 0
 Documentation/{ => arch}/sh/conf.py                              | 0
 Documentation/{ => arch}/sh/index.rst                            | 0
 Documentation/{ => arch}/sh/new-machine.txt                      | 0
 Documentation/{ => arch}/sh/register-banks.txt                   | 0
 Documentation/{ => arch}/sparc/adi.rst                           | 0
 Documentation/{ => arch}/sparc/console.rst                       | 0
 Documentation/{ => arch}/sparc/index.rst                         | 0
 Documentation/{ => arch}/sparc/oradax/dax-hv-api.txt             | 0
 Documentation/{ => arch}/sparc/oradax/oracle-dax.rst             | 0
 Documentation/{ => arch}/x86/amd-memory-encryption.rst           | 0
 Documentation/{ => arch}/x86/boot.rst                            | 0
 Documentation/{ => arch}/x86/conf.py                             | 0
 Documentation/{ => arch}/x86/earlyprintk.rst                     | 0
 Documentation/{ => arch}/x86/entry_64.rst                        | 0
 Documentation/{ => arch}/x86/exception-tables.rst                | 0
 Documentation/{ => arch}/x86/i386/IO-APIC.rst                    | 0
 Documentation/{ => arch}/x86/i386/index.rst                      | 0
 Documentation/{ => arch}/x86/index.rst                           | 0
 Documentation/{ => arch}/x86/intel_mpx.rst                       | 0
 Documentation/{ => arch}/x86/kernel-stacks.rst                   | 0
 Documentation/{ => arch}/x86/mds.rst                             | 0
 Documentation/{ => arch}/x86/microcode.rst                       | 0
 Documentation/{ => arch}/x86/mtrr.rst                            | 0
 Documentation/{ => arch}/x86/orc-unwinder.rst                    | 0
 Documentation/{ => arch}/x86/pat.rst                             | 0
 Documentation/{ => arch}/x86/pti.rst                             | 0
 Documentation/{ => arch}/x86/resctrl_ui.rst                      | 0
 Documentation/{ => arch}/x86/tlb.rst                             | 0
 Documentation/{ => arch}/x86/topology.rst                        | 0
 Documentation/{ => arch}/x86/usb-legacy-support.rst              | 0
 Documentation/{ => arch}/x86/x86_64/5level-paging.rst            | 0
 Documentation/{ => arch}/x86/x86_64/boot-options.rst             | 0
 Documentation/{ => arch}/x86/x86_64/cpu-hotplug-spec.rst         | 0
 Documentation/{ => arch}/x86/x86_64/fake-numa-for-cpusets.rst    | 0
 Documentation/{ => arch}/x86/x86_64/index.rst                    | 0
 Documentation/{ => arch}/x86/x86_64/machinecheck.rst             | 0
 Documentation/{ => arch}/x86/x86_64/mm.rst                       | 0
 Documentation/{ => arch}/x86/x86_64/uefi.rst                     | 0
 Documentation/{ => arch}/x86/zero-page.rst                       | 0
 Documentation/{ => arch}/xtensa/atomctl.txt                      | 0
 Documentation/{ => arch}/xtensa/booting.txt                      | 0
 Documentation/{ => arch}/xtensa/mmu.txt                          | 0
 184 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/{ => arch}/arm/Booting (100%)
 rename Documentation/{ => arch}/arm/IXP4xx (100%)
 rename Documentation/{ => arch}/arm/Interrupts (100%)
 rename Documentation/{ => arch}/arm/Marvell/README (100%)
 rename Documentation/{ => arch}/arm/Microchip/README (100%)
 rename Documentation/{ => arch}/arm/Netwinder (100%)
 rename Documentation/{ => arch}/arm/OMAP/DSS (100%)
 rename Documentation/{ => arch}/arm/OMAP/README (100%)
 rename Documentation/{ => arch}/arm/OMAP/omap_pm (100%)
 rename Documentation/{ => arch}/arm/Porting (100%)
 rename Documentation/{ => arch}/arm/README (100%)
 rename Documentation/{ => arch}/arm/SA1100/ADSBitsy (100%)
 rename Documentation/{ => arch}/arm/SA1100/Assabet (100%)
 rename Documentation/{ => arch}/arm/SA1100/Brutus (100%)
 rename Documentation/{ => arch}/arm/SA1100/CERF (100%)
 rename Documentation/{ => arch}/arm/SA1100/FreeBird (100%)
 rename Documentation/{ => arch}/arm/SA1100/GraphicsClient (100%)
 rename Documentation/{ => arch}/arm/SA1100/GraphicsMaster (100%)
 rename Documentation/{ => arch}/arm/SA1100/HUW_WEBPANEL (100%)
 rename Documentation/{ => arch}/arm/SA1100/Itsy (100%)
 rename Documentation/{ => arch}/arm/SA1100/LART (100%)
 rename Documentation/{ => arch}/arm/SA1100/PLEB (100%)
 rename Documentation/{ => arch}/arm/SA1100/Pangolin (100%)
 rename Documentation/{ => arch}/arm/SA1100/Tifon (100%)
 rename Documentation/{ => arch}/arm/SA1100/Yopy (100%)
 rename Documentation/{ => arch}/arm/SA1100/empeg (100%)
 rename Documentation/{ => arch}/arm/SA1100/nanoEngine (100%)
 rename Documentation/{ => arch}/arm/SA1100/serial_UART (100%)
 rename Documentation/{ => arch}/arm/SH-Mobile/.gitignore (100%)
 rename Documentation/{ => arch}/arm/SPEAr/overview.txt (100%)
 rename Documentation/{ => arch}/arm/Samsung-S3C24XX/CPUfreq.txt (100%)
 rename Documentation/{ => arch}/arm/Samsung-S3C24XX/EB2410ITX.txt (100%)
 rename Documentation/{ => arch}/arm/Samsung-S3C24XX/GPIO.txt (100%)
 rename Documentation/{ => arch}/arm/Samsung-S3C24XX/H1940.txt (100%)
 rename Documentation/{ => arch}/arm/Samsung-S3C24XX/NAND.txt (100%)
 rename Documentation/{ => arch}/arm/Samsung-S3C24XX/Overview.txt (100%)
 rename Documentation/{ => arch}/arm/Samsung-S3C24XX/S3C2412.txt (100%)
 rename Documentation/{ => arch}/arm/Samsung-S3C24XX/S3C2413.txt (100%)
 rename Documentation/{ => arch}/arm/Samsung-S3C24XX/SMDK2440.txt (100%)
 rename Documentation/{ => arch}/arm/Samsung-S3C24XX/Suspend.txt (100%)
 rename Documentation/{ => arch}/arm/Samsung-S3C24XX/USB-Host.txt (100%)
 rename Documentation/{ => arch}/arm/Samsung/Bootloader-interface.txt (100%)
 rename Documentation/{ => arch}/arm/Samsung/GPIO.txt (100%)
 rename Documentation/{ => arch}/arm/Samsung/Overview.txt (100%)
 rename Documentation/{ => arch}/arm/Samsung/clksrc-change-registers.awk (100%)
 rename Documentation/{ => arch}/arm/Setup (100%)
 rename Documentation/{ => arch}/arm/VFP/release-notes.txt (100%)
 rename Documentation/{ => arch}/arm/cluster-pm-race-avoidance.txt (100%)
 rename Documentation/{ => arch}/arm/firmware.txt (100%)
 rename Documentation/{ => arch}/arm/kernel_mode_neon.txt (100%)
 rename Documentation/{ => arch}/arm/kernel_user_helpers.txt (100%)
 rename Documentation/{ => arch}/arm/keystone/Overview.txt (100%)
 rename Documentation/{ => arch}/arm/keystone/knav-qmss.txt (100%)
 rename Documentation/{ => arch}/arm/mem_alignment (100%)
 rename Documentation/{ => arch}/arm/memory.txt (100%)
 rename Documentation/{ => arch}/arm/nwfpe/NOTES (100%)
 rename Documentation/{ => arch}/arm/nwfpe/README (100%)
 rename Documentation/{ => arch}/arm/nwfpe/README.FPE (100%)
 rename Documentation/{ => arch}/arm/nwfpe/TODO (100%)
 rename Documentation/{ => arch}/arm/pxa/mfp.txt (100%)
 rename Documentation/{ => arch}/arm/sti/overview.txt (100%)
 rename Documentation/{ => arch}/arm/sti/stih407-overview.txt (100%)
 rename Documentation/{ => arch}/arm/sti/stih415-overview.txt (100%)
 rename Documentation/{ => arch}/arm/sti/stih416-overview.txt (100%)
 rename Documentation/{ => arch}/arm/sti/stih418-overview.txt (100%)
 rename Documentation/{ => arch}/arm/stm32/overview.rst (100%)
 rename Documentation/{ => arch}/arm/stm32/stm32f429-overview.rst (100%)
 rename Documentation/{ => arch}/arm/stm32/stm32f746-overview.rst (100%)
 rename Documentation/{ => arch}/arm/stm32/stm32f769-overview.rst (100%)
 rename Documentation/{ => arch}/arm/stm32/stm32h743-overview.rst (100%)
 rename Documentation/{ => arch}/arm/stm32/stm32mp157-overview.rst (100%)
 rename Documentation/{ => arch}/arm/sunxi/README (100%)
 rename Documentation/{ => arch}/arm/sunxi/clocks.txt (100%)
 rename Documentation/{ => arch}/arm/swp_emulation (100%)
 rename Documentation/{ => arch}/arm/tcm.txt (100%)
 rename Documentation/{ => arch}/arm/uefi.txt (100%)
 rename Documentation/{ => arch}/arm/vlocks.txt (100%)
 rename Documentation/{ => arch}/arm64/acpi_object_usage.rst (100%)
 rename Documentation/{ => arch}/arm64/arm-acpi.rst (100%)
 rename Documentation/{ => arch}/arm64/booting.rst (100%)
 rename Documentation/{ => arch}/arm64/cpu-feature-registers.rst (100%)
 rename Documentation/{ => arch}/arm64/elf_hwcaps.rst (100%)
 rename Documentation/{ => arch}/arm64/hugetlbpage.rst (100%)
 rename Documentation/{ => arch}/arm64/index.rst (100%)
 rename Documentation/{ => arch}/arm64/legacy_instructions.rst (100%)
 rename Documentation/{ => arch}/arm64/memory.rst (100%)
 rename Documentation/{ => arch}/arm64/perf.txt (100%)
 rename Documentation/{ => arch}/arm64/pointer-authentication.rst (100%)
 rename Documentation/{ => arch}/arm64/silicon-errata.rst (100%)
 rename Documentation/{ => arch}/arm64/sve.rst (100%)
 rename Documentation/{ => arch}/arm64/tagged-pointers.rst (100%)
 rename Documentation/{ => arch}/ia64/IRQ-redir.txt (100%)
 rename Documentation/{ => arch}/ia64/README (100%)
 rename Documentation/{ => arch}/ia64/aliasing.txt (100%)
 rename Documentation/{ => arch}/ia64/efirtc.txt (100%)
 rename Documentation/{ => arch}/ia64/err_inject.txt (100%)
 rename Documentation/{ => arch}/ia64/fsys.txt (100%)
 rename Documentation/{ => arch}/ia64/mca.txt (100%)
 rename Documentation/{ => arch}/ia64/serial.txt (100%)
 rename Documentation/{ => arch}/ia64/xen.txt (100%)
 rename Documentation/{ => arch}/m68k/README.buddha (100%)
 rename Documentation/{ => arch}/m68k/kernel-options.txt (100%)
 rename Documentation/{ => arch}/mips/AU1xxx_IDE.README (100%)
 rename Documentation/{ => arch}/nios2/README (100%)
 rename Documentation/{ => arch}/parisc/debugging (100%)
 rename Documentation/{ => arch}/parisc/registers (100%)
 rename Documentation/{ => arch}/powerpc/DAWR-POWER9.txt (100%)
 rename Documentation/{ => arch}/powerpc/bootwrapper.txt (100%)
 rename Documentation/{ => arch}/powerpc/cpu_families.txt (100%)
 rename Documentation/{ => arch}/powerpc/cpu_features.txt (100%)
 rename Documentation/{ => arch}/powerpc/cxl.txt (100%)
 rename Documentation/{ => arch}/powerpc/cxlflash.txt (100%)
 rename Documentation/{ => arch}/powerpc/dscr.txt (100%)
 rename Documentation/{ => arch}/powerpc/eeh-pci-error-recovery.txt (100%)
 rename Documentation/{ => arch}/powerpc/firmware-assisted-dump.txt (100%)
 rename Documentation/{ => arch}/powerpc/hvcs.txt (100%)
 rename Documentation/{ => arch}/powerpc/isa-versions.rst (100%)
 rename Documentation/{ => arch}/powerpc/mpc52xx.txt (100%)
 rename Documentation/{ => arch}/powerpc/pci_iov_resource_on_powernv.txt (100%)
 rename Documentation/{ => arch}/powerpc/pmu-ebb.txt (100%)
 rename Documentation/{ => arch}/powerpc/ptrace.txt (100%)
 rename Documentation/{ => arch}/powerpc/qe_firmware.txt (100%)
 rename Documentation/{ => arch}/powerpc/syscall64-abi.txt (100%)
 rename Documentation/{ => arch}/powerpc/transactional_memory.txt (100%)
 rename Documentation/{ => arch}/riscv/index.rst (100%)
 rename Documentation/{ => arch}/riscv/pmu.rst (100%)
 rename Documentation/{ => arch}/s390/3270.ChangeLog (100%)
 rename Documentation/{ => arch}/s390/3270.rst (100%)
 rename Documentation/{ => arch}/s390/cds.rst (100%)
 rename Documentation/{ => arch}/s390/common_io.rst (100%)
 rename Documentation/{ => arch}/s390/config3270.sh (100%)
 rename Documentation/{ => arch}/s390/dasd.rst (100%)
 rename Documentation/{ => arch}/s390/debugging390.rst (100%)
 rename Documentation/{ => arch}/s390/driver-model.rst (100%)
 rename Documentation/{ => arch}/s390/index.rst (100%)
 rename Documentation/{ => arch}/s390/monreader.rst (100%)
 rename Documentation/{ => arch}/s390/qeth.rst (100%)
 rename Documentation/{ => arch}/s390/s390dbf.rst (100%)
 rename Documentation/{ => arch}/s390/text_files.rst (100%)
 rename Documentation/{ => arch}/s390/vfio-ap.rst (100%)
 rename Documentation/{ => arch}/s390/vfio-ccw.rst (100%)
 rename Documentation/{ => arch}/s390/zfcpdump.rst (100%)
 rename Documentation/{ => arch}/sh/conf.py (100%)
 rename Documentation/{ => arch}/sh/index.rst (100%)
 rename Documentation/{ => arch}/sh/new-machine.txt (100%)
 rename Documentation/{ => arch}/sh/register-banks.txt (100%)
 rename Documentation/{ => arch}/sparc/adi.rst (100%)
 rename Documentation/{ => arch}/sparc/console.rst (100%)
 rename Documentation/{ => arch}/sparc/index.rst (100%)
 rename Documentation/{ => arch}/sparc/oradax/dax-hv-api.txt (100%)
 rename Documentation/{ => arch}/sparc/oradax/oracle-dax.rst (100%)
 rename Documentation/{ => arch}/x86/amd-memory-encryption.rst (100%)
 rename Documentation/{ => arch}/x86/boot.rst (100%)
 rename Documentation/{ => arch}/x86/conf.py (100%)
 rename Documentation/{ => arch}/x86/earlyprintk.rst (100%)
 rename Documentation/{ => arch}/x86/entry_64.rst (100%)
 rename Documentation/{ => arch}/x86/exception-tables.rst (100%)
 rename Documentation/{ => arch}/x86/i386/IO-APIC.rst (100%)
 rename Documentation/{ => arch}/x86/i386/index.rst (100%)
 rename Documentation/{ => arch}/x86/index.rst (100%)
 rename Documentation/{ => arch}/x86/intel_mpx.rst (100%)
 rename Documentation/{ => arch}/x86/kernel-stacks.rst (100%)
 rename Documentation/{ => arch}/x86/mds.rst (100%)
 rename Documentation/{ => arch}/x86/microcode.rst (100%)
 rename Documentation/{ => arch}/x86/mtrr.rst (100%)
 rename Documentation/{ => arch}/x86/orc-unwinder.rst (100%)
 rename Documentation/{ => arch}/x86/pat.rst (100%)
 rename Documentation/{ => arch}/x86/pti.rst (100%)
 rename Documentation/{ => arch}/x86/resctrl_ui.rst (100%)
 rename Documentation/{ => arch}/x86/tlb.rst (100%)
 rename Documentation/{ => arch}/x86/topology.rst (100%)
 rename Documentation/{ => arch}/x86/usb-legacy-support.rst (100%)
 rename Documentation/{ => arch}/x86/x86_64/5level-paging.rst (100%)
 rename Documentation/{ => arch}/x86/x86_64/boot-options.rst (100%)
 rename Documentation/{ => arch}/x86/x86_64/cpu-hotplug-spec.rst (100%)
 rename Documentation/{ => arch}/x86/x86_64/fake-numa-for-cpusets.rst (100%)
 rename Documentation/{ => arch}/x86/x86_64/index.rst (100%)
 rename Documentation/{ => arch}/x86/x86_64/machinecheck.rst (100%)
 rename Documentation/{ => arch}/x86/x86_64/mm.rst (100%)
 rename Documentation/{ => arch}/x86/x86_64/uefi.rst (100%)
 rename Documentation/{ => arch}/x86/zero-page.rst (100%)
 rename Documentation/{ => arch}/xtensa/atomctl.txt (100%)
 rename Documentation/{ => arch}/xtensa/booting.txt (100%)
 rename Documentation/{ => arch}/xtensa/mmu.txt (100%)

diff --git a/Documentation/arm/Booting b/Documentation/arch/arm/Booting
similarity index 100%
rename from Documentation/arm/Booting
rename to Documentation/arch/arm/Booting
diff --git a/Documentation/arm/IXP4xx b/Documentation/arch/arm/IXP4xx
similarity index 100%
rename from Documentation/arm/IXP4xx
rename to Documentation/arch/arm/IXP4xx
diff --git a/Documentation/arm/Interrupts b/Documentation/arch/arm/Interrupts
similarity index 100%
rename from Documentation/arm/Interrupts
rename to Documentation/arch/arm/Interrupts
diff --git a/Documentation/arm/Marvell/README b/Documentation/arch/arm/Marvell/README
similarity index 100%
rename from Documentation/arm/Marvell/README
rename to Documentation/arch/arm/Marvell/README
diff --git a/Documentation/arm/Microchip/README b/Documentation/arch/arm/Microchip/README
similarity index 100%
rename from Documentation/arm/Microchip/README
rename to Documentation/arch/arm/Microchip/README
diff --git a/Documentation/arm/Netwinder b/Documentation/arch/arm/Netwinder
similarity index 100%
rename from Documentation/arm/Netwinder
rename to Documentation/arch/arm/Netwinder
diff --git a/Documentation/arm/OMAP/DSS b/Documentation/arch/arm/OMAP/DSS
similarity index 100%
rename from Documentation/arm/OMAP/DSS
rename to Documentation/arch/arm/OMAP/DSS
diff --git a/Documentation/arm/OMAP/README b/Documentation/arch/arm/OMAP/README
similarity index 100%
rename from Documentation/arm/OMAP/README
rename to Documentation/arch/arm/OMAP/README
diff --git a/Documentation/arm/OMAP/omap_pm b/Documentation/arch/arm/OMAP/omap_pm
similarity index 100%
rename from Documentation/arm/OMAP/omap_pm
rename to Documentation/arch/arm/OMAP/omap_pm
diff --git a/Documentation/arm/Porting b/Documentation/arch/arm/Porting
similarity index 100%
rename from Documentation/arm/Porting
rename to Documentation/arch/arm/Porting
diff --git a/Documentation/arm/README b/Documentation/arch/arm/README
similarity index 100%
rename from Documentation/arm/README
rename to Documentation/arch/arm/README
diff --git a/Documentation/arm/SA1100/ADSBitsy b/Documentation/arch/arm/SA1100/ADSBitsy
similarity index 100%
rename from Documentation/arm/SA1100/ADSBitsy
rename to Documentation/arch/arm/SA1100/ADSBitsy
diff --git a/Documentation/arm/SA1100/Assabet b/Documentation/arch/arm/SA1100/Assabet
similarity index 100%
rename from Documentation/arm/SA1100/Assabet
rename to Documentation/arch/arm/SA1100/Assabet
diff --git a/Documentation/arm/SA1100/Brutus b/Documentation/arch/arm/SA1100/Brutus
similarity index 100%
rename from Documentation/arm/SA1100/Brutus
rename to Documentation/arch/arm/SA1100/Brutus
diff --git a/Documentation/arm/SA1100/CERF b/Documentation/arch/arm/SA1100/CERF
similarity index 100%
rename from Documentation/arm/SA1100/CERF
rename to Documentation/arch/arm/SA1100/CERF
diff --git a/Documentation/arm/SA1100/FreeBird b/Documentation/arch/arm/SA1100/FreeBird
similarity index 100%
rename from Documentation/arm/SA1100/FreeBird
rename to Documentation/arch/arm/SA1100/FreeBird
diff --git a/Documentation/arm/SA1100/GraphicsClient b/Documentation/arch/arm/SA1100/GraphicsClient
similarity index 100%
rename from Documentation/arm/SA1100/GraphicsClient
rename to Documentation/arch/arm/SA1100/GraphicsClient
diff --git a/Documentation/arm/SA1100/GraphicsMaster b/Documentation/arch/arm/SA1100/GraphicsMaster
similarity index 100%
rename from Documentation/arm/SA1100/GraphicsMaster
rename to Documentation/arch/arm/SA1100/GraphicsMaster
diff --git a/Documentation/arm/SA1100/HUW_WEBPANEL b/Documentation/arch/arm/SA1100/HUW_WEBPANEL
similarity index 100%
rename from Documentation/arm/SA1100/HUW_WEBPANEL
rename to Documentation/arch/arm/SA1100/HUW_WEBPANEL
diff --git a/Documentation/arm/SA1100/Itsy b/Documentation/arch/arm/SA1100/Itsy
similarity index 100%
rename from Documentation/arm/SA1100/Itsy
rename to Documentation/arch/arm/SA1100/Itsy
diff --git a/Documentation/arm/SA1100/LART b/Documentation/arch/arm/SA1100/LART
similarity index 100%
rename from Documentation/arm/SA1100/LART
rename to Documentation/arch/arm/SA1100/LART
diff --git a/Documentation/arm/SA1100/PLEB b/Documentation/arch/arm/SA1100/PLEB
similarity index 100%
rename from Documentation/arm/SA1100/PLEB
rename to Documentation/arch/arm/SA1100/PLEB
diff --git a/Documentation/arm/SA1100/Pangolin b/Documentation/arch/arm/SA1100/Pangolin
similarity index 100%
rename from Documentation/arm/SA1100/Pangolin
rename to Documentation/arch/arm/SA1100/Pangolin
diff --git a/Documentation/arm/SA1100/Tifon b/Documentation/arch/arm/SA1100/Tifon
similarity index 100%
rename from Documentation/arm/SA1100/Tifon
rename to Documentation/arch/arm/SA1100/Tifon
diff --git a/Documentation/arm/SA1100/Yopy b/Documentation/arch/arm/SA1100/Yopy
similarity index 100%
rename from Documentation/arm/SA1100/Yopy
rename to Documentation/arch/arm/SA1100/Yopy
diff --git a/Documentation/arm/SA1100/empeg b/Documentation/arch/arm/SA1100/empeg
similarity index 100%
rename from Documentation/arm/SA1100/empeg
rename to Documentation/arch/arm/SA1100/empeg
diff --git a/Documentation/arm/SA1100/nanoEngine b/Documentation/arch/arm/SA1100/nanoEngine
similarity index 100%
rename from Documentation/arm/SA1100/nanoEngine
rename to Documentation/arch/arm/SA1100/nanoEngine
diff --git a/Documentation/arm/SA1100/serial_UART b/Documentation/arch/arm/SA1100/serial_UART
similarity index 100%
rename from Documentation/arm/SA1100/serial_UART
rename to Documentation/arch/arm/SA1100/serial_UART
diff --git a/Documentation/arm/SH-Mobile/.gitignore b/Documentation/arch/arm/SH-Mobile/.gitignore
similarity index 100%
rename from Documentation/arm/SH-Mobile/.gitignore
rename to Documentation/arch/arm/SH-Mobile/.gitignore
diff --git a/Documentation/arm/SPEAr/overview.txt b/Documentation/arch/arm/SPEAr/overview.txt
similarity index 100%
rename from Documentation/arm/SPEAr/overview.txt
rename to Documentation/arch/arm/SPEAr/overview.txt
diff --git a/Documentation/arm/Samsung-S3C24XX/CPUfreq.txt b/Documentation/arch/arm/Samsung-S3C24XX/CPUfreq.txt
similarity index 100%
rename from Documentation/arm/Samsung-S3C24XX/CPUfreq.txt
rename to Documentation/arch/arm/Samsung-S3C24XX/CPUfreq.txt
diff --git a/Documentation/arm/Samsung-S3C24XX/EB2410ITX.txt b/Documentation/arch/arm/Samsung-S3C24XX/EB2410ITX.txt
similarity index 100%
rename from Documentation/arm/Samsung-S3C24XX/EB2410ITX.txt
rename to Documentation/arch/arm/Samsung-S3C24XX/EB2410ITX.txt
diff --git a/Documentation/arm/Samsung-S3C24XX/GPIO.txt b/Documentation/arch/arm/Samsung-S3C24XX/GPIO.txt
similarity index 100%
rename from Documentation/arm/Samsung-S3C24XX/GPIO.txt
rename to Documentation/arch/arm/Samsung-S3C24XX/GPIO.txt
diff --git a/Documentation/arm/Samsung-S3C24XX/H1940.txt b/Documentation/arch/arm/Samsung-S3C24XX/H1940.txt
similarity index 100%
rename from Documentation/arm/Samsung-S3C24XX/H1940.txt
rename to Documentation/arch/arm/Samsung-S3C24XX/H1940.txt
diff --git a/Documentation/arm/Samsung-S3C24XX/NAND.txt b/Documentation/arch/arm/Samsung-S3C24XX/NAND.txt
similarity index 100%
rename from Documentation/arm/Samsung-S3C24XX/NAND.txt
rename to Documentation/arch/arm/Samsung-S3C24XX/NAND.txt
diff --git a/Documentation/arm/Samsung-S3C24XX/Overview.txt b/Documentation/arch/arm/Samsung-S3C24XX/Overview.txt
similarity index 100%
rename from Documentation/arm/Samsung-S3C24XX/Overview.txt
rename to Documentation/arch/arm/Samsung-S3C24XX/Overview.txt
diff --git a/Documentation/arm/Samsung-S3C24XX/S3C2412.txt b/Documentation/arch/arm/Samsung-S3C24XX/S3C2412.txt
similarity index 100%
rename from Documentation/arm/Samsung-S3C24XX/S3C2412.txt
rename to Documentation/arch/arm/Samsung-S3C24XX/S3C2412.txt
diff --git a/Documentation/arm/Samsung-S3C24XX/S3C2413.txt b/Documentation/arch/arm/Samsung-S3C24XX/S3C2413.txt
similarity index 100%
rename from Documentation/arm/Samsung-S3C24XX/S3C2413.txt
rename to Documentation/arch/arm/Samsung-S3C24XX/S3C2413.txt
diff --git a/Documentation/arm/Samsung-S3C24XX/SMDK2440.txt b/Documentation/arch/arm/Samsung-S3C24XX/SMDK2440.txt
similarity index 100%
rename from Documentation/arm/Samsung-S3C24XX/SMDK2440.txt
rename to Documentation/arch/arm/Samsung-S3C24XX/SMDK2440.txt
diff --git a/Documentation/arm/Samsung-S3C24XX/Suspend.txt b/Documentation/arch/arm/Samsung-S3C24XX/Suspend.txt
similarity index 100%
rename from Documentation/arm/Samsung-S3C24XX/Suspend.txt
rename to Documentation/arch/arm/Samsung-S3C24XX/Suspend.txt
diff --git a/Documentation/arm/Samsung-S3C24XX/USB-Host.txt b/Documentation/arch/arm/Samsung-S3C24XX/USB-Host.txt
similarity index 100%
rename from Documentation/arm/Samsung-S3C24XX/USB-Host.txt
rename to Documentation/arch/arm/Samsung-S3C24XX/USB-Host.txt
diff --git a/Documentation/arm/Samsung/Bootloader-interface.txt b/Documentation/arch/arm/Samsung/Bootloader-interface.txt
similarity index 100%
rename from Documentation/arm/Samsung/Bootloader-interface.txt
rename to Documentation/arch/arm/Samsung/Bootloader-interface.txt
diff --git a/Documentation/arm/Samsung/GPIO.txt b/Documentation/arch/arm/Samsung/GPIO.txt
similarity index 100%
rename from Documentation/arm/Samsung/GPIO.txt
rename to Documentation/arch/arm/Samsung/GPIO.txt
diff --git a/Documentation/arm/Samsung/Overview.txt b/Documentation/arch/arm/Samsung/Overview.txt
similarity index 100%
rename from Documentation/arm/Samsung/Overview.txt
rename to Documentation/arch/arm/Samsung/Overview.txt
diff --git a/Documentation/arm/Samsung/clksrc-change-registers.awk b/Documentation/arch/arm/Samsung/clksrc-change-registers.awk
similarity index 100%
rename from Documentation/arm/Samsung/clksrc-change-registers.awk
rename to Documentation/arch/arm/Samsung/clksrc-change-registers.awk
diff --git a/Documentation/arm/Setup b/Documentation/arch/arm/Setup
similarity index 100%
rename from Documentation/arm/Setup
rename to Documentation/arch/arm/Setup
diff --git a/Documentation/arm/VFP/release-notes.txt b/Documentation/arch/arm/VFP/release-notes.txt
similarity index 100%
rename from Documentation/arm/VFP/release-notes.txt
rename to Documentation/arch/arm/VFP/release-notes.txt
diff --git a/Documentation/arm/cluster-pm-race-avoidance.txt b/Documentation/arch/arm/cluster-pm-race-avoidance.txt
similarity index 100%
rename from Documentation/arm/cluster-pm-race-avoidance.txt
rename to Documentation/arch/arm/cluster-pm-race-avoidance.txt
diff --git a/Documentation/arm/firmware.txt b/Documentation/arch/arm/firmware.txt
similarity index 100%
rename from Documentation/arm/firmware.txt
rename to Documentation/arch/arm/firmware.txt
diff --git a/Documentation/arm/kernel_mode_neon.txt b/Documentation/arch/arm/kernel_mode_neon.txt
similarity index 100%
rename from Documentation/arm/kernel_mode_neon.txt
rename to Documentation/arch/arm/kernel_mode_neon.txt
diff --git a/Documentation/arm/kernel_user_helpers.txt b/Documentation/arch/arm/kernel_user_helpers.txt
similarity index 100%
rename from Documentation/arm/kernel_user_helpers.txt
rename to Documentation/arch/arm/kernel_user_helpers.txt
diff --git a/Documentation/arm/keystone/Overview.txt b/Documentation/arch/arm/keystone/Overview.txt
similarity index 100%
rename from Documentation/arm/keystone/Overview.txt
rename to Documentation/arch/arm/keystone/Overview.txt
diff --git a/Documentation/arm/keystone/knav-qmss.txt b/Documentation/arch/arm/keystone/knav-qmss.txt
similarity index 100%
rename from Documentation/arm/keystone/knav-qmss.txt
rename to Documentation/arch/arm/keystone/knav-qmss.txt
diff --git a/Documentation/arm/mem_alignment b/Documentation/arch/arm/mem_alignment
similarity index 100%
rename from Documentation/arm/mem_alignment
rename to Documentation/arch/arm/mem_alignment
diff --git a/Documentation/arm/memory.txt b/Documentation/arch/arm/memory.txt
similarity index 100%
rename from Documentation/arm/memory.txt
rename to Documentation/arch/arm/memory.txt
diff --git a/Documentation/arm/nwfpe/NOTES b/Documentation/arch/arm/nwfpe/NOTES
similarity index 100%
rename from Documentation/arm/nwfpe/NOTES
rename to Documentation/arch/arm/nwfpe/NOTES
diff --git a/Documentation/arm/nwfpe/README b/Documentation/arch/arm/nwfpe/README
similarity index 100%
rename from Documentation/arm/nwfpe/README
rename to Documentation/arch/arm/nwfpe/README
diff --git a/Documentation/arm/nwfpe/README.FPE b/Documentation/arch/arm/nwfpe/README.FPE
similarity index 100%
rename from Documentation/arm/nwfpe/README.FPE
rename to Documentation/arch/arm/nwfpe/README.FPE
diff --git a/Documentation/arm/nwfpe/TODO b/Documentation/arch/arm/nwfpe/TODO
similarity index 100%
rename from Documentation/arm/nwfpe/TODO
rename to Documentation/arch/arm/nwfpe/TODO
diff --git a/Documentation/arm/pxa/mfp.txt b/Documentation/arch/arm/pxa/mfp.txt
similarity index 100%
rename from Documentation/arm/pxa/mfp.txt
rename to Documentation/arch/arm/pxa/mfp.txt
diff --git a/Documentation/arm/sti/overview.txt b/Documentation/arch/arm/sti/overview.txt
similarity index 100%
rename from Documentation/arm/sti/overview.txt
rename to Documentation/arch/arm/sti/overview.txt
diff --git a/Documentation/arm/sti/stih407-overview.txt b/Documentation/arch/arm/sti/stih407-overview.txt
similarity index 100%
rename from Documentation/arm/sti/stih407-overview.txt
rename to Documentation/arch/arm/sti/stih407-overview.txt
diff --git a/Documentation/arm/sti/stih415-overview.txt b/Documentation/arch/arm/sti/stih415-overview.txt
similarity index 100%
rename from Documentation/arm/sti/stih415-overview.txt
rename to Documentation/arch/arm/sti/stih415-overview.txt
diff --git a/Documentation/arm/sti/stih416-overview.txt b/Documentation/arch/arm/sti/stih416-overview.txt
similarity index 100%
rename from Documentation/arm/sti/stih416-overview.txt
rename to Documentation/arch/arm/sti/stih416-overview.txt
diff --git a/Documentation/arm/sti/stih418-overview.txt b/Documentation/arch/arm/sti/stih418-overview.txt
similarity index 100%
rename from Documentation/arm/sti/stih418-overview.txt
rename to Documentation/arch/arm/sti/stih418-overview.txt
diff --git a/Documentation/arm/stm32/overview.rst b/Documentation/arch/arm/stm32/overview.rst
similarity index 100%
rename from Documentation/arm/stm32/overview.rst
rename to Documentation/arch/arm/stm32/overview.rst
diff --git a/Documentation/arm/stm32/stm32f429-overview.rst b/Documentation/arch/arm/stm32/stm32f429-overview.rst
similarity index 100%
rename from Documentation/arm/stm32/stm32f429-overview.rst
rename to Documentation/arch/arm/stm32/stm32f429-overview.rst
diff --git a/Documentation/arm/stm32/stm32f746-overview.rst b/Documentation/arch/arm/stm32/stm32f746-overview.rst
similarity index 100%
rename from Documentation/arm/stm32/stm32f746-overview.rst
rename to Documentation/arch/arm/stm32/stm32f746-overview.rst
diff --git a/Documentation/arm/stm32/stm32f769-overview.rst b/Documentation/arch/arm/stm32/stm32f769-overview.rst
similarity index 100%
rename from Documentation/arm/stm32/stm32f769-overview.rst
rename to Documentation/arch/arm/stm32/stm32f769-overview.rst
diff --git a/Documentation/arm/stm32/stm32h743-overview.rst b/Documentation/arch/arm/stm32/stm32h743-overview.rst
similarity index 100%
rename from Documentation/arm/stm32/stm32h743-overview.rst
rename to Documentation/arch/arm/stm32/stm32h743-overview.rst
diff --git a/Documentation/arm/stm32/stm32mp157-overview.rst b/Documentation/arch/arm/stm32/stm32mp157-overview.rst
similarity index 100%
rename from Documentation/arm/stm32/stm32mp157-overview.rst
rename to Documentation/arch/arm/stm32/stm32mp157-overview.rst
diff --git a/Documentation/arm/sunxi/README b/Documentation/arch/arm/sunxi/README
similarity index 100%
rename from Documentation/arm/sunxi/README
rename to Documentation/arch/arm/sunxi/README
diff --git a/Documentation/arm/sunxi/clocks.txt b/Documentation/arch/arm/sunxi/clocks.txt
similarity index 100%
rename from Documentation/arm/sunxi/clocks.txt
rename to Documentation/arch/arm/sunxi/clocks.txt
diff --git a/Documentation/arm/swp_emulation b/Documentation/arch/arm/swp_emulation
similarity index 100%
rename from Documentation/arm/swp_emulation
rename to Documentation/arch/arm/swp_emulation
diff --git a/Documentation/arm/tcm.txt b/Documentation/arch/arm/tcm.txt
similarity index 100%
rename from Documentation/arm/tcm.txt
rename to Documentation/arch/arm/tcm.txt
diff --git a/Documentation/arm/uefi.txt b/Documentation/arch/arm/uefi.txt
similarity index 100%
rename from Documentation/arm/uefi.txt
rename to Documentation/arch/arm/uefi.txt
diff --git a/Documentation/arm/vlocks.txt b/Documentation/arch/arm/vlocks.txt
similarity index 100%
rename from Documentation/arm/vlocks.txt
rename to Documentation/arch/arm/vlocks.txt
diff --git a/Documentation/arm64/acpi_object_usage.rst b/Documentation/arch/arm64/acpi_object_usage.rst
similarity index 100%
rename from Documentation/arm64/acpi_object_usage.rst
rename to Documentation/arch/arm64/acpi_object_usage.rst
diff --git a/Documentation/arm64/arm-acpi.rst b/Documentation/arch/arm64/arm-acpi.rst
similarity index 100%
rename from Documentation/arm64/arm-acpi.rst
rename to Documentation/arch/arm64/arm-acpi.rst
diff --git a/Documentation/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
similarity index 100%
rename from Documentation/arm64/booting.rst
rename to Documentation/arch/arm64/booting.rst
diff --git a/Documentation/arm64/cpu-feature-registers.rst b/Documentation/arch/arm64/cpu-feature-registers.rst
similarity index 100%
rename from Documentation/arm64/cpu-feature-registers.rst
rename to Documentation/arch/arm64/cpu-feature-registers.rst
diff --git a/Documentation/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
similarity index 100%
rename from Documentation/arm64/elf_hwcaps.rst
rename to Documentation/arch/arm64/elf_hwcaps.rst
diff --git a/Documentation/arm64/hugetlbpage.rst b/Documentation/arch/arm64/hugetlbpage.rst
similarity index 100%
rename from Documentation/arm64/hugetlbpage.rst
rename to Documentation/arch/arm64/hugetlbpage.rst
diff --git a/Documentation/arm64/index.rst b/Documentation/arch/arm64/index.rst
similarity index 100%
rename from Documentation/arm64/index.rst
rename to Documentation/arch/arm64/index.rst
diff --git a/Documentation/arm64/legacy_instructions.rst b/Documentation/arch/arm64/legacy_instructions.rst
similarity index 100%
rename from Documentation/arm64/legacy_instructions.rst
rename to Documentation/arch/arm64/legacy_instructions.rst
diff --git a/Documentation/arm64/memory.rst b/Documentation/arch/arm64/memory.rst
similarity index 100%
rename from Documentation/arm64/memory.rst
rename to Documentation/arch/arm64/memory.rst
diff --git a/Documentation/arm64/perf.txt b/Documentation/arch/arm64/perf.txt
similarity index 100%
rename from Documentation/arm64/perf.txt
rename to Documentation/arch/arm64/perf.txt
diff --git a/Documentation/arm64/pointer-authentication.rst b/Documentation/arch/arm64/pointer-authentication.rst
similarity index 100%
rename from Documentation/arm64/pointer-authentication.rst
rename to Documentation/arch/arm64/pointer-authentication.rst
diff --git a/Documentation/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
similarity index 100%
rename from Documentation/arm64/silicon-errata.rst
rename to Documentation/arch/arm64/silicon-errata.rst
diff --git a/Documentation/arm64/sve.rst b/Documentation/arch/arm64/sve.rst
similarity index 100%
rename from Documentation/arm64/sve.rst
rename to Documentation/arch/arm64/sve.rst
diff --git a/Documentation/arm64/tagged-pointers.rst b/Documentation/arch/arm64/tagged-pointers.rst
similarity index 100%
rename from Documentation/arm64/tagged-pointers.rst
rename to Documentation/arch/arm64/tagged-pointers.rst
diff --git a/Documentation/ia64/IRQ-redir.txt b/Documentation/arch/ia64/IRQ-redir.txt
similarity index 100%
rename from Documentation/ia64/IRQ-redir.txt
rename to Documentation/arch/ia64/IRQ-redir.txt
diff --git a/Documentation/ia64/README b/Documentation/arch/ia64/README
similarity index 100%
rename from Documentation/ia64/README
rename to Documentation/arch/ia64/README
diff --git a/Documentation/ia64/aliasing.txt b/Documentation/arch/ia64/aliasing.txt
similarity index 100%
rename from Documentation/ia64/aliasing.txt
rename to Documentation/arch/ia64/aliasing.txt
diff --git a/Documentation/ia64/efirtc.txt b/Documentation/arch/ia64/efirtc.txt
similarity index 100%
rename from Documentation/ia64/efirtc.txt
rename to Documentation/arch/ia64/efirtc.txt
diff --git a/Documentation/ia64/err_inject.txt b/Documentation/arch/ia64/err_inject.txt
similarity index 100%
rename from Documentation/ia64/err_inject.txt
rename to Documentation/arch/ia64/err_inject.txt
diff --git a/Documentation/ia64/fsys.txt b/Documentation/arch/ia64/fsys.txt
similarity index 100%
rename from Documentation/ia64/fsys.txt
rename to Documentation/arch/ia64/fsys.txt
diff --git a/Documentation/ia64/mca.txt b/Documentation/arch/ia64/mca.txt
similarity index 100%
rename from Documentation/ia64/mca.txt
rename to Documentation/arch/ia64/mca.txt
diff --git a/Documentation/ia64/serial.txt b/Documentation/arch/ia64/serial.txt
similarity index 100%
rename from Documentation/ia64/serial.txt
rename to Documentation/arch/ia64/serial.txt
diff --git a/Documentation/ia64/xen.txt b/Documentation/arch/ia64/xen.txt
similarity index 100%
rename from Documentation/ia64/xen.txt
rename to Documentation/arch/ia64/xen.txt
diff --git a/Documentation/m68k/README.buddha b/Documentation/arch/m68k/README.buddha
similarity index 100%
rename from Documentation/m68k/README.buddha
rename to Documentation/arch/m68k/README.buddha
diff --git a/Documentation/m68k/kernel-options.txt b/Documentation/arch/m68k/kernel-options.txt
similarity index 100%
rename from Documentation/m68k/kernel-options.txt
rename to Documentation/arch/m68k/kernel-options.txt
diff --git a/Documentation/mips/AU1xxx_IDE.README b/Documentation/arch/mips/AU1xxx_IDE.README
similarity index 100%
rename from Documentation/mips/AU1xxx_IDE.README
rename to Documentation/arch/mips/AU1xxx_IDE.README
diff --git a/Documentation/nios2/README b/Documentation/arch/nios2/README
similarity index 100%
rename from Documentation/nios2/README
rename to Documentation/arch/nios2/README
diff --git a/Documentation/parisc/debugging b/Documentation/arch/parisc/debugging
similarity index 100%
rename from Documentation/parisc/debugging
rename to Documentation/arch/parisc/debugging
diff --git a/Documentation/parisc/registers b/Documentation/arch/parisc/registers
similarity index 100%
rename from Documentation/parisc/registers
rename to Documentation/arch/parisc/registers
diff --git a/Documentation/powerpc/DAWR-POWER9.txt b/Documentation/arch/powerpc/DAWR-POWER9.txt
similarity index 100%
rename from Documentation/powerpc/DAWR-POWER9.txt
rename to Documentation/arch/powerpc/DAWR-POWER9.txt
diff --git a/Documentation/powerpc/bootwrapper.txt b/Documentation/arch/powerpc/bootwrapper.txt
similarity index 100%
rename from Documentation/powerpc/bootwrapper.txt
rename to Documentation/arch/powerpc/bootwrapper.txt
diff --git a/Documentation/powerpc/cpu_families.txt b/Documentation/arch/powerpc/cpu_families.txt
similarity index 100%
rename from Documentation/powerpc/cpu_families.txt
rename to Documentation/arch/powerpc/cpu_families.txt
diff --git a/Documentation/powerpc/cpu_features.txt b/Documentation/arch/powerpc/cpu_features.txt
similarity index 100%
rename from Documentation/powerpc/cpu_features.txt
rename to Documentation/arch/powerpc/cpu_features.txt
diff --git a/Documentation/powerpc/cxl.txt b/Documentation/arch/powerpc/cxl.txt
similarity index 100%
rename from Documentation/powerpc/cxl.txt
rename to Documentation/arch/powerpc/cxl.txt
diff --git a/Documentation/powerpc/cxlflash.txt b/Documentation/arch/powerpc/cxlflash.txt
similarity index 100%
rename from Documentation/powerpc/cxlflash.txt
rename to Documentation/arch/powerpc/cxlflash.txt
diff --git a/Documentation/powerpc/dscr.txt b/Documentation/arch/powerpc/dscr.txt
similarity index 100%
rename from Documentation/powerpc/dscr.txt
rename to Documentation/arch/powerpc/dscr.txt
diff --git a/Documentation/powerpc/eeh-pci-error-recovery.txt b/Documentation/arch/powerpc/eeh-pci-error-recovery.txt
similarity index 100%
rename from Documentation/powerpc/eeh-pci-error-recovery.txt
rename to Documentation/arch/powerpc/eeh-pci-error-recovery.txt
diff --git a/Documentation/powerpc/firmware-assisted-dump.txt b/Documentation/arch/powerpc/firmware-assisted-dump.txt
similarity index 100%
rename from Documentation/powerpc/firmware-assisted-dump.txt
rename to Documentation/arch/powerpc/firmware-assisted-dump.txt
diff --git a/Documentation/powerpc/hvcs.txt b/Documentation/arch/powerpc/hvcs.txt
similarity index 100%
rename from Documentation/powerpc/hvcs.txt
rename to Documentation/arch/powerpc/hvcs.txt
diff --git a/Documentation/powerpc/isa-versions.rst b/Documentation/arch/powerpc/isa-versions.rst
similarity index 100%
rename from Documentation/powerpc/isa-versions.rst
rename to Documentation/arch/powerpc/isa-versions.rst
diff --git a/Documentation/powerpc/mpc52xx.txt b/Documentation/arch/powerpc/mpc52xx.txt
similarity index 100%
rename from Documentation/powerpc/mpc52xx.txt
rename to Documentation/arch/powerpc/mpc52xx.txt
diff --git a/Documentation/powerpc/pci_iov_resource_on_powernv.txt b/Documentation/arch/powerpc/pci_iov_resource_on_powernv.txt
similarity index 100%
rename from Documentation/powerpc/pci_iov_resource_on_powernv.txt
rename to Documentation/arch/powerpc/pci_iov_resource_on_powernv.txt
diff --git a/Documentation/powerpc/pmu-ebb.txt b/Documentation/arch/powerpc/pmu-ebb.txt
similarity index 100%
rename from Documentation/powerpc/pmu-ebb.txt
rename to Documentation/arch/powerpc/pmu-ebb.txt
diff --git a/Documentation/powerpc/ptrace.txt b/Documentation/arch/powerpc/ptrace.txt
similarity index 100%
rename from Documentation/powerpc/ptrace.txt
rename to Documentation/arch/powerpc/ptrace.txt
diff --git a/Documentation/powerpc/qe_firmware.txt b/Documentation/arch/powerpc/qe_firmware.txt
similarity index 100%
rename from Documentation/powerpc/qe_firmware.txt
rename to Documentation/arch/powerpc/qe_firmware.txt
diff --git a/Documentation/powerpc/syscall64-abi.txt b/Documentation/arch/powerpc/syscall64-abi.txt
similarity index 100%
rename from Documentation/powerpc/syscall64-abi.txt
rename to Documentation/arch/powerpc/syscall64-abi.txt
diff --git a/Documentation/powerpc/transactional_memory.txt b/Documentation/arch/powerpc/transactional_memory.txt
similarity index 100%
rename from Documentation/powerpc/transactional_memory.txt
rename to Documentation/arch/powerpc/transactional_memory.txt
diff --git a/Documentation/riscv/index.rst b/Documentation/arch/riscv/index.rst
similarity index 100%
rename from Documentation/riscv/index.rst
rename to Documentation/arch/riscv/index.rst
diff --git a/Documentation/riscv/pmu.rst b/Documentation/arch/riscv/pmu.rst
similarity index 100%
rename from Documentation/riscv/pmu.rst
rename to Documentation/arch/riscv/pmu.rst
diff --git a/Documentation/s390/3270.ChangeLog b/Documentation/arch/s390/3270.ChangeLog
similarity index 100%
rename from Documentation/s390/3270.ChangeLog
rename to Documentation/arch/s390/3270.ChangeLog
diff --git a/Documentation/s390/3270.rst b/Documentation/arch/s390/3270.rst
similarity index 100%
rename from Documentation/s390/3270.rst
rename to Documentation/arch/s390/3270.rst
diff --git a/Documentation/s390/cds.rst b/Documentation/arch/s390/cds.rst
similarity index 100%
rename from Documentation/s390/cds.rst
rename to Documentation/arch/s390/cds.rst
diff --git a/Documentation/s390/common_io.rst b/Documentation/arch/s390/common_io.rst
similarity index 100%
rename from Documentation/s390/common_io.rst
rename to Documentation/arch/s390/common_io.rst
diff --git a/Documentation/s390/config3270.sh b/Documentation/arch/s390/config3270.sh
similarity index 100%
rename from Documentation/s390/config3270.sh
rename to Documentation/arch/s390/config3270.sh
diff --git a/Documentation/s390/dasd.rst b/Documentation/arch/s390/dasd.rst
similarity index 100%
rename from Documentation/s390/dasd.rst
rename to Documentation/arch/s390/dasd.rst
diff --git a/Documentation/s390/debugging390.rst b/Documentation/arch/s390/debugging390.rst
similarity index 100%
rename from Documentation/s390/debugging390.rst
rename to Documentation/arch/s390/debugging390.rst
diff --git a/Documentation/s390/driver-model.rst b/Documentation/arch/s390/driver-model.rst
similarity index 100%
rename from Documentation/s390/driver-model.rst
rename to Documentation/arch/s390/driver-model.rst
diff --git a/Documentation/s390/index.rst b/Documentation/arch/s390/index.rst
similarity index 100%
rename from Documentation/s390/index.rst
rename to Documentation/arch/s390/index.rst
diff --git a/Documentation/s390/monreader.rst b/Documentation/arch/s390/monreader.rst
similarity index 100%
rename from Documentation/s390/monreader.rst
rename to Documentation/arch/s390/monreader.rst
diff --git a/Documentation/s390/qeth.rst b/Documentation/arch/s390/qeth.rst
similarity index 100%
rename from Documentation/s390/qeth.rst
rename to Documentation/arch/s390/qeth.rst
diff --git a/Documentation/s390/s390dbf.rst b/Documentation/arch/s390/s390dbf.rst
similarity index 100%
rename from Documentation/s390/s390dbf.rst
rename to Documentation/arch/s390/s390dbf.rst
diff --git a/Documentation/s390/text_files.rst b/Documentation/arch/s390/text_files.rst
similarity index 100%
rename from Documentation/s390/text_files.rst
rename to Documentation/arch/s390/text_files.rst
diff --git a/Documentation/s390/vfio-ap.rst b/Documentation/arch/s390/vfio-ap.rst
similarity index 100%
rename from Documentation/s390/vfio-ap.rst
rename to Documentation/arch/s390/vfio-ap.rst
diff --git a/Documentation/s390/vfio-ccw.rst b/Documentation/arch/s390/vfio-ccw.rst
similarity index 100%
rename from Documentation/s390/vfio-ccw.rst
rename to Documentation/arch/s390/vfio-ccw.rst
diff --git a/Documentation/s390/zfcpdump.rst b/Documentation/arch/s390/zfcpdump.rst
similarity index 100%
rename from Documentation/s390/zfcpdump.rst
rename to Documentation/arch/s390/zfcpdump.rst
diff --git a/Documentation/sh/conf.py b/Documentation/arch/sh/conf.py
similarity index 100%
rename from Documentation/sh/conf.py
rename to Documentation/arch/sh/conf.py
diff --git a/Documentation/sh/index.rst b/Documentation/arch/sh/index.rst
similarity index 100%
rename from Documentation/sh/index.rst
rename to Documentation/arch/sh/index.rst
diff --git a/Documentation/sh/new-machine.txt b/Documentation/arch/sh/new-machine.txt
similarity index 100%
rename from Documentation/sh/new-machine.txt
rename to Documentation/arch/sh/new-machine.txt
diff --git a/Documentation/sh/register-banks.txt b/Documentation/arch/sh/register-banks.txt
similarity index 100%
rename from Documentation/sh/register-banks.txt
rename to Documentation/arch/sh/register-banks.txt
diff --git a/Documentation/sparc/adi.rst b/Documentation/arch/sparc/adi.rst
similarity index 100%
rename from Documentation/sparc/adi.rst
rename to Documentation/arch/sparc/adi.rst
diff --git a/Documentation/sparc/console.rst b/Documentation/arch/sparc/console.rst
similarity index 100%
rename from Documentation/sparc/console.rst
rename to Documentation/arch/sparc/console.rst
diff --git a/Documentation/sparc/index.rst b/Documentation/arch/sparc/index.rst
similarity index 100%
rename from Documentation/sparc/index.rst
rename to Documentation/arch/sparc/index.rst
diff --git a/Documentation/sparc/oradax/dax-hv-api.txt b/Documentation/arch/sparc/oradax/dax-hv-api.txt
similarity index 100%
rename from Documentation/sparc/oradax/dax-hv-api.txt
rename to Documentation/arch/sparc/oradax/dax-hv-api.txt
diff --git a/Documentation/sparc/oradax/oracle-dax.rst b/Documentation/arch/sparc/oradax/oracle-dax.rst
similarity index 100%
rename from Documentation/sparc/oradax/oracle-dax.rst
rename to Documentation/arch/sparc/oradax/oracle-dax.rst
diff --git a/Documentation/x86/amd-memory-encryption.rst b/Documentation/arch/x86/amd-memory-encryption.rst
similarity index 100%
rename from Documentation/x86/amd-memory-encryption.rst
rename to Documentation/arch/x86/amd-memory-encryption.rst
diff --git a/Documentation/x86/boot.rst b/Documentation/arch/x86/boot.rst
similarity index 100%
rename from Documentation/x86/boot.rst
rename to Documentation/arch/x86/boot.rst
diff --git a/Documentation/x86/conf.py b/Documentation/arch/x86/conf.py
similarity index 100%
rename from Documentation/x86/conf.py
rename to Documentation/arch/x86/conf.py
diff --git a/Documentation/x86/earlyprintk.rst b/Documentation/arch/x86/earlyprintk.rst
similarity index 100%
rename from Documentation/x86/earlyprintk.rst
rename to Documentation/arch/x86/earlyprintk.rst
diff --git a/Documentation/x86/entry_64.rst b/Documentation/arch/x86/entry_64.rst
similarity index 100%
rename from Documentation/x86/entry_64.rst
rename to Documentation/arch/x86/entry_64.rst
diff --git a/Documentation/x86/exception-tables.rst b/Documentation/arch/x86/exception-tables.rst
similarity index 100%
rename from Documentation/x86/exception-tables.rst
rename to Documentation/arch/x86/exception-tables.rst
diff --git a/Documentation/x86/i386/IO-APIC.rst b/Documentation/arch/x86/i386/IO-APIC.rst
similarity index 100%
rename from Documentation/x86/i386/IO-APIC.rst
rename to Documentation/arch/x86/i386/IO-APIC.rst
diff --git a/Documentation/x86/i386/index.rst b/Documentation/arch/x86/i386/index.rst
similarity index 100%
rename from Documentation/x86/i386/index.rst
rename to Documentation/arch/x86/i386/index.rst
diff --git a/Documentation/x86/index.rst b/Documentation/arch/x86/index.rst
similarity index 100%
rename from Documentation/x86/index.rst
rename to Documentation/arch/x86/index.rst
diff --git a/Documentation/x86/intel_mpx.rst b/Documentation/arch/x86/intel_mpx.rst
similarity index 100%
rename from Documentation/x86/intel_mpx.rst
rename to Documentation/arch/x86/intel_mpx.rst
diff --git a/Documentation/x86/kernel-stacks.rst b/Documentation/arch/x86/kernel-stacks.rst
similarity index 100%
rename from Documentation/x86/kernel-stacks.rst
rename to Documentation/arch/x86/kernel-stacks.rst
diff --git a/Documentation/x86/mds.rst b/Documentation/arch/x86/mds.rst
similarity index 100%
rename from Documentation/x86/mds.rst
rename to Documentation/arch/x86/mds.rst
diff --git a/Documentation/x86/microcode.rst b/Documentation/arch/x86/microcode.rst
similarity index 100%
rename from Documentation/x86/microcode.rst
rename to Documentation/arch/x86/microcode.rst
diff --git a/Documentation/x86/mtrr.rst b/Documentation/arch/x86/mtrr.rst
similarity index 100%
rename from Documentation/x86/mtrr.rst
rename to Documentation/arch/x86/mtrr.rst
diff --git a/Documentation/x86/orc-unwinder.rst b/Documentation/arch/x86/orc-unwinder.rst
similarity index 100%
rename from Documentation/x86/orc-unwinder.rst
rename to Documentation/arch/x86/orc-unwinder.rst
diff --git a/Documentation/x86/pat.rst b/Documentation/arch/x86/pat.rst
similarity index 100%
rename from Documentation/x86/pat.rst
rename to Documentation/arch/x86/pat.rst
diff --git a/Documentation/x86/pti.rst b/Documentation/arch/x86/pti.rst
similarity index 100%
rename from Documentation/x86/pti.rst
rename to Documentation/arch/x86/pti.rst
diff --git a/Documentation/x86/resctrl_ui.rst b/Documentation/arch/x86/resctrl_ui.rst
similarity index 100%
rename from Documentation/x86/resctrl_ui.rst
rename to Documentation/arch/x86/resctrl_ui.rst
diff --git a/Documentation/x86/tlb.rst b/Documentation/arch/x86/tlb.rst
similarity index 100%
rename from Documentation/x86/tlb.rst
rename to Documentation/arch/x86/tlb.rst
diff --git a/Documentation/x86/topology.rst b/Documentation/arch/x86/topology.rst
similarity index 100%
rename from Documentation/x86/topology.rst
rename to Documentation/arch/x86/topology.rst
diff --git a/Documentation/x86/usb-legacy-support.rst b/Documentation/arch/x86/usb-legacy-support.rst
similarity index 100%
rename from Documentation/x86/usb-legacy-support.rst
rename to Documentation/arch/x86/usb-legacy-support.rst
diff --git a/Documentation/x86/x86_64/5level-paging.rst b/Documentation/arch/x86/x86_64/5level-paging.rst
similarity index 100%
rename from Documentation/x86/x86_64/5level-paging.rst
rename to Documentation/arch/x86/x86_64/5level-paging.rst
diff --git a/Documentation/x86/x86_64/boot-options.rst b/Documentation/arch/x86/x86_64/boot-options.rst
similarity index 100%
rename from Documentation/x86/x86_64/boot-options.rst
rename to Documentation/arch/x86/x86_64/boot-options.rst
diff --git a/Documentation/x86/x86_64/cpu-hotplug-spec.rst b/Documentation/arch/x86/x86_64/cpu-hotplug-spec.rst
similarity index 100%
rename from Documentation/x86/x86_64/cpu-hotplug-spec.rst
rename to Documentation/arch/x86/x86_64/cpu-hotplug-spec.rst
diff --git a/Documentation/x86/x86_64/fake-numa-for-cpusets.rst b/Documentation/arch/x86/x86_64/fake-numa-for-cpusets.rst
similarity index 100%
rename from Documentation/x86/x86_64/fake-numa-for-cpusets.rst
rename to Documentation/arch/x86/x86_64/fake-numa-for-cpusets.rst
diff --git a/Documentation/x86/x86_64/index.rst b/Documentation/arch/x86/x86_64/index.rst
similarity index 100%
rename from Documentation/x86/x86_64/index.rst
rename to Documentation/arch/x86/x86_64/index.rst
diff --git a/Documentation/x86/x86_64/machinecheck.rst b/Documentation/arch/x86/x86_64/machinecheck.rst
similarity index 100%
rename from Documentation/x86/x86_64/machinecheck.rst
rename to Documentation/arch/x86/x86_64/machinecheck.rst
diff --git a/Documentation/x86/x86_64/mm.rst b/Documentation/arch/x86/x86_64/mm.rst
similarity index 100%
rename from Documentation/x86/x86_64/mm.rst
rename to Documentation/arch/x86/x86_64/mm.rst
diff --git a/Documentation/x86/x86_64/uefi.rst b/Documentation/arch/x86/x86_64/uefi.rst
similarity index 100%
rename from Documentation/x86/x86_64/uefi.rst
rename to Documentation/arch/x86/x86_64/uefi.rst
diff --git a/Documentation/x86/zero-page.rst b/Documentation/arch/x86/zero-page.rst
similarity index 100%
rename from Documentation/x86/zero-page.rst
rename to Documentation/arch/x86/zero-page.rst
diff --git a/Documentation/xtensa/atomctl.txt b/Documentation/arch/xtensa/atomctl.txt
similarity index 100%
rename from Documentation/xtensa/atomctl.txt
rename to Documentation/arch/xtensa/atomctl.txt
diff --git a/Documentation/xtensa/booting.txt b/Documentation/arch/xtensa/booting.txt
similarity index 100%
rename from Documentation/xtensa/booting.txt
rename to Documentation/arch/xtensa/booting.txt
diff --git a/Documentation/xtensa/mmu.txt b/Documentation/arch/xtensa/mmu.txt
similarity index 100%
rename from Documentation/xtensa/mmu.txt
rename to Documentation/arch/xtensa/mmu.txt
-- 
2.19.1.856.g8858448bb

