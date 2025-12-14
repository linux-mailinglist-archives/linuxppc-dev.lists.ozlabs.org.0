Return-Path: <linuxppc-dev+bounces-14749-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A5CCBBAE8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Dec 2025 14:05:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dTk1P1xldz2ySb;
	Mon, 15 Dec 2025 00:04:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765717481;
	cv=none; b=XP9x99V3XYO9tcVIQnr8WIXpwyRKSd5sj6EHWr+yklQDsofYo1lAjErAtcKFjvwQIf+3sdnrt01s8ze/b6tl3f3EoAzdZwTDKYQ/qSydawXfgLMPWb4xLKISS7nVxi8CNZ/ErQkZtpkjCjjVM4g6FRKeRZD1GfiD19SIRDWrKDTunuXa1q5KS2h2OOUf2Kob5hw43C6LrY3K6qghSUPeVUgMbdySiFGdrt85HV1vXIi4y1JHNhqG3k2sIxKgOxz8iZDAlsK4OJ/Lq/cRpsSethQWQ7gSbdmL/097UyiGstEAnwP9yeJgQvS9G9KDbMVuGF2qzm9rmvm2U0ZpdTeQFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765717481; c=relaxed/relaxed;
	bh=IdtBx5T6dXUKBEVHBVhsce0A7gAf5hkMGmgPg7YYDP8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bUf1oYJ7BGb/CI/uaTr72hhRtKUDcNu1symp9h8mPVMqDiDXliKfzcnqOsjyWdfkfhZRNRBb1V7f6GsJxaHfn0HmHXAWM4Bqcj5pvUDrGIU8CrCeHvPz/T5rAyfmkfOPtKNcEISpeN4tvCrW9e0WJcIjxUSwrp9u3CPQOZlzVnBL2LLyiR/mpz43+Wd5SXlUOltUvZh5i91MFL+ZHr1R9uL0J0CMXMZtYSRhOi4FjSlcmiz7y/lMMTFUqNI6o4OEx72ed1QnV231mSM3uNhzw47rWa3ZmmyICLHs4J3SwfDddZKuitReY+8AsjklcKEvJvczLcrxyQNwDjN8iHvnCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DJK+gAUN; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DJK+gAUN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dTk1N3P8gz2yRm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Dec 2025 00:04:40 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BDKoCpd019037;
	Sun, 14 Dec 2025 13:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=IdtBx5T6dXUKBEVHB
	Vhsce0A7gAf5hkMGmgPg7YYDP8=; b=DJK+gAUNR0A3xkRvCp1olJK2HPqtOSlsi
	7WPC++MrEqCkLk5aTh6K6GjLTQUieDSU+6dVDNQwrCn2i4iN3FF7nsLplHf3pdUY
	SOhlFvgEv6WxQLmdcNS7HtH2ruezJEn7aX8Bq2+ff1qvLapn6OOL2JPrw0RW65ky
	FIoUwvu+jca01P91umNj8osRMdBxBSbSRkiM7wiWOCUQyVi7S98MXy1GLXCivRzB
	579w1ZEqypw5lbwfCjnWJGPC1ge0XqCrDNqcE1HXOSxYTBEzE7CEv1jG2qDvImZC
	BeScuy0324jrc3pw9z//AlmJTrifgfKFztBFd4twDzFEmDoLhe4Gg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yvawnuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:04:17 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BED4Gva006563;
	Sun, 14 Dec 2025 13:04:16 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yvawnuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:04:16 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BE7meNO014344;
	Sun, 14 Dec 2025 13:04:15 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b1mpjhme3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:04:15 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BED4ClD48038200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 14 Dec 2025 13:04:12 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 118E120043;
	Sun, 14 Dec 2025 13:04:12 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B050E20040;
	Sun, 14 Dec 2025 13:04:05 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com (unknown [9.124.210.21])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 14 Dec 2025 13:04:05 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, sshegde@linux.ibm.com, charlie@rivosinc.com,
        macro@orcam.me.uk, akpm@linux-foundation.org, ldv@strace.io,
        deller@gmx.de, ankur.a.arora@oracle.com, segher@kernel.crashing.org,
        tglx@linutronix.de, thomas.weissschuh@linutronix.de,
        peterz@infradead.org, menglong8.dong@gmail.com, bigeasy@linutronix.de,
        namcao@linutronix.de, kan.liang@linux.intel.com, mingo@kernel.org,
        atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] powerpc: add exit_flags field in pt_regs
Date: Sun, 14 Dec 2025 18:32:41 +0530
Message-ID: <20251214130245.43664-6-mkchauras@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214130245.43664-1-mkchauras@linux.ibm.com>
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=V/JwEOni c=1 sm=1 tr=0 ts=693eb5d1 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=mnynasnECEr2HgeGZQUA:9
X-Proofpoint-GUID: WxMgjE8SmAVb8RL1zWV9P8CcNEWmHv7o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfX94Eyw74eG1pX
 iaXGsfU/i5O0miSl+o3lde+r4SRWibLz2lKCqnOJjSOM0dgiMMw8I7VuEpHi5l43IAIPqXsp1xh
 iCAFOc1ioCavsL310vj6f73RB5EOr5buE/bK3oyl7tYH+BxNw5ytJkPrHK3B5ucIbi9MYqr9YE9
 MjrnePqAyNf116SPx1+28Aeb9sGK4uf45RDGJEeKO1cwd7mHMbVYkxfVjiONA6pYoDem1CjhoII
 fumsUPyMQs86LW8uVV5jFFryWPgynTbw2h6rWYUbWbpjakm9Z/r3o7fwx/cFOCQV+CPZGT6bjy+
 h6qBhIrcOhg95B8Q6os7AfctYiRbKOis6TkCbMh/89DxeMe7sLipXu8oNMnvqP9mREiQjMg+Uxa
 XO/6mKmOfCB5XTOFoW3TGqxdtJBkNw==
X-Proofpoint-ORIG-GUID: lpPw985BP5J-rwiiBnV-e3rkFpIPpVWf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
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
 arch/powerpc/kernel/asm-offsets.c      |  1 +
 arch/powerpc/kernel/ptrace/ptrace.c    |  1 +
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 94aa1de2b06e..3af8a5898fe3 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -53,6 +53,9 @@ struct pt_regs
 				unsigned long esr;
 			};
 			unsigned long result;
+			unsigned long exit_flags;
+			/* Maintain 16 byte interrupt stack alignment */
+			unsigned long __pt_regs_pad[1];
 		};
 	};
 #if defined(CONFIG_PPC64) || defined(CONFIG_PPC_KUAP)
diff --git a/arch/powerpc/include/uapi/asm/ptrace.h b/arch/powerpc/include/uapi/asm/ptrace.h
index 01e630149d48..de56b216c9c5 100644
--- a/arch/powerpc/include/uapi/asm/ptrace.h
+++ b/arch/powerpc/include/uapi/asm/ptrace.h
@@ -55,6 +55,8 @@ struct pt_regs
 	unsigned long dar;		/* Fault registers */
 	unsigned long dsisr;		/* on 4xx/Book-E used for ESR */
 	unsigned long result;		/* Result of a system call */
+	unsigned long exit_flags;	/* System call exit flags */
+	unsigned long __pt_regs_pad[1];	/* Maintain 16 byte interrupt stack alignment */
 };
 
 #endif /* __ASSEMBLER__ */
@@ -114,10 +116,12 @@ struct pt_regs
 #define PT_DAR	41
 #define PT_DSISR 42
 #define PT_RESULT 43
-#define PT_DSCR 44
-#define PT_REGS_COUNT 44
+#define PT_EXIT_FLAGS 44
+#define PT_PAD 45
+#define PT_DSCR 46
+#define PT_REGS_COUNT 46
 
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
 
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index a4bc80b30410..c0bb09f1db78 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -292,6 +292,7 @@ int main(void)
 	STACK_PT_REGS_OFFSET(_ESR, esr);
 	STACK_PT_REGS_OFFSET(ORIG_GPR3, orig_gpr3);
 	STACK_PT_REGS_OFFSET(RESULT, result);
+	STACK_PT_REGS_OFFSET(EXIT_FLAGS, exit_flags);
 	STACK_PT_REGS_OFFSET(_TRAP, trap);
 #ifdef CONFIG_PPC64
 	STACK_PT_REGS_OFFSET(SOFTE, softe);
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


