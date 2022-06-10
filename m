Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E63B2546785
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 15:44:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKMdS6GVwz3cHD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 23:44:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b74nnozb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b74nnozb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKMZG5jbNz3bsh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 23:41:42 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25ADTCGU015327;
	Fri, 10 Jun 2022 13:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FSXGKepnTxoHfMhmr33eHRDta+RxRo7Ng+l5tkE7/G0=;
 b=b74nnozb+xxNQk/FXCUVlEwEaCGp2Aea4+5Aumwqg2LCfyr9HX4l1WpVgUKuzfNXBfDS
 U61mqDeA9XGcamQE2L3lOQzF9NbjuSuk1xyDtJTK9bJLkaX3XPJlEPADFFX4h6O1kDMe
 t1lL84e5Xu0m8DFnJYgksDgLv3UxpV4xsvO8Tal5PnGBqPv4Kb3yj1V+WXRRVO6w5eRJ
 smiUejHGCxzTrRGM/NWb1hfhmNf3+rpMw6ehllmb3VKldwKEdGMxtaG11JzMxIIT92cH
 AR+Ryoml4WG2JPnyjjdPrmkprlYc67A/N6u5oJVLC3duNC9/gIwqLMEPMTW3ggiEogHS qQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm6vn0ac7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:41:38 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ADaBkN005502;
	Fri, 10 Jun 2022 13:41:36 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04fra.de.ibm.com with ESMTP id 3gfy18xhx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:41:36 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ADfW397930346
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 13:41:32 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C80F052050;
	Fri, 10 Jun 2022 13:41:32 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.7.130])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 80F6E5204E;
	Fri, 10 Jun 2022 13:41:30 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 04/35] selftest/powerpc/pmu: Add support for branch sampling in get_intr_regs function
Date: Fri, 10 Jun 2022 19:10:42 +0530
Message-Id: <20220610134113.62991-5-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
References: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qdpOTQus6rvDLbhCrJsiquVeo6SiUoxt
X-Proofpoint-ORIG-GUID: qdpOTQus6rvDLbhCrJsiquVeo6SiUoxt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100056
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Kajol Jain <kjain@linux.ibm.com>

Add support for sample type as PERF_SAMPLE_BRANCH_STACK in sampling
tests. This change is a precursor/helper for sampling testcases, that
test branck stack feature in perf interface.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../powerpc/pmu/sampling_tests/misc.c         | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
index 6e30b455cbd6..5a26fc3a9706 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
@@ -259,13 +259,32 @@ u64 *get_intr_regs(struct event *event, void *sample_buff)
 	u64 *intr_regs;
 	size_t size = 0;
 
-	if ((type ^ PERF_SAMPLE_REGS_INTR))
+	if ((type ^ (PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_BRANCH_STACK)) &&
+			(type  ^ PERF_SAMPLE_REGS_INTR))
 		return NULL;
 
 	intr_regs = (u64 *)perf_read_first_sample(sample_buff, &size);
 	if (!intr_regs)
 		return NULL;
 
+	if (type & PERF_SAMPLE_BRANCH_STACK) {
+		/*
+		 * PERF_RECORD_SAMPLE and PERF_SAMPLE_BRANCH_STACK:
+		 * struct {
+		 *     struct perf_event_header hdr;
+		 *     u64 number_of_branches;
+		 *     struct perf_branch_entry[number_of_branches];
+		 *     u64 data[];
+		 * };
+		 * struct perf_branch_entry {
+		 *     u64	from;
+		 *     u64	to;
+		 *     u64	misc;
+		 * };
+		 */
+		intr_regs += ((*intr_regs) * 3) + 1;
+	}
+
 	/*
 	 * First entry in the sample buffer used to specify
 	 * PERF_SAMPLE_REGS_ABI_64, skip perf regs abi to access
-- 
2.35.1

