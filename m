Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F8447FC0C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 11:58:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMvmX5fRqz3c5S
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 21:58:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MTai1mZq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MTai1mZq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMvln3jn8z2xWd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 21:58:13 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BRAgFU7028115; 
 Mon, 27 Dec 2021 10:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=k/Wr0fgYXRtSSEw6HPcmWAXmplQt4q3EUjqoFfFGUbQ=;
 b=MTai1mZq3Le5P8TlmRMJFakL9+GIZnLj3SpI9RJSxwPB30uTeMtoRNpbe7iUT2o5thfT
 +++Vrc7w4mR/ABoRPiKOnu0mW8bkTW1VEXBNcv8WkaO6J4ioqUT3UYBMIwq5CA99ljhm
 2jZHcp2gzazBDOtWYuE8EtXSpifDOyFWsG22DQuBxnZIGLoH6Pf0RzXqtVxtZxltMiju
 pkxjnvLXmxIvCj7A6i/2XpIcjW8FdEc4Od+BVU2WW0MpPtySGNm6JVnOM40xeC0t46H8
 d4k7YNMXxzhCMxNGA1ZxaabY7gAM0eS/fsKSed5z88d4NIkN64kxg68EO0jlxeol7DVQ IA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7by8078d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 10:58:09 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BRAnQOp016425;
 Mon, 27 Dec 2021 10:58:08 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7by80788-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 10:58:08 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BRAExqg013669;
 Mon, 27 Dec 2021 10:58:08 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 3d5tx9p1cw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 10:58:08 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BRAw5A132768368
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 10:58:05 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5486CC6069;
 Mon, 27 Dec 2021 10:58:05 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D8BFC6057;
 Mon, 27 Dec 2021 10:58:04 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.90.83])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 27 Dec 2021 10:58:04 +0000 (GMT)
Message-ID: <796dcf1c66fdbef0c7230bc64975a5eec6513d29.camel@linux.ibm.com>
Subject: [RFC PATCH 1/3] powerpc/pseries/vas: Modify reconfig open/close
 functions for migration
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Mon, 27 Dec 2021 02:58:02 -0800
In-Reply-To: <af4574e7553a632884a2f00fcb96bd82fa063fe9.camel@linux.ibm.com>
References: <af4574e7553a632884a2f00fcb96bd82fa063fe9.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eKayUYXyrtSAaNt-AVnVPwLxprx4kDs5
X-Proofpoint-GUID: chteohAJi0Z4ATncnIO2ZhOQI3gri5PO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-27_02,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112270052
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
- Sets the window status to VAS_WIN_MIGRATE_CLOSE when closes and
  reopen windows with the same status during resume.
- Continue to close all windows even if deallocate HCALL failed
  (should not happen) since no way to stop migration with the
  current LPM implementation.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/vas.h       |  2 +
 arch/powerpc/platforms/pseries/vas.c | 63 ++++++++++++++++++++++------
 2 files changed, 52 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index 72d1df038b4b..8b28cd7aaedc 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -41,6 +41,8 @@
 #define VAS_WIN_NO_CRED_CLOSE	0x4	/* Linux specific status when */
 					/* window is closed due to lost */
 					/* credit */
+#define VAS_WIN_MIGRATE_CLOSE	0x5	/* Linux status when window is */
+					/* closed due to migration */
 /*
  * Get/Set bit fields
  */
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 169f0cccb166..b9d1c0bac624 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -449,11 +449,12 @@ static int vas_deallocate_window(struct vas_window *vwin)
 	mutex_lock(&vas_pseries_mutex);
 	/*
 	 * VAS window is already closed in the hypervisor when
-	 * lost the credit. So just remove the entry from
-	 * the list, remove task references and free vas_window
+	 * lost the credit or with migration. So just remove the entry
+	 * from the list, remove task references and free vas_window
 	 * struct.
 	 */
-	if (win->vas_win.status != VAS_WIN_NO_CRED_CLOSE) {
+	if ((win->vas_win.status != VAS_WIN_NO_CRED_CLOSE) &&
+		(win->vas_win.status != VAS_WIN_MIGRATE_CLOSE)) {
 		rc = deallocate_free_window(win);
 		if (rc) {
 			mutex_unlock(&vas_pseries_mutex);
@@ -570,12 +571,14 @@ static int get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
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
+	int status;
 
 	/*
 	 * Nothing to do if there are no closed windows.
@@ -594,8 +597,10 @@ static int reconfig_open_windows(struct vas_caps *vcaps, int creds)
 	 * (dedicated). If 1 core is added, this LPAR can have 20 more
 	 * credits. It means the kernel can reopen 20 windows. So move
 	 * 20 entries in the VAS windows lost and reopen next 20 windows.
+	 * For partition migration, reopen all windows that are closed
+	 * during resume.
 	 */
-	if (vcaps->close_wins > creds)
+	if ((vcaps->close_wins > creds) && !migrate)
 		mv_ents = vcaps->close_wins - creds;
 
 	list_for_each_entry_safe(win, tmp, &vcaps->list, win_list) {
@@ -605,11 +610,20 @@ static int reconfig_open_windows(struct vas_caps *vcaps, int creds)
 		mv_ents--;
 	}
 
+	/*
+	 * Open windows if they are closed only with migration or
+	 * DLPAR (lost credit) before.
+	 */
+	if (migrate)
+		status = VAS_WIN_MIGRATE_CLOSE;
+	else
+		status = VAS_WIN_NO_CRED_CLOSE;
+
 	list_for_each_entry_safe_from(win, tmp, &vcaps->list, win_list) {
 		/*
 		 * Nothing to do on this window if it is active.
 		 */
-		if (win->vas_win.status != VAS_WIN_NO_CRED_CLOSE)
+		if (win->vas_win.status != status)
 			continue;
 
 		rc = allocate_setup_window(win, (u64 *)&domain[0],
@@ -652,17 +666,26 @@ static int reconfig_open_windows(struct vas_caps *vcaps, int creds)
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
+	int rc = 0, status;
+
+	if (migrate)
+		status = VAS_WIN_MIGRATE_CLOSE;
+	else
+		status = VAS_WIN_NO_CRED_CLOSE;
 
 	list_for_each_entry_safe(win, tmp, &vcap->list, win_list) {
 		/*
 		 * This window is already closed due to lost credit
 		 * before. Go for next window.
+		 * For migration, nothing to do since this window
+		 * closed for DLPAR and will be reopened even on
+		 * the destination system with other DLPAR operation.
 		 */
 		if (win->vas_win.status == VAS_WIN_NO_CRED_CLOSE)
 			continue;
@@ -674,7 +697,7 @@ static int reconfig_close_windows(struct vas_caps *vcap, int excess_creds)
 		 * Number of available credits are reduced, So select
 		 * and close windows.
 		 */
-		win->vas_win.status = VAS_WIN_NO_CRED_CLOSE;
+		win->vas_win.status = status;
 
 		mmap_write_lock(task_ref->mm);
 		/*
@@ -697,12 +720,24 @@ static int reconfig_close_windows(struct vas_caps *vcap, int excess_creds)
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
 
 		vcap->close_wins++;
 
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
 
@@ -757,7 +792,8 @@ int vas_reconfig_capabilties(u8 type)
 		 * target, reopen windows if they are closed due to
 		 * the previous DLPAR (core removal).
 		 */
-		rc = reconfig_open_windows(vcaps, new_creds - lpar_creds);
+		rc = reconfig_open_windows(vcaps, new_creds - lpar_creds,
+									false);
 	} else {
 		/*
 		 * # active windows is more than new LPAR available
@@ -765,7 +801,8 @@ int vas_reconfig_capabilties(u8 type)
 		 */
 		active_wins = vcaps->num_wins - vcaps->close_wins;
 		if (active_wins > new_creds)
-			rc = reconfig_close_windows(vcaps, active_wins - new_creds);
+			rc = reconfig_close_windows(vcaps, active_wins - new_creds,
+										false);
 	}
 
 out:
-- 
2.27.0


