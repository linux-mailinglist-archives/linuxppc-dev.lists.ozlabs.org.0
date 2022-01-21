Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC2949661A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 20:57:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgVXC4ZdMz3cTJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 06:57:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LRrm0gK/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LRrm0gK/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgVWT1sS1z3bbT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 06:56:37 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20LJ3Dml028056; 
 Fri, 21 Jan 2022 19:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=BCnc5AnTw95dDKCn/eL72KYNeX9UxwQmuMI+rYjGfjs=;
 b=LRrm0gK/4Hg7bWYx7YWHBvp3lFb8UQ+m3AaKw0KD33JxQoyl/Ol40WWyw+jhLmFS7vGE
 cO6QBVApTZ89xL8typ39OvroHA66GL1q7jP5FO1oK5AONmzdR9cII9HOo5XR3XViPfwe
 aeH1NTt8LCq+cw06ljIfJ1uENGlv78sZdsgzVOPSMstg/GdOL0w97hYtEPpfxpHTDxK3
 MK2o59BlDCiNdnPWVEFUuBOGRdOL+TbDQgy2LdLnFpoYZwTilONqjC22vKFbcA2/FFhE
 HO4xxUlo3S8QkbC+az1g+ZwQz0IyQz09plJJDT6XU5JtEmbGdMexE3I3xJatRdwWE7js qQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr0784daq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:56:33 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20LJsJpq018873;
 Fri, 21 Jan 2022 19:56:32 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr0784da6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:56:32 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20LJqGAj009198;
 Fri, 21 Jan 2022 19:56:31 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 3dr1umhnh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:56:31 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20LJuUV327918724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jan 2022 19:56:30 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B2B26E056;
 Fri, 21 Jan 2022 19:56:30 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B38F16E050;
 Fri, 21 Jan 2022 19:56:29 +0000 (GMT)
Received: from sig-9-77-130-163.ibm.com (unknown [9.77.130.163])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 21 Jan 2022 19:56:29 +0000 (GMT)
Message-ID: <623ab91d97fdc6affde8de34e9b0e59ae8dd2d81.camel@linux.ibm.com>
Subject: [PATCH v3 04/10] powerpc/pseries/vas: Reopen windows with DLPAR
 core add
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Fri, 21 Jan 2022 11:56:27 -0800
In-Reply-To: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9EbNS3VvS6Wjv7sFDRKURi1g90V1XIz1
X-Proofpoint-GUID: cs6L2FL6b_Yai-aXYhQFbBqCnBhiPs6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_09,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201210127
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
 arch/powerpc/include/asm/vas.h          |  16 +++
 arch/powerpc/platforms/book3s/vas-api.c |   1 +
 arch/powerpc/platforms/pseries/vas.c    | 144 ++++++++++++++++++++++++
 arch/powerpc/platforms/pseries/vas.h    |   8 +-
 4 files changed, 163 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index 57573d9c1e09..f1efe86563cc 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -29,6 +29,19 @@
 #define VAS_THRESH_FIFO_GT_QTR_FULL	2
 #define VAS_THRESH_FIFO_GT_EIGHTH_FULL	3
 
+/*
+ * VAS window status
+ */
+#define VAS_WIN_ACTIVE		0x0	/* Used in platform independent */
+					/* vas mmap() */
+/* The hypervisor returns these values */
+#define VAS_WIN_CLOSED		0x00000001
+#define VAS_WIN_INACTIVE	0x00000002 /* Inactive due to HW failure */
+#define VAS_WIN_MOD_IN_PROCESS	0x00000003 /* Process of being modified, */
+					   /* deallocated, or quiesced */
+/* Linux status bits */
+#define VAS_WIN_NO_CRED_CLOSE	0x00000004 /* Window is closed due to */
+					   /* lost credit */
 /*
  * Get/Set bit fields
  */
@@ -59,6 +72,8 @@ struct vas_user_win_ref {
 	struct pid *pid;	/* PID of owner */
 	struct pid *tgid;	/* Thread group ID of owner */
 	struct mm_struct *mm;	/* Linux process mm_struct */
+	struct mutex mmap_mutex;	/* protects paste address mmap() */
+					/* with DLPAR close/open windows */
 };
 
 /*
@@ -67,6 +82,7 @@ struct vas_user_win_ref {
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
index 2ef56157634f..d9ff73d7704d 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -501,6 +501,7 @@ static int __init get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
 	memset(vcaps, 0, sizeof(*vcaps));
 	INIT_LIST_HEAD(&vcaps->list);
 
+	vcaps->feat = feat;
 	caps = &vcaps->caps;
 
 	rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES, feat,
@@ -539,6 +540,145 @@ static int __init get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
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
+	struct pseries_vas_window *win = NULL, *tmp;
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
+	list_for_each_entry_safe(win, tmp, &vcaps->list, win_list) {
+		if (!mv_ents)
+			break;
+
+		mv_ents--;
+	}
+
+	list_for_each_entry_safe_from(win, tmp, &vcaps->list, win_list) {
+		/*
+		 * Nothing to do on this window if it is not closed
+		 * with VAS_WIN_NO_CRED_CLOSE
+		 */
+		if (!(win->vas_win.status & VAS_WIN_NO_CRED_CLOSE))
+			continue;
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
+		/*
+		 * Set window status to active
+		 */
+		win->vas_win.status &= ~VAS_WIN_NO_CRED_CLOSE;
+		mutex_unlock(&win->vas_win.task_ref.mmap_mutex);
+		win->win_type = caps->win_type;
+		if (!--vcaps->close_wins)
+			break;
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
+	struct hv_vas_cop_feat_caps *hv_caps;
+	struct vas_cop_feat_caps *caps;
+	int lpar_creds, new_creds;
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
+	new_creds = be16_to_cpu(hv_caps->target_lpar_creds);
+
+	lpar_creds = atomic_read(&caps->target_creds);
+
+	atomic_set(&caps->target_creds, new_creds);
+	/*
+	 * The total number of available credits may be decreased or
+	 * inceased with DLPAR operation. Means some windows have to be
+	 * closed / reopened. Hold the vas_pseries_mutex so that the
+	 * the user space can not open new windows.
+	 */
+	if (lpar_creds <  new_creds) {
+		/*
+		 * If the existing target credits is less than the new
+		 * target, reopen windows if they are closed due to
+		 * the previous DLPAR (core removal).
+		 */
+		rc = reconfig_open_windows(vcaps, new_creds - lpar_creds);
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
@@ -565,6 +705,10 @@ static int pseries_vas_notifier(struct notifier_block *nb,
 	if (!intserv)
 		return NOTIFY_OK;
 
+	rc = vas_reconfig_capabilties(VAS_GZIP_DEF_FEAT_TYPE);
+	if (rc)
+		pr_err("Failed reconfig VAS capabilities with DLPAR\n");
+
 	return rc;
 }
 
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
index 0538760d13be..45b62565955b 100644
--- a/arch/powerpc/platforms/pseries/vas.h
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -21,12 +21,6 @@
 #define VAS_MOD_WIN_FLAGS	(VAS_MOD_WIN_JOBS_KILL | VAS_MOD_WIN_DR | \
 				VAS_MOD_WIN_PR | VAS_MOD_WIN_SF)
 
-#define VAS_WIN_ACTIVE		0x0
-#define VAS_WIN_CLOSED		0x1
-#define VAS_WIN_INACTIVE	0x2	/* Inactive due to HW failure */
-/* Process of being modified, deallocated, or quiesced */
-#define VAS_WIN_MOD_IN_PROCESS	0x3
-
 #define VAS_COPY_PASTE_USER_MODE	0x00000001
 #define VAS_COP_OP_USER_MODE		0x00000010
 
@@ -84,6 +78,8 @@ struct vas_cop_feat_caps {
 struct vas_caps {
 	struct vas_cop_feat_caps caps;
 	struct list_head list;	/* List of open windows */
+	int close_wins;		/* closed windows in the hypervisor for DLPAR */
+	u8 feat;		/* Feature type */
 };
 
 /*
-- 
2.27.0


