Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E984677E3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 14:13:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5CtS3XH6z30Bm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 00:13:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BKTx5dAl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5Csf60HVz2yZv
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Dec 2021 00:12:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BKTx5dAl; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4J5Csf3wsDz4xQs
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Dec 2021 00:12:22 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4J5Csf3tGXz4xYy; Sat,  4 Dec 2021 00:12:22 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BKTx5dAl; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4J5Csf10hNz4xQs
 for <linuxppc-dev@ozlabs.org>; Sat,  4 Dec 2021 00:12:21 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B3BJCVs032414
 for <linuxppc-dev@ozlabs.org>; Fri, 3 Dec 2021 13:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=Q2SLc1jWqa3Om2O91X6Uzz6dlqCynPycO7YLFKjWGaU=;
 b=BKTx5dAllCZ6PUKRckaj6XslQeYumL0I0nvjBBEzYuWie1hddt82Nwjz/TfzZ2Eq4lEO
 2UdUvMuIIjKOubTpe3K79DTEiarf6l7dcXHjEpPzwfo6hldvPddmMv3zSIRD+ZgROfZb
 20aB0CHFB4FdakIDKABbtV8cu45FyU21Qy6IhdQWBVERSwPawjSsjCIzPyg5WXtEdvK5
 iUESRG0QJsRXAASw3fG9Kh3SZkmGcPo61/9gPlCAF1cisuWAHfJa/VWbptbi32cqVhhs
 jyU4zVCZJXHQRdKiediEJUuGYCc66brdNxNaRVLmoUeZv3dEPz8WvyZHR+JPPeHCCpv0 NA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqj8hhxda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 03 Dec 2021 13:12:19 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B3DAHEr020305
 for <linuxppc-dev@ozlabs.org>; Fri, 3 Dec 2021 13:12:18 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqj8hhxcu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 13:12:18 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B3D2Noe021098;
 Fri, 3 Dec 2021 13:12:16 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3ckcaau7hb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 13:12:16 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B3DCDEX24445424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 13:12:13 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54BC2A405B;
 Fri,  3 Dec 2021 13:12:13 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5168FA4054;
 Fri,  3 Dec 2021 13:12:12 +0000 (GMT)
Received: from [192.168.0.48] (unknown [9.43.11.18])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Dec 2021 13:12:12 +0000 (GMT)
Subject: [PATCH v3] PCI hotplug: rpaphp: Error out on busy status from
 get-sensor-state
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Fri, 03 Dec 2021 18:42:11 +0530
Message-ID: <163853708110.360679.18375283379078566258.stgit@jupiter>
User-Agent: StGit/0.23
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AnTGDgqJN22-61VhskRcQQ6Ktf1PzYYJ
X-Proofpoint-GUID: s25SnJuzto8215-L5niaaWG7RQnbo8Pv
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_06,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 adultscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030082
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>
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
and reset path assuming the PCI device is in fatal condition. This
sometimes causes EEH recovery to fail. This impacts the ssh connection and
leads to the system being inaccessible.

------------
[52732.244731] DEBUG: ibm_read_slot_reset_state2()
[52732.244762] DEBUG: ret = 0, rets[0]=5, rets[1]=1, rets[2]=4000, rets[3]=>
[52732.244798] DEBUG: in eeh_slot_presence_check
[52732.244804] DEBUG: error state check
[52732.244807] DEBUG: Is slot hotpluggable
[52732.244810] DEBUG: hotpluggable ops ?
[52732.244953] DEBUG: Calling ops->get_adapter_status
[52732.244958] DEBUG: calling rpaphp_get_sensor_state
[52736.564262] ------------[ cut here ]------------
[52736.564299] NETDEV WATCHDOG: enP64p1s0f3 (tg3): transmit queue 0 timed o>
[52736.564324] WARNING: CPU: 1442 PID: 0 at net/sched/sch_generic.c:478 dev>
[...]
[52736.564505] NIP [c000000000c32368] dev_watchdog+0x438/0x440
[52736.564513] LR [c000000000c32364] dev_watchdog+0x434/0x440
------------

To avoid this issue, fix the pci hotplug driver (rpaphp) to return an error
if the slot presence state can not be detected immediately. Current
implementation uses rtas_get_sensor() API which blocks the slot check state
until rtas call returns success. Change rpaphp_get_sensor_state() to invoke
rtas_call(get-sensor-state) directly and take actions based on rtas return
status. This patch now errors out immediately on busy return status from
rtas_call.

Please note that, only on certain PHB failures, the slot presence check
returns BUSY condition. In normal cases it returns immediately with a
correct presence state value. Hence this change has no impact on normal pci
dlpar operations.

Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
---
Change in V3:
- Invoke rtas_call(get-sensor-state) directly from
  rpaphp_get_sensor_state() directly and do special handling.
- See v2 at
  https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-November/237336.html

Change in V2:
- Alternate approach to fix the EEH issue instead of delaying slot presence
  check proposed at
  https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-November/236956.html

Also refer:
https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-November/237027.html
---
 drivers/pci/hotplug/rpaphp_pci.c |   64 ++++++++++++++++++++++++++++++++++----
 1 file changed, 58 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/hotplug/rpaphp_pci.c b/drivers/pci/hotplug/rpaphp_pci.c
index c380bdacd1466..57ec1a72b24aa 100644
--- a/drivers/pci/hotplug/rpaphp_pci.c
+++ b/drivers/pci/hotplug/rpaphp_pci.c
@@ -18,15 +18,65 @@
 #include "../pci.h"		/* for pci_add_new_bus */
 #include "rpaphp.h"
 
+/*
+ * RTAS call get-sensor-state(DR_ENTITY_SENSE) return values as per PAPR:
+ *    -1: Hardware Error
+ *    -2: RTAS_BUSY
+ *    -3: Invalid sensor. RTAS Parameter Error.
+ * -9000: Need DR entity to be powered up and unisolated before RTAS call
+ * -9001: Need DR entity to be powered up, but not unisolated, before RTAS call
+ * -9002: DR entity unusable
+ *  990x: Extended delay - where x is a number in the range of 0-5
+ */
+#define RTAS_HARDWARE_ERROR	-1
+#define RTAS_INVALID_SENSOR	-3
+#define SLOT_UNISOLATED		-9000
+#define SLOT_NOT_UNISOLATED	-9001
+#define SLOT_NOT_USABLE		-9002
+
+static int rtas_to_errno(int rtas_rc)
+{
+	int rc;
+
+	switch (rtas_rc) {
+	case RTAS_HARDWARE_ERROR:
+		rc = -EIO;
+		break;
+	case RTAS_INVALID_SENSOR:
+		rc = -EINVAL;
+		break;
+	case SLOT_UNISOLATED:
+	case SLOT_NOT_UNISOLATED:
+		rc = -EFAULT;
+		break;
+	case SLOT_NOT_USABLE:
+		rc = -ENODEV;
+		break;
+	case RTAS_BUSY:
+	case RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX:
+		rc = -EBUSY;
+		break;
+	default:
+		err("%s: unexpected RTAS error %d\n", __func__, rtas_rc);
+		rc = -ERANGE;
+		break;
+	}
+	return rc;
+}
+
 int rpaphp_get_sensor_state(struct slot *slot, int *state)
 {
+	int token = rtas_token("get-sensor-state");
 	int rc;
 	int setlevel;
 
-	rc = rtas_get_sensor(DR_ENTITY_SENSE, slot->index, state);
+	if (token == RTAS_UNKNOWN_SERVICE)
+		return -ENOENT;
+
+	rc = rtas_call(token, 2, 2, state, DR_ENTITY_SENSE, slot->index);
 
 	if (rc < 0) {
-		if (rc == -EFAULT || rc == -EEXIST) {
+		if (rc == SLOT_UNISOLATED  || rc == SLOT_NOT_UNISOLATED) {
 			dbg("%s: slot must be power up to get sensor-state\n",
 			    __func__);
 
@@ -38,15 +88,17 @@ int rpaphp_get_sensor_state(struct slot *slot, int *state)
 			if (rc < 0) {
 				dbg("%s: power on slot[%s] failed rc=%d.\n",
 				    __func__, slot->name, rc);
-			} else {
-				rc = rtas_get_sensor(DR_ENTITY_SENSE,
-						     slot->index, state);
+				return rc;
 			}
-		} else if (rc == -ENODEV)
+			rc = rtas_call(token, 2, 2, state, DR_ENTITY_SENSE,
+				       slot->index);
+		} else if (rc == SLOT_NOT_USABLE)
 			info("%s: slot is unusable\n", __func__);
 		else
 			err("%s failed to get sensor state\n", __func__);
 	}
+	if (rc)
+		rc = rtas_to_errno(rc);
 	return rc;
 }
 


