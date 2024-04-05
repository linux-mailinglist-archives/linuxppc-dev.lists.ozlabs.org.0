Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E16899E1D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 15:15:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tKlfOXob;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9zW54WS6z3vYm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Apr 2024 00:15:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tKlfOXob;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9zVK02t4z3d24
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Apr 2024 00:14:48 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 435Cv5ro022145;
	Fri, 5 Apr 2024 13:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=jS+/fKIAPnvkEpFxDArztAAca7m0bDI76Vk216ZQdfg=;
 b=tKlfOXobCE9IX1/EkHEyORWEBC1IE9BSMh3mGTx1leDTHSyTGFVaeu8FQ4/UVSoc4m1P
 OCvXKGWrUDQU1qyFBRlN4HGpOJotDVHvT2JRAT2LmKSTHw4Ku+TV9ts2JFvbDn1h3rzo
 yIYn92s+OZ+t2VCb0h9bNuSjnfZUetRI0S0PVBDHFzO/nuxHNfS/bJ1vrpwirh/GSxlL
 biJaIF7W3diVEHnHjgdoN4tJaUZqxcemNqg8UaeWJjl3vyd8QepTzqDv/jw6Ob6d5KKw
 H39GqXyCdn0AUzPiz8dSs5rED0UsttO2ykDuFEhe2biAbq5Ejlh09Nuysg7RpxjjisJC sw== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xah8p84eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 13:14:42 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 435CjiNo007749;
	Fri, 5 Apr 2024 13:14:42 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x9epwtn2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 13:14:41 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 435DEai416843232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Apr 2024 13:14:38 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85D552004B;
	Fri,  5 Apr 2024 13:14:36 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB9B620049;
	Fri,  5 Apr 2024 13:14:34 +0000 (GMT)
Received: from tp-ibm-com.ibmuc.com (unknown [9.179.8.111])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  5 Apr 2024 13:14:34 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/eeh: Permanently disable the removed device
Date: Fri,  5 Apr 2024 18:44:20 +0530
Message-ID: <20240405131420.998618-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: stCRZ1jXrtdm9rAqpIQNapAz-DaXYWWs
X-Proofpoint-ORIG-GUID: stCRZ1jXrtdm9rAqpIQNapAz-DaXYWWs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_10,2024-04-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0 adultscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2404050095
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

When a device is hot removed on powernv, the hotplug
driver clears the device's state. However, on pseries,
if a device is removed by phyp after reaching the error
threshold, the kernel remains unaware, leading to the
device not being torn down. This prevents necessary
remediation actions like failover.

Permanently disable the device if the presence check
fails.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 arch/powerpc/kernel/eeh.c        | 4 +++-
 arch/powerpc/kernel/eeh_driver.c | 8 +++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index ab316e155ea9..8d1606406d3f 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -508,7 +508,9 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 	 * state, PE is in good state.
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
index 48773d2d9be3..10317badf471 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -867,7 +867,13 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 	if (!devices) {
 		pr_debug("EEH: Frozen PHB#%x-PE#%x is empty!\n",
 			pe->phb->global_number, pe->addr);
-		goto out; /* nothing to recover */
+		/*
+		 * The device is removed, Tear down its state,
+		 * On powernv hotplug driver would take care of
+		 * it but not on pseries, Permanently disable the
+		 * card as it is hot removed.
+		 */
+		goto recover_failed;
 	}
 
 	/* Log the event */
-- 
2.44.0

