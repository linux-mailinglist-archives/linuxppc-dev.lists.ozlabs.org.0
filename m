Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAED76AD389
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 01:57:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVxrK4PsMz3f5l
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 11:57:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sgZ7aT3r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sgZ7aT3r;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVxpN4JXbz3bby
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 11:56:12 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3270RLGc028628
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Mar 2023 00:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Lr/B57fRNYWj4BvjvXTPqjgjmjLIbueHfCIGMIRMGxE=;
 b=sgZ7aT3rkZgArKxOdgaw715ZURYEVCoQ1EqQxeIdNKENkaimrnegKilPJTnZxmGskffZ
 BTz8p1Zc5Zt5O0+By0g7ZjJuVYN16FGYxmdfeb7sz8Gsd4QLO59yILKNZCI/9xJ8xm6J
 8v7oy+Ur+vmC/RlQh7+chCuthJKAswK1CDQ6BBRy8/KGe5hdba3qN/nbr/RGT1RtzRUb
 qPu97zEQKtz0q7+NDFqhmLfGNb438S0xaj152CmWNOAv9XauW+zK8v7o+5MIBWsPrNDX
 Sj0U9isVE1ivkEZmeF6XxmWNNkTTeZMyi72ibcYoKujple33O6Q0kiHF+0kSsEojdmb0 Ag== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4yse5ta6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Mar 2023 00:56:10 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 326MMplP031584
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Mar 2023 00:56:07 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3p417q2re3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Mar 2023 00:56:07 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3270u52A63832534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Mar 2023 00:56:05 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 631612004B
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 00:56:05 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D824E2004D
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 00:56:04 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 00:56:04 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A243860622;
	Tue,  7 Mar 2023 11:56:02 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/5] selftests/powerpc/dscr: Speed up DSCR sysfs tests
Date: Tue,  7 Mar 2023 11:55:14 +1100
Message-Id: <20230307005515.174362-5-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307005515.174362-1-bgray@linux.ibm.com>
References: <20230307005515.174362-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qMuH2hgNQjFSLW4v-jBxkDTLjr-XF233
X-Proofpoint-GUID: qMuH2hgNQjFSLW4v-jBxkDTLjr-XF233
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070003
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

