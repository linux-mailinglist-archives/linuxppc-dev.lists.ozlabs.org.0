Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BE91DAF29
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 11:47:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rnwp2r0GzDqfG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 19:47:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Rntf2v81zDqVF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 19:45:46 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04K9Z7FQ116718; Wed, 20 May 2020 05:45:40 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312agekkxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 05:45:40 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04K9ed5X021662;
 Wed, 20 May 2020 09:45:38 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 313xehkc14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 09:45:38 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04K9jaMr5439528
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 May 2020 09:45:36 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAB034C040;
 Wed, 20 May 2020 09:45:35 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AEBD4C04A;
 Wed, 20 May 2020 09:45:34 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.85.113.195])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 20 May 2020 09:45:33 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH V3 0/2] powerpc/perf: Add support for perf extended regs in
 powerpc
Date: Wed, 20 May 2020 05:45:31 -0400
Message-Id: <1589967933-1503-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-20_03:2020-05-19,
 2020-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=994 clxscore=1015 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=1 cotscore=-2147483648
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005200080
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
Cc: ravi.bangoria@linux.ibm.com, atrajeev@linux.vnet.ibm.com,
 maddy@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, acme@kernel.org,
 anju@linux.vnet.ibm.com, jolsa@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch set to add support for perf extended register capability in
powerpc. The capability flag PERF_PMU_CAP_EXTENDED_REGS, is used to
indicate the PMU which support extended registers. The generic code
define the mask of extended registers as 0 for non supported architectures.

patch 1/2 defines this PERF_PMU_CAP_EXTENDED_REGS mask to output the
values of mmcr0,mmcr1,mmcr2 for POWER9. Defines `PERF_REG_EXTENDED_MASK`
at runtime which contains mask value of the supported registers under
extended regs.

Patch 2/2 adds extended regs to sample_reg_mask in the tool side to use
with `-I?` option.

Anju T Sudhakar (2):
  powerpc/perf: Add support for outputting extended regs in perf
    intr_regs
  tools/perf: Add perf tools support for extended register capability in
    powerpc
---
Changes from v2 -> v3
- Split kernel and tools side patches as suggested by Arnaldo
- Addressed review comment from Madhavan Srinivasn

Changes from v1 -> v2

- PERF_REG_EXTENDED_MASK` is defined at runtime in the kernel
based on platform. This will give flexibility in using extended
regs for all processor versions where the supported registers may differ.
- removed PERF_REG_EXTENDED_MASK from the perf tools side. Based on the
processor version(from PVR value), tool side will return the appropriate
extended mask
- Since tool changes can handle without a "PERF_REG_EXTENDED_MASK" macro,
dropped patch to set NO_AUXTRACE.
- Addressed review comments from Ravi Bangoria for V1

---

 arch/powerpc/include/asm/perf_event_server.h    |  8 ++++
 arch/powerpc/include/uapi/asm/perf_regs.h       | 14 ++++++-
 arch/powerpc/perf/core-book3s.c                 |  1 +
 arch/powerpc/perf/perf_regs.c                   | 34 +++++++++++++--
 arch/powerpc/perf/power9-pmu.c                  |  6 +++
 tools/arch/powerpc/include/uapi/asm/perf_regs.h | 14 ++++++-
 tools/perf/arch/powerpc/include/perf_regs.h     |  5 ++-
 tools/perf/arch/powerpc/util/perf_regs.c        | 55 +++++++++++++++++++++++++
 8 files changed, 131 insertions(+), 6 deletions(-)

-- 
1.8.3.1

