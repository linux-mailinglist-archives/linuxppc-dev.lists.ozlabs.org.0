Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CCA294A09
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 11:00:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGPbM2zhTzDqMt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 20:00:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mk8t7fRQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGPS84qPCzDqfB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 19:54:16 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09L8WMBT031104; Wed, 21 Oct 2020 04:54:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VXmJMam6P72hYhh2jmuu93kd5+PxFP5iPZkhXUTvRmI=;
 b=mk8t7fRQTRXdUre5L147neGwUJDPMe7dWkH2pWGH+bfnGlw0dgrggk86mDEMipIfRcnt
 gjUJWim4aw0IfexxZcH9VEHv3mFwanIMr+g0tfuEI+cs2Uzysq9nztq8LOPY4SaxyMYh
 6RbNU76wqGWoahGwVQ0mHjvqZtfY1vlhigU2qxhi8zpJdJshKq2TPu6JzHgNSfvpLAA/
 78iI/ASrPsmVyjKk/hKUp/H6GbOJtiDqpCKA3ma40wqFd4TLo7J6AfE3h/z2vsRwuDF+
 DyKvRAzXgjMy7VWjRIbEahnzKxJE/47N5aZQx8mhzyoYNbnUg3focUtXRI3ZWwFKyenQ gQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34agxm9sgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 04:54:10 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09L8r7JU020672;
 Wed, 21 Oct 2020 08:54:08 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 348d5qu95h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 08:54:08 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09L8s6Dr29360564
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Oct 2020 08:54:06 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D52CA4053;
 Wed, 21 Oct 2020 08:54:06 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8780A4057;
 Wed, 21 Oct 2020 08:54:04 +0000 (GMT)
Received: from Madhavan.com (unknown [9.85.89.85])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 21 Oct 2020 08:54:04 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 4/5] powerpc/perf: Exclude kernel samples while counting
 events in user space.
Date: Wed, 21 Oct 2020 14:23:28 +0530
Message-Id: <20201021085329.384535-4-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201021085329.384535-1-maddy@linux.ibm.com>
References: <20201021085329.384535-1-maddy@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_03:2020-10-20,
 2020-10-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 bulkscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 phishscore=0
 clxscore=1015 mlxlogscore=681 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010210065
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
Cc: atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

By setting exclude_kernel for user space profiling, we set the
freeze bits in Monitor Mode Control Register. Due to hardware
limitation, sometimes, Sampled Instruction Address register (SIAR)
captures kernel address even when counter freeze bits are set in
Monitor Mode Control Register (MMCR2). Patch adds a check to drop
these samples at such conditions.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/perf/core-book3s.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 6be0349e01ad..e675c7c8ce0e 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2142,6 +2142,18 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
 	local64_set(&event->hw.period_left, left);
 	perf_event_update_userpage(event);
 
+	/*
+	 * Setting exclude_kernel will only freeze the
+	 * Performance Monitor counters and we may have
+	 * kernel address captured in SIAR. Hence drop
+	 * the kernel sample captured during user space
+	 * profiling. Setting `record` to zero will also
+	 * make sure event throlling is handled.
+	 */
+	if (event->attr.exclude_kernel && record)
+		if (is_kernel_addr(mfspr(SPRN_SIAR)))
+			record = 0;
+
 	/*
 	 * Finally record data if requested.
 	 */
-- 
2.26.2

