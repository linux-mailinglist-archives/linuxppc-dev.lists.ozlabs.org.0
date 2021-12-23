Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E454747DC02
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 01:29:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JK9zd6KPLz3cM5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 11:29:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DrcoXmo5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DrcoXmo5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JK9yq4MzPz3bnq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Dec 2021 11:28:19 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BN0C5dk019808; 
 Thu, 23 Dec 2021 00:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=+6aCx15SxbD/ETSfFIyfUrZzq+U/1NGkZIimTGrVTp0=;
 b=DrcoXmo5TJzs+SxqWNM+g1i198wDaVNb6DyI0mtceTvXTh5ggD9Gek8Qgb96Y/3YgnqE
 qiqqhJaFYsE++a7ORFJHO+00wSg/hWMmJiKPFD+eh9CIXCFn2BCdjhdvbHn5sPT2YwGY
 IwTylLucaO6pG/177GYxoZvw5R0+kN8nzHnse/oRUWFddmuaTMa5SFiqqrxpXnTowvNr
 kysnC607RsKvTCOFTYHcxFdXnD2KQrWh1xY/5wB06Q3odSeWWkzLnqe49RrG5+0ai5vP
 C/HY1/brTvH3zqzomW55/r8XF+xsXhV9S3sklHrwBC/8qGTW4whXSERcWlCtlw2VsHFl Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d4ebsr6y7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:28:14 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BN0POF6030315;
 Thu, 23 Dec 2021 00:28:14 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d4ebsr6xs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:28:14 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BN0C7HY015600;
 Thu, 23 Dec 2021 00:28:13 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 3d179b04jf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:28:13 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BN0SCQ329229524
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Dec 2021 00:28:12 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACE0DB205F;
 Thu, 23 Dec 2021 00:28:12 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 146F5B2064;
 Thu, 23 Dec 2021 00:28:12 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.90.83])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 23 Dec 2021 00:28:11 +0000 (GMT)
Message-ID: <18702b449ca7b15c963128f83d1c4092cff22ef1.camel@linux.ibm.com>
Subject: [PATCH v2 05/10] powerpc/pseries/vas: Close windows with DLPAR core
 removal
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Wed, 22 Dec 2021 16:28:09 -0800
In-Reply-To: <9d1730d5e0daf39ef17196b4699294dc2ccf4a63.camel@linux.ibm.com>
References: <9d1730d5e0daf39ef17196b4699294dc2ccf4a63.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yQ57ddSWPclrJp5m0JFa-GdCrhmvNb7L
X-Proofpoint-GUID: rOeRhxUsqKcYluFx-Y_YchIDw0IeRC-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_09,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112220124
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
 arch/powerpc/include/asm/vas.h          |   1 +
 arch/powerpc/platforms/book3s/vas-api.c |   2 +
 arch/powerpc/platforms/pseries/vas.c    | 117 ++++++++++++++++++++++--
 arch/powerpc/platforms/pseries/vas.h    |   1 +
 4 files changed, 112 insertions(+), 9 deletions(-)

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
index 0666d3630e6b..c7dec3adc3af 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -363,13 +363,28 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 	if (rc)
 		goto out_free;
 
-	vas_user_win_add_mm_context(&txwin->vas_win.task_ref);
 	txwin->win_type = cop_feat_caps->win_type;
 	mutex_lock(&vas_pseries_mutex);
-	list_add(&txwin->win_list, &caps->list);
+	/*
+	 * Possible to loose the acquired credit with DLPAR core
+	 * removal after the window is opened. So if there are any
+	 * closed windows (means with lost credits), do not give new
+	 * window to user space. New windows will be opened only
+	 * after the existing windows are reopened when credits are
+	 * available.
+	 */
+	if (!caps->close_wins) {
+		list_add(&txwin->win_list, &caps->list);
+		caps->num_wins++;
+		mutex_unlock(&vas_pseries_mutex);
+		vas_user_win_add_mm_context(&txwin->vas_win.task_ref);
+		return &txwin->vas_win;
+	}
 	mutex_unlock(&vas_pseries_mutex);
 
-	return &txwin->vas_win;
+	put_vas_user_win_ref(&txwin->vas_win.task_ref);
+	rc = -EBUSY;
+	pr_err("No credit is available to allocate window\n");
 
 out_free:
 	/*
@@ -432,14 +447,24 @@ static int vas_deallocate_window(struct vas_window *vwin)
 
 	caps = &vascaps[win->win_type].caps;
 	mutex_lock(&vas_pseries_mutex);
-	rc = deallocate_free_window(win);
-	if (rc) {
-		mutex_unlock(&vas_pseries_mutex);
-		return rc;
-	}
+	/*
+	 * VAS window is already closed in the hypervisor when
+	 * lost the credit. So just remove the entry from
+	 * the list, remove task references and free vas_window
+	 * struct.
+	 */
+	if (win->vas_win.status != VAS_WIN_NO_CRED_CLOSE) {
+		rc = deallocate_free_window(win);
+		if (rc) {
+			mutex_unlock(&vas_pseries_mutex);
+			return rc;
+		}
+	} else
+		vascaps[win->win_type].close_wins--;
 
 	list_del(&win->win_list);
 	atomic_dec(&caps->used_creds);
+	vascaps[win->win_type].num_wins--;
 	mutex_unlock(&vas_pseries_mutex);
 
 	put_vas_user_win_ref(&vwin->task_ref);
@@ -614,6 +639,72 @@ static int reconfig_open_windows(struct vas_caps *vcaps, int creds)
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
+	struct pseries_vas_window *win, *tmp;
+	struct vas_user_win_ref *task_ref;
+	struct vm_area_struct *vma;
+	int rc = 0;
+
+	list_for_each_entry_safe(win, tmp, &vcap->list, win_list) {
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
@@ -625,7 +716,7 @@ static int vas_reconfig_capabilties(u8 type)
 	struct vas_cop_feat_caps *caps;
 	int lpar_creds, new_creds;
 	struct vas_caps *vcaps;
-	int rc = 0;
+	int rc = 0, active_wins;
 
 	if (type >= VAS_MAX_FEAT_TYPE) {
 		pr_err("Invalid credit type %d\n", type);
@@ -663,6 +754,14 @@ static int vas_reconfig_capabilties(u8 type)
 		 * the previous DLPAR (core removal).
 		 */
 		rc = reconfig_open_windows(vcaps, new_creds - lpar_creds);
+	} else {
+		/*
+		 * # active windows is more than new LPAR available
+		 * credits. So close the excessive windows.
+		 */
+		active_wins = vcaps->num_wins - vcaps->close_wins;
+		if (active_wins > new_creds)
+			rc = reconfig_close_windows(vcaps, active_wins - new_creds);
 	}
 
 out:
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
index 45b62565955b..8ce9b84693e8 100644
--- a/arch/powerpc/platforms/pseries/vas.h
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -79,6 +79,7 @@ struct vas_caps {
 	struct vas_cop_feat_caps caps;
 	struct list_head list;	/* List of open windows */
 	int close_wins;		/* closed windows in the hypervisor for DLPAR */
+	int num_wins;		/* Number of windows opened */
 	u8 feat;		/* Feature type */
 };
 
-- 
2.27.0


