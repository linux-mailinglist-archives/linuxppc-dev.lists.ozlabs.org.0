Return-Path: <linuxppc-dev+bounces-7844-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5973A94E97
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Apr 2025 11:26:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zh0Nd1hjBz3bgl;
	Mon, 21 Apr 2025 19:26:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=131.188.11.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745227569;
	cv=none; b=YrqsciKPmncMvqjG9rvOtqowZbxiLZFVsZmxJb91ZJ/jL2bzcCkrmvN/rrBcnDAf7J1Jt86j3ci+vCDgOvb0N0z4IFjGRyBs4x1G69FfjUp+wRr2ERJFVzXT86/4G6Kxo7fkE9hU9Alxu0N0EI569QFkjEXADY7gEwEnBuBgF2+mbdENPYhqzNm+NqBX91DkxP9ecxKREdhntbAK5muVYiALlmCneHEsEAMGLy2iGUjXSs8/aLCsU/9rV4LuU5OSFftMhkpycX/LYjMBN33tSzrQIF4GFOH4vjpgLyRBPiGdL2hnDmZajCGMViNivs2lULBG7HoOrWgdUMlqNLEnZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745227569; c=relaxed/relaxed;
	bh=Xyue3g1I0qoKeyh/KjpzyPNvXNp4hvzth20CjI5Juek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TrnPeDVa/VjaC+ZUs7TDaTk3XsMCcUYQfBCrLlodv94ZC5AOycfLwJS2VQEfaKZ3kz/eNojzm6EtxG7KND8kuLJ5NMm1ltlWcIGhiYY3XZze0nNTwreGIvxpbfugDeIsbvSvFaUGriQWXOzpJ43a1VlhXofCx0U1HNfK/NWwRRpf4KL+F02InQevSi7Ni6TLFt/KZFU0P/akxMhqpkf0qGTRH4ZStNGZ3sDauHZtRgi69uaWKR8QOPbWVDbAvZDeOXQHddCTEcWCIi49h+2UkV/1+DySYKgNTmzxT8IJ+KHONH2ec1CTm6113Wp8aGZ2rLVHce4rvrxOa6SeVpD0rg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de; dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=qtEreKam; dkim-atps=neutral; spf=pass (client-ip=131.188.11.20; helo=mx-rz-1.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org) smtp.mailfrom=fau.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=qtEreKam;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fau.de (client-ip=131.188.11.20; helo=mx-rz-1.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org)
Received: from mx-rz-1.rrze.uni-erlangen.de (mx-rz-1.rrze.uni-erlangen.de [131.188.11.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zh0Nc0Vrqz3bbm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 19:26:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1745227565; bh=Xyue3g1I0qoKeyh/KjpzyPNvXNp4hvzth20CjI5Juek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From:To:CC:
	 Subject;
	b=qtEreKamiVLL9jWyZ+1F9XSu5Dth48abDj4hR45o7dnBL7C8k00VeVEzdxXCONrcx
	 /zmReTQBUVkhFPbr9YDsyimFQlViQx3xK83fOilz4F7CGml4s9c50lVeblaKuVYhlL
	 k/4IetQa6jxRiBpj/FQL30llUrOXAFai6YJNoFN+jP/1JN+bptlbAF8oe+Xx2OLpvX
	 2DIAtraNu3mscX7woIYfQDnmrmZIGrKkXG03sYWgCItin7kBUVeL1SzG/F29nDuGEo
	 oiE9mHtS/tqpo0UGN4pTJy7riOwQ3lE3SK7eDL4KYhMD5CBUC0GWxGDDsWznImfGIJ
	 EE8KxhLZqE7oA==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Zh0NX6Qllz8sjF;
	Mon, 21 Apr 2025 11:26:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck2.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3600:7e00:5b67:6b9c:caeb:75c
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:3600:7e00:5b67:6b9c:caeb:75c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX18eT6tuUhWeAk0AAEnk8PUj+bSyeVYBrqw=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Zh0NS37NYz8sgC;
	Mon, 21 Apr 2025 11:26:00 +0200 (CEST)
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
Subject: [PATCH bpf-next v2 02/11] bpf: Move insn if/else into do_check_insn()
Date: Mon, 21 Apr 2025 11:17:53 +0200
Message-ID: <20250421091802.3234859-3-luis.gerhorst@fau.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421091802.3234859-1-luis.gerhorst@fau.de>
References: <20250421091802.3234859-1-luis.gerhorst@fau.de>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is required to catch the errors later and fall back to a nospec if
on a speculative path.

Eliminate the regs variable as it is only used once and insn_idx is not
modified in-between the definition and usage.

Still pass insn simply to match the other check_*() functions. As Eduard
points out [1], insn is assumed to correspond to env->insn_idx in many
places (e.g, __check_reg_arg()).

Move code into do_check_insn(), replace
* "continue" with "return 0" after modifying insn_idx
* "goto process_bpf_exit" with "return PROCESS_BPF_EXIT"
* "do_print_state = " with "*do_print_state = "

[1] https://lore.kernel.org/all/293dbe3950a782b8eb3b87b71d7a967e120191fd.camel@gmail.com/

Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
Acked-by: Henriette Herzog <henriette.herzog@rub.de>
Cc: Maximilian Ott <ott@cs.fau.de>
Cc: Milan Stephan <milan.stephan@fau.de>
---
 kernel/bpf/verifier.c | 425 ++++++++++++++++++++++--------------------
 1 file changed, 219 insertions(+), 206 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 54c6953a8b84..c4f197ca6c45 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -19389,20 +19389,218 @@ static int save_aux_ptr_type(struct bpf_verifier_env *env, enum bpf_reg_type typ
 	return 0;
 }
 
+enum {
+	PROCESS_BPF_EXIT = 1
+};
+
+static int do_check_insn(struct bpf_verifier_env *env, struct bpf_insn *insn,
+			 bool *do_print_state)
+{
+	int err;
+	u8 class = BPF_CLASS(insn->code);
+	bool exception_exit = false;
+
+	if (class == BPF_ALU || class == BPF_ALU64) {
+		err = check_alu_op(env, insn);
+		if (err)
+			return err;
+
+	} else if (class == BPF_LDX) {
+		bool is_ldsx = BPF_MODE(insn->code) == BPF_MEMSX;
+
+		/* Check for reserved fields is already done in
+		 * resolve_pseudo_ldimm64().
+		 */
+		err = check_load_mem(env, insn, false, is_ldsx, true, "ldx");
+		if (err)
+			return err;
+	} else if (class == BPF_STX) {
+		if (BPF_MODE(insn->code) == BPF_ATOMIC) {
+			err = check_atomic(env, insn);
+			if (err)
+				return err;
+			env->insn_idx++;
+			return 0;
+		}
+
+		if (BPF_MODE(insn->code) != BPF_MEM || insn->imm != 0) {
+			verbose(env, "BPF_STX uses reserved fields\n");
+			return -EINVAL;
+		}
+
+		err = check_store_reg(env, insn, false);
+		if (err)
+			return err;
+	} else if (class == BPF_ST) {
+		enum bpf_reg_type dst_reg_type;
+
+		if (BPF_MODE(insn->code) != BPF_MEM ||
+		    insn->src_reg != BPF_REG_0) {
+			verbose(env, "BPF_ST uses reserved fields\n");
+			return -EINVAL;
+		}
+		/* check src operand */
+		err = check_reg_arg(env, insn->dst_reg, SRC_OP);
+		if (err)
+			return err;
+
+		dst_reg_type = cur_regs(env)[insn->dst_reg].type;
+
+		/* check that memory (dst_reg + off) is writeable */
+		err = check_mem_access(env, env->insn_idx, insn->dst_reg,
+				       insn->off, BPF_SIZE(insn->code),
+				       BPF_WRITE, -1, false, false);
+		if (err)
+			return err;
+
+		err = save_aux_ptr_type(env, dst_reg_type, false);
+		if (err)
+			return err;
+	} else if (class == BPF_JMP || class == BPF_JMP32) {
+		u8 opcode = BPF_OP(insn->code);
+
+		env->jmps_processed++;
+		if (opcode == BPF_CALL) {
+			if (BPF_SRC(insn->code) != BPF_K ||
+			    (insn->src_reg != BPF_PSEUDO_KFUNC_CALL &&
+			     insn->off != 0) ||
+			    (insn->src_reg != BPF_REG_0 &&
+			     insn->src_reg != BPF_PSEUDO_CALL &&
+			     insn->src_reg != BPF_PSEUDO_KFUNC_CALL) ||
+			    insn->dst_reg != BPF_REG_0 || class == BPF_JMP32) {
+				verbose(env, "BPF_CALL uses reserved fields\n");
+				return -EINVAL;
+			}
+
+			if (env->cur_state->active_locks) {
+				if ((insn->src_reg == BPF_REG_0 && insn->imm != BPF_FUNC_spin_unlock) ||
+				    (insn->src_reg == BPF_PSEUDO_KFUNC_CALL &&
+				     (insn->off != 0 || !kfunc_spin_allowed(insn->imm)))) {
+					verbose(env,
+						"function calls are not allowed while holding a lock\n");
+					return -EINVAL;
+				}
+			}
+			if (insn->src_reg == BPF_PSEUDO_CALL) {
+				err = check_func_call(env, insn, &env->insn_idx);
+			} else if (insn->src_reg == BPF_PSEUDO_KFUNC_CALL) {
+				err = check_kfunc_call(env, insn, &env->insn_idx);
+				if (!err && is_bpf_throw_kfunc(insn)) {
+					exception_exit = true;
+					goto process_bpf_exit_full;
+				}
+			} else {
+				err = check_helper_call(env, insn, &env->insn_idx);
+			}
+			if (err)
+				return err;
+
+			mark_reg_scratched(env, BPF_REG_0);
+		} else if (opcode == BPF_JA) {
+			if (BPF_SRC(insn->code) != BPF_K ||
+			    insn->src_reg != BPF_REG_0 ||
+			    insn->dst_reg != BPF_REG_0 ||
+			    (class == BPF_JMP && insn->imm != 0) ||
+			    (class == BPF_JMP32 && insn->off != 0)) {
+				verbose(env, "BPF_JA uses reserved fields\n");
+				return -EINVAL;
+			}
+
+			if (class == BPF_JMP)
+				env->insn_idx += insn->off + 1;
+			else
+				env->insn_idx += insn->imm + 1;
+			return 0;
+		} else if (opcode == BPF_EXIT) {
+			if (BPF_SRC(insn->code) != BPF_K ||
+			    insn->imm != 0 ||
+			    insn->src_reg != BPF_REG_0 ||
+			    insn->dst_reg != BPF_REG_0 ||
+			    class == BPF_JMP32) {
+				verbose(env, "BPF_EXIT uses reserved fields\n");
+				return -EINVAL;
+			}
+process_bpf_exit_full:
+			/* We must do check_reference_leak here before
+			 * prepare_func_exit to handle the case when
+			 * state->curframe > 0, it may be a callback function,
+			 * for which reference_state must match caller reference
+			 * state when it exits.
+			 */
+			err = check_resource_leak(env, exception_exit, !env->cur_state->curframe,
+						  "BPF_EXIT instruction in main prog");
+			if (err)
+				return err;
+
+			/* The side effect of the prepare_func_exit which is
+			 * being skipped is that it frees bpf_func_state.
+			 * Typically, process_bpf_exit will only be hit with
+			 * outermost exit. copy_verifier_state in pop_stack will
+			 * handle freeing of any extra bpf_func_state left over
+			 * from not processing all nested function exits. We
+			 * also skip return code checks as they are not needed
+			 * for exceptional exits.
+			 */
+			if (exception_exit)
+				return PROCESS_BPF_EXIT;
+
+			if (env->cur_state->curframe) {
+				/* exit from nested function */
+				err = prepare_func_exit(env, &env->insn_idx);
+				if (err)
+					return err;
+				*do_print_state = true;
+				return 0;
+			}
+
+			err = check_return_code(env, BPF_REG_0, "R0");
+			if (err)
+				return err;
+			return PROCESS_BPF_EXIT;
+		} else {
+			err = check_cond_jmp_op(env, insn, &env->insn_idx);
+			if (err)
+				return err;
+		}
+	} else if (class == BPF_LD) {
+		u8 mode = BPF_MODE(insn->code);
+
+		if (mode == BPF_ABS || mode == BPF_IND) {
+			err = check_ld_abs(env, insn);
+			if (err)
+				return err;
+
+		} else if (mode == BPF_IMM) {
+			err = check_ld_imm(env, insn);
+			if (err)
+				return err;
+
+			env->insn_idx++;
+			sanitize_mark_insn_seen(env);
+		} else {
+			verbose(env, "invalid BPF_LD mode\n");
+			return -EINVAL;
+		}
+	} else {
+		verbose(env, "unknown insn class %d\n", class);
+		return -EINVAL;
+	}
+
+	env->insn_idx++;
+	return 0;
+}
+
 static int do_check(struct bpf_verifier_env *env)
 {
 	bool pop_log = !(env->log.level & BPF_LOG_LEVEL2);
 	struct bpf_verifier_state *state = env->cur_state;
 	struct bpf_insn *insns = env->prog->insnsi;
-	struct bpf_reg_state *regs;
 	int insn_cnt = env->prog->len;
 	bool do_print_state = false;
 	int prev_insn_idx = -1;
 
 	for (;;) {
-		bool exception_exit = false;
 		struct bpf_insn *insn;
-		u8 class;
 		int err;
 
 		/* reset current history entry on each new instruction */
@@ -19416,7 +19614,6 @@ static int do_check(struct bpf_verifier_env *env)
 		}
 
 		insn = &insns[env->insn_idx];
-		class = BPF_CLASS(insn->code);
 
 		if (++env->insn_processed > BPF_COMPLEXITY_LIMIT_INSNS) {
 			verbose(env,
@@ -19486,216 +19683,32 @@ static int do_check(struct bpf_verifier_env *env)
 				return err;
 		}
 
-		regs = cur_regs(env);
 		sanitize_mark_insn_seen(env);
 		prev_insn_idx = env->insn_idx;
 
-		if (class == BPF_ALU || class == BPF_ALU64) {
-			err = check_alu_op(env, insn);
-			if (err)
-				return err;
-
-		} else if (class == BPF_LDX) {
-			bool is_ldsx = BPF_MODE(insn->code) == BPF_MEMSX;
-
-			/* Check for reserved fields is already done in
-			 * resolve_pseudo_ldimm64().
-			 */
-			err = check_load_mem(env, insn, false, is_ldsx, true,
-					     "ldx");
-			if (err)
-				return err;
-		} else if (class == BPF_STX) {
-			if (BPF_MODE(insn->code) == BPF_ATOMIC) {
-				err = check_atomic(env, insn);
-				if (err)
-					return err;
-				env->insn_idx++;
-				continue;
-			}
-
-			if (BPF_MODE(insn->code) != BPF_MEM || insn->imm != 0) {
-				verbose(env, "BPF_STX uses reserved fields\n");
-				return -EINVAL;
-			}
-
-			err = check_store_reg(env, insn, false);
-			if (err)
-				return err;
-		} else if (class == BPF_ST) {
-			enum bpf_reg_type dst_reg_type;
-
-			if (BPF_MODE(insn->code) != BPF_MEM ||
-			    insn->src_reg != BPF_REG_0) {
-				verbose(env, "BPF_ST uses reserved fields\n");
-				return -EINVAL;
-			}
-			/* check src operand */
-			err = check_reg_arg(env, insn->dst_reg, SRC_OP);
-			if (err)
-				return err;
-
-			dst_reg_type = regs[insn->dst_reg].type;
-
-			/* check that memory (dst_reg + off) is writeable */
-			err = check_mem_access(env, env->insn_idx, insn->dst_reg,
-					       insn->off, BPF_SIZE(insn->code),
-					       BPF_WRITE, -1, false, false);
-			if (err)
-				return err;
-
-			err = save_aux_ptr_type(env, dst_reg_type, false);
-			if (err)
-				return err;
-		} else if (class == BPF_JMP || class == BPF_JMP32) {
-			u8 opcode = BPF_OP(insn->code);
-
-			env->jmps_processed++;
-			if (opcode == BPF_CALL) {
-				if (BPF_SRC(insn->code) != BPF_K ||
-				    (insn->src_reg != BPF_PSEUDO_KFUNC_CALL
-				     && insn->off != 0) ||
-				    (insn->src_reg != BPF_REG_0 &&
-				     insn->src_reg != BPF_PSEUDO_CALL &&
-				     insn->src_reg != BPF_PSEUDO_KFUNC_CALL) ||
-				    insn->dst_reg != BPF_REG_0 ||
-				    class == BPF_JMP32) {
-					verbose(env, "BPF_CALL uses reserved fields\n");
-					return -EINVAL;
-				}
-
-				if (env->cur_state->active_locks) {
-					if ((insn->src_reg == BPF_REG_0 && insn->imm != BPF_FUNC_spin_unlock) ||
-					    (insn->src_reg == BPF_PSEUDO_KFUNC_CALL &&
-					     (insn->off != 0 || !kfunc_spin_allowed(insn->imm)))) {
-						verbose(env, "function calls are not allowed while holding a lock\n");
-						return -EINVAL;
-					}
-				}
-				if (insn->src_reg == BPF_PSEUDO_CALL) {
-					err = check_func_call(env, insn, &env->insn_idx);
-				} else if (insn->src_reg == BPF_PSEUDO_KFUNC_CALL) {
-					err = check_kfunc_call(env, insn, &env->insn_idx);
-					if (!err && is_bpf_throw_kfunc(insn)) {
-						exception_exit = true;
-						goto process_bpf_exit_full;
-					}
-				} else {
-					err = check_helper_call(env, insn, &env->insn_idx);
-				}
-				if (err)
-					return err;
-
-				mark_reg_scratched(env, BPF_REG_0);
-			} else if (opcode == BPF_JA) {
-				if (BPF_SRC(insn->code) != BPF_K ||
-				    insn->src_reg != BPF_REG_0 ||
-				    insn->dst_reg != BPF_REG_0 ||
-				    (class == BPF_JMP && insn->imm != 0) ||
-				    (class == BPF_JMP32 && insn->off != 0)) {
-					verbose(env, "BPF_JA uses reserved fields\n");
-					return -EINVAL;
-				}
-
-				if (class == BPF_JMP)
-					env->insn_idx += insn->off + 1;
-				else
-					env->insn_idx += insn->imm + 1;
-				continue;
-
-			} else if (opcode == BPF_EXIT) {
-				if (BPF_SRC(insn->code) != BPF_K ||
-				    insn->imm != 0 ||
-				    insn->src_reg != BPF_REG_0 ||
-				    insn->dst_reg != BPF_REG_0 ||
-				    class == BPF_JMP32) {
-					verbose(env, "BPF_EXIT uses reserved fields\n");
-					return -EINVAL;
-				}
-process_bpf_exit_full:
-				/* We must do check_reference_leak here before
-				 * prepare_func_exit to handle the case when
-				 * state->curframe > 0, it may be a callback
-				 * function, for which reference_state must
-				 * match caller reference state when it exits.
-				 */
-				err = check_resource_leak(env, exception_exit, !env->cur_state->curframe,
-							  "BPF_EXIT instruction in main prog");
-				if (err)
-					return err;
-
-				/* The side effect of the prepare_func_exit
-				 * which is being skipped is that it frees
-				 * bpf_func_state. Typically, process_bpf_exit
-				 * will only be hit with outermost exit.
-				 * copy_verifier_state in pop_stack will handle
-				 * freeing of any extra bpf_func_state left over
-				 * from not processing all nested function
-				 * exits. We also skip return code checks as
-				 * they are not needed for exceptional exits.
-				 */
-				if (exception_exit)
-					goto process_bpf_exit;
-
-				if (state->curframe) {
-					/* exit from nested function */
-					err = prepare_func_exit(env, &env->insn_idx);
-					if (err)
-						return err;
-					do_print_state = true;
-					continue;
-				}
-
-				err = check_return_code(env, BPF_REG_0, "R0");
-				if (err)
-					return err;
+		err = do_check_insn(env, insn, &do_print_state);
+		if (err < 0) {
+			return err;
+		} else if (err == PROCESS_BPF_EXIT) {
 process_bpf_exit:
-				mark_verifier_state_scratched(env);
-				update_branch_counts(env, env->cur_state);
-				err = pop_stack(env, &prev_insn_idx,
-						&env->insn_idx, pop_log);
-				if (err < 0) {
-					if (err != -ENOENT)
-						return err;
-					break;
-				} else {
-					if (WARN_ON_ONCE(env->cur_state->loop_entry)) {
-						verbose(env, "verifier bug: env->cur_state->loop_entry != NULL\n");
-						return -EFAULT;
-					}
-					do_print_state = true;
-					continue;
-				}
-			} else {
-				err = check_cond_jmp_op(env, insn, &env->insn_idx);
-				if (err)
-					return err;
-			}
-		} else if (class == BPF_LD) {
-			u8 mode = BPF_MODE(insn->code);
-
-			if (mode == BPF_ABS || mode == BPF_IND) {
-				err = check_ld_abs(env, insn);
-				if (err)
-					return err;
-
-			} else if (mode == BPF_IMM) {
-				err = check_ld_imm(env, insn);
-				if (err)
+			mark_verifier_state_scratched(env);
+			update_branch_counts(env, env->cur_state);
+			err = pop_stack(env, &prev_insn_idx, &env->insn_idx,
+					pop_log);
+			if (err < 0) {
+				if (err != -ENOENT)
 					return err;
-
-				env->insn_idx++;
-				sanitize_mark_insn_seen(env);
+				break;
 			} else {
-				verbose(env, "invalid BPF_LD mode\n");
-				return -EINVAL;
+				if (WARN_ON_ONCE(env->cur_state->loop_entry)) {
+					verbose(env, "verifier bug: env->cur_state->loop_entry != NULL\n");
+					return -EFAULT;
+				}
+				do_print_state = true;
+				continue;
 			}
-		} else {
-			verbose(env, "unknown insn class %d\n", class);
-			return -EINVAL;
 		}
-
-		env->insn_idx++;
+		WARN_ON_ONCE(err);
 	}
 
 	return 0;
-- 
2.49.0


