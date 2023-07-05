Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF2F7486EB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 16:52:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fUP2f6sD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qx2hT53Y1z3bsQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:52:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fUP2f6sD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx2gX54Tlz30F5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 00:52:07 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365ElGWS003026;
	Wed, 5 Jul 2023 14:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WfdHG/IFibjPqDV5js/ljbtxgQ4mhrxtxUvpA1+ay/Y=;
 b=fUP2f6sD37eNq1w+y3JOd1a3RjqxE4EKI0Eav2kVx5OKFRqYY18wnMFWBBNL0Jaaq+rW
 3MyHw6EynkrbYUixtyYZtRsJgYRqQMvLKmjnjyOiMIIbmp9Gx9tUUPAFy7AmphpMwlIB
 2jit9HoaCpDbPTA0wWDBv5XIDdRvqvbt3Tn4z9eZ6L2Z9tmcaUyFGKKBdb0pqNuQCsR9
 6E5Npuai7ojWhrUycGZCh7J+GMqXhaXhibwh3v7h4XL1gzNcM1thZ0AbLd/zqlhoPnhF
 IzBZU4ui6ueVnxK6PxP8kZvBHPTgxBDoI7wRiRol/pno89hOM0+Vs8XhlzWMziBIZwM4 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rnak5g37s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jul 2023 14:51:52 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 365ElwrU005006;
	Wed, 5 Jul 2023 14:51:52 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rnak5g36d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jul 2023 14:51:51 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3650sFUn032566;
	Wed, 5 Jul 2023 14:51:49 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3rjbs4tn97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jul 2023 14:51:49 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 365Eplgc19268256
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jul 2023 14:51:47 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3CC3B20040;
	Wed,  5 Jul 2023 14:51:47 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F6092004D;
	Wed,  5 Jul 2023 14:51:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.171.79.178])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jul 2023 14:51:46 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 01/10] cpu/hotplug: remove dependancy against cpu_primary_thread_mask
Date: Wed,  5 Jul 2023 16:51:34 +0200
Message-ID: <20230705145143.40545-2-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705145143.40545-1-ldufour@linux.ibm.com>
References: <20230705145143.40545-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: h5_Kjgx80_GIwbjYFqO2hSx4w1lecSek
X-Proofpoint-ORIG-GUID: ho0Gpv-QUkWpRbe_O5ZDGgt5gyT2EbpG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_06,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307050131
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
Cc: linux-arch@vger.kernel.org, dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, mingo@redhat.com, bp@alien8.de, npiggin@gmail.com, tglx@linutronix.de, rui.zhang@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The commit 18415f33e2ac ("cpu/hotplug: Allow "parallel" bringup up to
CPUHP_BP_KICK_AP_STATE") introduce a dependancy against a global variable
cpu_primary_thread_mask exported by the X86 code. This variable is only
used when CONFIG_HOTPLUG_PARALLEL is set.

Since cpuhp_get_primary_thread_mask() and cpuhp_smt_aware() are only used
when CONFIG_HOTPLUG_PARALLEL is set, don't define them when it is not set.

There is no functional change introduce by that patch.

Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 kernel/cpu.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 88a7ede322bd..03309f2f35a4 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -650,22 +650,8 @@ bool cpu_smt_possible(void)
 }
 EXPORT_SYMBOL_GPL(cpu_smt_possible);
 
-static inline bool cpuhp_smt_aware(void)
-{
-	return topology_smt_supported();
-}
-
-static inline const struct cpumask *cpuhp_get_primary_thread_mask(void)
-{
-	return cpu_primary_thread_mask;
-}
 #else
 static inline bool cpu_smt_allowed(unsigned int cpu) { return true; }
-static inline bool cpuhp_smt_aware(void) { return false; }
-static inline const struct cpumask *cpuhp_get_primary_thread_mask(void)
-{
-	return cpu_present_mask;
-}
 #endif
 
 static inline enum cpuhp_state
@@ -1793,6 +1779,16 @@ static int __init parallel_bringup_parse_param(char *arg)
 }
 early_param("cpuhp.parallel", parallel_bringup_parse_param);
 
+static inline bool cpuhp_smt_aware(void)
+{
+	return topology_smt_supported();
+}
+
+static inline const struct cpumask *cpuhp_get_primary_thread_mask(void)
+{
+	return cpu_primary_thread_mask;
+}
+
 /*
  * On architectures which have enabled parallel bringup this invokes all BP
  * prepare states for each of the to be onlined APs first. The last state
-- 
2.41.0

