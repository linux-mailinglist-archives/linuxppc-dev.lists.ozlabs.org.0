Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C6645A373
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 14:06:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz4Cg6smTz2yw7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 00:06:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SGmieEcY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hz4Bt1j4Jz2yfr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 00:05:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SGmieEcY; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Hz4Bt1KS5z4xbM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 00:05:58 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4Hz4Bt1GVXz4xcv; Wed, 24 Nov 2021 00:05:58 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SGmieEcY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Hz4Bs5G5Cz4xbM
 for <linuxppc-dev@ozlabs.org>; Wed, 24 Nov 2021 00:05:57 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ANCl7A8020566
 for <linuxppc-dev@ozlabs.org>; Tue, 23 Nov 2021 13:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=fxgDBp8FTgOzqk1DVvr3ilCrRM/VctPWloixSIGocHY=;
 b=SGmieEcYR+v6hJa8Z6E0FgVHIbwKf4pyslRN3J8DJPew5LgMgEJvq9GeJWrmFqYmkuW5
 nIWbAJjWe3PKbsZze1vSnNpCOl0obHKnFCsoEy1grsmY8mUHkAzLURgi9sP0WD0ZeHlj
 po3lIpMI0lT33FY1XyqZr6+9AVUaIC6kTzQCGTxNTkfqDVJ/eJlS3xRWRHxzdDZ6Frfv
 XqnLREnNKvpJQtCvoNooAFAfVaJfpG8uHqg1UEf1CWEqOvbaMsgR7+NdHziLxIYaavxb
 Hpxj5pP80JQjccqeokSvD+tibCpHml9nPR/8lL7pySzEUk1KTp2t+NrFnOE62CYzHh64 Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ch0m1gd42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 23 Nov 2021 13:05:54 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ANClKOo023358
 for <linuxppc-dev@ozlabs.org>; Tue, 23 Nov 2021 13:05:53 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ch0m1gd3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 13:05:53 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ANCx7Qh002399;
 Tue, 23 Nov 2021 13:05:51 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3cernar0yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 13:05:51 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AND5nIF22413600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Nov 2021 13:05:49 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 876ADA4064;
 Tue, 23 Nov 2021 13:05:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE035A405B;
 Tue, 23 Nov 2021 13:05:48 +0000 (GMT)
Received: from [192.168.0.48] (unknown [9.43.41.130])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Nov 2021 13:05:48 +0000 (GMT)
Subject: [PATCH] powerpc/eeh: Delay slot presence check once driver is
 notified about the pci error.
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 23 Nov 2021 18:35:47 +0530
Message-ID: <163767273634.1368569.7327743414665595326.stgit@jupiter>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: N6Lt1bS1ZE1yJWj2bESnaAdWIAowvVGC
X-Proofpoint-ORIG-GUID: lgopwWTge2_cVhzH3LI4h35UA1Afz2wN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-23_04,2021-11-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1011 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111230075
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When certain PHB HW failure causes phyp to recover PHB, it marks the PE
state as temporarily unavailable until recovery is complete. This also
triggers an EEH handler in Linux which needs to notify drivers, and perform
recovery. But before notifying the driver about the pci error it uses
get_adapter_state()->get-sesnor-state() operation of the hotplug_slot to
determine if the slot contains a device or not. if the slot is empty, the
recovery is skipped entirely.

However on certain PHB failures, the rtas call get-sesnor-state() returns
extended busy error (9902) until PHB is recovered by phyp. Once PHB is
recovered, the get-sensor-state() returns success with correct presence
status. The rtas call interface rtas_get_sensor() loops over the rtas call
on extended delay return code (9902) until the return value is either
success (0) or error (-1). This causes the EEH handler to get stuck for ~6
seconds before it could notify that the pci error has been detected and
stop any active operations. Hence with running I/O traffic, during this 6
seconds, the network driver continues its operation and hits a timeout
(netdev watchdog). On timeouts, network driver go into ffdc capture mode
and reset path assuming the PCI device is in fatal condition. This causes
EEH recovery to fail and sometimes it leads to system hang or crash.

------------
[52732.244731] DEBUG: ibm_read_slot_reset_state2()
[52732.244762] DEBUG: ret = 0, rets[0]=5, rets[1]=1, rets[2]=4000, rets[3]=0x0
[52732.244798] DEBUG: in eeh_slot_presence_check
[52732.244804] DEBUG: error state check
[52732.244807] DEBUG: Is slot hotpluggable
[52732.244810] DEBUG: hotpluggable ops ?
[52732.244953] DEBUG: Calling ops->get_adapter_status
[52732.244958] DEBUG: calling rpaphp_get_sensor_state
[52736.564262] ------------[ cut here ]------------
[52736.564299] NETDEV WATCHDOG: enP64p1s0f3 (tg3): transmit queue 0 timed out
[52736.564324] WARNING: CPU: 1442 PID: 0 at net/sched/sch_generic.c:478 dev_watchdog+0x438/0x440
[...]
[52736.564505] NIP [c000000000c32368] dev_watchdog+0x438/0x440
[52736.564513] LR [c000000000c32364] dev_watchdog+0x434/0x440
------------

To fix this issue, delay the slot presence check after notifying the driver
about the pci error.

Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
---
 arch/powerpc/kernel/eeh_driver.c |   42 ++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 350dab18e1373..a4a80451d50f7 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -851,26 +851,6 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		return;
 	}
 
-	/*
-	 * When devices are hot-removed we might get an EEH due to
-	 * a driver attempting to touch the MMIO space of a removed
-	 * device. In this case we don't have a device to recover
-	 * so suppress the event if we can't find any present devices.
-	 *
-	 * The hotplug driver should take care of tearing down the
-	 * device itself.
-	 */
-	eeh_for_each_pe(pe, tmp_pe)
-		eeh_pe_for_each_dev(tmp_pe, edev, tmp)
-			if (eeh_slot_presence_check(edev->pdev))
-				devices++;
-
-	if (!devices) {
-		pr_debug("EEH: Frozen PHB#%x-PE#%x is empty!\n",
-			pe->phb->global_number, pe->addr);
-		goto out; /* nothing to recover */
-	}
-
 	/* Log the event */
 	if (pe->type & EEH_PE_PHB) {
 		pr_err("EEH: Recovering PHB#%x, location: %s\n",
@@ -942,6 +922,28 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 			result = PCI_ERS_RESULT_NEED_RESET;
 	}
 
+	/*
+	 * When devices are hot-removed we might get an EEH due to
+	 * a driver attempting to touch the MMIO space of a removed
+	 * device. In this case we don't have a device to recover
+	 * bail out early as there is nothing to recover.
+	 *
+	 * The hotplug driver should take care of tearing down the
+	 * device itself.
+	 */
+	eeh_for_each_pe(pe, tmp_pe)
+		eeh_pe_for_each_dev(tmp_pe, edev, tmp)
+			if (eeh_slot_presence_check(edev->pdev))
+				devices++;
+
+	if (!devices) {
+		pr_info("EEH: Frozen PHB#%x-PE#%x is empty!\n",
+			pe->phb->global_number, pe->addr);
+		pr_info("EEH: Surprise hotplug remove. nothing to recover.\n");
+		eeh_set_channel_state(pe, pci_channel_io_perm_failure);
+		goto out; /* nothing to recover */
+	}
+
 	/* Get the current PCI slot state. This can take a long time,
 	 * sometimes over 300 seconds for certain systems.
 	 */


