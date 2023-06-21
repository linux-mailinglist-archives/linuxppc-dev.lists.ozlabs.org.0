Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF048737DBA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 10:43:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GPprpX9y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmH8747J9z3cNH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 18:43:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GPprpX9y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmGtm3t3Lz3bTk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 18:31:28 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35L8D6O5002729;
	Wed, 21 Jun 2023 08:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XMIqou+vIxMlok+IbyaWUld0BwvYUXQJq30RCfMsjOs=;
 b=GPprpX9y2xbamz40SRbGYtQJjUfEL6kqdpGxePUG2jhBO4gEF1iravZCeYVIiP8a0/zp
 J1hmJXrkX1xg1NI5FyVkEyPynucVKbZi7ifPKz3LnLDjm8iaZ/RTUFWCJbqT75+flelW
 Ww/mVPD/kONpD1ICglBJ0WoM7Rk9U6cwzDcKPfyZ1TbbkHWV+xw/wXTkLfaQ6EeXGF8K
 4XII2tgexOkXa2iXdWJUDMYXvKKqRSmu2P7T1cHDmRIErhzV1ysBAF3NrTKv/ACHj8GL
 l6nt6Jm9zx0Sxz6L65IPouF1JyNmFAhbo3x5NMYjbkXs15NaQE6g8GrKysIG/gdPMjMq /A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbwgcgdgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 08:31:23 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35L8D9wc002954;
	Wed, 21 Jun 2023 08:31:22 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbwgcgdfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 08:31:22 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35L5SGeL004427;
	Wed, 21 Jun 2023 08:31:20 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3r943e202e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 08:31:20 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35L8VGcW59572714
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jun 2023 08:31:17 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC2D42004D;
	Wed, 21 Jun 2023 08:31:16 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E10D20040;
	Wed, 21 Jun 2023 08:31:14 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.109.215.188])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Jun 2023 08:31:13 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org,
        ravi.bangoria@amd.com, john.g.garry@oracle.com
Subject: [PATCH 13/22] tools/perf/tests: Fix shellcheck warning for coresight.sh shell script
Date: Wed, 21 Jun 2023 14:00:12 +0530
Message-Id: <20230621083021.71203-14-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230621083021.71203-1-atrajeev@linux.vnet.ibm.com>
References: <20230621083021.71203-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3hq-rB5iyEv9-dSC8rRS0ae8uoUqfL0b
X-Proofpoint-GUID: wPfw7K35CKjaC8Qwi39rS-xP3OPAD9O_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_05,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 mlxscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306210067
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

Running shellcheck on coresight.sh throws below warning:

In lib/coresight.sh line 1:
^-- SC2148 (error): Tips depend on target shell and yours is unknown. Add a shebang or a 'shell' directive.

In lib/coresight.sh line 13:
PERFRECOPT="$PERFRECMEM -e cs_etm//u"
^--------^ SC2034 (warning): PERFRECOPT appears unused. Verify use (or export if used externally).

Fixed the warnings by:
- Adding shell directive
- Using export for PERFRECOPT variable

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 tools/perf/tests/shell/lib/coresight.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/lib/coresight.sh b/tools/perf/tests/shell/lib/coresight.sh
index 6c3d34ec64d8..c7d97a0186c7 100644
--- a/tools/perf/tests/shell/lib/coresight.sh
+++ b/tools/perf/tests/shell/lib/coresight.sh
@@ -1,3 +1,4 @@
+#!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
 # Carsten Haitzler <carsten.haitzler@arm.com>, 2021
 
@@ -10,7 +11,7 @@
 
 # perf record options for the perf tests to use
 PERFRECMEM="-m ,16M"
-PERFRECOPT="$PERFRECMEM -e cs_etm//u"
+export PERFRECOPT="$PERFRECMEM -e cs_etm//u"
 
 TOOLS=$(dirname $0)
 DIR="$TOOLS/$TEST"
-- 
2.39.1

