Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEFA49661B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 20:58:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgVYM5hqlz3cZB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 06:58:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U1D/9qeQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=U1D/9qeQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgVXd2nwTz2xfy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 06:57:37 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20LHBfHl034218; 
 Fri, 21 Jan 2022 19:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=38ydh1IbubupXfwLId0erbZRdMuCHokr8Qa8KgY1K3U=;
 b=U1D/9qeQigwufHeO400mt0l8Dna1uRarxDOMINCZMDdFriZH8BI3ip0xwp8nXSl4lrKp
 COmvBLw8Zx+8qfriRlL9kwhYaJmotLIjRLXMhhOX6G7Ui5HTMC6KCXi98+PCijkJiO/f
 iPXueV0nPgX4t81+xkqMxMgaiWNFL/bRBztwxCYrSdkunDNmHX5wMi/F8ZkClc24wqPQ
 qCIRSD30LlG7jtOyTmMHNBt5pxd2wZrGC4H0j02+QFxhDrCP6xfS8KSGar3t+HnsmJtE
 OZHe/PkZCx/b0FH3OjMOy1MesdnXbJKjL7Y/J9GDv2xeL7LDPETk2AvzW710chtdwI+G rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr10xb6cs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:57:33 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20LJWAA6015277;
 Fri, 21 Jan 2022 19:57:32 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr10xb6cb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:57:32 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20LJqHQb009205;
 Fri, 21 Jan 2022 19:57:31 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 3dr1umhnxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:57:31 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20LJvUVn20644110
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jan 2022 19:57:30 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E641CA03A;
 Fri, 21 Jan 2022 19:57:30 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD06ECA028;
 Fri, 21 Jan 2022 19:57:29 +0000 (GMT)
Received: from sig-9-77-130-163.ibm.com (unknown [9.77.130.163])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 21 Jan 2022 19:57:29 +0000 (GMT)
Message-ID: <5bf38aba31d340f7a4a662f82746b1784891673b.camel@linux.ibm.com>
Subject: [PATCH v3 05/10] powerpc/pseries/vas: Close windows with DLPAR core
 removal
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Fri, 21 Jan 2022 11:57:27 -0800
In-Reply-To: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2-NSdPxuATzUBq1UP0Kteik0s_xx67fp
X-Proofpoint-GUID: gJHHZRobh_kGVIpwW5LGLaktsqomPE9m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_09,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201210127
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
index f1efe86563cc..ddc05a8fc2e3 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -74,6 +74,7 @@ struct vas_user_win_ref {
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
index d9ff73d7704d..75ccd0a599ec 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -370,13 +370,28 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
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
@@ -439,14 +454,24 @@ static int vas_deallocate_window(struct vas_window *vwin)
 
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
+	if (win->vas_win.status & VAS_WIN_NO_CRED_CLOSE) {
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
@@ -622,6 +647,72 @@ static int reconfig_open_windows(struct vas_caps *vcaps, int creds)
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
+		if (win->vas_win.status & VAS_WIN_NO_CRED_CLOSE)
+			continue;
+
+		task_ref = &win->vas_win.task_ref;
+		mutex_lock(&task_ref->mmap_mutex);
+		vma = task_ref->vma;
+		/*
+		 * Number of available credits are reduced, So select
+		 * and close windows.
+		 */
+		win->vas_win.status |= VAS_WIN_NO_CRED_CLOSE;
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
@@ -633,7 +724,7 @@ static int vas_reconfig_capabilties(u8 type)
 	struct vas_cop_feat_caps *caps;
 	int lpar_creds, new_creds;
 	struct vas_caps *vcaps;
-	int rc = 0;
+	int rc = 0, active_wins;
 
 	if (type >= VAS_MAX_FEAT_TYPE) {
 		pr_err("Invalid credit type %d\n", type);
@@ -671,6 +762,14 @@ static int vas_reconfig_capabilties(u8 type)
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


