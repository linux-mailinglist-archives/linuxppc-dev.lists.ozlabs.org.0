Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CC44C6419
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 08:52:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6XfF4qybz30FR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 18:52:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=em4LscTW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=em4LscTW; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6XdT57K2z2xsb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 18:51:41 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21S6hTEe004549; 
 Mon, 28 Feb 2022 07:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=6oUmdW9xGAjQtVXn/aHFGIGc10tC9X1/4AvBG2JOyxA=;
 b=em4LscTW4/bdqtqG0m3fTWwK19nOwn9EJiEihcU+wjFdpVSuM6RsjwTX2XjZSyT4u2sF
 jXjBjOpIRCuwdDcQFR3rck/I/PqMd4Rqd4HPaIwZXM0FGznyA+GFL7Kgn1wiDx49O49g
 ZwNS32UYlv+sPuBbuoNFl1p/Y9SbNaZybvg9KlyXs/jCC5SWLwQEadpevo2ClEy5N7M9
 SyLsK3wbBcKZyBu2tclvI0VcSN2sn2MTn4chhSyFar+O1Oa9ukAjl8xaYM2tGYgi99vl
 Yu2AQ7rEwxUD4oLOuJm1HR33k6Z27VO9jgzhkAS6iqDS2Dfa3v1Qy71sZz2Q8q2Zw9VT tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egscj1bts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:51:37 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21S7oMUr017571;
 Mon, 28 Feb 2022 07:51:37 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egscj1btd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:51:37 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21S7lHw0019121;
 Mon, 28 Feb 2022 07:51:36 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 3efbu9efq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:51:36 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21S7pV9e7078298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 07:51:31 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D425124072;
 Mon, 28 Feb 2022 07:51:31 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F9CE12405E;
 Mon, 28 Feb 2022 07:51:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.161.44])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 28 Feb 2022 07:51:29 +0000 (GMT)
Message-ID: <57da6a270fcb9308cd57be7c88037029343080f7.camel@linux.ibm.com>
Subject: [PATCH v4 1/3] powerpc/pseries/vas: Define global hv_cop_caps struct
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sun, 27 Feb 2022 23:51:28 -0800
In-Reply-To: <aab2eda3cb5b209e07cf50760649834f1d93fede.camel@linux.ibm.com>
References: <aab2eda3cb5b209e07cf50760649834f1d93fede.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PkvyhG1peqjd96KsdDwqCxOhn37p2P7b
X-Proofpoint-ORIG-GUID: 5EizTmlza1l1sV8fK1Y6kvYSyl-3z7UC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 clxscore=1015 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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


The coprocessor capabilities struct is used to get default and
QoS capabilities from the hypervisor during init, DLPAR event and
migration. So instead of allocating this struct for each event,
define global struct and reuse it which allows the migration code
to avoid adding an error path.

Also disable copy/paste feature flag if any capabilities HCALL
is failed.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Acked-by: Nathan Lynch <nathanl@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
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


