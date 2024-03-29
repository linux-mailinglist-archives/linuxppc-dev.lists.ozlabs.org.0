Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ECF891171
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 03:11:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ePgrfvcK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5P6M5TrBz3vdS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 13:11:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ePgrfvcK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5P4r02nrz3dRt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 13:10:19 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42T22o7m002963;
	Fri, 29 Mar 2024 02:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aRpkxiWunh+6UIByyAxNf1wYguLUmA+x2SlZJO6e2p0=;
 b=ePgrfvcKVxiNJa3GXBWJ+kvOPjToaDFtmgEB5Rh0tEBXEhHxGC+fl+bMOwCEXi2UhAua
 qHbrXGNvte7Qv6Ey1BRtZ4uE0YsH/uHSDyRl4uciqSq9S+TDQo1E/6JnBOcwZWhhAcIQ
 8vQ+TO4xcjZyBJ1+CQcGB4QpgQxT3VThTFv/CAlf5MtLKUdLr6W9xyE//jHlg9ijQ2zk
 l6co4Iem/OlyYXfWQg3/Cp10Uv1iulpI5eqUI29TyqJrmMNYxwHYKEJMo9nAqRxxqyXL
 HdPujMbbRDU+TJm35FJ+/Y7EkK2EHpmE3vs3sK/eLPVApbr4sqM5+tCeO0v/JXD70Vlv wg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x5mgs00bu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 02:10:14 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42T2ADwR013698;
	Fri, 29 Mar 2024 02:10:13 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x5mgs00bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 02:10:13 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42T1e89t016409;
	Fri, 29 Mar 2024 02:10:13 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x29duhmre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 02:10:13 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42T2A7Oi46530934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Mar 2024 02:10:09 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8017420040;
	Fri, 29 Mar 2024 02:10:07 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B46C20043;
	Fri, 29 Mar 2024 02:10:05 +0000 (GMT)
Received: from sunshine.hsd1.in.comcast.net (unknown [9.61.39.125])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Mar 2024 02:10:05 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/2] powerpc/pseries: increase timeout value for plpks_signed_update_var() H_CALL
Date: Thu, 28 Mar 2024 22:09:54 -0400
Message-ID: <20240329020954.537236-2-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329020954.537236-1-nayna@linux.ibm.com>
References: <20240329020954.537236-1-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6GIitdpAYBE8lnoitmMqIwYxoHT_KHzp
X-Proofpoint-GUID: CNbTFw2SO0cMjuGcRu9QqRssgIW66q5A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_01,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403290016
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Greg Joyce <gjoyce@linux.vnet.ibm.com>, Nageswara R Sastry <rnsastry@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed update H_CALL currently polls PHYP for 5msec. Update this to
5sec.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
---
v3:
 * Addition to Patch 1 timeout patch based on Andrew's feedback.

 arch/powerpc/platforms/pseries/plpks.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index bcfcd5acc5c2..4a595493d28a 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -463,9 +463,10 @@ int plpks_signed_update_var(struct plpks_var *var, u64 flags)
 
 		continuetoken = retbuf[0];
 		if (pseries_status_to_err(rc) == -EBUSY) {
-			int delay_ms = get_longbusy_msecs(rc);
-			mdelay(delay_ms);
-			timeout += delay_ms;
+			int delay_us = get_longbusy_msecs(rc) * 1000;
+
+			fsleep(delay_us);
+			timeout += delay_us;
 		}
 		rc = pseries_status_to_err(rc);
 	} while (rc == -EBUSY && timeout < PLPKS_MAX_TIMEOUT);
-- 
2.31.1

