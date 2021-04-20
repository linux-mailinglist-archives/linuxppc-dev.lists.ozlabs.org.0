Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E68813650A1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 05:02:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPT4Z6LlTz2xdM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 13:02:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=POleaN6b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=POleaN6b; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPT443pDyz2xYn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 13:01:56 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13K2XTNE183136; Mon, 19 Apr 2021 23:01:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=dxJjgwtWWlQPVjhM0DD3E+XTLoqpxnVWdaIDHJpUPtk=;
 b=POleaN6b1tvro9HCHiSo0Frl0F1ecfQRsOtdqqSvK3it0dLhtLJ4LTW8Tl6Yi5RTOvsT
 4SOnl2+dJXSdOq2ThZuAmvQ/ztcm3Ywa4l3b5lwlWsKyE9vfYMiq6Ctc4AhIggjPX7Vm
 qkwaRLuTr+0OZjdz0ns9frfqizP0oEVcaEa0MOeQnFq75E4BHOdY61/FTk/X8UKbDarm
 Ciwqz2PAKmU9m+HinnVZcO01uEhn1Z8p1xfIASVSgbAEm3SE5T3frWadQyrTpKeVMcsH
 kwhdyTENlw9nQI6ZClKmh+CdtnX4H/Rhi4/OBBtadR0vdZ1XxS2HhKLlLbg8Y13V3rql FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 380d89cp2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 23:01:46 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13K2x3pW065144;
 Mon, 19 Apr 2021 23:01:46 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 380d89cp1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 23:01:45 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13K2st6n026759;
 Tue, 20 Apr 2021 03:01:44 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 37yqa8hd8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 03:01:44 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13K31Hh325035040
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 03:01:17 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E6BD4C04A;
 Tue, 20 Apr 2021 03:01:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8ACC4C050;
 Tue, 20 Apr 2021 03:01:38 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.124.209.100])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Apr 2021 03:01:38 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 0/1] powerpc/perf: Clear pending PMI in ppmu callbacks 
Date: Mon, 19 Apr 2021 23:01:36 -0400
Message-Id: <1618887697-1556-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: X42HfwliXpDDmskcCqWHDjI9JdwYScKu
X-Proofpoint-GUID: oh6auFeZQBWQnzPSvFxKuptdnObxNSR2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-19_16:2021-04-19,
 2021-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104200015
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
Cc: nasastry@in.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com
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

 arch/powerpc/include/asm/hw_irq.h | 19 ++++++++
 arch/powerpc/perf/core-book3s.c   | 77 +++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

-- 
2.26.2

