Return-Path: <linuxppc-dev+bounces-12623-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6821BAA102
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Sep 2025 18:54:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cb6jv4FmYz304x;
	Tue, 30 Sep 2025 02:54:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759164883;
	cv=none; b=LreSIt1laBHoryXbtpAqoykJfeHNmhKYrcGK00Bqgv8LZZaDEB2eQ4UAdCrF0XxulxNQpgwzgAV0YMPitUqcFW+WSMAtsDt+lgW+Pn1XHq5Lgze1ZSX2pynrneR54RrLEXOvLzYzVBRIzQV3ZzkRi9nnQgA0LeUJ9gr43UvM5brmhmYu8LMvSLUXBnTMlHzzcUyTdKDNRyMb2Y9t/mtFZUugFhJxe8rVQeOaBS5+vfqzw9JC1K/aCN3gSJ75ud/D32KK2SZWu44QkxW38IvEDk/vrGiSl1sIooLB1rIjFR4uk/g/OWFYSKKbJogTmm4M3BnWQZXivkevM5QJmSAv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759164883; c=relaxed/relaxed;
	bh=0wYAXO9zkrxLr9zBB46nBWEc6th871G9Gt+2ewkje9o=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=kTWIT/R5lmNsVdxHiuOb+pRItEPHtAHqXYhKPC+TCZndZl51AF6iSZWL6gu6uVbij5g1XzqjaU6bLgUMZ8WzNmpd/ciAk9vF8X/Vq4k35pIeL79AyKmv0rwlXFmN3vOxfnF1Uuop2BOQLF4VrXUjw6Dy7gKdcdVepDOiIv4QWywNKJuH7z0+/1Q1hBPFzcTovTWQI3r7ngIoXgMUtt8pkFAmIJVYWx11xZ/SBMfWiKYcnb9n3EyIdLBuBa+WExLdWiKGq5wU9baCnFKuLN9U15PKQVHy7y129QFbSn0SLH7NlsioMdmRgvxhAJrwHN4ZHPBARIrQb4oPEqdJXAssQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KOm2y4Hv; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KOm2y4Hv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cb6jt15XPz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Sep 2025 02:54:41 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TA61Qf020849;
	Mon, 29 Sep 2025 16:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=0wYAXO9zkrxLr9zBB46nBWEc6th8
	71G9Gt+2ewkje9o=; b=KOm2y4HvEhxkfoglBVD54lXoSFMgOga0lIwLu4hahl2u
	U9ucXfOIzPwtXEhOqfHaKGcHb3sM/TxIiM1+eXNvFIfmnGfJEJWPHGUz+a3PonlU
	AnlGW+0VSVrEkknATJLPAoRcEZPBM0p2yEaHCYOnQqMfq6dloCDMdAvc1FwI7qwZ
	p8SIiNIppJnlmxcifLIBgECumf8CI5v03SaKT6WT4oOh1b3TBY8d1und4D4mxhG2
	EEu0lFAYBuOetvbjcrGFpoPNG3PSPpBZKKBtTxAUw2s+yUS5N7A5QU/lzJRt48Mk
	qBI1ciD+nwmskWR7o/UZS/LLKT+l4PRnK5IFcNUzCA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49e5bqksmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 16:53:55 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58TGkZKb003977;
	Mon, 29 Sep 2025 16:53:54 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49e5bqksmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 16:53:54 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58TEP3Uq024191;
	Mon, 29 Sep 2025 16:53:53 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 49evy0xu1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 16:53:53 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58TGrqQs20316736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Sep 2025 16:53:53 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF25E58060;
	Mon, 29 Sep 2025 16:53:52 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C43DB58056;
	Mon, 29 Sep 2025 16:53:43 +0000 (GMT)
Received: from [9.43.68.90] (unknown [9.43.68.90])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Sep 2025 16:53:43 +0000 (GMT)
Message-ID: <ac4dc89b-6961-4900-a7e8-c522264076f0@linux.ibm.com>
Date: Mon, 29 Sep 2025 22:23:42 +0530
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: aboorvad@linux.ibm.com, adityab1@linux.ibm.com, atrajeev@linux.ibm.com,
        Christophe Leroy <christophe.leroy@csgroup.eu>, gautam@linux.ibm.com,
        haren@linux.ibm.com, hbathini@linux.ibm.com, joe.lawrence@redhat.com,
        kjain@linux.ibm.com, kstewart@efficios.com,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        masahiroy@kernel.org, mhiramat@kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>, namcao@linutronix.de,
        naveen@kernel.org, npiggin@gmail.com, nysal@linux.ibm.com,
        rubenru09@aol.com, segher@kernel.crashing.org, skb99@linux.ibm.com,
        thorsten.blum@linux.dev, thuth@redhat.com
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.18-1 tag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDIxNCBTYWx0ZWRfX4JPHZ9a34e/p
 WajgyCD5JgtLDwbQE1cdw7Lk8aDPqBO7QY4nU3aCjJ6m6K/CsqDeC5gCG+xC0hsv7xC2OukNfG2
 v4XN5GdeXxAXd9uNCMXlDOSBiqKzVhpNhaS7CVU//b8N/mMVy0wSuV+HJD4n8VUVY4apo/JhioF
 6AkusdPc4fL/PtiBO0hO7gkzIaKUUDrb/hqOidok0HnrnYR+c1m3AcUacSOjpUxYGFjNNEVlwbr
 WRyPdZFFtCdnyuQg7EaVvcfcSWREq17odnnBbPvuBxGfwx4fSkqHVEmJj5ykkqhey2KInn+eFpS
 juT/iRKHNpWtr+GeocGz8Ly/q7cSx/LoWuVhucILbiWCngrCDL2uO2g3mJjyrXrDcUMKjrb4TLc
 NMK+MoEtGF3UdlCaY4Iwgr2mUXyG0A==
X-Proofpoint-GUID: xk13TL4IvH419OWUZGPlQKk3mVf2RUMd
X-Authority-Analysis: v=2.4 cv=LLZrgZW9 c=1 sm=1 tr=0 ts=68dab9a3 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=b3FoETjJlaN1XYtfdwgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: Qxtuw8uYD4PpFgJKb6GycLYAoERSAmh8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509260214
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi Linus,

Please pull powerpc updates for 6.18:

No conflicts that I am aware of.
Thanks

Notable out of area changes:
  Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl	# 6f2c65680c33 docs: ABI: sysfs-bus-event_source-devices-vpa-dtl: Document sysfs event format entries
  Documentation/userspace-api/ioctl/ioctl-number.rst			# 043439ad1a23 powerpc/pseries: Define papr-hvpipe ioctl
  drivers/gpio/*							# e7a6475cc0c3 gpio: mpc5200: Drop legacy-of-mm-gpiochip.h header
  drivers/ps3/ps3stor_lib.c						# 6dc5d0770dc9 powerpc/ps3: Use str_write_read() in ps3stor_read_write_sectors()
  kernel/irq/msi.c							# 91daac8a6893 genirq/msi: Remove msi_post_free()

The following changes since commit b320789d6883cc00ac78ce83bccbfe7ed58afcf0:

  Linux 6.17-rc4 (2025-08-31 15:33:07 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.18-1

for you to fetch changes up to ef104054a312608deab266f95945057fa73eeaad:

  powerpc/pseries: Define __u{8,32} types in papr_hvpipe_hdr struct (2025-09-23 14:30:48 +0530)

- ------------------------------------------------------------------
powerpc updates for 6.18

 - powerpc support for BPF arena and arena atomics
 - Patches to switch to msi parent domain (per-device MSI domains)
 - Add a lock contention tracepoint in the queued spinlock slowpath
 - Fixes for underflow in pseries/powernv msi and pci paths
 - Switch from legacy-of-mm-gpiochip dependency to platform driver
 - Fixes for handling TLB misses
 - Introduce support for powerpc papr-hvpipe
 - Add vpa-dtl PMU driver for pseries platform
 - Misc fixes and cleanups

Thanks to: Aboorva Devarajan, Aditya Bodkhe, Andrew Donnellan, Athira Rajeev, Cédric Le Goater, Christophe Leroy,
Erhard Furtner, Gautam Menghani, Geert Uytterhoeven, Haren Myneni, Hari Bathini, Joe Lawrence, Kajol Jain, Kienan Stewart,
Linus Walleij, Mahesh Salgaonkar, Nam Cao, Nicolas Schier, Nysal Jan K.A., Ritesh Harjani (IBM), Ruben Wauters,
Saket Kumar Bhaskar, Shashank MS, Shrikanth Hegde, Tejas Manhas, Thomas Gleixner, Thomas Huth, Thorsten Blum,
Tyrel Datwyler, Venkat Rao Bagalkote,

- ------------------------------------------------------------------
Aboorva Devarajan (1):
      powerpc/time: Expose boot_tb via accessor

Aditya Bodkhe (1):
      powerpc/ftrace: support CONFIG_FUNCTION_GRAPH_RETVAL

Athira Rajeev (4):
      powerpc/perf/vpa-dtl: Add support to setup and free aux buffer for capturing DTL data
      powerpc/perf/vpa-dtl: Add support to capture DTL data in aux buffer
      powerpc/perf/vpa-dtl: Handle the writing of perf record when aux wake up is needed
      powerpc/perf/vpa-dtl: Add documentation for VPA dispatch trace log PMU

Christophe Leroy (10):
      arch/powerpc: Remove support for older GCC and binutils
      powerpc/8xx: Remove offset in SPRN_M_TWB
      powerpc/vdso: Include asm/syscalls.h for sys_ni_syscall()
      powerpc/cpm2: Drop legacy-of-mm-gpiochip.h header
      powerpc/44x: Change GPIO driver to a proper platform driver
      powerpc/44x: Drop legacy-of-mm-gpiochip.h header
      gpio: mpc5200: Drop legacy-of-mm-gpiochip.h header
      powerpc/8xx: Remove left-over instruction and comments in DataStoreTLBMiss handler
      powerpc/603: Really copy kernel PGD entries into all PGDIRs
      powerpc/32: Remove PAGE_KERNEL_TEXT to fix startup failure

Gautam Menghani (1):
      powerpc: Remove duplicate definition for ppc_msgsnd_sync()

Haren Myneni (10):
      powerpc/pseries: Define papr-hvpipe ioctl
      powerpc/pseries: Define HVPIPE specific macros
      powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces
      powerpc/pseries: Send payload with ibm,send-hvpipe-msg RTAS
      powerpc/pseries: Receive payload with ibm,receive-hvpipe-msg RTAS
      powerpc/pseries: Wakeup hvpipe FD when the payload is pending
      powerpc/pseries: Enable HVPIPE event message interrupt
      powerpc/pseries: Enable hvpipe with ibm,set-system-parameter RTAS
      powerpc/pseries: HVPIPE changes to support migration
      powerpc/pseries: Define __u{8,32} types in papr_hvpipe_hdr struct

Hari Bathini (1):
      powerpc/fprobe: fix updated fprobe for function-graph tracer

Joe Lawrence (3):
      powerpc/ftrace: ensure ftrace record ops are always set for NOPs
      powerpc64/modules: correctly iterate over stubs in setup_ftrace_ool_stubs
      powerpc64/modules: replace stub allocation sentinel with an explicit counter

Kajol Jain (2):
      powerpc/vpa_dtl: Add interface to expose vpa dtl counters via perf
      docs: ABI: sysfs-bus-event_source-devices-vpa-dtl: Document sysfs event format entries for vpa_dtl pmu

Kienan Stewart (1):
      kbuild: Add missing $(objtree) prefix to powerpc crtsavres.o artifact

Nam Cao (6):
      powerpc/pseries/msi: Fix potential underflow and leak issue
      powerpc/powernv/pci: Fix underflow and leak issue
      powerpc/xive: Untangle xive from child interrupt controller drivers
      powerpc/powernv/pci: Switch to use msi_create_parent_irq_domain()
      powerpc/pseries/msi: Switch to msi_create_parent_irq_domain()
      genirq/msi: Remove msi_post_free()

Nysal Jan K.A. (1):
      powerpc/qspinlock: Add spinlock contention tracepoint

Ruben Wauters (1):
      powerpc/xmon: replace sizeof calculations with ARRAY_SIZE macro

Saket Kumar Bhaskar (4):
      powerpc64/bpf: Implement PROBE_MEM32 pseudo instructions
      powerpc64/bpf: Implement bpf_addr_space_cast instruction
      powerpc64/bpf: Introduce bpf_jit_emit_atomic_ops() to emit atomic instructions
      powerpc64/bpf: Implement PROBE_ATOMIC instructions

Thomas Huth (2):
      powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
      powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers

Thorsten Blum (1):
      powerpc/ps3: Use str_write_read() in ps3stor_read_write_sectors()


 Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl |  25 +
 Documentation/arch/powerpc/index.rst                             |   1 +
 Documentation/arch/powerpc/vpa-dtl.rst                           | 156 ++++
 Documentation/userspace-api/ioctl/ioctl-number.rst               |   2 +
 arch/powerpc/Kconfig                                             |   4 +-
 arch/powerpc/Makefile                                            |   2 +-
 arch/powerpc/boot/page.h                                         |   2 +-
 arch/powerpc/boot/wrapper                                        |   6 +-
 arch/powerpc/include/asm/asm-const.h                             |   2 +-
 arch/powerpc/include/asm/barrier.h                               |   2 +-
 arch/powerpc/include/asm/book3s/32/kup.h                         |   4 +-
 arch/powerpc/include/asm/book3s/32/mmu-hash.h                    |   8 +-
 arch/powerpc/include/asm/book3s/32/pgalloc.h                     |  10 +-
 arch/powerpc/include/asm/book3s/32/pgtable.h                     |  12 +-
 arch/powerpc/include/asm/book3s/64/hash-4k.h                     |   4 +-
 arch/powerpc/include/asm/book3s/64/hash-64k.h                    |   4 +-
 arch/powerpc/include/asm/book3s/64/hash.h                        |   4 +-
 arch/powerpc/include/asm/book3s/64/kup.h                         |   6 +-
 arch/powerpc/include/asm/book3s/64/mmu-hash.h                    |  12 +-
 arch/powerpc/include/asm/book3s/64/mmu.h                         |   8 +-
 arch/powerpc/include/asm/book3s/64/pgtable-64k.h                 |   4 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h                     |  10 +-
 arch/powerpc/include/asm/book3s/64/radix.h                       |   8 +-
 arch/powerpc/include/asm/book3s/64/slice.h                       |   4 +-
 arch/powerpc/include/asm/bug.h                                   |  14 +-
 arch/powerpc/include/asm/cache.h                                 |   4 +-
 arch/powerpc/include/asm/cpu_has_feature.h                       |   4 +-
 arch/powerpc/include/asm/cpuidle.h                               |   2 +-
 arch/powerpc/include/asm/cputable.h                              |   8 +-
 arch/powerpc/include/asm/cputhreads.h                            |   4 +-
 arch/powerpc/include/asm/dbell.h                                 |  18 +-
 arch/powerpc/include/asm/dcr-native.h                            |   4 +-
 arch/powerpc/include/asm/dcr.h                                   |   4 +-
 arch/powerpc/include/asm/epapr_hcalls.h                          |   4 +-
 arch/powerpc/include/asm/exception-64e.h                         |   2 +-
 arch/powerpc/include/asm/exception-64s.h                         |   6 +-
 arch/powerpc/include/asm/extable.h                               |   2 +-
 arch/powerpc/include/asm/feature-fixups.h                        |   6 +-
 arch/powerpc/include/asm/firmware.h                              |   4 +-
 arch/powerpc/include/asm/fixmap.h                                |   4 +-
 arch/powerpc/include/asm/fprobe.h                                |  12 +
 arch/powerpc/include/asm/ftrace.h                                |  23 +-
 arch/powerpc/include/asm/head-64.h                               |   4 +-
 arch/powerpc/include/asm/hvcall.h                                |   4 +-
 arch/powerpc/include/asm/hw_irq.h                                |   4 +-
 arch/powerpc/include/asm/interrupt.h                             |   4 +-
 arch/powerpc/include/asm/irqflags.h                              |   2 +-
 arch/powerpc/include/asm/jump_label.h                            |   2 +-
 arch/powerpc/include/asm/kasan.h                                 |   4 +-
 arch/powerpc/include/asm/kdump.h                                 |   4 +-
 arch/powerpc/include/asm/kexec.h                                 |   4 +-
 arch/powerpc/include/asm/kgdb.h                                  |   4 +-
 arch/powerpc/include/asm/kup.h                                   |   8 +-
 arch/powerpc/include/asm/kvm_asm.h                               |   2 +-
 arch/powerpc/include/asm/kvm_book3s_asm.h                        |   6 +-
 arch/powerpc/include/asm/kvm_booke_hv_asm.h                      |   4 +-
 arch/powerpc/include/asm/lv1call.h                               |   4 +-
 arch/powerpc/include/asm/mmu.h                                   |   8 +-
 arch/powerpc/include/asm/module.h                                |   1 +
 arch/powerpc/include/asm/mpc52xx.h                               |  12 +-
 arch/powerpc/include/asm/nohash/32/kup-8xx.h                     |   4 +-
 arch/powerpc/include/asm/nohash/32/mmu-44x.h                     |   4 +-
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h                     |   4 +-
 arch/powerpc/include/asm/nohash/32/pgtable.h                     |  12 +-
 arch/powerpc/include/asm/nohash/32/pte-8xx.h                     |   2 +-
 arch/powerpc/include/asm/nohash/64/pgtable-4k.h                  |   8 +-
 arch/powerpc/include/asm/nohash/64/pgtable.h                     |   4 +-
 arch/powerpc/include/asm/nohash/kup-booke.h                      |   4 +-
 arch/powerpc/include/asm/nohash/mmu-e500.h                       |   4 +-
 arch/powerpc/include/asm/nohash/pgalloc.h                        |   2 +-
 arch/powerpc/include/asm/nohash/pgtable.h                        |   6 +-
 arch/powerpc/include/asm/nohash/pte-e500.h                       |   4 +-
 arch/powerpc/include/asm/opal-api.h                              |   4 +-
 arch/powerpc/include/asm/opal.h                                  |   4 +-
 arch/powerpc/include/asm/page.h                                  |  14 +-
 arch/powerpc/include/asm/page_32.h                               |   4 +-
 arch/powerpc/include/asm/page_64.h                               |   4 +-
 arch/powerpc/include/asm/papr-sysparm.h                          |   1 +
 arch/powerpc/include/asm/pci-bridge.h                            |   2 -
 arch/powerpc/include/asm/pgtable.h                               |  20 +-
 arch/powerpc/include/asm/ppc-opcode.h                            |   1 +
 arch/powerpc/include/asm/ppc_asm.h                               |   4 +-
 arch/powerpc/include/asm/processor.h                             |   8 +-
 arch/powerpc/include/asm/ptrace.h                                |   6 +-
 arch/powerpc/include/asm/reg.h                                   |   6 +-
 arch/powerpc/include/asm/reg_booke.h                             |   4 +-
 arch/powerpc/include/asm/reg_fsl_emb.h                           |   4 +-
 arch/powerpc/include/asm/rtas.h                                  |   9 +
 arch/powerpc/include/asm/setup.h                                 |   4 +-
 arch/powerpc/include/asm/smp.h                                   |   4 +-
 arch/powerpc/include/asm/spu_csa.h                               |   4 +-
 arch/powerpc/include/asm/synch.h                                 |   4 +-
 arch/powerpc/include/asm/thread_info.h                           |   8 +-
 arch/powerpc/include/asm/time.h                                  |   4 +
 arch/powerpc/include/asm/tm.h                                    |   4 +-
 arch/powerpc/include/asm/types.h                                 |   4 +-
 arch/powerpc/include/asm/unistd.h                                |   4 +-
 arch/powerpc/include/asm/vdso.h                                  |   6 +-
 arch/powerpc/include/asm/vdso/getrandom.h                        |   4 +-
 arch/powerpc/include/asm/vdso/gettimeofday.h                     |   4 +-
 arch/powerpc/include/asm/vdso/processor.h                        |   4 +-
 arch/powerpc/include/asm/vdso/vsyscall.h                         |   4 +-
 arch/powerpc/include/asm/vdso_datapage.h                         |   6 +-
 arch/powerpc/include/asm/xive.h                                  |   1 -
 arch/powerpc/include/uapi/asm/opal-prd.h                         |   4 +-
 arch/powerpc/include/uapi/asm/papr-hvpipe.h                      |  33 +
 arch/powerpc/include/uapi/asm/ptrace.h                           |  12 +-
 arch/powerpc/include/uapi/asm/types.h                            |   4 +-
 arch/powerpc/kernel/head_8xx.S                                   |  25 +-
 arch/powerpc/kernel/head_booke.h                                 |   4 +-
 arch/powerpc/kernel/module_64.c                                  |  26 +-
 arch/powerpc/kernel/rtas.c                                       |  24 +
 arch/powerpc/kernel/rtasd.c                                      |   2 +
 arch/powerpc/kernel/time.c                                       |   8 +-
 arch/powerpc/kernel/trace/ftrace.c                               |  10 +-
 arch/powerpc/kernel/trace/ftrace_entry.S                         |  42 +-
 arch/powerpc/kernel/vdso.c                                       |   3 +-
 arch/powerpc/lib/qspinlock.c                                     |  19 +-
 arch/powerpc/mm/book3s32/mmu.c                                   |   4 +-
 arch/powerpc/mm/nohash/mmu_context.c                             |  10 +-
 arch/powerpc/mm/pgtable_32.c                                     |   2 +-
 arch/powerpc/net/bpf_jit.h                                       |   8 +-
 arch/powerpc/net/bpf_jit_comp.c                                  |  32 +-
 arch/powerpc/net/bpf_jit_comp32.c                                |   2 +-
 arch/powerpc/net/bpf_jit_comp64.c                                | 401 +++++++---
 arch/powerpc/perf/Makefile                                       |   2 +-
 arch/powerpc/perf/vpa-dtl.c                                      | 596 ++++++++++++++
 arch/powerpc/platforms/44x/Kconfig                               |   1 -
 arch/powerpc/platforms/44x/gpio.c                                | 108 +--
 arch/powerpc/platforms/8xx/Kconfig                               |   1 -
 arch/powerpc/platforms/Kconfig                                   |   1 -
 arch/powerpc/platforms/powernv/Kconfig                           |   1 +
 arch/powerpc/platforms/powernv/pci-ioda.c                        |  98 +--
 arch/powerpc/platforms/powernv/subcore.h                         |   4 +-
 arch/powerpc/platforms/pseries/Kconfig                           |   1 +
 arch/powerpc/platforms/pseries/Makefile                          |   1 +
 arch/powerpc/platforms/pseries/mobility.c                        |   3 +
 arch/powerpc/platforms/pseries/msi.c                             | 134 ++--
 arch/powerpc/platforms/pseries/papr-hvpipe.c                     | 818 ++++++++++++++++++++
 arch/powerpc/platforms/pseries/papr-hvpipe.h                     |  42 +
 arch/powerpc/sysdev/cpm_common.c                                 |  56 +-
 arch/powerpc/sysdev/xive/common.c                                |  63 +-
 arch/powerpc/xmon/ppc-opc.c                                      |  16 +-
 arch/powerpc/xmon/xmon_bpts.h                                    |   4 +-
 drivers/gpio/Kconfig                                             |   1 -
 drivers/gpio/gpio-mpc5200.c                                      |  78 +-
 drivers/ps3/ps3stor_lib.c                                        |   3 +-
 include/linux/msi.h                                              |   4 -
 kernel/irq/msi.c                                                 |   3 -
 tools/testing/selftests/powerpc/include/instructions.h           |   2 +-
 150 files changed, 2668 insertions(+), 776 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl
 create mode 100644 Documentation/arch/powerpc/vpa-dtl.rst
 create mode 100644 arch/powerpc/include/asm/fprobe.h
 create mode 100644 arch/powerpc/include/uapi/asm/papr-hvpipe.h
 create mode 100644 arch/powerpc/perf/vpa-dtl.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-hvpipe.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-hvpipe.h
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEqX2DNAOgU8sBX3pRpnEsdPSHZJQFAmjauMcACgkQpnEsdPSH
ZJRkzg//WwPajYcyNJ4uqIDNoPfmYYwLS6i7ILVV5XU65S8Ps+0/FUp6zv04s0Zq
ZC2KKTgm3mop9e3+r93E5KeMROaml90rg8rUkearwUy8LKcO6LAetxADKh5h6tTe
APZVsc6Zc8Ehd/2yKu/ZGASQCv+T9rFezpySmy9IJxD3EL5QGJ48jF1A2CWGsWfM
MfM1jX8CYOT2GnMIQZ82WKLar0AD/TzPmOy6TToImjQgp7m38O/RvLV9gDsGivPP
l1OGb7pMM14K77+pkE2CLoTD7OwfgJnHxk3/lbAAgTBXzG41sWfXLdoncQ0xAzD9
NWrdma3rVQCbsfKkSTEI4/1ge0OcTVmMG55H5mbA4xO4N2AVE49KiSblaSpaMMtY
MSQoAdWKPHA6SGGti6lXPrfDhGYMDTZ7wi3Y4fsFB+TmvxUEnUIeD8rHUUNB+wg/
uooTHDYZFcklxuobEd4JIXyBlcf8vVyuYZKwEXkJNNs3r2uAw4/aA6pqjRTGx733
gSr+Nlxrbw0w4dUc5q184VzvcixOLXP32GsZkm8npKIWmwwg9W/4AD3MjgwHo91W
ggeHKMgQuuvzulSsQ2eZw4VecSgop2y6cTWoBx256UszHyH+ztzsGUO5cLK6ULCg
U6CqCdIxe4ln4sQ9TyOcpqti7XXqm7smFR+LNOzJznZqb2tG78Y=
=z2uW
-----END PGP SIGNATURE-----

