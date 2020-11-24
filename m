Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D25162C1B81
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 03:43:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cg7ct4b2rzDqTR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 13:43:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jKHc2cC0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cg7b84PVSzDqQf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 13:42:12 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AO2VpQE096069; Mon, 23 Nov 2020 21:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=sSonC1TmmuvD5DeA0D8Q9GVvau9SO6oUpLsCaG4BMkc=;
 b=jKHc2cC04eqwv99JwxBZ7MuBpVchHT7LtKcP3j7mllGd3ufHccjmHWtRbatQhA/PCvlu
 r4jO3j4qF8abxagSaOYKFP6CEmU0mc+198HIDkqiWwSPjGgzqi/+8iP6PCaCyJzECSwX
 r29EHYta56wggcTeNxiE95FU7SaOAXHhLHVYcnLQsU5F6D2weFrm/MPj/pG0wKecZM85
 VjzMCucUzJ2+mVzFBucpQWCkPocZ/I9tmaHzKPpgQ0toAUGie/ly0fJTxbYKmEPGbEbL
 /fUjiPm9mz95PuIWIRh1rW+hzA7SBuLE7YFLvfXPDrLiLbGuyJmXGHBJyWpxupyebg6T Vg== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 350rn8sd9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 21:42:03 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AO2d2xA029618;
 Tue, 24 Nov 2020 02:42:02 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 350cvrrmdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 02:42:02 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AO2ejVL2425374
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Nov 2020 02:40:45 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F218C4C04A;
 Tue, 24 Nov 2020 02:40:44 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C94D64C040;
 Tue, 24 Nov 2020 02:40:43 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.250.5])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 24 Nov 2020 02:40:43 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2] powerpc/perf: Fix crash with is_sier_available when pmu is
 not set
Date: Mon, 23 Nov 2020 21:40:40 -0500
Message-Id: <1606185640-1720-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-23_19:2020-11-23,
 2020-11-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=1
 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011240011
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
Cc: sachinp@linux.vnet.ibm.com, maddy@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On systems without any specific PMU driver support registered, running
'perf record' with —intr-regs  will crash ( perf record -I <workload> ).

The relevant portion from crash logs and Call Trace:

Unable to handle kernel paging request for data at address 0x00000068
Faulting instruction address: 0xc00000000013eb18
Oops: Kernel access of bad area, sig: 11 [#1]
CPU: 2 PID: 13435 Comm: kill Kdump: loaded Not tainted 4.18.0-193.el8.ppc64le #1
NIP:  c00000000013eb18 LR: c000000000139f2c CTR: c000000000393d80
REGS: c0000004a07ab4f0 TRAP: 0300   Not tainted  (4.18.0-193.el8.ppc64le)
NIP [c00000000013eb18] is_sier_available+0x18/0x30
LR [c000000000139f2c] perf_reg_value+0x6c/0xb0
Call Trace:
[c0000004a07ab770] [c0000004a07ab7c8] 0xc0000004a07ab7c8 (unreliable)
[c0000004a07ab7a0] [c0000000003aa77c] perf_output_sample+0x60c/0xac0
[c0000004a07ab840] [c0000000003ab3f0] perf_event_output_forward+0x70/0xb0
[c0000004a07ab8c0] [c00000000039e208] __perf_event_overflow+0x88/0x1a0
[c0000004a07ab910] [c00000000039e42c] perf_swevent_hrtimer+0x10c/0x1d0
[c0000004a07abc50] [c000000000228b9c] __hrtimer_run_queues+0x17c/0x480
[c0000004a07abcf0] [c00000000022aaf4] hrtimer_interrupt+0x144/0x520
[c0000004a07abdd0] [c00000000002a864] timer_interrupt+0x104/0x2f0
[c0000004a07abe30] [c0000000000091c4] decrementer_common+0x114/0x120

When perf record session is started with "-I" option, capturing registers
on each sample calls is_sier_available() to check for the
SIER (Sample Instruction Event Register) availability in the platform.
This function in core-book3s accesses 'ppmu->flags'. If a platform specific
PMU driver is not registered, ppmu is set to NULL and accessing its
members results in a crash. Fix the crash by returning false in
is_sier_available() if ppmu is not set.

Fixes: 333804dc3b7a ("powerpc/perf: Update perf_regs structure to include SIER")
Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changes in v2:
- Corrected the commit message as suggested by
  Michael Ellerman.

 arch/powerpc/perf/core-book3s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 08643cb..1de4770 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -137,6 +137,9 @@ static void pmao_restore_workaround(bool ebb) { }
 
 bool is_sier_available(void)
 {
+	if (!ppmu)
+		return false;
+
 	if (ppmu->flags & PPMU_HAS_SIER)
 		return true;
 
-- 
1.8.3.1

