Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A75461D01
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 18:50:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2tCv22l7z3ckN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 04:50:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=koXicgkz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=koXicgkz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2tC90byTz2xBD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 04:49:24 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHlPeU030733; 
 Mon, 29 Nov 2021 17:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=qRU4kAkrbuOuGx7AyBoxzL0xNM0U0h9laV6M3Utq6po=;
 b=koXicgkzGrta5qTUhyL3QHFYNmo9axFsd/PHWvj6VouEzsjt5EfG/vYoYRSocKweMkn9
 4vXxpWs3FEwET587UqmSJ0khEjIn5Q4gKAazSE1pSxBQrXYZMy4g+Q+aLZvWi3+2g9Dq
 VZvzyZEN5Ev+nzZw+rPLyn6KuHEiY96JexankzGfPYNyKwXI9gfbdVd0YDct7yQ21VNd
 WHVY/xVu2mm/GQIFRoi6eolYJffm/1k4lhfDWRuhRY8fJYBEX2JU2rVdS5XfURX4hBzg
 jXmzRr64T+perGmpez15Ipau+HqoCJYAhZQ59mZwf9ygW+O+pKjPpRmjAStwEMW+uTMb sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cn3jsg0qq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:49:19 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ATHnJuN002752;
 Mon, 29 Nov 2021 17:49:19 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cn3jsg0qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:49:19 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHgcG5028748;
 Mon, 29 Nov 2021 17:49:18 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 3ckcaag50r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:49:18 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ATHnHeM59245014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 17:49:17 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E736AE062;
 Mon, 29 Nov 2021 17:49:17 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23F09AE066;
 Mon, 29 Nov 2021 17:49:16 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.7.253])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 29 Nov 2021 17:49:15 +0000 (GMT)
Message-ID: <51dc8b70796d37397794fa43de6214997aa88192.camel@linux.ibm.com>
Subject: [PATCH 04/10] powerpc/pseries/vas: Reopen windows with DLPAR core add
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Mon, 29 Nov 2021 09:49:14 -0800
In-Reply-To: <a2187018b4e030fe6c7e408b3a73c37c85472e10.camel@linux.ibm.com>
References: <a2187018b4e030fe6c7e408b3a73c37c85472e10.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: y8iDPO42A8TYLNPP6uBGEpQZMy8eZDu8
X-Proofpoint-ORIG-GUID: zLigKhCIU_hQ4PYF5hwcYtRu5BfWctuz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_10,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111290082
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


VAS windows can be closed in the hypervisor due to lost credits
when the core is removed. If these credits are available later
for core add, reopen these windows and set them active. When the
kernel sees page fault on the paste address, it creates new mapping
on the new paste address. Then the user space can continue to use
these windows and send HW compression requests to NX successfully.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/vas.h          |  15 +++
 arch/powerpc/platforms/book3s/vas-api.c |   1 +
 arch/powerpc/platforms/pseries/vas.c    | 148 ++++++++++++++++++++++++
 arch/powerpc/platforms/pseries/vas.h    |   2 +
 4 files changed, 166 insertions(+)

diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index 57573d9c1e09..43cea69d1af1 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -29,6 +29,18 @@
 #define VAS_THRESH_FIFO_GT_QTR_FULL	2
 #define VAS_THRESH_FIFO_GT_EIGHTH_FULL	3
 
+/*
+ * VAS window status
+ */
+#define VAS_WIN_ACTIVE		0x0	/* Used in platform independent */
+					/* vas mmap() */
+#define VAS_WIN_CLOSED		0x1
+#define VAS_WIN_INACTIVE	0x2	/* Inactive due to HW failure */
+#define VAS_WIN_MOD_IN_PROCESS	0x3	/* Process of being modified, */
+					/* deallocated, or quiesced */
+#define VAS_WIN_NO_CRED_CLOSE	0x4	/* Linux specific status when */
+					/* window is closed due to lost */
+					/* credit */
 /*
  * Get/Set bit fields
  */
@@ -59,6 +71,8 @@ struct vas_user_win_ref {
 	struct pid *pid;	/* PID of owner */
 	struct pid *tgid;	/* Thread group ID of owner */
 	struct mm_struct *mm;	/* Linux process mm_struct */
+	struct mutex mmap_mutex;	/* protects paste address mmap() */
+					/* with DLPAR close/open windows */
 };
 
 /*
@@ -67,6 +81,7 @@ struct vas_user_win_ref {
 struct vas_window {
 	u32 winid;
 	u32 wcreds_max;	/* Window credits */
+	u32 status;
 	enum vas_cop_type cop;
 	struct vas_user_win_ref task_ref;
 	char *dbgname;
diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index 4d82c92ddd52..2b0ced611f32 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -316,6 +316,7 @@ static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
 		return PTR_ERR(txwin);
 	}
 
+	mutex_init(&txwin->task_ref.mmap_mutex);
 	cp_inst->txwin = txwin;
 
 	return 0;
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 6b35f67d5175..ace8ee7a99e6 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -493,6 +493,7 @@ static int get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
 	memset(vcaps, 0, sizeof(*vcaps));
 	INIT_LIST_HEAD(&vcaps->list);
 
+	vcaps->feat = feat;
 	caps = &vcaps->caps;
 
 	rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES, feat,
@@ -531,6 +532,149 @@ static int get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
 	return 0;
 }
 
+/*
+ * VAS windows can be closed due to lost credits when the core is
+ * removed. So reopen them if credits are available due to DLPAR
+ * core add and set the window active status. When NX sees the page
+ * fault on the unmapped paste address, the kernel handles the fault
+ * by setting the remapping to new paste address if the window is
+ * active.
+ */
+static int reconfig_open_windows(struct vas_caps *vcaps, int creds)
+{
+	long domain[PLPAR_HCALL9_BUFSIZE] = {VAS_DEFAULT_DOMAIN_ID};
+	struct vas_cop_feat_caps *caps = &vcaps->caps;
+	struct pseries_vas_window *win = NULL;
+	int rc, mv_ents = 0;
+
+	/*
+	 * Nothing to do if there are no closed windows.
+	 */
+	if (!vcaps->close_wins)
+		return 0;
+
+	/*
+	 * For the core removal, the hypervisor reduces the credits
+	 * assigned to the LPAR and the kernel closes VAS windows
+	 * in the hypervisor depends on reduced credits. The kernel
+	 * uses LIFO (the last windows that are opened will be closed
+	 * first) and expects to open in the same order when credits
+	 * are available.
+	 * For example, 40 windows are closed when the LPAR lost 2 cores
+	 * (dedicated). If 1 core is added, this LPAR can have 20 more
+	 * credits. It means the kernel can reopen 20 windows. So move
+	 * 20 entries in the VAS windows lost and reopen next 20 windows.
+	 */
+	if (vcaps->close_wins > creds)
+		mv_ents = vcaps->close_wins - creds;
+
+	list_for_each_entry(win, &vcaps->list, win_list) {
+		if (!mv_ents)
+			break;
+
+		mv_ents--;
+	}
+
+	while (vcaps->close_wins && win) {
+		/*
+		 * Nothing to do on this window if it is active.
+		 */
+		if (win->vas_win.status != VAS_WIN_NO_CRED_CLOSE) {
+			win = list_next_entry(win, win_list);
+			continue;
+		}
+
+		rc = allocate_setup_window(win, (u64 *)&domain[0],
+					   caps->win_type);
+		if (rc)
+			return rc;
+
+		rc = h_modify_vas_window(win);
+		if (rc)
+			goto out;
+
+		mutex_lock(&win->vas_win.task_ref.mmap_mutex);
+
+		/*
+		 * Set window status to active
+		 */
+		win->vas_win.status = VAS_WIN_ACTIVE;
+		win->win_type = caps->win_type;
+		mutex_unlock(&win->vas_win.task_ref.mmap_mutex);
+		atomic_inc(&caps->used_creds);
+		win = list_next_entry(win, win_list);
+		vcaps->close_wins--;
+	}
+
+	return 0;
+out:
+	/*
+	 * Window modify HCALL failed. So close the window to the
+	 * hypervisor and return.
+	 */
+	free_irq_setup(win);
+	h_deallocate_vas_window(win->vas_win.winid);
+	return rc;
+}
+
+/*
+ * Get new VAS capabilities when the core add/removal configuration
+ * changes. Reconfig window configurations based on the credits
+ * availability from this new capabilities.
+ */
+static int vas_reconfig_capabilties(u8 type)
+{
+	int lpar_creds, avail_creds;
+	struct hv_vas_cop_feat_caps *hv_caps;
+	struct vas_cop_feat_caps *caps;
+	struct vas_caps *vcaps;
+	int rc = 0;
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
+	lpar_creds = be16_to_cpu(hv_caps->target_lpar_creds);
+
+	atomic_set(&caps->target_creds, lpar_creds);
+
+	/*
+	 * The total number of available credits are decreased due to
+	 * DLPAR core removal. Means some windows have to be closed.
+	 * Hold the vas_pseries_mutex before closing the required windows
+	 * so that the user space can not open new windows.
+	 */
+	if (atomic_read(&caps->used_creds) < lpar_creds) {
+		/*
+		 * If the existing used credits is less than the new
+		 * available credits, reopen windows if they are
+		 * closed due to the previous DLPAR (core removal).
+		 */
+		avail_creds = lpar_creds -
+				atomic_read(&caps->used_creds);
+		rc = reconfig_open_windows(vcaps, avail_creds);
+	}
+
+out:
+	mutex_unlock(&vas_pseries_mutex);
+	kfree(hv_caps);
+	return rc;
+}
+
 /*
  * Total number of default credits available (target_credits)
  * in LPAR depends on number of cores configured. It varies based on
@@ -554,6 +698,10 @@ static int pseries_vas_notifier(struct notifier_block *nb,
 	if (!intserv)
 		return NOTIFY_OK;
 
+	rc = vas_reconfig_capabilties(VAS_GZIP_DEF_FEAT_TYPE);
+	if (rc)
+		pr_err("Failed reconfig VAS capabilities with DLPAR\n");
+
 	return rc;
 }
 
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
index 0538760d13be..1fbb49a34d48 100644
--- a/arch/powerpc/platforms/pseries/vas.h
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -84,6 +84,8 @@ struct vas_cop_feat_caps {
 struct vas_caps {
 	struct vas_cop_feat_caps caps;
 	struct list_head list;	/* List of open windows */
+	int close_wins;		/* closed windows in the hypervisor for DLPAR */
+	u8 feat;		/* Feature type */
 };
 
 /*
-- 
2.27.0


