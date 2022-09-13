Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D845B6CA7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 13:58:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRhmn1CNmz3chs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 21:58:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hvoG7G0n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hvoG7G0n;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRhkd5csHz307C
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 21:56:09 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DBfhvr030746;
	Tue, 13 Sep 2022 11:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=OF+O4cVMeto1du/udwN+AFR+lGcq1cPITa+yNswzK5Q=;
 b=hvoG7G0nfpUMWCKRyHGGOy53fi8vnPFGnprr+GSkNeQ/xHuyXIoQJwVP3bf3HBcuuKuO
 U1vBIuiASSovhRDhd8SQRsW8/jFeLvS6kCEsRxcvTU5IJ/RDB4cV+JHPWga8e2HxH+HC
 i7hpdv94O+bYAxNaa731k59Nu2SoJ1aEW5PmUFx6n0KO15asCmU81tKNK7o2uZoz20T0
 S2Yu1rcgRMjwBMBJSRI5504UEeaa/0y2JbzJ6SbtnCivYRulOWu6mvrvu7iFWlExAWTk
 hEHdRJL7o17CmIM1Xi8fhhLynMqfpQretpu20zHeY8oS/GPuYQ3F1MRQz7c7sE6mIWpR gA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjs7aremc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 11:56:03 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28DBof89012971;
	Tue, 13 Sep 2022 11:56:01 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 3jgj79krd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 11:56:01 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28DBtwjU41419216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Sep 2022 11:55:58 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 82BAEA404D;
	Tue, 13 Sep 2022 11:55:58 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2CD9CA4040;
	Tue, 13 Sep 2022 11:55:56 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.78.239])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 13 Sep 2022 11:55:55 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, mpe@ellerman.id.au
Subject: [PATCH 3/3] tools/testing/selftests/powerpc: Update the bhrb filter sampling test to test for multiple branch filters
Date: Tue, 13 Sep 2022 17:25:46 +0530
Message-Id: <20220913115546.36179-3-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220913115546.36179-1-atrajeev@linux.vnet.ibm.com>
References: <20220913115546.36179-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Qd_P7xtogQ4u0cS5VMPqDxCKoCVm0Vgh
X-Proofpoint-GUID: Qd_P7xtogQ4u0cS5VMPqDxCKoCVm0Vgh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_05,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130052
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

For PERF_SAMPLE_BRANCH_STACK sample type, different branch_sample_type,
ie branch filters are supported. The testcase "bhrb_filter_map_test"
tests the valid and invalid filter maps in different powerpc platforms.
Update this testcase to include scenario to cover multiple branch
filters at sametime. Since powerpc doesn't support multiple filters at
sametime, expect failure during perf_event_open.

Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/sampling_tests/bhrb_filter_map_test.c    | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
index 8182647c63c8..605669d4e4cb 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
@@ -96,6 +96,15 @@ static int bhrb_filter_map_test(void)
 		}
 	}
 
+	/*
+	 * Combine filter maps which includes a valid branch filter and an invalid branch
+	 * filter. Example: any ( PERF_SAMPLE_BRANCH_ANY) and save_type
+	 * (PERF_SAMPLE_BRANCH_TYPE_SAVE).
+	 * The perf_event_open should fail in this case.
+	 */
+	event.attr.branch_sample_type = PERF_SAMPLE_BRANCH_ANY | PERF_SAMPLE_BRANCH_TYPE_SAVE;
+	FAIL_IF(!event_open(&event));
+
 	return 0;
 }
 
-- 
2.31.1

