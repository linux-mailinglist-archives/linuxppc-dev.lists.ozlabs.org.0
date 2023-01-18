Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EAE6713F0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 07:25:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxbNY3fB5z3fQl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 17:25:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=POXZRYvF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=POXZRYvF;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxb4D4Z4Qz3c7K
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 17:11:24 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30I6BC0j026824;
	Wed, 18 Jan 2023 06:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=KFZyqneQyMUdZl0hLjuIPI1DZk1TGtJ1pYGhl6U6TgQ=;
 b=POXZRYvFs/ay8rz7jvdvQ5QaFdMpt2C9dTDeGKG8KM4zCZLvb/+N+1K8qOIZRQT6q2sl
 hM/k9WtA5q0yiycDdGul/lydByW11FehCrg5PZSkHRC6XkJbKc0chWf8/apHt3Ab/pf9
 dqBUNJEqMowwOp/hW2nbsEI9qWkRC/AM4cfUC9EVdCOtR6yusRJ+MTXJ+5mr9R40aGY2
 WamsESX8RRA2Rlza2Y6H68Irq+QIkKwiwYcz876xnsWDw+W62vjisz0Z9a3S9owmB61f
 7NAUu4wVu1ANJwhPslwkMa/VJJLS85whgeEOMlvzJWE0bNFzEME7TWutjRI67uw4LOyl /A== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n67swv0g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 06:11:18 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30HMHJgJ006209;
	Wed, 18 Jan 2023 06:11:16 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3n3knfmtkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 06:11:16 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30I6BDdf52429122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jan 2023 06:11:13 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59C7120043;
	Wed, 18 Jan 2023 06:11:13 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D28DC2004D;
	Wed, 18 Jan 2023 06:11:12 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Jan 2023 06:11:12 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 72FBB6096E;
	Wed, 18 Jan 2023 17:11:08 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v3 14/24] powerpc/pseries: Fix alignment of PLPKS structures and buffers
Date: Wed, 18 Jan 2023 17:10:39 +1100
Message-Id: <20230118061049.1006141-15-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061049.1006141-1-ajd@linux.ibm.com>
References: <20230118061049.1006141-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J--eV56EedY2BS737J_h7EWaJtBDCmEG
X-Proofpoint-ORIG-GUID: J--eV56EedY2BS737J_h7EWaJtBDCmEG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_01,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301180051
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
Cc: sudhakar@linux.ibm.com, bgray@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A number of structures and buffers passed to PKS hcalls have alignment
requirements, which could on occasion cause problems:

- Authorisation structures must be 16-byte aligned and must not cross a
  page boundary

- Label structures must not cross page coundaries

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
---
 arch/powerpc/platforms/pseries/plpks.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index 6d1303e4862d..91f3f623a2c7 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -112,7 +112,8 @@ static int plpks_gen_password(void)
 	u8 *password, consumer = PLPKS_OS_OWNER;
 	int rc;
 
-	password = kzalloc(maxpwsize, GFP_KERNEL);
+	// The password must not cross a page boundary, so we align to the next power of 2
+	password = kzalloc(roundup_pow_of_two(maxpwsize), GFP_KERNEL);
 	if (!password)
 		return -ENOMEM;
 
@@ -148,7 +149,9 @@ static struct plpks_auth *construct_auth(u8 consumer)
 	if (consumer > PLPKS_OS_OWNER)
 		return ERR_PTR(-EINVAL);
 
-	auth = kzalloc(struct_size(auth, password, maxpwsize), GFP_KERNEL);
+	// The auth structure must not cross a page boundary and must be
+	// 16 byte aligned. We align to the next largest power of 2
+	auth = kzalloc(roundup_pow_of_two(struct_size(auth, password, maxpwsize)), GFP_KERNEL);
 	if (!auth)
 		return ERR_PTR(-ENOMEM);
 
@@ -182,7 +185,8 @@ static struct label *construct_label(char *component, u8 varos, u8 *name,
 	if (component && slen > sizeof(label->attr.prefix))
 		return ERR_PTR(-EINVAL);
 
-	label = kzalloc(sizeof(*label), GFP_KERNEL);
+	// The label structure must not cross a page boundary, so we align to the next power of 2
+	label = kzalloc(roundup_pow_of_two(sizeof(*label)), GFP_KERNEL);
 	if (!label)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.39.0

