Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC462C59B0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 18:00:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChkX868NVzDrPV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 04:00:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PYtMvcej; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChkQL60cmzDrNX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 03:55:06 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQGauK9140702; Thu, 26 Nov 2020 11:54:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=BNbnPNSgkc/AV0WmozNHuAEjyIKseDFpCfFajwpOnEc=;
 b=PYtMvcejeca0q7Iu7FF/J4XdML7q1TUPy46PKPruJAPXx5IFFmtEpludMr+v1zUiOBB8
 KHmzEegJLFhygLlNWFAafKZHii/YGFht2HBmuhBooA984ct37f/Z87x2oXilDRH76yKR
 SZeqflucA1ZjZqNTKYpH84UgBqveKgJCSDR4V2RDBdrTR+vXO5hmuG9AEqKYB0hwWklL
 rDjuJ0Em74NZ8Y88yb+MwaAIBKzlDENf7sWx3NGfdR2C1cpdFeM/P5hm3nokRpeGoSoN
 JuXA3QXcMFawrNW0YPBYu7px7Ty5ws87Uv1FAiHSjtqXlgB2ZdMJYX5vF5OnzooqdP/e Sw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352d5un4pv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 11:54:59 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQGquV6014472;
 Thu, 26 Nov 2020 16:54:56 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 352drkg2y5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 16:54:56 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQGsr7q5112328
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 16:54:53 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D0684C046;
 Thu, 26 Nov 2020 16:54:53 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDF114C044;
 Thu, 26 Nov 2020 16:54:50 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.231.24])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 16:54:50 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 0/7] powerpc/perf: Fixes for power10 PMU
Date: Thu, 26 Nov 2020 11:54:37 -0500
Message-Id: <1606409684-1589-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_06:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 suspectscore=1 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260097
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patchset contains PMU fixes for power10.

This patchset contains 7 patches.
Patch1 includes fix to update event code with radix_scope_qual
bit in power10.
Patch2 and Patch3 updates the event group constraints for L2/L3
and threshold events in power10.
Patch4, patch5 and patch6 includes the event code changes for
l2/l3 events and some of the generic events.
Patch7 adds fixes for PMCCEXT bit in power10.

Changelog:
Changes from v1 -> v2
- Addressed Michael Ellerman's comments in the patchset.
  Split patch 2 to address l2l3 and threshold events
  group constraints fixes separately.
  Split Patch 3 also to address event code updates
  separately for generic and cache events.
  Fixed commit messages and also PMCCEXT bit setting
  during event enable.

Athira Rajeev (7):
  powerpc/perf: Fix to update radix_scope_qual in power10
  powerpc/perf: Update the PMU group constraints for l2l3 events in
    power10
  powerpc/perf: Fix the PMU group constraints for threshold events in
    power10
  powerpc/perf: Add generic and cache event list for power10 DD1
  powerpc/perf: Fix to update generic event codes for power10
  powerpc/perf: Fix to update cache events with l2l3 events in power10
  powerpc/perf: MMCR0 control for PMU registers under PMCC=00

 arch/powerpc/include/asm/reg.h          |   1 +
 arch/powerpc/kernel/cpu_setup_power.c   |   1 +
 arch/powerpc/kernel/dt_cpu_ftrs.c       |   1 +
 arch/powerpc/perf/core-book3s.c         |   4 +
 arch/powerpc/perf/isa207-common.c       |  35 ++++++-
 arch/powerpc/perf/isa207-common.h       |  16 ++-
 arch/powerpc/perf/power10-events-list.h |   9 ++
 arch/powerpc/perf/power10-pmu.c         | 178 ++++++++++++++++++++++++++++++--
 8 files changed, 231 insertions(+), 14 deletions(-)

-- 
1.8.3.1

