Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A093B9244
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 15:29:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFzZz5HGSz3cfF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 23:29:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFzYV3w2bz302K
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 23:28:12 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161DDUDD013246; Thu, 1 Jul 2021 09:28:03 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39hed8gdaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:28:02 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 161DMe9D023009;
 Thu, 1 Jul 2021 13:28:01 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 39duv8h8w3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 13:28:00 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 161DRwJ226280228
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 13:27:58 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6013913A097;
 Thu,  1 Jul 2021 13:27:57 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3279213A095;
 Thu,  1 Jul 2021 13:27:57 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  1 Jul 2021 13:27:57 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.183])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8DE2622016C;
 Thu,  1 Jul 2021 15:27:56 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 00/32] powerpc: Add MSI IRQ domains to PCI drivers
Date: Thu,  1 Jul 2021 15:27:18 +0200
Message-Id: <20210701132750.1475580-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yn0gbfD_BmuuR4YnEogxTPORBgsPzxd6
X-Proofpoint-ORIG-GUID: yn0gbfD_BmuuR4YnEogxTPORBgsPzxd6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_07:2021-07-01,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=708 mlxscore=0
 clxscore=1034 bulkscore=0 phishscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010082
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

This series adds support for MSI IRQ domains on top of the XICS (P8)
and XIVE (P9/P10) IRQ domains for the PowerNV (baremetal) and pSeries
(VM) platforms. It should simplify and improve IRQ affinity of PCI
MSIs under these PowerPC platforms, specially for drivers distributing
multiple RX/TX queues on the different CPUs of the system.

Data locality can still be improved with an interrupt controller node
per chip but this requires FW changes. It could be done under OPAL.

The patchset has a large impact but it is well contained under the MSI
support. Initial tests were done on the P8, P9 and P10 PowerNV and
pSeries platforms, under the KVM and PowerVM hypervisor. PCI passthrough
was tested on P8/KVM, P9/KVM and P9/pVM with both interrupt modes.

P8 passthrough has some optimization to EOI MSIs when under real mode :

 e3c13e56a471 ("KVM: PPC: Book3S HV: Handle passthrough interrupts in gue=
st")
 5d375199ea96 ("KVM: PPC: Book3S HV: Set server for passed-through interr=
upts")

They give us a ~10% bandwidth improvement on some 100G adapters
(Thanks Alexey), so it's good to keep but they require access to the
low level IRQ domain of the machine. It should be possible to rework
the code and use the MSI IRQ domains instead but for now, it's simpler
to keep the bypass. That can come later.

The P8/CAPI driver is also impacted. Tests were done on a Firestone
system with a memory AFU.

Thanks,

C.

Changes since v2 :

 - Included some CONFIG_IRQ_DOMAIN_HIERARCHY ifdefs
 - Microwatt fixes for ICS native
 - Removed irqd_is_started() check when setting the affinity

C=C3=A9dric Le Goater (32):
  powerpc/pseries/pci: Introduce __find_pe_total_msi()
  powerpc/pseries/pci: Introduce rtas_prepare_msi_irqs()
  powerpc/xive: Add support for IRQ domain hierarchy
  powerpc/xive: Ease debugging of xive_irq_set_affinity()
  powerpc/pseries/pci: Add MSI domains
  powerpc/xive: Drop unmask of MSIs at startup
  powerpc/xive: Remove irqd_is_started() check when setting the affinity
  powerpc/pseries/pci: Add a domain_free_irqs() handler
  powerpc/pseries/pci: Add a msi_free() handler to clear XIVE data
  powerpc/pseries/pci: Add support of MSI domains to PHB hotplug
  powerpc/powernv/pci: Introduce __pnv_pci_ioda_msi_setup()
  powerpc/powernv/pci: Add MSI domains
  KVM: PPC: Book3S HV: Use the new IRQ chip to detect passthrough
    interrupts
  KVM: PPC: Book3S HV: XIVE: Change interface of passthrough interrupt
    routines
  KVM: PPC: Book3S HV: XIVE: Fix mapping of passthrough interrupts
  powerpc/xics: Remove ICS list
  powerpc/xics: Rename the map handler in a check handler
  powerpc/xics: Give a name to the default XICS IRQ domain
  powerpc/xics: Add debug logging to the set_irq_affinity handlers
  powerpc/xics: Add support for IRQ domain hierarchy
  powerpc/powernv/pci: Customize the MSI EOI handler to support PHB3
  powerpc/pci: Drop XIVE restriction on MSI domains
  powerpc/xics: Drop unmask of MSIs at startup
  powerpc/pseries/pci: Drop unused MSI code
  powerpc/powernv/pci: Drop unused MSI code
  powerpc/powernv/pci: Adapt is_pnv_opal_msi() to detect passthrough
    interrupt
  powerpc/xics: Fix IRQ migration
  powerpc/powernv/pci: Set the IRQ chip data for P8/CXL devices
  powerpc/powernv/pci: Rework pnv_opal_pci_msi_eoi()
  KVM: PPC: Book3S HV: XICS: Fix mapping of passthrough interrupts
  powerpc/xive: Use XIVE domain under xmon and debugfs
  genirq: Improve "hwirq" output in /proc and /sys/

 arch/powerpc/include/asm/kvm_ppc.h         |   4 +-
 arch/powerpc/include/asm/pci-bridge.h      |   5 +
 arch/powerpc/include/asm/pnv-pci.h         |   2 +-
 arch/powerpc/include/asm/xics.h            |   3 +-
 arch/powerpc/include/asm/xive.h            |   1 +
 arch/powerpc/platforms/powernv/pci.h       |   6 -
 arch/powerpc/platforms/pseries/pseries.h   |   2 +
 arch/powerpc/kernel/pci-common.c           |   6 +
 arch/powerpc/kvm/book3s_hv.c               |  18 +-
 arch/powerpc/kvm/book3s_hv_rm_xics.c       |   8 +-
 arch/powerpc/kvm/book3s_xive.c             |  18 +-
 arch/powerpc/platforms/powernv/pci-ioda.c  | 256 ++++++++++++++++--
 arch/powerpc/platforms/powernv/pci.c       |  67 -----
 arch/powerpc/platforms/pseries/msi.c       | 296 ++++++++++++++++-----
 arch/powerpc/platforms/pseries/pci_dlpar.c |   4 +
 arch/powerpc/platforms/pseries/setup.c     |   2 +
 arch/powerpc/sysdev/xics/ics-native.c      |  13 +-
 arch/powerpc/sysdev/xics/ics-opal.c        |  40 +--
 arch/powerpc/sysdev/xics/ics-rtas.c        |  40 +--
 arch/powerpc/sysdev/xics/xics-common.c     | 129 ++++++---
 arch/powerpc/sysdev/xive/common.c          |  98 +++++--
 kernel/irq/irqdesc.c                       |   2 +-
 kernel/irq/irqdomain.c                     |   1 +
 kernel/irq/proc.c                          |   2 +-
 24 files changed, 710 insertions(+), 313 deletions(-)

--=20
2.31.1

