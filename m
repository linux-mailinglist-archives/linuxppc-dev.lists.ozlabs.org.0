Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D216B8A8214
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 13:28:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fsyN4G+V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKJZG4CJmz3vq2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 21:28:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fsyN4G+V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKJSv64lNz3cZK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 21:23:59 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43HAwQeS014277;
	Wed, 17 Apr 2024 11:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xZg0fRbgT4IOylRHggPAaWvJznLd4d4/mGAuRp8CrVM=;
 b=fsyN4G+VCAD42/MxuvStHMm4FTa6X710L4jf5bViioPJ8gdPYs4GJc5uzKS7XPXBmML+
 ax/xnZhinvj37gm5nAd3Z93slCOMo+dDP1PdJVUSvLF8yBV0IWofwXFFv6SJe6s5Dqf0
 PsIPGAe1WXmyRP7NP1oFmYHB+9o1vmHRQtxpCLRN9EXextpDrlyD+/r3NjaDW/mTroPL
 UWRMq0V7Dz4pjxWareS40tSPZFi3Cdh3U5lvjgZjbZQdVsoCZbwMdmFt8XQVuySb4Q+3
 unDZyfv37Ghm0EaBML5tZms6iM9ILmFTj7RCg3/fRs7yg4/UshUyDQ9/aFr2ZihjYbsF Pw== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xjd4u01t0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 11:23:54 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43HAbFmd021365;
	Wed, 17 Apr 2024 11:23:54 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xg6kkkjj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 11:23:54 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43HBNo9q40698256
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Apr 2024 11:23:52 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 677542004B;
	Wed, 17 Apr 2024 11:23:50 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC10E20043;
	Wed, 17 Apr 2024 11:23:49 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Apr 2024 11:23:49 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.36.21.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 167C1600D6;
	Wed, 17 Apr 2024 21:23:47 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 6/9] selftests/powerpc/dexcr: Attempt to enable NPHIE in hashchk selftest
Date: Wed, 17 Apr 2024 21:23:22 +1000
Message-ID: <20240417112325.728010-7-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417112325.728010-1-bgray@linux.ibm.com>
References: <20240417112325.728010-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: k8jnfjuRsTc9qOLRBYOC9OF_0zauPoTv
X-Proofpoint-GUID: k8jnfjuRsTc9qOLRBYOC9OF_0zauPoTv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_08,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=958 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404170078
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that a process can control its DEXCR to some extent, make the
hashchk tests more reliable by explicitly setting the local and onexec
NPHIE aspect.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 tools/testing/selftests/powerpc/dexcr/hashchk_test.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/dexcr/hashchk_test.c b/tools/testing/selftests/powerpc/dexcr/hashchk_test.c
index 7d5658c9ebe4..645224bdc142 100644
--- a/tools/testing/selftests/powerpc/dexcr/hashchk_test.c
+++ b/tools/testing/selftests/powerpc/dexcr/hashchk_test.c
@@ -21,8 +21,14 @@
 static int require_nphie(void)
 {
 	SKIP_IF_MSG(!dexcr_exists(), "DEXCR not supported");
+
+	pr_set_dexcr(PR_PPC_DEXCR_NPHIE, PR_PPC_DEXCR_CTRL_SET | PR_PPC_DEXCR_CTRL_SET_ONEXEC);
+
+	if (get_dexcr(EFFECTIVE) & DEXCR_PR_NPHIE)
+		return 0;
+
 	SKIP_IF_MSG(!(get_dexcr(EFFECTIVE) & DEXCR_PR_NPHIE),
-		    "DEXCR[NPHIE] not enabled");
+		    "Failed to enable DEXCR[NPHIE]");
 
 	return 0;
 }
-- 
2.44.0

