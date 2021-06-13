Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA95C3A57DC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jun 2021 13:03:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G2sBl1Tlmz3dZv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jun 2021 21:03:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qRLS0lVb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qRLS0lVb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G2sBH5Tvvz2yyQ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 21:03:03 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15DAZSel045599; Sun, 13 Jun 2021 07:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=S2ja+rEURN3ZheB/lQz+Cq4AkSB1IReBBaIbGxM8ms0=;
 b=qRLS0lVb6+apftP3dIku+rzbcjlH0/OtsQwdwF7PfudrKKBFofHNhkeU6A/UYBWkK296
 zg2kBx76t45wlbx2e/NA652tYtnYht8TpzauhkMPO0BGMrYq8VDMGDRI12xrCvRb0Q3C
 BxAwG7emMrrUg7StTM8JKDJB+KDXSNrvIPPAFKHHIOYF0WXjCauZcwWcar3Dda/880FU
 6hYq2I87rgNOE2ebsAfN4jzx18MfTp3N/mL0nPskdNKx/x9uQ2r7k8n7B6uKMg0N/l9r
 QvpbtdWecvl/A9g6dls3N9jw7gnVdcr+y1aEoPZu/sUU6gn/8mKpvRECOGyFN6Cy1NoH iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 395eaxtchb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Jun 2021 07:02:56 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15DAv5Pg106155;
 Sun, 13 Jun 2021 07:02:55 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 395eaxtch7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Jun 2021 07:02:55 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15DAvxKZ012059;
 Sun, 13 Jun 2021 11:02:55 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 394yr5pdac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Jun 2021 11:02:55 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15DB2sqo12124448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Jun 2021 11:02:54 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4862CB205F;
 Sun, 13 Jun 2021 11:02:54 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5468CB2066;
 Sun, 13 Jun 2021 11:02:53 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.180.39])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Sun, 13 Jun 2021 11:02:53 +0000 (GMT)
Message-ID: <8a9fe47a17d1f89cc43885d2ef8c2f09e4e90d7a.camel@linux.ibm.com>
Subject: [PATCH v5 13/17] powerpc/pseries/vas: Setup IRQ and fault handling
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Sun, 13 Jun 2021 04:02:50 -0700
In-Reply-To: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Sya3i_J_BxTRyxf-IUAI8gmA7HORUC_D
X-Proofpoint-GUID: 6ivaQs69vE7uI5ofXkWhOugHzVYkt3GU
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-13_04:2021-06-11,
 2021-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106130078
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
 arch/powerpc/platforms/pseries/vas.c | 108 +++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index fe375f7a7029..55185bdd3776 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -11,6 +11,7 @@
 #include <linux/types.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
+#include <linux/interrupt.h>
 #include <asm/machdep.h>
 #include <asm/hvcall.h>
 #include <asm/plpar_wrappers.h>
@@ -190,6 +191,58 @@ int h_query_vas_capabilities(const u64 hcall, u8 query_type, u64 result)
 }
 EXPORT_SYMBOL_GPL(h_query_vas_capabilities);
 
+/*
+ * hcall to get fault CRB from pHyp.
+ */
+static int h_get_nx_fault(u32 winid, u64 buffer)
+{
+	long rc;
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
+	case H_PRIVILEGE:
+		pr_err("HCALL(%x): Window(%u): Invalid fault buffer 0x%llx\n",
+		       H_GET_NX_FAULT, winid, buffer);
+		return -EACCES;
+	default:
+		pr_err("HCALL(%x): Failed with error %ld for window(%u)\n",
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
+	struct pseries_vas_window *txwin = data;
+	struct coprocessor_request_block crb;
+	struct vas_user_win_ref *tsk_ref;
+	int rc;
+
+	rc = h_get_nx_fault(txwin->vas_win.winid, (u64)virt_to_phys(&crb));
+	if (!rc) {
+		tsk_ref = &txwin->vas_win.task_ref;
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
@@ -201,10 +254,51 @@ static int allocate_setup_window(struct pseries_vas_window *txwin,
 	rc = h_allocate_vas_window(txwin, domain, wintype, DEF_WIN_CREDS);
 	if (rc)
 		return rc;
+	/*
+	 * On powerVM, pHyp setup and forwards the fault interrupt per
+	 * window. So the IRQ setup and fault handling will be done for
+	 * each open window separately.
+	 */
+	txwin->fault_virq = irq_create_mapping(NULL, txwin->fault_irq);
+	if (!txwin->fault_virq) {
+		pr_err("Failed irq mapping %d\n", txwin->fault_irq);
+		rc = -EINVAL;
+		goto out_win;
+	}
+
+	txwin->name = kasprintf(GFP_KERNEL, "vas-win-%d",
+				txwin->vas_win.winid);
+	if (!txwin->name) {
+		rc = -ENOMEM;
+		goto out_irq;
+	}
+
+	rc = request_threaded_irq(txwin->fault_virq, NULL,
+				  pseries_vas_fault_thread_fn, IRQF_ONESHOT,
+				  txwin->name, txwin);
+	if (rc) {
+		pr_err("VAS-Window[%d]: Request IRQ(%u) failed with %d\n",
+		       txwin->vas_win.winid, txwin->fault_virq, rc);
+		goto out_free;
+	}
 
 	txwin->vas_win.wcreds_max = DEF_WIN_CREDS;
 
 	return 0;
+out_free:
+	kfree(txwin->name);
+out_irq:
+	irq_dispose_mapping(txwin->fault_virq);
+out_win:
+	h_deallocate_vas_window(txwin->vas_win.winid);
+	return rc;
+}
+
+static inline void free_irq_setup(struct pseries_vas_window *txwin)
+{
+	free_irq(txwin->fault_virq, txwin);
+	irq_dispose_mapping(txwin->fault_virq);
+	kfree(txwin->name);
 }
 
 static struct vas_window *vas_allocate_window(struct vas_tx_win_open_attr *uattr,
@@ -320,6 +414,11 @@ static struct vas_window *vas_allocate_window(struct vas_tx_win_open_attr *uattr
 	return &txwin->vas_win;
 
 out_free:
+	/*
+	 * Window is not operational. Free IRQ before closing
+	 * window so that do not have to hold mutex.
+	 */
+	free_irq_setup(txwin);
 	h_deallocate_vas_window(txwin->vas_win.winid);
 out:
 	atomic_dec(&ct_caps->used_lpar_creds);
@@ -339,7 +438,16 @@ static int deallocate_free_window(struct pseries_vas_window *win)
 {
 	int rc = 0;
 
+	/*
+	 * Free IRQ after executing H_DEALLOCATE_VAS_WINDOW HCALL
+	 * to close the window. pHyp waits for all requests including
+	 * faults are processed before closing the window - Means all
+	 * credits are returned. In the case of fault request, credit
+	 * is returned after OS issues H_GET_NX_FAULT HCALL.
+	 */
 	rc = h_deallocate_vas_window(win->vas_win.winid);
+	if (!rc)
+		free_irq_setup(win);
 
 	return rc;
 }
-- 
2.18.2


