Return-Path: <linuxppc-dev+bounces-7335-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75475A70F3F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Mar 2025 03:53:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMrvN13vVz2yqg;
	Wed, 26 Mar 2025 13:53:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742957600;
	cv=none; b=Mg+n7KW8i8VcHxu8OaxivAJQboHcbtqPH2Oxfq/3wWJv/4Ga3vdvSgO4aas4kzPMMX4BMYapbgnsC1Lxu4Z+sxo8aOesIXWksLkPZZ6TlA0pGdlMPziu83VKI4iC5Y0XDHr/U/K57tZFjHcmliKj3r0OgOiXIY+Z69QiWOIzlU4unVv7gEuxSp6/SN4j2wCR5I0PqZr4zyylrB7JEaTCNAr3GHaPAiVwRpz7TTmBVat3Zzre8ruBe7zl87MMYlYbw865aLPHSkQUEH6o7FZwOS0FHbeA3W+qlMn4GseKNusK0gQ5EHqnOg68POAWn0FfckzVP79mzOoGIA3Ida1VWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742957600; c=relaxed/relaxed;
	bh=4kEzLGjpz0S5nVPjHEBAeYesS2S10LbB75yEHqiEyYU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=HdVjOn95HvY00XremcyFCdZgIniim+GxFK+OJG6+cGS091xoC45h/NFz0GTe9ImR8W1HhKkRQijkPie438fHXGxSlR7LMG4yQ8oeH235XX4skK+Zy+FrXMs5ELxyq3+7weOYNGLA1eTojiQ98WagBL0rIPTF/c8hQ8OR2x3INfHes4Y0iIqPiAPlJRXFF8FGjWXVvn4o+ZnbLTOfkS4dKk7tgyzPI3GlD3lw8LVULHa4K44aQ+iKC6lmcyjzx+JL653fjzKcSRcSdsG68vAJNhx1XbS/hZ5gdv1jrM2768FDwnVksmco4QhaYOA/LSRJPnPTBuWJCf/HHCy19TnFwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OE+WOA1F; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OE+WOA1F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZMrvL5gZBz2ynR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Mar 2025 13:53:18 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PKcjrZ032115;
	Wed, 26 Mar 2025 02:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=4kEzLGjpz0S5nVPjHEBAeYesS2S1
	0LbB75yEHqiEyYU=; b=OE+WOA1FIaAnoGGZWb9y2vbcTt/7bdHTgjNgHKC0v6cO
	8OXdRI1ktQt4lY+Bw5DSZF9B9j1USiz6UWRPY5wJXFiPMphGqIEjo6LwqTidWg75
	+BR79USu5q3mD7ASzt07m6j1VpTFZgRva62qirQfn0vqTIOqFAE60nzplUw8Os0h
	rH8NtqLL+uETaeLjGOEPTIseL1KwYOOcHyDWztjpnIzdUeKLvTsKLP7jipxsWBX5
	hteE4Hp8k5WaPPyD1L5DWg8L+gfJfn+Nh2Rhbn8dFLLy5pxKVRLK3lA4XTsz64Jw
	2ISt/zujW5xCTF3e8kw9DSCPt53tn1GwvYqfynVYYg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45m3q0h6db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 02:52:53 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52Q2qrOS030271;
	Wed, 26 Mar 2025 02:52:53 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45m3q0h6d9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 02:52:53 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q068rN030321;
	Wed, 26 Mar 2025 02:52:52 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45j7htekgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 02:52:52 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52Q2qpHl33423948
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Mar 2025 02:52:51 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 626EB58043;
	Wed, 26 Mar 2025 02:52:51 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3CC958055;
	Wed, 26 Mar 2025 02:52:38 +0000 (GMT)
Received: from [9.43.87.161] (unknown [9.43.87.161])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Mar 2025 02:52:38 +0000 (GMT)
Message-ID: <2fff6b84-52af-4320-8c8e-9aca1c009127@linux.ibm.com>
Date: Wed, 26 Mar 2025 08:22:36 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: adubey@linux.ibm.com, amachhiw@linux.ibm.com, arnd@arndb.de,
        atrajeev@linux.ibm.com, avnish@linux.ibm.com,
        christophe.leroy@csgroup.eu, gautam@linux.ibm.com,
        gbatra@linux.ibm.com, jk@ozlabs.org, kjain@linux.ibm.com,
        kuba@kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, paulus@ozlabs.org,
        robh@kernel.org, schwab@linux-m68k.org, segher@kernel.crashing.org,
        sourabhjain@linux.ibm.com, tglx@linutronix.de, vaibhav@linux.ibm.com,
        Michael Ellerman <mpe@ellerman.id.au>,
        Naveen N Rao <naveen@kernel.org>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.15-1 tag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8QMivAOAyqSka3hCr9r4XjKEexh0qSRa
X-Proofpoint-GUID: 8-WmLeZXzFIFP8sK7yeUoDiW6gDyngZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503260013
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 6.15.

No conflicts that I am aware of.
Thanks

Notable out of area changes:
  arch/x86/kernel/static_call.c         # d856bc3ac7d9 static_call_inline: Provide trampoline address when updating sites
  kernel/static_call_inline.c           # d856bc3ac7d9 static_call_inline: Provide trampoline address when updating sites
  drivers/cpufreq/*                     # 16479389cfeb cpufreq: ppc_cbe: Remove powerpc Cell driver
  kernel/irq/*                          # 333e8eb3e081 genirq: Remove IRQ_EDGE_EOI_HANDLER
  kernel/irq/chip.c                     # 333e8eb3e081 genirq: Remove IRQ_EDGE_EOI_HANDLER
  drivers/net/ethernet/toshiba/*        # d9fefcea813e net: spider_net: Remove powerpc Cell driver
  Documentation/networking/device_drivers/ethernet/index.rst    # d9fefcea813e net: spider_net: Remove powerpc Cell driver
  Documentation/networking/device_drivers/ethernet/toshiba/spider_net.rst       # d9fefcea813e net: spider_net: Remove powerpc Cell driver
  Documentation/admin-guide/kernel-per-CPU-kthreads.rst         # 215bd64ada73 docs: Remove reference to removed CBE_CPUFREQ_SPU_GOVERNOR

The following changes since commit a64dcfb451e254085a7daee5fe51bf22959d52d3:

  Linux 6.14-rc2 (2025-02-09 12:45:03 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.15-1

for you to fetch changes up to 861efb8a48ee8b73ae4e8817509cd4e82fd52bc4:

  powerpc/kexec: fix physical address calculation in clear_utlb_entry() (2025-03-10 10:10:55 +0530)

- ------------------------------------------------------------------
powerpc updates for 6.15

 - Removal of support for IBM Cell Blades

 - SMP support for microwatt platform

 - Support for inline static calls on PPC32

 - Enable pmu selftests for power11 platform

 - Enable hardware trace macro (HTM) hcall support

 - Support for limited address mode capability

 - Changes to RMA size from 512 MB to 768 MB to handle fadump

 - Misc fixes and cleanups

Thanks to: Abhishek Dubey, Amit Machhiwal, Andreas Schwab, Arnd Bergmann,
Athira Rajeev, Avnish Chouhan, Christophe Leroy, Disha Goel, Donet Tom, Gaurav
Batra, Gautam Menghani, Hari Bathini, Kajol Jain, Kees Cook, Mahesh Salgaonkar,
Michael Ellerman, Paul Mackerras, Ritesh Harjani (IBM), Sathvika Vasireddy,
Segher Boessenkool, Sourabh Jain, Vaibhav Jain, Venkat Rao Bagalkote.

- ------------------------------------------------------------------
Abhishek Dubey (3):
      powerpc/pseries: Macros and wrapper functions for H_HTM call
      powerpc/pseries: Export hardware trace macro dump via debugfs
      powerpc: Document details on H_HTM hcall

Amit Machhiwal (1):
      KVM: PPC: Enable CAP_SPAPR_TCE_VFIO on pSeries KVM guests

Andreas Schwab (1):
      powerpc/prom_init: Fixup missing #size-cells on PowerBook6,7

Athira Rajeev (6):
      arch/powerpc/perf: Check the instruction type before creating sample with perf_mem_data_src
      arch/powerpc/perf: Update get_mem_data_src function to use saved values of sier and mmcra regs
      tools/testing/selftests/powerpc: Enable pmu selftests for power11
      tools/testing/selftests/powerpc: Add check for power11 pvr for pmu selfests
      tools/testing/selftests/powerpc/pmu: Update comment description to mention ISA v3.1 for power10 and above
      selftests/powerpc/pmu: Update comment with details to understand auxv_generic_compat_pmu() utility function

Avnish Chouhan (1):
      powerpc: increase MIN RMA size for CAS negotiation

Christophe Leroy (12):
      powerpc/44x: Declare primary_uic static in uic.c
      powerpc/vmlinux: Remove etext, edata and end
      powerpc/32: Stop printing Kernel virtual memory layout
      powerpc/ipic: Stop printing address of registers
      powerpc/time: Define div128_by_32() static and __init
      static_call_inline: Provide trampoline address when updating sites
      objtool/powerpc: Add support for decoding all types of uncond branches
      powerpc: Prepare arch_static_call_transform() for supporting inline static calls
      powerpc/static_call: Implement inline static calls
      powerpc: Fix 'intra_function_call not a direct call' warning
      crypto: powerpc: Mark ghashp8-ppc.o as an OBJECT_FILES_NON_STANDARD
      powerpc/kexec: fix physical address calculation in clear_utlb_entry()

Gaurav Batra (2):
      powerpc/pseries/iommu: create DDW for devices with DMA mask less than 64-bits
      powerpc/pseries/iommu: memory notifier incorrectly adds TCEs for pmemory

Gautam Menghani (1):
      arch/powerpc: Remove unused function icp_native_cause_ipi_rm()

Kajol Jain (1):
      selftests/powerpc/pmu: Add interface test for extended reg support

Michael Ellerman (24):
      powerpc/cell: Remove support for IBM Cell Blades
      powerpc: Remove some Cell leftovers
      powerpc: Remove PPC_PMI and driver
      powerpc: Remove IBM_CELL_BLADE & SPIDER_NET references
      powerpc/cell: Remove CBE_CPUFREQ_SPU_GOVERNOR
      powerpc/xmon: Remove SPU debug and disassembly
      powerpc: Remove DCR_MMIO and the DCR generic layer
      powerpc: Remove PPC_OF_PLATFORM_PCI
      powerpc/io: Remove PPC_IO_WORKAROUNDS
      powerpc/io: Remove PPC_INDIRECT_MMIO
      powerpc/io: Remove PCI_FIX_ADDR
      powerpc/io: Unhook MMIO accessors
      powerpc/io: Remove unnecessary indirection
      powerpc/io: Wrap port calculation in a macro
      powerpc/io: Spell-out PCI_IO_ADDR
      powerpc/io: Use generic raw accessors
      powerpc/io: Rename _insw_ns() etc.
      powerpc/io: Use standard barrier macros in io.c
      powerpc: Remove UDBG_RTAS_CONSOLE
      docs: Remove reference to removed CBE_CPUFREQ_SPU_GOVERNOR
      genirq: Remove IRQ_EDGE_EOI_HANDLER
      cpufreq: ppc_cbe: Remove powerpc Cell driver
      net: spider_net: Remove powerpc Cell driver
      net: toshiba: Remove reference to PPC_IBM_CELL_BLADE

Paul Mackerras (5):
      powerpc/microwatt: Select COMMON_CLK in order to get the clock framework
      powerpc/microwatt: Device-tree updates
      powerpc/microwatt: Define an idle power-save function
      powerpc: Define config option for processors with broadcast TLBIE
      powerpc/microwatt: Add SMP support

Sourabh Jain (3):
      powerpc: export MIN RMA size
      powerpc/fadump: fix additional param memory reservation for HASH MMU
      Documentation/powerpc/fadump: add additional parameter feature details

Vaibhav Jain (1):
      powerpc/perf: Fix ref-counting on the PMU 'vpa_pmu'


 CREDITS                                                                                          |   11 +
 Documentation/ABI/testing/sysfs-kernel-fadump                                                    |    3 +-
 Documentation/admin-guide/kernel-per-CPU-kthreads.rst                                            |    7 +-
 Documentation/arch/powerpc/firmware-assisted-dump.rst                                            |   22 +
 Documentation/arch/powerpc/papr_hcalls.rst                                                       |   11 +
 Documentation/networking/device_drivers/ethernet/index.rst                                       |    1 -
 Documentation/networking/device_drivers/ethernet/toshiba/spider_net.rst                          |  202 --
 MAINTAINERS                                                                                      |    9 -
 arch/powerpc/Kconfig                                                                             |   11 +-
 arch/powerpc/Kconfig.debug                                                                       |    7 -
 arch/powerpc/boot/Makefile                                                                       |    2 -
 arch/powerpc/boot/dts/microwatt.dts                                                              |  107 +-
 arch/powerpc/configs/cell_defconfig                                                              |    2 -
 arch/powerpc/configs/ppc64_defconfig                                                             |    2 -
 arch/powerpc/crypto/Makefile                                                                     |    1 +
 arch/powerpc/include/asm/cell-pmu.h                                                              |   56 -
 arch/powerpc/include/asm/cell-regs.h                                                             |  296 ---
 arch/powerpc/include/asm/dcr-generic.h                                                           |   36 -
 arch/powerpc/include/asm/dcr-mmio.h                                                              |   44 -
 arch/powerpc/include/asm/dcr.h                                                                   |   32 -
 arch/powerpc/include/asm/hvcall.h                                                                |   34 +
 arch/powerpc/include/asm/io-defs.h                                                               |   70 +-
 arch/powerpc/include/asm/io-workarounds.h                                                        |   55 -
 arch/powerpc/include/asm/io.h                                                                    |  411 ++--
 arch/powerpc/include/asm/iommu.h                                                                 |    6 -
 arch/powerpc/include/asm/mmzone.h                                                                |    1 +
 arch/powerpc/include/asm/plpar_wrappers.h                                                        |   21 +
 arch/powerpc/include/asm/pmi.h                                                                   |   53 -
 arch/powerpc/include/asm/prom.h                                                                  |    2 +
 arch/powerpc/include/asm/spu_priv1.h                                                             |    2 -
 arch/powerpc/include/asm/static_call.h                                                           |    2 +
 arch/powerpc/include/asm/time.h                                                                  |    3 -
 arch/powerpc/include/asm/xics.h                                                                  |    1 -
 arch/powerpc/include/asm/xmon.h                                                                  |    2 -
 arch/powerpc/kernel/Makefile                                                                     |    4 +-
 arch/powerpc/kernel/dma-iommu.c                                                                  |    2 +-
 arch/powerpc/kernel/exceptions-64s.S                                                             |   55 -
 arch/powerpc/kernel/fadump.c                                                                     |   21 +-
 arch/powerpc/kernel/io-workarounds.c                                                             |  197 --
 arch/powerpc/kernel/io.c                                                                         |   58 +-
 arch/powerpc/kernel/of_platform.c                                                                |  102 -
 arch/powerpc/kernel/prom_init.c                                                                  |    6 +-
 arch/powerpc/kernel/rtas.c                                                                       |   75 -
 arch/powerpc/kernel/setup_64.c                                                                   |    2 +-
 arch/powerpc/kernel/static_call.c                                                                |   58 +-
 arch/powerpc/kernel/switch.S                                                                     |    1 -
 arch/powerpc/kernel/time.c                                                                       |   65 +-
 arch/powerpc/kernel/udbg.c                                                                       |    3 -
 arch/powerpc/kernel/vmlinux.lds.S                                                                |    9 -
 arch/powerpc/kexec/relocate_32.S                                                                 |    7 +-
 arch/powerpc/kvm/book3s_32_mmu_host.c                                                            |    2 -
 arch/powerpc/kvm/book3s_hv_rmhandlers.S                                                          |    2 -
 arch/powerpc/kvm/powerpc.c                                                                       |    5 +-
 arch/powerpc/mm/book3s64/hash_utils.c                                                            |   12 -
 arch/powerpc/mm/book3s64/pgtable.c                                                               |    4 +-
 arch/powerpc/mm/ioremap.c                                                                        |    9 -
 arch/powerpc/mm/ioremap_64.c                                                                     |    2 +-
 arch/powerpc/mm/mem.c                                                                            |   22 -
 arch/powerpc/mm/numa.c                                                                           |    2 +-
 arch/powerpc/perf/core-book3s.c                                                                  |   20 +
 arch/powerpc/perf/isa207-common.c                                                                |   18 +-
 arch/powerpc/perf/vpa-pmu.c                                                                      |    1 +
 arch/powerpc/platforms/44x/uic.c                                                                 |    2 +-
 arch/powerpc/platforms/Kconfig                                                                   |   10 -
 arch/powerpc/platforms/Kconfig.cputype                                                           |   13 +
 arch/powerpc/platforms/cell/Kconfig                                                              |   80 -
 arch/powerpc/platforms/cell/Makefile                                                             |   23 -
 arch/powerpc/platforms/cell/axon_msi.c                                                           |  481 ----
 arch/powerpc/platforms/cell/cbe_powerbutton.c                                                    |  106 -
 arch/powerpc/platforms/cell/cbe_regs.c                                                           |  298 ---
 arch/powerpc/platforms/cell/cbe_thermal.c                                                        |  387 ---
 arch/powerpc/platforms/cell/cell.h                                                               |   15 -
 arch/powerpc/platforms/cell/cpufreq_spudemand.c                                                  |  134 -
 arch/powerpc/platforms/cell/interrupt.c                                                          |  390 ---
 arch/powerpc/platforms/cell/interrupt.h                                                          |   90 -
 arch/powerpc/platforms/cell/iommu.c                                                              | 1060 --------
 arch/powerpc/platforms/cell/pervasive.c                                                          |  125 -
 arch/powerpc/platforms/cell/pervasive.h                                                          |   26 -
 arch/powerpc/platforms/cell/pmu.c                                                                |  412 ----
 arch/powerpc/platforms/cell/ras.c                                                                |  352 ---
 arch/powerpc/platforms/cell/ras.h                                                                |   13 -
 arch/powerpc/platforms/cell/setup.c                                                              |  274 ---
 arch/powerpc/platforms/cell/smp.c                                                                |  162 --
 arch/powerpc/platforms/cell/spider-pci.c                                                         |  170 --
 arch/powerpc/platforms/cell/spider-pic.c                                                         |  344 ---
 arch/powerpc/platforms/cell/spu_base.c                                                           |    2 -
 arch/powerpc/platforms/cell/spu_manage.c                                                         |  530 ----
 arch/powerpc/platforms/cell/spu_priv1_mmio.c                                                     |  167 --
 arch/powerpc/platforms/cell/spu_priv1_mmio.h                                                     |   14 -
 arch/powerpc/platforms/microwatt/Kconfig                                                         |    3 +-
 arch/powerpc/platforms/microwatt/Makefile                                                        |    1 +
 arch/powerpc/platforms/microwatt/microwatt.h                                                     |    1 +
 arch/powerpc/platforms/microwatt/setup.c                                                         |   18 +
 arch/powerpc/platforms/microwatt/smp.c                                                           |   80 +
 arch/powerpc/platforms/powernv/Kconfig                                                           |    1 +
 arch/powerpc/platforms/pseries/Kconfig                                                           |   10 +
 arch/powerpc/platforms/pseries/Makefile                                                          |    1 +
 arch/powerpc/platforms/pseries/htmdump.c                                                         |  121 +
 arch/powerpc/platforms/pseries/iommu.c                                                           |  139 +-
 arch/powerpc/sysdev/Makefile                                                                     |    1 -
 arch/powerpc/sysdev/dcr.c                                                                        |  182 --
 arch/powerpc/sysdev/ipic.c                                                                       |    3 +-
 arch/powerpc/sysdev/pmi.c                                                                        |  267 --
 arch/powerpc/sysdev/xics/icp-native.c                                                            |   21 -
 arch/powerpc/xmon/Makefile                                                                       |    5 +-
 arch/powerpc/xmon/spu-dis.c                                                                      |  237 --
 arch/powerpc/xmon/spu-insns.h                                                                    |  399 ---
 arch/powerpc/xmon/spu-opc.c                                                                      |   34 -
 arch/powerpc/xmon/spu.h                                                                          |  115 -
 arch/powerpc/xmon/xmon.c                                                                         |  273 ---
 arch/x86/kernel/static_call.c                                                                    |    2 +-
 drivers/cpufreq/Kconfig.powerpc                                                                  |   18 -
 drivers/cpufreq/Makefile                                                                         |    3 -
 drivers/cpufreq/ppc_cbe_cpufreq.c                                                                |  173 --
 drivers/cpufreq/ppc_cbe_cpufreq.h                                                                |   33 -
 drivers/cpufreq/ppc_cbe_cpufreq_pervasive.c                                                      |  102 -
 drivers/cpufreq/ppc_cbe_cpufreq_pmi.c                                                            |  150 --
 drivers/net/ethernet/toshiba/Kconfig                                                             |   11 +-
 drivers/net/ethernet/toshiba/Makefile                                                            |    2 -
 drivers/net/ethernet/toshiba/spider_net.c                                                        | 2556 --------------------
 drivers/net/ethernet/toshiba/spider_net.h                                                        |  475 ----
 drivers/net/ethernet/toshiba/spider_net_ethtool.c                                                |  174 --
 kernel/irq/Kconfig                                                                               |    4 -
 kernel/irq/chip.c                                                                                |   47 -
 kernel/static_call_inline.c                                                                      |    2 +-
 tools/objtool/arch/powerpc/decode.c                                                              |   10 +-
 tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p10.c              |    3 +-
 tools/testing/selftests/powerpc/pmu/event_code_tests/generic_events_valid_test.c                 |    3 +-
 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_l2l3_sel_test.c            |    2 +-
 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_radix_scope_qual_test.c    |    2 +-
 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_cmp_test.c          |    2 +-
 tools/testing/selftests/powerpc/pmu/event_code_tests/invalid_event_code_test.c                   |    4 +-
 tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_sample_elig_mode_test.c |    5 +-
 tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile                                      |    3 +-
 tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c                        |   17 +-
 tools/testing/selftests/powerpc/pmu/sampling_tests/check_extended_reg_test.c                     |   35 +
 tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c                                        |   20 +-
 tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h                                        |   12 +-
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_cond_test.c                        |    2 +-
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_no_branch_test.c           |    2 +-
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_test.c                     |    2 +-
 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_ind_call_test.c                    |    2 +-
 142 files changed, 1044 insertions(+), 12715 deletions(-)
 delete mode 100644 Documentation/networking/device_drivers/ethernet/toshiba/spider_net.rst
 delete mode 100644 arch/powerpc/include/asm/dcr-generic.h
 delete mode 100644 arch/powerpc/include/asm/dcr-mmio.h
 delete mode 100644 arch/powerpc/include/asm/io-workarounds.h
 delete mode 100644 arch/powerpc/include/asm/pmi.h
 delete mode 100644 arch/powerpc/kernel/io-workarounds.c
 delete mode 100644 arch/powerpc/kernel/of_platform.c
 delete mode 100644 arch/powerpc/platforms/cell/axon_msi.c
 delete mode 100644 arch/powerpc/platforms/cell/cbe_powerbutton.c
 delete mode 100644 arch/powerpc/platforms/cell/cbe_regs.c
 delete mode 100644 arch/powerpc/platforms/cell/cbe_thermal.c
 delete mode 100644 arch/powerpc/platforms/cell/cell.h
 delete mode 100644 arch/powerpc/platforms/cell/cpufreq_spudemand.c
 delete mode 100644 arch/powerpc/platforms/cell/interrupt.c
 delete mode 100644 arch/powerpc/platforms/cell/interrupt.h
 delete mode 100644 arch/powerpc/platforms/cell/iommu.c
 delete mode 100644 arch/powerpc/platforms/cell/pervasive.c
 delete mode 100644 arch/powerpc/platforms/cell/pervasive.h
 delete mode 100644 arch/powerpc/platforms/cell/pmu.c
 delete mode 100644 arch/powerpc/platforms/cell/ras.c
 delete mode 100644 arch/powerpc/platforms/cell/ras.h
 delete mode 100644 arch/powerpc/platforms/cell/setup.c
 delete mode 100644 arch/powerpc/platforms/cell/smp.c
 delete mode 100644 arch/powerpc/platforms/cell/spider-pci.c
 delete mode 100644 arch/powerpc/platforms/cell/spider-pic.c
 delete mode 100644 arch/powerpc/platforms/cell/spu_manage.c
 delete mode 100644 arch/powerpc/platforms/cell/spu_priv1_mmio.c
 delete mode 100644 arch/powerpc/platforms/cell/spu_priv1_mmio.h
 create mode 100644 arch/powerpc/platforms/microwatt/smp.c
 create mode 100644 arch/powerpc/platforms/pseries/htmdump.c
 delete mode 100644 arch/powerpc/sysdev/pmi.c
 delete mode 100644 arch/powerpc/xmon/spu-dis.c
 delete mode 100644 arch/powerpc/xmon/spu-insns.h
 delete mode 100644 arch/powerpc/xmon/spu-opc.c
 delete mode 100644 arch/powerpc/xmon/spu.h
 delete mode 100644 drivers/cpufreq/ppc_cbe_cpufreq.c
 delete mode 100644 drivers/cpufreq/ppc_cbe_cpufreq.h
 delete mode 100644 drivers/cpufreq/ppc_cbe_cpufreq_pervasive.c
 delete mode 100644 drivers/cpufreq/ppc_cbe_cpufreq_pmi.c
 delete mode 100644 drivers/net/ethernet/toshiba/spider_net.c
 delete mode 100644 drivers/net/ethernet/toshiba/spider_net.h
 delete mode 100644 drivers/net/ethernet/toshiba/spider_net_ethtool.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/check_extended_reg_test.c
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEqX2DNAOgU8sBX3pRpnEsdPSHZJQFAmfjamIACgkQpnEsdPSH
ZJR6bhAAvpKO6eMBnE+Ul1BvKpNAP5xlEwOiY5Y82BxXC1pMfy2B3quYRIhSZEXL
l+fmLaDF/HHK8rT8UyUjttrofQldtpxwtOsAoc5TUw1FntMSrGZtmoa0L0+jAtpl
R/E4I06e6CxYCz/NPO/mn0K3yhZKLKiAh6EwlVz+roWleAKpVxY8dboBF2YGE2Ls
jqHOX5xM0+Y+s+XIu8KHWbQj9BnpmhIdtATKGfDPSb3rV+QhgMOJOZtbh1N4h1Bz
h3LJRoRSsym8gWAqOD+I2kYmbR3J7ui0dEI2/0abF97dEwCEftSitN0PNBiMMLmo
uV4vdO6zHKu3z9hh9eINwp7yxQDltA8qVeDuAzPVMQSRQnzmA8Lbzv9T76hJNFxk
xKkI2BgJDZoCrjgDxh11SIPUV46Wzwc+RJtKkiPGW1FzE/sTNLFJt5kMoLl/OKIk
0jdSSwBudZl0ZUil7lrB3KnLYb2TlJLN71bE0+e6EvJEGQqnrEcsGNBJxm0/TK0e
XfmnDzkvhDQIYlTEE1TP7y6k5/ME1AmllG00GiLfaFZK6Z6914UNbSsEbnIwMNQw
UvYHlSRxxJ03eB8UkVZi0oj+GviEg+wNey9D0170/pPAwVqussQfekYQgzRk68uC
QrTuHzYopmnj/S/wZjdbPOLZyP57AWSHYB4XdGBmymiAOw0gb7k=
=HVTF
-----END PGP SIGNATURE-----

