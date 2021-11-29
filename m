Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 568B4461D1E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 18:54:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2tKM16C2z3dk4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 04:54:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p8ofElPq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=p8ofElPq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2tGv518Mz3ccY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 04:52:39 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHldrq029846; 
 Mon, 29 Nov 2021 17:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=NXmL0HdpZVbxiKjvVKqVjfl2+H52DV9E1hhAMEfch78=;
 b=p8ofElPqt4XUWhY4Xw/f90jwj76gXzZvg3owqUAq8jvqEEtw1lBP7aPFkE9GON6jIWN4
 lUEKQZUUFwwDIYikKG9KnXsR3ehLyYlagKgy2OdPRg1IaiG9EPONmCEWMwAePkpqg4wQ
 dNJ2N0ulXDZBXZyeKFArZce6iY+jtNMElsBhsaaeeoTRrxHYBOeYfVbUckJC278+QKzt
 CJCJcdWL+bY+cQYDI42W3Kuz+Axr1EmnCW+8wwUs1+bO9K/pQXc1fi0zF8RYepwW8QHK
 VI9MyddEQrkXWIczFraJlTZ03pAHtOzfC/6DmGD0ojKK4Ue8mKovETX9kKXaC3P0trSe tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cn3jrr2f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:52:34 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ATHnoMG001829;
 Mon, 29 Nov 2021 17:52:34 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cn3jrr2ea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:52:34 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHhvEW030229;
 Mon, 29 Nov 2021 17:52:33 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 3ckcaahqxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:52:33 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ATHqW3H57016620
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 17:52:32 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F620BE05B;
 Mon, 29 Nov 2021 17:52:32 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51EE9BE061;
 Mon, 29 Nov 2021 17:52:31 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.7.253])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 29 Nov 2021 17:52:31 +0000 (GMT)
Message-ID: <8acd3a058f1bdac9fa9bce932b71fc7f8b0b4244.camel@linux.ibm.com>
Subject: [PATCH 07/10] powerpc/vas: Add paste address mmap fault handler
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Mon, 29 Nov 2021 09:52:29 -0800
In-Reply-To: <a2187018b4e030fe6c7e408b3a73c37c85472e10.camel@linux.ibm.com>
References: <a2187018b4e030fe6c7e408b3a73c37c85472e10.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tJnXTcsPq9kVc15WOkljmKkctnrxJNc6
X-Proofpoint-GUID: KJD9V2g1ESQjudyW4vxdhOCg-fE7rEeG
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


The user space opens VAS windows and issues NX requests by pasting
CRB on the corresponding paste address mmap. When the system looses
credits due to core removal, the kernel has to close the window in
the hypervisor and make the window inactive by unmapping this paste
address. Also the OS has to handle NX request page faults if the user
space issue NX requests.

This handler remap the new paste address with the same VMA when the
window is active again (due to core add with DLPAR). Otherwise
returns paste failure.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/book3s/vas-api.c | 60 +++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index 2d06bd1b1935..5ceba75c13eb 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -351,6 +351,65 @@ static int coproc_release(struct inode *inode, struct file *fp)
 	return 0;
 }
 
+/*
+ * This fault handler is invoked when the VAS/NX generates page fault on
+ * the paste address. Happens if the kernel closes window in hypervisor
+ * (on PowerVM) due to lost credit or the paste address is not mapped.
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
+		pr_err("%s(): No send window open?\n", __func__);
+		return VM_FAULT_SIGBUS;
+	}
+
+	txwin = cp_inst->txwin;
+	/*
+	 * Fault is coming due to missing from the original mmap.
+	 * Can happen only when the window is closed due to lost
+	 * credit before mmap() or the user space issued NX request
+	 * without mapping.
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
+	 * removal with DLPAR). When the window is active again when
+	 * the credit is available, remap with the new paste address.
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
@@ -417,6 +476,7 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 			paste_addr, vma->vm_start, rc);
 
 	txwin->task_ref.vma = vma;
+	vma->vm_ops = &vas_vm_ops;
 
 out:
 	mutex_unlock(&txwin->task_ref.mmap_mutex);
-- 
2.27.0


