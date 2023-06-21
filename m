Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BECF4737DFE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 11:06:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Uqt/pJVt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmHg5421rz3btm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 19:06:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Uqt/pJVt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmHdL32syz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 19:04:54 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35L8eBbV028850;
	Wed, 21 Jun 2023 09:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5JhVZjwj7B4ZFfg7ujLKPKvFtNtF615g37YWmp3Tnnc=;
 b=Uqt/pJVt0Iv9FdyXSYSGC5eWIldKw81jYm1QViIqUGiMdmvso24Umd3wtlxI30ZSZNCd
 /P/QSGpJXY4NxEUQFxcQuAAU5jql13Ji7gPEhUYqy9cCJvjDv9Y1J2Pw175jFuVVxvY7
 gb6moBrga4y4KPnW3jDyGfNPO5EiUkuoBHuag5UB2UF3t0l6mKx8j3zCNmRgdNZQVBk3
 MZHCPWsQrv1W7Dpawmk4ihOiwJLu+BP+JR3W3O7jKm/Gfhia4yN81lnScf3E0/tC4oaa
 fwHCfQ4AWQSWwqV4hzRpZLgUGb0mBwXCuhB3ZcZP6yq4mK2SeG5YizEZ4oPVkajCURMt xA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbwgch4eg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 09:04:48 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35L8gRTw005215;
	Wed, 21 Jun 2023 09:04:48 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbwgch4bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 09:04:48 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35L2nRIR008440;
	Wed, 21 Jun 2023 08:31:51 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r943e2msw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 08:31:50 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35L8VlV917826192
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jun 2023 08:31:47 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5EA7F2004D;
	Wed, 21 Jun 2023 08:31:47 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FA4420040;
	Wed, 21 Jun 2023 08:31:43 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.109.215.188])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Jun 2023 08:31:43 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org,
        ravi.bangoria@amd.com, john.g.garry@oracle.com
Subject: [PATCH 20/22] tools/perf/tests: Fix the shellcheck wanrings in lib/waiting.sh
Date: Wed, 21 Jun 2023 14:00:19 +0530
Message-Id: <20230621083021.71203-21-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230621083021.71203-1-atrajeev@linux.vnet.ibm.com>
References: <20230621083021.71203-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QAzotZ5v9R6ZTqmdCOHfKaGI64YcnFeT
X-Proofpoint-GUID: 8hpjZerK6dfZrm-qHxm5PGPyR0tA7DF3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_06,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 mlxscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306210076
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

Running shellcheck in "lib/waiting.sh" generates below
warning:

   In ./tools/perf/tests/shell/lib/waiting.sh line 1:
   # SPDX-License-Identifier: GPL-2.0
   ^-- SC2148 (error): Tips depend on target shell and yours is unknown. Add a shebang or a 'shell' directive.

Fix this by adding shebang in the beginning of the script.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/shell/lib/waiting.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/tests/shell/lib/waiting.sh b/tools/perf/tests/shell/lib/waiting.sh
index e7a39134a68e..bdd5a7c71591 100644
--- a/tools/perf/tests/shell/lib/waiting.sh
+++ b/tools/perf/tests/shell/lib/waiting.sh
@@ -1,3 +1,4 @@
+#!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 
 tenths=date\ +%s%1N
-- 
2.39.1

