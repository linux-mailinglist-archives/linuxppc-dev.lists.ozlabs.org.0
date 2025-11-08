Return-Path: <linuxppc-dev+bounces-13971-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED844C434D6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 08 Nov 2025 22:05:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3pMx4kNhz3cmx;
	Sun,  9 Nov 2025 08:04:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762635885;
	cv=none; b=l/fBIOpBNvEpk9+70GPmVRNbjAF2+gbwgqahz7NGa2NExyKRDiuupg9HMXqv3SXwaaQ4m9iunRHIlbDNc/CtFrqR55mFvgYSD6XKB6gQVCB6chXINi4Ya5eEHdMak3PZbXpM1Bx6EfIaqihmc1/vn4ZB8KBGLOfvBWFFDP1LgFlXEfRhjIWfF4lhWDKqlw9zIiMt7/WSzff+Qh1BWbBr3zaLzNez+OmoGj3oLgPtXZICl8Fo8cmGmoX6LEXkEzLGXnbs5k9mfxQOKKbkAUdnYnCw47ok4ybYoEkYcEfs38gMZTauNdrHV/hgvdE+uYEL7PAFwf0OKGop2PUoQZpIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762635885; c=relaxed/relaxed;
	bh=Y1o7d8KX6kEyfP7tdI/GLX9b840ZIGw1rB6f48rK6+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SezRt2eu+oPcPp1DrZ+OKCAdmu2dc1SkfccPhXyhB4OMl6AkQ9ijkJGlCnHFVltYmiRMGde/ZvjF1mMzlwDHdEq+6cyffc+6jJ1nGf8kz09ykDXc0QUH2J0b6EGvXaqhFfcNrU0MXSLnGy0WvBJUGB47GQhbc6KT24mLhLPn85OAxbTNtdmIyGoujHQxH/I4Yhb9mQTVeX/M7mNT/KVxlHGNmDdTEqFI69qhNcRAxSOTYN8W+wxYTJ8+T7oYi14A4xdxUSjnAArIhS0A2mLWkqNkN7by99ESOOiPFR4MY9db39r3rh+MRJrqlHcAqB8zVVVpO9HWobZYYGSUbFAtlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oeQWBgRR; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oeQWBgRR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d3pMx0H5mz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Nov 2025 08:04:44 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A8AjQnJ006045;
	Sat, 8 Nov 2025 21:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Y1o7d8KX6kEyfP7td
	I/GLX9b840ZIGw1rB6f48rK6+Y=; b=oeQWBgRRhTQpcWeUUGBl3NrrZHg4BYit/
	QfUddLnpISX05RK9YFgwCW9zSSQk+qzzcwGXaA7kb9Gqyvl41DdpTR+yVyzYMvm8
	hA8qh3jBGK0o6z8NryuyQMoCPJ+XGDYtMsMHJR0Hbsf2VcUFVEDNU2g07Gpm56RW
	PE1mDapU1X/vd7LivmeMdFYXQK1/i/y+ae13YuxzIEhdLFqLl34kX6HAeOOBUKrp
	pg3JHgEt91cqmZIz0HSVcQvPbIocSrqcATcBPQgAYHuHjRQRKjmaar+H+d8dF1ka
	j4DEtdJHl/1vLG13TGYIZdp10MclBd9i1ZQH6CTAJfB2Z1Mzlgung==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wk7tf5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Nov 2025 21:04:22 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A8INrFd021463;
	Sat, 8 Nov 2025 21:04:21 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5xrk8720-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Nov 2025 21:04:21 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A8L4HYv28770802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 8 Nov 2025 21:04:17 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A82BE20040;
	Sat,  8 Nov 2025 21:04:17 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4795120043;
	Sat,  8 Nov 2025 21:04:15 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.99.186])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  8 Nov 2025 21:04:15 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Naveen N. Rao" <naveen@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-trace-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>, llvm@lists.linux.dev,
        Maryam Moghadas <maryammo@ca.ibm.com>
Subject: [PATCH 3/3] powerpc64/ftrace: workaround clang recording GEP in __patchable_function_entries
Date: Sun,  9 Nov 2025 02:34:05 +0530
Message-ID: <20251108210405.2375472-4-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251108210405.2375472-1-hbathini@linux.ibm.com>
References: <20251108210405.2375472-1-hbathini@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAyMiBTYWx0ZWRfX4r5TgbFscT+s
 AhQPdF0ER1WQcySkAABHIDfD/bfdCqRuX0/IlfsgvljSo51LjqxYhi2U8/TW11rMTTwjDR+sxp1
 dgIqKARBZWNGcwt9bUKPpksYCKabQyBb8d34cdLQ79lN7/sLowzdkjFu2Dk6RZat46ivbpZmmBP
 SUWIdYwrSuu31UzyefMNk23xOjzKrwlbyMwktTUllwDgUzd6v38eovIYIOUqhrCtu/gDewXf3so
 a+10mci9ez7KQlK5mdIbU6oZdVmiVSZdSlrR5kJ/fQn8lVPZZ5udAnMSJy+dUwIiGkxLGCE+EgD
 td5F8Tq4iZfvVAvwlA25ia6zwvqk4IkFvLZaSw5/Zfkxy8t1qtzwjvlKbstlSeDw6pStem+xOji
 wvqv20BEdyBKXJ3HNpLRUo4e7LMTEA==
X-Authority-Analysis: v=2.4 cv=ZK3aWH7b c=1 sm=1 tr=0 ts=690fb056 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VnNF1IyMAAAA:8
 a=uKwTeKIhWMlc50DrV6sA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: C-Gva_oMsG4iLO6A8gtCmy71qa3B5KjZ
X-Proofpoint-GUID: C-Gva_oMsG4iLO6A8gtCmy71qa3B5KjZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511080022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Support for -fpatchable-function-entry on ppc64le was added in Clang
with [1]. However, when no prefix NOPs are specified - as is the case
with CONFIG_PPC_FTRACE_OUT_OF_LINE - the first NOP is emitted at LEP,
but Clang records the Global Entry Point (GEP) unlike GCC which does
record the Local Entry Point (LEP). Issue [2] has been raised to align
Clang's behavior with GCC. As a temporary workaround to ensure ftrace
initialization works as expected with Clang, derive the LEP using
ppc_function_entry() for kernel symbols and by looking for the below
module GEP sequence for module addresses, until [2] is resolved:

	ld	r2, -8(r12)
	add	r2, r2, r12

[1] https://github.com/llvm/llvm-project/pull/151569
[2] https://github.com/llvm/llvm-project/issues/163706

Cc: Maryam Moghadas <maryammo@ca.ibm.com>
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/trace/ftrace.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 841d077e2825..1b2f293e7dcb 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -37,11 +37,29 @@ unsigned long ftrace_call_adjust(unsigned long addr)
 	if (addr >= (unsigned long)__exittext_begin && addr < (unsigned long)__exittext_end)
 		return 0;
 
-	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY) &&
-	    !IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE)) {
-		addr += MCOUNT_INSN_SIZE;
-		if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS))
+	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY)) {
+		if (!IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE)) {
 			addr += MCOUNT_INSN_SIZE;
+			if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS))
+				addr += MCOUNT_INSN_SIZE;
+		} else if (IS_ENABLED(CONFIG_CC_IS_CLANG) && IS_ENABLED(CONFIG_PPC64)) {
+			/*
+			 * addr points to global entry point though the NOP was emitted at local
+			 * entry point due to https://github.com/llvm/llvm-project/issues/163706
+			 * Handle that here with ppc_function_entry() for kernel symbols while
+			 * adjusting module addresses in the else case, by looking for the below
+			 * module global entry point sequence:
+			 *	ld    r2, -8(r12)
+			 *	add   r2, r2, r12
+			 */
+			if (is_kernel_text(addr) || is_kernel_inittext(addr))
+				addr = ppc_function_entry((void *)addr);
+			else if ((ppc_inst_val(ppc_inst_read((u32 *)addr)) ==
+				  PPC_RAW_LD(_R2, _R12, -8)) &&
+				 (ppc_inst_val(ppc_inst_read((u32 *)(addr+4))) ==
+				  PPC_RAW_ADD(_R2, _R2, _R12)))
+				addr += 8;
+		}
 	}
 
 	return addr;
-- 
2.51.1


