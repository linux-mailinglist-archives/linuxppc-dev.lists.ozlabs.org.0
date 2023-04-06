Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C51B46D8E61
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 06:37:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsTHK5ThXz3fZ9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 14:37:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r04QexoF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r04QexoF;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsTCZ1TbKz3f54
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 14:33:45 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3362o88A032672
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ieyrbH2XRuuMXMfRfAw0tVQKdU1Ytst12EtwpQY6FZo=;
 b=r04QexoF9Pyy5cj2pD1yvHUXnGn4Fjd/CnGSd7O4xI07+aVctxnWYnasqbhelsymxY2R
 Ec9oc4Bh/MAbPm7DnU2EThvZv1e+DVupzJLN+XszlF2t2xxHIjBBtd/DxcRaVSz7NxFS
 5+NL8IyBx9UIjgOHn0YDojmNYvA3yfKxGylbFInkayHjcTWZcBbsoiOC+dDcrjkcpQLg
 iZG3d5hRcgjQq4pnvlxp4vxiIZc/+ql8rVbowi5LufcneSrIZFE5mbNidje5Go4JVxe4
 1lXQfpAxfN9WohEG1TeFIIkxMSPndwAUKZSQTFW4ZKLoi/F9YklXS7Sb98FWPmnVZQm3 ug== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3psajnh10y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 04:33:42 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3362Rdlh020756
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:41 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ppc873x0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 04:33:40 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3364XcwO41287990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:38 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56C3C20049
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:38 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB45020040
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:37 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 18ECB600E2;
	Thu,  6 Apr 2023 14:33:36 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/7] selftests/powerpc/dscr: Correct typos
Date: Thu,  6 Apr 2023 14:33:14 +1000
Message-Id: <20230406043320.125138-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406043320.125138-1-bgray@linux.ibm.com>
References: <20230406043320.125138-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qSQx31oD8jmjerjaxP0xAJ8rQiqSd6m0
X-Proofpoint-GUID: qSQx31oD8jmjerjaxP0xAJ8rQiqSd6m0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_15,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=938 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304060039
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

Correct a couple of typos while working on other improvements to the
DSCR tests.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c | 4 ++--
 tools/testing/selftests/powerpc/dscr/dscr_inherit_test.c  | 4 ++--
 tools/testing/selftests/powerpc/dscr/dscr_user_test.c     | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c b/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c
index 32fcf2b324b1..5659d98cf340 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c
+++ b/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c
@@ -7,8 +7,8 @@
  * privilege state SPR and the problem state SPR for this purpose.
  *
  * When using the privilege state SPR, the instructions such as
- * mfspr or mtspr are priviledged and the kernel emulates them
- * for us. Instructions using problem state SPR can be exuecuted
+ * mfspr or mtspr are privileged and the kernel emulates them
+ * for us. Instructions using problem state SPR can be executed
  * directly without any emulation if the HW supports them. Else
  * they also get emulated by the kernel.
  *
diff --git a/tools/testing/selftests/powerpc/dscr/dscr_inherit_test.c b/tools/testing/selftests/powerpc/dscr/dscr_inherit_test.c
index f9dfd3d3c2d5..68ce328e813e 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr_inherit_test.c
+++ b/tools/testing/selftests/powerpc/dscr/dscr_inherit_test.c
@@ -7,8 +7,8 @@
  * value using mfspr.
  *
  * When using the privilege state SPR, the instructions such as
- * mfspr or mtspr are priviledged and the kernel emulates them
- * for us. Instructions using problem state SPR can be exuecuted
+ * mfspr or mtspr are privileged and the kernel emulates them
+ * for us. Instructions using problem state SPR can be executed
  * directly without any emulation if the HW supports them. Else
  * they also get emulated by the kernel.
  *
diff --git a/tools/testing/selftests/powerpc/dscr/dscr_user_test.c b/tools/testing/selftests/powerpc/dscr/dscr_user_test.c
index e09072446dd3..67bb872a246a 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr_user_test.c
+++ b/tools/testing/selftests/powerpc/dscr/dscr_user_test.c
@@ -8,8 +8,8 @@
  * numbers.
  *
  * When using the privilege state SPR, the instructions such as
- * mfspr or mtspr are priviledged and the kernel emulates them
- * for us. Instructions using problem state SPR can be exuecuted
+ * mfspr or mtspr are privileged and the kernel emulates them
+ * for us. Instructions using problem state SPR can be executed
  * directly without any emulation if the HW supports them. Else
  * they also get emulated by the kernel.
  *
-- 
2.39.2

