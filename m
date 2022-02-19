Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9AA4BCA89
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 21:01:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K1KFM4BWHz3cn0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Feb 2022 07:01:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l8ivoZ4k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=l8ivoZ4k; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1KDf06Jxz3cbx
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 07:00:33 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21JJd7JN028995; 
 Sat, 19 Feb 2022 20:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=hMYPK03nt/BwkVsLtN81E3sUV9cCp7kOM4PlAQFO2O4=;
 b=l8ivoZ4k4OWs8fs9RaA7WNGNI61v8NTuRVo4etrUsA+7Ermgj17i1bJg3lZvegYMix8d
 1XfPG50ghNmyIihEODDBHiRHTNDQyIsekGqLZA5ma6sRP4PYfDFG67rfx8QHOqkO9q31
 7pYlyMf83/H2Q640w+kJpZ3s0y1PpqxaP2x/Rx66A/atJPxtp61O9zw0uP1BUZjRJr+W
 aJ9c8kkz/3ZXEzhYWXyzHd/zDpdodTcIVasVy5FSV0DHN5SNtzwhvnZVbc79Pntp4yoL
 5+HMgv2YjVOEG84w4+XxdSJiEIWIlXSIzCXcGqcZACNGLY3mYjd+Wg4Uy9rkBZqTOrzu uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eb58rs7kv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:00:29 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21JJxfsH016071;
 Sat, 19 Feb 2022 20:00:29 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eb58rs7kh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:00:29 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21JJwF9v009134;
 Sat, 19 Feb 2022 20:00:28 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 3ear68qm85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:00:28 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21JK0OeI25231636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Feb 2022 20:00:24 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64295B2075;
 Sat, 19 Feb 2022 20:00:24 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B47DAB2066;
 Sat, 19 Feb 2022 20:00:23 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 19 Feb 2022 20:00:23 +0000 (GMT)
Message-ID: <50c1cf6b3427bcd89fdfcf2f1245b3a42aab8391.camel@linux.ibm.com>
Subject: [PATCH v4 6/9] powerpc/pseries/vas: Close windows with DLPAR core
 removal
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sat, 19 Feb 2022 12:00:22 -0800
In-Reply-To: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
References: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LZrLHhYYNoGrTDfzhCYFzW0jmDPhboMp
X-Proofpoint-GUID: Pga6ZCaOLUft_ZdI9Dh8PsjHEKi84V9o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-19_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202190126
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


The hypervisor assigns vas credits (windows) for each LPAR based
on the number of cores configured in that system. The OS is
expected to release credits when cores are removed, and may
allocate more when cores are added. So there is a possibility of
using excessive credits (windows) in the LPAR and the hypervisor
expects the system to close the excessive windows so that NX load
can be equally distributed across all LPARs in the system.

When the OS closes the excessive windows in the hypervisor,
it sets the window status in-active and invalidates window
virtual address mapping. The user space receives paste instruction
failure if any NX requests are issued on the in-active window.

This patch also adds the notifier for core removal/add to close
windows in the hypervisor if the system lost credits (core
removal) and reopen windows in the hypervisor when the previously
lost credits are available.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/vas.h       |   2 +
 arch/powerpc/platforms/pseries/vas.c | 207 +++++++++++++++++++++++++--
 arch/powerpc/platforms/pseries/vas.h |   3 +
 3 files changed, 204 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index 27251af18c65..6baf7b9ffed4 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -34,6 +34,8 @@
  */
 #define VAS_WIN_ACTIVE		0x0	/* Used in platform independent */
 					/* vas mmap() */
+/* Window is closed in the hypervisor due to lost credit */
+#define VAS_WIN_NO_CRED_CLOSE	0x00000001
 
 /*
  * Get/Set bit fields
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 1035446f985b..a297720bcdae 100644
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
+	 * Possible to lose the acquired credit with DLPAR core
+	 * removal after the window is opened. So if there are any
+	 * closed windows (means with lost credits), do not give new
+	 * window to user space. New windows will be opened only
+	 * after the existing windows are reopened when credits are
+	 * available.
+	 */
+	if (!caps->nr_close_wins) {
+		list_add(&txwin->win_list, &caps->list);
+		caps->nr_open_windows++;
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
+		vascaps[win->win_type].nr_close_wins--;
 
 	list_del(&win->win_list);
 	atomic_dec(&caps->nr_used_credits);
+	vascaps[win->win_type].nr_open_windows--;
 	mutex_unlock(&vas_pseries_mutex);
 
 	put_vas_user_win_ref(&vwin->task_ref);
@@ -501,6 +526,7 @@ static int __init get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
 	memset(vcaps, 0, sizeof(*vcaps));
 	INIT_LIST_HEAD(&vcaps->list);
 
+	vcaps->feat = feat;
 	caps = &vcaps->caps;
 
 	rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES, feat,
@@ -539,6 +565,168 @@ static int __init get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
 	return 0;
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
+		vcap->nr_close_wins++;
+
+		if (!--excess_creds)
+			break;
+	}
+
+	return 0;
+}
+
+/*
+ * Get new VAS capabilities when the core add/removal configuration
+ * changes. Reconfig window configurations based on the credits
+ * availability from this new capabilities.
+ */
+static int vas_reconfig_capabilties(u8 type)
+{
+	struct hv_vas_cop_feat_caps *hv_caps;
+	struct vas_cop_feat_caps *caps;
+	int old_nr_creds, new_nr_creds;
+	struct vas_caps *vcaps;
+	int rc = 0, nr_active_wins;
+
+	if (type >= VAS_MAX_FEAT_TYPE) {
+		pr_err("Invalid credit type %d\n", type);
+		return -EINVAL;
+	}
+
+	vcaps = &vascaps[type];
+	caps = &vcaps->caps;
+
+	hv_caps = kmalloc(sizeof(*hv_caps), GFP_KERNEL);
+	if (!hv_caps)
+		return -ENOMEM;
+
+	mutex_lock(&vas_pseries_mutex);
+	rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES, vcaps->feat,
+				      (u64)virt_to_phys(hv_caps));
+	if (rc)
+		goto out;
+
+	new_nr_creds = be16_to_cpu(hv_caps->target_lpar_creds);
+
+	old_nr_creds = atomic_read(&caps->nr_total_credits);
+
+	atomic_set(&caps->nr_total_credits, new_nr_creds);
+	/*
+	 * The total number of available credits may be decreased or
+	 * inceased with DLPAR operation. Means some windows have to be
+	 * closed / reopened. Hold the vas_pseries_mutex so that the
+	 * the user space can not open new windows.
+	 */
+	if (old_nr_creds >  new_nr_creds) {
+		/*
+		 * # active windows is more than new LPAR available
+		 * credits. So close the excessive windows.
+		 * On pseries, each window will have 1 credit.
+		 */
+		nr_active_wins = vcaps->nr_open_windows - vcaps->nr_close_wins;
+		if (nr_active_wins > new_nr_creds)
+			rc = reconfig_close_windows(vcaps,
+					nr_active_wins - new_nr_creds);
+	}
+
+out:
+	mutex_unlock(&vas_pseries_mutex);
+	kfree(hv_caps);
+	return rc;
+}
+/*
+ * Total number of default credits available (target_credits)
+ * in LPAR depends on number of cores configured. It varies based on
+ * whether processors are in shared mode or dedicated mode.
+ * Get the notifier when CPU configuration is changed with DLPAR
+ * operation so that get the new target_credits (vas default capabilities)
+ * and then update the existing windows usage if needed.
+ */
+static int pseries_vas_notifier(struct notifier_block *nb,
+				unsigned long action, void *data)
+{
+	struct of_reconfig_data *rd = data;
+	struct device_node *dn = rd->dn;
+	const __be32 *intserv = NULL;
+	int len, rc = 0;
+
+	if ((action == OF_RECONFIG_ATTACH_NODE) ||
+		(action == OF_RECONFIG_DETACH_NODE))
+		intserv = of_get_property(dn, "ibm,ppc-interrupt-server#s",
+					  &len);
+	/*
+	 * Processor config is not changed
+	 */
+	if (!intserv)
+		return NOTIFY_OK;
+
+	rc = vas_reconfig_capabilties(VAS_GZIP_DEF_FEAT_TYPE);
+	if (rc)
+		pr_err("Failed reconfig VAS capabilities with DLPAR\n");
+
+	return rc;
+}
+
+static struct notifier_block pseries_vas_nb = {
+	.notifier_call = pseries_vas_notifier,
+};
+
 static int __init pseries_vas_init(void)
 {
 	struct hv_vas_cop_feat_caps *hv_cop_caps;
@@ -592,6 +780,9 @@ static int __init pseries_vas_init(void)
 			goto out_cop;
 	}
 
+	if (copypaste_feat && firmware_has_feature(FW_FEATURE_LPAR))
+		of_reconfig_notifier_register(&pseries_vas_nb);
+
 	pr_info("GZIP feature is available\n");
 
 out_cop:
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
index 2872532ed72a..701363cfd7c1 100644
--- a/arch/powerpc/platforms/pseries/vas.h
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -83,6 +83,9 @@ struct vas_cop_feat_caps {
 struct vas_caps {
 	struct vas_cop_feat_caps caps;
 	struct list_head list;	/* List of open windows */
+	int nr_close_wins;	/* closed windows in the hypervisor for DLPAR */
+	int nr_open_windows;	/* Number of successful open windows */
+	u8 feat;		/* Feature type */
 };
 
 /*
-- 
2.27.0


