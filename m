Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A58874C752
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 20:42:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oRymYmcq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qzbb83Lhkz3dD5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 04:42:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oRymYmcq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QzbHq2BJCz3c13
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 04:28:55 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 369IHIUh018310;
	Sun, 9 Jul 2023 18:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4KtABcidoeJgovJ+R9vXl/P1iwrKaHWzKauvRWQYRHs=;
 b=oRymYmcqBCkiD7xCJGdNDr24YqA+joQsT3SsZ1n2s/PddIdlEqPbGsaj7wy+AAcX41WI
 rmfREjC14ftArAq0kR6rVrUKnGX2TaxFaRvjEFZwGpp1V4xU/9irlZTisytLIBKURGd4
 6u4+Y9f/5i97ipXJDCPNv6Ums3ZtjpAMH1JYefkbB1sCO6NX1tM9SneAtgo+1CO1DsgV
 tRkMf1QRIcqzRRgYEv7hXwFYgVdTfQrLTH6ZsMnZfiyQC/ParWeM6cmhHxLefelpwKrN
 NS9zwXrea8GIYW0J8+tRSIpYSlKl1ZcY6CbDIlysu7v1uD5LVjYxawuHPGohAdddYkC+ /w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rr21n03rn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:51 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 369ISpOu011145;
	Sun, 9 Jul 2023 18:28:51 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rr21n03re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:51 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 369AI3I2024381;
	Sun, 9 Jul 2023 18:28:48 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3rpye58uy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:48 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 369ISjRK54985140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Jul 2023 18:28:45 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 567A82004B;
	Sun,  9 Jul 2023 18:28:45 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2811B20040;
	Sun,  9 Jul 2023 18:28:43 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.24.202])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  9 Jul 2023 18:28:42 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH V2 15/26] tools/perf: Fix shellcheck issue for check-headers.sh script
Date: Sun,  9 Jul 2023 23:57:49 +0530
Message-Id: <20230709182800.53002-16-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
References: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nQR1f61UugGDlAXQpz9uQ_ewT9jkJGtD
X-Proofpoint-ORIG-GUID: CAOwxiLOGaStrTMKp5SNOP6sfW2nZ7ki
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-09_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 mlxscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307090169
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

From: Kajol Jain <kjain@linux.ibm.com>

Running shellcheck on check-headers.sh generates below warning:

In check-headers.sh line 126:
  check_2 "tools/$file" "$file" $*
                                ^-- SC2048 (warning): Use "$@" (with quotes) to prevent whitespace problems.

In check-headers.sh line 134:
  check_2 "tools/perf/trace/beauty/$file" "$file" $*
                                                  ^-- SC2048 (warning): Use "$@" (with quotes) to prevent whitespace problems.

In check-headers.sh line 186:
cd tools/perf
^-----------^ SC2164 (warning): Use 'cd ... || exit' or 'cd ... || return' in case cd fails.

Fixed the warnings by:
- Using "$@" instead of $*
- Adding exit condition with cd command

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 tools/perf/check-headers.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
index a0f1d8adce60..4314c9197850 100755
--- a/tools/perf/check-headers.sh
+++ b/tools/perf/check-headers.sh
@@ -123,7 +123,7 @@ check () {
 
   shift
 
-  check_2 "tools/$file" "$file" $*
+  check_2 "tools/$file" "$file" "$@"
 }
 
 beauty_check () {
@@ -131,7 +131,7 @@ beauty_check () {
 
   shift
 
-  check_2 "tools/perf/trace/beauty/$file" "$file" $*
+  check_2 "tools/perf/trace/beauty/$file" "$file" "$@"
 }
 
 # Check if we have the kernel headers (tools/perf/../../include), else
@@ -183,7 +183,7 @@ done
 check_2 tools/perf/util/hashmap.h tools/lib/bpf/hashmap.h
 check_2 tools/perf/util/hashmap.c tools/lib/bpf/hashmap.c
 
-cd tools/perf
+cd tools/perf || exit
 
 if [ ${#FAILURES[@]} -gt 0 ]
 then
-- 
2.39.1

