Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB0F4BCA93
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 21:05:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K1KLq1Q8Zz3ccY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Feb 2022 07:05:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PJRp3vZE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PJRp3vZE; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1KL55v1Jz3bYs
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 07:05:17 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21JJGtTS009154; 
 Sat, 19 Feb 2022 20:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Ahzw8s0SEOJBMEo/UxBXpL6EsWbgSybFxsdKeNHtr6Q=;
 b=PJRp3vZEKQ8ZGohgGFFKugiMhIwCjyIrTNsaF0+bAUMx43dCBTcHgqi8TQAVHOTbXZb7
 gyg/i/cMeazvGE7ofc4d8Sl1oA0XfsyAb6L/VLX4UlJ8DYucl7h7IYCMbuKHybYefZYS
 snrxDGRF0KCyyGLesPD4NI68IZ43zWxPKcwm/5eALwylFMoCvpVahFPOo2SPFAB2X2HL
 +w7sj+htbZ09BUdACr85A17YqrC7xd+KyczFvWcab/+bEYik3rGmCccwDsY6g3zAhLKp
 684Bi4/hvZVahNtYapFaz3Tu0SiDoDbvsBaly6nOeCxEZcdBi/p/Hitb/2gI4RBMgVlJ GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eb6jk8my6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:05:14 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21JJrMjh012059;
 Sat, 19 Feb 2022 20:05:13 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eb6jk8mxj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:05:13 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21JK4SNc027622;
 Sat, 19 Feb 2022 20:05:12 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 3ear68x528-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:05:12 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21JK57P635848510
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Feb 2022 20:05:07 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2D4BAE066;
 Sat, 19 Feb 2022 20:05:07 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 239BCAE05C;
 Sat, 19 Feb 2022 20:05:07 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 19 Feb 2022 20:05:07 +0000 (GMT)
Message-ID: <d93b6cd28887e8ecf08b550d3483c0b50db64a4d.camel@linux.ibm.com>
Subject: [PATCH v3 1/4] powerpc/pseries/vas: Define global hv_cop_caps struct
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sat, 19 Feb 2022 12:05:05 -0800
In-Reply-To: <4a23d5ec655fd00da97b0b0b46174a3a3894bfb0.camel@linux.ibm.com>
References: <4a23d5ec655fd00da97b0b0b46174a3a3894bfb0.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NBuqPfbjTZEIVGIErfKyFTqYUdCCyZKw
X-Proofpoint-ORIG-GUID: 59eFYeJGFMLYb4IoaQTGdFfLZYaRpmfT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-19_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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


The coprocessor capabilities struct is used to get default and
QoS capabilities from the hypervisor during init, DLPAR event and
migration. So instead of allocating this struct for each event,
define global struct and reuse it which allows the migration code
to avoid adding an error path.

Also disable copy/paste feature flag if any capabilities HCALL
is failed.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Acked-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas.c | 47 ++++++++++++----------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 591c7597db5a..3bb219f54806 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -26,6 +26,7 @@
 
 static struct vas_all_caps caps_all;
 static bool copypaste_feat;
+static struct hv_vas_cop_feat_caps hv_cop_caps;
 
 static struct vas_caps vascaps[VAS_MAX_FEAT_TYPE];
 static DEFINE_MUTEX(vas_pseries_mutex);
@@ -724,7 +725,6 @@ static int reconfig_close_windows(struct vas_caps *vcap, int excess_creds)
  */
 int vas_reconfig_capabilties(u8 type)
 {
-	struct hv_vas_cop_feat_caps *hv_caps;
 	struct vas_cop_feat_caps *caps;
 	int old_nr_creds, new_nr_creds;
 	struct vas_caps *vcaps;
@@ -738,17 +738,13 @@ int vas_reconfig_capabilties(u8 type)
 	vcaps = &vascaps[type];
 	caps = &vcaps->caps;
 
-	hv_caps = kmalloc(sizeof(*hv_caps), GFP_KERNEL);
-	if (!hv_caps)
-		return -ENOMEM;
-
 	mutex_lock(&vas_pseries_mutex);
 	rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES, vcaps->feat,
-				      (u64)virt_to_phys(hv_caps));
+				      (u64)virt_to_phys(&hv_cop_caps));
 	if (rc)
 		goto out;
 
-	new_nr_creds = be16_to_cpu(hv_caps->target_lpar_creds);
+	new_nr_creds = be16_to_cpu(hv_cop_caps.target_lpar_creds);
 
 	old_nr_creds = atomic_read(&caps->nr_total_credits);
 
@@ -780,7 +776,6 @@ int vas_reconfig_capabilties(u8 type)
 
 out:
 	mutex_unlock(&vas_pseries_mutex);
-	kfree(hv_caps);
 	return rc;
 }
 /*
@@ -822,9 +817,8 @@ static struct notifier_block pseries_vas_nb = {
 
 static int __init pseries_vas_init(void)
 {
-	struct hv_vas_cop_feat_caps *hv_cop_caps;
 	struct hv_vas_all_caps *hv_caps;
-	int rc;
+	int rc = 0;
 
 	/*
 	 * Linux supports user space COPY/PASTE only with Radix
@@ -850,38 +844,37 @@ static int __init pseries_vas_init(void)
 
 	sysfs_pseries_vas_init(&caps_all);
 
-	hv_cop_caps = kmalloc(sizeof(*hv_cop_caps), GFP_KERNEL);
-	if (!hv_cop_caps) {
-		rc = -ENOMEM;
-		goto out;
-	}
 	/*
 	 * QOS capabilities available
 	 */
 	if (caps_all.feat_type & VAS_GZIP_QOS_FEAT_BIT) {
 		rc = get_vas_capabilities(VAS_GZIP_QOS_FEAT,
-					  VAS_GZIP_QOS_FEAT_TYPE, hv_cop_caps);
+					  VAS_GZIP_QOS_FEAT_TYPE, &hv_cop_caps);
 
 		if (rc)
-			goto out_cop;
+			goto out;
 	}
 	/*
 	 * Default capabilities available
 	 */
-	if (caps_all.feat_type & VAS_GZIP_DEF_FEAT_BIT) {
+	if (caps_all.feat_type & VAS_GZIP_DEF_FEAT_BIT)
 		rc = get_vas_capabilities(VAS_GZIP_DEF_FEAT,
-					  VAS_GZIP_DEF_FEAT_TYPE, hv_cop_caps);
-		if (rc)
-			goto out_cop;
-	}
+					  VAS_GZIP_DEF_FEAT_TYPE, &hv_cop_caps);
 
-	if (copypaste_feat && firmware_has_feature(FW_FEATURE_LPAR))
-		of_reconfig_notifier_register(&pseries_vas_nb);
+	if (!rc && copypaste_feat) {
+		if (firmware_has_feature(FW_FEATURE_LPAR))
+			of_reconfig_notifier_register(&pseries_vas_nb);
 
-	pr_info("GZIP feature is available\n");
+		pr_info("GZIP feature is available\n");
+	} else {
+		/*
+		 * Should not happen, but only when get default
+		 * capabilities HCALL failed. So disable copy paste
+		 * feature.
+		 */
+		copypaste_feat = false;
+	}
 
-out_cop:
-	kfree(hv_cop_caps);
 out:
 	kfree(hv_caps);
 	return rc;
-- 
2.27.0


