Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C46403C69B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 07:26:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GP8Hq5Hkpz3btV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 15:26:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Os/S/TNb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=parth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Os/S/TNb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GP8GG505Rz2yNZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jul 2021 15:24:54 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16D541xZ106750; Tue, 13 Jul 2021 01:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ZTnMM3mGGqOnUOgF6S7CuQEQrJWP/0bovcoDH+AF2hA=;
 b=Os/S/TNb4dd+OmrJPo8+DfkUfR4a8kEOsH1KCTyXdd0vixaSgxlxPHk4NmpU3rGEjCr3
 xTVOnQ1MeHrAWLDqBKQRJmhY8VyFrIrO8dxnYeAL8+D5UY+pU5SquPGCPPyx8W8N+YHG
 Fc/gwAMLUKZUnaUAr6DNo5FXFftLQRqsIQ9Slj24WxIIMj9xZ7BCmM/qo5xEobCAiwAP
 NS42Ot66ktI06KsdIO9gIZPQGou6c+aLbtxUmlBet9F5agLMn1320Gn7gf3casoWxTS8
 yPFHmYYEKJPxiAy/6adlYWgTw6zODW1JqGcSE2paY6zT6xtdSOzLmoSllEtJ9MI/LkLy JA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39qs117kmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 01:24:49 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16D56jr1115687;
 Tue, 13 Jul 2021 01:24:48 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39qs117kmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 01:24:48 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16D5MF4P018930;
 Tue, 13 Jul 2021 05:24:47 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 39q3689310-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 05:24:46 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16D5Meea24576268
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 05:22:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 786564C062;
 Tue, 13 Jul 2021 05:24:44 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75CE24C044;
 Tue, 13 Jul 2021 05:24:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.102.18.200])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 13 Jul 2021 05:24:42 +0000 (GMT)
From: Parth Shah <parth@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC 2/2] kernel/idle: Update and use idle-hint in VPA region
Date: Tue, 13 Jul 2021 10:54:33 +0530
Message-Id: <20210713052433.257003-3-parth@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210713052433.257003-1-parth@linux.ibm.com>
References: <20210713052433.257003-1-parth@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SpXDZIwvsAK7htr7VUnwltiMIUt7MQjn
X-Proofpoint-ORIG-GUID: ohrjz4hFXC57tCInTgacUWua0ccoh7D4
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_03:2021-07-13,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107130022
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, srikar@linux.vnet.ibm.com,
 parths1229@gmail.com, svaidy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In guest, Set idle_hint to 1 when the prev_cpu of a vCPU goes into idle state,
similarly set idle_hint to 0 when exiting an idle state.

Since the idle_hint is in VPA region, the available_idle_cpu() in guest can
read this region every time to find if a vCPU can be scheduled instantly by
the hypervsior or not.

Signed-off-by: Parth Shah <parth@linux.ibm.com>
---
 arch/powerpc/include/asm/paravirt.h | 12 ++++++++++--
 kernel/sched/idle.c                 |  3 +++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index bcb7b5f917be..b20e4d25bd00 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -21,6 +21,12 @@ static inline bool is_shared_processor(void)
 	return static_branch_unlikely(&shared_processor);
 }
 
+static inline int idle_hint_of(int cpu)
+{
+	__be32 idle_hint = READ_ONCE(lppaca_of(cpu).idle_hint);
+	return be32_to_cpu(idle_hint);
+}
+
 /* If bit 0 is set, the cpu has been preempted */
 static inline u32 yield_count_of(int cpu)
 {
@@ -109,8 +115,10 @@ static inline bool vcpu_is_preempted(int cpu)
 	}
 #endif
 
-	if (yield_count_of(cpu) & 1)
-		return true;
+	if (yield_count_of(cpu) & 1) {
+		if (idle_hint_of(cpu) == 0)
+			return true;
+	}
 	return false;
 }
 
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index 7ca3d3d86c2a..fdc8d1d474f0 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -7,6 +7,7 @@
  *        tasks which are handled in sched/fair.c )
  */
 #include "sched.h"
+#include <asm/idle_hint.h>
 
 #include <trace/events/power.h>
 
@@ -290,6 +291,7 @@ static void do_idle(void)
 			arch_cpu_idle_dead();
 		}
 
+		set_idle_hint(cpu, 1);
 		arch_cpu_idle_enter();
 		rcu_nocb_flush_deferred_wakeup();
 
@@ -306,6 +308,7 @@ static void do_idle(void)
 			cpuidle_idle_call();
 		}
 		arch_cpu_idle_exit();
+		set_idle_hint(cpu, 0);
 	}
 
 	/*
-- 
2.26.3

