Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EB4674E8B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 08:45:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nys3m68JZz3fKp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 18:45:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cX7bhehL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cX7bhehL;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nys1r0htfz3fCy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 18:43:43 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30K6U1NM017522;
	Fri, 20 Jan 2023 07:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=grILWy5I/lURrLpjLU3fbP0cTkagwaubXu7uz24+NCo=;
 b=cX7bhehLLUc2EsyMGPjP65vHV0sTOQiekZ7X2JfMo3qJs2Geu6+riy3bCh7j2gqs4ojq
 9uk1VRqhcBMvPjeNtI6AoXl6SbdNyLTcy6v1mlR5mM9UeMJ8ZC1nDuKH3cvU+o05/pcB
 wWs4t268MQcAhieEjzCEiuFX8QQ95ldtCG8e1rVfuMNCpIHbtH6M5nptMwZmmzsmVIvk
 ggOnr28oa7/TsRwcT5QxSdcULSKH+WKnLoLMyt9IHiTDZsMwoeIx9wUB9C1r1MKuWzdD
 Y8RSMK/Eciw9+jFTVqa5tZDCQj8Psx1J8U76krbiLgcMRsr1h7oNIWFgCGFtg2jP1ozQ DA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7nr9hec6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 07:43:37 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30JN7s6u006911;
	Fri, 20 Jan 2023 07:43:34 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3n3m16njxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 07:43:34 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30K7hWUi42664202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jan 2023 07:43:32 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62B8B2004B;
	Fri, 20 Jan 2023 07:43:32 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DAB9420043;
	Fri, 20 Jan 2023 07:43:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Jan 2023 07:43:31 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AF984605A6;
	Fri, 20 Jan 2023 18:43:29 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v4 02/24] powerpc/pseries: Fix alignment of PLPKS structures and buffers
Date: Fri, 20 Jan 2023 18:42:44 +1100
Message-Id: <20230120074306.1326298-3-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120074306.1326298-1-ajd@linux.ibm.com>
References: <20230120074306.1326298-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RiAFX32W7Ai_p8cphOkPG0zBkvP5Fs4e
X-Proofpoint-GUID: RiAFX32W7Ai_p8cphOkPG0zBkvP5Fs4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_04,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301200070
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
Cc: sudhakar@linux.ibm.com, bgray@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, ruscur@russell.cc, gcwilson@linux.ibm.com, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A number of structures and buffers passed to PKS hcalls have alignment
requirements, which could on occasion cause problems:

- Authorisation structures must be 16-byte aligned and must not cross a
  page boundary

- Label structures must not cross page boundaries

- Password output buffers must not cross page boundaries

Round up the allocations of these structures/buffers to the next power of
2 to make sure this happens.

Reported-by: Benjamin Gray <bgray@linux.ibm.com>
Fixes: 2454a7af0f2a ("powerpc/pseries: define driver for Platform KeyStore")
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
Reviewed-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Russell Currey <ruscur@russell.cc>

---

v3: Merge plpks fixes and signed update series with secvar series

v4: Fix typo in commit message

    Move up in series (npiggin)
---
 arch/powerpc/platforms/pseries/plpks.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index 9e85b6d85b0b..a01cf2ff140a 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -126,7 +126,8 @@ static int plpks_gen_password(void)
 	u8 *password, consumer = PKS_OS_OWNER;
 	int rc;
 
-	password = kzalloc(maxpwsize, GFP_KERNEL);
+	// The password must not cross a page boundary, so we align to the next power of 2
+	password = kzalloc(roundup_pow_of_two(maxpwsize), GFP_KERNEL);
 	if (!password)
 		return -ENOMEM;
 
@@ -162,7 +163,9 @@ static struct plpks_auth *construct_auth(u8 consumer)
 	if (consumer > PKS_OS_OWNER)
 		return ERR_PTR(-EINVAL);
 
-	auth = kzalloc(struct_size(auth, password, maxpwsize), GFP_KERNEL);
+	// The auth structure must not cross a page boundary and must be
+	// 16 byte aligned. We align to the next largest power of 2
+	auth = kzalloc(roundup_pow_of_two(struct_size(auth, password, maxpwsize)), GFP_KERNEL);
 	if (!auth)
 		return ERR_PTR(-ENOMEM);
 
@@ -196,7 +199,8 @@ static struct label *construct_label(char *component, u8 varos, u8 *name,
 	if (component && slen > sizeof(label->attr.prefix))
 		return ERR_PTR(-EINVAL);
 
-	label = kzalloc(sizeof(*label), GFP_KERNEL);
+	// The label structure must not cross a page boundary, so we align to the next power of 2
+	label = kzalloc(roundup_pow_of_two(sizeof(*label)), GFP_KERNEL);
 	if (!label)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.39.0

