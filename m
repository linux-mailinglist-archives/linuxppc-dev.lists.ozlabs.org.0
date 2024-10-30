Return-Path: <linuxppc-dev+bounces-2701-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7475A9B5C51
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 08:09:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XddXz24SWz2xb3;
	Wed, 30 Oct 2024 18:09:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730272179;
	cv=none; b=jJ9YRBF/PghdTZaEXcXRlFMEQG+ety7CYwcsWMYZl7dovTzrylXb5nghNHDUmAFB0ANrUmf94ZaEqhwCoR38p4nqeR+V4eG0bQrDslPYmbrYbKCGZNPLDYsvGsFIm2gWipKcJHmNQ96PnGvXpT0mqlTJd4l7GoUzZcQ+wVwPLOhs3KTwjG/oz9lGSn2HT+DoF2+nfspsEIg82/KOjBSk0Z+JCvP25uTbyLzOfHL4KKKDsEdbiVR2g1UQPVrW8dCEj4yUkP5WI9ph7IUeZh/kUfMeoV7eGZlnsldkeRFyWLIOeV3BLSOT537l7OIP4VIYT2c5JuSPVjA4IyML99tnvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730272179; c=relaxed/relaxed;
	bh=oL9IMEzVW/uiWNE331Qsj0y4/iuYLMGRaqR2BGXECGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fiz6637N6helL/VW1KGHplMNbw29pQyXv4szCrp/PbtQqw0WVi/nPQx6c0+isC11tiC2v+h7jeQnQW36Yq0aI79AgFQXw3ozARyvQM6uZ5ksF5wKkZ3pOGbYa9zfI6Qrf/6N1L2PLNF1f7YbrD96COIOU7xEnOyZxL542Ml0FOSnQ3H5kmhOF2WEsRDc9yNZCd0KxRg23Ik3Ky1b4tmEha3s19LtubzzEZVIgFQKr0C+Z5aLFT1BlTAvENyhigyS2RvZ/yZcqJh9AY1NBh3BFKYfyJHEve9gFah8+WrCZCPodoQ9QIrmGI185ZjFRPnWp0i0iZnSnGPaZPbSd9IP5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lrn6f135; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lrn6f135;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XddXy3b1mz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 18:09:38 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U2d29c030010;
	Wed, 30 Oct 2024 07:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=oL9IMEzVW/uiWNE33
	1Qsj0y4/iuYLMGRaqR2BGXECGI=; b=Lrn6f135qZGb11qXPP5MRudo6VaFLMRQP
	lWvCw31lmcd3JSqUaMEo81t6+f/q4J6UKtOJL7MxZD8lIclefRFgBEThJh5/hjU7
	hUo/LfI3aAoUTkEypJ6HIuXnTgJiBY8za1ZPOM2I6RBEw1c0iyZHGue25Cezc8O1
	pMkh7WYGmufZRpnXd3alQCr1175cc9UCpLUzazkqp6wmfz+UkRsNHua3/eOjB6J0
	OhWNF5036CO+1Vb6o4OFGH7M+tsw58HeDL3MSxdVnQl1e6XJCvM3GG/J7LPr9991
	UBcBNtmZ4wmykEgEydyUXKtS2fG8NVJ29hYy9EK/G80gwUR5MBUfA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42js0h740v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:09:05 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49U795G6031625;
	Wed, 30 Oct 2024 07:09:05 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42js0h740s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:09:05 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49U2vX0s013585;
	Wed, 30 Oct 2024 07:09:03 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42hbrmxw4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:09:03 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49U78xdY52298166
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Oct 2024 07:08:59 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C84DA2004B;
	Wed, 30 Oct 2024 07:08:59 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5217E20043;
	Wed, 30 Oct 2024 07:08:56 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.203.115.143])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Oct 2024 07:08:56 +0000 (GMT)
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
Subject: [PATCH v7 01/17] powerpc/trace: Account for -fpatchable-function-entry support by toolchain
Date: Wed, 30 Oct 2024 12:38:34 +0530
Message-ID: <20241030070850.1361304-2-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030070850.1361304-1-hbathini@linux.ibm.com>
References: <20241030070850.1361304-1-hbathini@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0OC-NmdUTamivNefnDzh0-_LPMbwNn1b
X-Proofpoint-ORIG-GUID: hWLytIU6_ef5XItE7c12_4Pod4JJcyUz
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
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
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1011 mlxlogscore=999
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300051
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


