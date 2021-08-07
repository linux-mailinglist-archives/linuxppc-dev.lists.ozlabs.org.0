Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCC83E3283
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 03:04:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GhPJL0rpqz3dXM
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 11:04:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256 header.s=1a1hai header.b=KI7cMm+P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=me.com
 (client-ip=17.58.6.42; helo=pv50p00im-zteg10011501.me.com;
 envelope-from=sxwjean@me.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256
 header.s=1a1hai header.b=KI7cMm+P; dkim-atps=neutral
Received: from pv50p00im-zteg10011501.me.com (pv50p00im-zteg10011501.me.com
 [17.58.6.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GhPHC19hcz3cJY
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Aug 2021 11:03:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1628298213; bh=Z986d0jG0R6/sOcB/aEQo+lWugHbqN3MMME1c54wvls=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=KI7cMm+PFClqZ4V5l8KrsvuSyg/dtdWf5soKuoY0bUTo6yjiau5FsoXsZQt8m7b7V
 OXy7lJN4CrRPJBXKlvtBy9YlG0FTfH6TZbwEV94sCXkLeFQoXkvYtifxPaUoH0qqTL
 q+xFb6Ooh1aEe4Ca4DqUxvBY5ct05iZS/DIUEARdhS/aJ60RUe77GPKyxVIHUciOH2
 XuMtYIpfZQ/Z9gRIjuQef+2FqiKmjOacNcyO3m1qxC+6XmNerjatpcVnhLq4/Whtmd
 N3eBpavjbP3PJFsNTQDBZLOaXSRURIRCgpcf1ylxZhXQWZf1XPLrDJwI4q8D8XsOxm
 vvzSC9dMwwwvA==
Received: from xiongwei.. (unknown [120.245.2.134])
 by pv50p00im-zteg10011501.me.com (Postfix) with ESMTPSA id 8F079B003B3;
 Sat,  7 Aug 2021 01:03:28 +0000 (UTC)
From: sxwjean@me.com
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/4] powerpc/64e: Get esr offset with _ESR macro
Date: Sat,  7 Aug 2021 09:02:37 +0800
Message-Id: <20210807010239.416055-3-sxwjean@me.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210807010239.416055-1-sxwjean@me.com>
References: <20210807010239.416055-1-sxwjean@me.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-06_08:2021-08-06,
 2021-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=911 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2108070004
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: ravi.bangoria@linux.ibm.com, Xiongwei Song <sxwjean@gmail.com>,
 aneesh.kumar@linux.ibm.com, oleg@redhat.com, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, efremov@linux.com, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Xiongwei Song <sxwjean@gmail.com>

Use _ESR to get the offset of esr register in pr_regs for 64e cpus.

Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
---
 arch/powerpc/kernel/asm-offsets.c    |  2 +-
 arch/powerpc/kernel/exceptions-64e.S | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index a47eefa09bcb..f4ebc435fd78 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -287,6 +287,7 @@ int main(void)
 	STACK_PT_REGS_OFFSET(_XER, xer);
 	STACK_PT_REGS_OFFSET(_DAR, dar);
 	STACK_PT_REGS_OFFSET(_DSISR, dsisr);
+	STACK_PT_REGS_OFFSET(_ESR, esr);
 	STACK_PT_REGS_OFFSET(ORIG_GPR3, orig_gpr3);
 	STACK_PT_REGS_OFFSET(RESULT, result);
 	STACK_PT_REGS_OFFSET(_TRAP, trap);
@@ -298,7 +299,6 @@ int main(void)
 	 * we use them to hold SRR0 and SRR1.
 	 */
 	STACK_PT_REGS_OFFSET(_DEAR, dar);
-	STACK_PT_REGS_OFFSET(_ESR, dsisr);
 #else /* CONFIG_PPC64 */
 	STACK_PT_REGS_OFFSET(SOFTE, softe);
 	STACK_PT_REGS_OFFSET(_PPR, ppr);
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 1401787b0b93..bf8c4c2f98ea 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -546,7 +546,7 @@ __end_interrupts:
 	mfspr	r14,SPRN_DEAR
 	mfspr	r15,SPRN_ESR
 	std	r14,_DAR(r1)
-	std	r15,_DSISR(r1)
+	std	r15,_ESR(r1)
 	ld	r14,PACA_EXGEN+EX_R14(r13)
 	ld	r15,PACA_EXGEN+EX_R15(r13)
 	EXCEPTION_COMMON(0x300)
@@ -559,7 +559,7 @@ __end_interrupts:
 	li	r15,0
 	mr	r14,r10
 	std	r14,_DAR(r1)
-	std	r15,_DSISR(r1)
+	std	r15,_ESR(r1)
 	ld	r14,PACA_EXGEN+EX_R14(r13)
 	ld	r15,PACA_EXGEN+EX_R15(r13)
 	EXCEPTION_COMMON(0x400)
@@ -576,7 +576,7 @@ __end_interrupts:
 	mfspr	r14,SPRN_DEAR
 	mfspr	r15,SPRN_ESR
 	std	r14,_DAR(r1)
-	std	r15,_DSISR(r1)
+	std	r15,_ESR(r1)
 	ld	r14,PACA_EXGEN+EX_R14(r13)
 	ld	r15,PACA_EXGEN+EX_R15(r13)
 	EXCEPTION_COMMON(0x600)
@@ -587,7 +587,7 @@ __end_interrupts:
 	NORMAL_EXCEPTION_PROLOG(0x700, BOOKE_INTERRUPT_PROGRAM,
 				PROLOG_ADDITION_1REG)
 	mfspr	r14,SPRN_ESR
-	std	r14,_DSISR(r1)
+	std	r14,_ESR(r1)
 	ld	r14,PACA_EXGEN+EX_R14(r13)
 	EXCEPTION_COMMON(0x700)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -1058,7 +1058,7 @@ bad_stack_book3e:
 	mfspr	r10,SPRN_DEAR
 	mfspr	r11,SPRN_ESR
 	std	r10,_DAR(r1)
-	std	r11,_DSISR(r1)
+	std	r11,_ESR(r1)
 	std	r0,GPR0(r1);		/* save r0 in stackframe */	    \
 	std	r2,GPR2(r1);		/* save r2 in stackframe */	    \
 	SAVE_4GPRS(3, r1);		/* save r3 - r6 in stackframe */    \
-- 
2.30.2

