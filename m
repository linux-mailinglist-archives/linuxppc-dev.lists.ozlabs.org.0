Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B104C8046
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 02:17:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6zrX4s1zz3dv6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 12:17:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XerMfb19;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XerMfb19; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6zps3Drnz3dR3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 12:16:21 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2210mTts011530; 
 Tue, 1 Mar 2022 01:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=uzd/NXZBOMBlBYQ51YrPkceg/rCKCYihAtRzkt2YLMI=;
 b=XerMfb19qTXmD9cG4GAa7fLhN1QoNZC2J199ggy+xKVOyS+AvHA9l3zd4cbkJ7YD97te
 TB69r7L+VLj7sueHhnHaEGmYTCGdHQNMsaKfXJMIa0QapzfWuvAfnF5Gi93cgltX+rYH
 GPWd5HhHuG489T2o9NamPL2eubV97qyknZdbF0djT2TZpRlYj6imEQGYUwH7yLYfD+Gi
 GIgvdgcX2pD9ssxgK6YfSMifGuBXhoLNz8gmhzvv10qBZ/Hh9Ttx8nZ/gY3NRkZvX4R6
 EzJ8C42Dz1Hz3uuEBw9sde6fCd3yZuRYtVCEOQKrSCc0G3i+tpGOFr5Ica79izK7TaX/ xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eh996gftt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 01:16:17 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2211DPox001668;
 Tue, 1 Mar 2022 01:16:17 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eh996gfth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 01:16:17 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2210vjhc000317;
 Tue, 1 Mar 2022 01:16:16 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 3efbua6thr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 01:16:16 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2211GDZn21102870
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 01:16:13 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7649578068;
 Tue,  1 Mar 2022 01:16:13 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3978A7805C;
 Tue,  1 Mar 2022 01:16:12 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.161.44])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 01:16:12 +0000 (GMT)
Message-ID: <b01ef31a0f964686d00243e7de7f09c73c07e69e.camel@linux.ibm.com>
Subject: [PATCH v6 9/9] powerpc/pseries/vas: Add 'update_total_credits'
 entry for QoS capabilities
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Mon, 28 Feb 2022 17:16:10 -0800
In-Reply-To: <3968502921a0ce3c332d7fe8da8545ae85fc09d0.camel@linux.ibm.com>
References: <3968502921a0ce3c332d7fe8da8545ae85fc09d0.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1IVMwsIPCazP9AfanzXOfsmsR7tumJ5R
X-Proofpoint-ORIG-GUID: ATOLDhJeafQ22VpnbsBygy15UHRjqQuR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_10,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203010004
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


