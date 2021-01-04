Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE4F2E9818
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 16:10:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8fFW0kr1zDqSF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 02:10:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8dQT2H2GzDqKf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 01:33:05 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 104EIYwB084769; Mon, 4 Jan 2021 09:32:46 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35v4nwrauy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 09:32:45 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 104EVQb4031448;
 Mon, 4 Jan 2021 14:32:12 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 35u3pmhasq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 14:32:11 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 104EW9qM50004332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Jan 2021 14:32:09 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5FCCAE04D;
 Mon,  4 Jan 2021 14:32:09 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81C93AE045;
 Mon,  4 Jan 2021 14:32:09 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  4 Jan 2021 14:32:09 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-4-90.uk.ibm.com [9.145.4.90])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 87810220073;
 Mon,  4 Jan 2021 15:32:08 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 00/23] powerpc: Fix W=1 compile errors
Date: Mon,  4 Jan 2021 15:31:43 +0100
Message-Id: <20210104143206.695198-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_08:2021-01-04,
 2021-01-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 suspectscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 mlxlogscore=275 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040091
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Here is an assorted collection of fixes for W=3D1.

After this series, only a few errors are left, some missing declarations
in arch/powerpc/kernel/sys_ppc32.c, panic_smp_self_stop() declaration
and a few of these which I don't know how to fix :

  ./arch/powerpc/xmon/xmon.c: In function =E2=80=98xmon_print_symbol=E2=80=
=99:
  ./arch/powerpc/xmon/xmon.c:3656:14: error: variable =E2=80=98name=E2=80=
=99 might be clobbered by =E2=80=98longjmp=E2=80=99 or =E2=80=98vfork=E2=80=
=99 [-Werror=3Dclobbered]
   3656 |  const char *name =3D NULL;
        |              ^~~~

Cheers,

C.=20

Changes in v2 :

 - improved commit logs
 - reworked some changes to reduce the number of lines.=20
 - fixed misuse of asm/asm-prototypes.h for soft_nmi_interrupt()
=20
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

 arch/powerpc/include/asm/book3s/64/mmu-hash.h |  5 +++++
 arch/powerpc/include/asm/kvm_book3s.h         |  7 +++++++
 arch/powerpc/include/asm/nmi.h                |  1 +
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
 arch/powerpc/platforms/pseries/eeh_pseries.c  |  5 ++---
 arch/powerpc/platforms/pseries/pci.c          | 15 +++++++------
 arch/powerpc/platforms/pseries/ras.c          | 15 +++++--------
 arch/powerpc/platforms/pseries/setup.c        |  8 +++----
 19 files changed, 51 insertions(+), 58 deletions(-)

--=20
2.26.2

