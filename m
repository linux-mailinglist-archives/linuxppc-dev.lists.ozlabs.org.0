Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 932EE210892
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 11:49:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xc006936zDqZL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 19:49:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xbM06c21zDqvj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 19:21:16 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06192Zw4103313; Wed, 1 Jul 2020 05:21:09 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 320pjt2hnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 05:21:09 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0619GLL5008655;
 Wed, 1 Jul 2020 09:21:07 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 31wwr7t75q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 09:21:07 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0619L5cW66388116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Jul 2020 09:21:05 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 340384C044;
 Wed,  1 Jul 2020 09:21:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D11CA4C04A;
 Wed,  1 Jul 2020 09:21:03 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.199.47.174])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Jul 2020 09:21:03 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 00/10] powerpc/perf: Add support for power10 PMU Hardware
Date: Wed,  1 Jul 2020 05:20:52 -0400
Message-Id: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_04:2020-07-01,
 2020-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=756 clxscore=1011
 suspectscore=1 mlxscore=0 adultscore=0 impostorscore=0
 cotscore=-2147483648 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007010063
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
Cc: mikey@neuling.org, maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch series adds support for power10 PMU hardware.

Anju T Sudhakar (2):
  powerpc/perf: Add support for outputting extended regs in perf
    intr_regs
  tools/perf: Add perf tools support for extended register capability in
    powerpc

Athira Rajeev (5):
  KVM: PPC: Book3S HV: Save/restore new PMU registers
  powerpc/perf: Update Power PMU cache_events to u64 type
  powerpc/perf: power10 Performance Monitoring support
  powerpc/perf: support BHRB disable bit and new filtering modes
  powerpc/perf: Add extended regs support for power10 platform

Madhavan Srinivasan (3):
  powerpc/perf: Add support for ISA3.1 PMU SPRs
  powerpc/xmon: Add PowerISA v3.1 PMU SPRs
  powerpc/perf: Add power10_feat to dt_cpu_ftrs

---

Changes from v1 -> v2
- Added support for extended regs in powerpc
  for power9/power10 platform ( patches 8, 9, 10)
- Addressed change/removal of some event codes
  in the PMU driver

---

 arch/powerpc/include/asm/kvm_book3s_asm.h       |   2 +-
 arch/powerpc/include/asm/kvm_host.h             |   4 +-
 arch/powerpc/include/asm/perf_event_server.h    |  11 +-
 arch/powerpc/include/asm/processor.h            |   4 +
 arch/powerpc/include/asm/reg.h                  |   9 +
 arch/powerpc/include/uapi/asm/perf_regs.h       |  20 +-
 arch/powerpc/kernel/asm-offsets.c               |   3 +
 arch/powerpc/kernel/cpu_setup_power.S           |   7 +
 arch/powerpc/kernel/dt_cpu_ftrs.c               |  26 ++
 arch/powerpc/kernel/sysfs.c                     |   8 +
 arch/powerpc/kvm/book3s_hv.c                    |   6 +-
 arch/powerpc/kvm/book3s_hv_interrupts.S         |   8 +
 arch/powerpc/kvm/book3s_hv_rmhandlers.S         |  24 ++
 arch/powerpc/perf/Makefile                      |   2 +-
 arch/powerpc/perf/core-book3s.c                 |  61 +++-
 arch/powerpc/perf/generic-compat-pmu.c          |   2 +-
 arch/powerpc/perf/internal.h                    |   1 +
 arch/powerpc/perf/isa207-common.c               |  72 +++-
 arch/powerpc/perf/isa207-common.h               |  33 +-
 arch/powerpc/perf/mpc7450-pmu.c                 |   2 +-
 arch/powerpc/perf/perf_regs.c                   |  42 ++-
 arch/powerpc/perf/power10-events-list.h         |  70 ++++
 arch/powerpc/perf/power10-pmu.c                 | 425 ++++++++++++++++++++++++
 arch/powerpc/perf/power5+-pmu.c                 |   2 +-
 arch/powerpc/perf/power5-pmu.c                  |   2 +-
 arch/powerpc/perf/power6-pmu.c                  |   2 +-
 arch/powerpc/perf/power7-pmu.c                  |   2 +-
 arch/powerpc/perf/power8-pmu.c                  |   2 +-
 arch/powerpc/perf/power9-pmu.c                  |   8 +-
 arch/powerpc/perf/ppc970-pmu.c                  |   2 +-
 arch/powerpc/platforms/powernv/idle.c           |  14 +
 arch/powerpc/xmon/xmon.c                        |  15 +
 tools/arch/powerpc/include/uapi/asm/perf_regs.h |  20 +-
 tools/perf/arch/powerpc/include/perf_regs.h     |   8 +-
 tools/perf/arch/powerpc/util/perf_regs.c        |  61 ++++
 35 files changed, 939 insertions(+), 41 deletions(-)
 create mode 100644 arch/powerpc/perf/power10-events-list.h
 create mode 100644 arch/powerpc/perf/power10-pmu.c

-- 
1.8.3.1

