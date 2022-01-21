Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB7B496621
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 21:02:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgVdp1gG9z3dqp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 07:02:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kniGAmpq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kniGAmpq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgVd36KLJz3cmr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 07:01:27 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20LJfm58025643; 
 Fri, 21 Jan 2022 20:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=+84ZD8fjRpk/sxiIwjKXcD8XgkXu1RnCj5fZY7l66lc=;
 b=kniGAmpqZFJ8XWvkc4oREUOlYgDe09jzL+pexFWACn0x/vGFzzw1VNv+ewym0/smXJp2
 TExywaVJ8rsIM5ju7vdUaCo7TKmyZD6B0NFJJgythty8Q1Kh4JYxBuqVUC/ay4AT49QQ
 lvf+wXObyOB2K+tLy+zCtwZ/1ZVu4VLNktoSzEmirFFmWcqM+j/ywOBxh8pLYGKp+f4q
 jZuhcmgPzBnj0z7emu8zD8slVvBzaqI0FPKyUOcTafdSKDN74hRoKShXudgU3bqSTNFC
 LK8gAV3eBRqyLdbqTfH+B1kQHhtVS4qRzgM3Ll8bVx4hEdVVr6J8c1hp7niXMt9Nu9rc Kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dr37a0bsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 20:01:22 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20LJqop9008188;
 Fri, 21 Jan 2022 20:01:22 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dr37a0bs6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 20:01:22 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20LJqRaQ028217;
 Fri, 21 Jan 2022 20:01:21 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 3dqj1k6pc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 20:01:21 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20LK1K9424641898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jan 2022 20:01:20 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F5C478069;
 Fri, 21 Jan 2022 20:01:20 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 477C178067;
 Fri, 21 Jan 2022 20:01:19 +0000 (GMT)
Received: from sig-9-77-130-163.ibm.com (unknown [9.77.130.163])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 21 Jan 2022 20:01:18 +0000 (GMT)
Message-ID: <d79962482e09afb3daeb10fc8b528762291cb78d.camel@linux.ibm.com>
Subject: [PATCH v3 10/10] powerpc/pseries/vas: Write 'target_creds' for QoS
 credits change
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Fri, 21 Jan 2022 12:01:17 -0800
In-Reply-To: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uwZVCV0insoHI8iygnIryRcBHUzBm_s_
X-Proofpoint-GUID: x45Dtg3qbMyH54tpdEDxOrKsirejKz8a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_09,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201210128
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
index f7609cdef8f8..66f1a0224811 100644
--- a/arch/powerpc/platforms/pseries/vas-sysfs.c
+++ b/arch/powerpc/platforms/pseries/vas-sysfs.c
@@ -36,6 +36,34 @@ static ssize_t avail_creds_show(struct vas_cop_feat_caps *caps, char *buf)
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
@@ -52,8 +80,12 @@ struct vas_sysfs_entry {
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
index 32098e4a2786..3400f4fc6609 100644
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
index bc393bd74030..4cf1d0ef66a5 100644
--- a/arch/powerpc/platforms/pseries/vas.h
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -125,5 +125,6 @@ struct pseries_vas_window {
 };
 
 int sysfs_add_vas_caps(struct vas_cop_feat_caps *caps);
+int vas_reconfig_capabilties(u8 type);
 int __init sysfs_pseries_vas_init(struct vas_all_caps *vas_caps);
 #endif /* _VAS_H */
-- 
2.27.0


