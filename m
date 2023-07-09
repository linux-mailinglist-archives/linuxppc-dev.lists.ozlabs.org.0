Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8CE74C766
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 20:43:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k4/3V8Pn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qzbd56sdGz3c5F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 04:43:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k4/3V8Pn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QzbHw4DdZz3c26
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 04:29:00 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 369IHVri025469;
	Sun, 9 Jul 2023 18:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5N2+Wmg0iOVIfvguvptKkXh3r91iP0FBRQQRXNc8sPo=;
 b=k4/3V8Pnb747BhzfThYrtaWJBYo2bOzGPrOKGPgZ8CzU9TbG7AbmPv7Cqair3CRdQnP6
 Sy8LScUYZDlBh32jtj25WSk9JGGe45eu+STkzlj+YdqLrbbK8MFQWNxuJcST8pl81PXd
 GGf5+dmjDeRV4LtRZd/f+bmWdy4M07dBkbmhij0Qu1rBrj/nFL29ndWNkM0td2UP/ia5
 xXRcywElEqsyXuHIctY1o89e5yrDWUdT3HJEUTD7OgHk4Cs4d2ZGCeKz3la+MFCRN7QB
 Y9Y6hmVzdxD3L8/U+z1Ax8GqLOoSLB7h7UVJ4uwtFPmi1xsIKzPmsD9u9dikdrGlc/z6 sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rr21m83y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:56 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 369IStUg017288;
	Sun, 9 Jul 2023 18:28:55 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rr21m83xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:55 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 369CnJKY011192;
	Sun, 9 Jul 2023 18:28:54 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3rpye58uy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:53 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 369ISoW155378232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Jul 2023 18:28:50 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A8ADB2004B;
	Sun,  9 Jul 2023 18:28:50 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CF7020043;
	Sun,  9 Jul 2023 18:28:48 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.24.202])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  9 Jul 2023 18:28:48 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH V2 17/26] tools/perf/tests: Fix shellcheck warnings for unroll_loop_thread_10.sh
Date: Sun,  9 Jul 2023 23:57:51 +0530
Message-Id: <20230709182800.53002-18-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
References: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: twF2ApCJFkOGZb4jv8xgUQKaOeT7Rj3N
X-Proofpoint-GUID: PJeYbRjlZN75w1-FLWqQNjou-8l9XzZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-09_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 mlxlogscore=832 clxscore=1015
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Fix the shellcheck warnings for unroll_loop_thread_10.sh
Add quotes to prevent word splitting which are caused by
unquoted command expansions.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh b/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh
index f48c85230b15..7304e3d3a6ff 100755
--- a/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh
+++ b/tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh
@@ -5,7 +5,7 @@
 # Carsten Haitzler <carsten.haitzler@arm.com>, 2021
 
 TEST="unroll_loop_thread"
-. $(dirname $0)/../lib/coresight.sh
+. "$(dirname $0)"/../lib/coresight.sh
 ARGS="10"
 DATV="10"
 DATA="$DATD/perf-$TEST-$DATV.data"
-- 
2.39.1

