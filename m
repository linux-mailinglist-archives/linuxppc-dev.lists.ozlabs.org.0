Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4657310FB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 09:39:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o5XHUqO/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhZ190vWXz3bkn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 17:39:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o5XHUqO/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhZ0F1lwXz30Nf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 17:38:20 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35F7ScCF002797;
	Thu, 15 Jun 2023 07:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=1Sm3zdSn+qHJF3+Y6o+KAXvkzmFKEFt0XxoIHrK97TY=;
 b=o5XHUqO/41rRnxBpYj2GsRd+zF0gGT4n3Fr/zU4EUUeCmJYLdMEyiRIxU6QQ98iydC81
 jc2ODiKSPz2vgOKwr8RARDL/Z0sVGCdY/k6xGB3c251GjrIvV0qLM3falEHrLWtWOiTJ
 K7aDHuPSJ7Vne6PHZmgap0FzcAm/M5bu+n9kxnyU/MOv+I1J43wZnTFJMJe2HNevBgEn
 D92qvVKqswBcDQtv2y2Giz4dXdm8PZjPOoXTesJ8SoArgfMqAkp6VP3RfGFj5WnoWTwY
 YmQC2A/5zu3lgmOlrfUmAwX7KBN9btYS3+XC/qzX5/cVl8mc/oe/7TXzUptE993WyH6l aw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r7x9s0bf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 07:38:15 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35F7T46I004636;
	Thu, 15 Jun 2023 07:38:15 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r7x9s0bdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 07:38:15 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35F3u9jG000832;
	Thu, 15 Jun 2023 07:38:12 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r4gee3eg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 07:38:12 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35F7c99T45941006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jun 2023 07:38:09 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11A9D2004E;
	Thu, 15 Jun 2023 07:38:09 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCC7B20043;
	Thu, 15 Jun 2023 07:38:06 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.120.107])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Jun 2023 07:38:06 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH 1/2] tools/perf/tests: perf all metrics test fails when perf_event access is restricted
Date: Thu, 15 Jun 2023 13:08:02 +0530
Message-Id: <20230615073803.54481-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dLvhuvfjgGTgLjkXPGWcnM_-hCVlOxGI
X-Proofpoint-GUID: jeWgOoPaP430W9wY0i2-vC_vjMT_j97S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_04,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150063
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

Perf all metrics test fails as below when perf_event access
is restricted.

    ./perf test -v "perf all metrics test"
    Metric 'Memory_RD_BW_Chip' not printed in:
    Error:
    Access to performance monitoring and observability operations is limited.
    Enforced MAC policy settings (SELinux) can limit access to performance
    —
    access to performance monitoring and observability operations for processes
    without CAP_PERFMON, CAP_SYS_PTRACE or CAP_SYS_ADMIN Linux capability.
    —
    test child finished with -1
    ---- end ----
    perf all metrics test: FAILED!

The perf all metrics test picks the input events from
"perf list --raw-dump metrics" and runs "perf stat -M "$m""
for each of the metrics in the list. It fails here for some
of the metrics which needs access, since it collects system
wide resource details/statistics. Fix the testcase to skip
those metric events.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/shell/stat_all_metrics.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/stat_all_metrics.sh b/tools/perf/tests/shell/stat_all_metrics.sh
index 54774525e18a..14b96484a359 100755
--- a/tools/perf/tests/shell/stat_all_metrics.sh
+++ b/tools/perf/tests/shell/stat_all_metrics.sh
@@ -6,7 +6,9 @@ err=0
 for m in $(perf list --raw-dump metrics); do
   echo "Testing $m"
   result=$(perf stat -M "$m" true 2>&1)
-  if [[ "$result" =~ ${m:0:50} ]] || [[ "$result" =~ "<not supported>" ]]
+  # Skip if there is no access to perf_events monitoring
+  # and observability operations
+  if [[ "$result" =~ ${m:0:50} ]] || [[ "$result" =~ "<not supported>" ]] || [[ "$result" =~ "Access to performance monitoring and observability operations is limited" ]]
   then
     continue
   fi
-- 
2.31.1

