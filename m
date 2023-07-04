Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE00D7468AE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 07:04:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aFPN81IP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qw9hG51xpz3bx0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 15:04:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aFPN81IP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qw9gL1jMNz30GC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 15:03:57 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3644lpx0002290;
	Tue, 4 Jul 2023 05:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=3hPYZMBNU5/19YLczA4yPKBhFusGpQeWXPBcqMysnQs=;
 b=aFPN81IPYY6BrrjBUInJopNq/HE04nvczCGSM/JAL9ePs6ZrJQjES5TQXRdZDC7cKJWZ
 ca4wxp57qC2S8u8S/huqa5SLjyhNmgkpEil7CcB13OvoPggu0fp1dfT0DSqoUtxVsuWZ
 BW/YF+d1VmyvjHxLMNAETgrZryDQHwf8H6DTq3Vr0gP5wwfHAPFtPVJIW5DkWS5DAYpf
 f0xVARGcfwjNRcSIC1rjebX8Fq4R0iVrooA5RF/QNr5v3bGb0l02xGkK+ZXsD2oURVqy
 Bpl8R5zxQjDngQ/3J/uSoMtCBIQhmL7qMdl5Bn3oTGpkAnpqUSPmJukWVUNhilmpf+lK Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rmcq8896g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jul 2023 05:03:43 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3644lpov002270;
	Tue, 4 Jul 2023 05:03:42 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rmcq8895x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jul 2023 05:03:42 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3643KY93016240;
	Tue, 4 Jul 2023 05:03:41 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3rjbs51aax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jul 2023 05:03:40 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36453bFg19595918
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Jul 2023 05:03:37 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7FF442004D;
	Tue,  4 Jul 2023 05:03:37 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB3F820040;
	Tue,  4 Jul 2023 05:03:34 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.47.10])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Jul 2023 05:03:34 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, ak@linux.intel.com
Subject: [PATCH] tools/perf/tests: Fix Basic BPF llvm compile to check for libbpf support
Date: Tue,  4 Jul 2023 10:33:27 +0530
Message-Id: <20230704050327.14963-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: t5FZauKNEZ-qRrAtX6S7qUidXq1Ja4uX
X-Proofpoint-GUID: urRiKt5FTqhR3dqW32xDPD0pLO-5L4JI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_02,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307040042
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
Cc: irogers@google.com, maddy@linux.ibm.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, james.clark@arm.com, kjain@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Basic BPF llvm compile fails in systems with libbpf
that doesn't support BTF. Log shows below information.

	libbpf: BTF is required, but is missing or corrupted.
	Failed to parse test case 'Basic BPF llvm compile'
	test child finished with -2
	---- end ----

Here BPF llvm compile fails due to missing BTF support.
Fix the llvm test to skip the test incase BTF support is
missing.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/llvm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/llvm.c b/tools/perf/tests/llvm.c
index 0bc25a56cfef..4c73c9eab0bb 100644
--- a/tools/perf/tests/llvm.c
+++ b/tools/perf/tests/llvm.c
@@ -4,6 +4,7 @@
 #include <string.h>
 #include "tests.h"
 #include "debug.h"
+#include <errno.h>
 
 #ifdef HAVE_LIBBPF_SUPPORT
 #include <bpf/libbpf.h>
@@ -14,8 +15,12 @@ static int test__bpf_parsing(void *obj_buf, size_t obj_buf_sz)
 	struct bpf_object *obj;
 
 	obj = bpf_object__open_mem(obj_buf, obj_buf_sz, NULL);
-	if (libbpf_get_error(obj))
+	if (libbpf_get_error(obj)) {
+		/* Skip if there is no BTF support */
+		if (errno == ENOENT)
+			return TEST_SKIP;
 		return TEST_FAIL;
+	}
 	bpf_object__close(obj);
 	return TEST_OK;
 }
-- 
2.27.0

