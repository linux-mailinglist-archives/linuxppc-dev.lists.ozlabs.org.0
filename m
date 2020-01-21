Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2308143AAE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 11:19:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4824Jt4cyyzDqWM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 21:19:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anju@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4824Gt30k6zDqKD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 21:17:41 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00LAHZ4u066902
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 05:17:39 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xmgdktjys-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 05:17:38 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <anju@linux.vnet.ibm.com>;
 Tue, 21 Jan 2020 10:17:36 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 21 Jan 2020 10:17:34 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00LAHX8855312418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jan 2020 10:17:33 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77C14A405B;
 Tue, 21 Jan 2020 10:17:33 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4A9BA4054;
 Tue, 21 Jan 2020 10:17:31 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.62.176])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jan 2020 10:17:31 +0000 (GMT)
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 0/5] Re-enable IMC trace-mode
Date: Tue, 21 Jan 2020 15:47:23 +0530
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20012110-0012-0000-0000-0000037F508E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012110-0013-0000-0000-000021BB901A
Message-Id: <20200121101728.14858-1-anju@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-21_02:2020-01-21,
 2020-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=1 mlxlogscore=856 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001210088
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
Cc: nasastry@in.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit <249fad734a25> ""powerpc/perf: Disable trace_imc pmu"               
disables IMC(In-Memory Collection) trace-mode in kernel, since frequent       
mode switching between accumulation mode and trace mode via the spr LDBAR  
in the hardware can trigger a checkstop(system crash).

This patch series re-enables IMC trace mode and fixes the mode switching
issue by global lock mechanism.

Patch 3/5,4/5 and 5/5 provides a selftest to verify the global-lock
mechanism.

Changes from v1 -> v2:
-------------------------
- Added self test patches to the series.

Anju T Sudhakar (2):
  powerpc/powernv: Re-enable imc trace-mode in kernel
  powerpc/perf: Implement a global lock to avoid races between trace,
    core and thread imc events.

Madhavan Srinivasan (3):
  powerpc/perf: Add an interface sub-folder to imc pmu
  selftest/powerpc/pmc: Support to include interface test for Memory
    Counter PMUs
  selftest/powerpc/pmu: Testcase for imc global lock mechanism


 arch/powerpc/include/asm/imc-pmu.h            |  11 +-
 arch/powerpc/perf/imc-pmu.c                   | 196 +++++++++++++++---
 arch/powerpc/platforms/powernv/opal-imc.c     |   9 +-
 tools/testing/selftests/powerpc/pmu/Makefile  |   7 +-
 .../powerpc/pmu/mem_counters/Makefile         |  21 ++
 .../pmu/mem_counters/imc_global_lock_test.c   |  68 ++++++
 .../powerpc/pmu/mem_counters/mem_counters.c   |  99 +++++++++
 .../powerpc/pmu/mem_counters/mem_counters.h   |  36 ++++
 8 files changed, 408 insertions(+), 39 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/mem_counters/Makefile
 create mode 100644 tools/testing/selftests/powerpc/pmu/mem_counters/imc_global_lock_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/mem_counters/mem_counters.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/mem_counters/mem_counters.h

-- 
2.18.1

