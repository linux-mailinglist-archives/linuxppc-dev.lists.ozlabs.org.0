Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2D84AAD85
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Feb 2022 03:28:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JrtVK0wNxz3cPD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Feb 2022 13:28:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FMkSdWph;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FMkSdWph; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JrtTc5VpQz2xCM
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Feb 2022 13:27:32 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2161k8t6020750; 
 Sun, 6 Feb 2022 02:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=vMXSAvW5VXjoeYURulerKMM5tw10hTTr1u8/RXMQGD8=;
 b=FMkSdWphH0UJvaZW4w8EbxvrjDPisVBJpWUbz+KkYnMudJyX+yfsvI1bVlkTnIjBNx9g
 ro9IxZLrtrUqullMIPAwzQpDvcE3Ono4Fn7BUd5RiMHTzrpJ1wL8J2+1eDbZHqOJR1z/
 1/JO5lhIMPO701FyXfD2VORNbn1+BGlGEKWWBMbj8724sm0JMNkb7aqDRYW0UdbKsrI8
 EPOXUyPxxDE6LFghNd2/zi1KChxCVOrhRJ1nvgJ2uNe0qaahV7m9oLlDMtZzbjH6Ndnj
 Hc1Bs+w+t34s+qFBpJvy0d89DMa+pBrHciZbBX1uPmGZfwgkaZL3BgaFmtTHqQ/go7QS +A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e1huwenj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 06 Feb 2022 02:27:26 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2162RQXp009862;
 Sun, 6 Feb 2022 02:27:26 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e1huwenj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 06 Feb 2022 02:27:26 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2162MsDU008833;
 Sun, 6 Feb 2022 02:27:25 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 3e1gv9hkhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 06 Feb 2022 02:27:25 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2162RMkg46989750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 6 Feb 2022 02:27:22 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BFF8AC065;
 Sun,  6 Feb 2022 02:27:22 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC837AC064;
 Sun,  6 Feb 2022 02:27:21 +0000 (GMT)
Received: from sig-9-65-84-116.ibm.com (unknown [9.65.84.116])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Sun,  6 Feb 2022 02:27:21 +0000 (GMT)
Message-ID: <9ffeb5567b2836ee8326d530310e4eb4f6f9f1f2.camel@linux.ibm.com>
Subject: [PATCH v2 1/4] powerpc/pseries/vas: Define global hv_cop_caps struct
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sat, 05 Feb 2022 18:27:19 -0800
In-Reply-To: <d977832373068e57a13c0e2e47afb2dd4e8d7c3d.camel@linux.ibm.com>
References: <d977832373068e57a13c0e2e47afb2dd4e8d7c3d.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AWQHLOupjLqLRS-Gx3ZD5KLc-pXTLtIo
X-Proofpoint-GUID: 1VhWo7qyIYQXBxddzomyZ_nBPRwvCbwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-05_15,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202060011
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
define global struct and reuse it, especially eliminate memory
allocation failure during migration.

Also disable copy/paste feature flag if any capabilities HCALL
is failed.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas.c | 49 ++++++++++++----------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 3400f4fc6609..933506b85dc6 100644
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
 	int lpar_creds, new_creds;
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
 
-	new_creds = be16_to_cpu(hv_caps->target_lpar_creds);
+	new_creds = be16_to_cpu(hv_cop_caps.target_lpar_creds);
 
 	lpar_creds = atomic_read(&caps->target_creds);
 
@@ -778,7 +774,6 @@ int vas_reconfig_capabilties(u8 type)
 
 out:
 	mutex_unlock(&vas_pseries_mutex);
-	kfree(hv_caps);
 	return rc;
 }
 
@@ -821,9 +816,8 @@ static struct notifier_block pseries_vas_nb = {
 
 static int __init pseries_vas_init(void)
 {
-	struct hv_vas_cop_feat_caps *hv_cop_caps;
 	struct hv_vas_all_caps *hv_caps;
-	int rc;
+	int rc = 0;
 
 	/*
 	 * Linux supports user space COPY/PASTE only with Radix
@@ -849,39 +843,38 @@ static int __init pseries_vas_init(void)
 
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
 
-	/* Processors can be added/removed only on LPAR */
-	if (copypaste_feat && firmware_has_feature(FW_FEATURE_LPAR))
-		of_reconfig_notifier_register(&pseries_vas_nb);
+	if (!rc && copypaste_feat) {
+		/* Processors can be added/removed only on LPAR */
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


