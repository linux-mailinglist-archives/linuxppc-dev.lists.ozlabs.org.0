Return-Path: <linuxppc-dev+bounces-2396-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C32479A44DC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 19:37:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVX2q03yhz3c13;
	Sat, 19 Oct 2024 04:37:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729273042;
	cv=none; b=BtTl0MuWaBjL0CvG6mx5U/QgZ9/zlb8Rb7AQyk8w4ICjwmO5L2hu1aFIdZn/hDDPGACnmnZkbUU2tkrBifzpsIMWO0yT39XFxdmWs/Ohy5Ti4hVUWfhIbBpxazkvKLIz+/5PO24cMOLiaD9EQJwQXwYnUDcw6Y9lUR0bA7CzXU2FbIQjF9DDwRmQ5iZzKMBvWNRI8Ombj7tc/996k5cwB6hJtlnZnnbAwYiUQKet1wWjRz0uz0JU4RnSphVt3RMmHKieM8KLgL0EcfyMNbHaT/iYacB9lhRCr4uuwnIITu2Pexb/0n/AUh/5uJzryBDoIZS4QIpezdFrHk85ul+K1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729273042; c=relaxed/relaxed;
	bh=s0FRCiVrpvEhkqmossaMa+/8pdEQ0r3/FwKVmEn10sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=icW7yC2tslweYwWRNL7XvWfH3IQYDYcgyHuGYNa0l7QgQTiFKycD86p9ghxKrBgNefgAU2MZe1SFyYEYzfTbOIyoio3LZWXR9r8Y6RDMS5Ri0Uvo3l4cDBfMPecmmXES2IeFxzC2Ov2zYk/Gh1VC56xN0fomIxVIjB3MSvfyi5Mz+EP4kyW5F3tXg5OSmiN/8eM0dedKo1x1r1iU1EknBY3EX5lx0fpCXO98rZambBpyPSlg9xjGitnYoEVo+MaMlO5iXTwESXKDsuriTZFXLlMt+2EnSaqZwsejyRFIccwkKrPeqVgPZEjAsnSjECyYSSK7/MUU2Vi4tBsRJ9Y7nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=irDz35dm; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=irDz35dm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVX2n6PXcz3c0H
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 04:37:21 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I9lo9m008102;
	Fri, 18 Oct 2024 17:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=s0FRCiVrpvEhkqmos
	saMa+/8pdEQ0r3/FwKVmEn10sc=; b=irDz35dmdMv18xTHQ6/b+OYhjOR/z2mJM
	MJ7Ud2bO4ywVt4D/x94Lc1Qm6ScJh+eHcOIxu3YFSmCXHQweMaS4geYnNzBlHPMT
	mumfaChrujD90Y30eFL1bxhquW8iE7FmJ7dw0YxZVS848nfGVyFsWs2fI70o90uX
	qpIK+7lSahXtQhE3hBijqdi1SZp+61gPwG/SEPyPGOvx/dAfL+ckwGpDyEB2JpRc
	kcHPzNs22iEDX+otDxecRMeqKYbeyeFoGbqly76a1ePMqjHVrNoBCastEvhhuhEP
	6OxEmz+zH2ghVeFTDhZL6rCVm3OxCx3L/SeOKOIoT/m1uMtoH2qTA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42as8aa274-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:37:00 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49IHb08u011544;
	Fri, 18 Oct 2024 17:37:00 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42as8aa26w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:37:00 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49IF0Shb006757;
	Fri, 18 Oct 2024 17:36:59 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4284xknurs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:36:59 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49IHatGQ39584066
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Oct 2024 17:36:55 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B719020043;
	Fri, 18 Oct 2024 17:36:55 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9EBFB20040;
	Fri, 18 Oct 2024 17:36:51 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.99.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Oct 2024 17:36:51 +0000 (GMT)
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
Subject: [PATCH v6 04/17] powerpc32/ftrace: Unify 32-bit and 64-bit ftrace entry code
Date: Fri, 18 Oct 2024 23:06:19 +0530
Message-ID: <20241018173632.277333-5-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018173632.277333-1-hbathini@linux.ibm.com>
References: <20241018173632.277333-1-hbathini@linux.ibm.com>
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
X-Proofpoint-GUID: 8TEt5P_BR_tEhgERfgAfUtj09TS_ZnVo
X-Proofpoint-ORIG-GUID: sHcwMwaMmyu_9Y5NJ9s8Gr3A5XxspGpc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180111
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Naveen N Rao <naveen@kernel.org>

On 32-bit powerpc, gcc generates a three instruction sequence for
function profiling:
	mflr	r0
	stw	r0, 4(r1)
	bl	_mcount

On kernel boot, the call to _mcount() is nop-ed out, to be patched back
in when ftrace is actually enabled. The 'stw' instruction therefore is
not necessary unless ftrace is enabled. Nop it out during ftrace init.

When ftrace is enabled, we want the 'stw' so that stack unwinding works
properly. Perform the same within the ftrace handler, similar to 64-bit
powerpc.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/trace/ftrace.c       | 6 ++++--
 arch/powerpc/kernel/trace/ftrace_entry.S | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 2ef504700e8d..8c3e523e4f96 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -240,8 +240,10 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 	} else if (IS_ENABLED(CONFIG_PPC32)) {
 		/* Expected sequence: 'mflr r0', 'stw r0,4(r1)', 'bl _mcount' */
 		ret = ftrace_validate_inst(ip - 8, ppc_inst(PPC_RAW_MFLR(_R0)));
-		if (!ret)
-			ret = ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_STW(_R0, _R1, 4)));
+		if (ret)
+			return ret;
+		ret = ftrace_modify_code(ip - 4, ppc_inst(PPC_RAW_STW(_R0, _R1, 4)),
+					 ppc_inst(PPC_RAW_NOP()));
 	} else if (IS_ENABLED(CONFIG_MPROFILE_KERNEL)) {
 		/* Expected sequence: 'mflr r0', ['std r0,16(r1)'], 'bl _mcount' */
 		ret = ftrace_read_inst(ip - 4, &old);
diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
index 76dbe9fd2c0f..244a1c7bb1e8 100644
--- a/arch/powerpc/kernel/trace/ftrace_entry.S
+++ b/arch/powerpc/kernel/trace/ftrace_entry.S
@@ -33,6 +33,8 @@
  * and then arrange for the ftrace function to be called.
  */
 .macro	ftrace_regs_entry allregs
+	/* Save the original return address in A's stack frame */
+	PPC_STL		r0, LRSAVE(r1)
 	/* Create a minimal stack frame for representing B */
 	PPC_STLU	r1, -STACK_FRAME_MIN_SIZE(r1)
 
@@ -44,8 +46,6 @@
 	SAVE_GPRS(3, 10, r1)
 
 #ifdef CONFIG_PPC64
-	/* Save the original return address in A's stack frame */
-	std	r0, LRSAVE+SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE(r1)
 	/* Ok to continue? */
 	lbz	r3, PACA_FTRACE_ENABLED(r13)
 	cmpdi	r3, 0
-- 
2.47.0


