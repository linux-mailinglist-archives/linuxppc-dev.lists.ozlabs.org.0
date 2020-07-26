Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 008FC22DFBC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 16:47:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BF5Pq325NzDvJ2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 00:47:27 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BF5MY1cnpzDrgk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 00:45:28 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06QEWpRq075571; Sun, 26 Jul 2020 10:45:22 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32gg1sbn28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 10:45:21 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06QEfsDl020279;
 Sun, 26 Jul 2020 14:45:19 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 32gcye8s19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 14:45:19 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06QEjG2P53149926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 26 Jul 2020 14:45:16 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 792E64C04E;
 Sun, 26 Jul 2020 14:45:16 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 704534C046;
 Sun, 26 Jul 2020 14:45:14 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.199.33.244])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 26 Jul 2020 14:45:14 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V4 0/4] powerpc/perf: Add support for perf extended regs in
 powerpc
Date: Sun, 26 Jul 2020 10:45:09 -0400
Message-Id: <1595774713-1482-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-26_07:2020-07-24,
 2020-07-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007260114
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org, maddy@linux.vnet.ibm.com,
 kjain@linux.ibm.com, acme@kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch set to add support for perf extended register capability in
powerpc. The capability flag PERF_PMU_CAP_EXTENDED_REGS, is used to
indicate the PMU which support extended registers. The generic code
define the mask of extended registers as 0 for non supported architectures.

Patches 1 and 2 are the kernel side changes needed to include
base support for extended regs in powerpc and in power10.
Patches 3 and 4 are the perf tools side changes needed to support the
extended registers.

patch 1/4 defines the PERF_PMU_CAP_EXTENDED_REGS mask to output the
values of mmcr0,mmcr1,mmcr2 for POWER9. Defines `PERF_REG_EXTENDED_MASK`
at runtime which contains mask value of the supported registers under
extended regs.

patch 2/4 adds the extended regs support for power10 and exposes
MMCR3, SIER2, SIER3 registers as part of extended regs.

Patch 3/4 and 4/4 adds extended regs to sample_reg_mask in the tool
side to use with `-I?` option for power9 and power10 respectively.

Ravi bangoria found an issue with `perf record -I` while testing the
changes. The same issue is currently being worked on here: 
https://lkml.org/lkml/2020/7/19/413 and will be resolved once fix
from Jin Yao is merged.

This patch series is based on powerpc/next

Changelog:

Changes from v3 -> v4
- Split the series and send extended regs as separate patch set here.
  Link to previous series :
  https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=190462&state=*
  Other PMU patches are already merged in powerpc/next. 

- Fixed kernel build issue when using config having
  CONFIG_PERF_EVENTS set and without CONFIG_PPC_PERF_CTRS
  reported by kernel build bot.
- Included Reviewed-by from Kajol Jain.
- Addressed review comments from Ravi Bangoria to initialize `perf_reg_extended_max`
  and define it in lowercase since it is local variable.

Anju T Sudhakar (2):
  powerpc/perf: Add support for outputting extended regs in perf
    intr_regs
  tools/perf: Add perf tools support for extended register capability in
    powerpc

Athira Rajeev (2):
  powerpc/perf: Add extended regs support for power10 platform
  tools/perf: Add perf tools support for extended regs in power10

 arch/powerpc/include/asm/perf_event.h           |  3 ++
 arch/powerpc/include/asm/perf_event_server.h    |  5 +++
 arch/powerpc/include/uapi/asm/perf_regs.h       | 20 ++++++++-
 arch/powerpc/perf/core-book3s.c                 |  1 +
 arch/powerpc/perf/perf_regs.c                   | 44 ++++++++++++++++++--
 arch/powerpc/perf/power10-pmu.c                 |  6 +++
 arch/powerpc/perf/power9-pmu.c                  |  6 +++
 tools/arch/powerpc/include/uapi/asm/perf_regs.h | 20 ++++++++-
 tools/perf/arch/powerpc/include/perf_regs.h     |  8 +++-
 tools/perf/arch/powerpc/util/header.c           |  9 +---
 tools/perf/arch/powerpc/util/perf_regs.c        | 55 +++++++++++++++++++++++++
 tools/perf/arch/powerpc/util/utils_header.h     | 15 +++++++
 12 files changed, 178 insertions(+), 14 deletions(-)
 create mode 100644 tools/perf/arch/powerpc/util/utils_header.h

-- 
1.8.3.1

