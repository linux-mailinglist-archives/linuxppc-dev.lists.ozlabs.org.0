Return-Path: <linuxppc-dev+bounces-1385-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDE79798D1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2024 22:57:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6L304K8Jz2yQn;
	Mon, 16 Sep 2024 06:57:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726433852;
	cv=none; b=P9dJ9NwRBmB+V1RtZIXfBTQk/Jgxl+pWs7IEHPfM2g7gHs5NzbI8sqvv4RRXl6AkpxYko9juYF4qc6tc1y3Es3rD+k2B/+3C+IpuD4XrDl3CZgUIFMiEqn1nw4Fx3H3sWLNWwYxfWzEdNh39RDcSM4RvcS/2I9em2lk0rL1U4SMtLs3ModjQgp4nALckaJkSEUWibsUOEEdfem8Ikjpg6GR0IrJPDTwFrsri4tL+mFVxWgM/XTlZHJVthpq0MRAfChDhaMNI1Qfq++5vw0xfhIw3eJbCzTNPbucbJ9BJ4TID7FudkomT7EXbvgg0wMYDigbj9PPz5Zkvdi6nWwiFgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726433852; c=relaxed/relaxed;
	bh=tb66XrBV2v3WlqYpTuKKyXXXCihP9bw+/QwW2wwXZow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iQxuAADCW+2YUAuAeheexH5ffQL2rDPPH+n3qO1IMbyYGc3DjYYqpUI8Dp1HLriiOqSrYxkMO8NIyD8UzL99hL//vXSuFvkx8Y1qTabXjT5xABKm+FmjKvLbqiSVzc1eFurkO2TOZMBAiVMZbP3ou83UROBZLZDjwFa6WLig9NUaSUxw5dLUt/SShZPpDiu/VD7lqd1MMmLcsBJli+hLQ3k7Ov/0BpjupNVrppPMkHgA41DIjASULA2yuxUpSEIOnI1GopVi0nnNJgYYWNXYawMLogE8hu0BM1F1HKwuz6JcqCoKKtn3TVnyajmHgWUc/rEoKi1C1fDwR6i1PQ+urA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GyBIblDG; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GyBIblDG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6L301H0Tz2yFL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 06:57:31 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FKFmwo029971;
	Sun, 15 Sep 2024 20:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=tb66XrBV2v3Wl
	qYpTuKKyXXXCihP9bw+/QwW2wwXZow=; b=GyBIblDG+VYcCz43TyKHbjdhwIb3I
	HIoPJ3YhNJzwsRK5GV1RMM4qti1v1NWfnkpJ4HfCcZ3SHTsbnxSEZCIjhb/NGfMH
	i5DOp/E9ITx93Vq7mgHgQqT/nXVrM/9EGcTSV92KwlQk9VOazc/VFC6Z6iitlMJa
	MuPLI7OhSoiKbmr9D9BNqvLuL597N4YPpkWo/KaPEUAC57Gwzz73s28u89I6inNU
	zpyGTvFskF4SxYl01YMK7MH5Xm7kPFD1OcxuVTF08bni7UAN8CxuWK6qMavsFJEn
	OvXgOrwOdAfUUJNV/1htZLC9AJyFq7k2xU81e/uEHkInKPsjne7W1dAKQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3uvp8mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:57:11 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48FKvBHp002078;
	Sun, 15 Sep 2024 20:57:11 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3uvp8mh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:57:11 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48FJvtJa030631;
	Sun, 15 Sep 2024 20:57:10 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41npamumej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:57:10 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48FKv68k56361430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Sep 2024 20:57:06 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7670D20049;
	Sun, 15 Sep 2024 20:57:06 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4572320040;
	Sun, 15 Sep 2024 20:57:02 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.68.55])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 15 Sep 2024 20:57:02 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: "Naveen N. Rao" <naveen@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH v5 03/17] powerpc64/ftrace: Nop out additional 'std' instruction emitted by gcc v5.x
Date: Mon, 16 Sep 2024 02:26:34 +0530
Message-ID: <20240915205648.830121-4-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240915205648.830121-1-hbathini@linux.ibm.com>
References: <20240915205648.830121-1-hbathini@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: U65oGFEzZiVl3dL9IQtvh1YgrmEd-8zK
X-Proofpoint-ORIG-GUID: iYVkRkamHpZtvuWs33JBpbHqaBTtYSDk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-15_12,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=960 suspectscore=0 impostorscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409150159

From: Naveen N Rao <naveen@kernel.org>

Gcc v5.x emits a 3-instruction sequence for -mprofile-kernel:
	mflr	r0
	std	r0, 16(r1)
	bl	_mcount

Gcc v6.x moved to a simpler 2-instruction sequence by removing the 'std'
instruction. The store saved the return address in the LR save area in
the caller stack frame for stack unwinding. However, with dynamic
ftrace, we no longer have a call to _mcount on kernel boot when ftrace
is not enabled. When ftrace is enabled, that store is performed within
ftrace_caller(). As such, the additional 'std' instruction is redundant.
Nop it out on kernel boot.

With this change, we now use the same 2-instruction profiling sequence
with both -mprofile-kernel, as well as -fpatchable-function-entry on
64-bit powerpc.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/trace/ftrace.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index d8d6b4fd9a14..2ef504700e8d 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -246,8 +246,12 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 		/* Expected sequence: 'mflr r0', ['std r0,16(r1)'], 'bl _mcount' */
 		ret = ftrace_read_inst(ip - 4, &old);
 		if (!ret && !ppc_inst_equal(old, ppc_inst(PPC_RAW_MFLR(_R0)))) {
+			/* Gcc v5.x emit the additional 'std' instruction, gcc v6.x don't */
 			ret = ftrace_validate_inst(ip - 8, ppc_inst(PPC_RAW_MFLR(_R0)));
-			ret |= ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_STD(_R0, _R1, 16)));
+			if (ret)
+				return ret;
+			ret = ftrace_modify_code(ip - 4, ppc_inst(PPC_RAW_STD(_R0, _R1, 16)),
+						 ppc_inst(PPC_RAW_NOP()));
 		}
 	} else {
 		return -EINVAL;
-- 
2.46.0


