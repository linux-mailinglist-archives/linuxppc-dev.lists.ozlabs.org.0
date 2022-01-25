Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC8349AD63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 08:21:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjdZp62hkz3bXn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 18:21:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rgGrd1A+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rgGrd1A+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjdZ21jB1z30Ds
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 18:21:13 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20P4kQqF031034; 
 Tue, 25 Jan 2022 07:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=dyT61F/+H7CcwaycbWvxPVLwL6aVpoLq1rauxes63zs=;
 b=rgGrd1A+UD8slBcMvDc/3dl3yYSXOc4LF7saLwl79d7a/DQPNQix65N4z2ywxydQMATQ
 1K7u7JjcaDme47ImFOnKLRlqatNMU1EH0O4N28X8H/wguA+fIANPpIG8I32N4MMiE5x1
 HQtC9HHeDTNBd+aU+NX/P+7PpY756mm0i3lokPJ7nQ9/OLcFlQ9nErnLtXf30eS9eAhL
 2adUhrJUcI5yAPIu+vPoSLYPZdOyDnk1SYSCiqX7XxY00MsqRsqVz9VEsaFVGvhFKif7
 Hj1L1Z+DVKIaXrMtok9x7Yk6OMpuSL91IYO7eLcStv/ZqzWV3SAIlRyR8YsPJlRCY+oX gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dtafr30ff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 07:21:06 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20P6Fp0f032124;
 Tue, 25 Jan 2022 07:21:05 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dtafr30f5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 07:21:05 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20P7D94x008053;
 Tue, 25 Jan 2022 07:21:04 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 3dr9ja33xr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 07:21:04 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20P7L4Tj17105166
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 07:21:04 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12FD712405E;
 Tue, 25 Jan 2022 07:21:04 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B44BD124052;
 Tue, 25 Jan 2022 07:21:03 +0000 (GMT)
Received: from localhost (unknown [9.211.142.9])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jan 2022 07:21:03 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/smp: poll cpu_callin_map more aggressively in
 __cpu_up()
Date: Tue, 25 Jan 2022 01:21:03 -0600
Message-Id: <20220125072103.70715-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dp0YO1CDidMdt_gGX0vysidABI96_2PC
X-Proofpoint-ORIG-GUID: _wTH7Yl5XuQ-UE0KFyJBm5Q7lWc7Hio3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_02,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 mlxlogscore=952
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201250047
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
Cc: brking@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace the outdated iteration and timeout calculations here with
indefinite spin_until_cond()-wrapped poll of cpu_callin_map. __cpu_up()
already does this when waiting for the cpu to set its online bit before
returning, so this change is not really making the function more brittle.

Removing the msleep(1) in the hotplug path here reduces the time it takes
to online a CPU on a P9 PowerVM LPAR from about 30ms to 1ms when exercised
via thaw_secondary_cpus().

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/smp.c | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index b7fd6a72aa76..990893365fe0 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1270,7 +1270,7 @@ static void cpu_idle_thread_init(unsigned int cpu, struct task_struct *idle)
 
 int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 {
-	int rc, c;
+	int rc;
 
 	/*
 	 * Don't allow secondary threads to come online if inhibited
@@ -1314,28 +1314,7 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 		return rc;
 	}
 
-	/*
-	 * wait to see if the cpu made a callin (is actually up).
-	 * use this value that I found through experimentation.
-	 * -- Cort
-	 */
-	if (system_state < SYSTEM_RUNNING)
-		for (c = 50000; c && !cpu_callin_map[cpu]; c--)
-			udelay(100);
-#ifdef CONFIG_HOTPLUG_CPU
-	else
-		/*
-		 * CPUs can take much longer to come up in the
-		 * hotplug case.  Wait five seconds.
-		 */
-		for (c = 5000; c && !cpu_callin_map[cpu]; c--)
-			msleep(1);
-#endif
-
-	if (!cpu_callin_map[cpu]) {
-		printk(KERN_ERR "Processor %u is stuck.\n", cpu);
-		return -ENOENT;
-	}
+	spin_until_cond(cpu_callin_map[cpu] != 0);
 
 	DBG("Processor %u found.\n", cpu);
 
-- 
2.34.1

