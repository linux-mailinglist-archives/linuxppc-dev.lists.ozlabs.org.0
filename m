Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC146905DE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 11:58:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCDP06l2Rz3f5P
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 21:58:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WNajBjfb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WNajBjfb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCDN16nMGz3cfW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 21:57:21 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 319Aorxd037123;
	Thu, 9 Feb 2023 10:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=exxMuZxrY4XvnAdGg73FfWI+K5W4L1JzhM+C6mxQ9q0=;
 b=WNajBjfb9DGeASAMf7GVICJCfuM8UccCM2Fu7p8mGpTQNhvZ/0ZDHFsfiXrcMuca+GTl
 kKlVcSwNAnLaOdtUmJ6+/AnKiKdWq4QfAp3Ka0DwpI9MvU9ikE/zOT/DDPkKUAfnLDqy
 SmNOoSKzw04NneEL8DKJ9aESQnixTTQ83s95EdWaCkD/OHeFsU32UnpXb9uYhfo/XpGz
 97Sf4n49nFm7U4RXDYASUpoPiwmE8ty6g4MsB8yD6cuLKuoTDQbZvM9qTz+P+T+janv0
 l8pKbfAlbKuqy5PJOP3wz/Q61OhBJyLyu2OUxYQYQMreBCnhs7O62Hj+4Zj4Wa4BItnl Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmyejr30b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Feb 2023 10:57:14 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 319AqLPQ040491;
	Thu, 9 Feb 2023 10:57:13 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmyejr2yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Feb 2023 10:57:13 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 318JOxwW020939;
	Thu, 9 Feb 2023 10:57:11 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3nhemfp388-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Feb 2023 10:57:10 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 319Av7qb22151910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Feb 2023 10:57:07 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55F8620043;
	Thu,  9 Feb 2023 10:57:07 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3180320040;
	Thu,  9 Feb 2023 10:57:05 +0000 (GMT)
Received: from li-79f82dcc-27d1-11b2-a85c-9579c2333295.ibm.com.domain.name (unknown [9.43.59.180])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Feb 2023 10:57:04 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/eeh: Set channel state after notifying the drivers
Date: Thu,  9 Feb 2023 16:26:49 +0530
Message-Id: <20230209105649.127707-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: D-QKOq9Eqjvq6VPW-0BAR93tPsfELaOI
X-Proofpoint-ORIG-GUID: GAqcGzGWNZUDFPwcmGM1p-cERDSA8ExX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_08,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090095
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
Cc: dick.kennedy@broadcom.com, Ganesh Goudar <ganeshgr@linux.ibm.com>, oohall@gmail.com, mahesh@linux.ibm.com, wenxiong@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a PCI error is encountered 6th time in an hour we
set the channel state to perm_failure and notify the
driver about the permanent failure.

However, after upstream commit 38ddc011478e ("powerpc/eeh:
Make permanently failed devices non-actionable"), EEH handler
stops calling any routine once the device is marked as
permanent failure. This issue can lead to fatal consequences
like kernel hang with certain PCI devices.

Following log is observed with lpfc driver, with and without
this change, Without this change kernel hangs, If PCI error
is encountered 6 times for a device in an hour.

Without the change

 EEH: Beginning: 'error_detected(permanent failure)'
 PCI 0132:60:00.0#600000: EEH: not actionable (1,1,1)
 PCI 0132:60:00.1#600000: EEH: not actionable (1,1,1)
 EEH: Finished:'error_detected(permanent failure)'

With the change

 EEH: Beginning: 'error_detected(permanent failure)'
 EEH: Invoking lpfc->error_detected(permanent failure)
 EEH: lpfc driver reports: 'disconnect'
 EEH: Invoking lpfc->error_detected(permanent failure)
 EEH: lpfc driver reports: 'disconnect'
 EEH: Finished:'error_detected(permanent failure)'

To fix the issue, set channel state to permanent failure after
notifying the drivers.

Fixes: 38ddc011478e ("powerpc/eeh: Make permanently failed devices non-actionable")
Suggested-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 arch/powerpc/kernel/eeh_driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index f279295179bd..438568a472d0 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -1065,10 +1065,10 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 	eeh_slot_error_detail(pe, EEH_LOG_PERM);
 
 	/* Notify all devices that they're about to go down. */
-	eeh_set_channel_state(pe, pci_channel_io_perm_failure);
 	eeh_set_irq_state(pe, false);
 	eeh_pe_report("error_detected(permanent failure)", pe,
 		      eeh_report_failure, NULL);
+	eeh_set_channel_state(pe, pci_channel_io_perm_failure);
 
 	/* Mark the PE to be removed permanently */
 	eeh_pe_state_mark(pe, EEH_PE_REMOVED);
@@ -1185,10 +1185,10 @@ void eeh_handle_special_event(void)
 
 			/* Notify all devices to be down */
 			eeh_pe_state_clear(pe, EEH_PE_PRI_BUS, true);
-			eeh_set_channel_state(pe, pci_channel_io_perm_failure);
 			eeh_pe_report(
 				"error_detected(permanent failure)", pe,
 				eeh_report_failure, NULL);
+			eeh_set_channel_state(pe, pci_channel_io_perm_failure);
 
 			pci_lock_rescan_remove();
 			list_for_each_entry(hose, &hose_list, list_node) {
-- 
2.39.1

