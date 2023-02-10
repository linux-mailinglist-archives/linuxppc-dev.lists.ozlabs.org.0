Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 584FD691A07
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 09:29:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCn381k37z3fv9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 19:29:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H2PlDHib;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H2PlDHib;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCmbx0B2Gz3fGZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 19:09:32 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31A7g0Kj032359;
	Fri, 10 Feb 2023 08:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FJTu8g+cFp9v9UBAlDhc/WogF7VPq+5Iyel3+118rCY=;
 b=H2PlDHib+SbWH3fEFdzBlKGYXdQff0Gok0hbnlBcP+YGZjLjfnJ1Gs+XIBXSuou43mR0
 YC+HitVdWCewyIFT9F9ChaZbyddaZkWWssWdo9JhPEi/yYrF2k/OmUUNffbI1SDEK7AA
 pBOFqx7jbN/wbsFpPuMPqNlMHhCtrgDp0M4HcWIpCnglQ3b5lLfYM421GSG3cvQn5ogu
 K+xv3RFEU8ONXs5LOGERtKveYj/b/+0/5HQBn7FeRQ9/KtDiXqPmuGe+imc7rmnTtD6q
 mlERfUOtwaFEdKlH92oPDjYmjk3O4A4ffGf4mYv+la/mcS2nCCDAA/o1vwuiPzNC9NKd 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnhrurs6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:09:28 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31A7hPfo003092;
	Fri, 10 Feb 2023 08:09:27 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnhrurs53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:09:27 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 319DYWaA001846;
	Fri, 10 Feb 2023 08:04:24 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3nhf06q4vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:04:24 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31A84M5d30736796
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Feb 2023 08:04:22 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 381822004D;
	Fri, 10 Feb 2023 08:04:22 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA2232004F;
	Fri, 10 Feb 2023 08:04:21 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Feb 2023 08:04:21 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BB608609BE;
	Fri, 10 Feb 2023 19:04:15 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v6 20/26] powerpc/pseries: Turn PSERIES_PLPKS into a hidden option
Date: Fri, 10 Feb 2023 19:03:55 +1100
Message-Id: <20230210080401.345462-21-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210080401.345462-1-ajd@linux.ibm.com>
References: <20230210080401.345462-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ckglOMvGBKNXWo5ZR6d28Ydukc12klHn
X-Proofpoint-GUID: tQV0Wjammj_00RiP24XqbwIV5v2hnh7e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_03,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302100070
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

It seems a bit unnecessary for the PLPKS code to have a user-visible
config option when it doesn't do anything on its own, and there's existing
options for enabling Secure Boot-related features.

It should be enabled by PPC_SECURE_BOOT, which will eventually be what
uses PLPKS to populate keyrings.

However, we can't get of the separate option completely, because it will
also be used for SED Opal purposes.

Change PSERIES_PLPKS into a hidden option, which is selected by
PPC_SECURE_BOOT.

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Russell Currey <ruscur@russell.cc>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

---

v3: New patch

v5: Change the previous description into a comment (npiggin)
---
 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/platforms/pseries/Kconfig | 19 +++++++++----------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b8c4ac56bddc..d4ed46101bec 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1029,6 +1029,7 @@ config PPC_SECURE_BOOT
 	depends on PPC_POWERNV || PPC_PSERIES
 	depends on IMA_ARCH_POLICY
 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT
+	select PSERIES_PLPKS if PPC_PSERIES
 	help
 	  Systems with firmware secure boot enabled need to define security
 	  policies to extend secure boot to the OS. This config allows a user
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index a3b4d99567cb..e51d65969318 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -151,16 +151,15 @@ config IBMEBUS
 
 config PSERIES_PLPKS
 	depends on PPC_PSERIES
-	bool "Support for the Platform Key Storage"
-	help
-	  PowerVM provides an isolated Platform Keystore(PKS) storage
-	  allocation for each LPAR with individually managed access
-	  controls to store sensitive information securely. It can be
-	  used to store asymmetric public keys or secrets as required
-	  by different usecases. Select this config to enable
-	  operating system interface to hypervisor to access this space.
-
-	  If unsure, select N.
+	bool
+	# PowerVM provides an isolated Platform Keystore (PKS) storage
+	# allocation for each LPAR with individually managed access
+	# controls to store sensitive information securely. It can be
+	# used to store asymmetric public keys or secrets as required
+	# by different usecases.
+	#
+	# This option is selected by in-kernel consumers that require
+	# access to the PKS.
 
 config PAPR_SCM
 	depends on PPC_PSERIES && MEMORY_HOTPLUG && LIBNVDIMM
-- 
2.39.1

