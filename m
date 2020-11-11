Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 095CC2AE79E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 05:50:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWC3Y2ZXpzDqW9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 15:50:49 +1100 (AEDT)
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
 header.s=pp1 header.b=rVwfcF4n; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWC1F35WvzDqWr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 15:48:48 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AB4X8Kd026347; Tue, 10 Nov 2020 23:33:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=j0AMZ0Jsq7tJQvgj7e6r8VXCd3sMQWzVF3I1TAClz90=;
 b=rVwfcF4nsebSvfc9yj/PFlF+P1eRwYKrbIVbLP5sMctpaStJHUTG4ycCXzdlaeTbHeGC
 pklm02sTxrQzkjtWjAIblB/vt1l1mKOgOeXX8YZ7osBDcMUWbwO3W1u5gBxcz0mLdSyS
 aHHmLS29nZNOmyaCJCZlyRJbE27gnGibbXj2xQUadCxVPM9dRq+C75ZTkF/DU2e6Qyxm
 5e9/Qxrojvpor3TZbysYIYBW5GHq0Ovpj83KXUJ8HLTgs3v9+hSinucSuMeRdHqXiU/B
 Bj6cE27upuYZoikSUuiIaBOBhQdF0f3U1wBd+6LHaTEqfyoFk3UMh0CBS555NKcQXRNG Pw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34r8a80y86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 23:33:16 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AB4WNMs009827;
 Wed, 11 Nov 2020 04:33:14 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 34nk78kugk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Nov 2020 04:33:14 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AB4XCWD39649536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Nov 2020 04:33:12 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22E004C058;
 Wed, 11 Nov 2020 04:33:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7D8F4C046;
 Wed, 11 Nov 2020 04:33:10 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.242.115])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Nov 2020 04:33:10 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 0/4] powerpc/perf: Fixes for power10 PMU
Date: Tue, 10 Nov 2020 23:33:05 -0500
Message-Id: <1605069189-2740-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-11_01:2020-11-10,
 2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=881 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 suspectscore=1 spamscore=0 mlxscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011110022
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
Cc: mikey@neuling.org, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patchset contains PMU fixes for power10.

This patchset contains 4 patches.
Patch1 includes fix to update event code with radix_scope_qual
bit in power10.
Patch2 updates the event group constraints for L2/L3 and threshold
events in power10.
Patch3 includes the event code changes for l2/l3 events and
some of the generic events.
Patch4 adds fixes for PMCCEXT bit in power10.

Athira Rajeev (4):
  powerpc/perf: Fix to update radix_scope_qual in power10
  powerpc/perf: Update the PMU group constraints for l2l3 and threshold
    events in power10
  powerpc/perf: Fix to update l2l3 events and generic event codes for
    power10
  powerpc/perf: MMCR0 control for PMU registers under PMCC=00

 arch/powerpc/include/asm/reg.h          |   1 +
 arch/powerpc/kernel/cpu_setup_power.S   |   2 +
 arch/powerpc/kernel/dt_cpu_ftrs.c       |   1 +
 arch/powerpc/perf/core-book3s.c         |  16 +++
 arch/powerpc/perf/isa207-common.c       |  27 ++++-
 arch/powerpc/perf/isa207-common.h       |  16 ++-
 arch/powerpc/perf/power10-events-list.h |   9 ++
 arch/powerpc/perf/power10-pmu.c         | 177 ++++++++++++++++++++++++++++++--
 8 files changed, 236 insertions(+), 13 deletions(-)

-- 
1.8.3.1

