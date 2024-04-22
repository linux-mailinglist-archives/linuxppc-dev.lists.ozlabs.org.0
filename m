Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F638AC625
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 09:58:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OGYG3gey;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNHgb66M6z3dHj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 17:58:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OGYG3gey;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNHft1xb0z30Pn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 17:57:57 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43M6XLqs005732;
	Mon, 22 Apr 2024 07:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=L3/hBGWbzcEwmXsjGJXsXr/mII9T16or5j0daMXRyvU=;
 b=OGYG3geylvX6urNy9NObyTeIR9LQwS9CfxSRgy06KrWCe0PqorxJQzi1X7k/mrlO8VBz
 X1hfb3Q54YabYjdO1t8JpFfJ+5p0PM+fxNaHf/2zfoJJIONucfy1yhyxSXee/xqP4t0n
 GUFTsgI3Z/Q+LIYg3tFLfuJrT6SGSQoYdwe+3pMFMSzhZUXLmGmeowxOKrDxaJZZF2vF
 lfHqnlKgbyFae3FkIjsc0+u0Jrot4nDcJdwE4cWaQ/VBz/q3Dv5DmRcx3J6FQR7mMrSg
 frpUC6BtHPHqZmwCndpdObYvhXkzhbLE0WCWzQlLiTreN+fxPMYqgYdrLNpn+5V6Xdm2 SA== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xnjq805m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 07:57:52 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43M7rKKO005328;
	Mon, 22 Apr 2024 07:57:51 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xmx3c57wf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 07:57:51 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43M7vj0N45351222
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Apr 2024 07:57:47 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8615220049;
	Mon, 22 Apr 2024 07:57:45 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F20BE2004D;
	Mon, 22 Apr 2024 07:57:43 +0000 (GMT)
Received: from tp-ibm-com.ibmuc.com (unknown [9.179.22.205])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 22 Apr 2024 07:57:43 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/eeh: Permanently disable the removed device
Date: Mon, 22 Apr 2024 13:27:37 +0530
Message-ID: <20240422075737.1405551-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kHgFrx9V-da_1T6tbCjqEU4kTwZ0Yi8R
X-Proofpoint-ORIG-GUID: kHgFrx9V-da_1T6tbCjqEU4kTwZ0Yi8R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_04,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2404220035
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
Cc: Sahitya.Damerla@ibm.com, Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a device is hot removed on powernv, the hotplug driver clears
the device's state. However, on pseries, if a device is removed by
phyp after reaching the error threshold, the kernel remains unaware,
leading to the device not being torn down. This prevents necessary
remediation actions like failover.

Permanently disable the device if the presence check fails.

Also, in eeh_dev_check_failure in we may consider the error as false
positive if the device is hotpluged out as the get_state call returns
EEH_STATE_NOT_SUPPORT and we may end up not clearing the device state,
so log the event if the state is not moved to permanent failure state.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
V2:
* Elobrate the commit message.
* Fix formatting issues in commit message and comments.
---
 arch/powerpc/kernel/eeh.c        | 11 ++++++++++-
 arch/powerpc/kernel/eeh_driver.c | 13 +++++++++++--
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index ab316e155ea9..6670063a7a6c 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -506,9 +506,18 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 	 * We will punt with the following conditions: Failure to get
 	 * PE's state, EEH not support and Permanently unavailable
 	 * state, PE is in good state.
+	 *
+	 * On the pSeries, after reaching the threshold, get_state might
+	 * return EEH_STATE_NOT_SUPPORT. However, it's possible that the
+	 * device state remains uncleared if the device is not marked
+	 * pci_channel_io_perm_failure. Therefore, consider logging the
+	 * event to let device removal happen.
+	 *
 	 */
 	if ((ret < 0) ||
-	    (ret == EEH_STATE_NOT_SUPPORT) || eeh_state_active(ret)) {
+	    (ret == EEH_STATE_NOT_SUPPORT &&
+	     dev->error_state == pci_channel_io_perm_failure) ||
+	    eeh_state_active(ret)) {
 		eeh_stats.false_positives++;
 		pe->false_positives++;
 		rc = 0;
diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 48773d2d9be3..7efe04c68f0f 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -865,9 +865,18 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 				devices++;
 
 	if (!devices) {
-		pr_debug("EEH: Frozen PHB#%x-PE#%x is empty!\n",
+		pr_warn("EEH: Frozen PHB#%x-PE#%x is empty!\n",
 			pe->phb->global_number, pe->addr);
-		goto out; /* nothing to recover */
+		/*
+		 * The device is removed, tear down its state, on powernv
+		 * hotplug driver would take care of it but not on pseries,
+		 * permanently disable the card as it is hot removed.
+		 *
+		 * In the case of powernv, note that the removal of device
+		 * is covered by pci rescan lock, so no problem even if hotplug
+		 * driver attempts to remove the device.
+		 */
+		goto recover_failed;
 	}
 
 	/* Log the event */
-- 
2.44.0

