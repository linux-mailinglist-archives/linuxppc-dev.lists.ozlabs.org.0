Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CB072962E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 12:01:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcxSG75JQz3fGF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 20:01:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=d+MYNq61;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=d+MYNq61;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcxRM1KrMz3f0M
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 20:00:46 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-651e298be3fso1641616b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 03:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686304842; x=1688896842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyOVrAdZI1xc5hD/G0usUVxu/VJz/F7Hk7mfWyG1a/o=;
        b=d+MYNq61z7HWLZWKq6rB7AbthBDlC9svmFNWsghBSeXylLaSMSQ0opfxx8AOv4wllu
         eMJcRmceklHwvlKT8grkZjO3PS+R40REVM4UlFdv0ay3xQwx7KbpZXHtsA1CM01jfUV/
         k1QJM41l19KMcG0quudmZYBH2+jo3cgFLK78hJaDVY1r/i8KVh56KDmOkp890qMypbNG
         r7+OI8qZSi9G/8MzAldmjFjdLu8YLMK2z6zWSFtvpa1+qPkmS756nZSniFFo6OvvWc10
         3XP9kJ1DSHppEj/IVydGFYi+EoAupuyXOVhs7pr9VTc+IWvUwJPsOeG9O864DRHNY6gd
         ep9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686304842; x=1688896842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyOVrAdZI1xc5hD/G0usUVxu/VJz/F7Hk7mfWyG1a/o=;
        b=Bd+KaNmCzd3vQSq/aOS3EON/Aw8+m+Q/3+8Ouu+USxfDf03twpuGqcNZlBp66htrpw
         joDt3At7xkenlpm/z9+PRsYspHNtjORfmdkV2d+jk3vOlXp3AkZPH3bK54VLBz+Pl6b4
         xX+C3Y26XP/no9kErzbcm2lIRUfR+4frUkU0BS8JoQSBaALmLf7WV9IINMrWAzy7gsbO
         sUDmSpgMm1d+muzlQg7WiH+Ef0SskMyuff1QMjnome322xVSffn70g2sqf0sdqueGIZH
         wrRg4jwjr2VH3DpC1g0vDK3ZErX0nRFBZIbK00XUde1ywB9HwS4Wi1KA6eibkyJQOT83
         LhcQ==
X-Gm-Message-State: AC+VfDwR0yCVBGomiLzFfRmjgH9wCuNjRb/JMfV7a5oNiSHhhN8C/C4B
	LuEEZN8TrEBqa/bSQptTxZ89H3hxDuY=
X-Google-Smtp-Source: ACHHUZ6KjAvgTxOI6RBW+/3RuXFShhnH2y8kEd7DNcNmY8xsf+5x8j/VddnBHiRk77t9oVQReI8ZOA==
X-Received: by 2002:a05:6a20:394b:b0:10c:b441:5bd0 with SMTP id r11-20020a056a20394b00b0010cb4415bd0mr1004154pzg.18.1686304842494;
        Fri, 09 Jun 2023 03:00:42 -0700 (PDT)
Received: from wheely.local0.net ([193.114.110.224])
        by smtp.gmail.com with ESMTPSA id jh11-20020a170903328b00b001b077301a58sm2912864plb.79.2023.06.09.03.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 03:00:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] powerpc/64s: Add POWER10 store sync mnemonics
Date: Fri,  9 Jun 2023 20:00:24 +1000
Message-Id: <20230609100026.8946-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609100026.8946-1-npiggin@gmail.com>
References: <20230609100026.8946-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ISA v3.1 introduces new sync types for store ordering.

  stncisync
  stcisync
  stsync

Add ppc-opcode defines for these. This changes PPC_RAW_SYNC to take
L,SC parameters and adds a PPC_RAW_HWSYNC for callers that want the
plain old sync (aka hwsync).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ppc-opcode.h | 19 ++++++++++++++-----
 arch/powerpc/kernel/traps.c           |  2 +-
 arch/powerpc/lib/feature-fixups.c     |  6 +++---
 arch/powerpc/net/bpf_jit_comp64.c     |  2 +-
 4 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index ca5a0da7df4e..7bc8bbcd4adb 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -326,6 +326,8 @@
 #define ___PPC_R(r)	(((r) & 0x1) << 16)
 #define ___PPC_PRS(prs)	(((prs) & 0x1) << 17)
 #define ___PPC_RIC(ric)	(((ric) & 0x3) << 18)
+#define ___PPC_L(l)	(((l) & 0x7) << 21)
+#define ___PPC_SC(sc)	(((sc) & 0x3) << 16)
 #define __PPC_RA(a)	___PPC_RA(__REG_##a)
 #define __PPC_RA0(a)	___PPC_RA(__REGA0_##a)
 #define __PPC_RB(b)	___PPC_RB(__REG_##b)
@@ -378,8 +380,6 @@
 #define PPC_RAW_LQARX(t, a, b, eh)	(0x7c000228 | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | __PPC_EH(eh))
 #define PPC_RAW_LDARX(t, a, b, eh)	(0x7c0000a8 | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | __PPC_EH(eh))
 #define PPC_RAW_LWARX(t, a, b, eh)	(0x7c000028 | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | __PPC_EH(eh))
-#define PPC_RAW_PHWSYNC			(0x7c8004ac)
-#define PPC_RAW_PLWSYNC			(0x7ca004ac)
 #define PPC_RAW_STQCX(t, a, b)		(0x7c00016d | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_MADDHD(t, a, b, c)	(0x10000030 | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | ___PPC_RC(c))
 #define PPC_RAW_MADDHDU(t, a, b, c)	(0x10000031 | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | ___PPC_RC(c))
@@ -396,6 +396,13 @@
 #define PPC_RAW_RFCI			(0x4c000066)
 #define PPC_RAW_RFDI			(0x4c00004e)
 #define PPC_RAW_RFMCI			(0x4c00004c)
+#define PPC_RAW_SYNC(l, sc)		(0x7c0004ac | ___PPC_L(l) | ___PPC_SC(sc))
+#define PPC_RAW_HWSYNC()		PPC_RAW_SYNC(0, 0)
+#define PPC_RAW_STNCISYNC()		PPC_RAW_SYNC(1, 1)
+#define PPC_RAW_STCISYNC()		PPC_RAW_SYNC(0, 2)
+#define PPC_RAW_STSYNC()		PPC_RAW_SYNC(0, 3)
+#define PPC_RAW_PHWSYNC()		PPC_RAW_SYNC(4, 0)
+#define PPC_RAW_PLWSYNC()		PPC_RAW_SYNC(5, 0)
 #define PPC_RAW_TLBILX(t, a, b)		(0x7c000024 | __PPC_T_TLB(t) | 	__PPC_RA0(a) | __PPC_RB(b))
 #define PPC_RAW_WAIT_v203		(0x7c00007c)
 #define PPC_RAW_WAIT(w, p)		(0x7c00003c | __PPC_WC(w) | __PPC_PL(p))
@@ -421,7 +428,6 @@
 #define PPC_RAW_DCBFPS(a, b)		(0x7c0000ac | ___PPC_RA(a) | ___PPC_RB(b) | (4 << 21))
 #define PPC_RAW_DCBSTPS(a, b)		(0x7c0000ac | ___PPC_RA(a) | ___PPC_RB(b) | (6 << 21))
 #define PPC_RAW_SC()			(0x44000002)
-#define PPC_RAW_SYNC()			(0x7c0004ac)
 #define PPC_RAW_ISYNC()			(0x4c00012c)
 
 /*
@@ -641,8 +647,11 @@
 #define STBCIX(s, a, b)		stringify_in_c(.long PPC_RAW_STBCIX(s, a, b))
 #define PPC_DCBFPS(a, b)	stringify_in_c(.long PPC_RAW_DCBFPS(a, b))
 #define PPC_DCBSTPS(a, b)	stringify_in_c(.long PPC_RAW_DCBSTPS(a, b))
-#define PPC_PHWSYNC		stringify_in_c(.long PPC_RAW_PHWSYNC)
-#define PPC_PLWSYNC		stringify_in_c(.long PPC_RAW_PLWSYNC)
+#define PPC_STNCISYNC		stringify_in_c(.long PPC_RAW_STNCISYNC())
+#define PPC_STCISYNC		stringify_in_c(.long PPC_RAW_STCISYNC())
+#define PPC_STSYNC		stringify_in_c(.long PPC_RAW_STSYNC())
+#define PPC_PHWSYNC		stringify_in_c(.long PPC_RAW_PHWSYNC())
+#define PPC_PLWSYNC		stringify_in_c(.long PPC_RAW_PLWSYNC())
 #define STXVD2X(s, a, b)	stringify_in_c(.long PPC_RAW_STXVD2X(s, a, b))
 #define LXVD2X(s, a, b)		stringify_in_c(.long PPC_RAW_LXVD2X(s, a, b))
 #define MFVRD(a, t)		stringify_in_c(.long PPC_RAW_MFVRD(a, t))
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 9bdd79aa51cf..4b216c208f41 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -550,7 +550,7 @@ static inline int check_io_access(struct pt_regs *regs)
 			nip -= 2;
 		else if (*nip == PPC_RAW_ISYNC())
 			--nip;
-		if (*nip == PPC_RAW_SYNC() || get_op(*nip) == OP_TRAP) {
+		if (*nip == PPC_RAW_HWSYNC() || get_op(*nip) == OP_TRAP) {
 			unsigned int rb;
 
 			--nip;
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 80def1c2afcb..4c6e7111354f 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -193,7 +193,7 @@ static void do_stf_entry_barrier_fixups(enum stf_barrier_type types)
 	} else if (types & STF_BARRIER_EIEIO) {
 		instrs[i++] = PPC_RAW_EIEIO() | 0x02000000; /* eieio + bit 6 hint */
 	} else if (types & STF_BARRIER_SYNC_ORI) {
-		instrs[i++] = PPC_RAW_SYNC();
+		instrs[i++] = PPC_RAW_HWSYNC();
 		instrs[i++] = PPC_RAW_LD(_R10, _R13, 0);
 		instrs[i++] = PPC_RAW_ORI(_R31, _R31, 0); /* speculation barrier */
 	}
@@ -234,7 +234,7 @@ static void do_stf_exit_barrier_fixups(enum stf_barrier_type types)
 			instrs[i++] = PPC_RAW_MTSPR(SPRN_SPRG2, _R13);
 			instrs[i++] = PPC_RAW_MFSPR(_R13, SPRN_SPRG1);
 	        }
-		instrs[i++] = PPC_RAW_SYNC();
+		instrs[i++] = PPC_RAW_HWSYNC();
 		instrs[i++] = PPC_RAW_LD(_R13, _R13, 0);
 		instrs[i++] = PPC_RAW_ORI(_R31, _R31, 0); /* speculation barrier */
 		if (cpu_has_feature(CPU_FTR_HVMODE))
@@ -543,7 +543,7 @@ void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_
 	if (enable) {
 		pr_info("barrier-nospec: using isync; sync as speculation barrier\n");
 		instr[0] = PPC_RAW_ISYNC();
-		instr[1] = PPC_RAW_SYNC();
+		instr[1] = PPC_RAW_HWSYNC();
 	}
 
 	i = do_patch_fixups(start, end, instr, ARRAY_SIZE(instr));
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 0f8048f6dad6..e8257bfc1cb4 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -737,7 +737,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				EMIT(PPC_RAW_EIEIO() | 0x02000000);
 				break;
 			case STF_BARRIER_SYNC_ORI:
-				EMIT(PPC_RAW_SYNC());
+				EMIT(PPC_RAW_HWSYNC());
 				EMIT(PPC_RAW_LD(tmp1_reg, _R13, 0));
 				EMIT(PPC_RAW_ORI(_R31, _R31, 0));
 				break;
-- 
2.40.1

