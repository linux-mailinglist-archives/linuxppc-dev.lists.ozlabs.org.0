Return-Path: <linuxppc-dev+bounces-16215-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJ/aHSsmc2kAswAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16215-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 08:41:31 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD54471E71
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 08:41:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy8xW2y4tz2yFj;
	Fri, 23 Jan 2026 18:41:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769154063;
	cv=none; b=L5cWnAS0XZy3NRyANykFd8Ji2PJGqbI7F1jm5EOGZuAgVZENpR3+9uN6oWP0S4j8QFBZJYcabVaWPfMm+B9F2xbnKW8ALH5ybIyH3FBvqKleichDhwCsdzvmbA+EvBG+IddKPGikf3oi4jqFNbmYPJSjj8VOUcyk1hmexRhVH+EtCNPAPgcD8z4p32j3pSxyW9Nu3R2x7LSL+kZeegtXtQJgDAKuyzu34VWO9yMIqK0DA5QykXjvPGHnRhh8jGwhtYdnEZU7J61CyR9Xx5tB67XDF4j0nYIomg5diYvrQcMuN1DqBTUubkAXuUpGwGhGUTSkYAuvMwNpHd176BPrZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769154063; c=relaxed/relaxed;
	bh=IlhhU0cb4Fdv+gXg8co9lSW2r2fccTJNCyp5vMf13YA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TkC6zeplifCfZ5HnTsu+VeCj3VArjk3Oe3V36YVovkG4/T+kwgLpW4kmBb5/4JN5XY6o5qgstP1n+ZHD1LB1NY7eQjKrP4cXBB7m73Wp9gRygDLmc58gdOMXj6Pv22EIpnu7Hu6RLzeqN4szNDhNc7Dup6HhvAtr+sggSS8IpDuWe0h+p/q2SGCR2wN4OKoDb1mulfMFLNo8XVWqjRgn1AqxxXnT3K1iTFrNa5nbayBKDKZ0dybInBdz9Xyr1+3gYBvswcz5YG7wDZQ+s2kGhoCDX7mklo0/WGeVw3Rj15Gvin52+u11czu/fRhmvPdQB611g7EAIWgtTaHNBWf4cQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HIgMr6CT; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HIgMr6CT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy8xV4TBCz3cH3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 18:41:02 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60N2K0nY019547;
	Fri, 23 Jan 2026 07:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=IlhhU0cb4Fdv+gXg8
	co9lSW2r2fccTJNCyp5vMf13YA=; b=HIgMr6CT0679rF0V6/vFsIpVZ7jTYSnG3
	zeW8oXvjkppZ+GoiwKFCAin9D+4W/5kuRdQdPs82H7DaVo+EQ2IzYXXbSu5ejYFv
	VEsE8uIMAAnT+36M3qi5p1QsoKjXE7UMXiF4CtO8bT0h3420fYrO7cZZqdShptf0
	DIyMIGyBYUCbyIKYpKXT/i7zQYSNYlUq5j7FspKQDhMEnCxjbuNw7n+xruIIEaRW
	YkK4LZbIN+UEDdyMQodVar3FsjEnWgyWsWDlWEFqqbS/pT0T25v/wNx/JDugi9kW
	l+A2JeU55xB34fvbzqReMC9U1nxrT87CjyQ5ctRaYDWqeKcPNhZsQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br256ekqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 07:40:38 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60N7drE5027568;
	Fri, 23 Jan 2026 07:40:37 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br256ekqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 07:40:37 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60N7NABv009295;
	Fri, 23 Jan 2026 07:40:36 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4brp8kqr7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 07:40:36 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60N7eVMq21430744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jan 2026 07:40:31 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EA382004D;
	Fri, 23 Jan 2026 07:40:31 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CFCA62004B;
	Fri, 23 Jan 2026 07:40:25 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com (unknown [9.124.222.171])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Jan 2026 07:40:25 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, ryabinin.a.a@gmail.com, glider@google.com,
        andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
        oleg@redhat.com, kees@kernel.org, luto@amacapital.net,
        wad@chromium.org, mchauras@linux.ibm.com, thuth@redhat.com,
        ruanjinjie@huawei.com, sshegde@linux.ibm.com,
        akpm@linux-foundation.org, charlie@rivosinc.com, deller@gmx.de,
        ldv@strace.io, macro@orcam.me.uk, segher@kernel.crashing.org,
        peterz@infradead.org, bigeasy@linutronix.de, namcao@linutronix.de,
        tglx@linutronix.de, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com
Cc: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
Subject: [PATCH v4 8/8] powerpc: Remove unused functions
Date: Fri, 23 Jan 2026 13:09:16 +0530
Message-ID: <20260123073916.956498-9-mkchauras@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123073916.956498-1-mkchauras@linux.ibm.com>
References: <20260123073916.956498-1-mkchauras@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NSBTYWx0ZWRfXzzrPNlJhGXXG
 Co2qnPmR6w2vVtcO/PlnjEHBu9bKZbbcwYWffuEVIMQGGpTL975dO641e9V8uEVUYQ+a5RKucGM
 9cufkwmt0hJc2J/w/a6JUBhBpGa5/JixM4FzAnEROFP9cynR2Tv+xCQU5yh9eGi2QFfpEZgN57q
 4migjSyywZZ+JET8w1x6eDwom7LE88ypDE1mq7oT3VPAvz3s9mlXdQl808nEa3dHt/HCfMaOF6m
 d9SlGDf/0A/HNPypSOZNWZlZT3AAW4nC2HK9tjIQli6+0gDwAT52bUP09cL5TgK4FBLvlRt8BEs
 mIFZ3SAkA6N+MBsYFapFuhyEnDjmHU5Cv4DHRTXbVRooV6ZHeFGCbFkyO4mnbAIcxjhgp/3PCaX
 NEC30SUUr/KR1ZG9BJQTzn6XqOQuVFLHgv31MQWerAnDf7JdOckVkJw7JfuFus02uFr9CEUptT8
 zKhfOmJ16w5+EUAvoyA==
X-Authority-Analysis: v=2.4 cv=BpSQAIX5 c=1 sm=1 tr=0 ts=697325f6 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=AFa1QFvt9TWlA0SYsw8A:9
X-Proofpoint-GUID: feRwsJYaDZwxBi4REYl-ZlIgPycVI7x7
X-Proofpoint-ORIG-GUID: PqIqB-LCbf289i_ierjyWMgG2aDTUzPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601230055
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16215-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:oleg@redhat.com,m:kees@kernel.org,m:luto@amacapital.net,m:wad@chromium.org,m:mchauras@linux.ibm.com,m:thuth@redhat.com,m:ruanjinjie@huawei.com,m:sshegde@linux.ibm.com,m:akpm@linux-foundation.org,m:charlie@rivosinc.com,m:deller@gmx.de,m:ldv@strace.io,m:macro@orcam.me.uk,m:segher@kernel.crashing.org,m:peterz@infradead.org,m:bigeasy@linutronix.de,m:namcao@linutronix.de,m:tglx@linutronix.de,m:mark.barnett@arm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:mkchauras@linux.ibm.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mkchauras@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,google.com,arm.com,redhat.com,amacapital.net,chromium.org,huawei.com,linux-foundation.org,rivosinc.com,gmx.de,strace.io,orcam.me.uk,kernel.crashing.org,infradead.org,linutronix.de,lists.ozlabs.org,vger.kernel.org,googlegroups.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.855];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid]
X-Rspamd-Queue-Id: CD54471E71
X-Rspamd-Action: no action

After enabling GENERIC_ENTRY some functions are left unused.
Cleanup all those functions which includes:
 - do_syscall_trace_enter
 - do_syscall_trace_leave
 - do_notify_resume
 - do_seccomp

Signed-off-by: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
---
 arch/powerpc/include/asm/ptrace.h   |   3 -
 arch/powerpc/include/asm/signal.h   |   1 -
 arch/powerpc/kernel/ptrace/ptrace.c | 138 ----------------------------
 arch/powerpc/kernel/signal.c        |  17 ----
 4 files changed, 159 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 2e741ea57b80..fdeb97421785 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -177,9 +177,6 @@ extern unsigned long profile_pc(struct pt_regs *regs);
 #define profile_pc(regs) instruction_pointer(regs)
 #endif
 
-long do_syscall_trace_enter(struct pt_regs *regs);
-void do_syscall_trace_leave(struct pt_regs *regs);
-
 static inline void set_return_regs_changed(void)
 {
 #ifdef CONFIG_PPC_BOOK3S_64
diff --git a/arch/powerpc/include/asm/signal.h b/arch/powerpc/include/asm/signal.h
index 922d43700fb4..21af92cdb237 100644
--- a/arch/powerpc/include/asm/signal.h
+++ b/arch/powerpc/include/asm/signal.h
@@ -7,7 +7,6 @@
 #include <uapi/asm/ptrace.h>
 
 struct pt_regs;
-void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags);
 
 unsigned long get_min_sigframe_size_32(void);
 unsigned long get_min_sigframe_size_64(void);
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index f006a03a0211..316d4f5ead8e 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -192,144 +192,6 @@ long arch_ptrace(struct task_struct *child, long request,
 	return ret;
 }
 
-#ifdef CONFIG_SECCOMP
-static int do_seccomp(struct pt_regs *regs)
-{
-	if (!test_thread_flag(TIF_SECCOMP))
-		return 0;
-
-	/*
-	 * The ABI we present to seccomp tracers is that r3 contains
-	 * the syscall return value and orig_gpr3 contains the first
-	 * syscall parameter. This is different to the ptrace ABI where
-	 * both r3 and orig_gpr3 contain the first syscall parameter.
-	 */
-	regs->gpr[3] = -ENOSYS;
-
-	/*
-	 * We use the __ version here because we have already checked
-	 * TIF_SECCOMP. If this fails, there is nothing left to do, we
-	 * have already loaded -ENOSYS into r3, or seccomp has put
-	 * something else in r3 (via SECCOMP_RET_ERRNO/TRACE).
-	 */
-	if (__secure_computing())
-		return -1;
-
-	/*
-	 * The syscall was allowed by seccomp, restore the register
-	 * state to what audit expects.
-	 * Note that we use orig_gpr3, which means a seccomp tracer can
-	 * modify the first syscall parameter (in orig_gpr3) and also
-	 * allow the syscall to proceed.
-	 */
-	regs->gpr[3] = regs->orig_gpr3;
-
-	return 0;
-}
-#else
-static inline int do_seccomp(struct pt_regs *regs) { return 0; }
-#endif /* CONFIG_SECCOMP */
-
-/**
- * do_syscall_trace_enter() - Do syscall tracing on kernel entry.
- * @regs: the pt_regs of the task to trace (current)
- *
- * Performs various types of tracing on syscall entry. This includes seccomp,
- * ptrace, syscall tracepoints and audit.
- *
- * The pt_regs are potentially visible to userspace via ptrace, so their
- * contents is ABI.
- *
- * One or more of the tracers may modify the contents of pt_regs, in particular
- * to modify arguments or even the syscall number itself.
- *
- * It's also possible that a tracer can choose to reject the system call. In
- * that case this function will return an illegal syscall number, and will put
- * an appropriate return value in regs->r3.
- *
- * Return: the (possibly changed) syscall number.
- */
-long do_syscall_trace_enter(struct pt_regs *regs)
-{
-	u32 flags;
-
-	flags = read_thread_flags() & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE);
-
-	if (flags) {
-		int rc = ptrace_report_syscall_entry(regs);
-
-		if (unlikely(flags & _TIF_SYSCALL_EMU)) {
-			/*
-			 * A nonzero return code from
-			 * ptrace_report_syscall_entry() tells us to prevent
-			 * the syscall execution, but we are not going to
-			 * execute it anyway.
-			 *
-			 * Returning -1 will skip the syscall execution. We want
-			 * to avoid clobbering any registers, so we don't goto
-			 * the skip label below.
-			 */
-			return -1;
-		}
-
-		if (rc) {
-			/*
-			 * The tracer decided to abort the syscall. Note that
-			 * the tracer may also just change regs->gpr[0] to an
-			 * invalid syscall number, that is handled below on the
-			 * exit path.
-			 */
-			goto skip;
-		}
-	}
-
-	/* Run seccomp after ptrace; allow it to set gpr[3]. */
-	if (do_seccomp(regs))
-		return -1;
-
-	/* Avoid trace and audit when syscall is invalid. */
-	if (regs->gpr[0] >= NR_syscalls)
-		goto skip;
-
-	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
-		trace_sys_enter(regs, regs->gpr[0]);
-
-	if (!is_32bit_task())
-		audit_syscall_entry(regs->gpr[0], regs->gpr[3], regs->gpr[4],
-				    regs->gpr[5], regs->gpr[6]);
-	else
-		audit_syscall_entry(regs->gpr[0],
-				    regs->gpr[3] & 0xffffffff,
-				    regs->gpr[4] & 0xffffffff,
-				    regs->gpr[5] & 0xffffffff,
-				    regs->gpr[6] & 0xffffffff);
-
-	/* Return the possibly modified but valid syscall number */
-	return regs->gpr[0];
-
-skip:
-	/*
-	 * If we are aborting explicitly, or if the syscall number is
-	 * now invalid, set the return value to -ENOSYS.
-	 */
-	regs->gpr[3] = -ENOSYS;
-	return -1;
-}
-
-void do_syscall_trace_leave(struct pt_regs *regs)
-{
-	int step;
-
-	audit_syscall_exit(regs);
-
-	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
-		trace_sys_exit(regs, regs->result);
-
-	step = test_thread_flag(TIF_SINGLESTEP);
-	if (step || test_thread_flag(TIF_SYSCALL_TRACE))
-		ptrace_report_syscall_exit(regs, step);
-}
-
 void __init pt_regs_check(void);
 
 /*
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index 9f1847b4742e..bb42a8b6c642 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -293,23 +293,6 @@ static void do_signal(struct task_struct *tsk)
 	signal_setup_done(ret, &ksig, test_thread_flag(TIF_SINGLESTEP));
 }
 
-void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags)
-{
-	if (thread_info_flags & _TIF_UPROBE)
-		uprobe_notify_resume(regs);
-
-	if (thread_info_flags & _TIF_PATCH_PENDING)
-		klp_update_patch_state(current);
-
-	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL)) {
-		BUG_ON(regs != current->thread.regs);
-		do_signal(current);
-	}
-
-	if (thread_info_flags & _TIF_NOTIFY_RESUME)
-		resume_user_mode_work(regs);
-}
-
 static unsigned long get_tm_stackpointer(struct task_struct *tsk)
 {
 	/* When in an active transaction that takes a signal, we need to be
-- 
2.52.0


