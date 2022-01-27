Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C35BD49DB57
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:22:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JksVF55m7z30Q9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 18:22:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BOlsxkqw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BOlsxkqw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JksSt0snWz306f
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 18:21:01 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20R6cTLE015469; 
 Thu, 27 Jan 2022 07:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=HUhYlUJJpoZZ0PyCbtHK7t8JIXqEDEveXGrUwH9+oB8=;
 b=BOlsxkqwLSQy+SZfObgfK23iOtPeUp2eih7Ow5SX9E2t0MhuQQwW0hcqoe1dK3VwvzsK
 uEMQS5weHcaRZzbKuKvuauyjSWRIQ3xbz2krd/jJB94U8WxEScEAFwzcZOHlZfhKYXnP
 UNZ113RYX42Htk1L4LlWesgCX6pfFBYQFqj2pczd/XbYLh4G+Hxru7SR/lzmiSLcCdFN
 M8G/8xGhnEr405Pv/Y2ykREf/c3EeA0HQe36bUXpkyJqjxbw51Hvw13O6b6YrVil+Qf0
 aYU+YvvQlyBjAssgETxCELwPUBgEeYVW4SpcZbGe/KBxcwsXd/J6z2wsjV5tnHoDDLrw 4w== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dung21tqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:20:53 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20R78MA8005986;
 Thu, 27 Jan 2022 07:20:51 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3dr9j9tmyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:20:51 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20R7Kl5v44302838
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 07:20:47 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD38242047;
 Thu, 27 Jan 2022 07:20:47 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4578E4204C;
 Thu, 27 Jan 2022 07:20:45 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.106.251])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jan 2022 07:20:44 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 00/20] Add perf sampling tests as part of selftest
Date: Thu, 27 Jan 2022 12:49:52 +0530
Message-Id: <20220127072012.662451-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VTb7poY1Kpq1skE8OOcqWf20Z3t9IIOJ
X-Proofpoint-GUID: VTb7poY1Kpq1skE8OOcqWf20Z3t9IIOJ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_02,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270036
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch series adds support for perf sampling tests that
enables capturing sampling data in perf mmap buffer and
further support for reading and processing the samples.
It also addds basic utility functions to process the
mmap buffer inorder to read total count of samples as
well as the contents of sample.

With enablement of extended regs in powerpc, sample can
also capture performance monitor registers (different
Monitor Mode control Registers) by specifying sample type
for extended regs. This information from sample is
used to verify the perf interface, by comparing the event
code fields with interrupt registers value.

Patch series also include support for macros which does the
job of extracting the event code fields and specific
fields from supported Monitor Mode Control Registers.

The sampling support functions and testcases are added in new
folder  "sampling_tests" under "selftests/powerpc/pmu" and
corresponding updates are done Makefiles in "selftests/powerpc"
and "sampling_tests" folder. Testcases are added for PMU registers
which verifies that the perf interface programs these SPR's
correctly.

Patch 1 of the series add new field "mmap_buffer" to "struct event"
to enable capturing of samples as part of perf event.
This field is a place-holder for the mmap-buffer incase of
sample collection

Patch 2-4 adds support functions for enabling perf sampling test and
adds couple of basic utility functions to post process the
mmap buffer. It also adds macros to parse event codes.

Patch 5 adds event_init_sampling function to initialise event
attribute fields for sampling events.

Patch 6-8 adds generic Monitor Mode Control Register(MMCR) macro to get
specific field value from a specific MMCR. It also adds macros and
utility functions to fetch individual fields from all MMCRx PMU registers.

Patch 9-20 adds testcases to verify if fields values of MMCRx registers
are set correctly from event code via perf interface

Link to the linux-ci:
https://github.com/athira-rajeev/linux-ci/actions?query=branch%3Asefltests

Patchset contains initial set of test cases along with basic
utilities to verify basic perf interface. More sampling testcases
are in plan which will cover additional scenarios.

Athira Rajeev (11):
  selftest/powerpc/pmu: Include mmap_buffer field as part of struct
    event
  selftest/powerpc/pmu: Add support for perf sampling tests
  selftest/powerpc/pmu: Add macro to extract mmcr0/mmcr1 fields
  selftest/powerpc/pmu/: Add interface test for mmcr0 exception bits
  selftest/powerpc/pmu/: Add interface test for mmcr0_cc56run field
  selftest/powerpc/pmu/: Add interface test for mmcr0_pmccext bit
  selftest/powerpc/pmu/: Add interface test for mmcr0_pmcjce field
  selftest/powerpc/pmu/: Add interface test for mmcr0_fc56 field using
    pmc1
  selftest/powerpc/pmu/: Add interface test for mmcr0_pmc56 using pmc5
  selftest/powerpc/pmu/: Add interface test for mmcr1_comb field
  selftest/powerpc/pmu/: Add selftest for mmcr1 pmcxsel/unit/cache
    fields

Kajol Jain (4):
  selftest/powerpc/pmu: Add utility functions to post process the mmap
    buffer
  selftest/powerpc/pmu: Add macro to extract mmcr3 and mmcra fields
  selftest/powerpc/pmu/: Add interface test for mmcr3_src fields
  selftest/powerpc/pmu: Add interface test for mmcra register fields

Madhavan Srinivasan (5):
  selftest/powerpc/pmu: Add macros to parse event codes
  selftest/powerpc/pmu: Add event_init_sampling function
  selftest/powerpc/pmu: Add macros to extract mmcr fields
  selftest/powerpc/pmu/: Add interface test for mmcr2_l2l3 field
  selftest/powerpc/pmu/: Add interface test for mmcr2_fcs_fch fields

 tools/testing/selftests/powerpc/pmu/Makefile  |  11 +-
 tools/testing/selftests/powerpc/pmu/event.c   |  18 +-
 tools/testing/selftests/powerpc/pmu/event.h   |   6 +
 .../powerpc/pmu/sampling_tests/Makefile       |  28 +
 .../powerpc/pmu/sampling_tests/misc.c         | 507 ++++++++++++++++++
 .../powerpc/pmu/sampling_tests/misc.h         | 263 +++++++++
 .../pmu/sampling_tests/mmcr0_cc56run_test.c   |  59 ++
 .../sampling_tests/mmcr0_exceptionbits_test.c |  59 ++
 .../sampling_tests/mmcr0_fc56_pmc1ce_test.c   |  58 ++
 .../sampling_tests/mmcr0_fc56_pmc56_test.c    |  58 ++
 .../pmu/sampling_tests/mmcr0_pmccext_test.c   |  59 ++
 .../pmu/sampling_tests/mmcr0_pmcjce_test.c    |  58 ++
 .../pmu/sampling_tests/mmcr1_comb_test.c      |  66 +++
 .../mmcr1_sel_unit_cache_test.c               |  70 +++
 .../pmu/sampling_tests/mmcr2_fcs_fch_test.c   |  67 +++
 .../pmu/sampling_tests/mmcr2_l2l3_test.c      |  74 +++
 .../pmu/sampling_tests/mmcr3_src_test.c       |  67 +++
 .../mmcra_thresh_marked_sample_test.c         |  80 +++
 18 files changed, 1605 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/Makefile
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_cc56run_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_exceptionbits_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc1ce_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_fc56_pmc56_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_pmccext_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr0_pmcjce_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_comb_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_sel_unit_cache_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr2_fcs_fch_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr2_l2l3_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr3_src_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_marked_sample_test.c

-- 
2.27.0

