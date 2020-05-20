Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A89031DA7D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 04:15:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rbv841t6zDqV4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 12:15:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mWfw9V2u; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Rbq71xPVzDqWK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 12:12:03 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id 23so817256pfy.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 19:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gqWLOkEG0Wkh9s5g5Ml4dXMvNcGzQVqZv8XwDFQUc5k=;
 b=mWfw9V2uqCIpE5iSewAOR7MYR4tb3SBEHPjLPDO9UQXYmiqAhjT+9j7bZL8QoLybj6
 5ONUOZSZBeld7VWiT1Aw6fSV3wiyGhXnA8MNGVJvE+pBi/BMMSSwxoqGZzMwnxoXgpV7
 Iekkqpl3iwVInj3bjGavjM/4QABRkcMJpeY6D01oljxsyicf7HRVDOQ5/8g8C8IqjE4H
 sp0SURx4/0nFRW8txzE2ebAs/ZjgW/XzNgd+6cWW0oIOfXbdGg9VjRjeAcfuitdMh8rq
 xnjmCrwtnNXHZr9COFinSgcX6SCLu8dmL3fMY6yrRPPuNixB7E/XwJlPXeiuF2dBIT60
 GTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gqWLOkEG0Wkh9s5g5Ml4dXMvNcGzQVqZv8XwDFQUc5k=;
 b=PvNmsJKsyALl6OoFSCMvyIJoXTYFrq01AqNml+GplFvUVuJI9iZqre8fYAZDo8Zn4o
 dcCdY4GA7YuqOmeR/sxVr0LlBUgFgwKJL0xqBXLZVTN4YK9BlP4NjtgCDu1n1oIpLbN0
 /qo+kFcNh47a5V6EfhXzw21Mi8W3236VFOjUjnEAvjn9SnEDIqSSlL0BnDzrxsNmO5F9
 nN4a6/eDw+uh2nWpgqVgjeQDwsYkn4CeROFI8gcCgcT1cWjg/0iHzgiyw/AOZKTQnQOE
 GJ1Mn5vSsT6YIpt0ZM7UCTTIEg1lqul3FoyMO9f56ACOCQ2zxDVLbGKkZUBzfjFbGup9
 GmnA==
X-Gm-Message-State: AOAM5313uqpyvM7oFv5ysSgt/ICzPC/95uJ+7c9dDi0iWA6Gr0sfonQ5
 +wy/iLAySEZ5dGP1u04JjQeSEJ5Lqeo=
X-Google-Smtp-Source: ABdhPJz3WpGSMLNg/V+MOpeBWokJwNLP6x5qIp1tEQxZOpe4jrEvXJ1XdI/nOfPdx16BymI5QjvRBg==
X-Received: by 2002:a63:33c6:: with SMTP id z189mr2022664pgz.426.1589940720363; 
 Tue, 19 May 2020 19:12:00 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id y5sm619600pff.150.2020.05.19.19.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 19:11:59 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] selftests/powerpc: Add prefixed loads/stores to
 alignment_handler test
Date: Wed, 20 May 2020 12:11:03 +1000
Message-Id: <20200520021103.19798-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200520021103.19798-1-jniethe5@gmail.com>
References: <20200520021103.19798-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Extend the alignment handler selftest to exercise prefixed load store
instructions. Add tests for prefixed VSX, floating point and integer
instructions.

Skip prefix tests if ISA version does not support prefixed instructions.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 .../powerpc/alignment/alignment_handler.c     | 93 ++++++++++++++++++-
 .../selftests/powerpc/include/instructions.h  | 77 +++++++++++++++
 .../testing/selftests/powerpc/include/utils.h |  5 +
 3 files changed, 172 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/powerpc/alignment/alignment_handler.c b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
index eb6aba323f8b..e582e68b3b5b 100644
--- a/tools/testing/selftests/powerpc/alignment/alignment_handler.c
+++ b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
@@ -58,6 +58,7 @@
 #include <asm/cputable.h>
 
 #include "utils.h"
+#include "instructions.h"
 
 int bufsize;
 int debug;
@@ -96,6 +97,17 @@ void sighandler(int sig, siginfo_t *info, void *ctx)
 	}							\
 	rc |= do_test(#name, test_##name)
 
+#define TESTP(name, ld_op, st_op, ld_reg, st_reg)		\
+	void test_##name(char *s, char *d)			\
+	{							\
+		asm volatile(					\
+			ld_op(ld_reg, %0, 0, 0)			\
+			st_op(st_reg, %1, 0, 0)			\
+			:: "r"(s), "r"(d), "r"(0)		\
+			: "memory", "vs0", "vs32", "r31");	\
+	}							\
+	rc |= do_test(#name, test_##name)
+
 #define LOAD_VSX_XFORM_TEST(op) TEST(op, op, stxvd2x, XFORM, 32, 32)
 #define STORE_VSX_XFORM_TEST(op) TEST(op, lxvd2x, op, XFORM, 32, 32)
 #define LOAD_VSX_DFORM_TEST(op) TEST(op, op, stxv, DFORM, 32, 32)
@@ -115,6 +127,17 @@ void sighandler(int sig, siginfo_t *info, void *ctx)
 #define LOAD_FLOAT_XFORM_TEST(op)  TEST(op, op, stfdx, XFORM, 0, 0)
 #define STORE_FLOAT_XFORM_TEST(op) TEST(op, lfdx, op, XFORM, 0, 0)
 
+#define LOAD_MLS_PREFIX_TEST(op) TESTP(op, op, PSTD, 31, 31)
+#define STORE_MLS_PREFIX_TEST(op) TESTP(op, PLD, op, 31, 31)
+
+#define LOAD_8LS_PREFIX_TEST(op) TESTP(op, op, PSTD, 31, 31)
+#define STORE_8LS_PREFIX_TEST(op) TESTP(op, PLD, op, 31, 31)
+
+#define LOAD_FLOAT_MLS_PREFIX_TEST(op) TESTP(op, op, PSTFD, 0, 0)
+#define STORE_FLOAT_MLS_PREFIX_TEST(op) TESTP(op, PLFD, op, 0, 0)
+
+#define LOAD_VSX_8LS_PREFIX_TEST(op, tail) TESTP(op, op, PSTXV ## tail, 0, 32)
+#define STORE_VSX_8LS_PREFIX_TEST(op, tail) TESTP(op, PLXV ## tail, op, 32, 0)
 
 /* FIXME: Unimplemented tests: */
 // STORE_DFORM_TEST(stq)   /* FIXME: need two registers for quad */
@@ -361,6 +384,25 @@ int test_alignment_handler_vsx_300(void)
 	return rc;
 }
 
+int test_alignment_handler_vsx_prefix(void)
+{
+	int rc = 0;
+
+	SKIP_IF(!can_open_cifile());
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_10));
+
+	printf("VSX: PREFIX\n");
+	LOAD_VSX_8LS_PREFIX_TEST(PLXSD, 0);
+	LOAD_VSX_8LS_PREFIX_TEST(PLXSSP, 0);
+	LOAD_VSX_8LS_PREFIX_TEST(PLXV0, 0);
+	LOAD_VSX_8LS_PREFIX_TEST(PLXV1, 1);
+	STORE_VSX_8LS_PREFIX_TEST(PSTXSD, 0);
+	STORE_VSX_8LS_PREFIX_TEST(PSTXSSP, 0);
+	STORE_VSX_8LS_PREFIX_TEST(PSTXV0, 0);
+	STORE_VSX_8LS_PREFIX_TEST(PSTXV1, 1);
+	return rc;
+}
+
 int test_alignment_handler_integer(void)
 {
 	int rc = 0;
@@ -432,6 +474,27 @@ int test_alignment_handler_integer_206(void)
 	return rc;
 }
 
+int test_alignment_handler_integer_prefix(void)
+{
+	int rc = 0;
+
+	SKIP_IF(!can_open_cifile());
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_10));
+
+	printf("Integer: PREFIX\n");
+	LOAD_MLS_PREFIX_TEST(PLBZ);
+	LOAD_MLS_PREFIX_TEST(PLHZ);
+	LOAD_MLS_PREFIX_TEST(PLHA);
+	LOAD_MLS_PREFIX_TEST(PLWZ);
+	LOAD_8LS_PREFIX_TEST(PLWA);
+	LOAD_8LS_PREFIX_TEST(PLD);
+	STORE_MLS_PREFIX_TEST(PSTB);
+	STORE_MLS_PREFIX_TEST(PSTH);
+	STORE_MLS_PREFIX_TEST(PSTW);
+	STORE_8LS_PREFIX_TEST(PSTD);
+	return rc;
+}
+
 int test_alignment_handler_vmx(void)
 {
 	int rc = 0;
@@ -520,14 +583,32 @@ int test_alignment_handler_fp_206(void)
 	return rc;
 }
 
+
+int test_alignment_handler_fp_prefix(void)
+{
+	int rc = 0;
+
+	SKIP_IF(!can_open_cifile());
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_10));
+
+	printf("Floating point: PREFIX\n");
+	LOAD_FLOAT_DFORM_TEST(lfs);
+	LOAD_FLOAT_MLS_PREFIX_TEST(PLFS);
+	LOAD_FLOAT_MLS_PREFIX_TEST(PLFD);
+	STORE_FLOAT_MLS_PREFIX_TEST(PSTFS);
+	STORE_FLOAT_MLS_PREFIX_TEST(PSTFD);
+	return rc;
+}
+
 void usage(char *prog)
 {
 	printf("Usage: %s [options] [path [offset]]\n", prog);
 	printf("  -d	Enable debug error output\n");
 	printf("\n");
-	printf("This test requires a POWER8 or POWER9 CPU and either a ");
-	printf("usable framebuffer at /dev/fb0 or the path to usable ");
-	printf("cache-inhibited memory and optional offset to be provided\n");
+	printf("This test requires a POWER8, POWER9 or POWER10 CPU ");
+	printf("and either a usable framebuffer at /dev/fb0 or ");
+	printf("the path to usable cache inhibited memory and optional ");
+	printf("offset to be provided\n");
 }
 
 int main(int argc, char *argv[])
@@ -573,10 +654,14 @@ int main(int argc, char *argv[])
 			   "test_alignment_handler_vsx_207");
 	rc |= test_harness(test_alignment_handler_vsx_300,
 			   "test_alignment_handler_vsx_300");
+	rc |= test_harness(test_alignment_handler_vsx_prefix,
+			   "test_alignment_handler_vsx_prefix");
 	rc |= test_harness(test_alignment_handler_integer,
 			   "test_alignment_handler_integer");
 	rc |= test_harness(test_alignment_handler_integer_206,
 			   "test_alignment_handler_integer_206");
+	rc |= test_harness(test_alignment_handler_integer_prefix,
+			   "test_alignment_handler_integer_prefix");
 	rc |= test_harness(test_alignment_handler_vmx,
 			   "test_alignment_handler_vmx");
 	rc |= test_harness(test_alignment_handler_fp,
@@ -585,5 +670,7 @@ int main(int argc, char *argv[])
 			   "test_alignment_handler_fp_205");
 	rc |= test_harness(test_alignment_handler_fp_206,
 			   "test_alignment_handler_fp_206");
+	rc |= test_harness(test_alignment_handler_fp_prefix,
+			   "test_alignment_handler_fp_prefix");
 	return rc;
 }
diff --git a/tools/testing/selftests/powerpc/include/instructions.h b/tools/testing/selftests/powerpc/include/instructions.h
index f36061eb6f0f..4efa6314bd96 100644
--- a/tools/testing/selftests/powerpc/include/instructions.h
+++ b/tools/testing/selftests/powerpc/include/instructions.h
@@ -66,4 +66,81 @@ static inline int paste_last(void *i)
 #define PPC_INST_PASTE                 __PASTE(0, 0, 0, 0)
 #define PPC_INST_PASTE_LAST            __PASTE(0, 0, 1, 1)
 
+/* This defines the prefixed load/store instructions */
+#ifdef __ASSEMBLY__
+#  define stringify_in_c(...)	__VA_ARGS__
+#else
+#  define __stringify_in_c(...)	#__VA_ARGS__
+#  define stringify_in_c(...)	__stringify_in_c(__VA_ARGS__) " "
+#endif
+
+#define __PPC_RA(a)	(((a) & 0x1f) << 16)
+#define __PPC_RS(s)	(((s) & 0x1f) << 21)
+#define __PPC_RT(t)	__PPC_RS(t)
+#define __PPC_PREFIX_R(r)	(((r) & 0x1) << 20)
+
+#define PPC_PREFIX_MLS			0x06000000
+#define PPC_PREFIX_8LS			0x04000000
+
+#define PPC_INST_LBZ			0x88000000
+#define PPC_INST_LHZ			0xa0000000
+#define PPC_INST_LHA			0xa8000000
+#define PPC_INST_LWZ			0x80000000
+#define PPC_INST_STB			0x98000000
+#define PPC_INST_STH			0xb0000000
+#define PPC_INST_STW			0x90000000
+#define PPC_INST_STD			0xf8000000
+#define PPC_INST_LFS			0xc0000000
+#define PPC_INST_LFD			0xc8000000
+#define PPC_INST_STFS			0xd0000000
+#define PPC_INST_STFD			0xd8000000
+
+#define PREFIX_MLS(instr, t, a, r, d)	stringify_in_c(.balign 64, , 4;)		\
+					stringify_in_c(.long PPC_PREFIX_MLS |		\
+						       __PPC_PREFIX_R(r) |		\
+						       (((d) >> 16) & 0x3ffff);)	\
+					stringify_in_c(.long (instr)  |			\
+						       __PPC_RT(t) |			\
+						       __PPC_RA(a) |			\
+						       ((d) & 0xffff);\n)
+
+#define PREFIX_8LS(instr, t, a, r, d)	stringify_in_c(.balign 64, , 4;)		\
+					stringify_in_c(.long PPC_PREFIX_8LS |		\
+						       __PPC_PREFIX_R(r) |		\
+						       (((d) >> 16) & 0x3ffff);)	\
+					stringify_in_c(.long (instr)  |			\
+						       __PPC_RT(t) |			\
+						       __PPC_RA(a) |			\
+						       ((d) & 0xffff);\n)
+
+/* Prefixed Integer Load/Store instructions */
+#define PLBZ(t, a, r, d)		PREFIX_MLS(PPC_INST_LBZ, t, a, r, d)
+#define PLHZ(t, a, r, d)		PREFIX_MLS(PPC_INST_LHZ, t, a, r, d)
+#define PLHA(t, a, r, d)		PREFIX_MLS(PPC_INST_LHA, t, a, r, d)
+#define PLWZ(t, a, r, d)		PREFIX_MLS(PPC_INST_LWZ, t, a, r, d)
+#define PLWA(t, a, r, d)		PREFIX_8LS(0xa4000000, t, a, r, d)
+#define PLD(t, a, r, d)			PREFIX_8LS(0xe4000000, t, a, r, d)
+#define PLQ(t, a, r, d)			PREFIX_8LS(0xe0000000, t, a, r, d)
+#define PSTB(s, a, r, d)		PREFIX_MLS(PPC_INST_STB, s, a, r, d)
+#define PSTH(s, a, r, d)		PREFIX_MLS(PPC_INST_STH, s, a, r, d)
+#define PSTW(s, a, r, d)		PREFIX_MLS(PPC_INST_STW, s, a, r, d)
+#define PSTD(s, a, r, d)		PREFIX_8LS(0xf4000000, s, a, r, d)
+#define PSTQ(s, a, r, d)		PREFIX_8LS(0xf0000000, s, a, r, d)
+
+/* Prefixed Floating-Point Load/Store Instructions */
+#define PLFS(frt, a, r, d)		PREFIX_MLS(PPC_INST_LFS, frt, a, r, d)
+#define PLFD(frt, a, r, d)		PREFIX_MLS(PPC_INST_LFD, frt, a, r, d)
+#define PSTFS(frs, a, r, d)		PREFIX_MLS(PPC_INST_STFS, frs, a, r, d)
+#define PSTFD(frs, a, r, d)		PREFIX_MLS(PPC_INST_STFD, frs, a, r, d)
+
+/* Prefixed VSX Load/Store Instructions */
+#define PLXSD(vrt, a, r, d)		PREFIX_8LS(0xa8000000, vrt, a, r, d)
+#define PLXSSP(vrt, a, r, d)		PREFIX_8LS(0xac000000, vrt, a, r, d)
+#define PLXV0(s, a, r, d)		PREFIX_8LS(0xc8000000, s, a, r, d)
+#define PLXV1(s, a, r, d)		PREFIX_8LS(0xcc000000, s, a, r, d)
+#define PSTXSD(vrs, a, r, d)		PREFIX_8LS(0xb8000000, vrs, a, r, d)
+#define PSTXSSP(vrs, a, r, d)		PREFIX_8LS(0xbc000000, vrs, a, r, d)
+#define PSTXV0(s, a, r, d)		PREFIX_8LS(0xd8000000, s, a, r, d)
+#define PSTXV1(s, a, r, d)		PREFIX_8LS(0xdc000000, s, a, r, d)
+
 #endif /* _SELFTESTS_POWERPC_INSTRUCTIONS_H */
diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index e089a0c30d9a..eb91cf3561f8 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -101,6 +101,11 @@ do {								\
 #define PPC_FEATURE2_ARCH_3_00 0x00800000
 #endif
 
+/* POWER10 feature */
+#ifndef PPC_FEATURE2_ARCH_3_10
+#define PPC_FEATURE2_ARCH_3_10 0x00040000
+#endif
+
 #if defined(__powerpc64__)
 #define UCONTEXT_NIA(UC)	(UC)->uc_mcontext.gp_regs[PT_NIP]
 #define UCONTEXT_MSR(UC)	(UC)->uc_mcontext.gp_regs[PT_MSR]
-- 
2.17.1

