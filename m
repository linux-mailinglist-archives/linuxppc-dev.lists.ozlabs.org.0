Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DD635B0F4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 02:39:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHtLC3v4Vz3cSt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 10:39:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RT1tSaaK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RT1tSaaK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHtKn5WWZz2yjS
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 10:39:25 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13B0XO7x061484; Sat, 10 Apr 2021 20:39:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=EVjye/BBlFI2yu/VUn9jbJh5EK0czYfEgMLq/wGSBz8=;
 b=RT1tSaaKzBdYpRPQMlVBgr4Wr2Ghb0siwnH6RiiJzeu1Qh9XaLLk1q2mUlZah2Gzm4VK
 jo2l3FwivHprbxxNm7n1QK/LGN7Xmx3opcyDWN9rIy0YcG6lR48hlRa+DekpW50BeKVW
 viV4C4CExb/CfqffkRkwXx3U0tNRYbOKswZuRnS3VyrRIPpRh0m8vbbglE0nNq6Rxx3x
 R3vfj9ZUSzc8qCvNRT22Mi6oYYnHlHvuWlniNTBqstU2A/Hfrb/UnoISFlLnggyUKOT3
 icie6tJEMJ0xJYQhHgdIcYe+mKxKvtUynhdIxtYxkSRpdPGmVe0irCblxEhTsE0nddzc xA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37u4y7xwd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Apr 2021 20:39:18 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13B0Xa1H061914;
 Sat, 10 Apr 2021 20:39:18 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37u4y7xwd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Apr 2021 20:39:18 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13B0RxpV019955;
 Sun, 11 Apr 2021 00:39:17 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 37u3n86evr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Apr 2021 00:39:17 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13B0dFWd23789946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 11 Apr 2021 00:39:15 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1AF778066;
 Sun, 11 Apr 2021 00:39:15 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DE5678063;
 Sun, 11 Apr 2021 00:39:14 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.232.48])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 11 Apr 2021 00:39:14 +0000 (GMT)
Message-ID: <620bf714643eb18ba5a05e920881d36d9fc03d76.camel@linux.ibm.com>
Subject: [PATCH 10/16] powerpc/pseries/vas: Integrate API with open/close
 windows
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Sat, 10 Apr 2021 17:39:12 -0700
In-Reply-To: <b4631127bd025d9585246606c350ec88dbe1e99a.camel@linux.ibm.com>
References: <b4631127bd025d9585246606c350ec88dbe1e99a.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k72o3XhRMTi5uLYC8ywqUWryt3NepiSV
X-Proofpoint-ORIG-GUID: 4AQuDhtPNWdMP6Sx0-swCfMO7bEJHMH2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-10_07:2021-04-09,
 2021-04-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104110000
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
Cc: haren@linux.ibm.com
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
 arch/powerpc/Kconfig                    |   2 +-
 arch/powerpc/include/asm/vas.h          |   5 +
 arch/powerpc/platforms/pseries/Makefile |   1 +
 arch/powerpc/platforms/pseries/vas.c    | 212 ++++++++++++++++++++++++
 4 files changed, 219 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 7aa1fbf7c1dc..10853ee02b84 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -480,7 +480,7 @@ config PPC_UV
 
 config PPC_VAS
 	bool "IBM Virtual Accelerator Switchboard (VAS)"
-	depends on PPC_POWERNV && PPC_64K_PAGES
+	depends on (PPC_POWERNV || PPC_PSERIES) && PPC_64K_PAGES
 	default y
 	help
 	  This enables support for IBM Virtual Accelerator Switchboard (VAS).
diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index d15784506a54..aa1974aba27e 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -270,6 +270,11 @@ struct vas_all_capabs {
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
index 35946fb02995..0ade0d6d728f 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -222,6 +222,218 @@ int plpar_vas_query_capabilities(const u64 hcall, u8 query_type,
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
+	struct vas_ct_capabs *ct_capab;
+	struct vas_capabs *capabs;
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
+	if (uattr->flags & VAS_WIN_QOS_CREDITS)
+		capabs = &vcapabs[VAS_GZIP_QOS_FEAT_TYPE];
+	else
+		capabs = &vcapabs[VAS_GZIP_DEF_FEAT_TYPE];
+
+	ct_capab = &capabs->capab;
+
+	if (atomic_inc_return(&ct_capab->used_lpar_creds) >
+			atomic_read(&ct_capab->target_lpar_creds)) {
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
+	 * have to be protected with mutex. Otherwise, since IRQ is freed
+	 * after deallocate HCALL, may see the case where window ID and
+	 * fault interrupt could be reused before free IRQ (for the old
+	 * window) in kernel. It can result in setup IRQ fail for the
+	 * new window.
+	 */
+	mutex_lock(&vas_pseries_mutex);
+	rc = allocate_setup_window(txwin, (u64 *)&domain[0],
+				   ct_capab->win_type);
+	mutex_unlock(&vas_pseries_mutex);
+	if (rc)
+		goto out;
+
+	/*
+	 * Modify window and it is ready to use.
+	 */
+	rc = plpar_vas_modify_window(txwin);
+	if (!rc)
+		rc = vas_reference_task(&txwin->task);
+	if (rc)
+		goto out_free;
+
+	txwin->lpar.win_type = ct_capab->win_type;
+	mutex_lock(&vas_pseries_mutex);
+	list_add(&txwin->lpar.win_list, &capabs->list);
+	mutex_unlock(&vas_pseries_mutex);
+
+	return txwin;
+
+out_free:
+	plpar_vas_deallocate_window(txwin->winid);
+out:
+	atomic_dec(&ct_capab->used_lpar_creds);
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
+	if (!rc)
+		kfree(win->lpar.name);
+
+	return rc;
+}
+
+static int vas_deallocate_window(void *addr)
+{
+	struct vas_window *win = (struct vas_window *)addr;
+	struct vas_ct_capabs *capabs;
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
+	capabs = &vcapabs[win->lpar.win_type].capab;
+	mutex_lock(&vas_pseries_mutex);
+	rc = deallocate_free_window(win);
+	if (rc) {
+		mutex_unlock(&vas_pseries_mutex);
+		return rc;
+	}
+
+	list_del(&win->lpar.win_list);
+	atomic_dec(&capabs->used_lpar_creds);
+	mutex_unlock(&vas_pseries_mutex);
+
+	vas_drop_reference_task(&win->task);
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


