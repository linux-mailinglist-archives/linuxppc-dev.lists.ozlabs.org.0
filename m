Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 552364463C2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 14:03:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hm0zq1kPTz3bN8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 00:03:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ehnDpWEv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hm0z6347yz2yfZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Nov 2021 00:02:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ehnDpWEv; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hm0ys70hxz4xcv;
 Sat,  6 Nov 2021 00:02:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1636117345;
 bh=sZyekvqn6dq27feDYIUhUpSJNvO0e6/O4q8+HcGAVao=;
 h=From:To:Cc:Subject:Date:From;
 b=ehnDpWEv6sRQVPDQBTzb9zg1P4/GJZFhtDry5WdRYwE77jWChQfVQRDd224lKHzpF
 Y/II6Vt/44/9QJhkF6PJklSTBnckto9bqZoYQ068Pz3w5H/HVMa1R3RwwXDoh7gm4S
 6C70ucWA9J+/mrQVoK0YF5vLDSewtzgEPfspGYEb8WPYc6t6La/qHTj7uQ5/cZ0byU
 M1v1Oek4oRwyUEyCwLCGkCXQDTMrTxE2SNoDHTo7GpmHB03l9GvGBQLuCjrhsDneH0
 0pQ7UrDfP54r3ZewRA0fzRD6IdQcPpNzDSAOyWAdn5IOFTg0M8hvnVkpUPPGcBixu2
 mNeqKZQUsobsg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.16-1 tag
Date: Sat, 06 Nov 2021 00:02:09 +1100
Message-ID: <87v9167o32.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: nathanl@linux.ibm.com, songkai01@inspur.com, aik@ozlabs.ru,
 kda@linux-powerpc.org, gustavoars@kernel.org, wanjiabing@vivo.com,
 cuibixuan@linux.alibaba.com, peterz@infradead.org, joel@jms.id.au,
 u.kleine-koenig@pengutronix.de, agust@denx.de, atrajeev@linux.vnet.ibm.cm,
 lvivier@redhat.com, schnelle@linux.ibm.com, npiggin@gmail.com, clg@kaod.org,
 nixiaoming@huawei.com, hbathini@linux.ibm.com, dja@axtens.net,
 atrajeev@linux.vnet.ibm.com, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, hegdevasant@linux.vnet.ibm.com,
 pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull a small batch of powerpc updates for 5.16:

The following changes since commit e4e737bb5c170df6135a127739a9e6148ee3da82:

  Linux 5.15-rc2 (2021-09-19 17:28:22 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.16-1

for you to fetch changes up to c12ab8dbc492b992e1ea717db933cee568780c47:

  powerpc/8xx: Fix Oops with STRICT_KERNEL_RWX without DEBUG_RODATA_TEST (2=
021-11-01 21:39:03 +1100)

- ------------------------------------------------------------------
powerpc updates for 5.16

 - Enable STRICT_KERNEL_RWX for Freescale 85xx platforms.

 - Activate CONFIG_STRICT_KERNEL_RWX by default, while still allowing it to=
 be disabled.

 - Add support for out-of-line static calls on 32-bit.

 - Fix oopses doing bpf-to-bpf calls when STRICT_KERNEL_RWX is enabled.

 - Fix boot hangs on e5500 due to stale value in ESR passed to do_page_faul=
t().

 - Fix several bugs on pseries in handling of device tree cache information=
 for hotplugged
   CPUs, and/or during partition migration.

 - Various other small features and fixes.

Thanks to: Alexey Kardashevskiy, Alistair Popple, Anatolij Gustschin, Andre=
w Donnellan,
Athira Rajeev, Bixuan Cui, Bjorn Helgaas, C=C3=A9dric Le Goater, Christophe=
 Leroy, Daniel
Axtens, Daniel Henrique Barboza, Denis Kirjanov, Fabiano Rosas, Frederic Ba=
rrat, Gustavo
A. R. Silva, Hari Bathini, Jacques de Laval, Joel Stanley, Kai Song, Kajol =
Jain, Laurent
Vivier, Leonardo Bras, Madhavan Srinivasan, Nathan Chancellor, Nathan Lynch=
, Naveen N.
Rao, Nicholas Piggin, Nick Desaulniers, Niklas Schnelle, Oliver O'Halloran,=
 Rob Herring,
Russell Currey, Srikar Dronamraju, Stan Johnson, Tyrel Datwyler, Uwe Kleine=
-K=C3=B6nig, Vasant
Hegde, Wan Jiabing, Xiaoming Ni,

- ------------------------------------------------------------------
Alexey Kardashevskiy (1):
      powerps/pseries/dma: Add support for 2M IOMMU page size

Anatolij Gustschin (3):
      powerpc/5200: dts: add missing pci ranges
      powerpc/5200: dts: fix pci ranges warnings
      powerpc/5200: dts: fix memory node unit name

Athira Rajeev (3):
      powerpc/perf: Refactor the code definition of perf reg extended mask
      powerpc/perf: Expose instruction and data address registers as part o=
f extended regs
      powerpc/perf: Fix cycles/instructions as PM_CYC/PM_INST_CMPL in power=
10

Bixuan Cui (1):
      powerpc/44x/fsp2: add missing of_node_put

Christophe Leroy (31):
      powerpc/476: Fix sparse report
      powerpc/powermac: Remove stale declaration of pmac_md
      powerpc/mem: Fix arch/powerpc/mm/mem.c:53:12: error: no previous prot=
otype for 'create_section_mapping'
      video: fbdev: chipsfb: use memset_io() instead of memset()
      powerpc: Set max_mapnr correctly
      powerpc: Mark .opd section read-only
      powerpc/booke: Disable STRICT_KERNEL_RWX, DEBUG_PAGEALLOC and KFENCE
      powerpc/fsl_booke: Rename fsl_booke.c to fsl_book3e.c
      powerpc/fsl_booke: Take exec flag into account when setting TLBCAMs
      powerpc/fsl_booke: Enable reloading of TLBCAM without switching to AS1
      powerpc/fsl_booke: Tell map_mem_in_cams() if init is done
      powerpc/fsl_booke: Allocate separate TLBCAMs for readonly memory
      powerpc/fsl_booke: Update of TLBCAMs after init
      powerpc/fsl_booke: Enable STRICT_KERNEL_RWX
      powerpc/32: Don't use lmw/stmw for saving/restoring non volatile regs
      powerpc/audit: Convert powerpc to AUDIT_ARCH_COMPAT_GENERIC
      powerpc/time: Remove generic_suspend_{dis/en}able_irqs()
      powerpc/machdep: Remove stale functions from ppc_md structure
      powerpc/32: Add support for out-of-line static calls
      powerpc: warn on emulation of dcbz instruction in kernel mode
      powerpc/lib/sstep: Don't use __{get/put}_user() on kernel addresses
      powerpc/8xx: Simplify TLB handling
      powerpc: Activate CONFIG_STRICT_KERNEL_RWX by default
      powerpc/breakpoint: Cleanup
      powerpc/32: Don't use a struct based type for pte_t
      powerpc/boot: Set LC_ALL=3DC in wrapper script
      powerpc/nohash: Fix __ptep_set_access_flags() and ptep_set_wrprotect()
      powerpc/book3e: Fix set_memory_x() and set_memory_nx()
      powerpc/fsl_booke: Fix setting of exec flag when setting TLBCAMs
      powerpc: Don't provide __kernel_map_pages() without ARCH_SUPPORTS_DEB=
UG_PAGEALLOC
      powerpc/8xx: Fix Oops with STRICT_KERNEL_RWX without DEBUG_RODATA_TEST

C=C3=A9dric Le Goater (1):
      powerpc/boot: Use CONFIG_PPC_POWERNV to compile OPAL support

Daniel Axtens (1):
      powerpc: Remove unused prototype for of_show_percpuinfo

Denis Kirjanov (1):
      powerpc/xmon: fix task state output

Gustavo A. R. Silva (1):
      powerpc/vas: Fix potential NULL pointer dereference

Hari Bathini (1):
      powerpc/bpf: Fix write protecting JIT code

Joel Stanley (2):
      powerpc/s64: Clarify that radix lacks DEBUG_PAGEALLOC
      powerpc/64s: Default to 64K pages for 64 bit book3s

Kai Song (1):
      powerpc/eeh: Fix docstrings in eeh.c

Laurent Vivier (1):
      KVM: PPC: Tick accounting should defer vtime accounting 'til after IR=
Q handling

Michael Ellerman (4):
      Revert "powerpc/audit: Convert powerpc to AUDIT_ARCH_COMPAT_GENERIC"
      powerpc/dcr: Use cmplwi instead of 3-argument cmpli
      MAINTAINERS: Update powerpc KVM entry
      Merge branch 'topic/ppc-kvm' into next

Nathan Lynch (8):
      powerpc: fix unbalanced node refcount in check_kvm_guest()
      powerpc/paravirt: vcpu_is_preempted() commentary
      powerpc/paravirt: correct preempt debug splat in vcpu_is_preempted()
      powerpc/pseries/cpuhp: cache node corrections
      powerpc/cpuhp: BUG -> WARN conversion in offline path
      powerpc/pseries/cpuhp: delete add/remove_by_count code
      powerpc/pseries/cpuhp: remove obsolete comment from pseries_cpu_die
      powerpc/pseries/mobility: ignore ibm, platform-facilities updates

Nicholas Piggin (3):
      KVM: PPC: Book3S HV: H_ENTER filter out reserved HPTE[B] value
      powerpc/64s/interrupt: Fix check_return_regs_valid() false positive
      powerpc/32e: Ignore ESR in instruction storage interrupt handler

Nick Desaulniers (1):
      powerpc/asm: Remove UPD_CONSTR after GCC 4.9 removal

Niklas Schnelle (1):
      powerpc: Drop superfluous pci_dev_is_added() calls

Russell Currey (2):
      selftests/powerpc: Use date instead of EPOCHSECONDS in mitigation-pat=
ching.sh
      powerpc/security: Use a mutex for interrupt exit code patching

Uwe Kleine-K=C3=B6nig (1):
      powerpc/83xx/mpc8349emitx: Make mcu_gpiochip_remove() return void

Vasant Hegde (2):
      powerpc/powernv/dump: Fix typo in comment
      powerpc/powernv/prd: Unregister OPAL_MSG_PRD2 notifier during module =
unload

Wan Jiabing (2):
      powerpc/pseries/iommu: Add of_node_put() before break
      powerpc/kexec_file: Add of_node_put() before goto

Xiaoming Ni (2):
      powerpc/85xx: Fix oops when mpc85xx_smp_guts_ids node cannot be found
      powerpc/85xx: fix timebase sync issue when CONFIG_HOTPLUG_CPU=3Dn


 MAINTAINERS                                                     |   7 +-
 arch/powerpc/Kconfig                                            |  20 +-
 arch/powerpc/boot/Makefile                                      |   2 +-
 arch/powerpc/boot/dts/a4m072.dts                                |   6 +-
 arch/powerpc/boot/dts/charon.dts                                |   8 +-
 arch/powerpc/boot/dts/digsy_mtc.dts                             |   8 +-
 arch/powerpc/boot/dts/lite5200.dts                              |   8 +-
 arch/powerpc/boot/dts/lite5200b.dts                             |   8 +-
 arch/powerpc/boot/dts/media5200.dts                             |   8 +-
 arch/powerpc/boot/dts/mpc5200b.dtsi                             |   6 +-
 arch/powerpc/boot/dts/mucmc52.dts                               |   6 +-
 arch/powerpc/boot/dts/o2d.dts                                   |   2 +-
 arch/powerpc/boot/dts/o2d.dtsi                                  |   2 +-
 arch/powerpc/boot/dts/o2dnt2.dts                                |   2 +-
 arch/powerpc/boot/dts/o3dnt.dts                                 |   2 +-
 arch/powerpc/boot/dts/pcm030.dts                                |   6 +-
 arch/powerpc/boot/dts/pcm032.dts                                |   8 +-
 arch/powerpc/boot/dts/tqm5200.dts                               |   8 +-
 arch/powerpc/boot/serial.c                                      |   2 +-
 arch/powerpc/boot/wrapper                                       |   2 +
 arch/powerpc/configs/cell_defconfig                             |   1 -
 arch/powerpc/configs/g5_defconfig                               |   1 +
 arch/powerpc/configs/maple_defconfig                            |   1 +
 arch/powerpc/configs/microwatt_defconfig                        |   1 +
 arch/powerpc/configs/pasemi_defconfig                           |   1 -
 arch/powerpc/configs/powernv_defconfig                          |   1 -
 arch/powerpc/configs/ppc64_defconfig                            |   1 -
 arch/powerpc/configs/ps3_defconfig                              |   1 +
 arch/powerpc/configs/pseries_defconfig                          |   1 -
 arch/powerpc/configs/skiroot_defconfig                          |   1 -
 arch/powerpc/include/asm/asm-const.h                            |   2 -
 arch/powerpc/include/asm/atomic.h                               |   8 +-
 arch/powerpc/include/asm/book3s/64/hash.h                       |   2 +
 arch/powerpc/include/asm/book3s/64/pgtable.h                    |  10 +
 arch/powerpc/include/asm/book3s/64/radix.h                      |   3 +
 arch/powerpc/include/asm/io.h                                   |   4 +-
 arch/powerpc/include/asm/iommu.h                                |   6 -
 arch/powerpc/include/asm/kexec.h                                |   1 -
 arch/powerpc/include/asm/kvm_book3s_64.h                        |   4 +
 arch/powerpc/include/asm/machdep.h                              |  13 -
 arch/powerpc/include/asm/nohash/32/pgtable.h                    |  21 +-
 arch/powerpc/include/asm/nohash/32/pte-8xx.h                    |  22 ++
 arch/powerpc/include/asm/nohash/64/pgtable.h                    |   5 -
 arch/powerpc/include/asm/nohash/pte-book3e.h                    |  18 +-
 arch/powerpc/include/asm/nohash/tlbflush.h                      |  15 +
 arch/powerpc/include/asm/paravirt.h                             |  40 ++-
 arch/powerpc/include/asm/pgtable-types.h                        |  18 +-
 arch/powerpc/include/asm/ppc_asm.h                              |   4 +-
 arch/powerpc/include/asm/static_call.h                          |  28 ++
 arch/powerpc/include/asm/uaccess.h                              |   6 +-
 arch/powerpc/include/uapi/asm/perf_regs.h                       |  28 +-
 arch/powerpc/kernel/Makefile                                    |   2 +-
 arch/powerpc/kernel/align.c                                     |   1 +
 arch/powerpc/kernel/eeh.c                                       |  12 +-
 arch/powerpc/kernel/firmware.c                                  |   7 +-
 arch/powerpc/kernel/head_8xx.S                                  |   2 +-
 arch/powerpc/kernel/head_booke.h                                |  15 +-
 arch/powerpc/kernel/hw_breakpoint_constraints.c                 |  15 +-
 arch/powerpc/kernel/interrupt.c                                 |   2 +-
 arch/powerpc/kernel/setup-common.c                              |   3 -
 arch/powerpc/kernel/static_call.c                               |  37 +++
 arch/powerpc/kernel/swsusp_64.c                                 |   5 -
 arch/powerpc/kernel/swsusp_asm64.S                              |   1 -
 arch/powerpc/kernel/sysfs.c                                     |   3 +-
 arch/powerpc/kernel/time.c                                      |  22 +-
 arch/powerpc/kernel/vmlinux.lds.S                               |  12 +-
 arch/powerpc/kexec/core.c                                       |  13 -
 arch/powerpc/kexec/core_32.c                                    |   2 +-
 arch/powerpc/kexec/core_64.c                                    |   2 +-
 arch/powerpc/kexec/file_load_64.c                               |   1 +
 arch/powerpc/kvm/book3s_hv.c                                    |  30 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c                             |   9 +
 arch/powerpc/kvm/booke.c                                        |  16 +-
 arch/powerpc/kvm/powerpc.c                                      |   4 +-
 arch/powerpc/lib/feature-fixups.c                               |  11 +
 arch/powerpc/lib/sstep.c                                        | 197 ++++=
+++++----
 arch/powerpc/mm/book3s64/hash_utils.c                           |   2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c                        |   7 +
 arch/powerpc/mm/mem.c                                           |   4 +-
 arch/powerpc/mm/mmu_decl.h                                      |   4 +-
 arch/powerpc/mm/nohash/Makefile                                 |   4 +-
 arch/powerpc/mm/nohash/{fsl_booke.c =3D> fsl_book3e.c}            |  76 ++=
++-
 arch/powerpc/mm/nohash/kaslr_booke.c                            |   2 +-
 arch/powerpc/mm/nohash/tlb.c                                    |   6 +-
 arch/powerpc/mm/nohash/tlb_low.S                                |   8 +-
 arch/powerpc/mm/nohash/tlb_low_64e.S                            |   8 +-
 arch/powerpc/mm/pgtable.c                                       |   2 +-
 arch/powerpc/mm/pgtable_32.c                                    |   2 +-
 arch/powerpc/net/bpf_jit_comp.c                                 |   2 +-
 arch/powerpc/perf/perf_regs.c                                   |   4 +
 arch/powerpc/perf/power10-events-list.h                         |   8 +-
 arch/powerpc/perf/power10-pmu.c                                 |  44 ++-
 arch/powerpc/platforms/44x/fsp2.c                               |   2 +
 arch/powerpc/platforms/44x/ppc476.c                             |   4 +-
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c                  |   7 +-
 arch/powerpc/platforms/85xx/Makefile                            |   4 +-
 arch/powerpc/platforms/85xx/mpc85xx_pm_ops.c                    |   7 +-
 arch/powerpc/platforms/85xx/smp.c                               |  12 +-
 arch/powerpc/platforms/book3s/vas-api.c                         |   4 +-
 arch/powerpc/platforms/powermac/pmac.h                          |   1 -
 arch/powerpc/platforms/powermac/setup.c                         |   2 -
 arch/powerpc/platforms/powernv/opal-dump.c                      |   2 +-
 arch/powerpc/platforms/powernv/opal-prd.c                       |  12 +-
 arch/powerpc/platforms/powernv/pci-sriov.c                      |   6 -
 arch/powerpc/platforms/pseries/hotplug-cpu.c                    | 298 ++++=
+---------------
 arch/powerpc/platforms/pseries/iommu.c                          |  14 +-
 arch/powerpc/platforms/pseries/mobility.c                       |  34 +++
 arch/powerpc/platforms/pseries/setup.c                          |   3 +-
 arch/powerpc/sysdev/dcr-low.S                                   |   2 +-
 arch/powerpc/xmon/xmon.c                                        |   3 +-
 drivers/video/fbdev/chipsfb.c                                   |   2 +-
 tools/testing/selftests/powerpc/security/mitigation-patching.sh |   4 +-
 112 files changed, 837 insertions(+), 582 deletions(-)
 create mode 100644 arch/powerpc/include/asm/static_call.h
 create mode 100644 arch/powerpc/kernel/static_call.c
 rename arch/powerpc/mm/nohash/{fsl_booke.c =3D> fsl_book3e.c} (84%)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmGFJ7sACgkQUevqPMjh
pYAxrQ/+MdmbOkjDzXJMkw55QAZH+iRmUZwkFzLtl2lrs/7d83x8VA+u2QVDsMgG
OGwm0jszQF553pNPwZ07GZfTi++8WpIIa/SR1y2wTG3JUadBF/owUjZPEb9iKBAH
mubh3TMiqWiyLCKtnalQdRUCUS/CpC9zJ3UQpvN5Ehh+A8+yJkreAj8CXT9nd27V
TmYrVmrOoFuDybCNeaUYkizp2cKcModb+5+QUkDsCVI7eKP8a4ddDS8h9q/e/Wru
SoyrMgLK2zrRXjvaKBD6y6h9fJbohL+gE0zjFgboxAN/EBCSNsQXI0lBpkiWh91d
c63dO7DlIBx5MZ7990g+QiV88+kz0FAB5wCt+d9z7bV9I9cKOwaoQlfexV3+V0Kb
n6kKb2Feqt8fo+79qxXLRZ3ZfsNRo1zBPQaVTNSyKfLpqc6dCe8eTNxTm1V6zv1R
gWBts0N7YqBAwB0gLCN5BEr11p33n84jMKsahJ38mWjTIRVK9shbjMRwAV11T6Qy
8aw4axp8YGPvalawvo7u+SaeZ6QOgy6O7pfVwCHyUGMf0AagVE/I/sz67ScG6qhL
JmyTuPyEQ7z+1BxlYNXWOS7FlzoMPSs5LIyOJoP+C3ly+GTnwlFkyJpJjss69YDU
P2Z8kfLHcsuFxe0q4wGmWFGzsVqFja0TJ2W+uVZjIOlJOSA0q6c=3D
=3DH9IO
-----END PGP SIGNATURE-----
