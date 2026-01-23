Return-Path: <linuxppc-dev+bounces-16213-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP8eMRcmc2nCsgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16213-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 08:41:11 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E0F71E44
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 08:41:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy8xM0CSnz3cBx;
	Fri, 23 Jan 2026 18:40:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769154054;
	cv=none; b=ZfJkyzJ8WaSCdAh/08pt0cPNXbvnbGL7onK9I7KIWscEop085Bz/YVO+Khr6X4XHdtZ9q9qNw+7gvr405N9aA1EWAC4iQf6Gttt2whM5Yfgjru43CHkjk/hm61Po1m1cxagj4nbXNa66JEfZbDt7j276t91mq0Hf/Kh9Mjw3DiCaubiMEOletgR3mpaL7xArNL33UyIxJrKdzC71b7w5lfzePNdiHbXZLnVJbFwITp7Uj7MEYLukiedkTyTh9mBCrLsJZ6heewrfXJPqTdJQ3nA08cKiFHrZ9gjelte5LhGdRnMsEpsfO3n09/yaOfJ9Jc/EZTTqWpd4gqIrBltkwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769154054; c=relaxed/relaxed;
	bh=J/EE/DYnX6Bhj4nfQ3fbkX6rrIqmphYbY+E23N5Zjp0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nzzh7L6SBwGqOzXG01PGwPigKMVpmtr3ois3Oksca9RBQcuHPwiJViYjMAvAT80ui7/MCGjXG2MsMnVA8d5s3svhENeXOGUONnRMkbVTxWFGk8cPgr8JT9otN/lI10OeqMs7sUsCLWBmH9uU7z8XAKtuEXAxucKK6aLdtJIlOO/QwdVgGOH6WD5aB1+1j9K6t3L2OzWYieJaYITTU0cOkliScd+TpYZpBnISJaap9lEItC9dvI0vOX4YPqjpTbMpt28hws/aq7eaLEE8EvYwTcaZ8eVb/2B9khcVQC8wgPL8+LJE8+UsJVjlHAiGl5DZ+qrP/H7Euv5+WnVdtr8uBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GZsYDl6c; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GZsYDl6c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy8xL1N2kz2yFW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 18:40:54 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60N0cpKK028538;
	Fri, 23 Jan 2026 07:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=J/EE/DYnX6Bhj4nfQ
	3fbkX6rrIqmphYbY+E23N5Zjp0=; b=GZsYDl6crpiYc2hnL3d0kNn6Dztnkq7bR
	MVR2HzjEhgF+egHmvYA9HLFEDDwIGyEqKOGqmAbdPN5JV2Bz0NK8VaIuNG0WEpAY
	jM+j3GPfklweFpXrrMATZgGVzHd+5XzM9ta4ViP6M7pQXT7cWVd0YGM401pQIBeC
	Mq4JGGKbHn/UWhGp+s0rs+JzNPPLwQC9fwn1RXJUxo1RjSTlb/4GnQsinzDakuXC
	h3zet8lQiu5J34/5ytDQPTX1MXVUAfHB92liB9do+hdxvhzsG6ZDrmcF9I9VW93R
	LxONXiQvoNDzPFkaY5B8ttz8VJpaW0SjarcP097jLGsLKlIMVBguw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bt60f274g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 07:40:25 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60N7YZ3O006421;
	Fri, 23 Jan 2026 07:40:24 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bt60f274b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 07:40:24 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60N7Txxu006424;
	Fri, 23 Jan 2026 07:40:23 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4brqf1yg0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 07:40:23 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60N7eJd843057516
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jan 2026 07:40:19 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45CE12004F;
	Fri, 23 Jan 2026 07:40:19 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D917A2004B;
	Fri, 23 Jan 2026 07:40:13 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com (unknown [9.124.222.171])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Jan 2026 07:40:13 +0000 (GMT)
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
Subject: [PATCH v4 6/8] powerpc: Prepare for IRQ entry exit
Date: Fri, 23 Jan 2026 13:09:14 +0530
Message-ID: <20260123073916.956498-7-mkchauras@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=WMdyn3sR c=1 sm=1 tr=0 ts=697325e9 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=785Y-I4ahskik1WtazUA:9
X-Proofpoint-GUID: jSLJ0Tzgr6rqp0yXsErN0PGrr2jKZ3B0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NSBTYWx0ZWRfX5EohOX9silAG
 2vfsT/NyKBXIdYRSRgQRo8Uk7yCN7dkFVlC8lyKd197OWdGlYX3Wte+z3KV/nHpNolY4w9VLUDJ
 /Q2Hp6vpiC0xVssfAzgLnuvUtFFeBWVQ98ShRN7i6A4zlhWArakW7/2/iElQ7wy2MwGq8JSxyIn
 tdNtTf+aU/35QwnRRsNjQHe0ZgIAgnV06CaglIX+NsMquoUJl0PiY51xMxrrScyJecIeJTRrqby
 KV64aZID6f1ZlDS8nPfnv0GnMsWq+QCDlADuiwOhcxodNMuHur+A81Phf7xKXRDs0HCuSOjz16e
 6riu5f+WQmitYGMWuk3wp17I02iiN65mUJe1B8/Ahmg0L3xAidu4UxwpfzJdUBUEpwdnAqDKYvX
 pUj4m8gl0vW3kkFPhfZ6qBzEGWUyaKKvMK+RjheSzR0rMuRTb9l5IAwuRBqztW0tDdgm61j9TSs
 2yzhV3G1kZmdX0crBSw==
X-Proofpoint-ORIG-GUID: VAsOwozJyxy0Nbi8NtZYWxzaxDzQFd2U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:oleg@redhat.com,m:kees@kernel.org,m:luto@amacapital.net,m:wad@chromium.org,m:mchauras@linux.ibm.com,m:thuth@redhat.com,m:ruanjinjie@huawei.com,m:sshegde@linux.ibm.com,m:akpm@linux-foundation.org,m:charlie@rivosinc.com,m:deller@gmx.de,m:ldv@strace.io,m:macro@orcam.me.uk,m:segher@kernel.crashing.org,m:peterz@infradead.org,m:bigeasy@linutronix.de,m:namcao@linutronix.de,m:tglx@linutronix.de,m:mark.barnett@arm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,google.com,arm.com,redhat.com,amacapital.net,chromium.org,huawei.com,linux-foundation.org,rivosinc.com,gmx.de,strace.io,orcam.me.uk,kernel.crashing.org,infradead.org,linutronix.de,lists.ozlabs.org,vger.kernel.org,googlegroups.com];
	FORGED_SENDER(0.00)[mkchauras@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16213-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	RCVD_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-0.848];
	RCPT_COUNT_TWELVE(0.00)[31];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid]
X-Rspamd-Queue-Id: F1E0F71E44
X-Rspamd-Action: no action

From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>

Move interrupt entry and exit helper routines from interrupt.h into the
PowerPC-specific entry-common.h header as a preparatory step for enabling
the generic entry/exit framework.

This consolidation places all PowerPC interrupt entry/exit handling in a
single common header, aligning with the generic entry infrastructure.
The helpers provide architecture-specific handling for interrupt and NMI
entry/exit sequences, including:

 - arch_interrupt_enter/exit_prepare()
 - arch_interrupt_async_enter/exit_prepare()
 - arch_interrupt_nmi_enter/exit_prepare()
 - Supporting helpers such as nap_adjust_return(), check_return_regs_valid(),
   debug register maintenance, and soft mask handling.

The functions are copied verbatim from interrupt.h.Subsequent patches will
integrate these routines into the generic entry/exit flow.

No functional change intended.

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/include/asm/entry-common.h | 358 ++++++++++++++++++++++++
 1 file changed, 358 insertions(+)

diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
index ff0625e04778..de5601282755 100644
--- a/arch/powerpc/include/asm/entry-common.h
+++ b/arch/powerpc/include/asm/entry-common.h
@@ -5,10 +5,75 @@
 
 #include <asm/cputime.h>
 #include <asm/interrupt.h>
+#include <asm/runlatch.h>
 #include <asm/stacktrace.h>
 #include <asm/switch_to.h>
 #include <asm/tm.h>
 
+#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
+/*
+ * WARN/BUG is handled with a program interrupt so minimise checks here to
+ * avoid recursion and maximise the chance of getting the first oops handled.
+ */
+#define INT_SOFT_MASK_BUG_ON(regs, cond)				\
+do {									\
+	if ((user_mode(regs) || (TRAP(regs) != INTERRUPT_PROGRAM)))	\
+		BUG_ON(cond);						\
+} while (0)
+#else
+#define INT_SOFT_MASK_BUG_ON(regs, cond)
+#endif
+
+#ifdef CONFIG_PPC_BOOK3S_64
+extern char __end_soft_masked[];
+bool search_kernel_soft_mask_table(unsigned long addr);
+unsigned long search_kernel_restart_table(unsigned long addr);
+
+DECLARE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
+
+static inline bool is_implicit_soft_masked(struct pt_regs *regs)
+{
+	if (user_mode(regs))
+		return false;
+
+	if (regs->nip >= (unsigned long)__end_soft_masked)
+		return false;
+
+	return search_kernel_soft_mask_table(regs->nip);
+}
+
+static inline void srr_regs_clobbered(void)
+{
+	local_paca->srr_valid = 0;
+	local_paca->hsrr_valid = 0;
+}
+#else
+static inline unsigned long search_kernel_restart_table(unsigned long addr)
+{
+	return 0;
+}
+
+static inline bool is_implicit_soft_masked(struct pt_regs *regs)
+{
+	return false;
+}
+
+static inline void srr_regs_clobbered(void)
+{
+}
+#endif
+
+static inline void nap_adjust_return(struct pt_regs *regs)
+{
+#ifdef CONFIG_PPC_970_NAP
+	if (unlikely(test_thread_local_flags(_TLF_NAPPING))) {
+		/* Can avoid a test-and-clear because NMIs do not call this */
+		clear_thread_local_flags(_TLF_NAPPING);
+		regs_set_return_ip(regs, (unsigned long)power4_idle_nap_return);
+	}
+#endif
+}
+
 static __always_inline void booke_load_dbcr0(void)
 {
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
@@ -31,6 +96,299 @@ static __always_inline void booke_load_dbcr0(void)
 #endif
 }
 
+static inline void booke_restore_dbcr0(void)
+{
+#ifdef CONFIG_PPC_ADV_DEBUG_REGS
+	unsigned long dbcr0 = current->thread.debug.dbcr0;
+
+	if (IS_ENABLED(CONFIG_PPC32) && unlikely(dbcr0 & DBCR0_IDM)) {
+		mtspr(SPRN_DBSR, -1);
+		mtspr(SPRN_DBCR0, global_dbcr0[smp_processor_id()]);
+	}
+#endif
+}
+
+static inline void check_return_regs_valid(struct pt_regs *regs)
+{
+#ifdef CONFIG_PPC_BOOK3S_64
+	unsigned long trap, srr0, srr1;
+	static bool warned;
+	u8 *validp;
+	char *h;
+
+	if (trap_is_scv(regs))
+		return;
+
+	trap = TRAP(regs);
+	// EE in HV mode sets HSRRs like 0xea0
+	if (cpu_has_feature(CPU_FTR_HVMODE) && trap == INTERRUPT_EXTERNAL)
+		trap = 0xea0;
+
+	switch (trap) {
+	case 0x980:
+	case INTERRUPT_H_DATA_STORAGE:
+	case 0xe20:
+	case 0xe40:
+	case INTERRUPT_HMI:
+	case 0xe80:
+	case 0xea0:
+	case INTERRUPT_H_FAC_UNAVAIL:
+	case 0x1200:
+	case 0x1500:
+	case 0x1600:
+	case 0x1800:
+		validp = &local_paca->hsrr_valid;
+		if (!READ_ONCE(*validp))
+			return;
+
+		srr0 = mfspr(SPRN_HSRR0);
+		srr1 = mfspr(SPRN_HSRR1);
+		h = "H";
+
+		break;
+	default:
+		validp = &local_paca->srr_valid;
+		if (!READ_ONCE(*validp))
+			return;
+
+		srr0 = mfspr(SPRN_SRR0);
+		srr1 = mfspr(SPRN_SRR1);
+		h = "";
+		break;
+	}
+
+	if (srr0 == regs->nip && srr1 == regs->msr)
+		return;
+
+	/*
+	 * A NMI / soft-NMI interrupt may have come in after we found
+	 * srr_valid and before the SRRs are loaded. The interrupt then
+	 * comes in and clobbers SRRs and clears srr_valid. Then we load
+	 * the SRRs here and test them above and find they don't match.
+	 *
+	 * Test validity again after that, to catch such false positives.
+	 *
+	 * This test in general will have some window for false negatives
+	 * and may not catch and fix all such cases if an NMI comes in
+	 * later and clobbers SRRs without clearing srr_valid, but hopefully
+	 * such things will get caught most of the time, statistically
+	 * enough to be able to get a warning out.
+	 */
+	if (!READ_ONCE(*validp))
+		return;
+
+	if (!data_race(warned)) {
+		data_race(warned = true);
+		pr_warn("%sSRR0 was: %lx should be: %lx\n", h, srr0, regs->nip);
+		pr_warn("%sSRR1 was: %lx should be: %lx\n", h, srr1, regs->msr);
+		show_regs(regs);
+	}
+
+	WRITE_ONCE(*validp, 0); /* fixup */
+#endif
+}
+
+static inline void arch_interrupt_enter_prepare(struct pt_regs *regs)
+{
+#ifdef CONFIG_PPC64
+	irq_soft_mask_set(IRQS_ALL_DISABLED);
+
+	/*
+	 * If the interrupt was taken with HARD_DIS clear, then enable MSR[EE].
+	 * Asynchronous interrupts get here with HARD_DIS set (see below), so
+	 * this enables MSR[EE] for synchronous interrupts. IRQs remain
+	 * soft-masked. The interrupt handler may later call
+	 * interrupt_cond_local_irq_enable() to achieve a regular process
+	 * context.
+	 */
+	if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS)) {
+		INT_SOFT_MASK_BUG_ON(regs, !(regs->msr & MSR_EE));
+		__hard_irq_enable();
+	} else {
+		__hard_RI_enable();
+	}
+	/* Enable MSR[RI] early, to support kernel SLB and hash faults */
+#endif
+
+	if (!regs_irqs_disabled(regs))
+		trace_hardirqs_off();
+
+	if (user_mode(regs)) {
+		kuap_lock();
+		account_cpu_user_entry();
+		account_stolen_time();
+	} else {
+		kuap_save_and_lock(regs);
+		/*
+		 * CT_WARN_ON comes here via program_check_exception,
+		 * so avoid recursion.
+		 */
+		if (TRAP(regs) != INTERRUPT_PROGRAM)
+			CT_WARN_ON(ct_state() != CT_STATE_KERNEL &&
+				   ct_state() != CT_STATE_IDLE);
+		INT_SOFT_MASK_BUG_ON(regs, is_implicit_soft_masked(regs));
+		INT_SOFT_MASK_BUG_ON(regs, regs_irqs_disabled(regs) &&
+				     search_kernel_restart_table(regs->nip));
+	}
+	INT_SOFT_MASK_BUG_ON(regs, !regs_irqs_disabled(regs) &&
+			     !(regs->msr & MSR_EE));
+
+	booke_restore_dbcr0();
+}
+
+/*
+ * Care should be taken to note that arch_interrupt_exit_prepare and
+ * arch_interrupt_async_exit_prepare do not necessarily return immediately to
+ * regs context (e.g., if regs is usermode, we don't necessarily return to
+ * user mode). Other interrupts might be taken between here and return,
+ * context switch / preemption may occur in the exit path after this, or a
+ * signal may be delivered, etc.
+ *
+ * The real interrupt exit code is platform specific, e.g.,
+ * interrupt_exit_user_prepare / interrupt_exit_kernel_prepare for 64s.
+ *
+ * However arch_interrupt_nmi_exit_prepare does return directly to regs, because
+ * NMIs do not do "exit work" or replay soft-masked interrupts.
+ */
+static inline void arch_interrupt_exit_prepare(struct pt_regs *regs)
+{
+	if (user_mode(regs)) {
+		BUG_ON(regs_is_unrecoverable(regs));
+		BUG_ON(regs_irqs_disabled(regs));
+		/*
+		 * We don't need to restore AMR on the way back to userspace for KUAP.
+		 * AMR can only have been unlocked if we interrupted the kernel.
+		 */
+		kuap_assert_locked();
+
+		local_irq_disable();
+	}
+}
+
+static inline void arch_interrupt_async_enter_prepare(struct pt_regs *regs)
+{
+#ifdef CONFIG_PPC64
+	/* Ensure arch_interrupt_enter_prepare does not enable MSR[EE] */
+	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+#endif
+	arch_interrupt_enter_prepare(regs);
+#ifdef CONFIG_PPC_BOOK3S_64
+	/*
+	 * RI=1 is set by arch_interrupt_enter_prepare, so this thread flags access
+	 * has to come afterward (it can cause SLB faults).
+	 */
+	if (cpu_has_feature(CPU_FTR_CTRL) &&
+	    !test_thread_local_flags(_TLF_RUNLATCH))
+		__ppc64_runlatch_on();
+#endif
+}
+
+static inline void arch_interrupt_async_exit_prepare(struct pt_regs *regs)
+{
+	/*
+	 * Adjust at exit so the main handler sees the true NIA. This must
+	 * come before irq_exit() because irq_exit can enable interrupts, and
+	 * if another interrupt is taken before nap_adjust_return has run
+	 * here, then that interrupt would return directly to idle nap return.
+	 */
+	nap_adjust_return(regs);
+
+	arch_interrupt_exit_prepare(regs);
+}
+
+struct interrupt_nmi_state {
+#ifdef CONFIG_PPC64
+	u8 irq_soft_mask;
+	u8 irq_happened;
+	u8 ftrace_enabled;
+	u64 softe;
+#endif
+};
+
+static inline bool nmi_disables_ftrace(struct pt_regs *regs)
+{
+	/* Allow DEC and PMI to be traced when they are soft-NMI */
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64)) {
+		if (TRAP(regs) == INTERRUPT_DECREMENTER)
+			return false;
+		if (TRAP(regs) == INTERRUPT_PERFMON)
+			return false;
+	}
+	if (IS_ENABLED(CONFIG_PPC_BOOK3E_64)) {
+		if (TRAP(regs) == INTERRUPT_PERFMON)
+			return false;
+	}
+
+	return true;
+}
+
+static inline void arch_interrupt_nmi_enter_prepare(struct pt_regs *regs,
+						    struct interrupt_nmi_state *state)
+{
+#ifdef CONFIG_PPC64
+	state->irq_soft_mask = local_paca->irq_soft_mask;
+	state->irq_happened = local_paca->irq_happened;
+	state->softe = regs->softe;
+
+	/*
+	 * Set IRQS_ALL_DISABLED unconditionally so irqs_disabled() does
+	 * the right thing, and set IRQ_HARD_DIS. We do not want to reconcile
+	 * because that goes through irq tracing which we don't want in NMI.
+	 */
+	local_paca->irq_soft_mask = IRQS_ALL_DISABLED;
+	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+
+	if (!(regs->msr & MSR_EE) || is_implicit_soft_masked(regs)) {
+		/*
+		 * Adjust regs->softe to be soft-masked if it had not been
+		 * reconcied (e.g., interrupt entry with MSR[EE]=0 but softe
+		 * not yet set disabled), or if it was in an implicit soft
+		 * masked state. This makes regs_irqs_disabled(regs)
+		 * behave as expected.
+		 */
+		regs->softe = IRQS_ALL_DISABLED;
+	}
+
+	__hard_RI_enable();
+
+	/* Don't do any per-CPU operations until interrupt state is fixed */
+
+	if (nmi_disables_ftrace(regs)) {
+		state->ftrace_enabled = this_cpu_get_ftrace_enabled();
+		this_cpu_set_ftrace_enabled(0);
+	}
+#endif
+}
+
+static inline void arch_interrupt_nmi_exit_prepare(struct pt_regs *regs,
+						   struct interrupt_nmi_state *state)
+{
+	/*
+	 * nmi does not call nap_adjust_return because nmi should not create
+	 * new work to do (must use irq_work for that).
+	 */
+
+#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3S
+	if (regs_irqs_disabled(regs)) {
+		unsigned long rst = search_kernel_restart_table(regs->nip);
+
+		if (rst)
+			regs_set_return_ip(regs, rst);
+	}
+#endif
+
+	if (nmi_disables_ftrace(regs))
+		this_cpu_set_ftrace_enabled(state->ftrace_enabled);
+
+	/* Check we didn't change the pending interrupt mask. */
+	WARN_ON_ONCE((state->irq_happened | PACA_IRQ_HARD_DIS) != local_paca->irq_happened);
+	regs->softe = state->softe;
+	local_paca->irq_happened = state->irq_happened;
+	local_paca->irq_soft_mask = state->irq_soft_mask;
+#endif
+}
+
 static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
 {
 	kuap_lock();
-- 
2.52.0


