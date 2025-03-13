Return-Path: <linuxppc-dev+bounces-7004-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C9EA601E7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 21:07:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDJSy53mrz3cTv;
	Fri, 14 Mar 2025 07:07:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:638:a000:1025::16"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741886612;
	cv=none; b=oghjhNqjTEYdTuBCa05LCGI4ntrz5BcHWkGrG+/f0dhjapnUOHFhamDv83Dve9Z4jw8nI0/1kv5ZDtik/ONrxde5z8tJUkLn8uH91dLHIOxl/0tQ+XrJNpz0/GeloyYNuMrGnIAMJ9A01FbNSHu4MJkJQ9yxjtLhQeAE1jSYV4hOdnGyPvfIvWLZQjkm9k5GtNTLVwmyWNZojDK3UCxr0KudMa0eY4KX85ZcWxnvh3n3Qmmt1TXHWZomSjyPxSkTdHqcJWz903b8EXvILsjeoXK65qnmsiEgF3AgoVFcHILZYytkQanJaASWR/7l1y4Vq032BwOQwODrT1J7nwhEAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741886612; c=relaxed/relaxed;
	bh=SV8sRFTXbQd7ZNvQw3kmVQGVSTtmmbNulqrI7fg5+QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BWsSrFiq+pXb4h3QYVKLGEsRGrXFhy7IsEBZpgTiyLemcxVQdhgmZAjpp3O/n6njlPO6bdOiVvqrjSnMgtMKcaEi4DM0rWeviUijzHLuO8DNuf2nA/fS7E/XeSSX2kMvgG9kRdAn/PjWGWxHbYeVjOtlTIYDNJXRaOxyfRBLiDwQfDRFc7SdHGy8LLG37UvkMRyrtA/T9x2H6ur6ragOB0o9j7NqveZ0PtNisY1nf+wyifqROAuGrfQPRln3y3/AnXQVCTTDKSC1Ef1C83ObOq5C5eQyiAY72t+UhRHB17qkLHySdwrzTKaWGq55NJ+8WQt8PruU3O7JrM8FTdUusQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de; dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=rUhEz7Bm; dkim-atps=neutral; spf=pass (client-ip=2001:638:a000:1025::16; helo=mx-rz-3.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org) smtp.mailfrom=fau.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=rUhEz7Bm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fau.de (client-ip=2001:638:a000:1025::16; helo=mx-rz-3.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org)
Received: from mx-rz-3.rrze.uni-erlangen.de (mx-rz-3.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDDqR2494z309h
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 04:23:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1741886605; bh=SV8sRFTXbQd7ZNvQw3kmVQGVSTtmmbNulqrI7fg5+QA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From:To:CC:
	 Subject;
	b=rUhEz7BmWcvoROXorkTWqSzHZeViwvht7GXdx7xS61Wupj2LvPOvLPpKNkZLTgtPx
	 +s0fkHHM5i+3zAQraITIptzTmjh9dNN1UAdmviZFJWdZGDDDyZ+MCM9clQS/MQHP7I
	 dVzc1IT58dSH8mCPYUxSu9gx7eA7sFCV8N9McQp/dEfrOb2V/o/oLkOyj6k6m1kdjO
	 J5IotMOrkl47LIODyBzesvWBkXafLHQ51mUGETPnYrnzPQgdythdLEsRbNWYVWz50b
	 6sNTjRzW5M2XaIh5gcGVV0yGaM+ydFHAp1rL6oyWfxjdq+ESLqgudVQEZvB9dFb+Kx
	 GNxuuuCdO8j2w==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-3.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4ZDDqK0y3Dz1yN1;
	Thu, 13 Mar 2025 18:23:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at boeck4.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3614:2b00:7ee6:68e5:4447:ba92
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:3614:2b00:7ee6:68e5:4447:ba92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX18W4GGBm+r81qR3pm/1UhdthI/9Lk9Kmh4=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4ZDDqF1Wy6z1xsl;
	Thu, 13 Mar 2025 18:23:21 +0100 (CET)
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
	Cupertino Miranda <cupertino.miranda@oracle.com>,
	Matan Shachnai <m.shachnai@gmail.com>,
	Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Daniel Xu <dxu@dxuuu.xyz>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>,
	WANG Xuerui <git@xen0n.name>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Maximilian Ott <ott@cs.fau.de>,
	Milan Stephan <milan.stephan@fau.de>
Subject: [PATCH bpf-next 01/11] bpf: Move insn if/else into do_check_insn()
Date: Thu, 13 Mar 2025 18:21:17 +0100
Message-ID: <20250313172127.1098195-2-luis.gerhorst@fau.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313172127.1098195-1-luis.gerhorst@fau.de>
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This is required to catch the errors later and fall back to a nospec if
on a speculative path.

Move code into do_check_insn(), replace
* "continue" with "return INSN_IDX_MODIFIED"
* "goto process_bpf_exit" with "return PROCESS_BPF_EXIT"
* "do_print_state = " with "*do_print_state = "

Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
Acked-by: Henriette Herzog <henriette.herzog@rub.de>
Cc: Maximilian Ott <ott@cs.fau.de>
Cc: Milan Stephan <milan.stephan@fau.de>
---
 kernel/bpf/verifier.c | 426 ++++++++++++++++++++++--------------------
 1 file changed, 224 insertions(+), 202 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 3303a3605ee8..199a6341ac82 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -19213,6 +19213,209 @@ static int save_aux_ptr_type(struct bpf_verifier_env *env, enum bpf_reg_type typ
 	return 0;
 }
 
+enum {
+	PROCESS_BPF_EXIT = 1,
+	INSN_IDX_MODIFIED
+};
+
+static int do_check_insn(struct bpf_verifier_env *env, struct bpf_insn *insn,
+			 bool pop_log, bool *do_print_state,
+			 struct bpf_reg_state *regs,
+			 struct bpf_verifier_state *state, int *prev_insn_idx)
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
+			return INSN_IDX_MODIFIED;
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
+		dst_reg_type = regs[insn->dst_reg].type;
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
+			return INSN_IDX_MODIFIED;
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
+			if (state->curframe) {
+				/* exit from nested function */
+				err = prepare_func_exit(env, &env->insn_idx);
+				if (err)
+					return err;
+				*do_print_state = true;
+				return INSN_IDX_MODIFIED;
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
+	return 0;
+}
+
 static int do_check(struct bpf_verifier_env *env)
 {
 	bool pop_log = !(env->log.level & BPF_LOG_LEVEL2);
@@ -19224,9 +19427,7 @@ static int do_check(struct bpf_verifier_env *env)
 	int prev_insn_idx = -1;
 
 	for (;;) {
-		bool exception_exit = false;
 		struct bpf_insn *insn;
-		u8 class;
 		int err;
 
 		/* reset current history entry on each new instruction */
@@ -19240,7 +19441,6 @@ static int do_check(struct bpf_verifier_env *env)
 		}
 
 		insn = &insns[env->insn_idx];
-		class = BPF_CLASS(insn->code);
 
 		if (++env->insn_processed > BPF_COMPLEXITY_LIMIT_INSNS) {
 			verbose(env,
@@ -19314,210 +19514,32 @@ static int do_check(struct bpf_verifier_env *env)
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
+		err = do_check_insn(env, insn, pop_log, &do_print_state, regs, state,
+				    &prev_insn_idx);
+		if (err < 0) {
+			return err;
+		} else if (err == INSN_IDX_MODIFIED) {
+			continue;
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
+		WARN_ON_ONCE(err);
 
 		env->insn_idx++;
 	}
-- 
2.48.1


