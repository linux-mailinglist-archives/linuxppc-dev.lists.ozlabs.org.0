Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F474D3527
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 18:13:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDJgC2cZPz3bcp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 04:13:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sDOV4rtR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDJfP5cSfz2yQC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 04:12:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sDOV4rtR; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KDJfM6bw5z4xbG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 04:12:27 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KDJfM6YJ5z4xdl; Thu, 10 Mar 2022 04:12:27 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sDOV4rtR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KDJfM3RC0z4xbG
 for <linuxppc-dev@ozlabs.org>; Thu, 10 Mar 2022 04:12:26 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 229GiotY020754
 for <linuxppc-dev@ozlabs.org>; Wed, 9 Mar 2022 17:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=OvIwScXMzdQRp4tforEQ/Vv8jnfZvTYTj9ZOpvB7QiY=;
 b=sDOV4rtRsVe0JzZSc2UiN9qOuLMBa//1CYQyzWje6Lt5PCpH9ZXn1969NUmgyQuuE3bu
 bk/DcQyCqZAL79We239UmrfJIcwyfvGhDZVs0N6Nw43lRUNcdYN/LOrhTNd2wqzcTGRv
 dIA9qnbhDwT1bFcgjaAfilWqJ0jyvJtAirvitmQ14Qpph62UmuVn5P8sgQ8Dlv5aZiUb
 hvI2XkuRJPLzXZz9mbC0kX+W5ZFx8HVPhhxpY1yv+zLAXYJXR5j9iOiw5O3QsD1GdpYg
 k3+Wl3QzEW5055/epJXCNgLrb2YvdxTctl2IFceNSdaR+p2ULzOwIxnnrozADbRjNZVE bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ep0hgc0qm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 09 Mar 2022 17:12:23 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 229Gl9Nj026599
 for <linuxppc-dev@ozlabs.org>; Wed, 9 Mar 2022 17:12:23 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ep0hgc0qd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Mar 2022 17:12:23 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 229H8vQO027502;
 Wed, 9 Mar 2022 17:12:21 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3eky4j96kk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Mar 2022 17:12:21 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 229HCIwF43450824
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Mar 2022 17:12:18 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EFCA4C050;
 Wed,  9 Mar 2022 17:12:18 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 327DF4C040;
 Wed,  9 Mar 2022 17:12:17 +0000 (GMT)
Received: from [192.168.0.48] (unknown [9.43.40.95])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  9 Mar 2022 17:12:16 +0000 (GMT)
Subject: [PATCH v5] PCI hotplug: rpaphp: Error out on busy status from
 get-sensor-state
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 09 Mar 2022 22:42:16 +0530
Message-ID: <164684593617.368427.2230609269419942906.stgit@jupiter>
User-Agent: StGit/0.23
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LE3qHcVZDCgZpfmCnBOxfHB0sb_sfarQ
X-Proofpoint-ORIG-GUID: xrWRY6lco4iOWnPn7vsXE1H8iBdDM2c5
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-09_07,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203090096
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
if the slot presence state can not be detected immediately while pe is in
EEH recovery state. Current implementation uses rtas_get_sensor() API which
blocks the slot check state until rtas call returns success. Change
rpaphp_get_sensor_state() to invoke rtas_call(get-sensor-state) directly
only if the respective pe is in EEH recovery state, and take actions based
on rtas return status.

In normal cases (non-EEH case) rpaphp_get_sensor_state() will continue to
invoke rtas_get_sensor() as it was earlier with no change in existing
behavior.

Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
---
Change in v5:
- Fixup #define macros with parentheses around the values.

Change in V4:
- Error out on sensor busy only if pe is going through EEH recovery instead
  of always error out.

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
 drivers/pci/hotplug/rpaphp_pci.c |  100 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/hotplug/rpaphp_pci.c b/drivers/pci/hotplug/rpaphp_pci.c
index c380bdacd1466..e463e915a052a 100644
--- a/drivers/pci/hotplug/rpaphp_pci.c
+++ b/drivers/pci/hotplug/rpaphp_pci.c
@@ -18,12 +18,107 @@
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
+#define RTAS_HARDWARE_ERROR	(-1)
+#define RTAS_INVALID_SENSOR	(-3)
+#define SLOT_UNISOLATED		(-9000)
+#define SLOT_NOT_UNISOLATED	(-9001)
+#define SLOT_NOT_USABLE		(-9002)
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
+/*
+ * get_adapter_status() can be called by the EEH handler during EEH recovery.
+ * On certain PHB failures, the rtas call get-sensor-state() returns extended
+ * busy error (9902) until PHB is recovered by phyp. The rtas call interface
+ * rtas_get_sensor() loops over the rtas call on extended delay return code
+ * (9902) until the return value is either success (0) or error (-1). This
+ * causes the EEH handler to get stuck for ~6 seconds before it could notify
+ * that the pci error has been detected and stop any active operations. This
+ * sometimes causes EEH recovery to fail. To avoid this issue, invoke
+ * rtas_call(get-sensor-state) directly if the respective pe is in EEH recovery
+ * state and return -EBUSY error based on rtas return status. This will help
+ * the EEH handler to notify the driver about the pci error immediately and
+ * successfully proceed with EEH recovery steps.
+ */
+static int __rpaphp_get_sensor_state(struct slot *slot, int *state)
+{
+	int rc;
+#ifdef CONFIG_EEH
+	int token = rtas_token("get-sensor-state");
+	struct pci_dn *pdn;
+	struct eeh_pe *pe;
+	struct pci_controller *phb = PCI_DN(slot->dn)->phb;
+
+	if (token == RTAS_UNKNOWN_SERVICE)
+		return -ENOENT;
+
+	/*
+	 * Fallback to existing method for empty slot or pe isn't in EEH
+	 * recovery.
+	 */
+	if (list_empty(&PCI_DN(phb->dn)->child_list))
+		goto fallback;
+
+	pdn = list_first_entry(&PCI_DN(phb->dn)->child_list,
+			       struct pci_dn, list);
+	pe = eeh_dev_to_pe(pdn->edev);
+	if (pe && (pe->state & EEH_PE_RECOVERING)) {
+		rc = rtas_call(token, 2, 2, state, DR_ENTITY_SENSE,
+			       slot->index);
+		if (rc)
+			rc = rtas_to_errno(rc);
+		return rc;
+	}
+fallback:
+#endif
+	rc = rtas_get_sensor(DR_ENTITY_SENSE, slot->index, state);
+	return rc;
+}
+
 int rpaphp_get_sensor_state(struct slot *slot, int *state)
 {
 	int rc;
 	int setlevel;
 
-	rc = rtas_get_sensor(DR_ENTITY_SENSE, slot->index, state);
+	rc = __rpaphp_get_sensor_state(slot, state);
 
 	if (rc < 0) {
 		if (rc == -EFAULT || rc == -EEXIST) {
@@ -39,8 +134,7 @@ int rpaphp_get_sensor_state(struct slot *slot, int *state)
 				dbg("%s: power on slot[%s] failed rc=%d.\n",
 				    __func__, slot->name, rc);
 			} else {
-				rc = rtas_get_sensor(DR_ENTITY_SENSE,
-						     slot->index, state);
+				rc = __rpaphp_get_sensor_state(slot, state);
 			}
 		} else if (rc == -ENODEV)
 			info("%s: slot is unusable\n", __func__);


