Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5517604BE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:35:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZAxko2XT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R903H75nYz3cbF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 11:35:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZAxko2XT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8zFy6gQhz309D
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 10:59:50 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36P0fsV8027386
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JjTEzI1WTtzBjZ/DOKX55alxSBXuPOuKWwZKKcX67MQ=;
 b=ZAxko2XTViIzVuGdU4+lyazRBvgTb+JXpIu8rbz72DOkJmHDDL8sF+Jzh0UaTVYrFXXV
 3rJX4X2dnNVGNkeMm1RssIhdVq+Csg6/xCY51uk6jT8khBtjP2rpf5wja9i/H4fB6DC/
 Rq3DKpChlHZZDZHZ+fb64N1J2of2uOpzu0B5/7LTCTtLEymO4wrHbq1TVD2ScIY7HwGa
 FeD0Vx1/T3fC3Y1ock6GEzmhRArvYrZGJg/dk1oFit29zKh547HPb/tgDZ1nJGNvYwMI
 93T0ZRDjVEs+7GJzjdxXRojqHaRwF3bq0rWaRCXlqOUrlFznyNPyQa2/TGMT4v14oCj8 Og== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s22w3hst4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:47 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36P0pRuk001973
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:46 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0temqsc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:46 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36P0xiw561931784
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:44 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D70520040
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:44 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E259520063
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:43 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4133760459;
	Tue, 25 Jul 2023 10:59:41 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 4/4] selftests/powerpc/ptrace: Declare test temporary variables as volatile
Date: Tue, 25 Jul 2023 10:58:41 +1000
Message-ID: <20230725005841.28854-5-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725005841.28854-1-bgray@linux.ibm.com>
References: <20230725005841.28854-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: a6NehXqoA-lnRhnE72OJ9_2d7TUNstcL
X-Proofpoint-ORIG-GUID: a6NehXqoA-lnRhnE72OJ9_2d7TUNstcL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_18,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250003
X-Mailman-Approved-At: Tue, 25 Jul 2023 11:33:14 +1000
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

While the target is volatile, the temporary variables used to access the
target cast away the volatile. This is undefined behaviour, and a
compiler may optimise away/reorder these accesses, breaking the test.

This was observed with GCC 13.1.1, but it can be difficult to reproduce
because of the dependency on compiler behaviour.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 .../selftests/powerpc/ptrace/ptrace-hwbreak.c | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c b/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
index a16239277a6f..75d30d61ab0e 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
@@ -64,26 +64,26 @@ static bool dawr_present(struct ppc_debug_info *dbginfo)
 
 static void write_var(int len)
 {
-	__u8 *pcvar;
-	__u16 *psvar;
-	__u32 *pivar;
-	__u64 *plvar;
+	volatile __u8 *pcvar;
+	volatile __u16 *psvar;
+	volatile __u32 *pivar;
+	volatile __u64 *plvar;
 
 	switch (len) {
 	case 1:
-		pcvar = (__u8 *)&glvar;
+		pcvar = (volatile __u8 *)&glvar;
 		*pcvar = 0xff;
 		break;
 	case 2:
-		psvar = (__u16 *)&glvar;
+		psvar = (volatile __u16 *)&glvar;
 		*psvar = 0xffff;
 		break;
 	case 4:
-		pivar = (__u32 *)&glvar;
+		pivar = (volatile __u32 *)&glvar;
 		*pivar = 0xffffffff;
 		break;
 	case 8:
-		plvar = (__u64 *)&glvar;
+		plvar = (volatile __u64 *)&glvar;
 		*plvar = 0xffffffffffffffffLL;
 		break;
 	}
@@ -98,16 +98,16 @@ static void read_var(int len)
 
 	switch (len) {
 	case 1:
-		cvar = (__u8)glvar;
+		cvar = (volatile __u8)glvar;
 		break;
 	case 2:
-		svar = (__u16)glvar;
+		svar = (volatile __u16)glvar;
 		break;
 	case 4:
-		ivar = (__u32)glvar;
+		ivar = (volatile __u32)glvar;
 		break;
 	case 8:
-		lvar = (__u64)glvar;
+		lvar = (volatile __u64)glvar;
 		break;
 	}
 }
-- 
2.41.0

