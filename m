Return-Path: <linuxppc-dev+bounces-10304-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BD7B093DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 20:25:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjhD96k1rz3bnL;
	Fri, 18 Jul 2025 04:24:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752776697;
	cv=none; b=na1Oz5rAQBfrZn42b7s41NreISAziMGJ2U6khgn7nCtDPv453pcXgXzZyf2LCqsdm5isZily/oEO41/yzxavCCbcmOBmtxQ+bSAyhRKOJxIBVUhIfeL2wmjI+x8JLArad262Rj4z/sDoaJo/rsaYqdUBSLEHWMonnrRlC+MRqsdiNfnBh26WbEN5xDG95Z4uhw4o5bQlGJyvKWtR5eoaN6xJ+M1xLFP6YLV9Jx/qriEKkU/6QsFOREkEgVz3DDXFn7QvvsZwgxTznDiFV8Ox1O6W4zRe6LLxKOEdOW6gmGgP3LUJKJ3uYXg9Yn9Ax3XCxV0mS4oIQHsAi/Ar9QNeAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752776697; c=relaxed/relaxed;
	bh=nZLgnvBfpUwPDoQV8fmk8sWnUfq6T+axrtqOmEMdNlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6E5JM4glKnaGVquU/W4uAbqwh8lvwCgALHqOsHtErU3HirDrh5lABhrHB6PWBfTynSSVnfJduxBQNVebgL4jsrZZQvaFNH5eypg2s4rqDyKsMsPJweaoHFAMzXrSzdC8yV41YWHdYizVGW/nebWv3YiMEd4DivhF4UylFx0nxQ2M7nziQp9UM3yNiSBzRqvmxmc/BzmSMZ73aTB1IQY62xUYh1qQx9gxhzT6e4kAbPwYdv0bx2RKUh0qdprQ/C5+1LPHxZsk5naG8+5OBXM51BGs3W+4NncFUqJmx0e6zdayHY8a0JJCwoFuUewtPRaUcCc7SOWIxyGXyUh6YV+5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qoMYEtIa; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=puranjay@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qoMYEtIa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=puranjay@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjhD91HZ2z2yMt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 04:24:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D815E44F41;
	Thu, 17 Jul 2025 18:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF84C4CEE3;
	Thu, 17 Jul 2025 18:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752776694;
	bh=q8eKevXXi+UQ1OwFBOXGgOAL2sn/edb+P2x0UDs5fKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qoMYEtIa27OeLBqqivsgvtk/Vg6bQIfYI4P1QYVk02Hw6Ju50qVIus8U537TJRdjP
	 VXtKK2fQnkd5ns16zUWS3XPVeMo57KuaoEC7oe6cNTrTDlPIujqWj9VlbOjuudjHvV
	 cLOmbN9n8SGiB5zDtTMLL3RNIulyHc18vjxksuu73WyzqQsVxDSai9iIq0F8WKf1BC
	 yyUEn9q2Ff0ZqMBLhDD0fdI1P2I0QRfoZct7lPtdSK4WQ/JUsht+9yTDpQoasAdIxZ
	 yay6ikjovkyppqsgpUa3CX6zqAD55H53PWm//E7p5wWYe94cImRpGyYQJx4x9zR+XV
	 6hbWaOPtl30Mw==
From: Puranjay Mohan <puranjay@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Alexei Starovoitov <ast@kernel.org>,
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
	Hari Bathini <hbathini@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Peilin Ye <yepeilin@google.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	"Paul E . McKenney" <paulmck@kernel.org>,
	lkmm@lists.linux.dev
Subject: [PATCH bpf-next 1/1] powerpc64/bpf: Add jit support for load_acquire and store_release
Date: Thu, 17 Jul 2025 18:24:43 +0000
Message-ID: <20250717182446.9408-2-puranjay@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250717182446.9408-1-puranjay@kernel.org>
References: <20250717182446.9408-1-puranjay@kernel.org>
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add JIT support for the load_acquire and store_release instructions. The
implementation is similar to the kernel where:

        load_acquire  => plain load -> lwsync
        store_release => lwsync -> plain store

To test the correctness of the implementation, following selftests were
run:

  [fedora@linux-kernel bpf]$ sudo ./test_progs -a \
  verifier_load_acquire,verifier_store_release,atomics
  #11/1    atomics/add:OK
  #11/2    atomics/sub:OK
  #11/3    atomics/and:OK
  #11/4    atomics/or:OK
  #11/5    atomics/xor:OK
  #11/6    atomics/cmpxchg:OK
  #11/7    atomics/xchg:OK
  #11      atomics:OK
  #519/1   verifier_load_acquire/load-acquire, 8-bit:OK
  #519/2   verifier_load_acquire/load-acquire, 8-bit @unpriv:OK
  #519/3   verifier_load_acquire/load-acquire, 16-bit:OK
  #519/4   verifier_load_acquire/load-acquire, 16-bit @unpriv:OK
  #519/5   verifier_load_acquire/load-acquire, 32-bit:OK
  #519/6   verifier_load_acquire/load-acquire, 32-bit @unpriv:OK
  #519/7   verifier_load_acquire/load-acquire, 64-bit:OK
  #519/8   verifier_load_acquire/load-acquire, 64-bit @unpriv:OK
  #519/9   verifier_load_acquire/load-acquire with uninitialized
  src_reg:OK
  #519/10  verifier_load_acquire/load-acquire with uninitialized src_reg
  @unpriv:OK
  #519/11  verifier_load_acquire/load-acquire with non-pointer src_reg:OK
  #519/12  verifier_load_acquire/load-acquire with non-pointer src_reg
  @unpriv:OK
  #519/13  verifier_load_acquire/misaligned load-acquire:OK
  #519/14  verifier_load_acquire/misaligned load-acquire @unpriv:OK
  #519/15  verifier_load_acquire/load-acquire from ctx pointer:OK
  #519/16  verifier_load_acquire/load-acquire from ctx pointer @unpriv:OK
  #519/17  verifier_load_acquire/load-acquire with invalid register R15:OK
  #519/18  verifier_load_acquire/load-acquire with invalid register R15
  @unpriv:OK
  #519/19  verifier_load_acquire/load-acquire from pkt pointer:OK
  #519/20  verifier_load_acquire/load-acquire from flow_keys pointer:OK
  #519/21  verifier_load_acquire/load-acquire from sock pointer:OK
  #519     verifier_load_acquire:OK
  #556/1   verifier_store_release/store-release, 8-bit:OK
  #556/2   verifier_store_release/store-release, 8-bit @unpriv:OK
  #556/3   verifier_store_release/store-release, 16-bit:OK
  #556/4   verifier_store_release/store-release, 16-bit @unpriv:OK
  #556/5   verifier_store_release/store-release, 32-bit:OK
  #556/6   verifier_store_release/store-release, 32-bit @unpriv:OK
  #556/7   verifier_store_release/store-release, 64-bit:OK
  #556/8   verifier_store_release/store-release, 64-bit @unpriv:OK
  #556/9   verifier_store_release/store-release with uninitialized
  src_reg:OK
  #556/10  verifier_store_release/store-release with uninitialized src_reg
  @unpriv:OK
  #556/11  verifier_store_release/store-release with uninitialized
  dst_reg:OK
  #556/12  verifier_store_release/store-release with uninitialized dst_reg
  @unpriv:OK
  #556/13  verifier_store_release/store-release with non-pointer
  dst_reg:OK
  #556/14  verifier_store_release/store-release with non-pointer dst_reg
  @unpriv:OK
  #556/15  verifier_store_release/misaligned store-release:OK
  #556/16  verifier_store_release/misaligned store-release @unpriv:OK
  #556/17  verifier_store_release/store-release to ctx pointer:OK
  #556/18  verifier_store_release/store-release to ctx pointer @unpriv:OK
  #556/19  verifier_store_release/store-release, leak pointer to stack:OK
  #556/20  verifier_store_release/store-release, leak pointer to stack
  @unpriv:OK
  #556/21  verifier_store_release/store-release, leak pointer to map:OK
  #556/22  verifier_store_release/store-release, leak pointer to map
  @unpriv:OK
  #556/23  verifier_store_release/store-release with invalid register
  R15:OK
  #556/24  verifier_store_release/store-release with invalid register R15
  @unpriv:OK
  #556/25  verifier_store_release/store-release to pkt pointer:OK
  #556/26  verifier_store_release/store-release to flow_keys pointer:OK
  #556/27  verifier_store_release/store-release to sock pointer:OK
  #556     verifier_store_release:OK
  Summary: 3/55 PASSED, 0 SKIPPED, 0 FAILED

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 arch/powerpc/include/asm/ppc-opcode.h        |  1 +
 arch/powerpc/net/bpf_jit_comp64.c            | 82 ++++++++++++++++++++
 tools/testing/selftests/bpf/progs/bpf_misc.h |  3 +-
 3 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 4312bcb913a42..8053b24afc395 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -425,6 +425,7 @@
 #define PPC_RAW_SC()			(0x44000002)
 #define PPC_RAW_SYNC()			(0x7c0004ac)
 #define PPC_RAW_ISYNC()			(0x4c00012c)
+#define PPC_RAW_LWSYNC()		(0x7c2004ac)
 
 /*
  * Define what the VSX XX1 form instructions will look like, then add
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index a25a6ffe7d7cc..025524378443e 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -409,6 +409,71 @@ asm (
 "		blr				;"
 );
 
+static int emit_atomic_ld_st(const struct bpf_insn insn, struct codegen_context *ctx, u32 *image)
+{
+	u32 code = insn.code;
+	u32 dst_reg = bpf_to_ppc(insn.dst_reg);
+	u32 src_reg = bpf_to_ppc(insn.src_reg);
+	u32 size = BPF_SIZE(code);
+	u32 tmp1_reg = bpf_to_ppc(TMP_REG_1);
+	u32 tmp2_reg = bpf_to_ppc(TMP_REG_2);
+	s16 off = insn.off;
+	s32 imm = insn.imm;
+
+	switch (imm) {
+	case BPF_LOAD_ACQ:
+		switch (size) {
+		case BPF_B:
+			EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
+			break;
+		case BPF_H:
+			EMIT(PPC_RAW_LHZ(dst_reg, src_reg, off));
+			break;
+		case BPF_W:
+			EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
+			break;
+		case BPF_DW:
+			if (off % 4) {
+				EMIT(PPC_RAW_LI(tmp1_reg, off));
+				EMIT(PPC_RAW_LDX(dst_reg, src_reg, tmp1_reg));
+			} else {
+				EMIT(PPC_RAW_LD(dst_reg, src_reg, off));
+			}
+			break;
+		}
+		EMIT(PPC_RAW_LWSYNC());
+		break;
+	case BPF_STORE_REL:
+		EMIT(PPC_RAW_LWSYNC());
+		switch (size) {
+		case BPF_B:
+			EMIT(PPC_RAW_STB(src_reg, dst_reg, off));
+			break;
+		case BPF_H:
+			EMIT(PPC_RAW_STH(src_reg, dst_reg, off));
+			break;
+		case BPF_W:
+			EMIT(PPC_RAW_STW(src_reg, dst_reg, off));
+			break;
+		case BPF_DW:
+			if (off % 4) {
+				EMIT(PPC_RAW_LI(tmp2_reg, off));
+				EMIT(PPC_RAW_STDX(src_reg, dst_reg, tmp2_reg));
+			} else {
+				EMIT(PPC_RAW_STD(src_reg, dst_reg, off));
+			}
+			break;
+		}
+		break;
+	default:
+		pr_err_ratelimited("unexpected atomic load/store op code %02x\n",
+				   imm);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /* Assemble the body code between the prologue & epilogue */
 int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct codegen_context *ctx,
 		       u32 *addrs, int pass, bool extra_pass)
@@ -898,8 +963,25 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		/*
 		 * BPF_STX ATOMIC (atomic ops)
 		 */
+		case BPF_STX | BPF_ATOMIC | BPF_B:
+		case BPF_STX | BPF_ATOMIC | BPF_H:
 		case BPF_STX | BPF_ATOMIC | BPF_W:
 		case BPF_STX | BPF_ATOMIC | BPF_DW:
+			if (bpf_atomic_is_load_store(&insn[i])) {
+				ret = emit_atomic_ld_st(insn[i], ctx, image);
+				if (ret)
+					return ret;
+
+				if (size != BPF_DW && insn_is_zext(&insn[i + 1]))
+					addrs[++i] = ctx->idx * 4;
+				break;
+			} else if (size == BPF_B || size == BPF_H) {
+				pr_err_ratelimited(
+					"eBPF filter atomic op code %02x (@%d) unsupported\n",
+					code, i);
+				return -EOPNOTSUPP;
+			}
+
 			save_reg = tmp2_reg;
 			ret_reg = src_reg;
 
diff --git a/tools/testing/selftests/bpf/progs/bpf_misc.h b/tools/testing/selftests/bpf/progs/bpf_misc.h
index 530752ddde8e4..c1cfd297aabf1 100644
--- a/tools/testing/selftests/bpf/progs/bpf_misc.h
+++ b/tools/testing/selftests/bpf/progs/bpf_misc.h
@@ -229,7 +229,8 @@
 
 #if __clang_major__ >= 18 && defined(ENABLE_ATOMICS_TESTS) &&		\
 	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86) ||	\
-	 (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64))
+	 (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)) || \
+	  (defined(__TARGET_ARCH_powerpc))
 #define CAN_USE_LOAD_ACQ_STORE_REL
 #endif
 
-- 
2.47.1


