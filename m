Return-Path: <linuxppc-dev+bounces-7855-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9360A94F12
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Apr 2025 11:54:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zh1153S4Qz3c1S;
	Mon, 21 Apr 2025 19:54:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=131.188.11.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745229257;
	cv=none; b=OkJMvDnscMq/UmeuUFVuLfIdHJ1Wuozf9nBONXGTeTBXBtWqkFvgoY4yzH7TdOrryVeAYP93h2pRUPxoKgNk9sQfnq1e2Zp9MzLCV9I2kynXXjPj/brKaCqseR6gR0vHK4je+kY/080UE1C0bU6CUFC2jDsB5ChvNcmf2kQeHd/2b4RXzQ3xvjSLoa7oRyLs/FCHrcYJSxMQ7jQsXPOF+FCryzBG9csjljXw71fgvYhZ/CeJ/s9ni5MCJ8CCnt+wCWCjZH09KxYyCnveh+QkdrMXzPmzKQkfLMGzhuyiVr4GBG3WFrDWjGG1GTG68DNhEKoib7ewBTZPdehQrwpM1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745229257; c=relaxed/relaxed;
	bh=M6SlcB7avZDd+J/3syrPS0F9RsnPBXVsCWz4nLp28do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XmlYeKk1qzKuJ3Ar+oiPQNuy14DRPmeMC84UonOY+pSCukCh3zEqUHKJ+cbNlmpGYrs9VcDz5/IIsCWDIrObgW0T7DmT0j3m5PizAqG2q6drbsPdsPc56Z8+RSXX3jzDvevudnIRKIWPgejog3MBcxLStIUjGCLCelu4up3Twt0sVoWZq2VEOeSAndtVjQcbNE+DQ06BnGnuaCUFC61bTNKLxyAa3qHxYr2Xx5/uM1qxs+ZhzLjyLsjaDmDwD5ha17S+h2xSxHd2MENzwORWQLHTBLYGcgpJDRzbnd61c092Ml0DHJ29yfcJG6BkwpKlyfev5YG6uanIdMkZWt8ebQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de; dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=FmoeyPFH; dkim-atps=neutral; spf=pass (client-ip=131.188.11.20; helo=mx-rz-1.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org) smtp.mailfrom=fau.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=FmoeyPFH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fau.de (client-ip=131.188.11.20; helo=mx-rz-1.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org)
Received: from mx-rz-1.rrze.uni-erlangen.de (mx-rz-1.rrze.uni-erlangen.de [131.188.11.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zh1144FTdz2yYJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 19:54:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1745229253; bh=M6SlcB7avZDd+J/3syrPS0F9RsnPBXVsCWz4nLp28do=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From:To:CC:
	 Subject;
	b=FmoeyPFHIVK2HT7So63JnWXVoEOlP5X4jWvvMPaFcZYCbcFcPC6reRfSbUJIZWmaX
	 EX0JEjg7HSEOqbyAmzztmbQn8+AsLyXQCPaXYm8ppn3xFx1LnelD6L6dLR1MQtQ8yE
	 qlS6lsUhJJa8acyMRODP5/5gxauu95XGq41Kf2CvN9T+PfWdWts/3xxcNszw7uSzHs
	 rGW8xids7ZQUcv9rIjkSwlFQfMecK+U2t/Gg79yYRWHNh0RtBHMMsznd/1lYFCMD0u
	 wHRuq4nn717GjLihA8legNWnpN47OQnIuBrlk9U1rjBY1ayRgDva3f2FWGO4mKcc92
	 NeC50vSdYJK5Q==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Zh1113gNyz8syk;
	Mon, 21 Apr 2025 11:54:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck5.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3600:7e00:5b67:6b9c:caeb:75c
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:3600:7e00:5b67:6b9c:caeb:75c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX1+ek67R2sSwJhlHDH3iNjZTWMHvdQkVmBs=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Zh10x2lSXz8sv4;
	Mon, 21 Apr 2025 11:54:09 +0200 (CEST)
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
Subject: [PATCH bpf-next v2 10/11] bpf: Allow nospec-protected var-offset stack access
Date: Mon, 21 Apr 2025 11:18:01 +0200
Message-ID: <20250421091802.3234859-11-luis.gerhorst@fau.de>
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

Insert a nospec before the access to prevent it from ever using an index
that is subject to speculative scalar-confusion.

The access itself can either happen directly in the BPF program (reads
only, check_stack_read_var_off()) or in a helper (read/write,
check_helper_mem_access()).

This relies on the fact that the speculative scalar confusion that leads
to the variable-stack access going OOBs must stem from a prior
speculative store or branch bypass. Adding a nospec before the
variable-stack access will force all previously bypassed stores/branches
to complete and cause the stack access to only ever go to the stack slot
that is accessed architecturally.

Alternatively, the variable-offset stack access might be a write that
can itself be subject to speculative store bypass (this can happen in
theory even if this code adds a nospec /before/ the variable-offset
write). Only indirect writes by helpers might be affected here (e.g.,
those taking ARG_PTR_TO_MAP_VALUE). (Because check_stack_write_var_off()
does not use check_stack_range_initialized(), in-program variable-offset
writes are not affected.) If the in-helper write can be subject to
Spectre v4 and the helper writes/overwrites pointers on the BPF stack,
they are already a problem for fixed-offset stack accesses and should be
subject to Spectre v4 sanitization.

Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
Acked-by: Henriette Herzog <henriette.herzog@rub.de>
Cc: Maximilian Ott <ott@cs.fau.de>
Cc: Milan Stephan <milan.stephan@fau.de>
---
 kernel/bpf/verifier.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 92490964eb3b..2cd925b915e0 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7894,6 +7894,11 @@ static int check_atomic(struct bpf_verifier_env *env, struct bpf_insn *insn)
 	}
 }
 
+static struct bpf_insn_aux_data *cur_aux(const struct bpf_verifier_env *env)
+{
+	return &env->insn_aux_data[env->insn_idx];
+}
+
 /* When register 'regno' is used to read the stack (either directly or through
  * a helper function) make sure that it's within stack boundary and, depending
  * on the access type and privileges, that all elements of the stack are
@@ -7933,18 +7938,18 @@ static int check_stack_range_initialized(
 	if (tnum_is_const(reg->var_off)) {
 		min_off = max_off = reg->var_off.value + off;
 	} else {
-		/* Variable offset is prohibited for unprivileged mode for
+		/* Variable offset requires a nospec for unprivileged mode for
 		 * simplicity since it requires corresponding support in
 		 * Spectre masking for stack ALU.
 		 * See also retrieve_ptr_limit().
 		 */
 		if (!env->bypass_spec_v1) {
-			char tn_buf[48];
-
-			tnum_strn(tn_buf, sizeof(tn_buf), reg->var_off);
-			verbose(env, "R%d variable offset stack access prohibited for !root, var_off=%s\n",
-				regno, tn_buf);
-			return -EACCES;
+			/* Allow the access, but prevent it from using a
+			 * speculative offset using a nospec before the
+			 * dereference op.
+			 */
+			cur_aux(env)->nospec = true;
+			WARN_ON_ONCE(cur_aux(env)->alu_state);
 		}
 		/* Only initialized buffer on stack is allowed to be accessed
 		 * with variable offset. With uninitialized buffer it's hard to
@@ -11172,11 +11177,6 @@ static int check_get_func_ip(struct bpf_verifier_env *env)
 	return -ENOTSUPP;
 }
 
-static struct bpf_insn_aux_data *cur_aux(const struct bpf_verifier_env *env)
-{
-	return &env->insn_aux_data[env->insn_idx];
-}
-
 static bool loop_flag_is_zero(struct bpf_verifier_env *env)
 {
 	struct bpf_reg_state *regs = cur_regs(env);
-- 
2.49.0


