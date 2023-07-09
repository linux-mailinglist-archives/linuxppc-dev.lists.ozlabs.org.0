Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A855D74C6FF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 20:29:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rsyyiOph;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QzbJB3tW2z3c4D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 04:29:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rsyyiOph;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QzbHG3bg4z30Pn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 04:28:26 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 369IHVhm028168;
	Sun, 9 Jul 2023 18:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=13KG55BGj3ZjCFxK/Pmae1TV1C/sdk1d+lFMZ/NlVhg=;
 b=rsyyiOphnNwJ27Y67eSs0e9SJ3tsLpq7FctDTsFT/msIgePQBdn45rCYhX9UZ6flFgxN
 m5gaMIzsdr//aUX1OHnSP2qXIVxA/h6OhuSiIFvet78rRdENBZfRvxCEVwdu5dHMfVnN
 OnnulO3HMO1UZEWFzwEv8yxjQvC2jpXO5Sx1Hxi9zwpQSAqJKDTDaljRfWkbFzB7GGoq
 XhXMiVdMtcc1DmayE18SJPE0QQ/zyGvABciObhoUM2MCyGC31tKjheKKYV2kFR/pdUv3
 CN1BldMgO4OQCp0EcSbLROixcTUz0Qf58EDg16keqO2IUxXHuYgQtFz6hxfeNMzkmoby fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rr21jr3p7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:20 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 369ISJon018684;
	Sun, 9 Jul 2023 18:28:19 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rr21jr3ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:19 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3699SNK5016786;
	Sun, 9 Jul 2023 18:28:18 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3rpye58v46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:17 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 369ISEml39518560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Jul 2023 18:28:14 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D8A22004F;
	Sun,  9 Jul 2023 18:28:14 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7476120040;
	Sun,  9 Jul 2023 18:28:12 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.24.202])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  9 Jul 2023 18:28:12 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH V2 03/26] tools/perf/tests: Fix shellcheck warning for record_offcpu.sh testcase
Date: Sun,  9 Jul 2023 23:57:37 +0530
Message-Id: <20230709182800.53002-4-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
References: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4WE0yH3-KvAicFvYx3OZ887dVwQ8JDtn
X-Proofpoint-GUID: fm6IVlXbZCQqMawBXw_I-3JM3eS3_Y-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-09_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 spamscore=0 mlxlogscore=857 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Running shellcheck on record_offcpu.sh throws below warning:

In tests/shell/record_offcpu.sh line 13:
  trap - exit term int
         ^--^ SC3049 (warning): In POSIX sh, using lower/mixed case for signal names is undefined.
              ^--^ SC3049 (warning): In POSIX sh, using lower/mixed case for signal names is undefined.
                   ^-^ SC3049 (warning): In POSIX sh, using lower/mixed case for signal names is undefined.

In tests/shell/record_offcpu.sh line 20:
trap trap_cleanup exit term int
                  ^--^ SC3049 (warning): In POSIX sh, using lower/mixed case for signal names is undefined.
                       ^--^ SC3049 (warning): In POSIX sh, using lower/mixed case for signal names is undefined.
                            ^-^ SC3049 (warning): In POSIX sh, using lower/mixed case for signal names is undefined.

In tests/shell/record_offcpu.sh line 25:
  if [ `id -u` != 0 ]
       ^-----^ SC2046 (warning): Quote this to prevent word splitting.

Fixed the warnings by:
- Capitalize signals(INT, TERM, EXIT) to avoid mixed/lower case naming of
signals.
- Adding quotes to avoid word splitting.

Result from shellcheck after patch changes:
     $ shellcheck -S warning record_offcpu.sh
     $

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 tools/perf/tests/shell/record_offcpu.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/tests/shell/record_offcpu.sh b/tools/perf/tests/shell/record_offcpu.sh
index f062ae9a95e1..a0d14cd0aa79 100755
--- a/tools/perf/tests/shell/record_offcpu.sh
+++ b/tools/perf/tests/shell/record_offcpu.sh
@@ -10,19 +10,19 @@ perfdata=$(mktemp /tmp/__perf_test.perf.data.XXXXX)
 cleanup() {
   rm -f ${perfdata}
   rm -f ${perfdata}.old
-  trap - exit term int
+  trap - EXIT TERM INT
 }
 
 trap_cleanup() {
   cleanup
   exit 1
 }
-trap trap_cleanup exit term int
+trap trap_cleanup EXIT TERM INT
 
 test_offcpu_priv() {
   echo "Checking off-cpu privilege"
 
-  if [ `id -u` != 0 ]
+  if [ "$(id -u)" != 0 ]
   then
     echo "off-cpu test [Skipped permission]"
     err=2
-- 
2.39.1

