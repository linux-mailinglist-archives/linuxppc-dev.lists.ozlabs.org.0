Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A067604C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:37:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WEwi6h/N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R905B1gtqz3cMQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 11:37:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WEwi6h/N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8zFy6Dmmz308W
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 10:59:50 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36P0qOwF005114
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MN1G3GyUJe7Cm12vosWC5MM2yio6P+IshVQjJtXvH7I=;
 b=WEwi6h/NzH8XWg+qAg+daVVz8xwy40aBcpgvm7q91I6AESvMlkhNSd3ASJ5T/DHsjWym
 +92wsaXPNHw67Km0MTt3caGPtdf1oMY0E9zUFhKsGiHt9RaPwfPdEuJeDjwyKq2CZrcV
 fiGBunVyOOP1C1ux7Dfx9RC6zGGCgi8S2NtuMUCKbNJMtjquyWFslEvykK4ZQ8sxWrHk
 TaJd5Ul6VkIHGzbTAVbbgCE0rQUMtoby7rbYlDejuRy//99Wv2V4XvVJCttOxSGVRthm
 elG1w646SB/hlsxi478l5YklOTXgUDCqPKk9GxumqVu1JiGlIJI0CZA4IJmMi5Tjfhx9 Ng== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s212k3gjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:47 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36P0MWkk014370
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:46 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0stxr19x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:46 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36P0xib431261208
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:44 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E57D20049
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:44 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2A3120040
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:43 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3F8A860458;
	Tue, 25 Jul 2023 10:59:41 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 3/4] selftests/powerpc/ptrace: Fix typo in pid_max search error
Date: Tue, 25 Jul 2023 10:58:40 +1000
Message-ID: <20230725005841.28854-4-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725005841.28854-1-bgray@linux.ibm.com>
References: <20230725005841.28854-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ku3huTNYUygTwUglLZFsLLhiBifcjenu
X-Proofpoint-ORIG-GUID: Ku3huTNYUygTwUglLZFsLLhiBifcjenu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_18,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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

pid_max_addr() searches for the 'pid_max' symbol in /proc/kallsyms, and
prints an error if it cannot find it. The error message has a typo,
calling it pix_max.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbreak.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbreak.c b/tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbreak.c
index 16c653600124..d8a9e95fc03d 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbreak.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbreak.c
@@ -46,7 +46,7 @@ static unsigned long pid_max_addr(void)
 		return strtoul(addr, &c, 16);
 	}
 	fclose(fp);
-	printf("Could not find pix_max. Exiting..\n");
+	printf("Could not find pid_max. Exiting..\n");
 	exit(EXIT_FAILURE);
 	return -1;
 }
-- 
2.41.0

