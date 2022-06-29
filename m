Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C40560B4F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 22:59:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYDNp4NNTz3dqL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 06:59:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tNYkjQLT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tNYkjQLT;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYDN34ZlNz3blZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 06:58:58 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25TKVXlg013651
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 20:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=x9J2VHv6MjL0w4kRkiMNu0VrF3aG6yCWv4M4Cy/Fcl4=;
 b=tNYkjQLTGp/3psTg+82KENpf/DSF9chsTS3yNph3zEhXA1SORDR7/imNjjB3vFoQcUry
 +C7970LxD3HzQz7m455OMbGTW0bt6ixOy5AUWkGI2Yv9bQNo4NVHyu3s95TUJcDvS0KN
 xVy9ndhJ2lpmanI37pQl3kIjNaydUiGPM8pAaZS8lh0q6+JU2K0Ymv51R50pgtqQFxc9
 /mKbY5WdN93KTJ2IYQHoQdXlQR4Wik7bKHuiSkgRNKS6PGTjkakh2e5nPT9Z091wu+vg
 6V9NDbtc6rEw4JmQoDEXdQtNu+AfBvQHS/fvfOK5SxzV4f6Es+xctMECMF7yNAdtwSIJ aA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h0wuq10rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 20:58:55 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25TKVavl014126
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 20:58:55 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h0wuq10qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jun 2022 20:58:55 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25TKa3DJ014785;
	Wed, 29 Jun 2022 20:58:54 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma03wdc.us.ibm.com with ESMTP id 3gwt09us0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jun 2022 20:58:54 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25TKwrra65732902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jun 2022 20:58:53 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 92150112062;
	Wed, 29 Jun 2022 20:58:53 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 68226112063;
	Wed, 29 Jun 2022 20:58:53 +0000 (GMT)
Received: from localhost (unknown [9.211.129.69])
	by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
	Wed, 29 Jun 2022 20:58:53 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/smp: poll cpu_callin_map more aggressively in __cpu_up()
Date: Wed, 29 Jun 2022 15:58:52 -0500
Message-Id: <20220629205852.4172212-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: H8a4QH6EZjm8dQz858qjv5J8B_4M7TLJ
X-Proofpoint-ORIG-GUID: hmK1wEFvKuHLxbPtaH3BrF01rJ51KFjm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-29_21,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=955 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206290071
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
Cc: brking@linux.ibm.com, srikar@linux.vnet.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is not necessary to delay or sleep between polls of cpu_callin_map when
waiting for a kicked CPU to come up. We can use spin_until_cond(),
combining the boot and hotplug paths while preserving the intended timeout.

Without the msleep(1) in the hotplug path, the time it takes to online a
CPU on a P9 PowerVM LPAR goes from roughly 30ms to 4ms or less when
exercised via thaw_secondary_cpus().

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---

Notes:
    Changes since v1:
    * Do not poll indefinitely; restore the original 5sec timeout
    
    "Benchmark" method, on a LPAR with 24 CPUs:
    $ echo processors > /sys/power/pm_test
    $ echo mem > /sys/power/state
    $ dmesg --reltime | grep -A23 'Enabling non-boot CPUs'
    
    Before:
    [  +5.000003] Enabling non-boot CPUs ...
    [  +0.047537] CPU1 is up
    [  +0.030177] CPU2 is up
    [  +0.030082] CPU3 is up
    [  +0.030146] CPU4 is up
    [  +0.030114] CPU5 is up
    [  +0.030108] CPU6 is up
    [  +0.030134] CPU7 is up
    [  +0.040272] CPU8 is up
    [  +0.030352] CPU9 is up
    [  +0.030169] CPU10 is up
    [  +0.040224] CPU11 is up
    [  +0.030186] CPU12 is up
    [  +0.030173] CPU13 is up
    [  +0.030181] CPU14 is up
    [  +0.030179] CPU15 is up
    [  +0.030236] CPU16 is up
    [  +0.030012] CPU17 is up
    [  +0.030188] CPU18 is up
    [  +0.030233] CPU19 is up
    [  +0.030182] CPU20 is up
    [  +0.030160] CPU21 is up
    [  +0.030226] CPU22 is up
    [  +0.030125] CPU23 is up
    
    After:
    [  +5.000004] Enabling non-boot CPUs ...
    [  +0.000956] CPU1 is up
    [  +0.000568] CPU2 is up
    [  +0.000682] CPU3 is up
    [  +0.000836] CPU4 is up
    [  +0.000914] CPU5 is up
    [  +0.001054] CPU6 is up
    [  +0.001184] CPU7 is up
    [  +0.001533] CPU8 is up
    [  +0.001779] CPU9 is up
    [  +0.001935] CPU10 is up
    [  +0.002151] CPU11 is up
    [  +0.002358] CPU12 is up
    [  +0.002597] CPU13 is up
    [  +0.002713] CPU14 is up
    [  +0.002891] CPU15 is up
    [  +0.003209] CPU16 is up
    [  +0.003149] CPU17 is up
    [  +0.003337] CPU18 is up
    [  +0.003552] CPU19 is up
    [  +0.003765] CPU20 is up
    [  +0.003922] CPU21 is up
    [  +0.004104] CPU22 is up
    [  +0.004266] CPU23 is up

 arch/powerpc/kernel/smp.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index bcefab484ea6..c8431074d590 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -23,6 +23,7 @@
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/spinlock.h>
+#include <linux/jiffies.h>
 #include <linux/cache.h>
 #include <linux/err.h>
 #include <linux/device.h>
@@ -1268,7 +1269,8 @@ static void cpu_idle_thread_init(unsigned int cpu, struct task_struct *idle)
 
 int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 {
-	int rc, c;
+	unsigned long deadline;
+	int rc;
 
 	/*
 	 * Don't allow secondary threads to come online if inhibited
@@ -1313,23 +1315,10 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 	}
 
 	/*
-	 * wait to see if the cpu made a callin (is actually up).
-	 * use this value that I found through experimentation.
-	 * -- Cort
+	 * Give the remote CPU five seconds to enter the kernel.
 	 */
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
+	deadline = jiffies + msecs_to_jiffies(5000);
+	spin_until_cond(cpu_callin_map[cpu] != 0 || time_after(jiffies, deadline));
 	if (!cpu_callin_map[cpu]) {
 		printk(KERN_ERR "Processor %u is stuck.\n", cpu);
 		return -ENOENT;
-- 
2.36.1

