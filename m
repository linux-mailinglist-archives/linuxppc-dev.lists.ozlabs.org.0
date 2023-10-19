Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2746B7D043A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 23:51:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mr/4a8+e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBLyc20mRz3cN7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 08:51:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mr/4a8+e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBLxh5f5wz3cFg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 08:50:48 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JLeW9A023859;
	Thu, 19 Oct 2023 21:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=KJZ6JgNasfhc58oO79La9aKdnQGUmraU2h4Vsao1I3U=;
 b=Mr/4a8+euq2C75fno48YMrW0oXiI5zXAauycbcjbXqAP/SapwTSnKoqsSntHC6zIRzKD
 98bMlJ4G6y4aocEnxCaYPg5rTgjyLw3NgH1FHZMtbPMF7ICoP1ZTveblRmnktC8otFcp
 qcOh/G/IrhVAcT1NfCV10fPsdRrZZp2BAqTB2VRUfJEfr5vA5tGLXvLfa+KqzNobXYnV
 xTqIDyFcb9BEENon1hzouBMy5bSHMnQjuLwXknqMq2GgtXIi7Tw1pGLAdsLNZ3X2dubw
 VX91xo7zL/m3YsvETVXFp+nJjseQz/EB8ngblc+H6Uit3wB95yy490r8PZJuvJ2q3aQR Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tucjxga4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 21:50:40 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39JLgw9r000637;
	Thu, 19 Oct 2023 21:50:40 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tucjxga3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 21:50:40 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39JL4Wkh007084;
	Thu, 19 Oct 2023 21:50:39 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tuc27g73k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 21:50:39 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39JLocDd22807122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Oct 2023 21:50:38 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8534858058;
	Thu, 19 Oct 2023 21:50:38 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E4A45805D;
	Thu, 19 Oct 2023 21:50:37 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.67.91.245])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Oct 2023 21:50:37 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/vas: Limit open window failure messages in log bufffer
Date: Thu, 19 Oct 2023 14:50:33 -0700
Message-Id: <20231019215033.1335251-1-haren@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0FmQtMTMHGoqNEnZZPkunbOTX1EEXrTO
X-Proofpoint-ORIG-GUID: Vy6ihppCbQSpGQl3-JvsZ8OSiE3o0PWY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_21,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxlogscore=942
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310190184
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
Cc: nathanl@linux.ibm.com, Haren Myneni <haren@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The VAS open window call prints error message and returns -EBUSY
after the migration suspend event initiated and until the resume
event completed on the destination system. It can cause the log
buffer filled with these error messages if the user space issues
continuous open window calls.  Similar case even for DLPAR CPU
remove event when no credits are available until the credits are
freed or with the other DLPAR CPU add event.

So changes in the patch to use pr_err_ratelimited() instead of
pr_err() to display open window failure and not-available credits
error messages.

Use pr_fmt() and make the corresponding changes to have the
consistencein prefix all pr_*() messages (vas-api.c).

Fixes: 37e6764895ef ("powerpc/pseries/vas: Add VAS migration handler")
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/book3s/vas-api.c | 34 ++++++++++++-------------
 arch/powerpc/platforms/pseries/vas.c    |  4 +--
 2 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index 77ea9335fd04..52dabbe52da1 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -4,6 +4,8 @@
  * Copyright (C) 2019 Haren Myneni, IBM Corp
  */
 
+#define pr_fmt(fmt)	"VAS-API: " fmt
+
 #include <linux/kernel.h>
 #include <linux/device.h>
 #include <linux/cdev.h>
@@ -78,7 +80,7 @@ int get_vas_user_win_ref(struct vas_user_win_ref *task_ref)
 	task_ref->mm = get_task_mm(current);
 	if (!task_ref->mm) {
 		put_pid(task_ref->pid);
-		pr_err("VAS: pid(%d): mm_struct is not found\n",
+		pr_err("pid(%d): mm_struct is not found\n",
 				current->pid);
 		return -EPERM;
 	}
@@ -235,8 +237,7 @@ void vas_update_csb(struct coprocessor_request_block *crb,
 	rc = kill_pid_info(SIGSEGV, &info, pid);
 	rcu_read_unlock();
 
-	pr_devel("%s(): pid %d kill_proc_info() rc %d\n", __func__,
-			pid_vnr(pid), rc);
+	pr_devel("pid %d kill_proc_info() rc %d\n", pid_vnr(pid), rc);
 }
 
 void vas_dump_crb(struct coprocessor_request_block *crb)
@@ -294,7 +295,7 @@ static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
 
 	rc = copy_from_user(&uattr, uptr, sizeof(uattr));
 	if (rc) {
-		pr_err("%s(): copy_from_user() returns %d\n", __func__, rc);
+		pr_err("copy_from_user() returns %d\n", rc);
 		return -EFAULT;
 	}
 
@@ -311,7 +312,7 @@ static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
 	txwin = cp_inst->coproc->vops->open_win(uattr.vas_id, uattr.flags,
 						cp_inst->coproc->cop_type);
 	if (IS_ERR(txwin)) {
-		pr_err("%s() VAS window open failed, %ld\n", __func__,
+		pr_err_ratelimited("VAS window open failed rc=%ld\n",
 				PTR_ERR(txwin));
 		return PTR_ERR(txwin);
 	}
@@ -405,8 +406,7 @@ static vm_fault_t vas_mmap_fault(struct vm_fault *vmf)
 	 * window is not opened. Shouldn't expect this error.
 	 */
 	if (!cp_inst || !cp_inst->txwin) {
-		pr_err("%s(): Unexpected fault on paste address with TX window closed\n",
-				__func__);
+		pr_err("Unexpected fault on paste address with TX window closed\n");
 		return VM_FAULT_SIGBUS;
 	}
 
@@ -421,8 +421,7 @@ static vm_fault_t vas_mmap_fault(struct vm_fault *vmf)
 	 * issue NX request.
 	 */
 	if (txwin->task_ref.vma != vmf->vma) {
-		pr_err("%s(): No previous mapping with paste address\n",
-			__func__);
+		pr_err("No previous mapping with paste address\n");
 		return VM_FAULT_SIGBUS;
 	}
 
@@ -481,19 +480,19 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 	txwin = cp_inst->txwin;
 
 	if ((vma->vm_end - vma->vm_start) > PAGE_SIZE) {
-		pr_debug("%s(): size 0x%zx, PAGE_SIZE 0x%zx\n", __func__,
+		pr_debug("size 0x%zx, PAGE_SIZE 0x%zx\n",
 				(vma->vm_end - vma->vm_start), PAGE_SIZE);
 		return -EINVAL;
 	}
 
 	/* Ensure instance has an open send window */
 	if (!txwin) {
-		pr_err("%s(): No send window open?\n", __func__);
+		pr_err("No send window open?\n");
 		return -EINVAL;
 	}
 
 	if (!cp_inst->coproc->vops || !cp_inst->coproc->vops->paste_addr) {
-		pr_err("%s(): VAS API is not registered\n", __func__);
+		pr_err("VAS API is not registered\n");
 		return -EACCES;
 	}
 
@@ -510,14 +509,14 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 	 */
 	mutex_lock(&txwin->task_ref.mmap_mutex);
 	if (txwin->status != VAS_WIN_ACTIVE) {
-		pr_err("%s(): Window is not active\n", __func__);
+		pr_err("Window is not active\n");
 		rc = -EACCES;
 		goto out;
 	}
 
 	paste_addr = cp_inst->coproc->vops->paste_addr(txwin);
 	if (!paste_addr) {
-		pr_err("%s(): Window paste address failed\n", __func__);
+		pr_err("Window paste address failed\n");
 		rc = -EINVAL;
 		goto out;
 	}
@@ -533,8 +532,8 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 	rc = remap_pfn_range(vma, vma->vm_start, pfn + vma->vm_pgoff,
 			vma->vm_end - vma->vm_start, prot);
 
-	pr_devel("%s(): paste addr %llx at %lx, rc %d\n", __func__,
-			paste_addr, vma->vm_start, rc);
+	pr_devel("paste addr %llx at %lx, rc %d\n", paste_addr,
+			vma->vm_start, rc);
 
 	txwin->task_ref.vma = vma;
 	vma->vm_ops = &vas_vm_ops;
@@ -609,8 +608,7 @@ int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_type,
 		goto err;
 	}
 
-	pr_devel("%s: Added dev [%d,%d]\n", __func__, MAJOR(devno),
-			MINOR(devno));
+	pr_devel("Added dev [%d,%d]\n", MAJOR(devno), MINOR(devno));
 
 	return 0;
 
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 513180467562..88bee56ff92b 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -340,7 +340,7 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 
 	if (atomic_inc_return(&cop_feat_caps->nr_used_credits) >
 			atomic_read(&cop_feat_caps->nr_total_credits)) {
-		pr_err("Credits are not available to allocate window\n");
+		pr_err_ratelimited("Credits are not available to allocate window\n");
 		rc = -EINVAL;
 		goto out;
 	}
@@ -423,7 +423,7 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 
 	put_vas_user_win_ref(&txwin->vas_win.task_ref);
 	rc = -EBUSY;
-	pr_err("No credit is available to allocate window\n");
+	pr_err_ratelimited("No credit is available to allocate window\n");
 
 out_free:
 	/*
-- 
2.26.3

