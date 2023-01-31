Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BA768359F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 19:49:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5vGr4C3qz3f2s
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 05:49:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DKIDarkq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DKIDarkq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5vFt01j0z3bbD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 05:48:33 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30VI2WV8031380;
	Tue, 31 Jan 2023 18:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=GeWP34mTOXN3zf0ZrvwpDKUljS9SDKBP6sh56wOQKnM=;
 b=DKIDarkqujXb/LAxQ3yIFRELlPqryXbC7FYQfPsbA6Vps+MKEuAFmde8AfNqA6BUe019
 qyq59bPy29RNolUdfSaP7BM/zOj7TJLIA/sNKmn95I+oia/2sXcH2sZdyDnHoPKtFhji
 20UvgMjwItPur06TJV5Rq8woX6F0RmmB+/A4gWXBFR+YiR6SU+pA0DYXiSH9uSkNJjhw
 zGLpRF8FzIAo1jbEgdYXhMSvV2c8oMeVHR0f5c/83UNvWMqLW+a8pYUBoc/oAmquKKlj
 1DIbSREys6QLVFFV1jvsIbMuNDDXSjdCdk6lPvcuFNvTHZKzGIYQONl9kiFF8OzEB+9X 5A== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nf5x6cyg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 18:48:28 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30UMGCh0022335;
	Tue, 31 Jan 2023 18:48:26 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3ncvugjrs2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 18:48:26 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30VImMaR44892426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Jan 2023 18:48:22 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6853E20043;
	Tue, 31 Jan 2023 18:48:22 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6254820040;
	Tue, 31 Jan 2023 18:48:20 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.106.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 31 Jan 2023 18:48:20 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/hv-24x7: Fix pvr check when setting interface version
Date: Wed,  1 Feb 2023 00:18:04 +0530
Message-Id: <20230131184804.220756-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k4pewHZpWgyfurUGXnw3574Ez-1Mz9YF
X-Proofpoint-ORIG-GUID: k4pewHZpWgyfurUGXnw3574Ez-1Mz9YF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=954 adultscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301310162
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, maddy@linux.ibm.com, Sachin Sant <sachinp@linux.ibm.com>, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit ec3eb9d941a9 ("powerpc/perf: Use PVR rather than
oprofile field to determine CPU version") added usage
of pvr value instead of oprofile field to determine the
platform. In hv-24x7 pmu driver code, pvr check uses PVR_POWER8
when assigning the interface version for power8 platform.
But power8 can also have other pvr values like PVR_POWER8E and
PVR_POWER8NVL. Hence the interface version won't be set
properly incase of PVR_POWER8E and PVR_POWER8NVL.
Fix this issue by adding the checks for PVR_POWER8E and
PVR_POWER8NVL as well.

Fixes: ec3eb9d941a9 ("powerpc/perf: Use PVR rather than oprofile field to determine CPU version")
Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/hv-24x7.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index 33c23225fd54..8c3253df133d 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -1727,7 +1727,8 @@ static int hv_24x7_init(void)
 	}
 
 	/* POWER8 only supports v1, while POWER9 only supports v2. */
-	if (PVR_VER(pvr) == PVR_POWER8)
+	if (PVR_VER(pvr) == PVR_POWER8 || PVR_VER(pvr) == PVR_POWER8E ||
+			PVR_VER(pvr) == PVR_POWER8NVL)
 		interface_version = 1;
 	else {
 		interface_version = 2;
-- 
2.39.0

