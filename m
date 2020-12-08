Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F36642D2E06
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 16:19:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr3kG12SPzDqJM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 02:19:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr3YX1qZqzDqTn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 02:11:44 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B8F35UH128795; Tue, 8 Dec 2020 10:11:37 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359d5pxagf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 10:11:37 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B8F9l6J019673;
 Tue, 8 Dec 2020 15:11:30 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3581u8ne61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 15:11:30 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B8FBSY710814030
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Dec 2020 15:11:28 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6A5AA4070;
 Tue,  8 Dec 2020 15:11:26 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0145A405E;
 Tue,  8 Dec 2020 15:11:26 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  8 Dec 2020 15:11:26 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 21AA522017B;
 Tue,  8 Dec 2020 16:11:26 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/13] powerpc/xive: misc cleanups
Date: Tue,  8 Dec 2020 16:11:11 +0100
Message-Id: <20201208151124.1329942-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_09:2020-12-08,
 2020-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 bulkscore=0
 spamscore=0 mlxlogscore=391 priorityscore=1501 mlxscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=1 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012080093
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

The most important change is the removal of support of OPAL flags
required for P9 DD1. It provides a good cleanup of some complex
routines.

The series also includes a change on how the pages donated to the XIVE
IC are allocated in Linux. The flags are changed to make sure that
these pages can not be reclaimed.

Thanks,

C.

C=C3=A9dric Le Goater (13):
  KVM: PPC: Book3S HV: XIVE: Show detailed configuration in debug output
  powerpc/xive: Rename XIVE_IRQ_NO_EOI to show its a flag
  powerpc/xive: Introduce XIVE_IPI_HW_IRQ
  powerpc/xive: Use cpu_to_node() instead of ibm,chip-id property
  powerpc/xive: Fix allocation of pages donated to the XIVE controller
  powerpc/xive: Add a name to the IRQ domain
  powerpc/xive: Add a debug_show handler to the XIVE irq_domain
  powerpc: Increase NR_IRQS range to support more KVM guests
  powerpc/xive: Remove P9 DD1 flag XIVE_IRQ_FLAG_SHIFT_BUG
  powerpc/xive: Remove P9 DD1 flag XIVE_IRQ_FLAG_MASK_FW
  powerpc/xive: Remove P9 DD1 flag XIVE_IRQ_FLAG_EOI_FW
  powerpc/xive: Simplify xive_do_source_eoi()
  powerpc/xive: Improve error reporting of OPAL calls

 arch/powerpc/include/asm/opal-api.h      |   6 +-
 arch/powerpc/include/asm/xive.h          |   8 +-
 arch/powerpc/kvm/book3s_xive.h           |   2 +
 arch/powerpc/sysdev/xive/xive-internal.h |   9 +-
 arch/powerpc/kvm/book3s_xive.c           | 134 +++++++-------
 arch/powerpc/kvm/book3s_xive_native.c    |  24 ++-
 arch/powerpc/kvm/book3s_xive_template.c  |   5 -
 arch/powerpc/sysdev/xive/common.c        | 219 +++++++++++------------
 arch/powerpc/sysdev/xive/native.c        |  48 ++---
 arch/powerpc/sysdev/xive/spapr.c         |   8 +-
 arch/powerpc/Kconfig                     |   2 +-
 11 files changed, 230 insertions(+), 235 deletions(-)

--=20
2.26.2

