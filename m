Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE294BCA94
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 21:06:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K1KMc1jwZz3ddr
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Feb 2022 07:06:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q8FyQxw6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=q8FyQxw6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1KLl2cYwz3cZ3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 07:05:51 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21JJAiue032475; 
 Sat, 19 Feb 2022 20:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=nEfA9KOnig6fclfoGtJsxNsIqPcM+jEt7Y9wCI5INFc=;
 b=q8FyQxw62hxua0xxwhvqM7d7TMR0196mM89uhSMOhAKii6BLhbypxusS4lWJNb220s9+
 EGWwE9nvRejiOxJLY8q6TwsR8cwsTCfexJhoaMsR/i34y3E6JM4WHK244fFOsKqsLfY/
 16Qr6MPvVLhsWh6ByNcGexE1vcmGYjX4L4aDoC5MO7HS2QDCucUx+JwKiMti6NVBv584
 uM/7Ehp4ZeCuPtFU0IhW22VSvc46HbMUNrmPp4JdMVVsgrpIcepXtyqHOcbJtfjKwPCW
 lTw1RiXKnfQgAOD4Sq5+0I26IGwRrFfkiirtFmYYeC8MRViWPK08MZStNfe79z5Ie2Av xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eb5pmh4h4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:05:46 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21JJtYWi026043;
 Sat, 19 Feb 2022 20:05:45 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eb5pmh4gr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:05:45 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21JK47AD018065;
 Sat, 19 Feb 2022 20:05:45 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 3ear68p5pd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:05:45 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21JK5gnb14877088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Feb 2022 20:05:42 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2504136060;
 Sat, 19 Feb 2022 20:05:42 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 937CA136055;
 Sat, 19 Feb 2022 20:05:41 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 19 Feb 2022 20:05:41 +0000 (GMT)
Message-ID: <fb9f17bd5ee7a4df453138769b709c60cdc42641.camel@linux.ibm.com>
Subject: [PATCH v3 2/4] powerpc/pseries/vas: Modify reconfig open/close
 functions for migration
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sat, 19 Feb 2022 12:05:39 -0800
In-Reply-To: <4a23d5ec655fd00da97b0b0b46174a3a3894bfb0.camel@linux.ibm.com>
References: <4a23d5ec655fd00da97b0b0b46174a3a3894bfb0.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 65DpNdot35l1WFslgzHiYT3Y0Jq19pfS
X-Proofpoint-GUID: _kcMlMpW7OHtFcQpyPDkd5DJnqMerbYE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-19_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202190130
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


VAS is a hardware engine stays on the chip. So when the partition
migrates, all VAS windows on the source system have to be closed
and reopen them on the destination after migration.

This patch make changes to the current reconfig_open/close_windows
functions to support migration:
- Set VAS_WIN_MIGRATE_CLOSE to the window status when closes and
  reopen windows with the same status during resume.
- Continue to close all windows even if deallocate HCALL failed
  (should not happen) since no way to stop migration with the
  current LPM implementation.
- If the DLPAR CPU event happens while migration is in progress,
  set VAS_WIN_NO_CRED_CLOSE to the window status. Close window
  happens with the first event (migration or DLPAR) and Reopen
  window happens only with the last event (migration or DLPAR).

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/vas.h       |  2 +
 arch/powerpc/platforms/pseries/vas.c | 88 ++++++++++++++++++++++------
 2 files changed, 73 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index 6baf7b9ffed4..83afcb6c194b 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -36,6 +36,8 @@
 					/* vas mmap() */
 /* Window is closed in the hypervisor due to lost credit */
 #define VAS_WIN_NO_CRED_CLOSE	0x00000001
+/* Window is closed due to migration */
+#define VAS_WIN_MIGRATE_CLOSE	0x00000002
 
 /*
  * Get/Set bit fields
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 3bb219f54806..fbcf311da0ec 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -457,11 +457,12 @@ static int vas_deallocate_window(struct vas_window *vwin)
 	mutex_lock(&vas_pseries_mutex);
 	/*
 	 * VAS window is already closed in the hypervisor when
-	 * lost the credit. So just remove the entry from
-	 * the list, remove task references and free vas_window
+	 * lost the credit or with migration. So just remove the entry
+	 * from the list, remove task references and free vas_window
 	 * struct.
 	 */
-	if (win->vas_win.status & VAS_WIN_NO_CRED_CLOSE) {
+	if (!(win->vas_win.status & VAS_WIN_NO_CRED_CLOSE) &&
+		!(win->vas_win.status & VAS_WIN_MIGRATE_CLOSE)) {
 		rc = deallocate_free_window(win);
 		if (rc) {
 			mutex_unlock(&vas_pseries_mutex);
@@ -578,12 +579,14 @@ static int __init get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
  * by setting the remapping to new paste address if the window is
  * active.
  */
-static int reconfig_open_windows(struct vas_caps *vcaps, int creds)
+static int reconfig_open_windows(struct vas_caps *vcaps, int creds,
+				 bool migrate)
 {
 	long domain[PLPAR_HCALL9_BUFSIZE] = {VAS_DEFAULT_DOMAIN_ID};
 	struct vas_cop_feat_caps *caps = &vcaps->caps;
 	struct pseries_vas_window *win = NULL, *tmp;
 	int rc, mv_ents = 0;
+	int flag;
 
 	/*
 	 * Nothing to do if there are no closed windows.
@@ -602,8 +605,10 @@ static int reconfig_open_windows(struct vas_caps *vcaps, int creds)
 	 * (dedicated). If 1 core is added, this LPAR can have 20 more
 	 * credits. It means the kernel can reopen 20 windows. So move
 	 * 20 entries in the VAS windows lost and reopen next 20 windows.
+	 * For partition migration, reopen all windows that are closed
+	 * during resume.
 	 */
-	if (vcaps->nr_close_wins > creds)
+	if ((vcaps->nr_close_wins > creds) && !migrate)
 		mv_ents = vcaps->nr_close_wins - creds;
 
 	list_for_each_entry_safe(win, tmp, &vcaps->list, win_list) {
@@ -613,12 +618,35 @@ static int reconfig_open_windows(struct vas_caps *vcaps, int creds)
 		mv_ents--;
 	}
 
+	/*
+	 * Open windows if they are closed only with migration or
+	 * DLPAR (lost credit) before.
+	 */
+	if (migrate)
+		flag = VAS_WIN_MIGRATE_CLOSE;
+	else
+		flag = VAS_WIN_NO_CRED_CLOSE;
+
 	list_for_each_entry_safe_from(win, tmp, &vcaps->list, win_list) {
+		/*
+		 * This window is closed with DLPAR and migration events.
+		 * So reopen the window with the last event.
+		 * The user space is not suspended with the current
+		 * migration notifier. So the user space can issue DLPAR
+		 * CPU hotplug while migration in progress. In this case
+		 * this window will be opened with the last event.
+		 */
+		if ((win->vas_win.status & VAS_WIN_NO_CRED_CLOSE) &&
+			(win->vas_win.status & VAS_WIN_MIGRATE_CLOSE)) {
+			win->vas_win.status &= ~flag;
+			continue;
+		}
+
 		/*
 		 * Nothing to do on this window if it is not closed
-		 * with VAS_WIN_NO_CRED_CLOSE
+		 * with this flag
 		 */
-		if (!(win->vas_win.status & VAS_WIN_NO_CRED_CLOSE))
+		if (!(win->vas_win.status & flag))
 			continue;
 
 		rc = allocate_setup_window(win, (u64 *)&domain[0],
@@ -634,7 +662,7 @@ static int reconfig_open_windows(struct vas_caps *vcaps, int creds)
 		/*
 		 * Set window status to active
 		 */
-		win->vas_win.status &= ~VAS_WIN_NO_CRED_CLOSE;
+		win->vas_win.status &= ~flag;
 		mutex_unlock(&win->vas_win.task_ref.mmap_mutex);
 		win->win_type = caps->win_type;
 		if (!--vcaps->nr_close_wins)
@@ -661,20 +689,32 @@ static int reconfig_open_windows(struct vas_caps *vcaps, int creds)
  * the user space to fall back to SW compression and manage with the
  * existing windows.
  */
-static int reconfig_close_windows(struct vas_caps *vcap, int excess_creds)
+static int reconfig_close_windows(struct vas_caps *vcap, int excess_creds,
+									bool migrate)
 {
 	struct pseries_vas_window *win, *tmp;
 	struct vas_user_win_ref *task_ref;
 	struct vm_area_struct *vma;
-	int rc = 0;
+	int rc = 0, flag;
+
+	if (migrate)
+		flag = VAS_WIN_MIGRATE_CLOSE;
+	else
+		flag = VAS_WIN_NO_CRED_CLOSE;
 
 	list_for_each_entry_safe(win, tmp, &vcap->list, win_list) {
 		/*
 		 * This window is already closed due to lost credit
-		 * before. Go for next window.
+		 * or for migration before. Go for next window.
+		 * For migration, nothing to do since this window
+		 * closed for DLPAR and will be reopened even on
+		 * the destination system with other DLPAR operation.
 		 */
-		if (win->vas_win.status & VAS_WIN_NO_CRED_CLOSE)
+		if ((win->vas_win.status & VAS_WIN_MIGRATE_CLOSE) ||
+			(win->vas_win.status & VAS_WIN_NO_CRED_CLOSE)) {
+			win->vas_win.status |= flag;
 			continue;
+		}
 
 		task_ref = &win->vas_win.task_ref;
 		mutex_lock(&task_ref->mmap_mutex);
@@ -683,7 +723,7 @@ static int reconfig_close_windows(struct vas_caps *vcap, int excess_creds)
 		 * Number of available credits are reduced, So select
 		 * and close windows.
 		 */
-		win->vas_win.status |= VAS_WIN_NO_CRED_CLOSE;
+		win->vas_win.status |= flag;
 
 		mmap_write_lock(task_ref->mm);
 		/*
@@ -706,12 +746,24 @@ static int reconfig_close_windows(struct vas_caps *vcap, int excess_creds)
 		 * later when the process issued with close(FD).
 		 */
 		rc = deallocate_free_window(win);
-		if (rc)
+		/*
+		 * This failure is from the hypervisor.
+		 * No way to stop migration for these failures.
+		 * So ignore error and continue closing other windows.
+		 */
+		if (rc && !migrate)
 			return rc;
 
 		vcap->nr_close_wins++;
 
-		if (!--excess_creds)
+		/*
+		 * For migration, do not depend on lpar_creds in case if
+		 * mismatch with the hypervisor value (should not happen).
+		 * So close all active windows in the list and will be
+		 * reopened windows based on the new lpar_creds on the
+		 * destination system during resume.
+		 */
+		if (!migrate && !--excess_creds)
 			break;
 	}
 
@@ -761,7 +813,8 @@ int vas_reconfig_capabilties(u8 type)
 		 * target, reopen windows if they are closed due to
 		 * the previous DLPAR (core removal).
 		 */
-		rc = reconfig_open_windows(vcaps, new_nr_creds - old_nr_creds);
+		rc = reconfig_open_windows(vcaps, new_nr_creds - old_nr_creds,
+					   false);
 	} else {
 		/*
 		 * # active windows is more than new LPAR available
@@ -771,7 +824,8 @@ int vas_reconfig_capabilties(u8 type)
 		nr_active_wins = vcaps->nr_open_windows - vcaps->nr_close_wins;
 		if (nr_active_wins > new_nr_creds)
 			rc = reconfig_close_windows(vcaps,
-					nr_active_wins - new_nr_creds);
+					nr_active_wins - new_nr_creds,
+					false);
 	}
 
 out:
-- 
2.27.0


