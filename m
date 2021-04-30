Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4449D36F6D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 10:05:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWlL51TTmz3c6G
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:05:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWlJW2B19z2yhf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 18:04:26 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13U82q1I080789; Fri, 30 Apr 2021 04:04:17 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388dy3g79e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 04:04:17 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13U84FI5023368;
 Fri, 30 Apr 2021 08:04:15 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 384akhaxqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 08:04:15 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13U84CU533030638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 08:04:12 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B5FB42045;
 Fri, 30 Apr 2021 08:04:12 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7179642041;
 Fri, 30 Apr 2021 08:04:12 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Apr 2021 08:04:12 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C43A42200B7;
 Fri, 30 Apr 2021 10:04:11 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/31] powerpc: Modernize the PCI/MSI support
Date: Fri, 30 Apr 2021 10:03:36 +0200
Message-Id: <20210430080407.4030767-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: omGQuC_IOP1YGcl2k4_twHGbMbKZJkDa
X-Proofpoint-ORIG-GUID: omGQuC_IOP1YGcl2k4_twHGbMbKZJkDa
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_05:2021-04-28,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 clxscore=1034 mlxscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=398 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104300056
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
(VM) platforms. It should improve greatly IRQ affinity of PCI MSIs
under these PowerPC platforms. Data locality can still be improved
with a machine IRQ domain per chip but this requires FW changes.

The patchset has a large impact but it is well contained under the MSI
support. Initial tests were done on the P8, P9 and P10 PowerNV and
pSeries platforms, under the KVM and PowerVM hypervisor. PCI passthrough
was tested on P8/KVM, P9/KVM and P9/pVM.

P8 passthrough adds an optimization to EOI MSIs when under real mode
but I didn't see any performance improvements with a passthrough 10G
Ethernet adapter. If someone has faster adapters, I would be interested
by the results.

The P8/CAPI driver is also impacted. Tests were done on a Firestone
system with a memory AFU.

Thanks,

C.

C=C3=A9dric Le Goater (31):
  powerpc/pseries/pci: Introduce __find_pe_total_msi()
  powerpc/pseries/pci: Introduce rtas_prepare_msi_irqs()
  powerpc/xive: Add support for IRQ domain hierarchy
  powerpc/xive: Ease debugging of xive_irq_set_affinity()
  powerpc/pseries/pci: Add MSI domains
  powerpc/xive: Drop unmask of MSIs at startup
  powerpc/xive: Fix xive_irq_set_affinity for MSI
  powerpc/pseries/pci: Add a domain_free_irqs handler
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
 arch/powerpc/platforms/powernv/pci-ioda.c  | 258 ++++++++++++++++--
 arch/powerpc/platforms/powernv/pci.c       |  67 -----
 arch/powerpc/platforms/pseries/msi.c       | 296 ++++++++++++++++-----
 arch/powerpc/platforms/pseries/pci_dlpar.c |   4 +
 arch/powerpc/platforms/pseries/setup.c     |   2 +
 arch/powerpc/sysdev/xics/ics-opal.c        |  40 +--
 arch/powerpc/sysdev/xics/ics-rtas.c        |  40 +--
 arch/powerpc/sysdev/xics/xics-common.c     | 125 ++++++---
 arch/powerpc/sysdev/xive/common.c          |  81 +++++-
 kernel/irq/irqdesc.c                       |   2 +-
 kernel/irq/irqdomain.c                     |   1 +
 kernel/irq/proc.c                          |   2 +-
 23 files changed, 693 insertions(+), 298 deletions(-)

--=20
2.26.3

