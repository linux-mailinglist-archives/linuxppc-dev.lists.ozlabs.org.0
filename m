Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4268047DBFC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 01:26:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JK9wy1Mczz3cDY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 11:26:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NjinBNn8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NjinBNn8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JK9wC5V4Hz2yXc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Dec 2021 11:26:03 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMMC4xN027545; 
 Thu, 23 Dec 2021 00:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=azobKao7kbnvdoMWTlKyAKYOGvveAoIGhsrr/v5VuE4=;
 b=NjinBNn8yLseC/c6vxKxSMEN2RJoJSJ6AGX7nrkUPiS7gTACDk8ij2w2bSpKomtReDMG
 syNVkFh5Hfd+KshwIsiATQj31c7LlErNA9V/jvSzPtib7jo0LYEQFfeTps9BbIXwtG/x
 P93T6DwWcEBi4jgnPplayopsksl0KIoewiNaItLz/zK5ga/g47+VLDwNWMh0RY6RW3dv
 nSanog+t5wSYS/r3dNiVaP5OU4XjQMrQTW8B0shNk++HDY3+daXOx2wCY1qgFM5nyY7J
 hTWC+a2/wIaXN4PCyS3JRLyg99IevmrbBJYVS6nCAzqg5bEBLNPR8mFOBMd4tBW5X9U9 fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d4ckk1xqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:25:58 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BN0ImqE026443;
 Thu, 23 Dec 2021 00:25:58 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d4ckk1xqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:25:58 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BN0C8mY023078;
 Thu, 23 Dec 2021 00:25:57 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3d179c3mjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:25:57 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BN0PuPU31392182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Dec 2021 00:25:56 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6933E6A054;
 Thu, 23 Dec 2021 00:25:56 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71C4F6A047;
 Thu, 23 Dec 2021 00:25:55 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.90.83])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 23 Dec 2021 00:25:55 +0000 (GMT)
Message-ID: <64794a2b79c7605161117ff6d9cf95d478c05975.camel@linux.ibm.com>
Subject: [PATCH v2 02/10] powerpc/pseries/vas: Add notifier for DLPAR core
 removal/add
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Wed, 22 Dec 2021 16:25:53 -0800
In-Reply-To: <9d1730d5e0daf39ef17196b4699294dc2ccf4a63.camel@linux.ibm.com>
References: <9d1730d5e0daf39ef17196b4699294dc2ccf4a63.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uRFp8KZgw9WM-LEUBpxsxfsRrrXcB0aj
X-Proofpoint-ORIG-GUID: krjJvGV_YeP9urfU2GO9l-SimF8oPmSy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_09,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 adultscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220124
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


The hypervisor assigns credits for each LPAR based on number of
cores configured in that system. So expects to release credits
(means windows) when the core is removed. This patch adds notifier
for core removal/add so that the OS closes windows if the system
looses credits due to core removal and reopen windows when the
credits available later.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index ecdd21f517c0..04a6eee2301e 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -531,6 +531,36 @@ static int get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
 	return 0;
 }
 
+/*
+ * Total number of default credits available (target_credits)
+ * in LPAR depends on number of cores configured. It varies based on
+ * whether processors are in shared mode or dedicated mode.
+ * Get the notifier when CPU configuration is changed with DLPAR
+ * operation so that get the new target_credits (vas default capabilities)
+ * and then update the existing windows usage if needed.
+ */
+static int pseries_vas_notifier(struct notifier_block *nb,
+				unsigned long action, void *data)
+{
+	struct of_reconfig_data *rd = data;
+	struct device_node *dn = rd->dn;
+	const __be32 *intserv;
+	int len, rc = 0;
+
+	intserv = of_get_property(dn, "ibm,ppc-interrupt-server#s", &len);
+	/*
+	 * Processor config is not changed
+	 */
+	if (!intserv)
+		return NOTIFY_OK;
+
+	return rc;
+}
+
+static struct notifier_block pseries_vas_nb = {
+	.notifier_call = pseries_vas_notifier,
+};
+
 static int __init pseries_vas_init(void)
 {
 	struct hv_vas_cop_feat_caps *hv_cop_caps;
@@ -584,6 +614,10 @@ static int __init pseries_vas_init(void)
 			goto out_cop;
 	}
 
+	/* Processors can be added/removed only on LPAR */
+	if (copypaste_feat && firmware_has_feature(FW_FEATURE_LPAR))
+		of_reconfig_notifier_register(&pseries_vas_nb);
+
 	pr_info("GZIP feature is available\n");
 
 out_cop:
-- 
2.27.0


