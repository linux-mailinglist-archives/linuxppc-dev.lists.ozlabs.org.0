Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE72543B731
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 18:29:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hdy2P4Lnkz3c7D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 03:29:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HLct2dbK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HLct2dbK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdy0q0F7Jz2xXc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 03:27:54 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QFh5gZ016444; 
 Tue, 26 Oct 2021 16:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=SYH5WxAvH1Y2Pd9TuoSzFwdl/tPpenjf9p1diJ5iutQ=;
 b=HLct2dbKP9TsAHu8g27mNusEwhm6ox8m+iXxM+/StIyxMLueSRWfiyYSwLZxT4M0qaf2
 7dZay4G7XqWMMNEYsymfHiT+hzQqMHHHiJ6Ep/vjpyJ/QB4LY9RCeD7yHz6fLrXl3Z0K
 RWpiivGfR8n2PWiKxbq0s1sB2KFmATEMBnSkISer5Pa1d9aiSIgYhRwtsbbAKetwzUeg
 G1xNd2U+I7AhRISYLJYpaxO8OWIuLvIndWz8bTwOHX+Fa7sKhdenHmbgpe0ju9azG3ff
 9+yjUUZEvemgXxmDYVO0/9BxRjUKh3B+Nk+yEMVSVoleOK9YkGzkcEI8Evl8jyP+pJ2Y hA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bx4k2xu9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 16:27:48 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19QFwEan031056;
 Tue, 26 Oct 2021 16:27:47 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bx4k2xu8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 16:27:47 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19QGINX3011068;
 Tue, 26 Oct 2021 16:27:45 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3bx4esye7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 16:27:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19QGRg1W36307452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Oct 2021 16:27:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D36E9A4054;
 Tue, 26 Oct 2021 16:27:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80FB5A405C;
 Tue, 26 Oct 2021 16:27:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.63.253])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Oct 2021 16:27:42 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org
Subject: [PATCH 2/2] powerpc/watchdog: ensure watchdog data accesses are
 protected
Date: Tue, 26 Oct 2021 18:27:40 +0200
Message-Id: <20211026162740.16283-3-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211026162740.16283-1-ldufour@linux.ibm.com>
References: <20211026162740.16283-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WBIB5yYChCURyv5OkRgzdCYwaw2fAUpB
X-Proofpoint-ORIG-GUID: OoGTz4rVZgBiM1b6hRuP6s9xieQEyj8o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_05,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110260088
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The wd_smp_cpus_pending CPU mask should be accessed under the protection of
the __wd_smp_lock.

This prevents false alarm to be raised when the system is under an heavy
stress. This has been seen while doing LPM on large system with a big
workload.

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/kernel/watchdog.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index bc7411327066..8d7a1a86187e 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -203,12 +203,13 @@ static void watchdog_smp_panic(int cpu, u64 tb)
 
 static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 {
+	unsigned long flags;
+
+	wd_smp_lock(&flags);
 	if (!cpumask_test_cpu(cpu, &wd_smp_cpus_pending)) {
 		if (unlikely(cpumask_test_cpu(cpu, &wd_smp_cpus_stuck))) {
 			struct pt_regs *regs = get_irq_regs();
-			unsigned long flags;
 
-			wd_smp_lock(&flags);
 			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
 			wd_smp_unlock(&flags);
 
@@ -219,22 +220,23 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 				show_regs(regs);
 			else
 				dump_stack();
+			return;
 		}
+
+		wd_smp_unlock(&flags);
 		return;
 	}
+
 	cpumask_clear_cpu(cpu, &wd_smp_cpus_pending);
 	if (cpumask_empty(&wd_smp_cpus_pending)) {
-		unsigned long flags;
-
-		wd_smp_lock(&flags);
 		if (cpumask_empty(&wd_smp_cpus_pending)) {
 			wd_smp_last_reset_tb = tb;
 			cpumask_andnot(&wd_smp_cpus_pending,
 					&wd_cpus_enabled,
 					&wd_smp_cpus_stuck);
 		}
-		wd_smp_unlock(&flags);
 	}
+	wd_smp_unlock(&flags);
 }
 
 static void watchdog_timer_interrupt(int cpu)
-- 
2.33.1

