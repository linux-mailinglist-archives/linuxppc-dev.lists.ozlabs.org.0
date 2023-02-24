Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE976A15C2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 05:11:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNGft6Q1Tz3f3R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 15:11:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F8JY4jsW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F8JY4jsW;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNGdv1Jcxz3bZl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 15:10:42 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31O3Nt6C029216;
	Fri, 24 Feb 2023 04:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=SzAX3BTdzV8SPlo/mYpquYxmCFryn7mcXVvUZ3+hON4=;
 b=F8JY4jsWEYqCge4uzKQwgpboFagZyX0JmsJ/MtZPc+CD7LF3bFML0VVc42s7X7MH2FHF
 9CxW7a3MkHWebvvbIiKR1IaMwFx8MURqPqdprGh1fHyJI28g+hp5NhLG5Dyt+Doku68i
 rHAWkh3Tbw7uK8gDfwfICg4u1m7EjEVflMPJcT4Iku9uoCTAEBF6qK1o9jU1ybOMA4qV
 6DLtuJ+up/kdkxFOGhHNgrGZiiI+RZOQqCojG404HWoixD9TZ6vP//qHIGJZp/LGiHYr
 3zU/z5M8N69DpjiBpnKIkX6VMD9vdhP13kGZPOFxmmVLwk6un91TrnZCEvviNkNdATpv bw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nxna00svn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Feb 2023 04:10:34 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31N7pAuY020251;
	Fri, 24 Feb 2023 04:10:32 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3ntpa65n3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Feb 2023 04:10:31 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31O4ATFQ26608264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Feb 2023 04:10:29 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80D482004E;
	Fri, 24 Feb 2023 04:10:29 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F1F5520043;
	Fri, 24 Feb 2023 04:10:28 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 Feb 2023 04:10:28 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.au.ibm.com (unknown [9.192.255.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2E7FD6032C;
	Fri, 24 Feb 2023 15:10:25 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: Add FW_FEATURE_PLPKS feature flag
Date: Fri, 24 Feb 2023 15:10:12 +1100
Message-Id: <20230224041012.772648-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PsE8_N8RNPVOQzCpwOlhhsiNBbbzmb-J
X-Proofpoint-GUID: PsE8_N8RNPVOQzCpwOlhhsiNBbbzmb-J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_01,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302240031
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
Cc: nayna@linux.ibm.com, ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a firmware feature flag, FW_FEATURE_PLPKS, to indicate availability of
Platform KeyStore related hcalls.

Check this flag in plpks_is_available() and pseries_plpks_init() before
trying to make an hcall.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/powerpc/include/asm/firmware.h       | 4 +++-
 arch/powerpc/platforms/pseries/firmware.c | 1 +
 arch/powerpc/platforms/pseries/plpks.c    | 5 ++++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index ed6db13a1d7c..69ae9cf57d50 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -56,6 +56,7 @@
 #define FW_FEATURE_FORM2_AFFINITY ASM_CONST(0x0000020000000000)
 #define FW_FEATURE_ENERGY_SCALE_INFO ASM_CONST(0x0000040000000000)
 #define FW_FEATURE_WATCHDOG	ASM_CONST(0x0000080000000000)
+#define FW_FEATURE_PLPKS	ASM_CONST(0x0000100000000000)
 
 #ifndef __ASSEMBLY__
 
@@ -77,7 +78,8 @@ enum {
 		FW_FEATURE_DRC_INFO | FW_FEATURE_BLOCK_REMOVE |
 		FW_FEATURE_PAPR_SCM | FW_FEATURE_ULTRAVISOR |
 		FW_FEATURE_RPT_INVALIDATE | FW_FEATURE_FORM2_AFFINITY |
-		FW_FEATURE_ENERGY_SCALE_INFO | FW_FEATURE_WATCHDOG,
+		FW_FEATURE_ENERGY_SCALE_INFO | FW_FEATURE_WATCHDOG |
+		FW_FEATURE_PLPKS,
 	FW_FEATURE_PSERIES_ALWAYS = 0,
 	FW_FEATURE_POWERNV_POSSIBLE = FW_FEATURE_OPAL | FW_FEATURE_ULTRAVISOR,
 	FW_FEATURE_POWERNV_ALWAYS = 0,
diff --git a/arch/powerpc/platforms/pseries/firmware.c b/arch/powerpc/platforms/pseries/firmware.c
index 080108d129ed..18447e5fa17d 100644
--- a/arch/powerpc/platforms/pseries/firmware.c
+++ b/arch/powerpc/platforms/pseries/firmware.c
@@ -68,6 +68,7 @@ hypertas_fw_features_table[] = {
 	{FW_FEATURE_RPT_INVALIDATE,	"hcall-rpt-invalidate"},
 	{FW_FEATURE_ENERGY_SCALE_INFO,	"hcall-energy-scale-info"},
 	{FW_FEATURE_WATCHDOG,		"hcall-watchdog"},
+	{FW_FEATURE_PLPKS,		"hcall-pks"},
 };
 
 /* Build up the firmware features bitmask using the contents of
diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index 6f7bf3fc3aea..b0658ea3eccb 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -378,7 +378,7 @@ bool plpks_is_available(void)
 {
 	int rc;
 
-	if (!firmware_has_feature(FW_FEATURE_LPAR))
+	if (!firmware_has_feature(FW_FEATURE_PLPKS))
 		return false;
 
 	rc = _plpks_get_config();
@@ -690,6 +690,9 @@ static __init int pseries_plpks_init(void)
 {
 	int rc;
 
+	if (!firmware_has_feature(FW_FEATURE_PLPKS))
+		return -ENODEV;
+
 	rc = _plpks_get_config();
 
 	if (rc) {
-- 
2.39.2

