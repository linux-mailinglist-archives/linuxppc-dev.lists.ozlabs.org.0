Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE064C63EF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 08:45:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6XVW0h2nz3bYY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 18:45:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IlRBrc+Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IlRBrc+Y; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6XTg6vQ9z3bvW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 18:44:55 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21S6c9oa021391; 
 Mon, 28 Feb 2022 07:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=uzd/NXZBOMBlBYQ51YrPkceg/rCKCYihAtRzkt2YLMI=;
 b=IlRBrc+YKKC25ZZwYGR5jfg1Y8v7v4JwtKBbGEV974/JiCecG2vM3/R9ciK3N7MlYbVg
 T7rCT0vF99L8TgdHj9awSPBPbQz9UmidTrMLVp+KnP9psvpX5vQ46xsOD1+PYdEjc6rD
 M2FBQaN88W1fZ23wsFuAv+QtoyCuagPNQ2MsKl4Itju5pUnol/WbfegRjzZbT4/ZN6fk
 foJvFhYMhses2+Ay2Eq7FKjt6TkSlD3PM+cYx+TkrtoE5YLt3CBti/Hpc10o+blElAMb
 0aS6ATIPDIM0J7mU/L1g48M/S5IJABUnQkwgKRUFCitGfQexArTjVsvF1tLnJzP8oZxx +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egkmw06q5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:44:51 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21S7Canw008571;
 Mon, 28 Feb 2022 07:44:50 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egkmw06pv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:44:50 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21S7bIOI006185;
 Mon, 28 Feb 2022 07:44:50 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 3egfsrn62s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:44:50 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21S7igWd13435212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 07:44:42 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 377EC136066;
 Mon, 28 Feb 2022 07:44:42 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F22CA13605D;
 Mon, 28 Feb 2022 07:44:40 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.161.44])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 28 Feb 2022 07:44:40 +0000 (GMT)
Message-ID: <581a41997767b4b35590f39a2d10b431d11174b6.camel@linux.ibm.com>
Subject: [PATCH v5 9/9] powerpc/pseries/vas: Add 'update_total_credits'
 entry for QoS capabilities
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sun, 27 Feb 2022 23:44:39 -0800
In-Reply-To: <ccd9c0f85005c56b4d011d5c2384444ae71bda69.camel@linux.ibm.com>
References: <ccd9c0f85005c56b4d011d5c2384444ae71bda69.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Key7l7Yk2-CHCm5dFmjHUgmRdIx5bB89
X-Proofpoint-ORIG-GUID: a6WBErUg0uKPY-7h45g-M0c5z_Bfrn1z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202280043
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


pseries supports two types of credits - Default (uses normal priority
FIFO) and Qality of service (QoS uses high priority FIFO). The user
decides the number of QoS credits and sets this value with HMC
interface. The total credits for QoS capabilities can be changed
dynamically with HMC interface which invokes drmgr to communicate
to the kernel.

This patch creats 'update_total_credits' entry for QoS capabilities
so that drmgr command can write the new target QoS credits in sysfs.
Instead of using this value, the kernel gets the new QoS capabilities
from the hypervisor whenever update_total_credits is updated to make
sure sync with the QoS target credits in the hypervisor.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas-sysfs.c | 54 +++++++++++++++++++---
 arch/powerpc/platforms/pseries/vas.c       |  2 +-
 arch/powerpc/platforms/pseries/vas.h       |  1 +
 3 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas-sysfs.c b/arch/powerpc/platforms/pseries/vas-sysfs.c
index e24d3edb3021..4a7fcde5afc0 100644
--- a/arch/powerpc/platforms/pseries/vas-sysfs.c
+++ b/arch/powerpc/platforms/pseries/vas-sysfs.c
@@ -25,6 +25,27 @@ struct vas_caps_entry {
 
 #define to_caps_entry(entry) container_of(entry, struct vas_caps_entry, kobj)
 
+/*
+ * This function is used to get the notification from the drmgr when
+ * QoS credits are changed. Though receiving the target total QoS
+ * credits here, get the official QoS capabilities from the hypervisor.
+ */
+static ssize_t update_total_credits_trigger(struct vas_cop_feat_caps *caps,
+						const char *buf, size_t count)
+{
+	int err;
+	u16 creds;
+
+	err = kstrtou16(buf, 0, &creds);
+	if (!err)
+		err = vas_reconfig_capabilties(caps->win_type);
+
+	if (err)
+		return -EINVAL;
+
+	return count;
+}
+
 #define sysfs_caps_entry_read(_name)					\
 static ssize_t _name##_show(struct vas_cop_feat_caps *caps, char *buf) 	\
 {									\
@@ -63,17 +84,29 @@ struct vas_sysfs_entry {
  *	changed dynamically by the user.
  * /sys/devices/vas/vas0/gzip/qos_capabilities/nr_used_credits
  *	Number of credits used by the user space.
+ * /sys/devices/vas/vas0/gzip/qos_capabilities/update_total_credits
+ *	Update total QoS credits dynamically
  */
 
 VAS_ATTR_RO(nr_total_credits);
 VAS_ATTR_RO(nr_used_credits);
 
-static struct attribute *vas_capab_attrs[] = {
+static struct vas_sysfs_entry update_total_credits_attribute =
+	__ATTR(update_total_credits, 0200, NULL, update_total_credits_trigger);
+
+static struct attribute *vas_def_capab_attrs[] = {
 	&nr_total_credits_attribute.attr,
 	&nr_used_credits_attribute.attr,
 	NULL,
 };
 
+static struct attribute *vas_qos_capab_attrs[] = {
+	&nr_total_credits_attribute.attr,
+	&nr_used_credits_attribute.attr,
+	&update_total_credits_attribute.attr,
+	NULL,
+};
+
 static ssize_t vas_type_show(struct kobject *kobj, struct attribute *attr,
 			     char *buf)
 {
@@ -118,19 +151,29 @@ static const struct sysfs_ops vas_sysfs_ops = {
 	.store	=	vas_type_store,
 };
 
-static struct kobj_type vas_attr_type = {
+static struct kobj_type vas_def_attr_type = {
 		.release	=	vas_type_release,
 		.sysfs_ops      =       &vas_sysfs_ops,
-		.default_attrs  =       vas_capab_attrs,
+		.default_attrs  =       vas_def_capab_attrs,
 };
 
-static char *vas_caps_kobj_name(struct vas_cop_feat_caps *caps,
+static struct kobj_type vas_qos_attr_type = {
+		.release	=	vas_type_release,
+		.sysfs_ops	=	&vas_sysfs_ops,
+		.default_attrs	=	vas_qos_capab_attrs,
+};
+
+static char *vas_caps_kobj_name(struct vas_caps_entry *centry,
 				struct kobject **kobj)
 {
+	struct vas_cop_feat_caps *caps = centry->caps;
+
 	if (caps->descriptor == VAS_GZIP_QOS_CAPABILITIES) {
+		kobject_init(&centry->kobj, &vas_qos_attr_type);
 		*kobj = gzip_caps_kobj;
 		return "qos_capabilities";
 	} else if (caps->descriptor == VAS_GZIP_DEFAULT_CAPABILITIES) {
+		kobject_init(&centry->kobj, &vas_def_attr_type);
 		*kobj = gzip_caps_kobj;
 		return "default_capabilities";
 	} else
@@ -152,9 +195,8 @@ int sysfs_add_vas_caps(struct vas_cop_feat_caps *caps)
 	if (!centry)
 		return -ENOMEM;
 
-	kobject_init(&centry->kobj, &vas_attr_type);
 	centry->caps = caps;
-	name  = vas_caps_kobj_name(caps, &kobj);
+	name  = vas_caps_kobj_name(centry, &kobj);
 
 	if (kobj) {
 		ret = kobject_add(&centry->kobj, kobj, "%s", name);
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index ca0ad191229d..591c7597db5a 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -722,7 +722,7 @@ static int reconfig_close_windows(struct vas_caps *vcap, int excess_creds)
  * changes. Reconfig window configurations based on the credits
  * availability from this new capabilities.
  */
-static int vas_reconfig_capabilties(u8 type)
+int vas_reconfig_capabilties(u8 type)
 {
 	struct hv_vas_cop_feat_caps *hv_caps;
 	struct vas_cop_feat_caps *caps;
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
index f1bdb776021e..4ddb1001a0aa 100644
--- a/arch/powerpc/platforms/pseries/vas.h
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -130,5 +130,6 @@ struct pseries_vas_window {
 };
 
 int sysfs_add_vas_caps(struct vas_cop_feat_caps *caps);
+int vas_reconfig_capabilties(u8 type);
 int __init sysfs_pseries_vas_init(struct vas_all_caps *vas_caps);
 #endif /* _VAS_H */
-- 
2.27.0


