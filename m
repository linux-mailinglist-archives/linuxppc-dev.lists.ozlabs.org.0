Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA0E35DA0D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 10:27:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKJcy3mtXz3dnZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 18:27:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NSIQ6EK6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NSIQ6EK6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKJcW53PMz2ydJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 18:27:07 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13D83Xc2172381; Tue, 13 Apr 2021 04:27:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=w/j4sQ6u0E3NetS+ST1UrLgc/chewiQxhgJ00C45B8w=;
 b=NSIQ6EK6jluITHWtA0hSJd4eNkihfsnAu+6NxTfqxJavb/4vNilsL6ZViSsSEkTTVtqF
 9xdzwei3D24qROLTkGYsSnRcSBtsfz/az9y2Jbw2Gt7Ypw689Xg0SjtNlTQQmtw31cHt
 7pleFUoaYJe1uFIkxV2KniAG/J0jF8uBlHHjRRgpkE3tf+XXtVwR6wAnjnvncO9bU09v
 pCGVhrg+ssiOVY6PAD9jNMIdiX0lfz1Fwbsj2b3H8kFJq2ZjriZbcV0HrUmZFTeeQypQ
 z4eeVWt5E8939OdlJze1DtFshAZUtMBgBjjsEsnuJ87Ikvn0QILUnwsV66gvYaFWpDwv nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37vkd62f1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 04:27:01 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13D83mCk173286;
 Tue, 13 Apr 2021 04:27:00 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37vkd62f17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 04:27:00 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13D8NUjd018537;
 Tue, 13 Apr 2021 08:27:00 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 37u3n9q4a3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 08:27:00 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13D8Qx1t26411332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 08:26:59 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CE90AE062;
 Tue, 13 Apr 2021 08:26:59 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CBD3AE05F;
 Tue, 13 Apr 2021 08:26:58 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.232.48])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 08:26:58 +0000 (GMT)
Message-ID: <0b77b2646964a6fdabeaf33f22eeaa2ac7c25b91.camel@linux.ibm.com>
Subject: [V2 PATCH 11/16] powerpc/pseries/vas: Setup IRQ and fault handling
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Tue, 13 Apr 2021 01:26:56 -0700
In-Reply-To: <68aa9f2860f9acffa41469d3858883c938634722.camel@linux.ibm.com>
References: <68aa9f2860f9acffa41469d3858883c938634722.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FOaVWz4fq9jvKJhqoIUqt2omx-9I6QQn
X-Proofpoint-ORIG-GUID: l9eZ0wFmxYUiqs04NoKVl4HqyrPXc_p6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_03:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130055
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


When NX sees a fault on the user space buffer, generates a fault
interrupt and pHyp forwards that interrupt to OS. Then the kernel
makes H_GET_NX_FAULT HCALL to retrieve the fault CRB information.

This patch adds changes to setup IRQ per each window and handles
fault by updating CSB.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas.c | 111 ++++++++++++++++++++++++++-
 1 file changed, 110 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 0ade0d6d728f..2106eca0862a 100644
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
+	struct vas_win_task *tsk;
+	int rc;
+
+	rc = plpar_get_nx_fault(txwin->winid, (u64)virt_to_phys(&crb));
+	if (!rc) {
+		tsk = &txwin->task;
+		vas_dump_crb(&crb);
+		vas_update_csb(&crb, tsk);
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
@@ -346,6 +443,11 @@ static struct vas_window *vas_allocate_window(struct vas_tx_win_open_attr *uattr
 	return txwin;
 
 out_free:
+	/*
+	 * Window is not operational. Free IRQ before closing
+	 * window so that do not have to hold mutex.
+	 */
+	free_irq_setup(txwin);
 	plpar_vas_deallocate_window(txwin->winid);
 out:
 	atomic_dec(&ct_capab->used_lpar_creds);
@@ -364,9 +466,16 @@ static int deallocate_free_window(struct vas_window *win)
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
 	if (!rc)
-		kfree(win->lpar.name);
+		free_irq_setup(win);
 
 	return rc;
 }
-- 
2.18.2


