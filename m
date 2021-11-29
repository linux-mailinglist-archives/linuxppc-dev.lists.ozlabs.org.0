Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0588B461D2B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 18:56:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2tMr6XwMz3fMR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 04:56:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kRepqt/w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kRepqt/w; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2tKx09Syz3c71
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 04:55:16 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHMksj012226; 
 Mon, 29 Nov 2021 17:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=MqVfBW/c6gJnGhPOWJAs1Rc9gGEmrlJGEKbEcukhGOw=;
 b=kRepqt/w3DCzMu5AZTTPQBit9V4tY3mCvDMplHU67IMa4mLG3bPR7X6572++E7imViUL
 yNZQjzsnj4ErwDvN3XfPwyZHvK43I0ZV7Yxt7culbMgLfjyAqvUovhi79DzwTwVBXAab
 P+siqC6qiWn/I6Tc1Yv3UMYaRYallKPAmFSqJbVYJ3Xgdity6QjPXk39omeiGnAiQsr7
 V1Upu8j2fXj5NX1s3OKP25XIajKJ/Exvp+sZH2ivBr4GfIQakEBZI1xy2t8dD+z9XXqP
 MWz06vABSgHCpY7ritoZ8W+2XSURKvq6CyNzfa2NnWkDPWIHEnmW52tOsi3NyTvrVeJI BA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cn3788pkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:55:11 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ATHUXkm002600;
 Mon, 29 Nov 2021 17:55:11 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cn3788pkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:55:11 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHruaE016262;
 Mon, 29 Nov 2021 17:55:10 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 3ckcab1vha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:55:10 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ATHt95d57278748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 17:55:09 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C44978081;
 Mon, 29 Nov 2021 17:55:09 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1223E78068;
 Mon, 29 Nov 2021 17:55:08 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.7.253])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 29 Nov 2021 17:55:07 +0000 (GMT)
Message-ID: <0e020faaa026da75797a735f8b19ba7c7a28c8d1.camel@linux.ibm.com>
Subject: [PATCH 10/10] powerpc/pseries/vas: Write 'target_creds' for QoS
 credits change
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Mon, 29 Nov 2021 09:55:06 -0800
In-Reply-To: <a2187018b4e030fe6c7e408b3a73c37c85472e10.camel@linux.ibm.com>
References: <a2187018b4e030fe6c7e408b3a73c37c85472e10.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vB4CEUet4iBHFtlpk-CTduYJ-LIqvJdZ
X-Proofpoint-ORIG-GUID: Vkh0-9ozj9c3RGDkynSP6Aj2bZwguv1J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_10,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111290082
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


PowerVM support two types of credits - Default (uses normal priority
FIFO) and Qality of service (QoS uses high priproty FIFO). The user
decides the number of QoS credits and sets this value with HMC
interface. With the core add/removal, this value can be changed in HMC
which invokes drmgr to communicate to the kernel.

This patch adds an interface so that drmgr command can write the new
target QoS credits in sysfs. But the kernel gets the new QoS
capabilities from the hypervisor whenever target_creds is updated
to make sure sync with the values in the hypervisor.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas-sysfs.c | 34 +++++++++++++++++++++-
 arch/powerpc/platforms/pseries/vas.c       |  2 +-
 arch/powerpc/platforms/pseries/vas.h       |  1 +
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas-sysfs.c b/arch/powerpc/platforms/pseries/vas-sysfs.c
index 625082bebcb2..5bae2269d194 100644
--- a/arch/powerpc/platforms/pseries/vas-sysfs.c
+++ b/arch/powerpc/platforms/pseries/vas-sysfs.c
@@ -32,6 +32,34 @@ static ssize_t avail_creds_show(struct vas_cop_feat_caps *caps, char *buf)
 	return sprintf(buf, "%d\n", avail_creds);
 }
 
+/*
+ * This function is used to get the notification from the drmgr when
+ * QoS credits are changed as part of DLPAR core add/removal. Though
+ * receiving the total QoS credits here, get the official QoS
+ * capabilities from the hypervisor.
+ */
+static ssize_t target_creds_store(struct vas_cop_feat_caps *caps,
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
 #define sysfs_capbs_entry_read(_name)					\
 static ssize_t _name##_show(struct vas_cop_feat_caps *caps, char *buf) 	\
 {									\
@@ -48,8 +76,12 @@ struct vas_sysfs_entry {
 	sysfs_capbs_entry_read(_name);		\
 	static struct vas_sysfs_entry _name##_attribute = __ATTR(_name,	\
 				0444, _name##_show, NULL);
+#define VAS_ATTR(_name)							\
+	sysfs_capbs_entry_read(_name);					\
+	static struct vas_sysfs_entry _name##_attribute = __ATTR(_name, \
+				0644, _name##_show, _name##_store)
 
-VAS_ATTR_RO(target_creds);
+VAS_ATTR(target_creds);
 VAS_ATTR_RO(used_creds);
 
 static struct vas_sysfs_entry avail_creds_attribute =
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index c769c8534b3a..d271fa71bded 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -707,7 +707,7 @@ static int reconfig_close_windows(struct vas_caps *vcap, int excess_creds)
  * changes. Reconfig window configurations based on the credits
  * availability from this new capabilities.
  */
-static int vas_reconfig_capabilties(u8 type)
+int vas_reconfig_capabilties(u8 type)
 {
 	int lpar_creds, avail_creds, excess_creds;
 	struct hv_vas_cop_feat_caps *hv_caps;
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
index 15bcadf8872a..e369db35f0fd 100644
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


