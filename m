Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0CE74C700
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 20:30:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JRqd7zrm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QzbKB07kwz3c1h
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 04:30:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JRqd7zrm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QzbHG3fzwz30dw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 04:28:26 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 369IRw8j021930;
	Sun, 9 Jul 2023 18:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Eeso8zXQxUlmS2hjhTwKui190YsNrM2yFDBuV93nWV8=;
 b=JRqd7zrmqzaPPnEwJhjRfDj8Ozg42vwGblPVGi4d61tEFnnreQtllqeRepL+I1iCH4VU
 jaP7/HqLAaI8Zq1Qn3N1KOfLRQvijleC8y7c4QijO/v0zw4HSqjIkcyi+qeVsaFfccpc
 eW7lLM8sF8inPUssGTrk+bTH/DlVPFmls9EAJI2wx+h5doppJL1Fgk8VELSx7fhnPgrp
 P/bRg6bo+GQ2/xqyOIzRQCNEGFzfJQBmPw43X2UMTI1fu9RUtc+DST/oltjbOOD/X81a
 wo58JKO9PBiRL+AhvnGW3+mCq6b/WVbvarY/pMXVvXJTJzZ/ovmBDcaggGy9yhzQvRTK IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rr26rr03y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:16 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 369ISFHD023308;
	Sun, 9 Jul 2023 18:28:15 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rr26rr03j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:15 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 369ClHfR005633;
	Sun, 9 Jul 2023 18:28:13 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3rpye50mpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:12 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 369IS9rb1638986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Jul 2023 18:28:09 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75E082004B;
	Sun,  9 Jul 2023 18:28:09 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2987120043;
	Sun,  9 Jul 2023 18:28:07 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.24.202])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  9 Jul 2023 18:28:06 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH V2 01/26] tools/perf/tests: Fix shellcheck warnings for trace+probe_vfs_getname.sh
Date: Sun,  9 Jul 2023 23:57:35 +0530
Message-Id: <20230709182800.53002-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
References: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OW8jqQO0c2l69jex_3lwNYUXmcaLgpt7
X-Proofpoint-ORIG-GUID: pSm_rSi5Upm69xrR3UUdc0UZDYN4OFJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-09_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 mlxlogscore=974
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2307090169
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, Akanksha J N <akanksha@linux.ibm.com>, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Akanksha J N <akanksha@linux.ibm.com>

Running shellcheck -S on probe_vfs_getname.sh, throws below warnings:

Before fix:

$ shellcheck -S warning trace+probe_vfs_getname.sh

	In trace+probe_vfs_getname.sh line 13:
	. $(dirname $0)/lib/probe.sh
	  ^-----------^ SC2046 (warning): Quote this to prevent word splitting.

	In trace+probe_vfs_getname.sh line 18:
	. $(dirname $0)/lib/probe_vfs_getname.sh
	  ^-----------^ SC2046 (warning): Quote this to prevent word splitting.

	In trace+probe_vfs_getname.sh line 21:
		evts=$(echo $(perf list syscalls:sys_enter_open* 2>/dev/null | grep -E 'open(at)? ' | sed -r 's/.*sys_enter_([a-z]+) +\[.*$/\1/') | sed 's/ /,/')
		            ^-- SC2046 (warning): Quote this to prevent word splitting.

Fix the shellcheck warnings by adding quotes to prevent word splitting.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Signed-off-by: Akanksha J N <akanksha@linux.ibm.com>
---
 tools/perf/tests/shell/trace+probe_vfs_getname.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/tests/shell/trace+probe_vfs_getname.sh b/tools/perf/tests/shell/trace+probe_vfs_getname.sh
index 0a4bac3dd77e..db2ff141f703 100755
--- a/tools/perf/tests/shell/trace+probe_vfs_getname.sh
+++ b/tools/perf/tests/shell/trace+probe_vfs_getname.sh
@@ -10,15 +10,15 @@
 # SPDX-License-Identifier: GPL-2.0
 # Arnaldo Carvalho de Melo <acme@kernel.org>, 2017
 
-. $(dirname $0)/lib/probe.sh
+. "$(dirname $0)"/lib/probe.sh
 
 skip_if_no_perf_probe || exit 2
 skip_if_no_perf_trace || exit 2
 
-. $(dirname $0)/lib/probe_vfs_getname.sh
+. "$(dirname $0)"/lib/probe_vfs_getname.sh
 
 trace_open_vfs_getname() {
-	evts=$(echo $(perf list syscalls:sys_enter_open* 2>/dev/null | grep -E 'open(at)? ' | sed -r 's/.*sys_enter_([a-z]+) +\[.*$/\1/') | sed 's/ /,/')
+	evts="$(echo "$(perf list syscalls:sys_enter_open* 2>/dev/null | grep -E 'open(at)? ' | sed -r 's/.*sys_enter_([a-z]+) +\[.*$/\1/')" | sed ':a;N;s:\n:,:g')"
 	perf trace -e $evts touch $file 2>&1 | \
 	grep -E " +[0-9]+\.[0-9]+ +\( +[0-9]+\.[0-9]+ ms\): +touch\/[0-9]+ open(at)?\((dfd: +CWD, +)?filename: +${file}, +flags: CREAT\|NOCTTY\|NONBLOCK\|WRONLY, +mode: +IRUGO\|IWUGO\) += +[0-9]+$"
 }
-- 
2.39.1

