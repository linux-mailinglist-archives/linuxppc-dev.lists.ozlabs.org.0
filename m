Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E7161E619
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Nov 2022 22:05:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N56MQ1N6qz3cCn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 08:05:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JMl2qfq6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JMl2qfq6;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N56DM3t3Lz3cMl
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 07:59:15 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A6GHcXq013135;
	Sun, 6 Nov 2022 20:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=sGwTRRsM3PFFu4BIOJWC9T2hJW23ITMueDK6j9UYAAo=;
 b=JMl2qfq6aoI/tlvhY+93JRfuH74KdhY8uq3Nxu2iWRzMzvcS2foKaR/tPPaE4J5nYeRd
 fzDDWykEsvUHn0Ug+cMYtkjoiY95kOtBRTLaSHtOHAKu+j8yby1FT7rFndXXgNaqQ/BH
 G+J6KF8NU2bg3wucEcxtHio+8BpYgaYLfX2qrtavg/hkmcnxHffAIam5Lq3p2twoTOJy
 uNttBncv9KSf3ZVxgItuUOE9R8YvILA3efpXzNDrxzNWe9rFAZBDPNhZJpQ/9jIYWako
 xvrqMpEcbl3NUa6UOC9BMoMXEuXYcGxLj4GfT8Qga2o8AGnnZnef1/RzyfGFjwciFngN mw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1utvms6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Nov 2022 20:59:08 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A6KwHED007969;
	Sun, 6 Nov 2022 20:59:08 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1utvmrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Nov 2022 20:59:07 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A6KoWtW027541;
	Sun, 6 Nov 2022 20:59:06 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma03ams.nl.ibm.com with ESMTP id 3kngqg9p78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Nov 2022 20:59:05 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A6Kx3lI51511590
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 6 Nov 2022 20:59:03 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EAFA442041;
	Sun,  6 Nov 2022 20:59:02 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC3054203F;
	Sun,  6 Nov 2022 20:59:00 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com.com (unknown [9.211.78.124])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sun,  6 Nov 2022 20:59:00 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/6] powerpc/pseries: fix plpks_read_var() code for different consumers
Date: Sun,  6 Nov 2022 15:58:39 -0500
Message-Id: <20221106205839.600442-7-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221106205839.600442-1-nayna@linux.ibm.com>
References: <20221106205839.600442-1-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6ObED9mx6NHAp_pKsg5KmDZn69AKnJLe
X-Proofpoint-ORIG-GUID: -n__4pGhBgZZCB1_ehBGhmfl61ZQVV5s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-06_14,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211060184
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, gjoyce@linux.vnet.ibm.com, Nayna Jain <nayna@linux.ibm.com>, npiggin@gmail.com, George Wilson <gcwilson@linux.ibm.com>, bjking1@us.ibmcom
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Even though plpks_read_var() is currently called to read variables
owned by different consumers, it internally supports only OS consumer.

Fix plpks_read_var() to handle different consumers correctly.

Fixes: 2454a7af0f2a ("powerpc/pseries: define driver for Platform KeyStore")
Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/plpks.c | 28 +++++++++++++++++---------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index e8c02735b702..4edd1585e245 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -354,22 +354,24 @@ static int plpks_read_var(u8 consumer, struct plpks_var *var)
 {
 	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = { 0 };
 	struct plpks_auth *auth;
-	struct label *label;
+	struct label *label = NULL;
 	u8 *output;
 	int rc;
 
 	if (var->namelen > MAX_NAME_SIZE)
 		return -EINVAL;
 
-	auth = construct_auth(PKS_OS_OWNER);
+	auth = construct_auth(consumer);
 	if (IS_ERR(auth))
 		return PTR_ERR(auth);
 
-	label = construct_label(var->component, var->os, var->name,
-				var->namelen);
-	if (IS_ERR(label)) {
-		rc = PTR_ERR(label);
-		goto out_free_auth;
+	if (consumer == PKS_OS_OWNER) {
+		label = construct_label(var->component, var->os, var->name,
+					var->namelen);
+		if (IS_ERR(label)) {
+			rc = PTR_ERR(label);
+			goto out_free_auth;
+		}
 	}
 
 	output = kzalloc(maxobjsize, GFP_KERNEL);
@@ -378,9 +380,15 @@ static int plpks_read_var(u8 consumer, struct plpks_var *var)
 		goto out_free_label;
 	}
 
-	rc = plpar_hcall(H_PKS_READ_OBJECT, retbuf, virt_to_phys(auth),
-			 virt_to_phys(label), label->size, virt_to_phys(output),
-			 maxobjsize);
+	if (consumer == PKS_OS_OWNER)
+		rc = plpar_hcall(H_PKS_READ_OBJECT, retbuf, virt_to_phys(auth),
+				 virt_to_phys(label), label->size, virt_to_phys(output),
+				 maxobjsize);
+	else
+		rc = plpar_hcall(H_PKS_READ_OBJECT, retbuf, virt_to_phys(auth),
+				 virt_to_phys(var->name), var->namelen, virt_to_phys(output),
+				 maxobjsize);
+
 
 	if (rc != H_SUCCESS) {
 		rc = pseries_status_to_err(rc);
-- 
2.31.1

