Return-Path: <linuxppc-dev+bounces-8929-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E480AC37DF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 May 2025 04:07:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5Jzt5fLNz2xlQ;
	Mon, 26 May 2025 12:07:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748225226;
	cv=none; b=fvwEvu3Xb71qSPY5yYuYber/lstPxaUomtr/l/GDGG8eo4TjGMKE2v9aTA+mXNFD4Y0MroKQNKZfDIlUw37h6Epa7PLjXFlgj7+dCsQTQ/f/c5CuSmghDEG3rTU8PZcUs5aw6JZHhy8M0OvXfjdDtKQ64dFUhTVdXP4XImjLUZqKi4JxKOWU/c9ZGo1PP/6y3LFftBSw+WiXsypvg+9jKB2Up1l+m80eczEjmW6t3xmW4kTXdlW62eQKNEpeltoYV8lgrAXv8RTj2+5IowKElS9xU5dIViYQ5P9eVpPG6NjvMNvhuwEHoBFzaHt2JaWSlwgaupRZczFOmVNz5FUHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748225226; c=relaxed/relaxed;
	bh=PitWxaiKxB2zvXyYWVD0Sny9f/z0Rk5C0t1+a76GPsw=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=kkfSHDcGst8vMmXn0YAaswdFKsInp86fNNp+gAOTT0KqS7nPLTmwRDUtL2ugkI8mnXxgLllEveMJHpWBMASZAdvDeYI6m+ullZGcWvK+QEKbfS4Wm2Vy5gxiD7MAewN+gZb+qJCqcaayN7/mhXV/gTiN6DJ683UnIFqK0iwu/LlJZtpiQ4Z4XOxzbOZiG+C0gRU+xbghQfhLWW6EpCa6GuJnw0PKGY/0tqhOgZWXI8Jn6pZWCBcouCTB6cQjXfQC5Z/Kc6nOwbVxsWvGkEmWrjbs6XddcJQH7RCavh2EOHXGEnoy1G5AU83jbLP4KKSUNsIV/teFCpKQMURNyIXePQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FYwmOgf/; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FYwmOgf/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b5Jzr2FMlz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 May 2025 12:07:03 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PLKTXu004500;
	Mon, 26 May 2025 02:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=PitWxaiKxB2zvXyYWVD0Sny9f/z0
	Rk5C0t1+a76GPsw=; b=FYwmOgf/sQmj6oSnRzZjq23iyXhcyEA8PPYtiig8pFug
	X8urlDyZKlVtWPvwZ/+L7t8O5Z9o6X7TjMtYca6uh5dT3kJ3OQ7t0xnRkzYU1VQq
	5590bBt1QkAI7x5z04In9gFp7IMiS1f4vy1nGz2MRG0q/UsyNFBHL4SD1j70VIh0
	DYu+MKXBdLG5U9CyggBVIgtsmDK/p6zd5V9dXsI6zaEHmLvEORBgOky1geMxs8RH
	JBY6ltGwpBO4AbUNjdflDu0EUQqsgAy+gfmRSMwhZWvnHs1f0aWUabIs0at47v/U
	uImnw8g3Mhcz9JllLw2hAT5LGf0xq7v/vKWNUGwJxQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46u5mbxrub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 02:06:14 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54Q26D8t012079;
	Mon, 26 May 2025 02:06:13 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46u5mbxru7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 02:06:13 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54PLRvLJ010626;
	Mon, 26 May 2025 02:06:12 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46usepm6hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 02:06:12 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54Q26ADo31785696
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 May 2025 02:06:11 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D42385805B;
	Mon, 26 May 2025 02:06:10 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 298B65805C;
	Mon, 26 May 2025 02:05:57 +0000 (GMT)
Received: from [9.43.101.58] (unknown [9.43.101.58])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 May 2025 02:05:56 +0000 (GMT)
Message-ID: <c8dcda66-14d5-4f76-8e83-69840e49af91@linux.ibm.com>
Date: Mon, 26 May 2025 07:35:53 +0530
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
Cc: amachhiw@linux.ibm.com, atrajeev@linux.ibm.com,
        bartosz.golaszewski@linaro.org, christophe.leroy@csgroup.eu,
        eajames@linux.ibm.com, gautam@linux.ibm.com, gbatra@linux.ibm.com,
        haren@linux.ibm.com, hbathini@linux.ibm.com, jirislaby@kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        msuchanek@suse.de, naveen@kernel.org, sfr@canb.auug.org.au,
        sshegde@linux.ibm.com, thorsten.blum@linux.dev, vaibhav@linux.ibm.com,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.16-1 tag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=E9bNpbdl c=1 sm=1 tr=0 ts=6833cc96 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=f0Zn45Wg_vv7Fsv5_ccA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: mICoUBTNK9cy4_e4eTj_uLnQXO7PDpmR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDAxNSBTYWx0ZWRfXwi93XV5t2Xj7 hN/zEBhEY2Z6JSQoX1uLd6T74dqq0erKk5KPgxXfhtq1fEr0pOJzC3PL+i5WHfPX17WrzIxajPi hmlS7/uw8HalDP9zW8xPfZUZTGVH6IAxEpM2DsV8hqiH9sDV5c6vRlr8axcVsd/rQc/MHdWx/h3
 n3Gs2iO2UVOBZBFD9l1xPoh9UjYv6Q9eU5XMXAA8OOtzx2psHAAMtHa+6TaVwFo8VJrLttCB7Y6 i9KT2E34+1Dv5jSRK58zRIvKADCCYABmEvqmzUOISGiq2JyPvvxM1jlAU//Dm7u+0kppT63PObA 2Pgyr2ixRXg4b3DVfA4lkHcLUqqM2C3RVMS/UuVKVy1cTkW62+f89vsrWd2FlZSGomiKLK0mP7E
 TRs5pLcPkzFTHFbhG+EbxeeN/pc1deSlhFq1XYVaEMqAj7YFqJvxLbUGj2RDcibwVDU6ds3O
X-Proofpoint-ORIG-GUID: 8N_TM_dPfhQ3FMgP0gfk-yF5oyECMdWo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_01,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260015
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates for 6.16:

No conflicts that I am aware of.
Thanks

Notable out of area changes:
  Documentation/userspace-api/ioctl/ioctl-number.rst	# 03c9d1a5a30d Documentation: Fix description format for powerpc RTAS ioctls
  MAINTAINERS						# 8682a5749a3d MAINTAINERS: powerpc: Remove myself as a reviewer

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.16-1

for you to fetch changes up to 8682a5749a3d2b416b57709115c0351b50c8efcb:

  MAINTAINERS: powerpc: Remove myself as a reviewer (2025-05-21 09:23:36 +0530)

- ------------------------------------------------------------------
powerpc updates for 6.16

 - Support for dynamic preemption

 - Migrate powerpc boards GPIO driver to new setter API

 - Added new PMU for KVM host-wide measurement

 - Enhancement to htmdump driver to support more functions

 - Added character device for couple RTAS supported APIs

 - Minor fixes and cleanup

Thanks to: Amit Machhiwal, Athira Rajeev, Bagas Sanjaya, Bartosz Golaszewski, Christophe Leroy, Eddie James, Gaurav Batra, Gautam Menghani, Geert Uytterhoeven, Haren Myneni, Hari Bathini, Jiri Slaby (SUSE), Linus Walleij, Michal Suchanek, Naveen N Rao (AMD), Nilay Shroff, Ricardo B. Marlière, Ritesh Harjani (IBM), Sathvika Vasireddy, Shrikanth Hegde, Stephen Rothwell, Sourabh Jain, Thorsten Blum, Vaibhav Jain, Venkat Rao Bagalkote, Viktor Malik

- ------------------------------------------------------------------
Amit Machhiwal (1):
      KVM: PPC: Book3S HV: Fix IRQ map warnings with XICS on pSeries KVM Guest

Athira Rajeev (10):
      powerpc/pseries/htmdump: Add htm_hcall_wrapper to integrate other htm operations
      powerpc/pseries/htmdump: Add htm configure support to htmdump module
      powerpc/pseries/htmdump: Add htm start support to htmdump module
      powerpc/pseries/htmdump: Add htm status support to htmdump module
      powerpc/pseries/htmdump: Add htm info support to htmdump module
      powerpc/pseries/htmdump: Add htm setup support to htmdump module
      powerpc/pseries/htmdump: Add htm flags support to htmdump module
      powerpc/pseries/htmdump: Add htm capabilities support to htmdump module
      powerpc/pseries/htmdump: Add documentation for H_HTM debugfs interface
      powerpc/pseries/htmdump: Include header file to get is_kvm_guest() definition

Bartosz Golaszewski (5):
      powerpc: sysdev/gpio: use new line value setter callbacks
      powerpc: 83xx/gpio: use new line value setter callbacks
      powerpc: 44x/gpio: use new line value setter callbacks
      powerpc: 52xx/gpio: use new line value setter callbacks
      powerpc: 8xx/gpio: use new line value setter callbacks

Christophe Leroy (2):
      powerpc: Don't use --- in kernel logs
      powerpc/8xx: Reduce alignment constraint for kernel memory

Eddie James (1):
      powerpc/crash: Fix non-smp kexec preparation

Gaurav Batra (1):
      powerpc/pseries/iommu: Fix kmemleak in TCE table userspace view

Gautam Menghani (1):
      powerpc/pseries/msi: Avoid reading PCI device registers in reduced power states

Haren Myneni (9):
      powerpc/pseries: Define common functions for RTAS sequence calls
      powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls
      powerpc/pseries: Add papr-indices char driver for ibm,get-indices
      powerpc/pseries: Add ibm,set-dynamic-indicator RTAS call support
      powerpc/pseries: Add ibm,get-dynamic-sensor-state RTAS call support
      powerpc/pseries: Add papr-platform-dump character driver for dump retrieval
      powerpc/pseries: Add a char driver for physical-attestation RTAS
      powerpc/pseries: Include linux/types.h in papr-platform-dump.h
      Documentation: Fix description format for powerpc RTAS ioctls

Hari Bathini (2):
      powerpc64/ftrace: fix clobbered r15 during livepatching
      powerpc/bpf: fix JIT code size calculation of bpf trampoline

Jiri Slaby (SUSE) (1):
      powerpc: do not build ppc_save_regs.o always

Madhavan Srinivasan (1):
      powerpc/kernel: Fix ppc_save_regs inclusion in build

Michal Suchanek (1):
      powerpc/boot: Fix build with gcc 15

Naveen N Rao (AMD) (1):
      MAINTAINERS: powerpc: Remove myself as a reviewer

Shrikanth Hegde (1):
      powerpc: enable dynamic preemption

Thorsten Blum (9):
      powerpc/ps3: Use str_write_read() in ps3_notification_read_write()
      powerpc: mpic: Use str_enabled_disabled() helper function
      KVM: powerpc: Enable commented out BUILD_BUG_ON() assertion
      fadump: Use str_yes_no() helper in fadump_show_config()
      powerpc: Transliterate author name and remove FIXME
      powerpc: Replace strcpy() with strscpy() in proc_ppc64_init()
      powerpc/mm/fault: Use str_write_read() helper function
      powerpc/powermac: Use str_enabled_disabled() and str_on_off() helpers
      powerpc/iommu: Use str_disabled_enabled() helper

Vaibhav Jain (6):
      powerpc: Document APIv2 KVM hcall spec for Hostwide counters
      kvm powerpc/book3s-apiv2: Add support for Hostwide GSB elements
      kvm powerpc/book3s-apiv2: Add kunit tests for Hostwide GSB elements
      kvm powerpc/book3s-apiv2: Introduce kvm-hv specific PMU
      powerpc/kvm-hv-pmu: Implement GSB message-ops for hostwide counters
      powerpc/kvm-hv-pmu: Add perf-events for Hostwide counters


 Documentation/arch/powerpc/htm.rst                        | 104 +++++
 Documentation/arch/powerpc/kvm-nested.rst                 |  40 +-
 Documentation/userspace-api/ioctl/ioctl-number.rst        |   6 +
 MAINTAINERS                                               |   1 -
 arch/powerpc/Kconfig                                      |  11 +-
 arch/powerpc/boot/Makefile                                |   1 +
 arch/powerpc/boot/rs6000.h                                |   6 +-
 arch/powerpc/include/asm/guest-state-buffer.h             |  35 +-
 arch/powerpc/include/asm/hvcall.h                         |  13 +-
 arch/powerpc/include/asm/plpar_wrappers.h                 |  20 +-
 arch/powerpc/include/asm/preempt.h                        |  16 +
 arch/powerpc/include/asm/rtas.h                           |   4 +
 arch/powerpc/include/uapi/asm/papr-indices.h              |  41 ++
 arch/powerpc/include/uapi/asm/papr-physical-attestation.h |  31 ++
 arch/powerpc/include/uapi/asm/papr-platform-dump.h        |  16 +
 arch/powerpc/kernel/Makefile                              |   2 -
 arch/powerpc/kernel/fadump.c                              |   6 +-
 arch/powerpc/kernel/interrupt.c                           |   6 +-
 arch/powerpc/kernel/iommu.c                               |   5 +-
 arch/powerpc/kernel/proc_powerpc.c                        |   3 +-
 arch/powerpc/kernel/process.c                             |   8 +-
 arch/powerpc/kernel/rtas.c                                |   8 +-
 arch/powerpc/kernel/trace/ftrace_entry.S                  |   2 +-
 arch/powerpc/kexec/crash.c                                |   5 +-
 arch/powerpc/kvm/Kconfig                                  |  13 +
 arch/powerpc/kvm/book3s_hv.c                              |  20 +-
 arch/powerpc/kvm/book3s_hv_nestedv2.c                     |   6 +
 arch/powerpc/kvm/guest-state-buffer.c                     |  39 ++
 arch/powerpc/kvm/test-guest-state-buffer.c                | 214 +++++++++
 arch/powerpc/kvm/timing.h                                 |   4 -
 arch/powerpc/lib/vmx-helper.c                             |   2 +-
 arch/powerpc/mm/fault.c                                   |   5 +-
 arch/powerpc/mm/nohash/8xx.c                              |  32 +-
 arch/powerpc/net/bpf_jit.h                                |  20 +-
 arch/powerpc/net/bpf_jit_comp.c                           |  33 +-
 arch/powerpc/net/bpf_jit_comp32.c                         |   6 -
 arch/powerpc/net/bpf_jit_comp64.c                         |  15 +-
 arch/powerpc/perf/Makefile                                |   2 +
 arch/powerpc/perf/kvm-hv-pmu.c                            | 435 +++++++++++++++++
 arch/powerpc/platforms/44x/gpio.c                         |   7 +-
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c                 |   6 +-
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c            |  13 +-
 arch/powerpc/platforms/8xx/cpm1.c                         |  12 +-
 arch/powerpc/platforms/powermac/setup.c                   |   4 +-
 arch/powerpc/platforms/powermac/time.c                    |   3 +-
 arch/powerpc/platforms/ps3/device-init.c                  |   3 +-
 arch/powerpc/platforms/pseries/Makefile                   |   3 +-
 arch/powerpc/platforms/pseries/htmdump.c                  | 395 +++++++++++++++-
 arch/powerpc/platforms/pseries/iommu.c                    |   2 +-
 arch/powerpc/platforms/pseries/msi.c                      |   7 +-
 arch/powerpc/platforms/pseries/papr-indices.c             | 488 ++++++++++++++++++++
 arch/powerpc/platforms/pseries/papr-phy-attest.c          | 288 ++++++++++++
 arch/powerpc/platforms/pseries/papr-platform-dump.c       | 411 +++++++++++++++++
 arch/powerpc/platforms/pseries/papr-rtas-common.c         | 311 +++++++++++++
 arch/powerpc/platforms/pseries/papr-rtas-common.h         |  61 +++
 arch/powerpc/platforms/pseries/papr-vpd.c                 | 352 ++------------
 arch/powerpc/sysdev/cpm_common.c                          |   6 +-
 arch/powerpc/sysdev/mpic.c                                |   7 +-
 arch/powerpc/xmon/xmon.c                                  |   2 +-
 59 files changed, 3146 insertions(+), 471 deletions(-)
 create mode 100644 Documentation/arch/powerpc/htm.rst
 create mode 100644 arch/powerpc/include/asm/preempt.h
 create mode 100644 arch/powerpc/include/uapi/asm/papr-indices.h
 create mode 100644 arch/powerpc/include/uapi/asm/papr-physical-attestation.h
 create mode 100644 arch/powerpc/include/uapi/asm/papr-platform-dump.h
 create mode 100644 arch/powerpc/perf/kvm-hv-pmu.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-indices.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-phy-attest.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-platform-dump.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-rtas-common.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-rtas-common.h
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEqX2DNAOgU8sBX3pRpnEsdPSHZJQFAmgzy6oACgkQpnEsdPSH
ZJS1VhAAsftkx1Gu6WV8njI6CX9agz3F0JJKm8eT3A8tZx8dfeko4IDgJSY4kZW8
BSt67AL12ZxCwo73scJF0sZIg/6CKMMV5qglWeWvONm4AJfs323H0UgdreSFvGXh
ow63jZ7/feVAq77iynVpVTQoAFlX+7+JIL3b4eHOAGp9gn1q+0tyr4fvEarJgxtC
BHOVywfo9GZKV/PoVQWqLCg70rILo0NUFmle6GxXUcShJ9ZcuAHzW48iYidzWMsW
qFJj/l0S1wHhOVl+6vk3zrFEYT3VlR3YqXUfjN6FPT4VM/Ac7H7QL5S+0g+vQj7l
UprO0JKiBSZRprMSnmcgTgRiph45g6No3dhEYL4mVkVsnEoGdGU3y6/vsfBnCBvi
/un8vNNdD4aAn5Gu1BAjjpZ6Y2SK77l292OZ1XZw3KeWL57RSMl1GPL/j99ULO44
Rz121YTlWmOdIghiHTfMqPMZyuH10LLEAVTd82Zyds+M/lrI0OmXtz0X9pS2c/Ov
3wbFIJnhNI1NyrY4pLUgbHR6hjGTgdYoSs9Kc0wu/hMMJX/NcXDR0DSOxccGCmUy
EelYHCFchBOjrGV/gdQTcDLV0UUVj1bKxndko4mzsOALF+YzModzx+gyUw9rJINc
qZqirjg6NOCmvSsz5nw6zXQFlwZUlZMSVhj6FXeI/U1A7PX9tf8=
=HTEY
-----END PGP SIGNATURE-----

