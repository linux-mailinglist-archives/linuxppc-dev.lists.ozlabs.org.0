Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 711CE6D8E64
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 06:38:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsTKC0RCyz3fdD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 14:38:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wox+X2uv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wox+X2uv;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsTCc2BXCz3f5K
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 14:33:48 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3361pAfZ007845
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Lr/B57fRNYWj4BvjvXTPqjgjmjLIbueHfCIGMIRMGxE=;
 b=Wox+X2uvDhhgrDiwY7npCv0snx6vNCfKhcxyyt/bRlXyPeB6s/5226elDB2KqbSv+wG0
 DtfqS+aQU8HImwH5FosKRHn7zD2ryAtdWFe1nu337Ggxe/Au8B5+/LcsHm1+fXHFRXYK
 rIDIF3IYSWhOehK5B8k5oq/4JZc5oW5kVAK9HqzZEDvO0/aCwblsf4taOmODx96PRSy/
 0mc8coyOpq2SLWuAJG7Ur7OGr1LJeV3mB4SuMf0sgNrNZPwn1+rPI6YiCHor25my63ux
 /jfX1zCkvtclm3c1bFOcBzCe1WdMxQ1gniq+owfLQXLz8UG8yLdG+bkbcmEsaIiSjLPy 1A== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3psa3t2fcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 04:33:46 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3361vZK2027980
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:44 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ppc873x10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 04:33:43 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3364Xefq46531196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:40 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BDAF02004D
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:40 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E19C2004B
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:40 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:40 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2C01960456;
	Thu,  6 Apr 2023 14:33:36 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 6/7] selftests/powerpc/dscr: Speed up DSCR sysfs tests
Date: Thu,  6 Apr 2023 14:33:19 +1000
Message-Id: <20230406043320.125138-7-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406043320.125138-1-bgray@linux.ibm.com>
References: <20230406043320.125138-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qyosEn7rU74iGMD7YcRrb669UXRyIae9
X-Proofpoint-GUID: qyosEn7rU74iGMD7YcRrb669UXRyIae9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_15,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 suspectscore=0 mlxscore=0
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

This test case is extremely slow, taking around a minute compared to
most of the other DSCR tests taking a second at most. Perf shows most
time is spent by the kernel switching to each CPU it reads in
/sys/devices/system/cpu. This switching is an unavoidable consequnce
of reading all the .../cpuN/dscr values.

Remove the outer iteration loop from this test case, reducing the reads
from 1600 to 16. This still updates the DSCR 16 times and verifies on
every CPU each time, so I do not expect the lower coverage to be
meaningful. The speedup is significant: back down to ~1 second like the
other tests.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 .../testing/selftests/powerpc/dscr/dscr_sysfs_test.c  | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c b/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c
index 4f1fef6198fc..e7cd0d6b1fad 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c
+++ b/tools/testing/selftests/powerpc/dscr/dscr_sysfs_test.c
@@ -67,17 +67,14 @@ static int check_all_cpu_dscr_defaults(unsigned long val)
 int dscr_sysfs(void)
 {
 	unsigned long orig_dscr_default;
-	int i, j;
 
 	SKIP_IF(!have_hwcap2(PPC_FEATURE2_DSCR));
 
 	orig_dscr_default = get_default_dscr();
-	for (i = 0; i < COUNT; i++) {
-		for (j = 0; j < DSCR_MAX; j++) {
-			set_default_dscr(j);
-			if (check_all_cpu_dscr_defaults(j))
-				goto fail;
-		}
+	for (int i = 0; i < DSCR_MAX; i++) {
+		set_default_dscr(i);
+		if (check_all_cpu_dscr_defaults(i))
+			goto fail;
 	}
 	set_default_dscr(orig_dscr_default);
 	return 0;
-- 
2.39.2

