Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A035D7B2ADD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 06:12:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XcK3Wm+7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxcPx3gjTz3cNv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 14:12:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XcK3Wm+7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxcP25rDCz3cCl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 14:11:50 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38T3o43w026372;
	Fri, 29 Sep 2023 04:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=M2f2NQKR6R4c9td5psaqQEO+kGrjwqhUC34sVvQoxjA=;
 b=XcK3Wm+7C8aJHIp1lb+AoXQeluMU02MwWau3yM/lllN5L8a9K5xO2KYCl47ZsQ2Ib2n/
 4b9zHjrYooKad58Q8HEO2qqjGiATp/HF2fZJedZ6Xs8MYIf0z4AxV161CIIOyWPqrtwd
 p3EGGPByJi/O+Bkg3zx1PJFScAr7fEsBKm1uVLMfjj13aie/mguy5v/zArHgWJqc+0aQ
 JGkfOH+fBCaQvF8Xu34F7wOuHr0qdh5gK07VAVhodhfpwe4L3asxUND/5C8ga9O1EWlJ
 DAD9RMPrmVqMpdj+UiahWJ4QqGASS7o32eTq0lECJ5ESM6KdgXCKDfNZGF1vM6CBQgLO Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tdq130ggt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Sep 2023 04:11:43 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38T3qpon032647;
	Fri, 29 Sep 2023 04:11:43 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tdq130ggg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Sep 2023 04:11:43 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38T48LFs011010;
	Fri, 29 Sep 2023 04:11:41 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tabum1t30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Sep 2023 04:11:41 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38T4BcrN27460208
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Sep 2023 04:11:38 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75F2820040;
	Fri, 29 Sep 2023 04:11:38 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69D1320043;
	Fri, 29 Sep 2023 04:11:36 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.86.96])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Sep 2023 04:11:36 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH 0/3] Fix for shellcheck issues with latest scripts in tests/shell
Date: Fri, 29 Sep 2023 09:41:30 +0530
Message-Id: <20230929041133.95355-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aYRU7Cg5iEc2xuyjV5SdntdTVISwMopf
X-Proofpoint-ORIG-GUID: wJ17ls0aQAKV0fftG4sMOXPvrynT1J5R
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-29_01,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=794 clxscore=1015 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309290034
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

shellcheck was run on perf tool shell scripts as a pre-requisite
to include a build option for shellcheck discussed here:
https://www.spinics.net/lists/linux-perf-users/msg25553.html

And fixes were added for the coding/formatting issues in
two patchsets:
https://lore.kernel.org/linux-perf-users/20230613164145.50488-1-atrajeev@linux.vnet.ibm.com/
https://lore.kernel.org/linux-perf-users/20230709182800.53002-1-atrajeev@linux.vnet.ibm.com/

Three additional issues were observed and fixes are part of:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/log/?h=perf-tools-next

With recent commits in perf, other three issues are observed.
shellcheck version: 0.6.0

With this patchset:

for F in $(find tests/shell/ -perm -o=x -name '*.sh'); do shellcheck -S warning $F; done
echo $?
0

The changes are with recent commits ( which is mentioned in each patch)
for ock_contention, record_sideband and test_arm_coresight testcases.
The changes are made on top of:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/log/?h=perf-tools-next

Athira Rajeev (3):
  perf tests test_arm_coresight: Fix the shellcheck warning in latest
    test_arm_coresight.sh
  tools/perf/tests Ignore the shellcheck SC2046 warning in
    lock_contentio
  tools/perf/tests: Fix shellcheck warning in record_sideband.sh test

 tools/perf/tests/shell/lock_contention.sh    | 1 +
 tools/perf/tests/shell/record_sideband.sh    | 2 +-
 tools/perf/tests/shell/test_arm_coresight.sh | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.31.1

