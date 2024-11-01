Return-Path: <linuxppc-dev+bounces-2763-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6026B9B984B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2024 20:19:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xg9fb6ftHz2yG9;
	Sat,  2 Nov 2024 06:19:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730488791;
	cv=none; b=Bx45SYXDn+RmxfIQkQKzyMN6gOM5arfKMzgjdFDRg+/nhKeJNTq1In6Q3Fa+N8D8YcKoFNcaazsghFGawplni9RoqBkI+W8/IWX+9aknrQclvJwR15rNv9Qk7hkM/jir2Wda8nOkqF8iUntD8D0GfNZO5OWzQsDmfHKz8rr/NbkJvPjLzZDim+UEWfHoMBx8VBp5XBlh6nuZlR5QbM2KtT6/M9xVjuCnTsCKIdeHy0ve9vPD/MnsqSldpxrtyheKWIPutKEMifmGvvgklzs9rZ38vzB8F99QmT3t9CJTDJv/+Dg0bobwNlBHfinU1xC+fstgqA9Pb1lXKpTMRzgCrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730488791; c=relaxed/relaxed;
	bh=emW3DFFX5xSkwqDqwd8s1ekemaINDrTWI4ZEJ8ZVyAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TfvVOeqsEhrs02zIA0eYQSGoxqkcY7E1h1NOLw6dOgj07EkJN0IkA1Mjx6JFcscWwr90haUwgDQnBLU1StSeea1ZFKwwL/r5zJC2xMeWZgIkMaQWD4m8aKfhY4yzHlYxzBw35CFTZSr6VaS2UhNvKym9Hpw5RzEEtmaYT2vxk7/8v7X9/dvBtHL9wXBt6P3LrRwWXGF6EwIyKg/ek7eJBz3rQxJrDtlN4jFOM3PvY1u8wokkzI7KgT//BdxPHlvNN18vi+3JVr7w4JiPP0SPi8vujixFBcMwOX2f3O11fnhzCnVX0k3UMVodAYrX9cocAsx5914eFIthUu6wJHw8MA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=teYo66oq; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=teYo66oq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xg9fZ5pwNz2yDp
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2024 06:19:49 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1EV3gs030005;
	Fri, 1 Nov 2024 19:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=emW3DFFX5xSkwqDqwd8s1ekemaINDrTWI4ZEJ8ZVy
	Aw=; b=teYo66oqPhhDpjT+aLf/cOSKeRh4CcLqJ9KaxnMcKIU2kokmDFNDxYaLw
	X89hmZMbee8206Q0hs4F886QijpA069F+n86u4IngxwCzYaN9PkVV9BnzdvvKAMn
	PED3Cc6MCRdwlz/1+uKOI2tWhWhkTsabh5WvCEvlZttQWgpu7zbNsFxOhL5KsKv/
	gnA5SpO9r36mD7NTQdk4FQ0Qwr75SqxwjX++StD/0tKF5fl3Y2qSB5C//4kZMqI8
	fO3EuMWYdH1Qq9xifarIy6ibS1AXUO+/Z2qu9w5OB0OhQkZEGv7rdpm06dzmCa/u
	/AAEJFapVpjWoj0L4d7acY7d0NDyg==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42n0trs4d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 19:19:31 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1J0GrG017410;
	Fri, 1 Nov 2024 19:19:30 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 42harsubgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 19:19:30 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A1JJSj319202362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Nov 2024 19:19:29 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF63A20043;
	Fri,  1 Nov 2024 19:19:28 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C1C820040;
	Fri,  1 Nov 2024 19:19:26 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.10.84])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  1 Nov 2024 19:19:26 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        "Naveen N. Rao" <naveen@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-trace-kernel@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] selftests/ftrace: update kprobe syntax error test for ppc64le
Date: Sat,  2 Nov 2024 00:49:25 +0530
Message-ID: <20241101191925.1550493-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
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
X-Proofpoint-ORIG-GUID: R0NuKKSeMdoH9DKz0bqcplnnRXR7wh1C
X-Proofpoint-GUID: R0NuKKSeMdoH9DKz0bqcplnnRXR7wh1C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxscore=0 clxscore=1011 impostorscore=0 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010138
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

For ppc64le, depending on the kernel configuration used, offset 16
from function start address can also be considered function entry.
Update the test case to accommodate such configurations.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 .../selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
index a16c6a6f6055..c03b94cc5784 100644
--- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
@@ -111,7 +111,11 @@ check_error 'p vfs_read $arg* ^$arg*'		# DOUBLE_ARGS
 if !grep -q 'kernel return probes support:' README; then
 check_error 'r vfs_read ^$arg*'			# NOFENTRY_ARGS
 fi
+if [ "$(uname -m)" = "ppc64le" ]; then
+check_error 'p vfs_read+20 ^$arg*'		# NOFENTRY_ARGS
+else
 check_error 'p vfs_read+8 ^$arg*'		# NOFENTRY_ARGS
+fi
 check_error 'p vfs_read ^hoge'			# NO_BTFARG
 check_error 'p kfree ^$arg10'			# NO_BTFARG (exceed the number of parameters)
 check_error 'r kfree ^$retval'			# NO_RETVAL
-- 
2.47.0


