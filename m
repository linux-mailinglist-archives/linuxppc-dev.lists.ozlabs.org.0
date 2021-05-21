Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A17C38C36D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 11:39:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmhQt41Qdz3c58
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 19:39:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IcXM3OXZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IcXM3OXZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmhQR4kQpz2yWK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 19:39:27 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L9YEP9175177; Fri, 21 May 2021 05:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=gcAQ3ZEjixB7Vmk+mCTeGe5mnwr0OfTzHDi7YupFGFo=;
 b=IcXM3OXZns8vM2JILvXwpMDicsoTSTWTJ7I2Wogk6x+U2XOz5BNEzaZiDKkyNvWLCp6V
 aviTcF7IaS/FgmetpBbPjrPWkyB8NgEWrrU9lhCsqCsYu6+YzKEjzO1RCo/2FXntnKnw
 Ny1fLPKbDu9cMnMxppznFjIW0tQK5fJwkM4H45nByZEGzRnC4F2mtf12H6V2SFpGtu7z
 LlcmuJeQykvG/YbUt+ItURw7AexBCr6X1px1pGEkbwFAAFb9Mn4kFuKYkhn9nlFPQgUN
 k510RT+vcnt3n+9QapRTRnhbkw0HrGueWDdZ34lJR2glXrvtQzoy8vxDCZAKsiHYu3FO sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p4bfh68h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 05:39:21 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14L9ZqXl183334;
 Fri, 21 May 2021 05:39:21 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p4bfh680-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 05:39:20 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L9X0hg015062;
 Fri, 21 May 2021 09:39:19 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 38j5x9xk6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 09:39:19 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14L9dJDj23789848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 09:39:19 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49E2AAC05F;
 Fri, 21 May 2021 09:39:19 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C81DAC059;
 Fri, 21 May 2021 09:39:18 +0000 (GMT)
Received: from sig-9-65-94-165.ibm.com (unknown [9.65.94.165])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 09:39:18 +0000 (GMT)
Message-ID: <9adb88bca74e927f97e29b3ad8415f284ae5b1dc.camel@linux.ibm.com>
Subject: [PATCH v4 11/16] powerpc/pseries/vas: Integrate API with open/close
 windows
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Fri, 21 May 2021 02:39:16 -0700
In-Reply-To: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5wAd6AVjNHfFSl7eciDNqZ-y2xZOrlr1
X-Proofpoint-GUID: eI9ccRccGGJO0DMqolWH5_Cq1nWO2Lny
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105210061
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


This patch adds VAS window allocatioa/close with the corresponding
HCALLs. Also changes to integrate with the existing user space VAS
API and provide register/unregister functions to NX pseries driver.

The driver register function is used to create the user space
interface (/dev/crypto/nx-gzip) and unregister to remove this entry.

The user space process opens this device node and makes an ioctl
to allocate VAS window. The close interface is used to deallocate
window.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/vas.h          |   5 +
 arch/powerpc/platforms/pseries/Makefile |   1 +
 arch/powerpc/platforms/pseries/vas.c    | 217 ++++++++++++++++++++++++
 3 files changed, 223 insertions(+)

diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index 371f62d99174..d38372bcb3f8 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -279,6 +279,11 @@ struct vas_all_caps {
 	u64     feat_type;
 };
 
+int plpar_vas_query_capabilities(const u64 hcall, u8 query_type,
+				 u64 result);
+int vas_register_api_pseries(struct module *mod,
+			     enum vas_cop_type cop_type, const char *name);
+void vas_unregister_api_pseries(void);
 #endif
 
 /*
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index c8a2b0b05ac0..4cda0ef87be0 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -30,3 +30,4 @@ obj-$(CONFIG_PPC_SVM)		+= svm.o
 obj-$(CONFIG_FA_DUMP)		+= rtas-fadump.o
 
 obj-$(CONFIG_SUSPEND)		+= suspend.o
+obj-$(CONFIG_PPC_VAS)		+= vas.o
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 9976f6b614b9..ef0c455f6e93 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -222,6 +222,223 @@ int plpar_vas_query_capabilities(const u64 hcall, u8 query_type,
 		return -EIO;
 	}
 }
+EXPORT_SYMBOL_GPL(plpar_vas_query_capabilities);
+
+/*
+ * Allocate window and setup IRQ mapping.
+ */
+static int allocate_setup_window(struct vas_window *txwin,
+				 u64 *domain, u8 wintype)
+{
+	int rc;
+
+	rc = plpar_vas_allocate_window(txwin, domain, wintype, DEF_WIN_CREDS);
+	if (rc)
+		return rc;
+
+	txwin->wcreds_max = DEF_WIN_CREDS;
+
+	return 0;
+}
+
+static struct vas_window *vas_allocate_window(struct vas_tx_win_open_attr *uattr,
+					      enum vas_cop_type cop_type)
+{
+	long domain[PLPAR_HCALL9_BUFSIZE] = {VAS_DEFAULT_DOMAIN_ID};
+	struct vas_ct_caps *ct_caps;
+	struct vas_caps *caps;
+	struct vas_window *txwin;
+	int rc;
+
+	txwin = kzalloc(sizeof(*txwin), GFP_KERNEL);
+	if (!txwin)
+		return ERR_PTR(-ENOMEM);
+
+	/*
+	 * A VAS window can have many credits which means that many
+	 * requests can be issued simultaneously. But phyp restricts
+	 * one credit per window.
+	 * phyp introduces 2 different types of credits:
+	 * Default credit type (Uses normal priority FIFO):
+	 *	A limited number of credits are assigned to partitions
+	 *	based on processor entitlement. But these credits may be
+	 *	over-committed on a system depends on whether the CPUs
+	 *	are in shared or dedicated modes - that is, more requests
+	 *	may be issued across the system than NX can service at
+	 *	once which can result in paste command failure (RMA_busy).
+	 *	Then the process has to resend requests or fall-back to
+	 *	SW compression.
+	 * Quality of Service (QoS) credit type (Uses high priority FIFO):
+	 *	To avoid NX HW contention, the system admins can assign
+	 *	QoS credits for each LPAR so that this partition is
+	 *	guaranteed access to NX resources. These credits are
+	 *	assigned to partitions via the HMC.
+	 *	Refer PAPR for more information.
+	 *
+	 * Allocate window with QoS credits if user requested. Otherwise
+	 * default credits are used.
+	 */
+	if (uattr->flags & VAS_TX_WIN_FLAG_QOS_CREDIT)
+		caps = &vascaps[VAS_GZIP_QOS_FEAT_TYPE];
+	else
+		caps = &vascaps[VAS_GZIP_DEF_FEAT_TYPE];
+
+	ct_caps = &caps->caps;
+
+	if (atomic_inc_return(&ct_caps->used_lpar_creds) >
+			atomic_read(&ct_caps->target_lpar_creds)) {
+		pr_err("Credits are not available to allocate window\n");
+		rc = -EINVAL;
+		goto out;
+	}
+
+	/*
+	 * The user space is requesting to allocate a window on a VAS
+	 * instance (or chip) where the process is executing.
+	 * On powerVM, domain values are passed to pHyp to select chip /
+	 * VAS instance. Useful if the process is affinity to NUMA node.
+	 * pHyp selects VAS instance if VAS_DEFAULT_DOMAIN_ID (-1) is
+	 * passed for domain values.
+	 */
+	if (uattr->vas_id == -1) {
+		/*
+		 * To allocate VAS window, pass same domain values returned
+		 * from this HCALL.
+		 */
+		rc = plpar_hcall9(H_HOME_NODE_ASSOCIATIVITY, domain,
+				  VPHN_FLAG_VCPU, smp_processor_id());
+		if (rc != H_SUCCESS) {
+			pr_err("HCALL(%x): failed with ret(%d)\n",
+			       H_HOME_NODE_ASSOCIATIVITY, rc);
+			goto out;
+		}
+	}
+
+	/*
+	 * Allocate / Deallocate window HCALLs and setup / free IRQs
+	 * have to be protected with mutex.
+	 * Open VAS window: Allocate window HCALL and setup IRQ
+	 * Close VAS window: Deallocate window HCALL and free IRQ
+	 *	The hypervisor waits until all NX requests are
+	 *	completed before closing the window. So expects OS
+	 *	to handle NX faults, means IRQ can be freed only
+	 *	after the deallocate window HCALL is returned.
+	 * So once the window is closed with deallocate HCALL before
+	 * the IRQ is freed, it can be assigned to new allocate
+	 * HCALL with the same fault IRQ by the hypervisor. It can
+	 * result in setup IRQ fail for the new window since the
+	 * same fault IRQ is not freed by the OS.
+	 */
+	mutex_lock(&vas_pseries_mutex);
+	rc = allocate_setup_window(txwin, (u64 *)&domain[0],
+				   ct_caps->win_type);
+	mutex_unlock(&vas_pseries_mutex);
+	if (rc)
+		goto out;
+
+	/*
+	 * Modify window and it is ready to use.
+	 */
+	rc = plpar_vas_modify_window(txwin);
+	if (!rc)
+		rc = vas_reference_pid_mm(&txwin->task_ref);
+	if (rc)
+		goto out_free;
+
+	txwin->lpar.win_type = ct_caps->win_type;
+	mutex_lock(&vas_pseries_mutex);
+	list_add(&txwin->lpar.win_list, &caps->list);
+	mutex_unlock(&vas_pseries_mutex);
+
+	return txwin;
+
+out_free:
+	plpar_vas_deallocate_window(txwin->winid);
+out:
+	atomic_dec(&ct_caps->used_lpar_creds);
+	kfree(txwin);
+	return ERR_PTR(rc);
+}
+
+static u64 vas_paste_address(void *addr)
+{
+	struct vas_window *win = addr;
+
+	return win->lpar.win_addr;
+}
+
+static int deallocate_free_window(struct vas_window *win)
+{
+	int rc = 0;
+
+	rc = plpar_vas_deallocate_window(win->winid);
+
+	return rc;
+}
+
+static int vas_deallocate_window(void *addr)
+{
+	struct vas_window *win = (struct vas_window *)addr;
+	struct vas_ct_caps *caps;
+	int rc = 0;
+
+	if (!win)
+		return -EINVAL;
+
+	/* Should not happen */
+	if (win->lpar.win_type >= VAS_MAX_FEAT_TYPE) {
+		pr_err("Window (%u): Invalid window type %u\n",
+				win->winid, win->lpar.win_type);
+		return -EINVAL;
+	}
+
+	caps = &vascaps[win->lpar.win_type].caps;
+	mutex_lock(&vas_pseries_mutex);
+	rc = deallocate_free_window(win);
+	if (rc) {
+		mutex_unlock(&vas_pseries_mutex);
+		return rc;
+	}
+
+	list_del(&win->lpar.win_list);
+	atomic_dec(&caps->used_lpar_creds);
+	mutex_unlock(&vas_pseries_mutex);
+
+	vas_drop_reference_pid_mm(&win->task_ref);
+
+	kfree(win);
+	return 0;
+}
+
+static struct vas_user_win_ops vops_pseries = {
+	.open_win	= vas_allocate_window,	/* Open and configure window */
+	.paste_addr	= vas_paste_address,	/* To do copy/paste */
+	.close_win	= vas_deallocate_window, /* Close window */
+};
+
+/*
+ * Supporting only nx-gzip coprocessor type now, but this API code
+ * extended to other coprocessor types later.
+ */
+int vas_register_api_pseries(struct module *mod, enum vas_cop_type cop_type,
+			     const char *name)
+{
+	int rc;
+
+	if (!copypaste_feat)
+		return -ENOTSUPP;
+
+	rc = vas_register_coproc_api(mod, cop_type, name, &vops_pseries);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(vas_register_api_pseries);
+
+void vas_unregister_api_pseries(void)
+{
+	vas_unregister_coproc_api();
+}
+EXPORT_SYMBOL_GPL(vas_unregister_api_pseries);
 
 /*
  * Get the specific capabilities based on the feature type.
-- 
2.18.2


