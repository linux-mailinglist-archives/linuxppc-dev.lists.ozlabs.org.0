Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A4E90D373
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 16:05:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B8hJPBuo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3T6q5ZDfz3ccS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 00:05:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B8hJPBuo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3T5R3Kfcz3cc6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 00:04:27 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45IDrZGv001561;
	Tue, 18 Jun 2024 14:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=dEa42Smj0LjS2
	H8hmolyYdKaDlyVIpYrh5mx6Giw1Hc=; b=B8hJPBuos7b20Qk4LBxLqBQD5D8sp
	2FlpU9LBWTSYznyyNSnQH9sqn3SmywY7g4hwA/3hflJGVuzz5kpmvb9CUev2Ow4z
	rsO156aU5OC5EBH96i8A+w4KRO2ZH5SWZ9YQlu7xo9V0RsMiblODwUgfhYoSTc4d
	BIxbP94/slXPNE0EonrPUY+/UcJN5ZJ6BxQRPKn2HAz5VwXzhFzpSzxLwR+0O28p
	jvn3bfUGX0sAqrmKajSS57WM1gNNeqIg0AAvPhdgShNuXkD45sUy87+Owt1/PK74
	EEiT7eiElk7so1FFUAuzWCvARZo4pB2aX1bbRyPFx9fhwOYPKk+mDqnFw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yubgyg1es-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 14:04:21 +0000 (GMT)
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45IE4L8K020953;
	Tue, 18 Jun 2024 14:04:21 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yubgyg1eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 14:04:21 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45ICsZB5006216;
	Tue, 18 Jun 2024 14:04:20 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ysn9um410-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 14:04:20 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45IE4EJw49349108
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jun 2024 14:04:17 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF2D12006C;
	Tue, 18 Jun 2024 14:04:14 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0FFC720065;
	Tue, 18 Jun 2024 14:04:11 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.108.117])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Jun 2024 14:04:10 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH V3 3/3] tools/perf: Fix parallel-perf python script to replace new python syntax ":=" usage
Date: Tue, 18 Jun 2024 19:33:54 +0530
Message-Id: <20240618140354.5765-3-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240618140354.5765-1-atrajeev@linux.vnet.ibm.com>
References: <20240618140354.5765-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: od4ffZBW_SO3X_HBerYtr5K6i4Q8i2xD
X-Proofpoint-GUID: PvAT2FTK0SXzvUW4WosZFb1Wg_E_ptbs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180104
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

perf test "perf script tests" fails as below in systems
with python 3.6

	File "/home/athira/linux/tools/perf/tests/shell/../../scripts/python/parallel-perf.py", line 442
	if line := p.stdout.readline():
             ^
	SyntaxError: invalid syntax
	--- Cleaning up ---
	---- end(-1) ----
	92: perf script tests: FAILED!

This happens because ":=" is a new syntax that assigns values
to variables as part of a larger expression. This is introduced
from python 3.8 and hence fails in setup with python 3.6
Address this by splitting the large expression and check the
value in two steps:
Previous line: if line := p.stdout.readline():
Current change:
	line = p.stdout.readline()
	if line:

With patch

	./perf test "perf script tests"
	 93: perf script tests:  Ok

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
Changelog:
v1 -> v2
Added "Acked-by" from Adrian

 tools/perf/scripts/python/parallel-perf.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/scripts/python/parallel-perf.py b/tools/perf/scripts/python/parallel-perf.py
index 21f32ec5ed46..be85fd7f6632 100755
--- a/tools/perf/scripts/python/parallel-perf.py
+++ b/tools/perf/scripts/python/parallel-perf.py
@@ -439,7 +439,8 @@ def ProcessCommandOutputLines(cmd, per_cpu, fn, *x):
 	pat = re.compile(r"\s*\[[0-9]+\]")
 	p = subprocess.Popen(cmd, stdout=subprocess.PIPE)
 	while True:
-		if line := p.stdout.readline():
+		line = p.stdout.readline()
+		if line:
 			line = line.decode("utf-8")
 			if pat.match(line):
 				line = line.split()
-- 
2.35.3

