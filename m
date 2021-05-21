Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3085938C371
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 11:40:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmhRk0S1Qz3bxX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 19:40:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h6yeCaY3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=h6yeCaY3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmhRD6DLXz2yWK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 19:40:08 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L9YD00093065; Fri, 21 May 2021 05:40:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=YQAp9zsMFq7AZxkIMaWWx/scpayMO8bA+kVdhimFzXg=;
 b=h6yeCaY3EDW8Gjf14XFnrwqDoocQ4NcSX9Tmj3FSL2VvbKkEkNwX9l7b0HNpCmt3ov36
 4dwBZMchg6KfuIyMLeGbuRmXQfZszsktb7Cs5d5vLMJCHcTYI9z8z69mlO3+oBoRVYa7
 yZMFesWj7jju/fMZIZ5u4w0ZM5YiNKXRWf877i2FPZ2XojbTsR7SXQyGrWLJC9Avh7/+
 ig1IGxS5iYPYqy+TpBL5orZi8C0wZNaZN0gOQHnLMM6uv5DpNbt2stUWN8kRmGN9Qz7G
 z/bROsIM/H151orWu7S+UI0xW/mT1GYUI0cL6vapKaW0WdI/91GUKizatUhR1WcLwc7p 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38pa8kr8e1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 05:40:03 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14L9YWZK095027;
 Fri, 21 May 2021 05:40:02 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38pa8kr8d3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 05:40:02 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L9YOEB025126;
 Fri, 21 May 2021 09:40:01 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 38j5xaa7v9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 09:40:01 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14L9e0gn26345874
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 09:40:00 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9772D6A047;
 Fri, 21 May 2021 09:40:00 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01C4E6A04F;
 Fri, 21 May 2021 09:39:58 +0000 (GMT)
Received: from sig-9-65-94-165.ibm.com (unknown [9.65.94.165])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 09:39:58 +0000 (GMT)
Message-ID: <5ac32e4d07bd048e3d687354501d36c334f1c8e0.camel@linux.ibm.com>
Subject: [PATCH v4 12/16] powerpc/pseries/vas: Setup IRQ and fault handling
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Fri, 21 May 2021 02:39:56 -0700
In-Reply-To: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eAwv29K_K1JPiqK8YAhE5DXbTNF2jGiO
X-Proofpoint-GUID: cSuXgE6810TNFMhFFxr8AjJzcMnli_q3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210061
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


NX generates an interrupt when sees a fault on the user space
buffer and the hypervisor forwards that interrupt to OS. Then
the kernel handles the interrupt by issuing H_GET_NX_FAULT hcall
to retrieve the fault CRB information.

This patch also adds changes to setup and free IRQ per each
window and also handles the fault by updating the CSB.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas.c | 111 +++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index ef0c455f6e93..31dc17573f50 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -224,6 +224,62 @@ int plpar_vas_query_capabilities(const u64 hcall, u8 query_type,
 }
 EXPORT_SYMBOL_GPL(plpar_vas_query_capabilities);
 
+/*
+ * HCALL to get fault CRB from pHyp.
+ */
+static int plpar_get_nx_fault(u32 winid, u64 buffer)
+{
+	int64_t rc;
+
+	rc = plpar_hcall_norets(H_GET_NX_FAULT, winid, buffer);
+
+	switch (rc) {
+	case H_SUCCESS:
+		return 0;
+	case H_PARAMETER:
+		pr_err("HCALL(%x): Invalid window ID %u\n", H_GET_NX_FAULT,
+		       winid);
+		return -EINVAL;
+	case H_STATE:
+		pr_err("HCALL(%x): No outstanding faults for window ID %u\n",
+		       H_GET_NX_FAULT, winid);
+		return -EINVAL;
+	case H_PRIVILEGE:
+		pr_err("HCALL(%x): Window(%u): Invalid fault buffer 0x%llx\n",
+		       H_GET_NX_FAULT, winid, buffer);
+		return -EACCES;
+	default:
+		pr_err("HCALL(%x): Unexpected error %lld for window(%u)\n",
+		       H_GET_NX_FAULT, rc, winid);
+		return -EIO;
+	}
+}
+
+/*
+ * Handle the fault interrupt.
+ * When the fault interrupt is received for each window, query pHyp to get
+ * the fault CRB on the specific fault. Then process the CRB by updating
+ * CSB or send signal if the user space CSB is invalid.
+ * Note: pHyp forwards an interrupt for each fault request. So one fault
+ *	CRB to process for each H_GET_NX_FAULT HCALL.
+ */
+irqreturn_t pseries_vas_fault_thread_fn(int irq, void *data)
+{
+	struct vas_window *txwin = data;
+	struct coprocessor_request_block crb;
+	struct vas_user_win_ref *tsk_ref;
+	int rc;
+
+	rc = plpar_get_nx_fault(txwin->winid, (u64)virt_to_phys(&crb));
+	if (!rc) {
+		tsk_ref = &txwin->task_ref;
+		vas_dump_crb(&crb);
+		vas_update_csb(&crb, tsk_ref);
+	}
+
+	return IRQ_HANDLED;
+}
+
 /*
  * Allocate window and setup IRQ mapping.
  */
@@ -235,10 +291,51 @@ static int allocate_setup_window(struct vas_window *txwin,
 	rc = plpar_vas_allocate_window(txwin, domain, wintype, DEF_WIN_CREDS);
 	if (rc)
 		return rc;
+	/*
+	 * On powerVM, pHyp setup and forwards the fault interrupt per
+	 * window. So the IRQ setup and fault handling will be done for
+	 * each open window separately.
+	 */
+	txwin->lpar.fault_virq = irq_create_mapping(NULL,
+						    txwin->lpar.fault_irq);
+	if (!txwin->lpar.fault_virq) {
+		pr_err("Failed irq mapping %d\n", txwin->lpar.fault_irq);
+		rc = -EINVAL;
+		goto out_win;
+	}
+
+	txwin->lpar.name = kasprintf(GFP_KERNEL, "vas-win-%d", txwin->winid);
+	if (!txwin->lpar.name) {
+		rc = -ENOMEM;
+		goto out_irq;
+	}
+
+	rc = request_threaded_irq(txwin->lpar.fault_virq, NULL,
+				  pseries_vas_fault_thread_fn, IRQF_ONESHOT,
+				  txwin->lpar.name, txwin);
+	if (rc) {
+		pr_err("VAS-Window[%d]: Request IRQ(%u) failed with %d\n",
+		       txwin->winid, txwin->lpar.fault_virq, rc);
+		goto out_free;
+	}
 
 	txwin->wcreds_max = DEF_WIN_CREDS;
 
 	return 0;
+out_free:
+	kfree(txwin->lpar.name);
+out_irq:
+	irq_dispose_mapping(txwin->lpar.fault_virq);
+out_win:
+	plpar_vas_deallocate_window(txwin->winid);
+	return rc;
+}
+
+static inline void free_irq_setup(struct vas_window *txwin)
+{
+	free_irq(txwin->lpar.fault_virq, txwin);
+	irq_dispose_mapping(txwin->lpar.fault_virq);
+	kfree(txwin->lpar.name);
 }
 
 static struct vas_window *vas_allocate_window(struct vas_tx_win_open_attr *uattr,
@@ -353,6 +450,11 @@ static struct vas_window *vas_allocate_window(struct vas_tx_win_open_attr *uattr
 	return txwin;
 
 out_free:
+	/*
+	 * Window is not operational. Free IRQ before closing
+	 * window so that do not have to hold mutex.
+	 */
+	free_irq_setup(txwin);
 	plpar_vas_deallocate_window(txwin->winid);
 out:
 	atomic_dec(&ct_caps->used_lpar_creds);
@@ -371,7 +473,16 @@ static int deallocate_free_window(struct vas_window *win)
 {
 	int rc = 0;
 
+	/*
+	 * Free IRQ after executing H_DEALLOCATE_VAS_WINDOW HCALL
+	 * to close the window. pHyp waits for all requests including
+	 * faults are processed before closing the window - Means all
+	 * credits are returned. In the case of fault request, credit
+	 * is returned after OS issues H_GET_NX_FAULT HCALL.
+	 */
 	rc = plpar_vas_deallocate_window(win->winid);
+	if (!rc)
+		free_irq_setup(win);
 
 	return rc;
 }
-- 
2.18.2


