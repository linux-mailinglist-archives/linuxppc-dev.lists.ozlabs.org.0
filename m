Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E245B61E618
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Nov 2022 22:04:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N56LP52Qzz3f8t
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 08:04:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YhhaIRDf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YhhaIRDf;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N56DK3StRz3cKV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 07:59:13 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A6H3ZCg003094;
	Sun, 6 Nov 2022 20:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zO5d48aP5PKDYHHmsFvILGWlOwSMo85md4HSCvzczXk=;
 b=YhhaIRDfbak2wt0o+B9duuQ6YQfCOIE1tbV1+3RJZWORQSP7i45tqUI65nAZPI5Xeeep
 b4OxT52LNcq2qRExkocsbqIVeDHxtb+//tjYV/uLAnIVnnj3GySaD+VJidwLJUm7/Fwm
 9qTv38t/xV8pJ+Tn55dF95uyx4fbFqYxlhWAhSrQiyxXutNHFuP0EyvnlZzbbbg9S4bD
 qxpKLWlYH+uX4ZWeKXAkRKcg8eC35xD8x4ygztKV4G/PPj8lUxO7XyDMeEfUtBUJXNt1
 z4Ub85AM9DUMY0Msg+XLq/ns35AnqCYklsg4HD2NNpNFGlbDmBdftCrx4hiUof2rz8js RA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1gkd2yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Nov 2022 20:59:06 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A6Kx5tI008063;
	Sun, 6 Nov 2022 20:59:05 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1gkd2xr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Nov 2022 20:59:05 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A6KpVKo027816;
	Sun, 6 Nov 2022 20:59:03 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma04ams.nl.ibm.com with ESMTP id 3kngqd9nv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Nov 2022 20:59:03 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A6Kx0h150725152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 6 Nov 2022 20:59:00 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 627DE42041;
	Sun,  6 Nov 2022 20:59:00 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C2A84203F;
	Sun,  6 Nov 2022 20:58:58 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com.com (unknown [9.211.78.124])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sun,  6 Nov 2022 20:58:57 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/6] powerpc/pseries: replace kmalloc with kzalloc in PLPKS driver
Date: Sun,  6 Nov 2022 15:58:38 -0500
Message-Id: <20221106205839.600442-6-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221106205839.600442-1-nayna@linux.ibm.com>
References: <20221106205839.600442-1-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hLrbDHvLFdtoY8UpI_2FceJ662xGYtMy
X-Proofpoint-GUID: 2kud5kVVZh1kiHeGtTF7NswLTz-vjMzX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-06_14,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211060180
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

Replace kmalloc with kzalloc in construct_auth() function to default
initialize structure with zeroes.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/plpks.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index 72d9debf18c0..e8c02735b702 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -162,19 +162,15 @@ static struct plpks_auth *construct_auth(u8 consumer)
 	if (consumer > PKS_OS_OWNER)
 		return ERR_PTR(-EINVAL);
 
-	auth = kmalloc(struct_size(auth, password, maxpwsize), GFP_KERNEL);
+	auth = kzalloc(struct_size(auth, password, maxpwsize), GFP_KERNEL);
 	if (!auth)
 		return ERR_PTR(-ENOMEM);
 
 	auth->version = 1;
 	auth->consumer = consumer;
-	auth->rsvd0 = 0;
-	auth->rsvd1 = 0;
 
-	if (consumer == PKS_FW_OWNER || consumer == PKS_BOOTLOADER_OWNER) {
-		auth->passwordlength = 0;
+	if (consumer == PKS_FW_OWNER || consumer == PKS_BOOTLOADER_OWNER)
 		return auth;
-	}
 
 	memcpy(auth->password, ospassword, ospasswordlength);
 
-- 
2.31.1

