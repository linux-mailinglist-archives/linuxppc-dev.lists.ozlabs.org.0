Return-Path: <linuxppc-dev+bounces-3616-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B59E9DECAA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2024 21:27:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y0PqB2yBcz2yNv;
	Sat, 30 Nov 2024 07:27:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732912022;
	cv=none; b=QuWR4Pqc2R333oe1n5bIxIbS8JJ4wtHTHPYEyeC517i4SvDGSuxYdUfBQavaZjMOWXSpXCONNrCvQmgwpb/wOy9gZ20j9O3fYMf3HAxC8BdsfHp2JDHVQbyW7qeM+oD1bz0pR3xkcHhs2qYeZyJ3kAOqUbrhD2NcI++7vnML3ejYL5Pu+3xW7FCH83iYUr/oHzS4k9OKma7tP5alJTJZG8xHRVsuc3v6yA0ydIkuPexdCh9stRNlWkkkwjsJfD3nrGuyZiv4uoFoxsqXbWRMHmJ3RwHxiC6BU/K1u5i2Z8R7e68eq09uu6LNG8cJAi1AxKaVE+RAqmr67D8/gjUY3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732912022; c=relaxed/relaxed;
	bh=NY6l9TYMOSUhgOxd/kH4qvMmvUhFE+n2M671enH/a3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CI7x9qMjUEEL90XAwrsrik6aI0hn+/sF5mK2hwiqIaoweeO+sqPm3BdwYC/DYKVMCkpC7kU3adu5i8Vvfqsx0aZfR7gEEwvAlJyrDkHL5EIqJApj4b+Noit/edSsg5PFdf9yAQT5X1bsTlcKbi7uteCn3/RGX8VvZePyVnRdcFhDPrSZrrG5Gj8paz4eXtu0/MEO8CPNMTSEgNk1rmxxUk5uvzNx1R7UsARmNLDw4L4ZVgN7JcrN3CYtla/LTGIj6dkxC3fxYknvYmjnvn/uaimbSF/orFLpKUxAg5IS9wXDCXquCRTjrpUaSIudUJU4RCF5K7nVHHM4l6qghHLpNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KC1ieI8n; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KC1ieI8n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y0Pq925f1z2yNJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2024 07:27:00 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATAFP73027337;
	Fri, 29 Nov 2024 20:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=NY6l9TYMOSUhgOxd/kH4qvMmvUhFE+n2M671enH/a
	3s=; b=KC1ieI8nr6gpPgHCkzJFKFANERFqyfzvTkR77QJS1+qCBR5gasGJqaZLl
	n+rzlAzrz5WvUbTfpHSqYVbfmodWag9eHGeUTaDREkc0A6CsreA/ZsJ86rMpRuWD
	iZEohF9wxs16aPD9c58Tmwakc8jf5T9V+gKXrD8rv7TFleH6ia5n/hgC7sfSzLoL
	OPHTxHjm/4mGYnlss2y32VVjfFoBQq9d+oBFsM6c+7tqBsCCei5x/eg9E2AbTEkd
	hffJRX5df7g9kSepDuEZemnV1faT0HUXAcuU4CFSbKJA+rCmRhI61HN4iVrNKKoR
	WAIJvAFYEYPE6Zvp5MKpuPlrkKLrQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 436ym5dja3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 20:26:27 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATArMIu002585;
	Fri, 29 Nov 2024 20:26:26 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43672gmghn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 20:26:26 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4ATKQPMO29294904
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Nov 2024 20:26:25 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0773F20040;
	Fri, 29 Nov 2024 20:26:25 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7274620043;
	Fri, 29 Nov 2024 20:26:22 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.27.30])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Nov 2024 20:26:22 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        "Naveen N. Rao" <naveen@kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] selftests/ftrace: adjust offset for kprobe syntax error test
Date: Sat, 30 Nov 2024 01:56:21 +0530
Message-ID: <20241129202621.721159-1-hbathini@linux.ibm.com>
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
X-Proofpoint-GUID: C_LDRTXyuQyNz_z28Lbw92rC3hQBsEWN
X-Proofpoint-ORIG-GUID: C_LDRTXyuQyNz_z28Lbw92rC3hQBsEWN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290160
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

In 'NOFENTRY_ARGS' test case for syntax check, any offset X of
`vfs_read+X` except function entry offset (0) fits the criterion,
even if that offset is not at instruction boundary, as the parser
comes before probing. But with "ENDBR64" instruction on x86, offset
4 is treated as function entry. So, X can't be 4 as well. Thus, 8
was used as offset for the test case. On 64-bit powerpc though, any
offset <= 16 can be considered function entry depending on build
configuration (see arch_kprobe_on_func_entry() for implementation
details). So, use `vfs_read+20` to accommodate that scenario too.

Suggested-by: Masami Hiramatsu <mhiramat@kernel.org>
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v2:
* Use 20 as offset for all arches.


 .../selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
index a16c6a6f6055..8f1c58f0c239 100644
--- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
@@ -111,7 +111,7 @@ check_error 'p vfs_read $arg* ^$arg*'		# DOUBLE_ARGS
 if !grep -q 'kernel return probes support:' README; then
 check_error 'r vfs_read ^$arg*'			# NOFENTRY_ARGS
 fi
-check_error 'p vfs_read+8 ^$arg*'		# NOFENTRY_ARGS
+check_error 'p vfs_read+20 ^$arg*'		# NOFENTRY_ARGS
 check_error 'p vfs_read ^hoge'			# NO_BTFARG
 check_error 'p kfree ^$arg10'			# NO_BTFARG (exceed the number of parameters)
 check_error 'r kfree ^$retval'			# NO_RETVAL
-- 
2.47.0


