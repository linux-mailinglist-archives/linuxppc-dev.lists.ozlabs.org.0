Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFE1510597
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 19:38:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnpyJ1FRlz3bqW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 03:38:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qNsZ6LP0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnpxY70RFz3bVH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 03:37:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qNsZ6LP0; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KnpxX0Xlbz4yST
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 03:37:52 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KnpxX0P30z4xXW; Wed, 27 Apr 2022 03:37:52 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qNsZ6LP0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KnpxW2fgYz4ySS;
 Wed, 27 Apr 2022 03:37:50 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23QF2ZgF012956;
 Tue, 26 Apr 2022 17:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=DhX6L3JYUhq0DpkE25UzEZAE/pyarg0zpQOaLuVMA2s=;
 b=qNsZ6LP0LfdECxei5x2r77gEwujkzXp081fFWsasK2xcagY2AI9I6+aWS5aalwmv/vgw
 nqrf8A34HoCr9j01sEA/7S8ggKP257SlvG673egwh74hNZqen1dNU1YAVVjxhcrR3J7z
 Q9HIYteLFRnPzRysK+ezJ/q8HMKeE8i28IWawLohzBqeHWRUz2JtHX4/H2W2fkiYuJv/
 XE5j7OM+6XSadPeV179xW5THWaJrgiG0E90g6KZYKXhEyaDhdrBwBdhHnm8YNkwXgX3S
 +jvoepcHV/HPpYpwf/bjoDOurEmEsTh0JolwI1BteMX9py7NXV+iNg4GAPnYjOgmZ0/S gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fpk1fu55u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 17:37:48 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23QHb7Rr014946;
 Tue, 26 Apr 2022 17:37:47 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fpk1fu55c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 17:37:47 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23QHYb7D015215;
 Tue, 26 Apr 2022 17:37:45 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3fm938urdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 17:37:45 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23QHbgPO43516342
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Apr 2022 17:37:42 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F65211C04C;
 Tue, 26 Apr 2022 17:37:42 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4EE0F11C050;
 Tue, 26 Apr 2022 17:37:40 +0000 (GMT)
Received: from [192.168.0.48] (unknown [9.43.51.231])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Apr 2022 17:37:40 +0000 (GMT)
Subject: [PATCH v6] PCI hotplug: rpaphp: Error out on busy status from
 get-sensor-state
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 26 Apr 2022 23:07:39 +0530
Message-ID: <165099464934.1658371.1526973220374528897.stgit@jupiter>
User-Agent: StGit/0.23
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9Ojhx2tX-sNYrm596iLsUuNRE2x5qbz5
X-Proofpoint-ORIG-GUID: doKWPWBLN1sLZ5ZmBtdqkJDqOe5VNpQO
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_05,2022-04-26_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204260111
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
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Oliver O'Halloran <oohall@gmail.com>, linux-pci <linux-pci@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When certain PHB HW failure causes phyp to recover PHB, it marks the PE
state as temporarily unavailable until recovery is complete. This also
triggers an EEH handler in Linux which needs to notify drivers, and perform
recovery. But before notifying the driver about the PCI error it uses
get_adapter_state()->get-sensor-state() operation of the hotplug_slot to
determine if the slot contains a device or not. if the slot is empty, the
recovery is skipped entirely.

However on certain PHB failures, the rtas call get-sensor-state() returns
extended busy error (9902) until PHB is recovered by phyp. Once PHB is
recovered, the get-sensor-state() returns success with correct presence
status. The RTAS call interface rtas_get_sensor() loops over the rtas call
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
if the slot presence state can not be detected immediately while PE is in
EEH recovery state. Current implementation uses rtas_get_sensor() API which
blocks the slot check state until rtas call returns success. Change
rpaphp_get_sensor_state() to invoke rtas_call(get-sensor-state) directly
only if the respective pe is in EEH recovery state, and take actions based
on rtas return status.

In normal cases (non-EEH case) rpaphp_get_sensor_state() will continue to
invoke rtas_get_sensor() as it was earlier with no change in existing
behavior.

Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
---
Change in v6:
- Fixed typo's in the patch description as per review comments.

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


