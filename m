Return-Path: <linuxppc-dev+bounces-9122-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7B5ACCEDF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 23:20:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBkCP1k8tz2yYJ;
	Wed,  4 Jun 2025 07:20:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:638:a000:1025::14"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748985649;
	cv=none; b=JWW5uy5eSaacF9YrsQUf16E9wE3KbF7tdEVRk0Hz/Sjmrp9dVWJMMQcd1vmMSgfwMtzcCrcaoJeCIeL+uy3NKOW827ryfJDlr4V2PizZxSS07KMzhSYzAWN1kNzxCZHAEC78iXulP1mlf2J1niCzysswO9OisBBb6cuTQKLNvFT1ovHG0P3DlvlXFFyex7ZSW1DzDMYDaXBsmc71kuLP9Tu8gyGiNATCn5kpn7DTlGhodyssHubiGn5s52LupsCo76tHsSuldkTLLijcxutYLzZSumuZ914UB5Q5LkoX4k+Ed26Kuts5VA25rLra4zrIOxU4Vyagfl7+DSafO085YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748985649; c=relaxed/relaxed;
	bh=aLkGL0PRMc+wzevKsgum6EPqlwzuAjn0TCVg62AcMaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=At5B5lIW3M5iokSU9FJ/aNt/297IT0/V3mLWYwAc3P44Pv2hItVFcGqeeVA0tVSc/Zi1OFs1YEk+b/8yQAJRODM0PNgvK6PgP9tk5ujrNEmT2Dkta00lIvkoCBLTRKUMXOkBUrClfIyPDDBdGlKBJj9WrEdhjVr2J7+P1e6pICPrVwK211xfFe/viqOz8y6CEJFaJ9lxUIktOYH7aSdR0EEqi6Vw0tVKFekEdlaFzbViKlyvJwYHTwGCsCBhDzMXUKtifmu30ONJ+ZRiNYAPAvurLaeyrYD/1b0R5jVuwbI8U8XcgeOxu4nLxHx3ifHb6hlF9n8N+wiQ3cWJig3Qmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de; dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=ZxTobW4P; dkim-atps=neutral; spf=pass (client-ip=2001:638:a000:1025::14; helo=mx-rz-1.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org) smtp.mailfrom=fau.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=ZxTobW4P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fau.de (client-ip=2001:638:a000:1025::14; helo=mx-rz-1.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org)
Received: from mx-rz-1.rrze.uni-erlangen.de (mx-rz-1.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBkCN2LXtz2yQJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 07:20:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1748985645; bh=aLkGL0PRMc+wzevKsgum6EPqlwzuAjn0TCVg62AcMaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From:To:CC:
	 Subject;
	b=ZxTobW4PE3pM/tpTf8BNM3K8XxSmHxvkMXDoj4HnsgnDr/ZjCdBfbWjm5kXjFrfpb
	 pLw0T6rthXXulNltdG3KRYrPicTsTJ0igkLqasWFt9iYyCW6awL2K77vBdO2+Y9ZoS
	 Aw5uSovDn/6lqObO171M5TPSNe3fSQmeOvlsOvFw4zAwkXhWR4MTLTf07cpeEdUIDT
	 m7uRwKk2rZRbOW0I6Rveb5kpvyD/VfnSyw74lWWYT09lFN+7gmTp9W+B1lFx3yZrAx
	 BgfJR4w9xf6Lfxz2LMvcnAfycFPncdvY+yZLXtLw5kiEuQMw6QXUk3sB2bDxQc+id/
	 Yqt1Q0K+GUW8Q==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4bBkCK0kxtz8sqC;
	Tue,  3 Jun 2025 23:20:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck2.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3639:fe00:a21f:4ce4:8495:5578
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:3639:fe00:a21f:4ce4:8495:5578])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX1+uyXrtNenjCYPjNclS8sO6XydtJohY3+E=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4bBkCF2WYTz8ssj;
	Tue,  3 Jun 2025 23:20:41 +0200 (CEST)
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
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Maximilian Ott <ott@cs.fau.de>,
	Milan Stephan <milan.stephan@fau.de>
Subject: [PATCH bpf-next v4 6/9] bpf: Rename sanitize_stack_spill to nospec_result
Date: Tue,  3 Jun 2025 23:20:24 +0200
Message-ID: <20250603212024.338154-1-luis.gerhorst@fau.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603205800.334980-1-luis.gerhorst@fau.de>
References: <20250603205800.334980-1-luis.gerhorst@fau.de>
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
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is made to clarify that this flag will cause a nospec to be added
after this insn and can therefore be relied upon to reduce speculative
path analysis.

Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Henriette Herzog <henriette.herzog@rub.de>
Cc: Maximilian Ott <ott@cs.fau.de>
Cc: Milan Stephan <milan.stephan@fau.de>
---
 include/linux/bpf_verifier.h | 2 +-
 kernel/bpf/verifier.c        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index 256274acb1d8..2b0954202226 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -580,7 +580,7 @@ struct bpf_insn_aux_data {
 	u64 map_key_state; /* constant (32 bit) key tracking for maps */
 	int ctx_field_size; /* the ctx field size for load insn, maybe 0 */
 	u32 seen; /* this insn was processed by the verifier at env->pass_cnt */
-	bool sanitize_stack_spill; /* subject to Spectre v4 sanitation */
+	bool nospec_result; /* result is unsafe under speculation, nospec must follow */
 	bool zext_dst; /* this insn zero extends dst reg */
 	bool needs_zext; /* alu op needs to clear upper bits */
 	bool storage_get_func_atomic; /* bpf_*_storage_get() with atomic memory alloc */
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 46cf737acad5..af79f4d7692f 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -5026,7 +5026,7 @@ static int check_stack_write_fixed_off(struct bpf_verifier_env *env,
 		}
 
 		if (sanitize)
-			env->insn_aux_data[insn_idx].sanitize_stack_spill = true;
+			env->insn_aux_data[insn_idx].nospec_result = true;
 	}
 
 	err = destroy_if_dynptr_stack_slot(env, state, spi);
@@ -20921,7 +20921,7 @@ static int convert_ctx_accesses(struct bpf_verifier_env *env)
 		}
 
 		if (type == BPF_WRITE &&
-		    env->insn_aux_data[i + delta].sanitize_stack_spill) {
+		    env->insn_aux_data[i + delta].nospec_result) {
 			struct bpf_insn patch[] = {
 				*insn,
 				BPF_ST_NOSPEC(),
-- 
2.49.0


