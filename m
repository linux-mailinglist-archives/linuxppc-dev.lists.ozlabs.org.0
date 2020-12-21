Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9903F2DF991
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 08:47:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Czs4Y3Sw4zDqPR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 18:47:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzrzQ1bFYzDqM3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 18:42:41 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BL73bJ3095963; Mon, 21 Dec 2020 02:42:29 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35jpgrhjjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 02:42:29 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BL7bl2M001656;
 Mon, 21 Dec 2020 07:42:27 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 35h9589spn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 07:42:27 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BL7gPQm42140012
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Dec 2020 07:42:25 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 356EEA409E;
 Mon, 21 Dec 2020 07:42:25 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09BEEA4064;
 Mon, 21 Dec 2020 07:42:25 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 21 Dec 2020 07:42:24 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-39-10.uk.ibm.com [9.145.39.10])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 71B55220198;
 Mon, 21 Dec 2020 08:42:24 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/23] powerpc: Fix W=1 compile errors
Date: Mon, 21 Dec 2020 08:41:59 +0100
Message-Id: <20201221074222.403894-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-21_02:2020-12-19,
 2020-12-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1
 lowpriorityscore=0 mlxscore=1
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 mlxlogscore=210
 priorityscore=1501 adultscore=0 spamscore=1 clxscore=1034 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012210049
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Here is an assorted collection of fixes for W=3D1.

Cheers,

C.=20

C=C3=A9dric Le Goater (23):
  powerpc/mm: Include __find_linux_pte() prototype
  powerpc/pseries/ras: Remove unused variable 'status'
  powerpc/pseries/eeh: Make pseries_pcibios_bus_add_device() static
  powerpc/pseries/ras: Make init_ras_hotplug_IRQ() static
  powerpc/pmem: Include pmem prototypes
  powerpc/setup_64: Make some routines static
  powerpc/mce: Include prototypes
  powerpc/smp: Include tick_broadcast() prototype
  powerpc/smp: Make debugger_ipi_callback() static
  powerpc/optprobes: Remove unused routine patch_imm32_load_insns()
  powerpc/optprobes: Make patch_imm64_load_insns() static
  powerpc/mm: Declare some prototypes
  powerpc/mm: Move hpte_insert_repeating() prototype
  powerpc/mm: Declare preload_new_slb_context() prototype
  powerpc/mm/hugetlb: Make pseries_alloc_bootmem_huge_page() static
  powerpc/mm: Declare arch_report_meminfo() prototype.
  powerpc/watchdog: Declare soft_nmi_interrupt() prototype
  KVM: PPC: Make the VMX instruction emulation routines static
  KVM: PPC: Book3S HV: Include prototypes
  KVM: PPC: Book3S HV: Declare some prototypes
  powerpc/pseries: Make IOV setup routines static
  powerpc/pcidn: Make IOV setup routines static
  powerpc/pseries/eeh: Make pseries_send_allow_unfreeze() static

 arch/powerpc/include/asm/asm-prototypes.h     |  1 +
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |  9 ++++++++
 arch/powerpc/include/asm/kvm_book3s.h         |  7 +++++++
 arch/powerpc/include/asm/pgtable.h            |  3 +++
 arch/powerpc/kernel/mce.c                     |  1 +
 arch/powerpc/kernel/optprobes.c               | 21 +------------------
 arch/powerpc/kernel/setup_64.c                |  7 ++++---
 arch/powerpc/kernel/smp.c                     |  3 ++-
 arch/powerpc/kernel/watchdog.c                |  1 +
 arch/powerpc/kvm/book3s_64_mmu_hv.c           |  1 +
 arch/powerpc/kvm/powerpc.c                    |  8 +++----
 arch/powerpc/lib/pmem.c                       |  1 +
 arch/powerpc/mm/book3s64/hash_hugetlbpage.c   |  4 ----
 arch/powerpc/mm/hugetlbpage.c                 |  2 +-
 arch/powerpc/mm/pgtable.c                     |  1 +
 arch/powerpc/platforms/pseries/eeh_pseries.c  |  6 +++---
 arch/powerpc/platforms/pseries/pci.c          | 16 +++++++-------
 arch/powerpc/platforms/pseries/ras.c          |  7 +++----
 arch/powerpc/platforms/pseries/setup.c        |  8 +++----
 19 files changed, 55 insertions(+), 52 deletions(-)

--=20
2.26.2

