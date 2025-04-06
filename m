Return-Path: <linuxppc-dev+bounces-7470-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 914FAA7CEFB
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Apr 2025 18:34:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZVyc85rjgz2xdg;
	Mon,  7 Apr 2025 02:34:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743957288;
	cv=none; b=SvYPOWXh9ug55sIwFetaFL4Sg2ikwZ+TpDDLemt/lqfSGELdylXNOeZ8K2rRjmMJ1RECWBkCUd/qexIjCQyozwCrBhkVzSc5gxsQnjMsvquAHmAJUYepUdE1edIX1Kscv1DX7CTCeDytumGQq5bDRDUi+fT4ba2acUZf9Y45n1U9c1cXvvJaZchnPGlAIYQb7WOJ+xftE33/T0I7E/a18O3jttmwC2bJbwXs88LtAxfyr8FGrtfrUAGOnQGIX9r9gtqlyStXbItXxizctEMr65jGxZn9ZXsqR67L6UHrXLxbUUi5+AqiKPNzp2f7UGXzupL6EFOCz7UnqlPKUkSCQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743957288; c=relaxed/relaxed;
	bh=qLFtcIKkBCr2UmXnu02eczKZYSvK24BFD+5YU178Hrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lfg4iGavEwVg0XnEwmWLNMlPnxpW1yBUKxYZ2GOenwzpTEmGL2bzOII8FXa7pT7ZOWteO/zrZHLE+xlknmEg0Yq680HiZI9E+Xr8EBoakUCZar0UMM5sXRvVhInEQYeQqezeT6xCxgMh0mX7CB8ahlr5vawpQpkFif7r6dtYE9C+Jr5ho1coYAjw/YNiyTolt94U7hAV3/ExdqPpShO6EXMlM45mqZYjqAym+qKeGgrBARIGjXFiuhLVY64ZgguavUhoiAOeXIuJN1SZfTZw2YmPrh6daRkgu4op1xFdHwxU7d58zqyjGWZsi2vWWn+X062+oUPIfFF5/sB4eR9TMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gwBcdXWL; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gwBcdXWL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZVyc41S1Yz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Apr 2025 02:34:43 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5368uvXt027152;
	Sun, 6 Apr 2025 16:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=qLFtcIKkBCr2UmXnu02eczKZYSvK24BFD+5YU178H
	rk=; b=gwBcdXWLwn/JtW4F8d0o2pAbG/ulnOIXYRU9vHxMsSvx6b/Qz7JnEDfA0
	JB10XQKFqYQy+sTE9SPoF/I3xxqkUXb5NxmOLkvMFOgAGro1p0F2dk7tWbafgr7Q
	Rj9vSngerUtzbh+KDb3tIudv74LMKHG5mz/NNzN2KhV5hvW+RH+tOdgsYSh0I2ce
	7LMYIjaYpymjDLoAZGYShMVQFfdOoEMMPmBDt7Msl+lxPbjGds2eWnkkMgruyiyl
	8RRb1hAGF2KnGUGRHrWJRk2uZOlqI5FH8m5fO52UJXbIFy3eI5U8neqsD7Y485QU
	YmZzRx784aBufN86QjYorNPN/GjTg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45ubr0jrsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Apr 2025 16:34:30 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 536GYUfN006530;
	Sun, 6 Apr 2025 16:34:30 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45ubr0jrsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Apr 2025 16:34:30 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 536DEq7h014473;
	Sun, 6 Apr 2025 16:34:29 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45ufuna99p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Apr 2025 16:34:29 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 536GYPx626870332
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 6 Apr 2025 16:34:25 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9949020049;
	Sun,  6 Apr 2025 16:34:25 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 848D620040;
	Sun,  6 Apr 2025 16:34:21 +0000 (GMT)
Received: from li-e616facc-2daa-11b2-a85c-9c7f23c3cd5e.ibm.com.com (unknown [9.39.20.57])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  6 Apr 2025 16:34:21 +0000 (GMT)
From: Likhitha Korrapati <likhitha@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, atrajeev@linux.ibm.com,
        Likhitha Korrapati <likhitha@linux.ibm.com>
Subject: [PATCH] tools/lib/perf: Fix -Werror=alloc-size-larger-than in cpumap.c
Date: Sun,  6 Apr 2025 22:04:12 +0530
Message-ID: <20250406163412.897313-1-likhitha@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uXAkx6ONmm2gNLmbAIULtmQvm6muFQqQ
X-Proofpoint-GUID: 7lxIQj-qXevGsWmFquYBXpGJi-Qsw3li
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504060119
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

perf build break observed when using gcc 13-3 (FC39 ppc64le)
with the following error.

cpumap.c: In function 'perf_cpu_map__merge':
cpumap.c:414:20: error: argument 1 range [18446744069414584320, 18446744073709551614] exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
  414 |         tmp_cpus = malloc(tmp_len * sizeof(struct perf_cpu));
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from cpumap.c:4:
/usr/include/stdlib.h:672:14: note: in a call to allocation function 'malloc' declared here
  672 | extern void *malloc (size_t __size) __THROW __attribute_malloc__
      |              ^~~~~~
cc1: all warnings being treated as errors

Error happens to be only in gcc13-3 and not in latest gcc 14.
Even though git-bisect pointed bad commit as:
'commit f5b07010c13c ("libperf: Don't remove -g when EXTRA_CFLAGS are used")',
issue is with tmp_len being "int". It holds number of cpus and making
it "unsigned int" fixes the issues.

After the fix:

  CC      util/pmu-flex.o
  CC      util/expr-flex.o
  LD      util/perf-util-in.o
  LD      perf-util-in.o
  AR      libperf-util.a
  LINK    perf
  GEN     python/perf.cpython-312-powerpc64le-linux-gnu.so

Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
---
 tools/lib/perf/cpumap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/perf/cpumap.c b/tools/lib/perf/cpumap.c
index 4454a5987570..c7c784e18225 100644
--- a/tools/lib/perf/cpumap.c
+++ b/tools/lib/perf/cpumap.c
@@ -398,7 +398,7 @@ bool perf_cpu_map__is_subset(const struct perf_cpu_map *a, const struct perf_cpu
 int perf_cpu_map__merge(struct perf_cpu_map **orig, struct perf_cpu_map *other)
 {
 	struct perf_cpu *tmp_cpus;
-	int tmp_len;
+	unsigned int tmp_len;
 	int i, j, k;
 	struct perf_cpu_map *merged;
 
-- 
2.43.5


