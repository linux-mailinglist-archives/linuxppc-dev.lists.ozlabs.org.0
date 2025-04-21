Return-Path: <linuxppc-dev+bounces-7845-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22967A94EA4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Apr 2025 11:29:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zh0Sp0F2nz3bkG;
	Mon, 21 Apr 2025 19:29:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=131.188.11.22
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745227785;
	cv=none; b=Hceu3Yl17uSTirOblZ41UR3HJzZSNCs67ejqXySx62zrCrio86Bh756EDGzGIUPrx/XP+YFJNi6Mq1NcbeqDFfZXLJ74JynhdY0sHR8lZq8EMvw9Vo6AaiL1ZUf59EM3PpQ0+9/vu9ohz+Yb8iG856ZjU+IuE61rsm8HNJvo+d/obUTGV8m3v9fG7qroVulv80qr06LtLUy+DG8y5rndaVuNP2jf3J5TuF/sHBgJouYCY3vNY2qsaPmdsYwcrajjfepmHdAsZXKhu8tylCzUvM35RBgMkgDxnGLCF/8lCjW/nwUs9B6GGpMHlXZm6DWos1Pa2uFvjdUmB9GDeuZyVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745227785; c=relaxed/relaxed;
	bh=IfNu1uJoVS/BrtoQH7rIL/Dd813dw7oNcw9fGEvJP20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fb3kxKM9sYNtSgUmZNut2Xpfhf/Qn4qzzZNQNKcaQyqJsv+RnSZL0xccnldMS5ABJWZJfbUUp01V3a6bTG6nOXUUI+ICu0FH5uoBMoHnCePJ2zwgs+B26vUn+HvK85u7psilCiXnhly9ixIxBuzNMLcGVgNDW3v89tZO7dTCSeT6klUqIKPY0x6nshgAPj8/GcUqwtoyl8kkk+77ZDihGNwXbjAMx1DPvzfPXEAdR5zPnhPohhl7wQZEWZzGlO3z9NCw7UeZaYV1cJSdm6KO+tM/I8loWrMbPel0g9qBTcFVo6qSfAMk7TbbgYWOCIN2e2KrWnZErww8iFX8hIn2Lw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de; dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=TXLTDFtO; dkim-atps=neutral; spf=pass (client-ip=131.188.11.22; helo=mx-rz-3.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org) smtp.mailfrom=fau.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=TXLTDFtO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fau.de (client-ip=131.188.11.22; helo=mx-rz-3.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org)
Received: from mx-rz-3.rrze.uni-erlangen.de (mx-rz-3.rrze.uni-erlangen.de [131.188.11.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zh0Sn1t4hz3bbm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 19:29:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1745227780; bh=IfNu1uJoVS/BrtoQH7rIL/Dd813dw7oNcw9fGEvJP20=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From:To:CC:
	 Subject;
	b=TXLTDFtOvM8lEVchmS6fHeYgp62SgipQH+zjLCWgvvAGadMVENFqc/l2kZiVoowmz
	 3ly54LdSbvTB54Ivpbd6ndaKNFDKqLvYokVCs4ScK/Np5sTQ4IfIatDIF+CHbagPVP
	 64zrwEjc3StY8rDQrAWtcKiDsLA7Y5uLBJAnfp2X6Qu9850040lB4UBk/rii+ulX8O
	 Rl3NxRZtHSUPGzOY/Ld3jN8ZoSfNBYO7q/XoZXAd4I2VzfhGNfK6SAJAQgH8R+pj6r
	 94+V1WdR/PV2appolBWVn4Ym1PqrEFvOyipQ+PRFSvwpetvp3PXHtxhJLgKIR04ud+
	 DFC4iQUaAB/RA==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-3.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Zh0Sh39Zhz1xpj;
	Mon, 21 Apr 2025 11:29:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck4.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3600:7e00:5b67:6b9c:caeb:75c
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:3600:7e00:5b67:6b9c:caeb:75c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX1/ARCRcez3ZGj4QcfuIJ4nogwdHn2ULTQg=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Zh0Sc21f1z1xvx;
	Mon, 21 Apr 2025 11:29:36 +0200 (CEST)
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
Subject: [PATCH bpf-next v2 03/11] bpf: Return -EFAULT on misconfigurations
Date: Mon, 21 Apr 2025 11:17:54 +0200
Message-ID: <20250421091802.3234859-4-luis.gerhorst@fau.de>
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
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Mark these cases as non-recoverable to later prevent them from being
caught when they occur during speculative path verification.

Eduard writes [1]:

  The only pace I'm aware of that might act upon specific error code
  from verifier syscall is libbpf. Looking through libbpf code, it seems
  that this change does not interfere with libbpf.

[1] https://lore.kernel.org/all/785b4531ce3b44a84059a4feb4ba458c68fce719.camel@gmail.com/

Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>
Acked-by: Henriette Herzog <henriette.herzog@rub.de>
Cc: Maximilian Ott <ott@cs.fau.de>
Cc: Milan Stephan <milan.stephan@fau.de>
---
 kernel/bpf/verifier.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index c4f197ca6c45..55c1d7ada098 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -8965,7 +8965,7 @@ static int resolve_map_arg_type(struct bpf_verifier_env *env,
 	if (!meta->map_ptr) {
 		/* kernel subsystem misconfigured verifier */
 		verbose(env, "invalid map_ptr to access map->type\n");
-		return -EACCES;
+		return -EFAULT;
 	}
 
 	switch (meta->map_ptr->map_type) {
@@ -9653,7 +9653,7 @@ static int check_func_arg(struct bpf_verifier_env *env, u32 arg,
 			 * that kernel subsystem misconfigured verifier
 			 */
 			verbose(env, "invalid map_ptr to access map->key\n");
-			return -EACCES;
+			return -EFAULT;
 		}
 		key_size = meta->map_ptr->key_size;
 		err = check_helper_mem_access(env, regno, key_size, BPF_READ, false, NULL);
@@ -9680,7 +9680,7 @@ static int check_func_arg(struct bpf_verifier_env *env, u32 arg,
 		if (!meta->map_ptr) {
 			/* kernel subsystem misconfigured verifier */
 			verbose(env, "invalid map_ptr to access map->value\n");
-			return -EACCES;
+			return -EFAULT;
 		}
 		meta->raw_mode = arg_type & MEM_UNINIT;
 		err = check_helper_mem_access(env, regno, meta->map_ptr->value_size,
@@ -10979,7 +10979,7 @@ record_func_map(struct bpf_verifier_env *env, struct bpf_call_arg_meta *meta,
 
 	if (map == NULL) {
 		verbose(env, "kernel subsystem misconfigured verifier\n");
-		return -EINVAL;
+		return -EFAULT;
 	}
 
 	/* In case of read-only, some additional restrictions
@@ -11018,7 +11018,7 @@ record_func_key(struct bpf_verifier_env *env, struct bpf_call_arg_meta *meta,
 		return 0;
 	if (!map || map->map_type != BPF_MAP_TYPE_PROG_ARRAY) {
 		verbose(env, "kernel subsystem misconfigured verifier\n");
-		return -EINVAL;
+		return -EFAULT;
 	}
 
 	reg = &regs[BPF_REG_3];
@@ -11272,7 +11272,7 @@ static int check_helper_call(struct bpf_verifier_env *env, struct bpf_insn *insn
 	if (changes_data && fn->arg1_type != ARG_PTR_TO_CTX) {
 		verbose(env, "kernel subsystem misconfigured func %s#%d: r1 != ctx\n",
 			func_id_name(func_id), func_id);
-		return -EINVAL;
+		return -EFAULT;
 	}
 
 	memset(&meta, 0, sizeof(meta));
@@ -11574,7 +11574,7 @@ static int check_helper_call(struct bpf_verifier_env *env, struct bpf_insn *insn
 		if (meta.map_ptr == NULL) {
 			verbose(env,
 				"kernel subsystem misconfigured verifier\n");
-			return -EINVAL;
+			return -EFAULT;
 		}
 
 		if (func_id == BPF_FUNC_map_lookup_elem &&
@@ -16697,7 +16697,7 @@ static int check_ld_imm(struct bpf_verifier_env *env, struct bpf_insn *insn)
 		dst_reg->type = CONST_PTR_TO_MAP;
 	} else {
 		verbose(env, "bpf verifier is misconfigured\n");
-		return -EINVAL;
+		return -EFAULT;
 	}
 
 	return 0;
@@ -16744,7 +16744,7 @@ static int check_ld_abs(struct bpf_verifier_env *env, struct bpf_insn *insn)
 
 	if (!env->ops->gen_ld_abs) {
 		verbose(env, "bpf verifier is misconfigured\n");
-		return -EINVAL;
+		return -EFAULT;
 	}
 
 	if (insn->dst_reg != BPF_REG_0 || insn->off != 0 ||
@@ -20781,7 +20781,7 @@ static int convert_ctx_accesses(struct bpf_verifier_env *env)
 						 -(subprogs[0].stack_depth + 8));
 		if (epilogue_cnt >= INSN_BUF_SIZE) {
 			verbose(env, "bpf verifier is misconfigured\n");
-			return -EINVAL;
+			return -EFAULT;
 		} else if (epilogue_cnt) {
 			/* Save the ARG_PTR_TO_CTX for the epilogue to use */
 			cnt = 0;
@@ -20804,13 +20804,13 @@ static int convert_ctx_accesses(struct bpf_verifier_env *env)
 	if (ops->gen_prologue || env->seen_direct_write) {
 		if (!ops->gen_prologue) {
 			verbose(env, "bpf verifier is misconfigured\n");
-			return -EINVAL;
+			return -EFAULT;
 		}
 		cnt = ops->gen_prologue(insn_buf, env->seen_direct_write,
 					env->prog);
 		if (cnt >= INSN_BUF_SIZE) {
 			verbose(env, "bpf verifier is misconfigured\n");
-			return -EINVAL;
+			return -EFAULT;
 		} else if (cnt) {
 			new_prog = bpf_patch_insn_data(env, 0, insn_buf, cnt);
 			if (!new_prog)
@@ -20967,7 +20967,7 @@ static int convert_ctx_accesses(struct bpf_verifier_env *env)
 
 			if (type == BPF_WRITE) {
 				verbose(env, "bpf verifier narrow ctx access misconfigured\n");
-				return -EINVAL;
+				return -EFAULT;
 			}
 
 			size_code = BPF_H;
@@ -20986,7 +20986,7 @@ static int convert_ctx_accesses(struct bpf_verifier_env *env)
 		if (cnt == 0 || cnt >= INSN_BUF_SIZE ||
 		    (ctx_field_size && !target_size)) {
 			verbose(env, "bpf verifier is misconfigured\n");
-			return -EINVAL;
+			return -EFAULT;
 		}
 
 		if (is_narrower_load && size < target_size) {
@@ -20994,7 +20994,7 @@ static int convert_ctx_accesses(struct bpf_verifier_env *env)
 				off, size, size_default) * 8;
 			if (shift && cnt + 1 >= INSN_BUF_SIZE) {
 				verbose(env, "bpf verifier narrow ctx load misconfigured\n");
-				return -EINVAL;
+				return -EFAULT;
 			}
 			if (ctx_field_size <= 4) {
 				if (shift)
@@ -21757,7 +21757,7 @@ static int do_misc_fixups(struct bpf_verifier_env *env)
 			cnt = env->ops->gen_ld_abs(insn, insn_buf);
 			if (cnt == 0 || cnt >= INSN_BUF_SIZE) {
 				verbose(env, "bpf verifier is misconfigured\n");
-				return -EINVAL;
+				return -EFAULT;
 			}
 
 			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
@@ -22093,7 +22093,7 @@ static int do_misc_fixups(struct bpf_verifier_env *env)
 					goto patch_map_ops_generic;
 				if (cnt <= 0 || cnt >= INSN_BUF_SIZE) {
 					verbose(env, "bpf verifier is misconfigured\n");
-					return -EINVAL;
+					return -EFAULT;
 				}
 
 				new_prog = bpf_patch_insn_data(env, i + delta,
@@ -22453,7 +22453,7 @@ static int do_misc_fixups(struct bpf_verifier_env *env)
 		    !map_ptr->ops->map_poke_untrack ||
 		    !map_ptr->ops->map_poke_run) {
 			verbose(env, "bpf verifier is misconfigured\n");
-			return -EINVAL;
+			return -EFAULT;
 		}
 
 		ret = map_ptr->ops->map_poke_track(map_ptr, prog->aux);
-- 
2.49.0


