Return-Path: <linuxppc-dev+bounces-2171-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C0399BA93
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2024 19:38:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRSJ04q5dz2xps;
	Mon, 14 Oct 2024 04:38:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728841088;
	cv=none; b=GZOzWJgClpE8qoKYi5ts2UFOhkSmjZjMR7m8mMSPyCk+7L8PZlmuMggSQzj3YckakW226ZCfgm08qQiJnPGavmK63nQbB3wHJ0Fip5AF4CRlJJqjl4L5sCf580wtK+sccoMP0OyAGw83+JIlpKWxIMmxsRlMPxd1ViGHy45mN4N2mxkZsi361/YV69yuni1ZKYPmEnwhOsblLIFQE297n1F76kUE5r1LB/5sJ0Y+tPvu19pAoMfQHkv+YSfkxoX3OM1ooZPrIBLfm1Ex7KDYI5h5V1WauiLBtlfwd294wEmX94GHQI/MlDMP4EGcmAN/oxkNhJxEes6unZzeXwl/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728841088; c=relaxed/relaxed;
	bh=rTgipmFu3TZdXAFpN2sCqfvMrpztU8Ehx1A5qw47iuA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=jfmgLjIjhcUBPwIjBPAndhh18aSpODLUynj3+KxzFAX/Rd33wTCBHzkZXJjy8Rwq8V547C1GVX2l9t8ED+s2cY5DKWUaL8CIdzKzCpm88UPdijbWp6riEpM6iBqp+teCVqXSviskxJ3S49enJFiflSw+eWFSKbBHK57Nbi2ZfUdcgcS9a7k+iw+Mz9UYAPYPJ4xWtbCQmLj6y+SV/VXv/KnhTdVkAKxq1FE/977oymtOHMmfVvYNdLXHk++SL/TfIhpojMI+i3D8lu4EKuYnTkeouaI9/HU/rrKtMstiRC79LQevTwQhjKUtzjEdIWX8RjmqiWOQG2r/x3/24RK2AQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h5wB9/6I; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h5wB9/6I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRSHy4v3Zz2xjh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 04:38:06 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DHHYgn021609;
	Sun, 13 Oct 2024 17:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=pp1; bh=rTgipmFu3TZdXAFpN2sCqfvMrp
	ztU8Ehx1A5qw47iuA=; b=h5wB9/6Ivh6wUwpDU2v4r94o9qpeHHRwDyvrr0J9r/
	87H37KUQg8PcFeK325nCyxAkS4qN3abqZfCqWLmhvBD35drekw1mL38MYXHrz3x/
	no1lUcgmQnPiFxjP3CJrCjm0/iXyGeg5/ucVTOINA2F4xauGdzmP+jkF9ATK3tw5
	fV8wnuNWL4z1yuxtRB1XJlAxNj92zoLb+mBduiPMwUN3zoG6edRjQM4d26cpGodW
	Oo+4NjZKbG/NS07mBfqOTykXZ/UwMk06TbK+4K12/nRT49wpLrnW96zLT3FcXsJV
	k1UZw3cmZau9TtCCBz2c+g2UnczoOEY2ONAQ6Qd6JTrg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 428jfcg279-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 13 Oct 2024 17:37:57 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49DHbvGU028041;
	Sun, 13 Oct 2024 17:37:57 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 428jfcg278-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 13 Oct 2024 17:37:57 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49DGFFiS027499;
	Sun, 13 Oct 2024 17:37:56 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4283txavvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 13 Oct 2024 17:37:56 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49DHbqIS56951206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 13 Oct 2024 17:37:52 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B56AD20049;
	Sun, 13 Oct 2024 17:37:52 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 67A0120040;
	Sun, 13 Oct 2024 17:37:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.240.55])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 13 Oct 2024 17:37:46 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        akanksha@linux.ibm.com, maddy@linux.ibm.com,
        atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Subject: [PATCH] tools/perf/tests: Fix compilation error with strncpy in tests/tool_pmu
Date: Sun, 13 Oct 2024 23:07:42 +0530
Message-Id: <20241013173742.71882-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YCqQkdpLnZFftOOybjLwWDxi3gTAhA9A
X-Proofpoint-ORIG-GUID: 1_aLzai0-Te3wfhgSoaFkCcEP93f9-nj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-13_11,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410130130
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

perf fails to compile on systems with GCC version11
as below:

In file included from /usr/include/string.h:519,
                 from /home/athir/perf-tools-next/tools/include/linux/bitmap.h:5,
                 from /home/athir/perf-tools-next/tools/perf/util/pmu.h:5,
                 from /home/athir/perf-tools-next/tools/perf/util/evsel.h:14,
                 from /home/athir/perf-tools-next/tools/perf/util/evlist.h:14,
                 from tests/tool_pmu.c:3:
In function ‘strncpy’,
    inlined from ‘do_test’ at tests/tool_pmu.c:25:3:
/usr/include/bits/string_fortified.h:95:10: error: ‘__builtin_strncpy’ specified bound 128 equals destination size [-Werror=stringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   96 |                                   __glibc_objsize (__dest));
      |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~

The compile error is from strncpy refernce in do_test:
	strncpy(str, tool_pmu__event_to_str(ev), sizeof(str));

This behaviour is not observed with GCC version 8, but observed
with GCC version 11 . This is message from gcc for detecting
truncation while using strncpu. Use snprintf instead of strncpy
here to be safe.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/tool_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/tests/tool_pmu.c b/tools/perf/tests/tool_pmu.c
index 94d0dd8fd3cb..297cc8c55579 100644
--- a/tools/perf/tests/tool_pmu.c
+++ b/tools/perf/tests/tool_pmu.c
@@ -22,7 +22,7 @@ static int do_test(enum tool_pmu_event ev, bool with_pmu)
 	if (with_pmu)
 		snprintf(str, sizeof(str), "tool/%s/", tool_pmu__event_to_str(ev));
 	else
-		strncpy(str, tool_pmu__event_to_str(ev), sizeof(str));
+		snprintf(str, sizeof(str), "%s", tool_pmu__event_to_str(ev));
 
 	parse_events_error__init(&err);
 	ret = parse_events(evlist, str, &err);
-- 
2.43.5


