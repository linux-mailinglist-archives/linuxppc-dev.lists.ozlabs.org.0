Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7196AD392
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 01:58:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVxsM05BKz3f3M
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 11:58:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=druPVCIN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=druPVCIN;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVxpN4cbcz3bck
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 11:56:12 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3270GspY013804
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Mar 2023 00:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ieyrbH2XRuuMXMfRfAw0tVQKdU1Ytst12EtwpQY6FZo=;
 b=druPVCINOqoHlqktN5cSvB4XMrXOcClARV7sQ50fLjLROMAx7w8s6X2SUNJR8hNPVzIX
 WBxw149L1so5RXiuXikeP8/gA1g6/g5D1DmQxg3kEPzUwek4+senOJ9SFHvsW2RchFC0
 +p9q7ZN7JhWlmuHqBf5+wImYQrT3R34eVTAoDPgQt5KCb+nFpIbctVbkyIKKPwmzhrXm
 yve5msCbD9un6uXVjgGTW/OysUH2qfkR+J3R2nlk6jQHeP1Fl1fCWp7+T3IZ7Szp4PtM
 aKmzlKKluLdLFgNggjaMwLLgq8yVTgCPtMPF0d5WrEuFnrS8kK3YlmjpbkzchurieFre zw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4uaf1jtb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Mar 2023 00:56:10 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 326MkbMU030346
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Mar 2023 00:56:08 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3p417q2re4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Mar 2023 00:56:07 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3270u5WP328310
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Mar 2023 00:56:05 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61EFE20040
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 00:56:05 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D6B1E2004D
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 00:56:04 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 00:56:04 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9C56560419;
	Tue,  7 Mar 2023 11:56:02 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/5] selftests/powerpc/dscr: Correct typos
Date: Tue,  7 Mar 2023 11:55:11 +1100
Message-Id: <20230307005515.174362-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307005515.174362-1-bgray@linux.ibm.com>
References: <20230307005515.174362-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ic3D9WnVbg1w2wPK3PrI8l1rmOu8bX06
X-Proofpoint-ORIG-GUID: ic3D9WnVbg1w2wPK3PrI8l1rmOu8bX06
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=992 clxscore=1015
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070003
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

