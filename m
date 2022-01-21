Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F09649661D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 21:00:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgVbL3thTz3df9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 06:59:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A2eOiIlW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=A2eOiIlW; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgVZc2xQ2z2xBb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 06:59:20 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20LJGSbm020529; 
 Fri, 21 Jan 2022 19:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=NXmL0HdpZVbxiKjvVKqVjfl2+H52DV9E1hhAMEfch78=;
 b=A2eOiIlWVxK7pGt7pOJEyBRq/t5nFf5Ca55NYzfBZI0D5xEsJDC94bVTIZcBw4lf9ztW
 /j5u/9tYYjT7SArRMdeLZ/jSsyiQGha/wvXKbXvJfMHprjCGGFB7vLqwj1RNu+QAs+QE
 YzNUrxEZLxIXatPAClirYs+PLlv8IqcBo71+b2DGhRa+cwHblSpPqjST/ahYBbaKBuxB
 GfaRH8xJyi1M+xwudWvo4csQ4D5eKZFbNom9I0V+AcU01kb4eGumqzwOBQY/dB2SFvuP
 Kr2VKXXYLiclrcye/1kfvHRsWzstz4RZXYMVvCmmgX73ktHRvT3YueaKRHyZoGvWJXR2 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr2ujgs7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:59:16 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20LJv8no010053;
 Fri, 21 Jan 2022 19:59:15 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr2ujgs7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:59:15 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20LJqAFS010079;
 Fri, 21 Jan 2022 19:59:14 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04wdc.us.ibm.com with ESMTP id 3dqj1fa53a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:59:14 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20LJxDqH38076836
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jan 2022 19:59:13 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6943EB205F;
 Fri, 21 Jan 2022 19:59:13 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 717CDB2066;
 Fri, 21 Jan 2022 19:59:12 +0000 (GMT)
Received: from sig-9-77-130-163.ibm.com (unknown [9.77.130.163])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 21 Jan 2022 19:59:12 +0000 (GMT)
Message-ID: <d87bbb6c81e7b6c3d3b2d45f0549f27183172562.camel@linux.ibm.com>
Subject: [PATCH v3 07/10] powerpc/vas: Add paste address mmap fault handler
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Fri, 21 Jan 2022 11:59:10 -0800
In-Reply-To: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: i7JIXifA_4njOWwSwHVmChRrbMVQhn-v
X-Proofpoint-GUID: 7WqLNZbqg97F8-lh1u_kv60eDF95GS2s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_09,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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


