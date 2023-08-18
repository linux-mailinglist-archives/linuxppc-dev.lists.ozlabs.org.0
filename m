Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 322FD780B26
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 13:30:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W5MIJZ9I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RS0750j3Sz3cY8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 21:30:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W5MIJZ9I;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RS05s2TCVz3cRc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 21:29:53 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RS05s1sMsz4wy8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 21:29:53 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RS05s1mPmz4wy5; Fri, 18 Aug 2023 21:29:53 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W5MIJZ9I;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4RS05r6ZVQz4wbP;
	Fri, 18 Aug 2023 21:29:52 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37IBNFPj000823;
	Fri, 18 Aug 2023 11:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : from : to : cc
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=SssMv0d2ByOn45m1SrTUOIjfbO64T6j/UhE/PdcbH8Y=;
 b=W5MIJZ9IGG5G1B8dzPbcKTkJVH3PhmC+yGECAuf7jHO+kLndrQrJmTfowFbB6qyeIsmq
 RUcnLydjXJjN/sQlYne4pgPPDhO3DyX+Z9DiNzfLOFm2/lVomeRpAtAGF9HlWidKwpil
 d1vFXCUyD9dZRIzaye8HhPVvwvekVHiJSzNvcdjqubxeEZIFBzqwQTTn3cwQ5hcl6hRU
 TPpgj6wehGYKcTMzyF6qQFFm99D3D855muMuHLVlHv5CPkBYInGYun19E5kL8d9nayib
 p/dlvVJWohjR1AfB4QZgWsixqnVLCtA9PnWKNwDGvzftMYdmSi/8onNZpJ56lfRzYQ8N 5A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sj7qqr3re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 11:29:50 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37IBOBcl003449;
	Fri, 18 Aug 2023 11:29:50 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sj7qqr3qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 11:29:50 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37IACtpF001085;
	Fri, 18 Aug 2023 11:29:48 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3semsyxwmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 11:29:48 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37IBTjVV24117886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Aug 2023 11:29:45 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C80520040;
	Fri, 18 Aug 2023 11:29:45 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCE2420043;
	Fri, 18 Aug 2023 11:29:43 +0000 (GMT)
Received: from [9.113.206.79] (unknown [9.113.206.79])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Aug 2023 11:29:43 +0000 (GMT)
Subject: [PATCH v9 2/2] PCI: rpaphp: Error out on busy status from
 get-sensor-state
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Fri, 18 Aug 2023 16:59:43 +0530
Message-ID: <169235815601.193557.13989873835811325343.stgit@jupiter>
In-Reply-To: <169235811556.193557.1023625262204809514.stgit@jupiter>
References: <169235811556.193557.1023625262204809514.stgit@jupiter>
User-Agent: StGit/1.5
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RGiu70qy3XvSfQhp5SJiFkoUg2XJyPDT
X-Proofpoint-GUID: j-e0j1VxB30aWlUdL_cw4Guab4l-sJHO
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_13,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308180102
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Oliver O'Halloran <oohall@gmail.com>, linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When certain PHB HW failure causes pHyp to recover PHB, it marks the PE
state as temporarily unavailable until recovery is complete. This also
triggers an EEH handler in Linux which needs to notify drivers, and perform
recovery. But before notifying the driver about the PCI error it uses
get_adapter_status()->rpaphp_get_sensor_state()->rtas_call(get-sensor-state)
operation of the hotplug_slot to determine if the slot contains a device or
not. If the slot is empty, the recovery is skipped entirely.

eeh_event_handler()
  ->eeh_handle_normal_event()
    ->eeh_slot_presence_check()
      ->get_adapter_status()
        ->rpaphp_get_sensor_state()
          ->rtas_get_sensor()
            ->rtas_call(get-sensor-state)

However on certain PHB failures, the RTAS call rtas_call(get-sensor-state)
returns extended busy error (9902) until PHB is recovered by pHyp. Once PHB
is recovered, the rtas_call(get-sensor-state) returns success with correct
presence status. The RTAS call interface rtas_get_sensor() loops over the
RTAS call on extended delay return code (9902) until the return value is
either success (0) or error (-1). This causes the EEH handler to get stuck
for ~6 seconds before it could notify that the PCI error has been detected
and stop any active operations. Hence with running I/O traffic, during this
6 seconds, the network driver continues its operation and hits a timeout
(netdev watchdog).

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

On timeouts, network driver starts dumping debug information to console
(e.g bnx2 driver calls bnx2x_panic_dump()), and go into recovery path while
pHyp is still recovering the PHB. As part of recovery, the driver tries to
reset the device and it keeps failing since every PCI read/write returns
ff's. And when EEH recovery kicks-in, the driver is unable to recover the
device. This impacts the ssh connection and leads to the system being
inaccessible. To get the NIC working again it needs a reboot or re-assign
the I/O adapter from HMC.

[ 9531.168587] EEH: Beginning: 'slot_reset'
[ 9531.168601] PCI 0013:01:00.0#10000: EEH: Invoking bnx2x->slot_reset()
[...]
[ 9614.110094] bnx2x: [bnx2x_func_stop:9129(enP19p1s0f0)]FUNC_STOP ramrod failed. Running a dry transaction
[ 9614.110300] bnx2x: [bnx2x_igu_int_disable:902(enP19p1s0f0)]BUG! Proper val not read from IGU!
[ 9629.178067] bnx2x: [bnx2x_fw_command:3055(enP19p1s0f0)]FW failed to respond!
[ 9629.178085] bnx2x 0013:01:00.0 enP19p1s0f0: bc 7.10.4
[ 9629.178091] bnx2x: [bnx2x_fw_dump_lvl:789(enP19p1s0f0)]Cannot dump MCP info while in PCI error
[ 9644.241813] bnx2x: [bnx2x_io_slot_reset:14245(enP19p1s0f0)]IO slot reset --> driver unload
[...]
[ 9644.241819] PCI 0013:01:00.0#10000: EEH: bnx2x driver reports: 'disconnect'
[ 9644.241823] PCI 0013:01:00.1#10000: EEH: Invoking bnx2x->slot_reset()
[ 9644.241827] bnx2x: [bnx2x_io_slot_reset:14229(enP19p1s0f1)]IO slot reset initializing...
[ 9644.241916] bnx2x 0013:01:00.1: enabling device (0140 -> 0142)
[ 9644.258604] bnx2x: [bnx2x_io_slot_reset:14245(enP19p1s0f1)]IO slot reset --> driver unload
[ 9644.258612] PCI 0013:01:00.1#10000: EEH: bnx2x driver reports: 'disconnect'
[ 9644.258615] EEH: Finished:'slot_reset' with aggregate recovery state:'disconnect'
[ 9644.258620] EEH: Unable to recover from failure from PHB#13-PE#10000.
[ 9644.261811] EEH: Beginning: 'error_detected(permanent failure)'
[...]
[ 9644.261823] EEH: Finished:'error_detected(permanent failure)'

Hence, it becomes important to inform driver about the PCI error detection
as early as possible, so that driver is aware of PCI error and waits for
EEH handler's next action for successful recovery.

Current implementation uses rtas_get_sensor() API which blocks the slot
check state until RTAS call returns success. To avoid this, fix the PCI
hotplug driver (rpaphp) to return an error (-EBUSY) if the slot presence
state can not be detected immediately while PE is in EEH recovery state.
Change rpaphp_get_sensor_state() to invoke rtas_call(get-sensor-state)
directly only if the respective PE is in EEH recovery state, and take
actions based on RTAS return status. This way EEH handler will not be
blocked on rpaphp_get_sensor_state() and can immediately notify driver
about the PCI error and stop any active operations.

In normal cases (non-EEH case) rpaphp_get_sensor_state() will continue to
invoke rtas_get_sensor() as it was earlier with no change in existing
behavior.

Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
---
Change in v9:
- Move get-sensor-state specific #defines of rtas return code from rtas.h
  (patch 1/2) to rpaphp_pci.c

Change in v8:
- Removed redundant #ifdef CONFIG_EEH and addressed other review comments.
  https://lore.kernel.org/lkml/20230801213808.GA51837@bhelgaas/

Change in v7:
- Modified patch description to explain affect of timeout on NIC
  functioning.
- Fix few nits requested in previous review at
  https://lore.kernel.org/all/20220612170248.l6ftaneqjfof2jrc@in.ibm.com/
- Add additional patch before this to introduce rtas_generic_errno() to
  handle generic rtas error codes.
  https://lore.kernel.org/all/20220429162545.GA79541@bhelgaas/

Change in v6:
- Fixed typo's in the patch description as per review comments.

Change in v5:
- Fixup #define macros with parentheses around the values.

Change in V4:
- Error out on sensor busy only if PE is going through EEH recovery instead
  of always error out.

Change in V3:
- Invoke rtas_call(get-sensor-state) directly from
  rpaphp_get_sensor_state() directly and do special handling.
- See v2 at
  https://lore.kernel.org/all/163817631601.2016996.16085383012429651821.stgit@jupiter/

Change in V2:
- Alternate approach to fix the EEH issue instead of delaying slot presence
  check proposed at
  https://lore.kernel.org/all/163767273634.1368569.7327743414665595326.stgit@jupiter/

Also refer:
https://lore.kernel.org/all/20211125053402.zyzpl3te5x3ryypx@in.ibm.com/
---
 drivers/pci/hotplug/rpaphp_pci.c |   84 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/hotplug/rpaphp_pci.c b/drivers/pci/hotplug/rpaphp_pci.c
index 630f77057c23d..2969fea233497 100644
--- a/drivers/pci/hotplug/rpaphp_pci.c
+++ b/drivers/pci/hotplug/rpaphp_pci.c
@@ -19,12 +19,91 @@
 #include "../pci.h"		/* for pci_add_new_bus */
 #include "rpaphp.h"
 
+/*
+ * RTAS call get-sensor-state(DR_ENTITY_SENSE) return values as per PAPR:
+ * -- generic return codes ---
+ *    -1: Hardware Error
+ *    -2: RTAS_BUSY
+ *    -3: Invalid sensor. RTAS Parameter Error.
+ * -- rtas_get_sensor function specific return codes ---
+ * -9000: Need DR entity to be powered up and unisolated before RTAS call
+ * -9001: Need DR entity to be powered up, but not unisolated, before RTAS call
+ * -9002: DR entity unusable
+ *  990x: Extended delay - where x is a number in the range of 0-5
+ */
+#define RTAS_SLOT_UNISOLATED		-9000
+#define RTAS_SLOT_NOT_UNISOLATED	-9001
+#define RTAS_SLOT_NOT_USABLE		-9002
+static int rtas_get_sensor_errno(int rtas_rc)
+{
+	switch (rtas_rc) {
+	case 0:
+		/* Success case */
+		return 0;
+	case RTAS_SLOT_UNISOLATED:
+	case RTAS_SLOT_NOT_UNISOLATED:
+		return -EFAULT;
+	case RTAS_SLOT_NOT_USABLE:
+		return -ENODEV;
+	case RTAS_BUSY:
+	case RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX:
+		return -EBUSY;
+	default:
+		return rtas_error_rc(rtas_rc);
+	}
+}
+
+/*
+ * get_adapter_status() can be called by the EEH handler during EEH recovery.
+ * On certain PHB failures, the RTAS call rtas_call(get-sensor-state) returns
+ * extended busy error (9902) until PHB is recovered by pHyp. The RTAS call
+ * interface rtas_get_sensor() loops over the RTAS call on extended delay
+ * return code (9902) until the return value is either success (0) or error
+ * (-1). This causes the EEH handler to get stuck for ~6 seconds before it
+ * could notify that the PCI error has been detected and stop any active
+ * operations. This sometimes causes EEH recovery to fail. To avoid this issue,
+ * invoke rtas_call(get-sensor-state) directly if the respective PE is in EEH
+ * recovery state and return -EBUSY error based on RTAS return status. This
+ * will help the EEH handler to notify the driver about the PCI error
+ * immediately and successfully proceed with EEH recovery steps.
+ */
+
+static int __rpaphp_get_sensor_state(struct slot *slot, int *state)
+{
+	int rc;
+	int token = rtas_token("get-sensor-state");
+	struct pci_dn *pdn;
+	struct eeh_pe *pe;
+	struct pci_controller *phb = PCI_DN(slot->dn)->phb;
+
+	if (token == RTAS_UNKNOWN_SERVICE)
+		return -ENOENT;
+
+	/*
+	 * Fallback to existing method for empty slot or PE isn't in EEH
+	 * recovery.
+	 */
+	pdn = list_first_entry_or_null(&PCI_DN(phb->dn)->child_list,
+					struct pci_dn, list);
+	if (!pdn)
+		goto fallback;
+
+	pe = eeh_dev_to_pe(pdn->edev);
+	if (pe && (pe->state & EEH_PE_RECOVERING)) {
+		rc = rtas_call(token, 2, 2, state, DR_ENTITY_SENSE,
+			       slot->index);
+		return rtas_get_sensor_errno(rc);
+	}
+fallback:
+	return rtas_get_sensor(DR_ENTITY_SENSE, slot->index, state);
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
@@ -40,8 +119,7 @@ int rpaphp_get_sensor_state(struct slot *slot, int *state)
 				dbg("%s: power on slot[%s] failed rc=%d.\n",
 				    __func__, slot->name, rc);
 			} else {
-				rc = rtas_get_sensor(DR_ENTITY_SENSE,
-						     slot->index, state);
+				rc = __rpaphp_get_sensor_state(slot, state);
 			}
 		} else if (rc == -ENODEV)
 			info("%s: slot is unusable\n", __func__);


