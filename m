Return-Path: <linuxppc-dev+bounces-15082-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2841CE5ED9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Dec 2025 05:56:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfkSg3qJtz2yQH;
	Mon, 29 Dec 2025 15:56:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766984163;
	cv=none; b=hk9QATXq+Jmt7Q7UxBB7ZZCQhWFV7h4OUiNX+mMRlNylbhKsfuR5lwAGbp3QXhhpzf7gnjmzrMLmX/fBZvbXY32KDKgw2yAxhlKP5QADbyRAOe/Nsw4YwB1fPHjUTtmf7vzWFfYLdPLxqNmmL67XtsxmQ/IHKssr8ep61btleLj9sH6iSBm2IAGcBXJnkGVySks7UmGZi4OsfSVDGHCiHLgOQahIkWsstGN+zFXM+TrlF4VxavdRYp0SyszjuZFR/IbySDeBp5Ogy3ysP56r7J1It8pHv/43BDGqlqBJZnvWm0kIe3HSvAqNvywr0/csZIWHLUtoydJFBYJgLGHBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766984163; c=relaxed/relaxed;
	bh=B96eqxBiTo98pHzqabXyu4MFkhh6JhjrUmi6hCNa5VE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZSYTaqGZ7vY9TeSb43sGxY4zWzM05VDYaU6d6Aq3haZiRwt8U7fRy/sDc5qevvgcSAadVIinmkZeX6lF1fzv6TTeb/V0plwyKAxBgkXZqGsW7SG6ie2d1h6j6DmDHjxNdUhR4mXzP8kwnsrWwVZLNFVwvvX0JlXO7fXeEcm07xrElP8ixpld0IBFTjjcqRcZrADmGPr3QXQuN8MyuhM4NW/p3K9ubhyWy01W6FrARMZz0k4W6YdJokIS+GCyXEwAGW+a9x6O7WHCWtQ5Nb8sFIrfm9kxJVLhNhMqsDP0JVmamvkyt13YI1k7433HkLvn7ugYkuKd7+toeIDZaoxz9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XjLRTiqK; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XjLRTiqK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfkSf4w2sz2yPM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Dec 2025 15:56:02 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BSJgewM020179;
	Mon, 29 Dec 2025 04:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=B96eqxBiTo98pHzqa
	bXyu4MFkhh6JhjrUmi6hCNa5VE=; b=XjLRTiqKSG+pM6Xzk45VNNlfuT1Kdn3Y/
	4LztczxAZaOBTstwGI1h/JjU2IDaXgjjhYsoFMf4i4W+22V7YfbF5G8r0xC+IGBF
	O7CxSEDRlK2gaP9ZDQZyzIobTjVVF4Kz00I7cf+EzEBitlNKmF/0QAcZIH5m7ty2
	JJhMbjr/73laW/iTvgqcqiq+H99K9RKmJxJOHxb7t8fEKSKRY37G2o2eEhTevRdw
	/4/gp5OlUj7JABGCit2Bk1KqAw1rfvAiGLMcU8cudY2a1PlmxXsp7hf/NoJh/fVQ
	Ci2yomO3HvyK2wejv7GHfp4k7LzVQzHxjLq5IHocL+ePn6OpxefQw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba764nrvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:30 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BT4nCEw023463;
	Mon, 29 Dec 2025 04:55:29 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba764nrvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:29 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BT3tlgY003059;
	Mon, 29 Dec 2025 04:55:28 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bavg1kq03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:28 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BT4tPB543581898
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Dec 2025 04:55:25 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14FA220040;
	Mon, 29 Dec 2025 04:55:25 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE1612004D;
	Mon, 29 Dec 2025 04:55:19 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com (unknown [9.39.24.235])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Dec 2025 04:55:19 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, sshegde@linux.ibm.com, akpm@linux-foundation.org,
        macro@orcam.me.uk, deller@gmx.de, ldv@strace.io, charlie@rivosinc.com,
        segher@kernel.crashing.org, bigeasy@linutronix.de,
        peterz@infradead.org, namcao@linutronix.de, tglx@linutronix.de,
        kan.liang@linux.intel.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/8] powerpc: add exit_flags field in pt_regs
Date: Mon, 29 Dec 2025 10:24:13 +0530
Message-ID: <20251229045416.3193779-6-mkchauras@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229045416.3193779-1-mkchauras@linux.ibm.com>
References: <20251229045416.3193779-1-mkchauras@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MSBTYWx0ZWRfX3epzB2agYwwP
 rtfKOc5uAqmeDB1XVrYAQmcW2Hi27Rqc2csrMslm4g8PecSzkA3sRih+UCIELFYSJZ/sZBlC4S9
 fA+bP9TOMbpfKJoXmu7jQorNvxzciBUYXi3CS3IDoQmBgVVEp3MHfzE+rI62SFXSgXHFAWQ/7Xi
 Xwc13HELrSriemIl7392Y9i1m/NAGMlIgX8W68duMfKCqKjjTk9vhpLiwqTd8fnkpbM/7giYaPg
 xrL+V6Bz+aFshu6SXgeR0anK3sPMdkwkAfRhhJdSqx/UZydhbwO/3V31BSu4gK3DvLuWk+Y0CZC
 hZO/Vqvi30wnpw+upEhlYmCyvf2fyxxnLOS9ozNWJgWDqL+W+bO/QrGz8suuny3MD2wjsArJbeV
 K4ZE9fSImesbuzmjvYwoXvMyraYxDmdBC9uEbexF0mDDQT9h9G/9C99CemEoAZVLBxc3yGS6yZN
 hr7mKfxpGBIybunnGow==
X-Proofpoint-GUID: eeoyggOaGYZShZgI69ZBLubPfiSkqK1T
X-Authority-Analysis: v=2.4 cv=B4+0EetM c=1 sm=1 tr=0 ts=695209c2 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=wNVWKEKBPlwGkIktZH8A:9
X-Proofpoint-ORIG-GUID: 11dQPlOsJrxmx7Oo8yycpMNUZSybP9Na
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2512290041
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>

Add a new field `exit_flags` in the pt_regs structure. This field will hold
the flags set during interrupt or syscall execution that are required during
exit to user mode.

Specifically, the `TIF_RESTOREALL` flag, stored in this field, helps the
exit routine determine if any NVGPRs were modified and need to be restored
before returning to userspace.

This addition ensures a clean and architecture-specific mechanism to track
per-syscall or per-interrupt state transitions related to register restore.

Changes:
 - Add `exit_flags` and `__pt_regs_pad` to maintain 16-byte stack alignment
 - Update asm-offsets.c and ptrace.c for offset and validation
 - Update PT_* constants in uapi header to reflect the new layout

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/include/asm/ptrace.h      |  3 +++
 arch/powerpc/include/uapi/asm/ptrace.h | 14 +++++++++-----
 arch/powerpc/kernel/ptrace/ptrace.c    |  1 +
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 94aa1de2b06e..2e741ea57b80 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -53,6 +53,9 @@ struct pt_regs
 				unsigned long esr;
 			};
 			unsigned long result;
+			unsigned long exit_flags;
+			/* Maintain 16 byte interrupt stack alignment */
+			unsigned long __pt_regs_pad[3];
 		};
 	};
 #if defined(CONFIG_PPC64) || defined(CONFIG_PPC_KUAP)
diff --git a/arch/powerpc/include/uapi/asm/ptrace.h b/arch/powerpc/include/uapi/asm/ptrace.h
index 01e630149d48..a393b7f2760a 100644
--- a/arch/powerpc/include/uapi/asm/ptrace.h
+++ b/arch/powerpc/include/uapi/asm/ptrace.h
@@ -55,6 +55,8 @@ struct pt_regs
 	unsigned long dar;		/* Fault registers */
 	unsigned long dsisr;		/* on 4xx/Book-E used for ESR */
 	unsigned long result;		/* Result of a system call */
+	unsigned long exit_flags;	/* System call exit flags */
+	unsigned long __pt_regs_pad[3];	/* Maintain 16 byte interrupt stack alignment */
 };
 
 #endif /* __ASSEMBLER__ */
@@ -114,10 +116,12 @@ struct pt_regs
 #define PT_DAR	41
 #define PT_DSISR 42
 #define PT_RESULT 43
-#define PT_DSCR 44
-#define PT_REGS_COUNT 44
+#define PT_EXIT_FLAGS 44
+#define PT_PAD 47 /* 3 times */
+#define PT_DSCR 48
+#define PT_REGS_COUNT 48
 
-#define PT_FPR0	48	/* each FP reg occupies 2 slots in this space */
+#define PT_FPR0	(PT_REGS_COUNT + 4)	/* each FP reg occupies 2 slots in this space */
 
 #ifndef __powerpc64__
 
@@ -129,7 +133,7 @@ struct pt_regs
 #define PT_FPSCR (PT_FPR0 + 32)	/* each FP reg occupies 1 slot in 64-bit space */
 
 
-#define PT_VR0 82	/* each Vector reg occupies 2 slots in 64-bit */
+#define PT_VR0	(PT_FPSCR + 2)	/* <82> each Vector reg occupies 2 slots in 64-bit */
 #define PT_VSCR (PT_VR0 + 32*2 + 1)
 #define PT_VRSAVE (PT_VR0 + 33*2)
 
@@ -137,7 +141,7 @@ struct pt_regs
 /*
  * Only store first 32 VSRs here. The second 32 VSRs in VR0-31
  */
-#define PT_VSR0 150	/* each VSR reg occupies 2 slots in 64-bit */
+#define PT_VSR0	(PT_VRSAVE + 2)	/* each VSR reg occupies 2 slots in 64-bit */
 #define PT_VSR31 (PT_VSR0 + 2*31)
 #endif /* __powerpc64__ */
 
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index c6997df63287..2134b6d155ff 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -432,6 +432,7 @@ void __init pt_regs_check(void)
 	CHECK_REG(PT_DAR, dar);
 	CHECK_REG(PT_DSISR, dsisr);
 	CHECK_REG(PT_RESULT, result);
+	CHECK_REG(PT_EXIT_FLAGS, exit_flags);
 	#undef CHECK_REG
 
 	BUILD_BUG_ON(PT_REGS_COUNT != sizeof(struct user_pt_regs) / sizeof(unsigned long));
-- 
2.52.0


