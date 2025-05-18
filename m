Return-Path: <linuxppc-dev+bounces-8648-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8286ABADED
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 May 2025 06:41:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0Snt44szz305D;
	Sun, 18 May 2025 14:41:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747543298;
	cv=none; b=XUlxtjTJBwZSUZTO9o/eFEpe42kdVCtQMER57orm+Crmu+/JN8Dl/Nvbq4Fw85fCDFxWr/OvbCZJFqPbegn81q/pasm9rcOmWDez68X0O3v02DrMkl0BNOL5ROpptGZArS17pAfhySpSTJi8Mv/viKjy9hh1V8QA30cVBVYwY7SbxctVGHtKtgY/KTMU3TZFkcdLz71PfXU0Jh47L4pyf2TeFJjqC8zNmFobvlEdK1ykpsGz8owFUNm6e4dW6iNTOtQo5tuFZeprJqMQ/bqpSTnm1452PLJqSdPpd7KClu6WCYQo3MpG3JZA8xq1XUoZq4kUS6djFwLOAgHrYOwhkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747543298; c=relaxed/relaxed;
	bh=r0rGgUgcl4TzmOdGYE7a7rQewodzhQ1pBAElvxJhekg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gh0hwHfA5M+iidB8g0T0P4M+OjDz6NsYdkb7yzaSHwBuKSs+1L4ikvsEvkHiiQ2D//mMTmHRbhp8TeU9SJJrLzJavJWVxcBq1cmg9+oPkXkSwTIVTH2Cmk4vfKXODAh+e9n1onJ8udQgYmmMZKa8YOIUv1NGfyJ4gGJamRCeu7FGJkSrSEG4YCRw6I+kbyLEJ6nHmJCaWwAnizIaXqbPeBM4a1OdyznXtS/ZcXpd+hlBfYq3s6pF1wVRfL+XXpNkbMY757NyZpxeA1CjtDfi0qj3LwptrtA4vv15g9nTCA9GuXa05HGbtZ6D/zouMbdMQdLctjvxUM2R+Ey+P904PQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=osj83EqQ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=osj83EqQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b0Sns6DgTz2xmZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 14:41:37 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I2LGrk031418;
	Sun, 18 May 2025 04:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=r0rGgUgcl4TzmOdGY
	E7a7rQewodzhQ1pBAElvxJhekg=; b=osj83EqQhB2VbYzNKyN0nC6WghVLarL4V
	KRqcybEXpLPqlZLFGQfpGgrxjDoKQCoMF14h0y1w78+Kkgcx/jGGOvpMS/XFhbve
	wIgFnBJx4tCbIsD1blFMqQGyOBnf3HaV1Vn+i+foUMoMWw1W5o4FIsJ89vHPyxZ8
	DHErzE5mvzb6EkS7kUKkSyyslpFFxuTIrUiqqBmlL6xknlqPQP2N6IlJkQUi+rx0
	iOSrjKCbSoVpq1HH0BbzDY1ZUeP4GblUyE6bCltuD/v9sWThddzKGXgc6uFMjNUn
	o9U3N90wsOfKUJ2egF0gGN5Ss4516HIK9uNllXHZNghmzqbFOsWnw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pup324x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 04:41:26 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54I4fPEv024440;
	Sun, 18 May 2025 04:41:25 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pup324x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 04:41:25 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54I1rVxK005356;
	Sun, 18 May 2025 04:41:25 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46q69m0ept-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 04:41:25 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54I4fLOj19661280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 May 2025 04:41:21 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD4E52006E;
	Sun, 18 May 2025 04:41:21 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 112C720040;
	Sun, 18 May 2025 04:41:18 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.51.82])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 18 May 2025 04:41:17 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH v2 2/4] powerpc/perf: make isa207_pmu_format_group struct static
Date: Sun, 18 May 2025 10:11:05 +0530
Message-ID: <20250518044107.39928-2-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518044107.39928-1-maddy@linux.ibm.com>
References: <20250518044107.39928-1-maddy@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: u_ls7VUqwnKFvlLX9xBy4655xEfAf_3a
X-Proofpoint-GUID: -TTd4VuwGq4u8sQaxI5rWo-j4Dtx3N3t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDAzOSBTYWx0ZWRfX5MxvH9svizYv xny3hzplbjrnrKHZkE9lsWEXnh6tzRGuVyQoTwydkGqF82hn5Qr6SDmZzgPY7Jl2ygX35KMCFEF liWkzLcPctZWxcgWIuSvp6YlmbQ5cc67V80PkcKv18EqzFjx+DgRZLsk7lKeU7PbbTutgZF3VGt
 qsV3uCAPtjPsftRaO2toUXZhRlZq3EDCKRwC46AkMDHIdQIDvtm5RE2LYJonxQO/gQGIKAzryYK FwajSOftXJRbF5eh4WAw6ZHyzEpgkw9Va+hzA3AIKkLBghKwUSzmewiZIO+uFfNlQLoAJKU/Tf2 /pAeGatEti+JSs1ecw8hwdLR67dN3TKAr2tIrHgSJEdJtFU6n2ZsXOjNu1O7Ld3EA1/IQnfn598
 3I0ntwgYWPFG2+rkHhPvBfqErwxFhCI4GETEcNKKATl4bGYPjUxN141wKCQ3AG02wPXIMafy
X-Authority-Analysis: v=2.4 cv=NKXV+16g c=1 sm=1 tr=0 ts=682964f6 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=qQsXf4edCEiIsRyVPPMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=899
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180039
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

isa207_pmu_format_group struct is local to the source and does not need to
be in global scope, so make it static

Cleans up sparse warning:
arch/powerpc/perf/isa207-common.c:40:30: warning: symbol 'isa207_pmu_format_group'
was not declared. Should it be static?

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v1:
- Added tested by tag

 arch/powerpc/perf/isa207-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 2b3547fdba4a..bbef51849f33 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -37,7 +37,7 @@ static struct attribute *isa207_pmu_format_attr[] = {
 	NULL,
 };
 
-const struct attribute_group isa207_pmu_format_group = {
+static const struct attribute_group isa207_pmu_format_group = {
 	.name = "format",
 	.attrs = isa207_pmu_format_attr,
 };
-- 
2.49.0


