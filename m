Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADEE2C3A1E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 08:30:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cgsxl33zjzDqNK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 18:30:51 +1100 (AEDT)
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
 header.s=pp1 header.b=bxydjt/7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgssX4t71zDqsL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 18:27:12 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AP7DGL6063387; Wed, 25 Nov 2020 02:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=T8tdP+rf8w+WkqjzWHsK3Gkj6ZJEMKnkTubMGVp3chk=;
 b=bxydjt/7O6ttaX38kMONX7KS9QLXLn+0rRt5dkALr//Y301GtEOQi/ZY3xRwrFYDlIe6
 ubAQ6taFpx+uVgLg4sE407fSpDbCvRufo4lPmKAiWFGt2NghxPTD6EAO+BdClKbQyiA9
 N15YRaz50BkoToTRsToX4e/zNYx1WR4syN92uYZdEKoob6uLd96PVCmBc4xzJbA5jTBn
 1cQMrcfVrg/YIkY8aH4L6vmz4u5Tq1Fp9dvJ+rmD2snB6IZnU21p62Ht21t3eKbS3Z/X
 Xcq9PZz1ruj0KPQXLwyR6LpEqVAptyyN8ahPwBWYyv1Y0YvMh6YN6+PmJxNkQCkfAqiX xw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 350y8kp88p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 02:27:05 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AP7HJEo016130;
 Wed, 25 Nov 2020 07:27:03 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3518j8ge70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 07:27:03 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AP7R0EU41419064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 07:27:00 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA4144C040;
 Wed, 25 Nov 2020 07:27:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAC884C04A;
 Wed, 25 Nov 2020 07:26:58 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.247.52])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 07:26:58 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2] powerpc/perf: Exclude kernel samples while counting events
 in user space.
Date: Wed, 25 Nov 2020 02:26:55 -0500
Message-Id: <1606289215-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_03:2020-11-25,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011250038
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

Perf event attritube supports exclude_kernel flag
to avoid sampling/profiling in supervisor state (kernel).
Based on this event attr flag, Monitor Mode Control Register
bit is set to freeze on supervisor state. But sometime (due
to hardware limitation), Sampled Instruction Address
Register (SIAR) locks on to kernel address even when
freeze on supervisor is set. Patch here adds a check to
drop those samples.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changes in v2:
- Initial patch was sent along with series:
  https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=209195
  Moving this patch as separate since this change is applicable
  for all PMU platforms.

 arch/powerpc/perf/core-book3s.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 08643cb..40aa117 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2122,6 +2122,17 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
 	perf_event_update_userpage(event);
 
 	/*
+	 * Due to hardware limitation, sometimes SIAR could
+	 * lock on to kernel address even with freeze on
+	 * supervisor state (kernel) is set in MMCR2.
+	 * Check attr.exclude_kernel and address
+	 * to drop the sample in these cases.
+	 */
+	if (event->attr.exclude_kernel && record)
+		if (is_kernel_addr(mfspr(SPRN_SIAR)))
+			record = 0;
+
+	/*
 	 * Finally record data if requested.
 	 */
 	if (record) {
-- 
1.8.3.1

