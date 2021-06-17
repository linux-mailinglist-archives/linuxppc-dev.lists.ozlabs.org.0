Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D13E3ABD8E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 22:37:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5Ykm59pvz3dmf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:37:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NR/vTKD8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NR/vTKD8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5YkJ0cd5z3cBQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 06:36:39 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HKXg2S139347; Thu, 17 Jun 2021 16:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=IY4sBoOjrESxu6twk50bAH0mE9iDmvxjxGJ5HMN/DjE=;
 b=NR/vTKD8xy9g+PEXqbVbsib76fmqHIAOxnFhAwmvbPvobhI5j7sN3OcJF7BbaVGFnYr8
 CoWgbVGviRCRlb/olnKhaRPAQ57pJP6586wXsE6EJvGD71YVG69ogJrhDq+2CnLjTBHP
 NQiZM7DYcS2z5CiRlB2+2b1dG2M53ZvNPoAE2V9rjeaAG/8RVXDcwH+Oncbp8A0JduLc
 PKWxKV/4qiOeakldHRarXAtgY9Wl9s0JDjiVbn4dz7xwWb/as9r6OzlRem9Qn/7eUhSH
 EoYF3mY/PP0iai1jCuiUH57WZxEfuB9kfdiWhJ6nmbRiHt3Bod8Kg0R53tpxON+v0R4Q Sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398bpeubhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:36:33 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HKYNSE141094;
 Thu, 17 Jun 2021 16:36:33 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398bpeubgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:36:33 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HKHkUd023181;
 Thu, 17 Jun 2021 20:36:32 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 394mjaermt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 20:36:32 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HKaVBm40960262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 20:36:31 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8412BAE060;
 Thu, 17 Jun 2021 20:36:31 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B0C2AE062;
 Thu, 17 Jun 2021 20:36:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.180.39])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 20:36:30 +0000 (GMT)
Message-ID: <e8d956bace3f182c4d2e66e343ff37cb0391d1fd.camel@linux.ibm.com>
Subject: [PATCH v6 12/17] powerpc/pseries/vas: Integrate API with open/close
 windows
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Thu, 17 Jun 2021 13:36:28 -0700
In-Reply-To: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
References: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2-UuAoeVgPlsNcNOigJG0l2tgZkDcs34
X-Proofpoint-ORIG-GUID: 3sjtOJXnDGNe-UYZyN19iyfRWWBeZfIz
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_16:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 adultscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106170123
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
hcalls. Also changes to integrate with the existing user space VAS
API and provide register/unregister functions to NX pseries driver.

The driver register function is used to create the user space
interface (/dev/crypto/nx-gzip) and unregister to remove this entry.

The user space process opens this device node and makes an ioctl
to allocate VAS window. The close interface is used to deallocate
window.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/vas.h          |   4 +
 arch/powerpc/platforms/pseries/Makefile |   1 +
 arch/powerpc/platforms/pseries/vas.c    | 223 ++++++++++++++++++++++++
 3 files changed, 228 insertions(+)

diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index 99570c33058f..57573d9c1e09 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -254,6 +254,10 @@ struct vas_all_caps {
 	u64     feat_type;
 };
 
+int h_query_vas_capabilities(const u64 hcall, u8 query_type, u64 result);
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
index 93794e12527d..f5a44f2f0e99 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -10,6 +10,7 @@
 #include <linux/export.h>
 #include <linux/types.h>
 #include <linux/delay.h>
+#include <linux/slab.h>
 #include <asm/machdep.h>
 #include <asm/hvcall.h>
 #include <asm/plpar_wrappers.h>
@@ -25,6 +26,7 @@ static struct vas_all_caps caps_all;
 static bool copypaste_feat;
 
 static struct vas_caps vascaps[VAS_MAX_FEAT_TYPE];
+static DEFINE_MUTEX(vas_pseries_mutex);
 
 static long hcall_return_busy_check(long rc)
 {
@@ -151,6 +153,227 @@ int h_query_vas_capabilities(const u64 hcall, u8 query_type, u64 result)
 			hcall, rc, query_type, result);
 	return -EIO;
 }
+EXPORT_SYMBOL_GPL(h_query_vas_capabilities);
+
+/*
+ * Allocate window and setup IRQ mapping.
+ */
+static int allocate_setup_window(struct pseries_vas_window *txwin,
+				 u64 *domain, u8 wintype)
+{
+	int rc;
+
+	rc = h_allocate_vas_window(txwin, domain, wintype, DEF_WIN_CREDS);
+	if (rc)
+		return rc;
+
+	txwin->vas_win.wcreds_max = DEF_WIN_CREDS;
+
+	return 0;
+}
+
+static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
+					      enum vas_cop_type cop_type)
+{
+	long domain[PLPAR_HCALL9_BUFSIZE] = {VAS_DEFAULT_DOMAIN_ID};
+	struct vas_cop_feat_caps *cop_feat_caps;
+	struct vas_caps *caps;
+	struct pseries_vas_window *txwin;
+	int rc;
+
+	txwin = kzalloc(sizeof(*txwin), GFP_KERNEL);
+	if (!txwin)
+		return ERR_PTR(-ENOMEM);
+
+	/*
+	 * A VAS window can have many credits which means that many
+	 * requests can be issued simultaneously. But the hypervisor
+	 * restricts one credit per window.
+	 * The hypervisor introduces 2 different types of credits:
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
+	if (flags & VAS_TX_WIN_FLAG_QOS_CREDIT)
+		caps = &vascaps[VAS_GZIP_QOS_FEAT_TYPE];
+	else
+		caps = &vascaps[VAS_GZIP_DEF_FEAT_TYPE];
+
+	cop_feat_caps = &caps->caps;
+
+	if (atomic_inc_return(&cop_feat_caps->used_lpar_creds) >
+			atomic_read(&cop_feat_caps->target_lpar_creds)) {
+		pr_err("Credits are not available to allocate window\n");
+		rc = -EINVAL;
+		goto out;
+	}
+
+	if (vas_id == -1) {
+		/*
+		 * The user space is requesting to allocate a window on
+		 * a VAS instance where the process is executing.
+		 * On PowerVM, domain values are passed to the hypervisor
+		 * to select VAS instance. Useful if the process is
+		 * affinity to NUMA node.
+		 * The hypervisor selects VAS instance if
+		 * VAS_DEFAULT_DOMAIN_ID (-1) is passed for domain values.
+		 * The h_allocate_vas_window hcall is defined to take a
+		 * domain values as specified by h_home_node_associativity,
+		 * So no unpacking needs to be done.
+		 */
+		rc = plpar_hcall9(H_HOME_NODE_ASSOCIATIVITY, domain,
+				  VPHN_FLAG_VCPU, smp_processor_id());
+		if (rc != H_SUCCESS) {
+			pr_err("H_HOME_NODE_ASSOCIATIVITY error: %d\n", rc);
+			goto out;
+		}
+	}
+
+	/*
+	 * Allocate / Deallocate window hcalls and setup / free IRQs
+	 * have to be protected with mutex.
+	 * Open VAS window: Allocate window hcall and setup IRQ
+	 * Close VAS window: Deallocate window hcall and free IRQ
+	 *	The hypervisor waits until all NX requests are
+	 *	completed before closing the window. So expects OS
+	 *	to handle NX faults, means IRQ can be freed only
+	 *	after the deallocate window hcall is returned.
+	 * So once the window is closed with deallocate hcall before
+	 * the IRQ is freed, it can be assigned to new allocate
+	 * hcall with the same fault IRQ by the hypervisor. It can
+	 * result in setup IRQ fail for the new window since the
+	 * same fault IRQ is not freed by the OS before.
+	 */
+	mutex_lock(&vas_pseries_mutex);
+	rc = allocate_setup_window(txwin, (u64 *)&domain[0],
+				   cop_feat_caps->win_type);
+	mutex_unlock(&vas_pseries_mutex);
+	if (rc)
+		goto out;
+
+	/*
+	 * Modify window and it is ready to use.
+	 */
+	rc = h_modify_vas_window(txwin);
+	if (!rc)
+		rc = get_vas_user_win_ref(&txwin->vas_win.task_ref);
+	if (rc)
+		goto out_free;
+
+	vas_user_win_add_mm_context(&txwin->vas_win.task_ref);
+	txwin->win_type = cop_feat_caps->win_type;
+	mutex_lock(&vas_pseries_mutex);
+	list_add(&txwin->win_list, &caps->list);
+	mutex_unlock(&vas_pseries_mutex);
+
+	return &txwin->vas_win;
+
+out_free:
+	h_deallocate_vas_window(txwin->vas_win.winid);
+out:
+	atomic_dec(&cop_feat_caps->used_lpar_creds);
+	kfree(txwin);
+	return ERR_PTR(rc);
+}
+
+static u64 vas_paste_address(struct vas_window *vwin)
+{
+	struct pseries_vas_window *win;
+
+	win = container_of(vwin, struct pseries_vas_window, vas_win);
+	return win->win_addr;
+}
+
+static int deallocate_free_window(struct pseries_vas_window *win)
+{
+	int rc = 0;
+
+	rc = h_deallocate_vas_window(win->vas_win.winid);
+
+	return rc;
+}
+
+static int vas_deallocate_window(struct vas_window *vwin)
+{
+	struct pseries_vas_window *win;
+	struct vas_cop_feat_caps *caps;
+	int rc = 0;
+
+	if (!vwin)
+		return -EINVAL;
+
+	win = container_of(vwin, struct pseries_vas_window, vas_win);
+
+	/* Should not happen */
+	if (win->win_type >= VAS_MAX_FEAT_TYPE) {
+		pr_err("Window (%u): Invalid window type %u\n",
+				vwin->winid, win->win_type);
+		return -EINVAL;
+	}
+
+	caps = &vascaps[win->win_type].caps;
+	mutex_lock(&vas_pseries_mutex);
+	rc = deallocate_free_window(win);
+	if (rc) {
+		mutex_unlock(&vas_pseries_mutex);
+		return rc;
+	}
+
+	list_del(&win->win_list);
+	atomic_dec(&caps->used_lpar_creds);
+	mutex_unlock(&vas_pseries_mutex);
+
+	put_vas_user_win_ref(&vwin->task_ref);
+	mm_context_remove_vas_window(vwin->task_ref.mm);
+
+	kfree(win);
+	return 0;
+}
+
+static const struct vas_user_win_ops vops_pseries = {
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


