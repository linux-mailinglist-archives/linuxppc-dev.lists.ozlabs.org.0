Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 656FB51D3AB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:49:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kvkkw1TmQz3dnr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 18:49:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s9HwTLA9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=s9HwTLA9; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvkgW3tRnz3c8r
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 18:46:14 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2467P3V6021352;
 Fri, 6 May 2022 08:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YDl7/aqpFpCdrx1lgURtCbrshmzxiqvA13vIQwyj5yY=;
 b=s9HwTLA97wouiJToHDZKTyM5aHNzxe5FPCnDJuCX0KabnNUCfQ0GRYaGQYn/KjriKjvn
 xEDyz8wM4cn7MR49FN7qcOc3wwFUZuJym2nw3u+OKLD0qC9KRXNqboDVJpGOLoeZNFrf
 LL44HdpTrdCtS+yF8PsVeQ8dHGu0IC/xCnIE4H4ET3CI3MuHyB2VRyeI74GAN1eW+/Jx
 PGUoPouRz6X8NtbKwjOZI+0UWuMN1Qrc1i+xKUu7IDGgmdBQMikMZY7JC9zN9MQl4tLG
 8NnEA2A6JbUi6+iNgbVvxlUwsw9XHP0jkeE0D7C8r3pPjqUVsqE1Ja14t0gxdy2M9aIy /w== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvy929evc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:46:09 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2468gh4L005160;
 Fri, 6 May 2022 08:46:07 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3fscdk637p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:46:07 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2468k4f058917358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 08:46:04 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84B934C04A;
 Fri,  6 May 2022 08:46:04 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DB384C040;
 Fri,  6 May 2022 08:46:02 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.19.224]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 08:46:02 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 04/35] selftest/powerpc/pmu: Add support for branch sampling
 in get_intr_regs function
Date: Fri,  6 May 2022 14:15:13 +0530
Message-Id: <20220506084544.56527-5-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220506084544.56527-1-kjain@linux.ibm.com>
References: <20220506084544.56527-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kFTrDxYF81xaryL9tLzyQCIDbZbJxQuE
X-Proofpoint-GUID: kFTrDxYF81xaryL9tLzyQCIDbZbJxQuE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_02,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205060043
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com,
 disgoel@linux.vnet.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for sample type as PERF_SAMPLE_BRANCH_STACK in sampling
tests. This change is a precursor/helper for sampling testcases, that
test branck stack feature in perf interface.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../powerpc/pmu/sampling_tests/misc.c         | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
index eff56aa9f511..2562d8439d7d 100644
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
2.31.1

