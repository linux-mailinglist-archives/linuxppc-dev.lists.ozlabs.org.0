Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 153AF913860
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2024 08:51:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jlG2rOmz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W6MFB46qqz3cXD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2024 16:51:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jlG2rOmz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W6MC116ztz3cXN
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2024 16:49:16 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45N60PSb018731;
	Sun, 23 Jun 2024 06:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=dEa42Smj0LjS2
	H8hmolyYdKaDlyVIpYrh5mx6Giw1Hc=; b=jlG2rOmzOGaS2i1a9hy5p7wMQQQg5
	QvDryCOJkEHw/Hib1JqphoO3EihS0Mg7eNVyjoT6PzXQxns5mUAPurs/rLEnNS1U
	cfsvs3z535+8R9FvzW63NLTD5Tnp+WEDVr0Nhh1I0E16DENFke8lGvCBz+hZE3hv
	OP7G+c0vrPSJ4ZouJ3M8cEUSH6yEFT8QVde2XULPjKv+eemeaJTnq3Z2DX9rkrd0
	cVMmeRpz6q2pfgM2mspGjh24TmZOA9vX+NBvArBR6Q9/d0XzInkU6acKaECSH09w
	LjxFplZykjab6f7odgqAGNpsHRLKhIgw1bEBeI7RBUHC1BGnuMV1MNSFg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yxe1b83bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Jun 2024 06:49:09 +0000 (GMT)
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45N6n8to029531;
	Sun, 23 Jun 2024 06:49:08 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yxe1b83bg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Jun 2024 06:49:08 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45N3FQXb032373;
	Sun, 23 Jun 2024 06:49:07 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yxbn2rnhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Jun 2024 06:49:07 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45N6n2om55181690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 23 Jun 2024 06:49:04 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5FC6320040;
	Sun, 23 Jun 2024 06:49:02 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EAF622004B;
	Sun, 23 Jun 2024 06:48:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.64.228])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 23 Jun 2024 06:48:59 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH V4 3/3] tools/perf: Fix parallel-perf python script to replace new python syntax ":=" usage
Date: Sun, 23 Jun 2024 12:18:50 +0530
Message-Id: <20240623064850.83720-3-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240623064850.83720-1-atrajeev@linux.vnet.ibm.com>
References: <20240623064850.83720-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: twvsYE8X1Dhu-0qvRZPJwKtNHaxS7hsO
X-Proofpoint-ORIG-GUID: BY_V99SRTL2QsshccPAqmCjCR4S4CJ62
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-23_01,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406230047
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

