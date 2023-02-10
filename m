Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFADA6919C3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 09:08:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCmZC4ZbKz3f7P
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 19:08:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bVexbER+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bVexbER+;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCmV71qCkz3bcw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 19:04:30 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31A83NtX008624;
	Fri, 10 Feb 2023 08:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gCNzsJQMUlM3vuWRxJHuCro4Pi5S2nUUaN3zdk+N8n8=;
 b=bVexbER+Y6VW7UkwZRKNzV/lA6fNDxq+x3/TrfpLCIbSvy3x5zMn7ISm8gNn41KpLGL0
 il77jAmB9EEsphb+SSuYamaHDAMG5rIxSB4/lI0wqWJOl+JkqYJxau0stiAgqFl6D6TZ
 /SgEk4C6WRrbK4ak5gI3eePD9q0mzB38DokvCkVvZcYm9W0nw593KGYbX0SDh25rWEHo
 50d2bc/T8VsSzkVA4btGYgK9SlnvwWz0KMELK+daoTOKIWJ5ewAg0ipH+qGr8M/S3IpB
 iJgCcC2JD+EQMs8qLvoSa6jGjdqd83vAC/JzxCKwVxyo9mP+BrHIXFhDUEp4TMBoQzpj eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnj30r17t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:04:23 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31A83WEV009161;
	Fri, 10 Feb 2023 08:04:22 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnj30r16u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:04:22 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 319DbiGL005648;
	Fri, 10 Feb 2023 08:04:20 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3nhf06n40a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:04:20 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31A84IgI44237110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Feb 2023 08:04:18 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3687C2004D;
	Fri, 10 Feb 2023 08:04:18 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A64D720040;
	Fri, 10 Feb 2023 08:04:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Feb 2023 08:04:17 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9E2B6600BA;
	Fri, 10 Feb 2023 19:04:14 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v6 02/26] powerpc/pseries: Fix alignment of PLPKS structures and buffers
Date: Fri, 10 Feb 2023 19:03:37 +1100
Message-Id: <20230210080401.345462-3-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210080401.345462-1-ajd@linux.ibm.com>
References: <20230210080401.345462-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AFfPeGGtvuz1wXmnE7b_gatZc6V1Hhws
X-Proofpoint-ORIG-GUID: qPc-v6g1AxZjBtaywruqqgUQ0lMYDDK1
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

A number of structures and buffers passed to PKS hcalls have alignment
requirements, which could on occasion cause problems:

- Authorisation structures must be 16-byte aligned and must not cross a
  page boundary

- Label structures must not cross page boundaries

- Password output buffers must not cross page boundaries

To ensure correct alignment, we adjust the allocation size of each of
these structures/buffers to be the closest power of 2 that is at least the
size of the structure/buffer (since kmalloc() guarantees that an
allocation of a power of 2 size will be aligned to at least that size).

Reported-by: Benjamin Gray <bgray@linux.ibm.com>
Fixes: 2454a7af0f2a ("powerpc/pseries: define driver for Platform KeyStore")
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
Reviewed-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Russell Currey <ruscur@russell.cc>

---

v3: Merge plpks fixes and signed update series with secvar series

v4: Fix typo in commit message

    Move up in series (npiggin)

v5: Reword commit message to better explain alignment guarantee (mpe)
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
2.39.1

