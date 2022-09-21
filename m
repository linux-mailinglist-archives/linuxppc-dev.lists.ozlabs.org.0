Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 404C65C0068
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 16:55:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXhKS1TNGz3c8B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 00:55:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n2ZDaWrr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n2ZDaWrr;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXhHP0yjTz2xgb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 00:53:20 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28LDbaoS000562;
	Wed, 21 Sep 2022 14:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eT+jWzE0QsWse+GHndbHQJxebpjwlok50h5XhXlfbvU=;
 b=n2ZDaWrriqxUgxxczg0xppUHI2d6GcivCfytDbUV0Jxu0uhaVgwEew8R/nmoE7DFKQIi
 6DiLHPQ3pFfrEUPTPfmAEkwMGzYdApI1SitagH1xM2z1ffhhwNxVQSJ8LodTuZIonL9e
 cA+w5+l8dvNg+DyD1S34sbeScTAWY0elJ4Gm4AyBcRzrU0jKeZBL3rxhlkgJvb/QeFhg
 WGtyyKratQ5yQAHsJIzO/U1iuPS9+r1inAm2FSrMy4L65w1uQiA3C10NtIOEfe/KeXOO
 W1ZNOd3xQdws4l7ff+R7PbdHxpK2vE1ViLIMlDOXm5NmAbOVsmuER2ZhDMTymdj7Yjw6 HQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jr3djk65d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 14:53:07 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28LEpALD009777;
	Wed, 21 Sep 2022 14:53:05 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3jn5v8ndmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 14:53:05 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28LEr26454657292
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 14:53:02 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2960511C04A;
	Wed, 21 Sep 2022 14:53:02 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DBF8711C04C;
	Wed, 21 Sep 2022 14:52:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.4.79])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 21 Sep 2022 14:52:59 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, mpe@ellerman.id.au
Subject: [PATCH V2 2/3] tools/perf/tests: Fix branch stack sampling test to include sanity check for branch filter
Date: Wed, 21 Sep 2022 20:22:54 +0530
Message-Id: <20220921145255.20972-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921145255.20972-1-atrajeev@linux.vnet.ibm.com>
References: <20220921145255.20972-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ng1qzvbkvcPD3IzSfnvrtY3Y4V4fyVAu
X-Proofpoint-GUID: Ng1qzvbkvcPD3IzSfnvrtY3Y4V4fyVAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_08,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209210099
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit b55878c90ab9 ("perf test: Add test for branch stack sampling")
added test for branch stack sampling. There is a sanity check in the
beginning to skip the test if the hardware doesn't support branch stack
sampling.

Snippet
<<>>
skip the test if the hardware doesn't support branch stack sampling
perf record -b -o- -B true > /dev/null 2>&1 || exit 2
<<>>

But the testcase also uses branch sample types: save_type, any. if any
platform doesn't support the branch filters used in the test, the testcase
will fail. In powerpc, currently mutliple branch filters are not supported
and hence this test fails in powerpc. Fix the sanity check to look at
the support for branch filters used in this test before proceeding with
the test.

Fixes: b55878c90ab9 ("perf test: Add test for branch stack sampling")
Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reviewed-by: Kajol Jain <kjain@linux.ibm.com>
---
 tools/perf/tests/shell/test_brstack.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/test_brstack.sh b/tools/perf/tests/shell/test_brstack.sh
index c644f94a6500..ec801cffae6b 100755
--- a/tools/perf/tests/shell/test_brstack.sh
+++ b/tools/perf/tests/shell/test_brstack.sh
@@ -12,7 +12,8 @@ if ! [ -x "$(command -v cc)" ]; then
 fi
 
 # skip the test if the hardware doesn't support branch stack sampling
-perf record -b -o- -B true > /dev/null 2>&1 || exit 2
+# and if the architecture doesn't support filter types: any,save_type,u
+perf record -b -o- -B --branch-filter any,save_type,u true > /dev/null 2>&1 || exit 2
 
 TMPDIR=$(mktemp -d /tmp/__perf_test.program.XXXXX)
 
-- 
2.31.1

