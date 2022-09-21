Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E90045C0056
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 16:54:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXhJk6CMzz3c9W
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 00:54:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=djlIXTYQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=djlIXTYQ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXhHK27W4z2xgb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 00:53:16 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28LEBRDw026141;
	Wed, 21 Sep 2022 14:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=OytiCbZ+hr65qHIxRfBe2c+T0flu3QwSpsi70//OSI0=;
 b=djlIXTYQrMz/zoOLOVYXLZLSms+q864VJlLG8ElkLmQ3UAAgRT0pOGNutJzNlQ6yal3n
 NJnnRnhYIGsMNmKeCzRchMOKjFUu/iMVuu+pvFHxNmMY8HHg/58/LcFAQ9TGafey6fOx
 MWP2Xwm55i18Ug1XfAf3v9d39BB5PXEw+3mzcjV9IWlQQgJV19YUr3i/pqE0E8O5VGeG
 LaW73C18hweEVzmM/wPLDCQ9IaGEQ+hovT4a2xai05PT5yezxmvT3vtIYACiDpoNFSnD
 NqfYzuum2Eo5obJzrUVfL4+t+t3s6ssW2xRe5QD1gCLa0NSO/NPZRTm20EZQt4Nokzye XA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jr2dfdhkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 14:53:10 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28LEr1W4014898;
	Wed, 21 Sep 2022 14:53:08 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma05fra.de.ibm.com with ESMTP id 3jn5v8v0e9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 14:53:07 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28LEr4H236307382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 14:53:04 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B1CDC11C050;
	Wed, 21 Sep 2022 14:53:04 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87E1211C04C;
	Wed, 21 Sep 2022 14:53:02 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.4.79])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 21 Sep 2022 14:53:02 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, mpe@ellerman.id.au
Subject: [PATCH V2 3/3] tools/testing/selftests/powerpc: Update the bhrb filter sampling test to test for multiple branch filters
Date: Wed, 21 Sep 2022 20:22:55 +0530
Message-Id: <20220921145255.20972-3-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921145255.20972-1-atrajeev@linux.vnet.ibm.com>
References: <20220921145255.20972-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mi-DZKLgTBHb7t21y5M0U0we1g33woRP
X-Proofpoint-GUID: mi-DZKLgTBHb7t21y5M0U0we1g33woRP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_08,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210099
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
Reviewed-by: Kajol Jain <kjain@linux.ibm.com>
---
Changelog:
 Fixed compile error for undefined branch sample type
 by using PERF_SAMPLE_BRANCH_ANY_CALL instead of
 PERF_SAMPLE_BRANCH_TYPE_SAVE

 .../powerpc/pmu/sampling_tests/bhrb_filter_map_test.c    | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
index 8182647c63c8..3f43c315c666 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
@@ -96,6 +96,15 @@ static int bhrb_filter_map_test(void)
 		}
 	}
 
+	/*
+	 * Combine filter maps which includes a valid branch filter and an invalid branch
+	 * filter. Example: any ( PERF_SAMPLE_BRANCH_ANY) and any_call
+	 * (PERF_SAMPLE_BRANCH_ANY_CALL).
+	 * The perf_event_open should fail in this case.
+	 */
+	event.attr.branch_sample_type = PERF_SAMPLE_BRANCH_ANY | PERF_SAMPLE_BRANCH_ANY_CALL;
+	FAIL_IF(!event_open(&event));
+
 	return 0;
 }
 
-- 
2.31.1

