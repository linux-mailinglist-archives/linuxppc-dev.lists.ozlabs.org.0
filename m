Return-Path: <linuxppc-dev+bounces-16306-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMnuElJ8eGkFqQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16306-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 09:50:26 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EED991483
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 09:50:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0fHM1y3Qz3bf3;
	Tue, 27 Jan 2026 19:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769503807;
	cv=none; b=V2MehKj9o4f+yaurFc9j0ZCoYzyvdDJWpKWBGYhJPT3uCo7McqtSvg/8tRlO8TXDdqEKrS05RoNmQJ0+1J503gmmHJBFpLzqcOqKVPnH+7lVrXgaAc621sHrkwWNwc7I+Mxg/EXppbjSmeILFmswxMjRSoK8KoEy0//YpRQCEzoivKTA8kU4QV6Ecf/t0dZB5GsJdPpa+GzWIcP2wKQoHPWA1WIgNPvAAZjfJdYG8Imh7XLJ4abfZRhPr8eoLSn7nyfwXd7bzG6Vgjb/NatwOOK/ytMSoJfGQZRIylWpBAVblX0nuAmg6Ba2AbYEPblXqNUiLzX8Qwl42M4LHLF+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769503807; c=relaxed/relaxed;
	bh=bEj5aM+lZzWk0bTrpaGGzCGp/h1Ysv+ULdG/aMqq8co=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CWnX4JROMdCIUP2jdH2/rnsjBgEyXxBybQxyKG53F4ej5Yr78gHhre1+IYyE3AIJID+c8g1ftOZ9GcqhFCV3PI1iRXITutQmD9x+5pQ37I2Og92XH081qbef/HXcfVeB9eDfF8tfXG+5nuAFp4d74W4HpOzxyG9Y4ji7H8lZOr6xeaG67KsEa4BRcNxtrAWswjoLHwJ5ozJeRadPS0ZhFEo7PE9wPJZES9eRj58U+z0Cv+yAXMEmGYO3oxkO+tCBwsG9+kYBEscVNU1IXE82HVgOrDS8FZdt5KqFBSEC5/l1sLes7YlaBwe7ZoWXXAIGRiwwqTEQ++r2ciUxqlixJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GVaNyhUg; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GVaNyhUg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0fHK6ylVz3bfY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 19:50:05 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60R7Hl1O001272;
	Tue, 27 Jan 2026 08:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=bEj5aM+lZzWk0bTrp
	aGGzCGp/h1Ysv+ULdG/aMqq8co=; b=GVaNyhUg26N0yGmjhYbAV604soJjVS276
	PEjer5gkHbSZwo2jswfrF6mhIV8W7Uy9O5oh67RJzkgOSmcvKYTRy7Z1ZRBZsHrm
	J7TRussmZ9Z23gcqZdw1irk8b0JFCEcAzDeVfVlyPsDiprGfbRlminmDko44BpeG
	i9hemdn7DO7gCZVg1POAdTM0TfIPeK97dAhDAiZEEOESVFwHDqujjP83oEUFIBSO
	+ECYk2ueWbfqmwL8tvZfr7/r/9gFaEnnE4Eh3D4wa+rmlRvtjlPq6H85b/ZasKU0
	xiEhKyWffs6QqETyxYojh/YCOqcaHizcl6pcvOQESQ8WCHFehJLXA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvmgfturj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 08:49:42 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60R3vTZD023625;
	Tue, 27 Jan 2026 08:49:41 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bwamjqspd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 08:49:41 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60R8nbhN52232618
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jan 2026 08:49:37 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9488520040;
	Tue, 27 Jan 2026 08:49:37 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15AB020043;
	Tue, 27 Jan 2026 08:49:35 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.78.106.105])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 27 Jan 2026 08:49:34 +0000 (GMT)
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
Subject: [PATCH v2 3/3] powerpc64/ftrace: workaround clang recording GEP in __patchable_function_entries
Date: Tue, 27 Jan 2026 14:19:26 +0530
Message-ID: <20260127084926.34497-4-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127084926.34497-1-hbathini@linux.ibm.com>
References: <20260127084926.34497-1-hbathini@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Z4vh3XRA c=1 sm=1 tr=0 ts=69787c26 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VnNF1IyMAAAA:8
 a=uKwTeKIhWMlc50DrV6sA:9
X-Proofpoint-GUID: XjJsHACuOfQ2kOJ4PdFC9o8rVXYy91vQ
X-Proofpoint-ORIG-GUID: XjJsHACuOfQ2kOJ4PdFC9o8rVXYy91vQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA3MSBTYWx0ZWRfXzmDc5a26G4Mc
 47oy6Yrwkn8GtWf0J+FveLWe0ocrIFNm7DbFmSTvbbJzwh9npFskr+3EXi5KBuRfKJJfNEqzC6N
 45wDN9mjibC+AGPsLauvdRkjaZlOzP+IGUVQPJPFpkt5xZ8WVjQCYV/B63LRO+5kQhetEtf5l80
 mtE3PrsJGTfjSn98tQektnzePdRUp3YEjH750p1tL66vNTF+xHcyRHiQgzmRHh4IuAdjO0ZgW7B
 +Cu8ORwxShXW85NDyq2vKmtZ+tEAKOCFTotJx8EPbrcihA/0WAn9wJsMT1D1yFxVofpRLoD3RQQ
 P52FQ8yt+4OYYqbkgV5tDuVhyspSxNucSc4yUHwGvq6jwYt92bazzSmRDLMlh4CI/S8Sw+eBiTo
 62MhSueie0BQrTVRQ5VIrAUq7l5B79iBh7+3LPkgni/I2xU8xFvbR5/kvejKZefyw79gzB316x/
 Sd6cuWzwrbaOwCuegKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2601270071
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16306-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6EED991483
X-Rspamd-Action: no action

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

* No changes since v1.


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
2.52.0


