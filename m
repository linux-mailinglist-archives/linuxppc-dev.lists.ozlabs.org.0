Return-Path: <linuxppc-dev+bounces-5300-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7CEA12863
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 17:14:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YY9zv3p2Jz300g;
	Thu, 16 Jan 2025 03:14:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736957659;
	cv=none; b=lJOpOx4uC2bcNtyKswcWhR0l0fA5qBKPsuI60hH4I2PrgbRbOaYOX/nyjYiOIjh+MoVSz5KM9z3honxyVAKcrx854SHr1U7atIjssdf5mfmc6xbNW/9mEzjSHitFj/aBMGEBi4rH4Vntlu2wpkOd0DoyxZSlZ9otIZWEB2jsHjqC5RkCiR5ASilnpqoL2jk5eZ0skv+hpm2lppSZ1zuT2x6zw0S0TFgMZM+iGs0tsqOtRVB0v2bDmFra6ThH2t6J8d9EG/BZo9jEq/3ZMeIf33tQ6sfcEURzU0pqck6GqjUZoI2RKgVg6aHBZfRZaTFafOmjMN4FNRO8g6yJr+IADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736957659; c=relaxed/relaxed;
	bh=X7te0kYzysEF/FrB0j8j4QYxO/da7KiKOFpaI2bWgWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HeYGEpHq8cqGtvqnt1EqFrAYmCltxvXHG2R+ZmMg9mVGLEoRAr9xFuqcB8VbcnbPsykcJ9z8qEFIV7ppNhXo9dwbDpX4arP3SxKgEkYLeRrLWl9pmBw1NZJhrXfu+Tc6vF5Dn13R7eXvm9miISI+jyvDvFsFGIXEnkaiK8Y9bhyklpjFgbc/G9PEgNXM6AWY/lTrnVkwSy0jlyzwH/P6UOODlN0CGVlTuwWN8whEyRJ2Ud4Xsk7trI/zDIWKqDHNdsTy/+5YvFKdgvuRMHzA+q4xQNC2IdZ9QHe5hTGjc+ph3MUC/tpk2xbAqRK6AzThBAA1MWPlkKvyqtO5MZFbyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CPEFAjLH; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=disgoel@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CPEFAjLH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=disgoel@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YY9zt2M5Rz3005
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 03:14:17 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F85fcI017543
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 16:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=X7te0k
	YzysEF/FrB0j8j4QYxO/da7KiKOFpaI2bWgWo=; b=CPEFAjLH4zXudDAL8QA5mn
	YT2Nd/KO9bjZ5DqlgVEk+vCv6WXs4KPYE3p3d9VtJmUxKi0O+qRU4derF6ItvoGU
	dcvRs7HSV0SI5b6OI3sUiRT9HWoBCvFhLh/Yg0JW8oliZwiwnE2sUdmiYP7X5/jg
	JUaGXioR0nasYXBKxdx6vF2xFtJ3QN9q4UfYoEY6P2Wiy28OzopWTB/wyLhwUq0t
	RyFL02IgW8Q57czAbU3dMsfKAzCNbXW6qkYqq11ZoW+5BhsbVj10ppP907N38Exh
	StBCkRCpyqdKbDk6VD5W7lx925EYCO1ZwMualmVHczmDoR07DLwQuSgE33tk1/Bw
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 446973290f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 16:14:13 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50FDuRpx004571
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 16:14:12 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4442yssdea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 16:14:12 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50FGE9nb56426990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2025 16:14:09 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 025212004D;
	Wed, 15 Jan 2025 16:14:09 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 33B5B20040;
	Wed, 15 Jan 2025 16:14:06 +0000 (GMT)
Received: from [9.61.248.69] (unknown [9.61.248.69])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Jan 2025 16:14:05 +0000 (GMT)
Message-ID: <98cca4da-22dc-4f8a-8fad-e71b50a7b916@linux.ibm.com>
Date: Wed, 15 Jan 2025 21:44:04 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/5] tools/testing/selftests/powerpc: Add check for
 power11 pvr for pmu selfests
Content-Language: en-GB
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, hbathini@linux.ibm.com
Cc: kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com
References: <20250113075858.45137-1-atrajeev@linux.vnet.ibm.com>
 <20250113075858.45137-2-atrajeev@linux.vnet.ibm.com>
From: Disha Goel <disgoel@linux.ibm.com>
In-Reply-To: <20250113075858.45137-2-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: q6gZwcU8WdECgbV3ldd6k9WWVhULcw2X
X-Proofpoint-GUID: q6gZwcU8WdECgbV3ldd6k9WWVhULcw2X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_07,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150119
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 13/01/25 1:28 pm, Athira Rajeev wrote:

Some of the tests depends on pvr value to choose
the event. Example:
- event_alternatives_tests_p10: alternative event depends
   on registered PMU driver which is based on pvr
- generic_events_valid_test varies based on platform
- bhrb_filter_map_test: again its dependent on pmu to
   decide which bhrb filter to use
- reserved_bits_mmcra_sample_elig_mode: randome sampling
   mode reserved bits is also varies based on platform

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

I have tested the patches on PowerPC by compiling and running pmu selftest.

For the series:
Tested-by: Disha Goel<disgoel@linux.ibm.com>

---
Changelog:
  v1 -> v2
  No code changes. Rebased to latest upstream

  .../pmu/event_code_tests/event_alternatives_tests_p10.c    | 3 ++-
  .../pmu/event_code_tests/generic_events_valid_test.c       | 3 ++-
  .../reserved_bits_mmcra_sample_elig_mode_test.c            | 3 ++-
  .../powerpc/pmu/sampling_tests/bhrb_filter_map_test.c      | 7 +++++--
  4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p10.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p10.c
index 8be7aada6523..355f8bbe06c3 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p10.c
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p10.c
@@ -26,6 +26,7 @@ static int event_alternatives_tests_p10(void)
  {
  	struct event *e, events[5];
  	int i;
+	int pvr = PVR_VER(mfspr(SPRN_PVR));

  	/* Check for platform support for the test */
  	SKIP_IF(platform_check_for_tests());
@@ -36,7 +37,7 @@ static int event_alternatives_tests_p10(void)
  	 * code and using PVR will work correctly for all cases
  	 * including generic compat mode.
  	 */
-	SKIP_IF(PVR_VER(mfspr(SPRN_PVR)) != POWER10);
+	SKIP_IF((pvr != POWER10) && (pvr != POWER11));

  	SKIP_IF(check_for_generic_compat_pmu());

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/generic_events_valid_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/generic_events_valid_test.c
index 0d237c15d3f2..a378fa9a5a7b 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/generic_events_valid_test.c
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/generic_events_valid_test.c
@@ -17,6 +17,7 @@
  static int generic_events_valid_test(void)
  {
  	struct event event;
+	int pvr = mfspr(SPRN_PVR);

  	/* Check for platform support for the test */
  	SKIP_IF(platform_check_for_tests());
@@ -31,7 +32,7 @@ static int generic_events_valid_test(void)
  	 * - PERF_COUNT_HW_STALLED_CYCLES_BACKEND
  	 * - PERF_COUNT_HW_REF_CPU_CYCLES
  	 */
-	if (PVR_VER(mfspr(SPRN_PVR)) == POWER10) {
+	if ((pvr == POWER10) || (pvr == POWER11)) {
  		event_init_opts(&event, PERF_COUNT_HW_CPU_CYCLES, PERF_TYPE_HARDWARE, "event");
  		FAIL_IF(event_open(&event));
  		event_close(&event);
diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_sample_elig_mode_test.c b/tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_sample_elig_mode_test.c
index 4c119c821b99..7bb26a232fbe 100644
--- a/tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_sample_elig_mode_test.c
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_sample_elig_mode_test.c
@@ -21,6 +21,7 @@
  static int reserved_bits_mmcra_sample_elig_mode(void)
  {
  	struct event event;
+	int pvr = PVR_VER(mfspr(SPRN_PVR));

  	/* Check for platform support for the test */
  	SKIP_IF(platform_check_for_tests());
@@ -59,7 +60,7 @@ static int reserved_bits_mmcra_sample_elig_mode(void)
  	 * is reserved in power10 and 0xC is reserved in
  	 * power9.
  	 */
-	if (PVR_VER(mfspr(SPRN_PVR)) == POWER10) {
+	if ((pvr == POWER10) || (pvr == POWER11)) {
  		event_init(&event, 0x100401e0);
  		FAIL_IF(!event_open(&event));
  	} else if (PVR_VER(mfspr(SPRN_PVR)) == POWER9) {
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
index 3f43c315c666..64ab9784f9b1 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
@@ -83,13 +83,16 @@ static int bhrb_filter_map_test(void)
  	 * using PVR will work correctly for all cases including generic
  	 * compat mode.
  	 */
-	if (PVR_VER(mfspr(SPRN_PVR)) == POWER10) {
+	switch (PVR_VER(mfspr(SPRN_PVR))) {
+	case POWER11:
+	case POWER10:
  		for (i = 0; i < ARRAY_SIZE(bhrb_filter_map_valid_p10); i++) {
  			event.attr.branch_sample_type = bhrb_filter_map_valid_p10[i];
  			FAIL_IF(event_open(&event));
  			event_close(&event);
  		}
-	} else {
+		break;
+	default:
  		for (i = 0; i < ARRAY_SIZE(bhrb_filter_map_valid_p10); i++) {
  			event.attr.branch_sample_type = bhrb_filter_map_valid_p10[i];
  			FAIL_IF(!event_open(&event));


