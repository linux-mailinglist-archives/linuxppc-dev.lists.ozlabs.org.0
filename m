Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E523ABAF3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 19:55:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5V8j1x8kz3c7m
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 03:55:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sTM/HP3Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sTM/HP3Y; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5V8G4R0Bz2yxy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 03:55:26 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HHY9ri056603; Thu, 17 Jun 2021 13:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=Tpn4wARX4kpNBBQwyfrvd1GtCwqCISKNjZZaogFl00k=;
 b=sTM/HP3YuaHg+LRCZayWK8UDxlxuDr7IZUdKyXN6D0pt/r6jw7rUhsSqa6snJ7f47Swa
 MVZknpxGI/z64a2AHgPTpEb+wOAt9q+a6a/Mi/o5nhvleC6Wp0On8xqUkZ3EVzgJQj6x
 XUzqjt8QpMMtxnVeGbpJymcADEhEcPO/yzVby7gx3UsxYJWkIsU6uXATXR2vBr7Zy5k2
 1Q+3DXUVUZE+pGsxJr+ljU1ReKdrDJAlASAQ4SKF3GotYMQblv9tCeD6YpAA0XCKfOlo
 DkFXwXt9+b+UUuhBQD74Unw34lrrAc97Qpv9FNVbc2wW2+LmxiOH/rVGVOc45+9CV+JO 1Q== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398am812cc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 13:55:13 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HHqkYF001907;
 Thu, 17 Jun 2021 17:55:11 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 395c3t9btd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 17:55:11 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HHt8kC27329018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 17:55:08 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C09574C044;
 Thu, 17 Jun 2021 17:55:08 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A26064C040;
 Thu, 17 Jun 2021 17:55:07 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.195.40.41])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 17:55:07 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Fix crash with 'perf_instruction_pointer' when
 pmu is not set
Date: Thu, 17 Jun 2021 13:55:06 -0400
Message-Id: <1623952506-1431-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AhkeaYdBwRfTak5zXkXc9VYP6BfuXl9n
X-Proofpoint-GUID: AhkeaYdBwRfTak5zXkXc9VYP6BfuXl9n
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_15:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170110
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

On systems without any specific PMU driver support registered, running
perf record causes Oops.

The relevant portion from call trace:

BUG: Kernel NULL pointer dereference on read at 0x00000040
Faulting instruction address: 0xc0021f0c
Oops: Kernel access of bad area, sig: 11 [#1]
BE PAGE_SIZE=4K PREEMPT CMPCPRO
SAF3000 DIE NOTIFICATION
CPU: 0 PID: 442 Comm: null_syscall Not tainted 5.13.0-rc6-s3k-dev-01645-g7649ee3d2957 #5164
NIP:  c0021f0c LR: c00e8ad8 CTR: c00d8a5c
NIP [c0021f0c] perf_instruction_pointer+0x10/0x60
LR [c00e8ad8] perf_prepare_sample+0x344/0x674
Call Trace:
[e6775880] [c00e8810] perf_prepare_sample+0x7c/0x674 (unreliable)
[e67758c0] [c00e8e44] perf_event_output_forward+0x3c/0x94
[e6775910] [c00dea8c] __perf_event_overflow+0x74/0x14c
[e6775930] [c00dec5c] perf_swevent_hrtimer+0xf8/0x170
[e6775a40] [c008c8d0] __hrtimer_run_queues.constprop.0+0x160/0x318
[e6775a90] [c008d94c] hrtimer_interrupt+0x148/0x3b0
[e6775ae0] [c000c0c0] timer_interrupt+0xc4/0x22c
[e6775b10] [c00046f0] Decrementer_virt+0xb8/0xbc

During perf record session, perf_instruction_pointer() is called to
capture the sample ip. This function in core-book3s accesses ppmu->flags.
If a platform specific PMU driver is not registered, ppmu is set to NULL
and accessing its members results in a crash. Fix this crash by checking
if ppmu is set.

Fixes: 2ca13a4cc56c ("powerpc/perf: Use regs->nip when SIAR is zero")
[ Including stable for kernel versions 5.11 and 5.12 ]
Cc: stable@vger.kernel.org
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/perf/core-book3s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 16d4d1b..5162241 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2254,7 +2254,7 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
 	bool use_siar = regs_use_siar(regs);
 	unsigned long siar = mfspr(SPRN_SIAR);
 
-	if (ppmu->flags & PPMU_P10_DD1) {
+	if (ppmu && (ppmu->flags & PPMU_P10_DD1)) {
 		if (siar)
 			return siar;
 		else
-- 
1.8.3.1

