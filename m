Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 001F63D0887
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 07:49:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GV4R26dycz3blf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 15:49:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FLB1haHp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FLB1haHp; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GV4Q51pkQz2yWs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 15:48:44 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16L5WqaL140633; Wed, 21 Jul 2021 01:48:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=mrjXumGzknUv4OtNyhXg/hVmhvm6R42N7+SAC/4d/0Q=;
 b=FLB1haHp+pqSsTqAZ/EzQsylPLJgHSxvW33xmmTUXKSI7u8jv76bvO0nqIDt+Zbu/eRE
 J2xuOElhLia2iq4DP29culD2ewSWTDzJKnfUGN6q4ANtI+t/R+PeD3ctXP5EpdDY+fjQ
 07BesNOLJocOQniOPZ3MJjCU9II+dNigFLSmTslgIF7ZsioKnldfIz3UjnrPzx1kxpA+
 NE4gBMkcYr21inrSDdUUWckjRZEM2ac1QlsCpvIma55NZpxIMvDDzlw8GrE0vy2uUZen
 4tKDHabVUP2gmDMkyRRoD6w8CIT+EEfl4X9sAqPzJNAxcfPTRijmfH/+zhN02HhWEAOZ bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39xb4tu7t4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 01:48:37 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16L5X22m141011;
 Wed, 21 Jul 2021 01:48:36 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39xb4tu7su-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 01:48:36 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16L5mZV9008865;
 Wed, 21 Jul 2021 05:48:35 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 39upu89p5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 05:48:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16L5k8rw16515568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 05:46:08 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C3F04C059;
 Wed, 21 Jul 2021 05:48:31 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3852C4C046;
 Wed, 21 Jul 2021 05:48:30 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.181.237])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 21 Jul 2021 05:48:29 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V4 0/1] powerpc/perf: Clear pending PMI in ppmu callbacks
Date: Wed, 21 Jul 2021 01:48:28 -0400
Message-Id: <1626846509-1350-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eWDrpo8uSY7bBfzcz1koglqN1LIkZw99
X-Proofpoint-ORIG-GUID: LT5-dJQxJiIHRkxRdF08vhbwDyDGNUmr
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-21_02:2021-07-21,
 2021-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 mlxscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107210027
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Running perf fuzzer testsuite popped up below messages
in the dmesg logs:

"Can't find PMC that caused IRQ"

This means a PMU exception happened, but none of the PMC's (Performance
Monitor Counter) were found to be overflown. Perf interrupt handler checks
the PMC's to see which PMC has overflown and if none of the PMCs are
overflown ( counter value not >= 0x80000000 ), it throws warning:
"Can't find PMC that caused IRQ".

Powerpc has capability to mask and replay a performance monitoring
interrupt (PMI). In case of replayed PMI, there are some corner cases
that clears the PMCs after masking. In such cases, the perf interrupt
handler will not find the active PMC values that had caused the overflow
and thus leading to this message. This patchset attempts to fix those
corner cases.

However there is one more case in PowerNV where these messages are
emitted during system wide profiling or when a specific CPU is monitored
for an event. That is, when a counter overflow just before entering idle
and a PMI gets triggered after wakeup from idle. Since PMCs
are not saved in the idle path, perf interrupt handler will not
find overflown counter value and emits the "Can't find PMC" messages.
This patch documents this race condition in powerpc core-book3s.

Patch fixes the ppmu callbacks to disable pending interrupt before clearing
the overflown PMC and documents the race condition in idle path.

Changelog:
changes from v3 -> v4
   Addressed review comments from Nicholas Piggin
   - Added comment explaining the need to clear MMCR0 PMXE bit in
     pmu disable callback.
   - Added a check to display warning if there is a PMI pending
     bit set in Paca without any overflown PMC.
   - Removed the condition check before clearing pending PMI
     in 'clear_pmi_irq_pending' function.
   - Added reviewed by from Nicholas Piggin.

Changes from v2 -> v3
   Addressed review comments from Nicholas Piggin
   - Moved the clearing of PMI bit to power_pmu_disable.
     In previous versions, this was done in power_pmu_del,
     power_pmu_stop/enable callbacks before clearing of PMC's.
   - power_pmu_disable is called before any event gets deleted
     or stopped. If more than one event is running in the PMU,
     we may clear the PMI bit for an event which is not going
     to be deleted/stopped. Hence introduced check in
     power_pmu_enable to set back PMI to avoid dropping of valid
     samples in such cases.
   - Disable MMCR0 PMXE bit in pmu disable callback which otherwise
     could trigger PMI when PMU is getting disabled.
Changes from v1 -> v2
   Addressed review comments from Nicholas Piggin
   - Moved the PMI pending check and clearing function
     to arch/powerpc/include/asm/hw_irq.h and renamed
     function to "get_clear_pmi_irq_pending"
   - Along with checking for pending PMI bit in Paca,
     look for PMAO bit in MMCR0 register to decide on
     pending PMI interrupt.

Athira Rajeev (1):
  powerpc/perf: Fix PMU callbacks to clear pending PMI before resetting
    an overflown PMC

 arch/powerpc/include/asm/hw_irq.h | 38 +++++++++++++++++++++++++
 arch/powerpc/perf/core-book3s.c   | 59 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 96 insertions(+), 1 deletion(-)

-- 
1.8.3.1

