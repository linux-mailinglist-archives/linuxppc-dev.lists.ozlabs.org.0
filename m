Return-Path: <linuxppc-dev+bounces-7011-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A90E6A601EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 21:09:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDJWK50BGz3cYF;
	Fri, 14 Mar 2025 07:09:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=131.188.11.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741888052;
	cv=none; b=Np3ZtIVCYmIMEI+Ri7wefo6Pmt5P/mSWBh9GoCI5IjlVlh/e/qexiEPb4RB05gRGB15n1OwzbfDvH3ZyEXscWabnj3ImK+0aA1EBvevQbupKVgrNfbN6909Rsp1EAruToQbG6GRvtdrMHJK/M57X4SCdscEaU+sNmcoF/L+ov3/IqBl9Wl/Ow2Ux7C4xgvFwZGrM7I6cYo3KRHv3yaZw0jbLRFV6L/NFBi2N+jvfp6jXCQKk2xx/0EBRZRpJaHuXySA9C12v4e+EUFuaSXhCBzP6Jw8RrSytKl2JbAAMGBMeKNj3h1xARIhk545PwCcRcesQgMkFt34+Bijl6Fzmog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741888052; c=relaxed/relaxed;
	bh=7PdRevp9VEBQ7cXe+7SQLSfTFULBTjgQdqLzMbVqv7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C7Qi3o+OG5KiAcRAbXVIDhjLnJVd2jvfiw/CA6z7W1U+aBEUvRCygXIszEEjsg4C22bir4uyvtrjJroxLjB2XrZwgMa2JJqAH3FowaN98+BLtpqg9eIL2jA+tR0gVzSWAwXoTyXwEeC50kDvF0bQIknsxcTVgIuQRZCKP1uiOywwJgqHLAp26f7m6nYwcfPL1UbUL8jnvbtxod4Gwv/YChRBE3ns9nQCwa51kU5d0bv2imORXOHiRCEm2BjjyTtv6WXLcXLjiWC/TdYeTiNyOTvOnMhtgFIZrBgFB2x4vyh7qUOncCkJu+hoNe9Dkfot1PYd9Ezrry3wkUJHEJ9yUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de; dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=OdzuV4hB; dkim-atps=neutral; spf=pass (client-ip=131.188.11.21; helo=mx-rz-2.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org) smtp.mailfrom=fau.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=OdzuV4hB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fau.de (client-ip=131.188.11.21; helo=mx-rz-2.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org)
Received: from mx-rz-2.rrze.uni-erlangen.de (mx-rz-2.rrze.uni-erlangen.de [131.188.11.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDFM75Rmxz3c6c
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 04:47:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1741888048; bh=7PdRevp9VEBQ7cXe+7SQLSfTFULBTjgQdqLzMbVqv7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From:To:CC:
	 Subject;
	b=OdzuV4hBjdperRm0XJOh2lk2Vh3TaWgTXirNqf6btIxTKqUuKQKbTti196BtDLE10
	 EnabT2TpBViOZFl85SCJ1WvXDOol1iuY6w03mEIp6YkmJqocIposjTAfU16QJXS1+G
	 AJHYYnLfFHCrGKq28gmAUkKY6dJ5MGc4HhQBlS4p6gSFVljkCJues9EtLy1Y5uoNUG
	 WttBODYXpemaNkvZGyqiZeQPst1vL5+NRYIcsvc3XeS20HpsCPs47y5pYHVn7FXpxZ
	 OE55JosgXUbJcSYolp3bzaq13u+V4AhOrx5B6sW544da05jdcZlxTDqUIdXAiRD8LD
	 k1RZLnKf1flFg==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-2.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4ZDFM40SxpzPjxV;
	Thu, 13 Mar 2025 18:47:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at boeck5.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3614:2b00:7ee6:68e5:4447:ba92
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:3614:2b00:7ee6:68e5:4447:ba92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX18m9Vn9FOlTwMXhkaYiMwSCy8dUUwAZyWw=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4ZDFM03tYpzPjvW;
	Thu, 13 Mar 2025 18:47:24 +0100 (CET)
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
Subject: [PATCH bpf-next 08/11] bpf: Allow nospec-protected var-offset stack access
Date: Thu, 13 Mar 2025 18:41:46 +0100
Message-ID: <20250313174149.1113165-3-luis.gerhorst@fau.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313174149.1113165-1-luis.gerhorst@fau.de>
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
 <20250313174149.1113165-1-luis.gerhorst@fau.de>
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
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Insert a nospec before the access to prevent it from ever using an index
that is subject to speculative scalar-confusion.

Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
Acked-by: Henriette Herzog <henriette.herzog@rub.de>
Cc: Maximilian Ott <ott@cs.fau.de>
Cc: Milan Stephan <milan.stephan@fau.de>
---
 kernel/bpf/verifier.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 8093a5bac4d1..683a76aceffa 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7858,6 +7858,11 @@ static int check_atomic(struct bpf_verifier_env *env, struct bpf_insn *insn)
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
@@ -7897,18 +7902,18 @@ static int check_stack_range_initialized(
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
@@ -11096,11 +11101,6 @@ static int check_get_func_ip(struct bpf_verifier_env *env)
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
2.48.1


