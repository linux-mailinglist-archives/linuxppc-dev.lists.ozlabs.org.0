Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFDB6919C7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 09:10:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCmdK35XYz3f7J
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 19:10:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kBrAzAAD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kBrAzAAD;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCmV7561Gz3cDF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 19:04:31 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31A83Neo008622;
	Fri, 10 Feb 2023 08:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qShSbKMxV7Z7Qv9mgfP79gBedY4t+fnTdA6Vi24y4q4=;
 b=kBrAzAADzoucHJAe1LkpQUGvSutkb9kpjbn39LFQu7uCs3gyouh+juIPL2S9eGqiGYf+
 D9WnvIhR8RI86g1WR23iLYwRsTKN93ISnTv5Q0916twcqfTjtWCV9pRKb7I44xau28AA
 dkMaYXZC6CynKYy2hH3P+f9IKLrAZ3t7Qbiw1UH85owiHVwAdacLC1Mq4QDam1L8gE9T
 NTLY6RGVb5cy0tb+jDsIthH4VRbg9jU92B0jkp8nuANw0lrkZrGglbUkEDMGf+Ul7jVX
 ip8zMLhk1qPb5ucuMn8DDGJaisMTFoynBSEFOOoCRpBstLgrrIjiBxCe8eshghj4E+BH 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnj30r1aa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:04:26 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31A84CVC013305;
	Fri, 10 Feb 2023 08:04:25 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnj30r195-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:04:25 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 319D8J8K026476;
	Fri, 10 Feb 2023 08:04:23 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3nhf06w4c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:04:23 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31A84L2i43385232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Feb 2023 08:04:21 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 320682005A;
	Fri, 10 Feb 2023 08:04:21 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B36F2004E;
	Fri, 10 Feb 2023 08:04:20 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Feb 2023 08:04:20 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id F41DF60807;
	Fri, 10 Feb 2023 19:04:14 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v6 08/26] powerpc/secvar: Handle max object size in the consumer
Date: Fri, 10 Feb 2023 19:03:43 +1100
Message-Id: <20230210080401.345462-9-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210080401.345462-1-ajd@linux.ibm.com>
References: <20230210080401.345462-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ONaePQBeGn3UwiTweLjUb9FfFiMXAIJw
X-Proofpoint-ORIG-GUID: uyJXsz2nn0TPt2Df-gDe9Nn9bIQHfl-f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_03,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302100070
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
Cc: sudhakar@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, bgray@linux.ibm.com, brking@linux.ibm.com, gcwilson@linux.ibm.com, stefanb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Russell Currey <ruscur@russell.cc>

Currently the max object size is handled in the core secvar code with an
entirely OPAL-specific implementation, so create a new max_size() op and
move the existing implementation into the powernv platform.  Should be
no functional change.

Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

---

v3: Change uint64_t type to u64 (mpe)

v4: Return immediately if node is NULL (gjoyce)
---
 arch/powerpc/include/asm/secvar.h            |  1 +
 arch/powerpc/kernel/secvar-sysfs.c           | 17 +++------------
 arch/powerpc/platforms/powernv/opal-secvar.c | 22 ++++++++++++++++++++
 3 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/secvar.h b/arch/powerpc/include/asm/secvar.h
index 1a2c696a48ad..bf396215903d 100644
--- a/arch/powerpc/include/asm/secvar.h
+++ b/arch/powerpc/include/asm/secvar.h
@@ -18,6 +18,7 @@ struct secvar_operations {
 	int (*get_next)(const char *key, u64 *key_len, u64 keybufsize);
 	int (*set)(const char *key, u64 key_len, u8 *data, u64 data_size);
 	ssize_t (*format)(char *buf, size_t bufsize);
+	int (*max_size)(u64 *max_size);
 };
 
 #ifdef CONFIG_PPC_SECURE_BOOT
diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index e4661559c855..0966806f28c7 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -132,27 +132,16 @@ static struct kobj_type secvar_ktype = {
 static int update_kobj_size(void)
 {
 
-	struct device_node *node;
 	u64 varsize;
-	int rc = 0;
+	int rc = secvar_ops->max_size(&varsize);
 
-	node = of_find_compatible_node(NULL, NULL, "ibm,secvar-backend");
-	if (!of_device_is_available(node)) {
-		rc = -ENODEV;
-		goto out;
-	}
-
-	rc = of_property_read_u64(node, "max-var-size", &varsize);
 	if (rc)
-		goto out;
+		return rc;
 
 	data_attr.size = varsize;
 	update_attr.size = varsize;
 
-out:
-	of_node_put(node);
-
-	return rc;
+	return 0;
 }
 
 static int secvar_sysfs_load(void)
diff --git a/arch/powerpc/platforms/powernv/opal-secvar.c b/arch/powerpc/platforms/powernv/opal-secvar.c
index e33bb703ecbc..a8436bf35e2f 100644
--- a/arch/powerpc/platforms/powernv/opal-secvar.c
+++ b/arch/powerpc/platforms/powernv/opal-secvar.c
@@ -122,11 +122,33 @@ static ssize_t opal_secvar_format(char *buf, size_t bufsize)
 	return rc;
 }
 
+static int opal_secvar_max_size(u64 *max_size)
+{
+	int rc;
+	struct device_node *node;
+
+	node = of_find_compatible_node(NULL, NULL, "ibm,secvar-backend");
+	if (!node)
+		return -ENODEV;
+
+	if (!of_device_is_available(node)) {
+		rc = -ENODEV;
+		goto out;
+	}
+
+	rc = of_property_read_u64(node, "max-var-size", max_size);
+
+out:
+	of_node_put(node);
+	return rc;
+}
+
 static const struct secvar_operations opal_secvar_ops = {
 	.get = opal_get_variable,
 	.get_next = opal_get_next_variable,
 	.set = opal_set_variable,
 	.format = opal_secvar_format,
+	.max_size = opal_secvar_max_size,
 };
 
 static int opal_secvar_probe(struct platform_device *pdev)
-- 
2.39.1

