Return-Path: <linuxppc-dev+bounces-2393-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A209A44D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 19:37:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVX2b1ftdz3btP;
	Sat, 19 Oct 2024 04:37:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729273031;
	cv=none; b=BZ9oKu6SH5EAVIYdY4+/isjFmRbjjF48X2VQSpnXoab1pg3JZ+K9tzxyqlPnd4kFLl138ZGQVHt9BlWwU1idbLNMKzFMihsBnqkAZjrUAhFTkeYu7+xnjkcBS4i324vMgM3yXrTFf+lePlL38iB9sLyMP1tX62BmryF1yEEB1wqC6e9z3LG6cEek8IqtubNfV3zBOcjp4XNzQYUKu1mbmemla6Y0qpzIPpT7K66mEOnaJfO4fO83fyg2rqiOZ5SwpjmyH04Wvc4mxkPcIZm0wg03vTviQzPvCRp5e4rtvz59XxUk/Kc7KYsl10/DGL1bQx05lygK+DXZsNebsxabVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729273031; c=relaxed/relaxed;
	bh=oL9IMEzVW/uiWNE331Qsj0y4/iuYLMGRaqR2BGXECGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BkMGNFNEdJQSZP+aI9xT+bbCxKlLwuonHFFlbZRKh+eShGW8vH9bWgdGaY0EVsEI6KWmv5HSz/7HrmwcLU7ibCvUhTKWr/ZdvklMJDMPYnchPW8sDHuAFG0CozP2MDsLPWT1vkAt3WP0ZIoPr1V4wRfbRawdh3B0YiDiccJ8ax59Co4/+c9mBEarFkJJGBW0OnFlircCEB8rN5CHRiZqub7xBSdWA9fT8iKRYK0N7dHweEzZmLYUEAeRCNbp0CfLjzxrPf8ikaXsTEmTSFQnI2wH0L57kCXijGsHq33gVLfo0Q+eMDZO0ZrSpDQJXwkajFLYjWnptClwXIjKuWWg4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=govUo/QW; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=govUo/QW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVX2Y4jrjz3bqy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 04:37:09 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I9m5SF015438;
	Fri, 18 Oct 2024 17:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=oL9IMEzVW/uiWNE33
	1Qsj0y4/iuYLMGRaqR2BGXECGI=; b=govUo/QWtIxF90G2UJGKTLmlERhRafMVx
	IfjDkyVwkCQ1smfyqpYHgah1XY0mAbzqeQodBGwMtMqZCRoaQh2tbsjzbStVt5Mr
	lvdNicvd4QRrX7dbWf/nJVywpnhRpeqlUUCDF8VP9layYK3fgK6q4gxHGscMVC41
	SS6fUx3kANk1SPuBFLoM5orI2QSIUXRRX9b4MvXnNtf/GwbHqAtBGLdaK5ZE6/d+
	bJABKd3I7wLVjAPvpn2/S5go1kt+z7DlhUBtyvZeycpqxmM95s/eAicoONpcTC4H
	yB0Mw0KrhO/qt3QgdBXfA6E0y1m4pZ0Bp/kN1xBgAlZsXIV2o6y5w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42aqgracf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:36:47 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49IHakP3009380;
	Fri, 18 Oct 2024 17:36:46 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42aqgracf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:36:46 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49IH7CmD006674;
	Fri, 18 Oct 2024 17:36:45 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4283ese5ru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:36:45 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49IHaguB32244354
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Oct 2024 17:36:42 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3881420043;
	Fri, 18 Oct 2024 17:36:42 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2198B20040;
	Fri, 18 Oct 2024 17:36:38 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.99.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Oct 2024 17:36:37 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Subject: [PATCH v6 01/17] powerpc/trace: Account for -fpatchable-function-entry support by toolchain
Date: Fri, 18 Oct 2024 23:06:16 +0530
Message-ID: <20241018173632.277333-2-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018173632.277333-1-hbathini@linux.ibm.com>
References: <20241018173632.277333-1-hbathini@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qreVLQ2fwO0r0YyIsFvzm78eaidVgshv
X-Proofpoint-GUID: 3IpwSKqhGPkW8erZ7fEpG8dlsULJrk7V
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 spamscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410180111
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Naveen N Rao <naveen@kernel.org>

So far, we have relied on the fact that gcc supports both
-mprofile-kernel, as well as -fpatchable-function-entry, and clang
supports neither. Our Makefile only checks for CONFIG_MPROFILE_KERNEL to
decide which files to build. Clang has a feature request out [*] to
implement -fpatchable-function-entry, and is unlikely to support
-mprofile-kernel.

Update our Makefile checks so that we pick up the correct files to build
once clang picks up support for -fpatchable-function-entry.

[*] https://github.com/llvm/llvm-project/issues/57031

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/trace/Makefile | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/trace/Makefile b/arch/powerpc/kernel/trace/Makefile
index 125f4ca588b9..d6c3885453bd 100644
--- a/arch/powerpc/kernel/trace/Makefile
+++ b/arch/powerpc/kernel/trace/Makefile
@@ -9,12 +9,15 @@ CFLAGS_REMOVE_ftrace.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_ftrace_64_pg.o = $(CC_FLAGS_FTRACE)
 endif
 
-obj32-$(CONFIG_FUNCTION_TRACER)		+= ftrace.o ftrace_entry.o
-ifdef CONFIG_MPROFILE_KERNEL
-obj64-$(CONFIG_FUNCTION_TRACER)		+= ftrace.o ftrace_entry.o
+ifdef CONFIG_FUNCTION_TRACER
+obj32-y					+= ftrace.o ftrace_entry.o
+ifeq ($(CONFIG_MPROFILE_KERNEL)$(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY),)
+obj64-y					+= ftrace_64_pg.o ftrace_64_pg_entry.o
 else
-obj64-$(CONFIG_FUNCTION_TRACER)		+= ftrace_64_pg.o ftrace_64_pg_entry.o
+obj64-y					+= ftrace.o ftrace_entry.o
+endif
 endif
+
 obj-$(CONFIG_TRACING)			+= trace_clock.o
 
 obj-$(CONFIG_PPC64)			+= $(obj64-y)
-- 
2.47.0


