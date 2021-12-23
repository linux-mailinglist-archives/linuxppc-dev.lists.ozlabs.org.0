Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1764A47DC01
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 01:28:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JK9yj0RLPz3cbW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 11:28:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Kgk7bwru;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Kgk7bwru; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JK9xy3s31z2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Dec 2021 11:27:34 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BN0BqmT018715; 
 Thu, 23 Dec 2021 00:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=pBA1PdMaw9jTr5HIPfHP31/y9BZm7Lj9LHlTJglO46M=;
 b=Kgk7bwruydAaLScGtq/PcQeRyokaVpN/vzOxyN08deGPwhH1yOyHKCxKIdP3cXLl0H+q
 6A3WjIbJ8PNXwMrMipJyQInFu9ZUxziIw7Xe9v0HRLSrQ+Wedkuf2v+892fqVyFsNXpm
 Hp0vMTYcJ9u927PchCg652F7u3QAYlp9axKUD7YW6w+2Rw87lS0HgDiCDGZvvasRBfKL
 elqUfnUQYIymlYqPizk5pOgj3nWAEvaKBito+eqvnAjuZHbYJgdqPw/fTFm6J9kT8ulq
 KnCJzxwJzmZ0NeMSBguWlknvIb/xogN5NY6fhjJJPk4E2RgRWJVuNcS052DYe88iFsXx aQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d4ebsr6eg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:27:30 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BN0RUsN002686;
 Thu, 23 Dec 2021 00:27:30 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d4ebsr6du-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:27:30 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BN0C9ss032760;
 Thu, 23 Dec 2021 00:27:29 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 3d179bg85f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:27:29 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BN0RSnh28836286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Dec 2021 00:27:28 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D67D28066;
 Thu, 23 Dec 2021 00:27:28 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7DF428059;
 Thu, 23 Dec 2021 00:27:27 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.90.83])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 23 Dec 2021 00:27:27 +0000 (GMT)
Message-ID: <b048599a909e5a3cf4ca5085b06a41b52048153a.camel@linux.ibm.com>
Subject: [PATCH v2 04/10] powerpc/pseries/vas: Reopen windows with DLPAR
 core add
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Wed, 22 Dec 2021 16:27:25 -0800
In-Reply-To: <9d1730d5e0daf39ef17196b4699294dc2ccf4a63.camel@linux.ibm.com>
References: <9d1730d5e0daf39ef17196b4699294dc2ccf4a63.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: b5vS9Fwa793wo8wik_-yG2gaAFwvfw52
X-Proofpoint-GUID: QWE6LfqSZ6iRqlvHXWkbk6VjC83eMuPf
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
 arch/powerpc/platforms/pseries/vas.c    | 143 ++++++++++++++++++++++++
 arch/powerpc/platforms/pseries/vas.h    |   8 +-
 4 files changed, 161 insertions(+), 6 deletions(-)

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
index fb6e6a6261a5..0666d3630e6b 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -494,6 +494,7 @@ static int get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
 	memset(vcaps, 0, sizeof(*vcaps));
 	INIT_LIST_HEAD(&vcaps->list);
 
+	vcaps->feat = feat;
 	caps = &vcaps->caps;
 
 	rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES, feat,
@@ -532,6 +533,144 @@ static int get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
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
+		 * Nothing to do on this window if it is active.
+		 */
+		if (win->vas_win.status != VAS_WIN_NO_CRED_CLOSE)
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
+		win->vas_win.status = VAS_WIN_ACTIVE;
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
@@ -555,6 +694,10 @@ static int pseries_vas_notifier(struct notifier_block *nb,
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


