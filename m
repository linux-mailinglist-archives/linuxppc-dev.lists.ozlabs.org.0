Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9F84DE741
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 10:29:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KLFv555SGz3bN8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 20:29:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cxw9Ivzh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Cxw9Ivzh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KLFtL0tSrz3000
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Mar 2022 20:28:25 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22J359JI016482; 
 Sat, 19 Mar 2022 09:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RvyCl5Cukb6dY9JmjqKiY5L9lFuEK/A9rxhkWqs2KZY=;
 b=Cxw9IvzhtiNGjH1QYMulBLfb+9GAyr5soDSOuQp+1s5QWEQ829oDG7CgLai7xVjLlObQ
 7ZFeb8/64YZ/+VFcsNgA+2o4VXluAI+gMJ4/OeVze7/kP6NU64vzna+PWuDkoKeHxIy8
 O3GoQNIyQ5swSIYMTRwFtHBMY0mA3m/zytROkWm9dUlTOpPYY5wGt385wF85RjZQWl0/
 X6Or0Eq+e3hlapTsVSXvi3uBaYKjxN9qwpJINI3BUXRPGaudJcJa58FGA8XYdjc/ikgS
 qeGd0PkqIJGa7I/Zqb10zu3xrKb0QYwLi0x55hFG/E+D26tvOzm7ofwiLJQM/sJZHB1W Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ew6y63q6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Mar 2022 09:28:17 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22J9SHvR021279;
 Sat, 19 Mar 2022 09:28:17 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ew6y63q68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Mar 2022 09:28:17 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22J9SAA7001563;
 Sat, 19 Mar 2022 09:28:16 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04wdc.us.ibm.com with ESMTP id 3ew6t91fc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Mar 2022 09:28:15 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22J9SCNl36897150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Mar 2022 09:28:12 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C121678067;
 Sat, 19 Mar 2022 09:28:12 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 228A078064;
 Sat, 19 Mar 2022 09:28:11 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.14.140])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 19 Mar 2022 09:28:10 +0000 (GMT)
Message-ID: <76d156f8af1e03cc09369d68e0bfad0c40031bcc.camel@linux.ibm.com>
Subject: [PATCH] powerpc/pseries/vas: Use QoS credits from the userspace
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sat, 19 Mar 2022 02:28:09 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sKbCq1EgXHqwQsKYTGTrRh1uF96nBpQe
X-Proofpoint-ORIG-GUID: flhhbjfIb_3-WjeLeRIBytIelwgZnUaP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-19_01,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203190058
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


The user can change the QoS credits dynamically with the
management console interface which notifies OS with sysfs. After
returning from the OS interface successfully, the management
console updates the hypervisor. Since the VAS capabilities in
the hypervisor is not updated when the OS gets the update,
the kernel is using the old total credits value from the
hypervisor. Fix this issue by using the new QoS credits
from the userspace instead of depending on VAS capabilities
from the hypervisor.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas-sysfs.c | 19 +++++++++++++-----
 arch/powerpc/platforms/pseries/vas.c       | 23 +++++++++++-----------
 arch/powerpc/platforms/pseries/vas.h       |  2 +-
 3 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas-sysfs.c b/arch/powerpc/platforms/pseries/vas-sysfs.c
index 4a7fcde5afc0..f3c58c309cff 100644
--- a/arch/powerpc/platforms/pseries/vas-sysfs.c
+++ b/arch/powerpc/platforms/pseries/vas-sysfs.c
@@ -27,22 +27,31 @@ struct vas_caps_entry {
 
 /*
  * This function is used to get the notification from the drmgr when
- * QoS credits are changed. Though receiving the target total QoS
- * credits here, get the official QoS capabilities from the hypervisor.
+ * QoS credits are changed.
  */
-static ssize_t update_total_credits_trigger(struct vas_cop_feat_caps *caps,
+static ssize_t update_total_credits_store(struct vas_cop_feat_caps *caps,
 						const char *buf, size_t count)
 {
 	int err;
 	u16 creds;
 
 	err = kstrtou16(buf, 0, &creds);
+	/*
+	 * The user space interface from the management console
+	 * notifies OS with the new QoS credits and then the
+	 * hypervisor. So OS has to use this new credits value
+	 * and reconfigure VAS windows (close or reopen depends
+	 * on the credits available) instead of depending on VAS
+	 * QoS capabilities from the hypervisor.
+	 */
 	if (!err)
-		err = vas_reconfig_capabilties(caps->win_type);
+		err = vas_reconfig_capabilties(caps->win_type, creds);
 
 	if (err)
 		return -EINVAL;
 
+	pr_info("Set QoS total credits %u\n", creds);
+
 	return count;
 }
 
@@ -92,7 +101,7 @@ VAS_ATTR_RO(nr_total_credits);
 VAS_ATTR_RO(nr_used_credits);
 
 static struct vas_sysfs_entry update_total_credits_attribute =
-	__ATTR(update_total_credits, 0200, NULL, update_total_credits_trigger);
+	__ATTR(update_total_credits, 0200, NULL, update_total_credits_store);
 
 static struct attribute *vas_def_capab_attrs[] = {
 	&nr_total_credits_attribute.attr,
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 1f59d78c77a1..ec643bbdb67f 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -779,10 +779,10 @@ static int reconfig_close_windows(struct vas_caps *vcap, int excess_creds,
  * changes. Reconfig window configurations based on the credits
  * availability from this new capabilities.
  */
-int vas_reconfig_capabilties(u8 type)
+int vas_reconfig_capabilties(u8 type, int new_nr_creds)
 {
 	struct vas_cop_feat_caps *caps;
-	int old_nr_creds, new_nr_creds;
+	int old_nr_creds;
 	struct vas_caps *vcaps;
 	int rc = 0, nr_active_wins;
 
@@ -795,12 +795,6 @@ int vas_reconfig_capabilties(u8 type)
 	caps = &vcaps->caps;
 
 	mutex_lock(&vas_pseries_mutex);
-	rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES, vcaps->feat,
-				      (u64)virt_to_phys(&hv_cop_caps));
-	if (rc)
-		goto out;
-
-	new_nr_creds = be16_to_cpu(hv_cop_caps.target_lpar_creds);
 
 	old_nr_creds = atomic_read(&caps->nr_total_credits);
 
@@ -832,7 +826,6 @@ int vas_reconfig_capabilties(u8 type)
 					false);
 	}
 
-out:
 	mutex_unlock(&vas_pseries_mutex);
 	return rc;
 }
@@ -850,7 +843,7 @@ static int pseries_vas_notifier(struct notifier_block *nb,
 	struct of_reconfig_data *rd = data;
 	struct device_node *dn = rd->dn;
 	const __be32 *intserv = NULL;
-	int len, rc = 0;
+	int new_nr_creds, len, rc = 0;
 
 	if ((action == OF_RECONFIG_ATTACH_NODE) ||
 		(action == OF_RECONFIG_DETACH_NODE))
@@ -862,7 +855,15 @@ static int pseries_vas_notifier(struct notifier_block *nb,
 	if (!intserv)
 		return NOTIFY_OK;
 
-	rc = vas_reconfig_capabilties(VAS_GZIP_DEF_FEAT_TYPE);
+	rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES,
+					vascaps[VAS_GZIP_DEF_FEAT_TYPE].feat,
+					(u64)virt_to_phys(&hv_cop_caps));
+	if (!rc) {
+		new_nr_creds = be16_to_cpu(hv_cop_caps.target_lpar_creds);
+		rc = vas_reconfig_capabilties(VAS_GZIP_DEF_FEAT_TYPE,
+						new_nr_creds);
+	}
+
 	if (rc)
 		pr_err("Failed reconfig VAS capabilities with DLPAR\n");
 
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
index 34177881e998..333ffa2f9f42 100644
--- a/arch/powerpc/platforms/pseries/vas.h
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -135,7 +135,7 @@ struct pseries_vas_window {
 };
 
 int sysfs_add_vas_caps(struct vas_cop_feat_caps *caps);
-int vas_reconfig_capabilties(u8 type);
+int vas_reconfig_capabilties(u8 type, int new_nr_creds);
 int __init sysfs_pseries_vas_init(struct vas_all_caps *vas_caps);
 
 #ifdef CONFIG_PPC_VAS
-- 
2.27.0


