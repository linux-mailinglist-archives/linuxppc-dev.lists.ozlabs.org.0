Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F37FE4BCA90
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 21:04:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K1KJd27mdz3dng
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Feb 2022 07:04:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CDRZ8d0U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CDRZ8d0U; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1KHx4dwdz30Bc
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 07:03:25 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21JJAodk032665; 
 Sat, 19 Feb 2022 20:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=GIVlS+hGhX1kXJ3QSioA2YylX1KnP3QtJv2x3eIo5rs=;
 b=CDRZ8d0U2ZEf14Ht0oYH0juUYShVYkgbKCURk/xChgJLQr9vO2lQXUNwpDPyx/yUjVes
 J5Y5IfpSeuVNvPesc0NFiV4oXffkQIdt5ZXQq/bBsveoVYS0qaZy+XWHDUnMnQ336NKr
 NPlbfqjkDxJt7V4O4Kov8pqN33qRxLk9xIgKGgaNNkMzKEIbp2xu/ARxElG3d65IiUWw
 +EXaKkHUxGEhkquooGm4oVUrvghri5+Oo69Vuybq4E14xKEgwG2Ifkpb2p5x58z9BIQt
 5DbnXbjELT4qLw6nCoaSahJo5tZ7b5e2LYMDq1KEdDIKqF9/GjirrXBy2yPJDCEPZZp6 vA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eb5pmh33e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:03:20 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21JJrvKG023567;
 Sat, 19 Feb 2022 20:03:20 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eb5pmh337-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:03:20 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21JJwC4B002694;
 Sat, 19 Feb 2022 20:03:19 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 3ear697mtk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:03:19 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21JK3HZ416056880
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Feb 2022 20:03:17 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E7946A047;
 Sat, 19 Feb 2022 20:03:17 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E01226A058;
 Sat, 19 Feb 2022 20:03:15 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 19 Feb 2022 20:03:15 +0000 (GMT)
Message-ID: <790aac27437fdd13b6e1dac36682b123f9050b04.camel@linux.ibm.com>
Subject: [PATCH v4 9/9] powerpc/pseries/vas: Write 'nr_total_credits' for
 QoS credits change
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sat, 19 Feb 2022 12:03:13 -0800
In-Reply-To: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
References: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7-dLhc9eqtBvrGLRfveCS0Zmf2Lk5LEm
X-Proofpoint-GUID: V3YfZA5AsP4vaR_tnJF0gY0SqtQuKDCk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-19_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202190130
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
interface. With the core add/removal, this value can be changed in HMC
which invokes drmgr to communicate to the kernel.

This patch adds an interface so that drmgr command can write the new
target QoS credits in sysfs. But the kernel gets the new QoS
capabilities from the hypervisor whenever nr_total_credits is updated
to make sure sync with the values in the hypervisor.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas-sysfs.c | 33 +++++++++++++++++++++-
 arch/powerpc/platforms/pseries/vas.c       |  2 +-
 arch/powerpc/platforms/pseries/vas.h       |  1 +
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas-sysfs.c b/arch/powerpc/platforms/pseries/vas-sysfs.c
index e24d3edb3021..20745cd75f27 100644
--- a/arch/powerpc/platforms/pseries/vas-sysfs.c
+++ b/arch/powerpc/platforms/pseries/vas-sysfs.c
@@ -25,6 +25,33 @@ struct vas_caps_entry {
 
 #define to_caps_entry(entry) container_of(entry, struct vas_caps_entry, kobj)
 
+/*
+ * This function is used to get the notification from the drmgr when
+ * QoS credits are changed. Though receiving the target total QoS
+ * credits here, get the official QoS capabilities from the hypervisor.
+ */
+static ssize_t nr_total_credits_store(struct vas_cop_feat_caps *caps,
+				       const char *buf, size_t count)
+{
+	int err;
+	u16 creds;
+
+	/*
+	 * Nothing to do for default credit type.
+	 */
+	if (caps->win_type == VAS_GZIP_DEF_FEAT_TYPE)
+		return -EOPNOTSUPP;
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
@@ -41,6 +68,10 @@ struct vas_sysfs_entry {
 	sysfs_caps_entry_read(_name);		\
 	static struct vas_sysfs_entry _name##_attribute = __ATTR(_name,	\
 				0444, _name##_show, NULL);
+#define VAS_ATTR(_name)							\
+	sysfs_caps_entry_read(_name);					\
+	static struct vas_sysfs_entry _name##_attribute = __ATTR(_name, \
+				0644, _name##_show, _name##_store)
 
 /*
  * Create sysfs interface:
@@ -65,7 +96,7 @@ struct vas_sysfs_entry {
  *	Number of credits used by the user space.
  */
 
-VAS_ATTR_RO(nr_total_credits);
+VAS_ATTR(nr_total_credits);
 VAS_ATTR_RO(nr_used_credits);
 
 static struct attribute *vas_capab_attrs[] = {
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


