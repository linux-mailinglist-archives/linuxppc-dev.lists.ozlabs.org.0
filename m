Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A82461D17
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 18:53:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2tHK18dgz3f2S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 04:53:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jLCx3GbK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jLCx3GbK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2tF12rr8z3cDY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 04:51:01 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHlxF4030194; 
 Mon, 29 Nov 2021 17:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=JK0dmALoXEWOI0h8DBqVrzXlzqk+nFZG2q+3Sv3sjdE=;
 b=jLCx3GbKV3H/B3pIU8L66cypWY7sjhs6qwlA4QUsTYSUtK0qt5sd1wPezzm1f8/un3g+
 k17S2ifFJUdn4TVmRVxEE5p9bwVwali7tERwClqF5FRjFdqaJalB5OpkctrIrUkUuUkc
 1Hd7h399CoFf6mvY6fSJwMwj2KmPQbsQ+xd/vICFONnhO7cEqTzpkmWijPQKB2cIOsK0
 dZ7N4PhwM2WWrb9IxkCB1FPbFQwUCFS/8ppSMElLzMLToqX6ejY//JGqaHOYNWe9YN3D
 7RKj0YKFpv9abI7zzBgl1n839ZtaLdVJY1+9xgVcT9QHUtzHL8QaOhj4E9qQAf+gPcp9 aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cn3jrr18h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:50:55 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ATHoawN003727;
 Mon, 29 Nov 2021 17:50:55 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cn3jrr188-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:50:55 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHhvuS030239;
 Mon, 29 Nov 2021 17:50:54 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 3ckcaahpdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:50:54 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ATHorGK26804492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 17:50:53 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CC2CAC067;
 Mon, 29 Nov 2021 17:50:53 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97794AC069;
 Mon, 29 Nov 2021 17:50:52 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.7.253])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 29 Nov 2021 17:50:52 +0000 (GMT)
Message-ID: <7e569fb62b3debfc8a052ef8f88c540343685855.camel@linux.ibm.com>
Subject: [PATCH 05/10] powerpc/pseries/vas: Close windows with DLPAR core
 removal
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Mon, 29 Nov 2021 09:50:51 -0800
In-Reply-To: <a2187018b4e030fe6c7e408b3a73c37c85472e10.camel@linux.ibm.com>
References: <a2187018b4e030fe6c7e408b3a73c37c85472e10.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HgrMXA4pVLnB7FtZq3EYBVOfRT8dO497
X-Proofpoint-GUID: Tss67CR3RpJm2cHNxdEYaAesM0NWiqij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_10,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111290082
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


The hypervisor reduces the available credits if the core is removed
from the LPAR. So there is possibility of using excessive credits
(windows) in the LPAR and the hypervisor expects the system to close
the excessive windows. Even though the user space can continue to use
these windows to send compression requests to NX, the hypervisor expects
the LPAR to reduce these windows usage so that NX load can be equally
distributed across all LPARs in the system.

When the DLPAR notifier is received, get the new VAS capabilities from
the hypervisor and close the excessive windows in the hypervisor. Also
the kernel unmaps the paste address so that the user space receives paste
failure until these windows are active with the later DLPAR (core add).

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/vas.h          |  1 +
 arch/powerpc/platforms/book3s/vas-api.c |  2 +
 arch/powerpc/platforms/pseries/vas.c    | 93 ++++++++++++++++++++++++-
 3 files changed, 94 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index 43cea69d1af1..72d1df038b4b 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -73,6 +73,7 @@ struct vas_user_win_ref {
 	struct mm_struct *mm;	/* Linux process mm_struct */
 	struct mutex mmap_mutex;	/* protects paste address mmap() */
 					/* with DLPAR close/open windows */
+	struct vm_area_struct *vma;	/* Save VMA and used in DLPAR ops */
 };
 
 /*
diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index 2b0ced611f32..a63fd48e34a7 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -399,6 +399,8 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 	pr_devel("%s(): paste addr %llx at %lx, rc %d\n", __func__,
 			paste_addr, vma->vm_start, rc);
 
+	txwin->task_ref.vma = vma;
+
 	return rc;
 }
 
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index ace8ee7a99e6..ed458620f007 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -431,14 +431,27 @@ static int vas_deallocate_window(struct vas_window *vwin)
 
 	caps = &vascaps[win->win_type].caps;
 	mutex_lock(&vas_pseries_mutex);
+	/*
+	 * VAS window is already closed in the hypervisor when
+	 * lost the credit. So just remove the entry from
+	 * the list, remove task references and free vas_window
+	 * struct.
+	 */
+	if (win->vas_win.status == VAS_WIN_NO_CRED_CLOSE) {
+		vascaps[win->win_type].close_wins--;
+		goto out;
+	}
+
 	rc = deallocate_free_window(win);
 	if (rc) {
 		mutex_unlock(&vas_pseries_mutex);
 		return rc;
 	}
 
-	list_del(&win->win_list);
 	atomic_dec(&caps->used_creds);
+
+out:
+	list_del(&win->win_list);
 	mutex_unlock(&vas_pseries_mutex);
 
 	put_vas_user_win_ref(&vwin->task_ref);
@@ -617,6 +630,74 @@ static int reconfig_open_windows(struct vas_caps *vcaps, int creds)
 	return rc;
 }
 
+/*
+ * The hypervisor reduces the available credits if the LPAR lost core. It
+ * means the excessive windows should not be active and the user space
+ * should not be using these windows to send compression requests to NX.
+ * So the kernel closes the excessive windows and unmap the paste address
+ * such that the user space receives paste instruction failure. Then up to
+ * the user space to fall back to SW compression and manage with the
+ * existing windows.
+ */
+static int reconfig_close_windows(struct vas_caps *vcap, int excess_creds)
+{
+	struct vas_cop_feat_caps *caps =  &vcap->caps;
+	struct vm_area_struct *vma;
+	struct pseries_vas_window *win;
+	struct vas_user_win_ref *task_ref;
+	int rc = 0;
+
+	list_for_each_entry(win, &vcap->list, win_list) {
+		/*
+		 * This window is already closed due to lost credit
+		 * before. Go for next window.
+		 */
+		if (win->vas_win.status == VAS_WIN_NO_CRED_CLOSE)
+			continue;
+
+		task_ref = &win->vas_win.task_ref;
+		mutex_lock(&task_ref->mmap_mutex);
+		vma = task_ref->vma;
+		/*
+		 * Number of available credits are reduced, So select
+		 * and close windows.
+		 */
+		win->vas_win.status = VAS_WIN_NO_CRED_CLOSE;
+
+		mmap_write_lock(task_ref->mm);
+		/*
+		 * vma is set in the original mapping. But this mapping
+		 * is done with mmap() after the window is opened with ioctl.
+		 * so we may not see the original mapping if the core remove
+		 * is done before the original mmap() and after the ioctl.
+		 */
+		if (vma)
+			zap_page_range(vma, vma->vm_start,
+					vma->vm_end - vma->vm_start);
+
+		mmap_write_unlock(task_ref->mm);
+		mutex_unlock(&task_ref->mmap_mutex);
+		/*
+		 * Close VAS window in the hypervisor, but do not
+		 * free vas_window struct since it may be reused
+		 * when the credit is available later (DLPAR with
+		 * adding cores). This struct will be used
+		 * later when the process issued with close(FD).
+		 */
+		rc = deallocate_free_window(win);
+		if (rc)
+			return rc;
+
+		atomic_dec(&caps->used_creds);
+		vcap->close_wins++;
+
+		if (!--excess_creds)
+			break;
+	}
+
+	return 0;
+}
+
 /*
  * Get new VAS capabilities when the core add/removal configuration
  * changes. Reconfig window configurations based on the credits
@@ -624,7 +705,7 @@ static int reconfig_open_windows(struct vas_caps *vcaps, int creds)
  */
 static int vas_reconfig_capabilties(u8 type)
 {
-	int lpar_creds, avail_creds;
+	int lpar_creds, avail_creds, excess_creds;
 	struct hv_vas_cop_feat_caps *hv_caps;
 	struct vas_cop_feat_caps *caps;
 	struct vas_caps *vcaps;
@@ -667,6 +748,14 @@ static int vas_reconfig_capabilties(u8 type)
 		avail_creds = lpar_creds -
 				atomic_read(&caps->used_creds);
 		rc = reconfig_open_windows(vcaps, avail_creds);
+	} else if (atomic_read(&caps->used_creds) > lpar_creds) {
+		/*
+		 * # open windows is more than new LPAR available
+		 * credits. So close the excessive windows.
+		 */
+		excess_creds = atomic_read(&caps->used_creds) -
+					lpar_creds;
+		rc = reconfig_close_windows(vcaps, excess_creds);
 	}
 
 out:
-- 
2.27.0


