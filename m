Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 420FD1A2BEE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 00:39:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yK2W0smGzDr1c
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 08:39:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=desnesn@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yJyw3K7BzDr4g
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 08:36:02 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 038MWxWF115429; Wed, 8 Apr 2020 18:35:55 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 309210jfd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 18:35:55 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 038MUQ86009028;
 Wed, 8 Apr 2020 22:35:54 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 3091me0gs3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 22:35:54 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 038MZrBf44302674
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Apr 2020 22:35:53 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DDC778066;
 Wed,  8 Apr 2020 22:35:53 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76DBE78063;
 Wed,  8 Apr 2020 22:35:51 +0000 (GMT)
Received: from ibm.ibmuc.com (unknown [9.85.206.148])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Apr 2020 22:35:51 +0000 (GMT)
From: "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH, RESEND,
 0/3] selftests/powerpc: A few fixes on powerpc selftests
Date: Wed,  8 Apr 2020 19:35:40 -0300
Message-Id: <20200408223543.21168-1-desnesn@linux.ibm.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-08_08:2020-04-07,
 2020-04-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0
 mlxscore=0 impostorscore=0 suspectscore=1 adultscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004080152
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
Cc: desnesn@linux.ibm.com, shuah@kernel.org, gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patchseries addresses a few fixes on powerpc selftests (first and
second patch are being resent).

The first fix has to do with the extra counts on PMCs resets, which not
only are shown on the trace_logs, but can also invalidate the results of a
few selftests. On the other hand, the second fix proper addresses the Per-
formance Monitor Alert (PMAE) bit on MMCR0 when freezing counters are dis-
abled on cycles_with_freeze_test selftest. Lastly, the third fix adds a
memory barrier on count_pmc() to ensure read consistency of PMCs. This is
necessary since these values are usually accounted on ebb_handlers to val-
lidade tests results, such as the overflow values on pmc56_overflow_test.

Desnes A. Nunes do Rosario (2):
  selftests/powerpc: Use write_pmc instead of count_pmc to reset PMCs on
    ebb tests
  selftests/powerpc: ensure PMC reads are set and ordered on count_pmc

Gustavo Romero (1):
  selftests/powerpc: enable performance alerts when freezing counters on
    cycles_with_freeze_test selftest

 .../powerpc/pmu/ebb/back_to_back_ebbs_test.c         |  2 +-
 .../testing/selftests/powerpc/pmu/ebb/cycles_test.c  |  2 +-
 .../powerpc/pmu/ebb/cycles_with_freeze_test.c        |  4 ++--
 .../powerpc/pmu/ebb/cycles_with_mmcr2_test.c         |  2 +-
 tools/testing/selftests/powerpc/pmu/ebb/ebb.c        |  6 +++++-
 .../powerpc/pmu/ebb/ebb_on_willing_child_test.c      |  2 +-
 .../selftests/powerpc/pmu/ebb/lost_exception_test.c  |  2 +-
 .../selftests/powerpc/pmu/ebb/multi_counter_test.c   | 12 ++++++------
 .../selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c |  2 +-
 .../selftests/powerpc/pmu/ebb/pmae_handling_test.c   |  2 +-
 .../selftests/powerpc/pmu/ebb/pmc56_overflow_test.c  |  2 +-
 11 files changed, 21 insertions(+), 17 deletions(-)

-- 
2.21.1

