Return-Path: <linuxppc-dev+bounces-2702-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 841319B5C55
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 08:10:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XddY21WkFz2yZZ;
	Wed, 30 Oct 2024 18:09:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730272182;
	cv=none; b=UcgaUDMHlMnTXQPH7Hk2VzaPXniNeWIuhzuQbay0w49jYBVPaUg9Z6gY7f5aSuWLYotTcEjsZxJRtYdyz0rQdIPRliMThF3gfg7VT9yQtJmEp0I01sLo0TJbfYoa5BOX7ZHbGzEzrivlV4co1PJjiAvBhxL9njofiFbwSCoyhSDeJ5ITcr6h3x0SxXuKCtX4+qEbADP2zvZFUsVYprmZtI2Tj5OKZwCbqFcWnp4rgGihJAndViiwQNWaWKZeYdVhgzE337xu37Imwq8A16ddIOsZN2DGkNwMxbsHKc2ZTsRi1yjgWsMhyFiN9S4qJZe74tyvS4YD6yI4Wpv8/zmFgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730272182; c=relaxed/relaxed;
	bh=NBCz3KcpjPp2NZk6QkJH2AEFQre7Vj8TAQLOxgPmAFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bd2dQcKt8yp1rVZvRqSmn+CEwy8IMYhGlDzhKSr52s6X6FP4TatbvMvEKju2Lrj9MTFji/5R2RrygXF83SjLMi40p9mCdcmWp+UWxvlYYgc4Db2ugZMIZsg4HtgA/KvtyBdv375ah3GJXu7ewktvACOlOLl5eW2A+z+Jly3NAhOGMHbHSJwjCZ5wpZ3gMccMBIct4bdB6h1KnHvAnfGtV1z2eI+UsnwCq48a9sfHUpbjgwdrdjND+fgt0NcmIBJYtQrosocTp8xRP2YTI5dQji+I9nplQvJC/1YVTcXjlD1+BoS+ukPG2YhmwaO7/OoqsDaMDJzGvwLjymTAZX0Eeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DMe3xRrI; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DMe3xRrI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XddY1129jz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 18:09:40 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U2d3BE024043;
	Wed, 30 Oct 2024 07:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=NBCz3KcpjPp2NZk6Q
	kJH2AEFQre7Vj8TAQLOxgPmAFI=; b=DMe3xRrIog+pq4x9QG+06M2qVOt+FN+Ie
	1zVd1VKqCKgPt0LHxueJ5aX7n8mgYvZheI2MZJA7Ky0pGLLHV0IqjP326/yXUzHc
	+za+dD6CtcfXiyHgiOapI+UJl51EbyNs9V6+wP7TkJ7w1w49S1hsg7TdnPyMM8iJ
	RRuBXpZ5ymX5JYq45Zy2xzY0lJWT0rwoNqpiDJzJFG6Z2u/7GY/q9+upx6iPaAkC
	LemG6hWKwBLnLrhQIAtWldHxwLf2mDp4bGnx/SwPnAa8mDKpMtYWTr79nxpDBDd4
	lzazZvf56+jF8Wjx0IEM7L+Jjo3AJxZS329uJdC7daRBU1JlkhXsQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42jyhbmb76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:09:12 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49U79CBV004738;
	Wed, 30 Oct 2024 07:09:12 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42jyhbmb73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:09:12 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49U3A8oB013670;
	Wed, 30 Oct 2024 07:09:11 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42hbrmxw55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:09:11 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49U797PR28902076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Oct 2024 07:09:07 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A2F22004D;
	Wed, 30 Oct 2024 07:09:07 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C08F920043;
	Wed, 30 Oct 2024 07:09:03 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.203.115.143])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Oct 2024 07:09:03 +0000 (GMT)
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
Subject: [PATCH v7 03/17] powerpc64/ftrace: Nop out additional 'std' instruction emitted by gcc v5.x
Date: Wed, 30 Oct 2024 12:38:36 +0530
Message-ID: <20241030070850.1361304-4-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030070850.1361304-1-hbathini@linux.ibm.com>
References: <20241030070850.1361304-1-hbathini@linux.ibm.com>
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
X-Proofpoint-GUID: qgy0KvjTxbxMRpmk5MFbntDDAWjfDqT_
X-Proofpoint-ORIG-GUID: 9AYLyruOn_3zT9wtyLDntWCorkdG9MXp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 phishscore=0 impostorscore=0 mlxlogscore=941 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300051
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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
2.47.0


