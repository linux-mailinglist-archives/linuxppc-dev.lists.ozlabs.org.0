Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 842E7461CFA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 18:47:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2t9T2rkKz3cYS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 04:47:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q8gkGMV+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=q8gkGMV+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2t8s2wplz2yHM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 04:47:25 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHGC0k005149; 
 Mon, 29 Nov 2021 17:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=azobKao7kbnvdoMWTlKyAKYOGvveAoIGhsrr/v5VuE4=;
 b=q8gkGMV+5kuI98cgm9XU26Za6SKx+Rz2HG03SLh3MkUE6Ed0+MXOjqprREnx2elOqonL
 4Cg2qqR1ZkN2iHRvHPi17T+PpaNXkRZmw7c5aC45gs4Fphu9JfWKRGT3SEWUEvCfd8qG
 hUfuaK8rhWukGJNz1eGR5sEFOjczjzuxknSW0isyXg/T+kmjrKVp8S6P6lZDw6RecEKy
 MfWaRcUP0jABusIRbUrktGysuxXSgHvOVoTRrKlzxFlkBIz9RIUmw8qZbIzIunTvAK4e
 vHgXrQ12X0VNSAZYsOUdxFaoKF8HMuKto4GamCrGlTdH+1NIHuroAsP2d4NJp4RqhkEI hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cn3458rgy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:47:17 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ATHcMkP008945;
 Mon, 29 Nov 2021 17:47:17 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cn3458rgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:47:17 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHgcgg028730;
 Mon, 29 Nov 2021 17:47:15 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 3ckcaag3by-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:47:15 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ATHlE4m57934212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 17:47:15 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D780C2805C;
 Mon, 29 Nov 2021 17:47:14 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E20702805A;
 Mon, 29 Nov 2021 17:47:13 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.7.253])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 29 Nov 2021 17:47:13 +0000 (GMT)
Message-ID: <3d2eb6e197c6c7908d938126ef46ac0e7dabfd09.camel@linux.ibm.com>
Subject: [PATCH 02/10] powerpc/pseries/vas: Add notifier for DLPAR core
 removal/add
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Mon, 29 Nov 2021 09:47:11 -0800
In-Reply-To: <a2187018b4e030fe6c7e408b3a73c37c85472e10.camel@linux.ibm.com>
References: <a2187018b4e030fe6c7e408b3a73c37c85472e10.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5Ffd10JMESGU3i75WGSnXrnPM9B1m3nQ
X-Proofpoint-ORIG-GUID: ii56K9xiRn5aNqcI08UMejU_jK9kLxgS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_10,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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


