Return-Path: <linuxppc-dev+bounces-8218-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AF1AA5BA5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 May 2025 09:54:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zp5tR2zgCz2yYy;
	Thu,  1 May 2025 17:54:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:638:a000:1025::16"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746086079;
	cv=none; b=bDtz2LL9GPrGhKht4pCH9Ne+j1oTnqJOdBOSFNn0HwuCFq5LUT9PubvMDcbRvcccsjdtGBbH77iGtGFeGL3AhMIerc9+SFGVsocMnYrENpr33iad33CwDmtg4dTK2Q/U5wAM59/9MXmSXmyJ8gpUNQeZ9Io/XXRWjWbb7DDbCI9Ne2BkQML9tz8n7SwrvnUKmx0mSEeuTie5LvWOsjkOauSpVuZPmQWokNJhv8uEO0QB1nDec8jgk52ItYloqxSCs++VfmL0gqrdy9zs+t6XXGfHhXUdl1Mg2rojFzsfG/OrtpRRLh1RUZEk5/ZRi1IQdvRQUcbBeDQRp0414OJ87g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746086079; c=relaxed/relaxed;
	bh=xHPPBpRTHt7hqIB75P6wTddLdLQzbcsXK310PBjKF+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VLPj75zLjHUH44pqbGNk5Fkyo4s7pv+3fy4QrNhL8XO/5a64vtHoEbDC/mRfu463fa4rg+ohH0HV0gsNPUIY/7SM5I9fzAGHs/AFeVxTjpXCvqRO+6kmzJ55PXGtVQKdjlS/PGmxBZ522XyqUuEHRnWPgOOhecuU+3nlwi/Smq1qaA+atllQbTyb/eGWCM2TxbCjZdXNUZHiWjHYmF/ZEX+mPKLpwQkT4JQoAP+SREjuv9GYVA6bfg1rINc1MM3tIaURH92GERdBLCd2q0Z3+zYjA3f45uPbk9RmEBNhvoqNQl28p+KWDbWHI8TR3CY/IA6UF7RuqnKYZEl1CcSQGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de; dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=u9zkmS08; dkim-atps=neutral; spf=pass (client-ip=2001:638:a000:1025::16; helo=mx-rz-3.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org) smtp.mailfrom=fau.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=u9zkmS08;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fau.de (client-ip=2001:638:a000:1025::16; helo=mx-rz-3.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org)
Received: from mx-rz-3.rrze.uni-erlangen.de (mx-rz-3.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zp5tP1hyKz2yWK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 17:54:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1746086073; bh=xHPPBpRTHt7hqIB75P6wTddLdLQzbcsXK310PBjKF+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From:To:CC:
	 Subject;
	b=u9zkmS08+GalZCnDs4Jnd/yiWu3koSig21exixk73aLRfG10JOtB1WQbiA3yU8R7J
	 AxtsUvSk87042cTA5kTaCEsMUJ3PHaH4qO9pzIujkgIDCk+RiWKhQAh/9XER6WK/q0
	 szd8O+bzyCp78326i1wsiIPSWk7hRwWG+J6PTdLBFUb+QAZh42KiFKh7ed03ujJLgv
	 vN74Cb+XkZUg/FW2qWibkjYCUbD+9perB9jdKgkajR7ZasayP+4CLklWCl3OmERUI3
	 7LUvQuCFFutSE8pl8l7mz1qjS8q3fmnlnTiX777ydYnL4JUzwMPAtE5ooB1ng3B5G0
	 7egh3GQKx6R0w==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-3.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Zp5tK4b96z1yVn;
	Thu,  1 May 2025 09:54:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck5.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3636:a700:12b2:e53f:6cbc:f48c
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:3636:a700:12b2:e53f:6cbc:f48c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX1/k/6jp9aKQwnzEgcjyEBf0BbqRtrkGM+U=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Zp5tD6LrVz20sl;
	Thu,  1 May 2025 09:54:28 +0200 (CEST)
From: Luis Gerhorst <luis.gerhorst@fau.de>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <shuah@kernel.org>,
	Luis Gerhorst <luis.gerhorst@fau.de>,
	Henriette Herzog <henriette.herzog@rub.de>,
	Saket Kumar Bhaskar <skb99@linux.ibm.com>,
	Cupertino Miranda <cupertino.miranda@oracle.com>,
	Jiayuan Chen <mrpre@163.com>,
	Matan Shachnai <m.shachnai@gmail.com>,
	Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Daniel Xu <dxu@dxuuu.xyz>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Cc: Maximilian Ott <ott@cs.fau.de>,
	Milan Stephan <milan.stephan@fau.de>
Subject: [PATCH bpf-next v3 06/11] bpf, arm64, powerpc: Change nospec to include v1 barrier
Date: Thu,  1 May 2025 09:35:57 +0200
Message-ID: <20250501073603.1402960-7-luis.gerhorst@fau.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250501073603.1402960-1-luis.gerhorst@fau.de>
References: <20250501073603.1402960-1-luis.gerhorst@fau.de>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This changes the semantics of BPF_NOSPEC (previously a v4-only barrier)
to always emit a speculation barrier that works against both Spectre v1
AND v4. If mitigation is not needed on an architecture, the backend
should set bpf_jit_bypass_spec_v4/v1().

As of now, this commit only has the user-visible implication that unpriv
BPF's performance on PowerPC is reduced. This is the case because we
have to emit additional v1 barrier instructions for BPF_NOSPEC now.

This commit is required for a future commit to allow us to rely on
BPF_NOSPEC for Spectre v1 mitigation. As of this commit, the feature
that nospec acts as a v1 barrier is unused.

Commit f5e81d111750 ("bpf: Introduce BPF nospec instruction for
mitigating Spectre v4") noted that mitigation instructions for v1 and v4
might be different on some archs. While this would potentially offer
improved performance on PowerPC, it was dismissed after the following
considerations:

* Only having one barrier simplifies the verifier and allows us to
  easily rely on v4-induced barriers for reducing the complexity of
  v1-induced speculative path verification.

* For the architectures that implemented BPF_NOSPEC, only PowerPC has
  distinct instructions for v1 and v4. Even there, some insns may be
  shared between the barriers for v1 and v4 (e.g., 'ori 31,31,0' and
  'sync'). If this is still found to impact performance in an
  unacceptable way, BPF_NOSPEC can be split into BPF_NOSPEC_V1 and
  BPF_NOSPEC_V4 later. As an optimization, we can already skip v1/v4
  insns from being emitted for PowerPC with this setup if
  bypass_spec_v1/v4 is set.

Vulnerability-status for BPF_NOSPEC-based Spectre mitigations (v4 as of
this commit, v1 in the future) is therefore:

* x86 (32-bit and 64-bit), ARM64, and PowerPC (64-bit): Mitigated - This
  patch implements BPF_NOSPEC for these architectures. The previous
  v4-only version was supported since commit f5e81d111750 ("bpf:
  Introduce BPF nospec instruction for mitigating Spectre v4") and
  commit b7540d625094 ("powerpc/bpf: Emit stf barrier instruction
  sequences for BPF_NOSPEC").

* LoongArch: Not Vulnerable - Commit a6f6a95f2580 ("LoongArch, bpf: Fix
  jit to skip speculation barrier opcode") is the only other past commit
  related to BPF_NOSPEC and indicates that the insn is not required
  there.

* MIPS: Vulnerable (if unprivileged BPF is enabled) -
  Commit a6f6a95f2580 ("LoongArch, bpf: Fix jit to skip speculation
  barrier opcode") indicates that it is not vulnerable but this
  contradicts the kernel and Debian documentation. Therefore I assume
  that there exist vulnerable MIPS CPUs (but maybe not from Loongson?).
  In the future, BPF_NOSPEC could be implemented for MIPS based on the
  GCC speculation_barrier [1]. For now, we rely on unprivileged BPF
  being disabled by default.

* Other: Unknown - To the best of my knowledge there is no definitive
  information available that indicates that any other arch is
  vulnerable. They are therefore left untouched (BPF_NOSPEC is not
  implemented, but bypass_spec_v1/v4 is also not set).

I did the following testing to ensure the insn encoding is correct:

* ARM64:
  * 'dsb nsh; isb' was successfully tested with the BPF CI in [2]
  * 'sb' locally using QEMU v7.2.15 -cpu max (emitted sb insn is
    executed for example with './test_progs -t verifier_array_access')

* PowerPC: The following configs were tested locally with ppc64le QEMU
  v8.2 '-machine pseries -cpu POWER9':
  * STF_BARRIER_EIEIO + CONFIG_PPC_BOOK32_64
  * STF_BARRIER_SYNC_ORI (forced on) + CONFIG_PPC_BOOK32_64
  * STF_BARRIER_FALLBACK (forced on) + CONFIG_PPC_BOOK32_64
  * CONFIG_PPC_E500 (forced on) + STF_BARRIER_EIEIO
  * CONFIG_PPC_E500 (forced on) + STF_BARRIER_SYNC_ORI (forced on)
  * CONFIG_PPC_E500 (forced on) + STF_BARRIER_FALLBACK (forced on)
  * CONFIG_PPC_E500 (forced on) + STF_BARRIER_NONE (forced on)
  Most of those cobinations should not occur in practice, but I was not
  able to get an PPC e6500 rootfs (for testing PPC_E500 without forcing
  it on). In any case, this should ensure that there are no unexpected
  conflicts between the insns when combined like this. Individual v1/v4
  barriers were already emitted elsewhere.

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=29b74545531f6afbee9fc38c267524326dbfbedf
    ("MIPS: Add speculation_barrier support")
[2] https://github.com/kernel-patches/bpf/pull/8576

Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: Henriette Herzog <henriette.herzog@rub.de>
Cc: Maximilian Ott <ott@cs.fau.de>
Cc: Milan Stephan <milan.stephan@fau.de>
---
 arch/arm64/net/bpf_jit.h          |  5 +++
 arch/arm64/net/bpf_jit_comp.c     |  9 +++--
 arch/powerpc/net/bpf_jit_comp64.c | 59 ++++++++++++++++++++++---------
 include/linux/filter.h            |  2 +-
 kernel/bpf/core.c                 | 17 ++++-----
 5 files changed, 65 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/net/bpf_jit.h b/arch/arm64/net/bpf_jit.h
index a3b0e693a125..bbea4f36f9f2 100644
--- a/arch/arm64/net/bpf_jit.h
+++ b/arch/arm64/net/bpf_jit.h
@@ -325,4 +325,9 @@
 #define A64_MRS_SP_EL0(Rt) \
 	aarch64_insn_gen_mrs(Rt, AARCH64_INSN_SYSREG_SP_EL0)
 
+/* Barriers */
+#define A64_SB aarch64_insn_get_sb_value()
+#define A64_DSB_NSH (aarch64_insn_get_dsb_base_value() | 0x7 << 8)
+#define A64_ISB aarch64_insn_get_isb_value()
+
 #endif /* _BPF_JIT_H */
diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 0f617b55866e..ccd6a2f31e35 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -1581,9 +1581,14 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
 			return ret;
 		break;
 
-	/* speculation barrier */
+	/* speculation barrier against v1 and v4 */
 	case BPF_ST | BPF_NOSPEC:
-		/* See bpf_jit_bypass_spec_v4() */
+		if (alternative_has_cap_likely(ARM64_HAS_SB)) {
+			emit(A64_SB, ctx);
+		} else {
+			emit(A64_DSB_NSH, ctx);
+			emit(A64_ISB, ctx);
+		}
 		break;
 
 	/* ST: *(size *)(dst + off) = imm */
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index b5339c541283..16d57bce6ddc 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -407,6 +407,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		       u32 *addrs, int pass, bool extra_pass)
 {
 	enum stf_barrier_type stf_barrier = stf_barrier_type_get();
+	bool sync_emitted, ori31_emitted;
 	const struct bpf_insn *insn = fp->insnsi;
 	int flen = fp->len;
 	int i, ret;
@@ -800,26 +801,52 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 
 		/*
 		 * BPF_ST NOSPEC (speculation barrier)
+		 *
+		 * The following must act as a barrier against both Spectre v1
+		 * and v4 if we requested both mitigations. Therefore, also emit
+		 * 'isync; sync' on E500 or 'ori31' on BOOK3S_64 in addition to
+		 * the insns needed for a Spectre v4 barrier.
+		 *
+		 * If we requested only !bypass_spec_v1 OR only !bypass_spec_v4,
+		 * we can skip the respective other barrier type as an
+		 * optimization.
 		 */
 		case BPF_ST | BPF_NOSPEC:
-			switch (stf_barrier) {
-			case STF_BARRIER_EIEIO:
-				EMIT(PPC_RAW_EIEIO() | 0x02000000);
-				break;
-			case STF_BARRIER_SYNC_ORI:
+			sync_emitted = false;
+			ori31_emitted = false;
+#ifdef CONFIG_PPC_E500
+			if (!bpf_jit_bypass_spec_v1()) {
+				EMIT(PPC_RAW_ISYNC());
 				EMIT(PPC_RAW_SYNC());
-				EMIT(PPC_RAW_LD(tmp1_reg, _R13, 0));
-				EMIT(PPC_RAW_ORI(_R31, _R31, 0));
-				break;
-			case STF_BARRIER_FALLBACK:
-				ctx->seen |= SEEN_FUNC;
-				PPC_LI64(_R12, dereference_kernel_function_descriptor(bpf_stf_barrier));
-				EMIT(PPC_RAW_MTCTR(_R12));
-				EMIT(PPC_RAW_BCTRL());
-				break;
-			case STF_BARRIER_NONE:
-				break;
+				sync_emitted = true;
+			}
+#endif
+			if (!bpf_jit_bypass_spec_v4()) {
+				switch (stf_barrier) {
+				case STF_BARRIER_EIEIO:
+					EMIT(PPC_RAW_EIEIO() | 0x02000000);
+					break;
+				case STF_BARRIER_SYNC_ORI:
+					if (!sync_emitted)
+						EMIT(PPC_RAW_SYNC());
+					EMIT(PPC_RAW_LD(tmp1_reg, _R13, 0));
+					EMIT(PPC_RAW_ORI(_R31, _R31, 0));
+					ori31_emitted = true;
+					break;
+				case STF_BARRIER_FALLBACK:
+					ctx->seen |= SEEN_FUNC;
+					PPC_LI64(_R12, dereference_kernel_function_descriptor(bpf_stf_barrier));
+					EMIT(PPC_RAW_MTCTR(_R12));
+					EMIT(PPC_RAW_BCTRL());
+					break;
+				case STF_BARRIER_NONE:
+					break;
+				}
 			}
+#ifdef CONFIG_PPC_BOOK3S_64
+			if (!bpf_jit_bypass_spec_v1() && !ori31_emitted)
+				EMIT(PPC_RAW_ORI(_R31, _R31, 0));
+#endif
 			break;
 
 		/*
diff --git a/include/linux/filter.h b/include/linux/filter.h
index f5cf4d35d83e..eca229752cbe 100644
--- a/include/linux/filter.h
+++ b/include/linux/filter.h
@@ -82,7 +82,7 @@ struct ctl_table_header;
 #define BPF_CALL_ARGS	0xe0
 
 /* unused opcode to mark speculation barrier for mitigating
- * Speculative Store Bypass
+ * Spectre v1 and v4
  */
 #define BPF_NOSPEC	0xc0
 
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 804f1e52bfa3..fe16be379bf4 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -2102,14 +2102,15 @@ static u64 ___bpf_prog_run(u64 *regs, const struct bpf_insn *insn)
 #undef COND_JMP
 	/* ST, STX and LDX*/
 	ST_NOSPEC:
-		/* Speculation barrier for mitigating Speculative Store Bypass.
-		 * In case of arm64, we rely on the firmware mitigation as
-		 * controlled via the ssbd kernel parameter. Whenever the
-		 * mitigation is enabled, it works for all of the kernel code
-		 * with no need to provide any additional instructions here.
-		 * In case of x86, we use 'lfence' insn for mitigation. We
-		 * reuse preexisting logic from Spectre v1 mitigation that
-		 * happens to produce the required code on x86 for v4 as well.
+		/* Speculation barrier for mitigating Speculative Store Bypass,
+		 * Bounds-Check Bypass and Type Confusion. In case of arm64, we
+		 * rely on the firmware mitigation as controlled via the ssbd
+		 * kernel parameter. Whenever the mitigation is enabled, it
+		 * works for all of the kernel code with no need to provide any
+		 * additional instructions here. In case of x86, we use 'lfence'
+		 * insn for mitigation. We reuse preexisting logic from Spectre
+		 * v1 mitigation that happens to produce the required code on
+		 * x86 for v4 as well.
 		 */
 		barrier_nospec();
 		CONT;
-- 
2.49.0


