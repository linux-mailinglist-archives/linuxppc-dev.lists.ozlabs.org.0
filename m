Return-Path: <linuxppc-dev+bounces-949-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F310096B23E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 09:00:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzD0L4RfPz2xTR;
	Wed,  4 Sep 2024 17:00:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725433234;
	cv=none; b=gdJdKQ2cfWkeQeL/k7tUeuKbD02YToHhZCE8NAhcKmcHUTE++3vDJ8r9/5IP16YwhVX14C/cMegJwF0SyuFd8WU4C0tLoRCGJujq8AJwIh2/JkqMuloxC0NbmO0kmeUAZ/pNFopsVfJ2ht812sfVuwbJwIsGafHlqBJ7ixmcrrgSXiS6G0DpnLvCNk3TLMg983z23FlAOhh4iusH8O2fXl66E5OMhFAMMFlZZtpatDBObF8gZgmSHRUc3wKpj5piPi03U9jof3dXmQqJho8cOg3gT0YzG7QbUYeb2H1Kq3/SlO3aScKUdWsQGO667vUOqrRxw2KDZNBfRVCHfFOM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725433234; c=relaxed/relaxed;
	bh=folkEIJqstNzu7lwREFA/To2vbOIgoI9Y7HXfVt2L+U=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=FyeE3hiZp0a56V4/rCqkzM4FfQBosHQdH4JleswqUZnJxgsnlYN2onVUaNPWoVR5dRLqCclkhwy+pwnxDh5cf0WVPvUhv/UBDOc8vFkr6uxb1HH4n1eWVuZWnOiGk8NKAIee8FP1kjkPrxk72/z140KvvsmM+F+7eAtJrjnF+JdHxaWSW9jbzyBbHQR0oVgqArwENzdUjsOWen1dNsbPrthrZu2FW+FSihNsfIY344U+8iHcer2H4hbnes+bwOzGl8poYgvX/j7m/8z7Dq98VGpDvM9R58zoytCVuxAXBRyvZ/q2jCsTtR0s75R5YHYXjvdPh5Acao08Apd1bwl+UA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lE0LMpjq; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=svens@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lE0LMpjq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=svens@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzD0K6Bnhz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 17:00:33 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4846HBfX016570;
	Wed, 4 Sep 2024 06:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=folkEIJqstNzu
	7lwREFA/To2vbOIgoI9Y7HXfVt2L+U=; b=lE0LMpjqff+1mmFkHrSz4fklZ5X+5
	iBqjQRbetoP8n+C+7ngNmnp+awphLL0vlg84xB25xHnDJ2f66lwui/k2DAtlNNg/
	P91ynPjf8WHxkt5Z7IRFm+5IAkLz7u+ADKaknng+M/flQ6Dr+T+2PLif7E3UNOv1
	IfzQ+CrYh88BCVLi1OL88XCywOiH6Cs2Vnt2XZ+scTsDa7YYPYmQ1psJ7KcN0tmY
	o5EpEgn16MpCatVoZWMrwUl1CCpujfbpbX839/a05o5v3dleyO2mQ9yJZBh38WaL
	FXFHPty7ghqYDiPxbGrYtFxyhRW8hF451vjRrMOsjpOuKux3F5cSMfYHw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41btp9hn91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 06:59:24 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4846xNXk004735;
	Wed, 4 Sep 2024 06:59:23 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41btp9hn8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 06:59:23 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48430pfD000413;
	Wed, 4 Sep 2024 06:59:21 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 41cdgupq5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 06:59:21 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4846xHm534931168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Sep 2024 06:59:18 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC49C20043;
	Wed,  4 Sep 2024 06:59:17 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A500320040;
	Wed,  4 Sep 2024 06:59:17 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  4 Sep 2024 06:59:17 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55390)
	id 7AC54E0297; Wed,  4 Sep 2024 08:59:17 +0200 (CEST)
From: Sven Schnelle <svens@linux.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
Subject: [PATCH 1/7] tracing: add ftrace_regs to function_graph_enter()
Date: Wed,  4 Sep 2024 08:58:55 +0200
Message-ID: <20240904065908.1009086-2-svens@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904065908.1009086-1-svens@linux.ibm.com>
References: <20240904065908.1009086-1-svens@linux.ibm.com>
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
X-Proofpoint-GUID: 4SIE32AwU4OcPAwAEJmTo-vtL9wXompT
X-Proofpoint-ORIG-GUID: 562DU-xMxw4EVrNelRokSilhcXaDg0Dm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_04,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 malwarescore=0 mlxlogscore=861 adultscore=0 mlxscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040049

Will be used later for showing function arguments in the function
graph tracer.

Signed-off-by: Sven Schnelle <svens@linux.ibm.com>
---
 arch/arm/kernel/ftrace.c           | 2 +-
 arch/arm64/kernel/ftrace.c         | 2 +-
 arch/csky/kernel/ftrace.c          | 2 +-
 arch/loongarch/kernel/ftrace.c     | 2 +-
 arch/loongarch/kernel/ftrace_dyn.c | 2 +-
 arch/microblaze/kernel/ftrace.c    | 2 +-
 arch/mips/kernel/ftrace.c          | 2 +-
 arch/parisc/kernel/ftrace.c        | 2 +-
 arch/powerpc/kernel/trace/ftrace.c | 2 +-
 arch/riscv/kernel/ftrace.c         | 2 +-
 arch/s390/kernel/ftrace.c          | 2 +-
 arch/sh/kernel/ftrace.c            | 2 +-
 arch/sparc/kernel/ftrace.c         | 2 +-
 arch/x86/kernel/ftrace.c           | 2 +-
 include/linux/ftrace.h             | 3 ++-
 kernel/trace/fgraph.c              | 3 ++-
 16 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/arch/arm/kernel/ftrace.c b/arch/arm/kernel/ftrace.c
index e61591f33a6c..1f8802439e34 100644
--- a/arch/arm/kernel/ftrace.c
+++ b/arch/arm/kernel/ftrace.c
@@ -267,7 +267,7 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
 	old = *parent;
 	*parent = return_hooker;
 
-	if (function_graph_enter(old, self_addr, frame_pointer, NULL))
+	if (function_graph_enter(old, self_addr, frame_pointer, NULL, NULL))
 		*parent = old;
 }
 
diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
index a650f5e11fc5..686fbebb0432 100644
--- a/arch/arm64/kernel/ftrace.c
+++ b/arch/arm64/kernel/ftrace.c
@@ -472,7 +472,7 @@ void prepare_ftrace_return(unsigned long self_addr, unsigned long *parent,
 	old = *parent;
 
 	if (!function_graph_enter(old, self_addr, frame_pointer,
-	    (void *)frame_pointer)) {
+	    (void *)frame_pointer, NULL)) {
 		*parent = return_hooker;
 	}
 }
diff --git a/arch/csky/kernel/ftrace.c b/arch/csky/kernel/ftrace.c
index 50bfcf129078..c12af268c1cb 100644
--- a/arch/csky/kernel/ftrace.c
+++ b/arch/csky/kernel/ftrace.c
@@ -156,7 +156,7 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
 	old = *parent;
 
 	if (!function_graph_enter(old, self_addr,
-			*(unsigned long *)frame_pointer, parent)) {
+			*(unsigned long *)frame_pointer, parent, NULL)) {
 		/*
 		 * For csky-gcc function has sub-call:
 		 * subi	sp,	sp, 8
diff --git a/arch/loongarch/kernel/ftrace.c b/arch/loongarch/kernel/ftrace.c
index 8c3ec1bc7aad..43d908b01718 100644
--- a/arch/loongarch/kernel/ftrace.c
+++ b/arch/loongarch/kernel/ftrace.c
@@ -61,7 +61,7 @@ void prepare_ftrace_return(unsigned long self_addr,
 	if (ftrace_get_parent_ra_addr(self_addr, &ra_off))
 		goto out;
 
-	if (!function_graph_enter(old, self_addr, 0, NULL))
+	if (!function_graph_enter(old, self_addr, 0, NULL, NULL))
 		*(unsigned long *)(callsite_sp + ra_off) = return_hooker;
 
 	return;
diff --git a/arch/loongarch/kernel/ftrace_dyn.c b/arch/loongarch/kernel/ftrace_dyn.c
index bff058317062..eab16231d09d 100644
--- a/arch/loongarch/kernel/ftrace_dyn.c
+++ b/arch/loongarch/kernel/ftrace_dyn.c
@@ -233,7 +233,7 @@ void prepare_ftrace_return(unsigned long self_addr, unsigned long *parent)
 
 	old = *parent;
 
-	if (!function_graph_enter(old, self_addr, 0, parent))
+	if (!function_graph_enter(old, self_addr, 0, parent, NULL))
 		*parent = return_hooker;
 }
 
diff --git a/arch/microblaze/kernel/ftrace.c b/arch/microblaze/kernel/ftrace.c
index 188749d62709..009800d7e54f 100644
--- a/arch/microblaze/kernel/ftrace.c
+++ b/arch/microblaze/kernel/ftrace.c
@@ -62,7 +62,7 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr)
 		return;
 	}
 
-	if (function_graph_enter(old, self_addr, 0, NULL))
+	if (function_graph_enter(old, self_addr, 0, NULL, NULL))
 		*parent = old;
 }
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
diff --git a/arch/mips/kernel/ftrace.c b/arch/mips/kernel/ftrace.c
index 8c401e42301c..65f29de35a59 100644
--- a/arch/mips/kernel/ftrace.c
+++ b/arch/mips/kernel/ftrace.c
@@ -362,7 +362,7 @@ void prepare_ftrace_return(unsigned long *parent_ra_addr, unsigned long self_ra,
 	insns = core_kernel_text(self_ra) ? 2 : MCOUNT_OFFSET_INSNS + 1;
 	self_ra -= (MCOUNT_INSN_SIZE * insns);
 
-	if (function_graph_enter(old_parent_ra, self_ra, fp, NULL))
+	if (function_graph_enter(old_parent_ra, self_ra, fp, NULL, NULL))
 		*parent_ra_addr = old_parent_ra;
 	return;
 out:
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index c91f9c2e61ed..c8d926f057a6 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -45,7 +45,7 @@ static void __hot prepare_ftrace_return(unsigned long *parent,
 
 	old = *parent;
 
-	if (!function_graph_enter(old, self_addr, 0, NULL))
+	if (!function_graph_enter(old, self_addr, 0, NULL, NULL))
 		/* activate parisc_return_to_handler() as return point */
 		*parent = (unsigned long) &parisc_return_to_handler;
 }
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index d8d6b4fd9a14..8a24d6eabb64 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -434,7 +434,7 @@ void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
 	if (bit < 0)
 		goto out;
 
-	if (!function_graph_enter(parent_ip, ip, 0, (unsigned long *)sp))
+	if (!function_graph_enter(parent_ip, ip, 0, (unsigned long *)sp, NULL))
 		parent_ip = ppc_function_entry(return_to_handler);
 
 	ftrace_test_recursion_unlock(bit);
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 4b95c574fd04..b45985265b29 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -205,7 +205,7 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
 	 */
 	old = *parent;
 
-	if (!function_graph_enter(old, self_addr, frame_pointer, parent))
+	if (!function_graph_enter(old, self_addr, frame_pointer, parent, NULL))
 		*parent = return_hooker;
 }
 
diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
index 0b6e62d1d8b8..cf9ee90ae216 100644
--- a/arch/s390/kernel/ftrace.c
+++ b/arch/s390/kernel/ftrace.c
@@ -273,7 +273,7 @@ unsigned long prepare_ftrace_return(unsigned long ra, unsigned long sp,
 	if (unlikely(atomic_read(&current->tracing_graph_pause)))
 		goto out;
 	ip -= MCOUNT_INSN_SIZE;
-	if (!function_graph_enter(ra, ip, 0, (void *) sp))
+	if (!function_graph_enter(ra, ip, 0, (void *) sp, NULL))
 		ra = (unsigned long) return_to_handler;
 out:
 	return ra;
diff --git a/arch/sh/kernel/ftrace.c b/arch/sh/kernel/ftrace.c
index 930001bb8c6a..a9a0a1238214 100644
--- a/arch/sh/kernel/ftrace.c
+++ b/arch/sh/kernel/ftrace.c
@@ -359,7 +359,7 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr)
 		return;
 	}
 
-	if (function_graph_enter(old, self_addr, 0, NULL))
+	if (function_graph_enter(old, self_addr, 0, NULL, NULL))
 		__raw_writel(old, parent);
 }
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
diff --git a/arch/sparc/kernel/ftrace.c b/arch/sparc/kernel/ftrace.c
index eaead3da8e03..9ad77a2d9bc4 100644
--- a/arch/sparc/kernel/ftrace.c
+++ b/arch/sparc/kernel/ftrace.c
@@ -125,7 +125,7 @@ unsigned long prepare_ftrace_return(unsigned long parent,
 	if (unlikely(atomic_read(&current->tracing_graph_pause)))
 		return parent + 8UL;
 
-	if (function_graph_enter(parent, self_addr, frame_pointer, NULL))
+	if (function_graph_enter(parent, self_addr, frame_pointer, NULL, NULL))
 		return parent + 8UL;
 
 	return return_hooker;
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 8da0e66ca22d..b325f7e7e39a 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -637,7 +637,7 @@ void prepare_ftrace_return(unsigned long ip, unsigned long *parent,
 	if (bit < 0)
 		return;
 
-	if (!function_graph_enter(*parent, ip, frame_pointer, parent))
+	if (!function_graph_enter(*parent, ip, frame_pointer, parent, NULL))
 		*parent = return_hooker;
 
 	ftrace_test_recursion_unlock(bit);
diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index fd5e84d0ec47..56d91041ecd2 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -1083,7 +1083,8 @@ extern void return_to_handler(void);
 
 extern int
 function_graph_enter(unsigned long ret, unsigned long func,
-		     unsigned long frame_pointer, unsigned long *retp);
+		     unsigned long frame_pointer, unsigned long *retp,
+		     struct ftrace_regs *fregs);
 
 struct ftrace_ret_stack *
 ftrace_graph_get_ret_stack(struct task_struct *task, int skip);
diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index d1d5ea2d0a1b..fa62ebfa0711 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -613,7 +613,8 @@ ftrace_push_return_trace(unsigned long ret, unsigned long func,
 
 /* If the caller does not use ftrace, call this function. */
 int function_graph_enter(unsigned long ret, unsigned long func,
-			 unsigned long frame_pointer, unsigned long *retp)
+			 unsigned long frame_pointer, unsigned long *retp,
+			struct ftrace_regs *fregs)
 {
 	struct ftrace_graph_ent trace;
 	unsigned long bitmap = 0;
-- 
2.43.0


