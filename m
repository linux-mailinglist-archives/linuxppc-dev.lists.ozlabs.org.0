Return-Path: <linuxppc-dev+bounces-6135-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E41EA32EF9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 19:55:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtSDX2L7zz3045;
	Thu, 13 Feb 2025 05:55:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739386508;
	cv=none; b=Amkt4z2oZv3nlMCey9BkpNKmOj1VARJ+wqLBG4jSINqWk85fldvr+6ocOG/9yCIXW3n+H44+nWlJp/HLKqm/0z2wg6zEHPl8y6+cmhWOG3PBDVjunG9jbkBZQGXNQ1hf0iE75ZOIFp/auqWaQbq2IFqD+YITibWoTSPc1rvMegtqDqrH0WQRHye63aum6kn01Udz9UtD+DOhOrsjkVhWl1OF+Cf/47XkA/Jy/jHDNhCb1gcwdo+83a3HFYgW/O+6ROfBFs39iYoiNBFBBLnpvsiNLDnIEXg0y6xU5kPzGJfv4TKsMQnYrvDycUrmrpPprBqY7qMLxGjTmrpy4I0PlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739386508; c=relaxed/relaxed;
	bh=hNaASAwSyMz0cHnAmOfiK5nkgAILPIlea5cj1Lx13Hg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n0DleuaHAQvP2KuJ4VaKRjPvrrobwqPyGAmMrJMrSr3dfmLmQF18rhcQwR8g4FdzpqSQXxfOXUholgQCE7cNoH73109eW6VBRGd4+nWbAFKdVjJg2+SvLlFwRV0Lxh40uj9Z3Ez7OqwvqC4yBFTv6khnTTk6FLorrhTj+XT29ukk93UAlktbj64C0wBfM42un3MbOjN5AeNanUqN5W3zJiJPW0BbuPO3LUuWHu15ChjW2zk2zjxke4o5qTCaGgcI0BKTb1S1P/WtLFt4ouThLpYxMTm/MaLnalclgZM9dRDNXB732qGe7xhXU+jSt43J74BAAEN7HkWmihAJW3ydyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dSfP+bxc; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dSfP+bxc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtSDW2C95z2ypD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 05:55:06 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CEMDgP013592;
	Wed, 12 Feb 2025 18:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=hNaASAwSyMz0cHnAmOfiK5nkgAILPIlea5cj1Lx13
	Hg=; b=dSfP+bxcj9wck3KYOw1Yk1FMUUrLhZ+xZ8WeLoZ39GfXUYTsUZdaiwvt/
	/7cZTWzjn4ZRIR31eqlQjEwQHs08i7xpdDiNucvn95Pl1jZz6KwcfvcQlRLC6t+h
	W6dESTryqER6tfnWFR07jGKOftpouNNRmxncZw4RESAqbFPQ7bqypLAyyydbQ14g
	3QX47tPog6fotohrxtXcgDUSUIVG4MUiFjr9HOy2RMQhPM+JR9lSl5Sr6geB2Osp
	mCpUf5Mwv3Fhoaa+gIPZZQAKp7e78gToBW5cQtzaOuARe8iOFXfX0QsS/F5TYZrq
	TM1LHBnZUP4vyKpFjY4J0X9Jgdvog==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44rfpa5fd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 18:54:55 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51CIqHm5023406;
	Wed, 12 Feb 2025 18:54:54 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44rfpa5fcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 18:54:54 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51CIct3g028217;
	Wed, 12 Feb 2025 18:54:53 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44phyyjgmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 18:54:53 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51CIsnui32637450
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Feb 2025 18:54:49 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72DE420043;
	Wed, 12 Feb 2025 18:54:49 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F23120040;
	Wed, 12 Feb 2025 18:54:43 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.242.147])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Feb 2025 18:54:42 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com
Subject: [PATCH] tools/perf: Add check to tool pmu tests to ensure if the event is valid
Date: Thu, 13 Feb 2025 00:24:38 +0530
Message-Id: <20250212185438.15251-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: laO6AjK1xfUch_gsKFzKR8x3u91gWI5W
X-Proofpoint-ORIG-GUID: p5ML_pkDheJMdUFJNed9q1JBWNEyZGZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502120134
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

"Tool PMU" tests fails on powerpc as below:

   12.1: Parsing without PMU name:
   --- start ---
   test child forked, pid 48492
   Using CPUID 0x00800200
   Attempt to add: tool/duration_time/
   ..after resolving event: tool/config=0x1/
   duration_time -> tool/duration_time/
   Attempt to add: tool/user_time/
   ..after resolving event: tool/config=0x2/
   user_time -> tool/user_time/
   Attempt to add: tool/system_time/
   ..after resolving event: tool/config=0x3/
   system_time -> tool/system_time/
   Attempt to add: tool/has_pmem/
   ..after resolving event: tool/config=0x4/
   has_pmem -> tool/has_pmem/
   Attempt to add: tool/num_cores/
   ..after resolving event: tool/config=0x5/
   num_cores -> tool/num_cores/
   Attempt to add: tool/num_cpus/
   ..after resolving event: tool/config=0x6/
   num_cpus -> tool/num_cpus/
   Attempt to add: tool/num_cpus_online/
   ..after resolving event: tool/config=0x7/
   num_cpus_online -> tool/num_cpus_online/
   Attempt to add: tool/num_dies/
   ..after resolving event: tool/config=0x8/
   num_dies -> tool/num_dies/
   Attempt to add: tool/num_packages/
   ..after resolving event: tool/config=0x9/
   num_packages -> tool/num_packages/

   ---- unexpected signal (11) ----
   12.1: Parsing without PMU name                                      : FAILED!

Same fail is observed for "Parsing with PMU name" as well.

The testcase loops through events in tool_pmu__for_each_event()
and access event name using "tool_pmu__event_to_str()".
Here tool_pmu__event_to_str returns null for "slots" event
and "system_tsc_freq" event. These two events are only applicable
for arm64 and x86 respectively. So the function tool_pmu__event_to_str()
skips for unsupported events and returns null. This null value is
causing testcase fail.

To address this in "Tool PMU" testcase, add a helper function
tool_pmu__all_event_to_str() which returns the name for all
events mapping to the tool_pmu_event index including the
skipped ones. So that even if its a skipped event, the
helper function helps to resolve the tool_pmu_event index to
its mapping event name. Update the testcase to check for null event
names before proceeding the test.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/tool_pmu.c | 12 ++++++++++++
 tools/perf/util/tool_pmu.c  | 17 +++++++++++++++++
 tools/perf/util/tool_pmu.h  |  1 +
 3 files changed, 30 insertions(+)

diff --git a/tools/perf/tests/tool_pmu.c b/tools/perf/tests/tool_pmu.c
index 187942b749b7..e468e5fb3c73 100644
--- a/tools/perf/tests/tool_pmu.c
+++ b/tools/perf/tests/tool_pmu.c
@@ -19,6 +19,18 @@ static int do_test(enum tool_pmu_event ev, bool with_pmu)
 		return TEST_FAIL;
 	}
 
+	/*
+	 * if tool_pmu__event_to_str returns NULL, Check if the event is
+	 * valid for the platform.
+	 * Example:
+	 * slots event is only on arm64.
+	 * system_tsc_freq event is only on x86.
+	 */
+	if (!tool_pmu__event_to_str(ev) && tool_pmu__skip_event(tool_pmu__all_event_to_str(ev))) {
+		ret = TEST_OK;
+		goto out;
+	}
+
 	if (with_pmu)
 		snprintf(str, sizeof(str), "tool/%s/", tool_pmu__event_to_str(ev));
 	else
diff --git a/tools/perf/util/tool_pmu.c b/tools/perf/util/tool_pmu.c
index 3a68debe7143..572422797f6e 100644
--- a/tools/perf/util/tool_pmu.c
+++ b/tools/perf/util/tool_pmu.c
@@ -60,6 +60,15 @@ int tool_pmu__num_skip_events(void)
 	return num;
 }
 
+/*
+ * tool_pmu__event_to_str returns only supported event names.
+ * For events which are supposed to be skipped in the platform,
+ * return NULL
+ *
+ * tool_pmu__all_event_to_str returns the name for all
+ * events mapping to the tool_pmu_event index including the
+ * skipped ones.
+ */
 const char *tool_pmu__event_to_str(enum tool_pmu_event ev)
 {
 	if ((ev > TOOL_PMU__EVENT_NONE && ev < TOOL_PMU__EVENT_MAX) &&
@@ -69,6 +78,14 @@ const char *tool_pmu__event_to_str(enum tool_pmu_event ev)
 	return NULL;
 }
 
+const char *tool_pmu__all_event_to_str(enum tool_pmu_event ev)
+{
+	if (ev > TOOL_PMU__EVENT_NONE && ev < TOOL_PMU__EVENT_MAX)
+		return tool_pmu__event_names[ev];
+
+	return NULL;
+}
+
 enum tool_pmu_event tool_pmu__str_to_event(const char *str)
 {
 	int i;
diff --git a/tools/perf/util/tool_pmu.h b/tools/perf/util/tool_pmu.h
index a60184859080..da76808ae71e 100644
--- a/tools/perf/util/tool_pmu.h
+++ b/tools/perf/util/tool_pmu.h
@@ -30,6 +30,7 @@ enum tool_pmu_event {
 	for ((ev) = TOOL_PMU__EVENT_DURATION_TIME; (ev) < TOOL_PMU__EVENT_MAX; ev++)
 
 const char *tool_pmu__event_to_str(enum tool_pmu_event ev);
+const char *tool_pmu__all_event_to_str(enum tool_pmu_event ev);
 enum tool_pmu_event tool_pmu__str_to_event(const char *str);
 bool tool_pmu__skip_event(const char *name);
 int tool_pmu__num_skip_events(void);
-- 
2.43.5


