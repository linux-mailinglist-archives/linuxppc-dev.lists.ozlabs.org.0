Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE261EF295
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 09:59:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dZmC67nSzDqvL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 17:59:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dZkB6ChrzDqvN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 17:57:22 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0557PHjQ119376; Fri, 5 Jun 2020 03:57:16 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31fhn4gyxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jun 2020 03:57:16 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0557oUI0003694;
 Fri, 5 Jun 2020 07:57:14 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 31bf483nq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jun 2020 07:57:14 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0557vC9324707074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Jun 2020 07:57:12 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 440934C05A;
 Fri,  5 Jun 2020 07:57:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 033294C04E;
 Fri,  5 Jun 2020 07:57:11 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.85.92.6])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Jun 2020 07:57:10 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 0/7] powerpc/perf: Add support for power10 PMU Hardware
Date: Fri,  5 Jun 2020 03:57:03 -0400
Message-Id: <1591343830-8286-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-05_01:2020-06-04,
 2020-06-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 cotscore=-2147483648 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=1 spamscore=0 bulkscore=0 phishscore=0
 mlxscore=0 mlxlogscore=694 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006050053
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
Cc: mikey@linux.ibm.com, mikey@neuling.org, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, atrajeev@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch series adds support for power10 PMU hardware.
And code changes are based on powerpc/next.

Athira Rajeev (4):
  KVM: PPC: Book3S HV: Save/restore new PMU registers
  powerpc/perf: Update Power PMU cache_events to u64 type
  powerpc/perf: power10 Performance Monitoring support
  powerpc/perf: support BHRB disable bit and new filtering modes

Madhavan Srinivasan (3):
  powerpc/perf: Add support for ISA3.1 PMU SPRs
  powerpc/xmon: Add PowerISA v3.1 PMU SPRs
  powerpc/perf: Add power10_feat to dt_cpu_ftrs

 arch/powerpc/include/asm/kvm_book3s_asm.h    |   2 +-
 arch/powerpc/include/asm/kvm_host.h          |   4 +-
 arch/powerpc/include/asm/perf_event_server.h |   3 +-
 arch/powerpc/include/asm/processor.h         |   4 +
 arch/powerpc/include/asm/reg.h               |   9 +
 arch/powerpc/kernel/asm-offsets.c            |   3 +
 arch/powerpc/kernel/cpu_setup_power.S        |   7 +
 arch/powerpc/kernel/dt_cpu_ftrs.c            |  26 ++
 arch/powerpc/kernel/sysfs.c                  |   8 +
 arch/powerpc/kvm/book3s_hv.c                 |   6 +-
 arch/powerpc/kvm/book3s_hv_interrupts.S      |   8 +
 arch/powerpc/kvm/book3s_hv_rmhandlers.S      |  24 ++
 arch/powerpc/perf/Makefile                   |   2 +-
 arch/powerpc/perf/core-book3s.c              |  60 +++-
 arch/powerpc/perf/generic-compat-pmu.c       |   2 +-
 arch/powerpc/perf/internal.h                 |   1 +
 arch/powerpc/perf/isa207-common.c            |  72 ++++-
 arch/powerpc/perf/isa207-common.h            |  33 +-
 arch/powerpc/perf/mpc7450-pmu.c              |   2 +-
 arch/powerpc/perf/power10-events-list.h      |  81 +++++
 arch/powerpc/perf/power10-pmu.c              | 431 +++++++++++++++++++++++++++
 arch/powerpc/perf/power5+-pmu.c              |   2 +-
 arch/powerpc/perf/power5-pmu.c               |   2 +-
 arch/powerpc/perf/power6-pmu.c               |   2 +-
 arch/powerpc/perf/power7-pmu.c               |   2 +-
 arch/powerpc/perf/power8-pmu.c               |   2 +-
 arch/powerpc/perf/power9-pmu.c               |   2 +-
 arch/powerpc/perf/ppc970-pmu.c               |   2 +-
 arch/powerpc/platforms/powernv/idle.c        |  14 +
 arch/powerpc/xmon/xmon.c                     |  15 +
 30 files changed, 796 insertions(+), 35 deletions(-)
 create mode 100644 arch/powerpc/perf/power10-events-list.h
 create mode 100644 arch/powerpc/perf/power10-pmu.c

-- 
1.8.3.1

