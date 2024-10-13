Return-Path: <linuxppc-dev+bounces-2170-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E16299BA7C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2024 19:08:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRRdB6p28z2yD8;
	Mon, 14 Oct 2024 04:07:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728839278;
	cv=none; b=nCCECAlpCeUL/fFhoIyblL3RQyYwsyfeoVhAQQU86/LJxyMK9kuFHYNeSJfBtVoi5zJ7QWGpPmdm7uJIF9PyWn99AzEGBJ6ghBUfkSZnk6mt896qmAzZDtWoYV8lOFy2bQy9k7lV7ZifXuP2Ii3xPz5xos77J/mq0ztMbgjjlSBG7XKL9yyRvwCSOT6WMQb/jQoK1aD9y681ia98PoeAGOOXZsDkTbO6ehqB3b1cjwkLQSY2vxwQSftMvn3f/nmuxav8QK8bS+qdVdypKcCXzDJp1uCSd5o/+Dbp+6/2aSr8cRRSzyuLyXUNMpdrE1heMo8iWQIgOEtFEklHnS3JRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728839278; c=relaxed/relaxed;
	bh=ngy8XL/JNV4hf5y1lhQ8pjYxcRWa9Xz27R3h2/CL6eg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EygSUCVc1psa7pyZWQ0jXfa0zIW6eAN+2TZ+3rFuEwzi+eTgZ7FFG2WQflW3XKl2rAntc6gt4VFBrKuoBYW1vBtGWgFBQ1pepGF3l5QudwEfpYOuxurbFo7cMSijiFat5N7BUsLZXphMzHS1+sNspynA8ykM347O+U0+VmBShnq8M7i87vsQLqeYsU/phlQmbb7SgAQhjavLtrPEiYsQ5RLhPe6TTqeBkO7ZHWDL8GldIZWjFc+vpfMGH6fcJTefN5HsQsWDs8gOVfJBPczUbI/QqjG8RsZG406ib/y0RA8NYvuwmytP4SCFOlgAROhvSCkVnapk4KEP4tCgwxuJzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mNMkh/CG; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mNMkh/CG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRRd94YF3z2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 04:07:56 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DGlRH3003636;
	Sun, 13 Oct 2024 17:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=ngy8XL/JNV4hf5y1lhQ8pjYxcR
	Wa9Xz27R3h2/CL6eg=; b=mNMkh/CGhCiW/kqL69PG0LjENK7E+Fw5NGAYbxsiuG
	wnTmnP+6slrfsze5Fu2rzu0KHAcgfceLz70qEiQOKIkMVACXRFcyXqIRP3UIiRI5
	sp97S9boz4215YmjdelYmL4ax1OMHYHdXN6xDHCM9GTAeHM8ycUjU066cYoDc3Dt
	IkiFlw2n4HKeMD4mvaPJtZ8OMZ9l2c46v4E/TPs4rCiSBIbWqjSYpp8CiAfLW6Ma
	NE+ISv2BsC+kjLtAoitaHs1i/Wmcvk/kx86eq+B4fCM7HHycCJ2soUnylZ48FySV
	BhMJPan9hUzwWFBAOlDwW9nIEYvY+g52qbGRTJNEdLEg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 428j1902m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 13 Oct 2024 17:07:50 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49DH7oco010734;
	Sun, 13 Oct 2024 17:07:50 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 428j1902ky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 13 Oct 2024 17:07:49 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49DGuPkC002408;
	Sun, 13 Oct 2024 17:07:48 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4284eman9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 13 Oct 2024 17:07:48 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49DH7ib020644154
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 13 Oct 2024 17:07:44 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C975820049;
	Sun, 13 Oct 2024 17:07:44 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4FB9920040;
	Sun, 13 Oct 2024 17:07:38 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.240.55])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 13 Oct 2024 17:07:37 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, akanksha@linux.ibm.com,
        maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Subject: [PATCH] tools/perf/tests: Remove duplicate evlist__delete in tests/tool_pmu.c
Date: Sun, 13 Oct 2024 22:37:32 +0530
Message-Id: <20241013170732.71339-1-atrajeev@linux.vnet.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uoE5nT1M2F5G0dI-f6_3LW0Cus7n1Cp7
X-Proofpoint-ORIG-GUID: 02IMF8vepvk3d6nVBK1P5Gkv4uL165l5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-13_11,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410130125
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The testcase for tool_pmu failed in powerpc as below:

 ./perf test -v "Parsing without PMU name"
  8: Tool PMU                                                        :
  8.1: Parsing without PMU name                                      : FAILED!

This happens when parse_events results in either skip or fail
of an event. Because the code invokes evlist__delete(evlist)
and "goto out".

	ret = parse_events(evlist, str, &err);
	if (ret) {
		 evlist__delete(evlist);

But in the "out" section also evlist__delete happens.

	out:
        evlist__delete(evlist);
        return ret;

Hence remove the duplicate evlist__delete from the first path
in the testcase

With the change:
	# ./perf test -v "Parsing without PMU name"
	  8: Tool PMU                                                        :
	  8.1: Parsing without PMU name                                      : Ok

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/tool_pmu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/perf/tests/tool_pmu.c b/tools/perf/tests/tool_pmu.c
index 94d0dd8fd3cb..618223654992 100644
--- a/tools/perf/tests/tool_pmu.c
+++ b/tools/perf/tests/tool_pmu.c
@@ -27,7 +27,6 @@ static int do_test(enum tool_pmu_event ev, bool with_pmu)
 	parse_events_error__init(&err);
 	ret = parse_events(evlist, str, &err);
 	if (ret) {
-		evlist__delete(evlist);
 		if (tool_pmu__skip_event(tool_pmu__event_to_str(ev))) {
 			ret = TEST_OK;
 			goto out;
-- 
2.27.0


