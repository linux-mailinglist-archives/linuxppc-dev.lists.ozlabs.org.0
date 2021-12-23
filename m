Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7A047DC07
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 01:33:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKB4K01WQz3cRh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 11:33:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MqMbZVbO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MqMbZVbO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKB3W6XQwz3cXv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Dec 2021 11:32:23 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BN0BpEa018698; 
 Thu, 23 Dec 2021 00:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=YN5Ky8GAxY8aw/ya02MZVPtg7Whc6NGHBsSKfQNUbBo=;
 b=MqMbZVbO5l5i8I1a7KQXJDXMFh3QKo+2k5HPWpB6KwXZDrSMuHh7MfUZcYNs0medI52L
 b3ENseqqNzeen1Ti/pYhhww4GYkpgg+2CWgZsWPvrH0FRtjhcpQb4ukmBVniMkYBA50E
 9KRfeHx0f/e38Clti1GGSu3vyyQhULi6azq7VysoLeyilWe1zqZ9BA5ocqt/5ehO1p0e
 iqD29fvlpEbCRd0OBDcqisv7emzQnYazrYhOyJLJeSOW8vZPehqKb+rvdinVTAliAUpI
 LaEj9GSHHD5NKmheo95Fe+IfJDRatsSzwKtBW3phmFfAtuUz6ek0TWDXTonThrRP2SeT 9Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d4ebsr91m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:32:19 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BN0Ulhm013554;
 Thu, 23 Dec 2021 00:32:18 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d4ebsr915-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:32:18 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BN0DYus022447;
 Thu, 23 Dec 2021 00:32:17 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 3d179b88d7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:32:17 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BN0WGiG31195488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Dec 2021 00:32:16 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93842C6055;
 Thu, 23 Dec 2021 00:32:16 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6B33C605A;
 Thu, 23 Dec 2021 00:32:15 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.90.83])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 23 Dec 2021 00:32:15 +0000 (GMT)
Message-ID: <ae194e1f4bd51bc40e3f955ad14751e9a4dc8b1d.camel@linux.ibm.com>
Subject: [PATCH v2 10/10] powerpc/pseries/vas: Write 'target_creds' for QoS
 credits change
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Wed, 22 Dec 2021 16:32:13 -0800
In-Reply-To: <9d1730d5e0daf39ef17196b4699294dc2ccf4a63.camel@linux.ibm.com>
References: <9d1730d5e0daf39ef17196b4699294dc2ccf4a63.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: L0gOYAHrdG49pxTVtiBHQJFaFO_sll-p
X-Proofpoint-GUID: pPNZFVgVMannbV0ZY_ghqCKTher-9E3H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_09,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112230000
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
index 4b4048209c7d..169f0cccb166 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -714,7 +714,7 @@ static int reconfig_close_windows(struct vas_caps *vcap, int excess_creds)
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


