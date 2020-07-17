Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C61223E7C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 16:44:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7YmK2vgfzDrP1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 00:44:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7Ydx2M5gzDrNj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 00:38:44 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06HEWp0O140989; Fri, 17 Jul 2020 10:38:38 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32b9ag0kfs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 10:38:38 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06HEU73d024878;
 Fri, 17 Jul 2020 14:38:35 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 327527kf7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 14:38:35 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06HEcV8w12714466
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 14:38:31 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3376B4C050;
 Fri, 17 Jul 2020 14:38:31 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7978D4C046;
 Fri, 17 Jul 2020 14:38:28 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.77.207.73])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jul 2020 14:38:28 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [v3 00/15] powerpc/perf: Add support for power10 PMU Hardware
Date: Fri, 17 Jul 2020 10:38:12 -0400
Message-Id: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-17_06:2020-07-17,
 2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0 suspectscore=1
 lowpriorityscore=0 impostorscore=0 clxscore=1011 malwarescore=0
 mlxlogscore=807 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007170108
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, maddy@linux.vnet.ibm.com,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, svaidyan@in.ibm.com,
 acme@kernel.org, jolsa@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch series adds support for power10 PMU hardware.

Patches 1..3 are the clean up patches which refactors the way how
PMU SPR's are stored in core-book3s and in KVM book3s, as well as update
data type for PMU cache_events.

Patches 12 and 13 adds base support for perf extended register
capability in powerpc. Support for extended regs in power10 is
covered in patches 14,15

Other patches includes main changes to support for power10 PMU.

Anju T Sudhakar (2):
  powerpc/perf: Add support for outputting extended regs in perf
    intr_regs
  tools/perf: Add perf tools support for extended register capability in
    powerpc

Athira Rajeev (10):
  powerpc/perf: Update cpu_hw_event to use `struct` for storing MMCR
    registers
  KVM: PPC: Book3S HV: Cleanup updates for kvm vcpu MMCR
  powerpc/perf: Update Power PMU cache_events to u64 type
  KVM: PPC: Book3S HV: Save/restore new PMU registers
  powerpc/perf: power10 Performance Monitoring support
  powerpc/perf: Ignore the BHRB kernel address filtering for P10
  powerpc/perf: Add Power10 BHRB filter support for
    PERF_SAMPLE_BRANCH_IND_CALL/COND
  powerpc/perf: BHRB control to disable BHRB logic when not used
  powerpc/perf: Add extended regs support for power10 platform
  tools/perf: Add perf tools support for extended regs in power10

Madhavan Srinivasan (3):
  powerpc/perf: Add support for ISA3.1 PMU SPRs
  powerpc/xmon: Add PowerISA v3.1 PMU SPRs
  powerpc/perf: Add power10_feat to dt_cpu_ftrs

---
Changes from v2 -> v3
- Addressed review comments from Michael Neuling,
  Michael Ellerman, Gautham Shenoy and Paul Mackerras

Changes from v1 -> v2
- Added support for extended regs in powerpc
  for power9/power10 platform ( patches 12 to 15)
- Addressed change/removal of some event codes
  in the PMU driver
---

 Documentation/virt/kvm/api.rst                  |   3 +
 arch/powerpc/include/asm/kvm_book3s_asm.h       |   2 +-
 arch/powerpc/include/asm/kvm_host.h             |   6 +-
 arch/powerpc/include/asm/perf_event_server.h    |  22 +-
 arch/powerpc/include/asm/processor.h            |   4 +
 arch/powerpc/include/asm/reg.h                  |   9 +
 arch/powerpc/include/uapi/asm/kvm.h             |   9 +-
 arch/powerpc/include/uapi/asm/perf_regs.h       |  20 +-
 arch/powerpc/kernel/asm-offsets.c               |   5 +
 arch/powerpc/kernel/cpu_setup_power.S           |   8 +
 arch/powerpc/kernel/dt_cpu_ftrs.c               |  26 ++
 arch/powerpc/kernel/sysfs.c                     |   8 +
 arch/powerpc/kvm/book3s_hv.c                    |  38 ++-
 arch/powerpc/kvm/book3s_hv_interrupts.S         |   8 +
 arch/powerpc/kvm/book3s_hv_rmhandlers.S         |  36 +-
 arch/powerpc/perf/Makefile                      |   2 +-
 arch/powerpc/perf/core-book3s.c                 | 108 ++++--
 arch/powerpc/perf/generic-compat-pmu.c          |   2 +-
 arch/powerpc/perf/internal.h                    |   1 +
 arch/powerpc/perf/isa207-common.c               |  91 +++--
 arch/powerpc/perf/isa207-common.h               |  37 ++-
 arch/powerpc/perf/mpc7450-pmu.c                 |  23 +-
 arch/powerpc/perf/perf_regs.c                   |  44 ++-
 arch/powerpc/perf/power10-events-list.h         |  70 ++++
 arch/powerpc/perf/power10-pmu.c                 | 425 ++++++++++++++++++++++++
 arch/powerpc/perf/power5+-pmu.c                 |  19 +-
 arch/powerpc/perf/power5-pmu.c                  |  19 +-
 arch/powerpc/perf/power6-pmu.c                  |  18 +-
 arch/powerpc/perf/power7-pmu.c                  |  19 +-
 arch/powerpc/perf/power8-pmu.c                  |   2 +-
 arch/powerpc/perf/power9-pmu.c                  |   8 +-
 arch/powerpc/perf/ppc970-pmu.c                  |  26 +-
 arch/powerpc/platforms/powernv/idle.c           |  22 +-
 arch/powerpc/xmon/xmon.c                        |  13 +
 tools/arch/powerpc/include/uapi/asm/kvm.h       |   9 +-
 tools/arch/powerpc/include/uapi/asm/perf_regs.h |  20 +-
 tools/perf/arch/powerpc/include/perf_regs.h     |   8 +-
 tools/perf/arch/powerpc/util/header.c           |   9 +-
 tools/perf/arch/powerpc/util/perf_regs.c        |  55 +++
 tools/perf/arch/powerpc/util/utils_header.h     |  15 +
 40 files changed, 1117 insertions(+), 152 deletions(-)
 create mode 100644 arch/powerpc/perf/power10-events-list.h
 create mode 100644 arch/powerpc/perf/power10-pmu.c
 create mode 100644 tools/perf/arch/powerpc/util/utils_header.h

-- 
1.8.3.1

