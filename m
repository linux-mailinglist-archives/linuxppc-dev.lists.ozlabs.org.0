Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9A052E8A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 11:21:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4LnN6VQ3z3dPZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:21:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UkdQS8BG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UkdQS8BG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Lk82D5Pz3bkt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 19:18:24 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K8q7Tr017058;
 Fri, 20 May 2022 09:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=PYKjj5aE3O+LRWbyveLmq2GmXmssXo8PZcsEiKMRNoY=;
 b=UkdQS8BG4r4dio/eIKq8Cui6/9YKLu+dX2LDnEFzxaalXYX+ksjji6XymELccpZQQZZB
 GptVy59PLLtmcwZoZF/R6fqNVeDWOLDtvajanzxsDlQbqVbLMxtXX8yy1U0MaJM/kvwv
 RAG1FQSn8pEpP+89zJ5E0KsFlhWaytLG0njM4euzxq0fLzgmh95trqZgWRU7amPfCdSQ
 RbCVl36N3nBh9Qpw548GyhwG4NK4uynoZVsJYF9WuKFjyxdeoVQeHB8oFud29QRywOY8
 85atGDdzAMtwhZC1oh3LZUwIGDr5GdSVL1ApyJ4WrZ7XSEyMoPYwzJhm98tURE65mz8/ LA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g67uw0f40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:18:20 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24K9F2gW002489;
 Fri, 20 May 2022 09:18:18 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3g2428xxy1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:18:17 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24K9HZp426673546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 09:17:35 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB41B4C04E;
 Fri, 20 May 2022 09:18:14 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1A964C044;
 Fri, 20 May 2022 09:18:11 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.31.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 09:18:11 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 04/35] selftest/powerpc/pmu: Add support for branch
 sampling in get_intr_regs function
Date: Fri, 20 May 2022 14:47:20 +0530
Message-Id: <20220520091751.17000-5-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
References: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6pT_awgmFesNdOdUqf3WAkpPvSbmKBhS
X-Proofpoint-ORIG-GUID: 6pT_awgmFesNdOdUqf3WAkpPvSbmKBhS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205200066
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
Cc: kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Kajol Jain <kjain@linux.ibm.com>

Add support for sample type as PERF_SAMPLE_BRANCH_STACK in sampling
tests. This change is a precursor/helper for sampling testcases, that
test branck stack feature in perf interface.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../powerpc/pmu/sampling_tests/misc.c         | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
index f2baaeaea116..045e6204fba6 100644
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

