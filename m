Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB097E968A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 06:52:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OCVSXnjR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STJVY2H7gz3cY5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 16:52:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OCVSXnjR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STJTd1gZhz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 16:51:48 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AD5jExn018302;
	Mon, 13 Nov 2023 05:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=vrm6NELoQ7Okc8rE3d38nymyVRwIhSpcARpsKKdsUUg=;
 b=OCVSXnjRhY9lXeK3u4sC3m+g1sW1oDoGjqUdZrVIZzCwDY66wy5yxFTTH0WTQLKtHnzR
 o2KpA+3fV1ZPzIw1QhLdCtympLWkWBKCD9y5LPW5iUbd6Lo8dbOUTOg8S8T8gJDAGIKG
 XXE6d5x9A3lckbEU5IzBf4LRxUIGoM2+p4gi9Aog+oExjxTW5O3uS07Luntkjxw1Ces0
 RjXDZyiuhDgRQ0dsXeSvdHzSmRPAbcVdaUZ+EQUr1FaDSdp/PJ9WghqzYTxnlqC65WQh
 4bMN/X0f9ou7Atu7qanTBvfVL1YY7175pacvGgycSl2hlj4ilUvtTSt1ixDiFHuX6bxw Lw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ubdx103nn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 05:51:40 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AD5jGQJ018482;
	Mon, 13 Nov 2023 05:51:40 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ubdx103ne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 05:51:40 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AD4mtoC013288;
	Mon, 13 Nov 2023 05:51:39 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uamaxy70u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 05:51:39 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AD5pauo17695340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Nov 2023 05:51:36 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0D2E58060;
	Mon, 13 Nov 2023 05:51:36 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66BEF5803F;
	Mon, 13 Nov 2023 05:51:35 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.67.169.216])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Nov 2023 05:51:35 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4] powerpc/pseries/vas: Migration suspend waits for no in-progress open windows
Date: Sun, 12 Nov 2023 21:51:32 -0800
Message-Id: <20231113055132.1788613-1-haren@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7SDuBBYnw0ooTMqU8NIIbarS-l8A1G1X
X-Proofpoint-GUID: 3DGVyPdlgULKatJusTSpDWqMgPPyG0MJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-12_24,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 clxscore=1011 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311130048
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
Cc: nathanl@linux.ibm.com, Haren Myneni <haren@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The hypervisor returns migration failure if all VAS windows are not
closed. During pre-migration stage, vas_migration_handler() sets
migration_in_progress flag and closes all windows from the list.
The allocate VAS window routine checks the migration flag, setup
the window and then add it to the list. So there is possibility of
the migration handler missing the window that is still in the
process of setup.

t1: Allocate and open VAS	t2: Migration event
    window

lock vas_pseries_mutex
If migration_in_progress set
  unlock vas_pseries_mutex
  return
open window HCALL
unlock vas_pseries_mutex
Modify window HCALL		lock vas_pseries_mutex
setup window			migration_in_progress=true
				Closes all windows from
				the list
				unlock vas_pseries_mutex
lock vas_pseries_mutex		return
if nr_closed_windows == 0
  // No DLPAR CPU or migration
  add to the list
  unlock vas_pseries_mutex
  return
unlock vas_pseries_mutex
Close VAS window
// due to DLPAR CPU or migration
return -EBUSY

This patch resolves the issue with the following steps:
- Set the migration_in_progress flag without holding mutex.
- Introduce nr_open_wins_progress counter in VAS capabilities
  struct
- This counter tracks the number of open windows are still in
  progress
- The allocate setup window thread closes windows if the migration
  is set and decrements nr_open_window_progress counter
- The migration handler waits for no in-progress open windows.

Fixes: 37e6764895ef ("powerpc/pseries/vas: Add VAS migration handler")
Signed-off-by: Haren Myneni <haren@linux.ibm.com>

---
v1 -> v2:
- Do not define the migration_in_progress flag as atomic as
  suggested by Nathan

v2 -> v3:
- Use wait_event() instead of wait_event_interruptible() so that
  returns after all windows are closed as suggested by Nathan

v3 -> v4:
- remove atomic for nr_open_wins_progress counter as suggested by
  Nathan and Michael Ellerman
- Use sleep instead of wait_event_interruptible() to check
  nr_open_wins_progress counter under mutex.
---
 arch/powerpc/platforms/pseries/vas.c | 51 ++++++++++++++++++++++++----
 arch/powerpc/platforms/pseries/vas.h |  2 ++
 2 files changed, 46 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index b1f25bac280b..71d52a670d95 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -385,11 +385,15 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 	 * same fault IRQ is not freed by the OS before.
 	 */
 	mutex_lock(&vas_pseries_mutex);
-	if (migration_in_progress)
+	if (migration_in_progress) {
 		rc = -EBUSY;
-	else
+	} else {
 		rc = allocate_setup_window(txwin, (u64 *)&domain[0],
 				   cop_feat_caps->win_type);
+		if (!rc)
+			caps->nr_open_wins_progress++;
+	}
+
 	mutex_unlock(&vas_pseries_mutex);
 	if (rc)
 		goto out;
@@ -404,8 +408,17 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 		goto out_free;
 
 	txwin->win_type = cop_feat_caps->win_type;
-	mutex_lock(&vas_pseries_mutex);
+
 	/*
+	 * The migration SUSPEND thread sets migration_in_progress and
+	 * closes all open windows from the list. But the window is
+	 * added to the list after open and modify HCALLs. So possible
+	 * that migration_in_progress is set before modify HCALL which
+	 * may cause some windows are still open when the hypervisor
+	 * initiates the migration.
+	 * So checks the migration_in_progress flag again and close all
+	 * open windows.
+	 *
 	 * Possible to lose the acquired credit with DLPAR core
 	 * removal after the window is opened. So if there are any
 	 * closed windows (means with lost credits), do not give new
@@ -413,9 +426,11 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 	 * after the existing windows are reopened when credits are
 	 * available.
 	 */
-	if (!caps->nr_close_wins) {
+	mutex_lock(&vas_pseries_mutex);
+	if (!caps->nr_close_wins && !migration_in_progress) {
 		list_add(&txwin->win_list, &caps->list);
 		caps->nr_open_windows++;
+		caps->nr_open_wins_progress--;
 		mutex_unlock(&vas_pseries_mutex);
 		vas_user_win_add_mm_context(&txwin->vas_win.task_ref);
 		return &txwin->vas_win;
@@ -433,6 +448,12 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 	 */
 	free_irq_setup(txwin);
 	h_deallocate_vas_window(txwin->vas_win.winid);
+	/*
+	 * Hold mutex and reduce nr_open_wins_progress counter.
+	 */
+	mutex_lock(&vas_pseries_mutex);
+	caps->nr_open_wins_progress--;
+	mutex_unlock(&vas_pseries_mutex);
 out:
 	atomic_dec(&cop_feat_caps->nr_used_credits);
 	kfree(txwin);
@@ -937,14 +958,14 @@ int vas_migration_handler(int action)
 	struct vas_caps *vcaps;
 	int i, rc = 0;
 
+	pr_info("VAS migration event %d\n", action);
+
 	/*
 	 * NX-GZIP is not enabled. Nothing to do for migration.
 	 */
 	if (!copypaste_feat)
 		return rc;
 
-	mutex_lock(&vas_pseries_mutex);
-
 	if (action == VAS_SUSPEND)
 		migration_in_progress = true;
 	else
@@ -990,12 +1011,27 @@ int vas_migration_handler(int action)
 
 		switch (action) {
 		case VAS_SUSPEND:
+			mutex_lock(&vas_pseries_mutex);
 			rc = reconfig_close_windows(vcaps, vcaps->nr_open_windows,
 							true);
+			/*
+			 * Windows are included in the list after successful
+			 * open. So wait for closing these in-progress open
+			 * windows in vas_allocate_window() which will be
+			 * done if the migration_in_progress is set.
+			 */
+			while (vcaps->nr_open_wins_progress) {
+				mutex_unlock(&vas_pseries_mutex);
+				msleep(10);
+				mutex_lock(&vas_pseries_mutex);
+			}
+			mutex_unlock(&vas_pseries_mutex);
 			break;
 		case VAS_RESUME:
+			mutex_lock(&vas_pseries_mutex);
 			atomic_set(&caps->nr_total_credits, new_nr_creds);
 			rc = reconfig_open_windows(vcaps, new_nr_creds, true);
+			mutex_unlock(&vas_pseries_mutex);
 			break;
 		default:
 			/* should not happen */
@@ -1011,8 +1047,9 @@ int vas_migration_handler(int action)
 			goto out;
 	}
 
+	pr_info("VAS migration event (%d) successful\n", action);
+
 out:
-	mutex_unlock(&vas_pseries_mutex);
 	return rc;
 }
 
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
index 7115043ec488..45567cd13178 100644
--- a/arch/powerpc/platforms/pseries/vas.h
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -91,6 +91,8 @@ struct vas_cop_feat_caps {
 struct vas_caps {
 	struct vas_cop_feat_caps caps;
 	struct list_head list;	/* List of open windows */
+	int nr_open_wins_progress;	/* Number of open windows in */
+					/* progress. Used in migration */
 	int nr_close_wins;	/* closed windows in the hypervisor for DLPAR */
 	int nr_open_windows;	/* Number of successful open windows */
 	u8 feat;		/* Feature type */
-- 
2.26.3

