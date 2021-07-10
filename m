Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5CD3C3565
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jul 2021 17:59:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GMZTs6BCDz3bwX
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jul 2021 01:59:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GEK5pPIX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GEK5pPIX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GMZSq3MD7z303y
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jul 2021 01:58:34 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16ACrb44133144; Sat, 10 Jul 2021 11:58:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=8C5N8rrUsW4Lcqn2+fUh87s+dUJLPgFydJ7SYrrz3w0=;
 b=GEK5pPIX+jO/H8qGuuKiKa1RCZGHgnljmlrWrV/Sflv08JKZP3zIOCjrFM3thKyjJX9r
 B/hqWqM5VwORPKt6A3wievIzgH9y/WfL9X1rr5QVO5ZgDmcWFMAX9ycc/DPvbMxGUhrr
 Wb2zOxDo2S4kw94AwveF3uprRQqCd5ur/gF1u86Cn5aXBwYEHCgtJIccxJXthSfXA/9I
 zJTpoAti3CkNo//zFDX86veupk0VWMxoViW/EMo4e5KT36XNPyrEswRLn7rg9GdCDxb7
 3Px7tGKgXrFgPve63++Iz5KUUE0OeM1ue/SHVTfs/kLLWC32OjB+nMLn2Lehb4UAS4WV oA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39q7qvq514-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Jul 2021 11:58:22 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16AFVqFv063321;
 Sat, 10 Jul 2021 11:58:21 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39q7qvq50p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Jul 2021 11:58:21 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16AFj5Wg015066;
 Sat, 10 Jul 2021 15:58:20 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 39q2th855r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Jul 2021 15:58:19 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16AFwGbp29032812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 10 Jul 2021 15:58:16 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C2504C044;
 Sat, 10 Jul 2021 15:58:16 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 331854C040;
 Sat, 10 Jul 2021 15:58:15 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.195.35.113])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 10 Jul 2021 15:58:14 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 0/1] powerpc/perf: Clear pending PMI in ppmu callbacks
Date: Sat, 10 Jul 2021 11:58:13 -0400
Message-Id: <1625932694-1525-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4b0D6Z3jF7pt9TagfVBbtksgK-8UxC3s
X-Proofpoint-GUID: 4pMgsKptRFK_fNhzSp86OoQrbWH0mxsH
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-10_02:2021-07-09,
 2021-07-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107100024
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
Changed from v2 -> v3
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

 arch/powerpc/include/asm/hw_irq.h | 31 +++++++++++++++++++++++++
 arch/powerpc/perf/core-book3s.c   | 49 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 79 insertions(+), 1 deletion(-)

-- 
1.8.3.1

