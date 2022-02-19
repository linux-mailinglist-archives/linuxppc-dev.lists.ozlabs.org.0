Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 785DC4BCA85
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 20:58:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K1KB26KBQz3bcj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Feb 2022 06:58:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qIZpHwIJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qIZpHwIJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1K9K5sxpz2x9S
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 06:57:41 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21JJl6hx008342; 
 Sat, 19 Feb 2022 19:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=rgn3gZyCgqkV8jNu2utGBb6mTaMr0ZfKBG42jPKXmUs=;
 b=qIZpHwIJYCPaxgy2O4QnKonAw+dPEtt8uMXoQBM7fboNzZU5kx2XD96Vi5c1dmd3IUGT
 +IycZcnVtWPIGI6zZmvmFREcvNtOi9shn8wsC7OkrG/rufCX+lJYRi0HpwU5nwZjZ/RJ
 8tgeEC6pMV0w9Ft+XnqHuzi1IsZkGuvmgne9bhemOb1LgjTQdQflm+QsVOoZILO5V5Uj
 Fu7VMdJ5MMK5s70HTCXYgmFkRmKayDpKtHoVDxh6gsgeSqPlKAYp3/OBRP7O6ayFU/45
 mUdEqkzrWyELo8Jp0s1Kou6MhnZ97jmeiepGRqgBthRm4m/j4XvUxM6dw9LtH6GIsT26 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eb70v04wt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 19:57:36 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21JJvZsJ005095;
 Sat, 19 Feb 2022 19:57:35 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eb70v04wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 19:57:35 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21JJmALv031604;
 Sat, 19 Feb 2022 19:57:35 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 3ear68yktd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 19:57:35 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21JJvW0f35258710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Feb 2022 19:57:32 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91C596A057;
 Sat, 19 Feb 2022 19:57:32 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A2246A051;
 Sat, 19 Feb 2022 19:57:31 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 19 Feb 2022 19:57:30 +0000 (GMT)
Message-ID: <8356adc31f70935cb16a80a459b58f792eb48f80.camel@linux.ibm.com>
Subject: [PATCH v4 3/9] powerpc/vas: Add paste address mmap fault handler
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sat, 19 Feb 2022 11:55:59 -0800
In-Reply-To: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
References: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vRgHUPUcSIra4TlhxwhCi8o3NizJrrrw
X-Proofpoint-GUID: yBHUjQA138aEMujNndlNLO7K0Y3rmvaH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-19_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202190126
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


The user space opens VAS windows and issues NX requests by pasting
CRB on the corresponding paste address mmap. When the system lost
credits due to core removal, the kernel has to close the window in
the hypervisor and make the window inactive by unmapping this paste
address. Also the OS has to handle NX request page faults if the user
space issue NX requests.

This handler maps the new paste address with the same VMA when the
window is active again (due to core add with DLPAR). Otherwise
returns paste failure.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/vas.h          | 10 ++++
 arch/powerpc/platforms/book3s/vas-api.c | 68 +++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index 57573d9c1e09..27251af18c65 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -29,6 +29,12 @@
 #define VAS_THRESH_FIFO_GT_QTR_FULL	2
 #define VAS_THRESH_FIFO_GT_EIGHTH_FULL	3
 
+/*
+ * VAS window Linux status bits
+ */
+#define VAS_WIN_ACTIVE		0x0	/* Used in platform independent */
+					/* vas mmap() */
+
 /*
  * Get/Set bit fields
  */
@@ -59,6 +65,9 @@ struct vas_user_win_ref {
 	struct pid *pid;	/* PID of owner */
 	struct pid *tgid;	/* Thread group ID of owner */
 	struct mm_struct *mm;	/* Linux process mm_struct */
+	struct mutex mmap_mutex;	/* protects paste address mmap() */
+					/* with DLPAR close/open windows */
+	struct vm_area_struct *vma;	/* Save VMA and used in DLPAR ops */
 };
 
 /*
@@ -67,6 +76,7 @@ struct vas_user_win_ref {
 struct vas_window {
 	u32 winid;
 	u32 wcreds_max;	/* Window credits */
+	u32 status;	/* Window status used in OS */
 	enum vas_cop_type cop;
 	struct vas_user_win_ref task_ref;
 	char *dbgname;
diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index 4d82c92ddd52..f359e7b2bf90 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -316,6 +316,7 @@ static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
 		return PTR_ERR(txwin);
 	}
 
+	mutex_init(&txwin->task_ref.mmap_mutex);
 	cp_inst->txwin = txwin;
 
 	return 0;
@@ -350,6 +351,70 @@ static int coproc_release(struct inode *inode, struct file *fp)
 	return 0;
 }
 
+/*
+ * This fault handler is invoked when the core generates page fault on
+ * the paste address. Happens if the kernel closes window in hypervisor
+ * (on pseries) due to lost credit or the paste address is not mapped.
+ */
+static vm_fault_t vas_mmap_fault(struct vm_fault *vmf)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	struct file *fp = vma->vm_file;
+	struct coproc_instance *cp_inst = fp->private_data;
+	struct vas_window *txwin;
+	u64 paste_addr;
+	int ret;
+
+	/*
+	 * window is not opened. Shouldn't expect this error.
+	 */
+	if (!cp_inst || !cp_inst->txwin) {
+		pr_err("%s(): Unexpected fault on paste address with TX window closed\n",
+				__func__);
+		return VM_FAULT_SIGBUS;
+	}
+
+	txwin = cp_inst->txwin;
+	/*
+	 * When the LPAR lost credits due to core removal or during
+	 * migration, invalidate the existing mapping for the current
+	 * paste addresses and set windows in-active (zap_page_range in
+	 * reconfig_close_windows()).
+	 * New mapping will be done later after migration or new credits
+	 * available. So continue to receive faults if the user space
+	 * issue NX request.
+	 */
+	if (txwin->task_ref.vma != vmf->vma) {
+		pr_err("%s(): No previous mapping with paste address\n",
+			__func__);
+		return VM_FAULT_SIGBUS;
+	}
+
+	mutex_lock(&txwin->task_ref.mmap_mutex);
+	/*
+	 * The window may be inactive due to lost credit (Ex: core
+	 * removal with DLPAR). If the window is active again when
+	 * the credit is available, map the new paste address at the
+	 * the window virtual address.
+	 */
+	if (txwin->status == VAS_WIN_ACTIVE) {
+		paste_addr = cp_inst->coproc->vops->paste_addr(txwin);
+		if (paste_addr) {
+			ret = vmf_insert_pfn(vma, vma->vm_start,
+					(paste_addr >> PAGE_SHIFT));
+			mutex_unlock(&txwin->task_ref.mmap_mutex);
+			return ret;
+		}
+	}
+	mutex_unlock(&txwin->task_ref.mmap_mutex);
+
+	return VM_FAULT_SIGBUS;
+
+}
+static const struct vm_operations_struct vas_vm_ops = {
+	.fault = vas_mmap_fault,
+};
+
 static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 {
 	struct coproc_instance *cp_inst = fp->private_data;
@@ -398,6 +463,9 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 	pr_devel("%s(): paste addr %llx at %lx, rc %d\n", __func__,
 			paste_addr, vma->vm_start, rc);
 
+	txwin->task_ref.vma = vma;
+	vma->vm_ops = &vas_vm_ops;
+
 	return rc;
 }
 
-- 
2.27.0


